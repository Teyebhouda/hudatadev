<template>
  <header
    :class="[
      'shadow-md fixed top-0 left-0 right-0 z-50 transition-shadow duration-300',
      
         isScrolled ? 'bg-white shadow-lg' : 'bg-transparent shadow-md'
    ]"
    :style="{ height: isScrolled ? '60px' : '80px' }"
  >
    <div class="container mx-auto flex justify-between items-center px-4 md:px-16 h-full">
      <!-- Logo -->

      <div class="flex-shrink-0">
        <img
          :src="$page.props.settings?.logo"
          alt="logo_fsd_batiment"
          :style="{ height: isScrolled ? '50px' : '65px', width: 'auto' }"
        />
      </div>

      <!-- Hamburger mobile -->
      <div class="md:hidden">
        <button @click="toggleMenu" class="text-gray-800 text-3xl focus:outline-none">☰</button>
      </div>

      <!-- Desktop navigation -->
      <nav :class="['hidden md:flex gap-6 items-center', isScrolled ? 'text-black' : 'text-white']">

        <a href="/" >Accueil</a>

        <!-- Services dropdown -->
        <div class="relative group">
          <button
            class="flex items-center gap-1  focus:outline-none"
          >
            Services
            <svg
              class="w-4 h-4 transition-transform transform group-hover:rotate-180"
              fill="none"
              stroke="currentColor"
              viewBox="0 0 24 24"
            >
              <path d="M19 9l-7 7-7-7" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" />
            </svg>
          </button>

          <!-- Dropdown menu -->
          <div
            class="absolute left-0 mt-2 w-56 bg-white shadow-lg rounded-md opacity-0 group-hover:opacity-100 group-hover:visible invisible transition-all duration-200 z-50"
          >
            <a
              v-for="(service, index) in services"
              :key="index"
              :href="`/services/${slugify(service.title)}`"
              class="block px-4 py-2 hover:bg-gray-100 text-gray-800"
            >
              {{ service.title }}
            </a>
          </div>
        </div>

        <a href="#contact-form" >Contact</a>
        <a
          href="#contact-form"
          class="bg-blue-600 text-white px-4 py-2 rounded-lg"
          :style="{ backgroundColor: 'rgb(27, 43, 80)' }"
        >
          VOTRE DEVIS
        </a>
      </nav>
    </div>

    <!-- Mobile menu -->
    <div
      v-if="isMenuOpen"
      class="md:hidden bg-white shadow-md border-t border-gray-200 px-4 pt-4 pb-6 flex flex-col gap-4"
    >
      <a href="/" >Accueil</a>

      <!-- Services mobile dropdown toggle -->
      <div>
        <button
          @click="toggleMobileServices"
          class="flex justify-between items-center w-full text-left hover:text-blue-600"
        >
          <span>Services</span>
          <svg
            :class="['w-4 h-4 transition-transform', { 'rotate-180': isMobileServicesOpen }]"
            fill="none"
            stroke="currentColor"
            viewBox="0 0 24 24"
          >
            <path d="M19 9l-7 7-7-7" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" />
          </svg>
        </button>

        <!-- Sous-menu mobile -->
        <div v-if="isMobileServicesOpen" class="ml-4 mt-2 flex flex-col gap-2">
          <a
            v-for="(service, index) in services"
            :key="index"
            :href="`/services/${slugify(service.title)}`"
            class="text-gray-600 hover:text-blue-600 text-sm"
          >
            {{ service.title }}
          </a>
        </div>
      </div>

      <a href="#contact-form" >Contact</a>
      <a
        href="#contact-form"
        class="bg-blue-600 text-white px-4 py-2 rounded-lg text-center"
        :style="{ backgroundColor: 'rgb(27, 43, 80)' }"
      >
        Demander un devis
      </a>
    </div>
  </header>
</template>

<script setup>
import { ref, onMounted, onUnmounted } from 'vue'

// Props
const props = defineProps({
  services: Array,
  settings: Object 
})

// State
const isScrolled = ref(false)
const isMenuOpen = ref(false)
const isMobileServicesOpen = ref(false)

// Functions
const handleScroll = () => {
  isScrolled.value = window.scrollY > 50
}
const toggleMenu = () => {
  isMenuOpen.value = !isMenuOpen.value
}
const toggleMobileServices = () => {
  isMobileServicesOpen.value = !isMobileServicesOpen.value
}

// Slugify utility
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

// Scroll listener
onMounted(() => window.addEventListener('scroll', handleScroll))
onUnmounted(() => window.removeEventListener('scroll', handleScroll))
</script>
