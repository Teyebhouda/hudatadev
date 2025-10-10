<template>
  <header class="sticky top-0 z-50 w-full">
    <!-- ✅ Topbar (hidden on mobile) -->
    <div
      class="topbar hidden md:block fixed top-0 left-0 w-full bg-white/80 backdrop-blur-md border-b border-gray-200 z-50 transition-all duration-300"
      :class="[isCompact ? 'py-2 h-18' : 'py-4 h-24']"
    >
      <div class="container mx-auto px-4 flex flex-col md:flex-row items-center justify-between gap-3 text-sm md:text-base">
        <!-- Logo -->
        <div class="flex items-center gap-3">
          <img
            :src="$page.props.settings?.logo"
            alt="Logo"
            class="object-contain drop-shadow-sm transition-all duration-300"
            :class="isCompact ? 'h-10' : 'h-16'"
          />
        </div>

        <!-- Contact Info (desktop only) -->
        <div class="hidden md:flex flex-wrap gap-6 justify-end text-gray-600 text-xs md:text-sm">
          <div class="flex items-center gap-2">
            <i class="fas fa-envelope text-primary"></i>
            <a :href="`mailto:${$page.props.settings?.email}`" class="hover:text-primary font-medium">
              {{ $page.props.settings?.email }}
            </a>
          </div>
          <div class="flex items-center gap-2">
            <i class="fas fa-phone text-primary"></i>
            <a :href="`tel:${$page.props.settings?.phone}`" class="hover:text-primary font-medium">
              {{ $page.props.settings?.phone }}
            </a>
          </div>
          <div class="flex items-center gap-2">
            <i class="fas fa-map-marker-alt text-primary"></i>
            <span class="font-medium">{{ $page.props.settings?.adress }}</span>
          </div>
        </div>
      </div>
    </div>

    <!-- ✅ Navbar -->
    <nav
      class="navbar fixed w-full bg-white/80 backdrop-blur-md border-b border-gray-200 shadow-sm z-40 transition-transform duration-300"
      :class="[
        isHidden ? '-translate-y-full' : 'translate-y-0',
        isCompact ? 'md:top-14 top-0' : 'md:top-24 top-0'
      ]"
    >
      <div
        class="container mx-auto px-4 py-5 md:py-3 flex flex-col gap-3 md:flex-row md:items-center md:justify-between"
      >
        <!-- Mobile: Logo + Hamburger -->
        <div class="flex w-full items-center justify-between md:hidden">
          <img
            :src="$page.props.settings?.logo"
            alt="Logo"
            class="h-14 object-contain"  
          />
          <button
            @click="toggleMenu"
            class="text-primary text-4xl" 
            aria-label="Toggle menu"
          >
            <i :class="isMenuOpen ? 'fas fa-times' : 'fas fa-bars'"></i>
          </button>
        </div>

        <!-- Desktop Menu -->
        <div class="hidden md:flex items-center gap-8 font-semibold text-gray-700 tracking-wide">
          <a href="/" class="hover:text-primary transition">Accueil</a>
          <a href="#services-section" class="hover:text-primary transition">Services</a>
          <Dropdown :items="projects" title="Projets" :slugify="slugify" />
          <a :href="`/contact`" class="hover:text-primary transition">Contact</a>
          <a href="#parallax-stats" class="hover:text-primary transition">À propos</a>
        </div>

        <!-- CTA Button -->
        <div class="w-full md:w-auto">
          <a
            href="/"
            @click.prevent="scrollToContact"
            class="block w-full text-center bg-gradient-to-r from-blue-800 to-blue-900 text-white py-3 rounded-xl font-semibold shadow-lg hover:from-blue-700 hover:to-blue-900 transition-all duration-300 md:inline-block md:py-2.5 md:px-6 md:rounded-full"
          >
            Collaborer avec nous
          </a>
        </div>
      </div>

      <!-- ✅ Mobile Menu Dropdown -->
      <transition name="slide-fade">
        <div
          v-if="isMenuOpen"
          class="md:hidden bg-white/95 backdrop-blur-md shadow-lg px-6 py-6 flex flex-col gap-4 font-semibold text-gray-700"
        >
          <a href="/" class="hover:text-primary transition">Accueil</a>
          <a href="#services-section" class="hover:text-primary transition">Services</a>
          <MobileDropdown :items="projects" title="Projets" :slugify="slugify" />
          <a :href="`/contact`" class="hover:text-primary transition">Contact</a>
          <a href="#parallax-stats" class="hover:text-primary transition">À propos</a>
        </div>
      </transition>
    </nav>
  </header>
</template>

<script setup>
import { Inertia } from '@inertiajs/inertia'
import Dropdown from './Dropdown.vue'
import MobileDropdown from './MobileDropdown.vue'
import { useScrollHide } from '@/useScrollHide'
import { ref, onMounted, onUnmounted } from 'vue'

const props = defineProps({
  services: Array,
  projects: Array,
})

const scrollToContact = () => {
  if (window.location.pathname !== '/') {
    Inertia.visit('/', {
      onSuccess: () => {
        const el = document.getElementById('contact-form')
        if (el) el.scrollIntoView({ behavior: 'smooth' })
      }
    })
  } else {
    const el = document.getElementById('contact-form')
    if (el) el.scrollIntoView({ behavior: 'smooth' })
  }
}

const isMenuOpen = ref(false)
const toggleMenu = () => (isMenuOpen.value = !isMenuOpen.value)

const { isHidden } = useScrollHide()
const isCompact = ref(false)

const handleScroll = () => {
  isCompact.value = window.scrollY > 40
}

onMounted(() => window.addEventListener('scroll', handleScroll))
onUnmounted(() => window.removeEventListener('scroll', handleScroll))

const slugify = (text) =>
  text
    .toString()
    .normalize('NFD')
    .replace(/[\u0300-\u036f]/g, '')
    .toLowerCase()
    .replace(/\s+/g, '-')
    .replace(/[^\w-]+/g, '')
    .replace(/--+/g, '-')
    .replace(/^-+|-+$/g, '')
</script>

<style scoped>
.navbar {
  transition: height 0.3s ease;
}

.slide-fade-enter-active,
.slide-fade-leave-active {
  transition: all 0.3s ease;
}
.slide-fade-enter-from,
.slide-fade-leave-to {
  transform: translateY(-10px);
  opacity: 0;
}

.text-primary {
  color: #1363ab;
}

.topbar {
  transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
}
</style>
