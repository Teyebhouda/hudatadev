<template>
  <header
    :class="[
      'fixed md:sticky top-0 left-0 w-full z-50 transition-transform duration-300 ease-out',
      isHidden ? '-translate-y-full' : 'translate-y-0'
    ]"
  >
    <!-- TOP BAR – Desktop only -->
    <div class="hidden md:block bg-[#3f5360] text-white text-sm">
      <div class="max-w-screen-xl mx-auto px-6 py-2 flex justify-between items-center">
        <div class="flex items-center gap-6">
          <a href="tel:+33766212207" class="flex items-center gap-2 hover:text-blue-300">
            <i class="fas fa-phone-alt"></i>
            <span>+33 7 66 21 22 07</span>
          </a>
          <a href="#" class="flex items-center gap-2 hover:text-blue-300">
            <i class="fas fa-map-marker-alt"></i>
            <span>Paris, France</span>
          </a>
          <a href="mailto:contact@hudata-dev.fr" class="flex items-center gap-2 hover:text-blue-300">
            <i class="fas fa-envelope"></i>
            <span>contact@hudata-dev.fr</span>
          </a>
        </div>

        <div class="flex items-center gap-4">
          <a href="#" class="hover:text-blue-300"><i class="fab fa-linkedin-in"></i></a>
          <a href="#" class="hover:text-blue-300"><i class="fab fa-facebook-f"></i></a>
          <a href="#" class="hover:text-blue-300"><i class="fab fa-instagram"></i></a>
        </div>
      </div>
    </div>

    <!-- MAIN NAV -->
    <div
      class="h-16 md:h-auto bg-white/90 md:bg-white/0 backdrop-blur-md shadow-sm md:shadow-none"
    >
      <div class="max-w-screen-xl mx-auto px-6 h-full flex items-center justify-between">
        <!-- Logo -->
        <a href="/" class="flex items-center">
          <img
            :src="$page.props.settings?.logo"
            alt="Hudata Dev"
            class="h-16 md:h-24 object-contain"
          />
        </a>

        <!-- Desktop Menu -->
        <nav class="hidden md:flex items-center gap-8 font-medium text-black">
          <a href="/" class="hover:text-blue-500">Accueil</a>
          <a v-if="isHome" href="#services-section" class="hover:text-blue-500">Services</a>
          <a v-if="isHome" href="#projects-section" class="hover:text-blue-500">Projets</a>
          <a v-if="isHome" href="#about-stats" class="hover:text-blue-500">À propos</a>
          <a href="#contact-form" class="hover:text-blue-500">Contact</a>
        </nav>

        <!-- Burger -->
        <button
          @click="toggleMenu"
          class="md:hidden text-3xl text-black focus:outline-none"
          aria-label="Menu"
        >
          <i :class="isMenuOpen ? 'fas fa-times' : 'fas fa-bars'"></i>
        </button>
      </div>
    </div>

    <!-- MOBILE MENU -->
    <transition name="slide-fade">
      <nav
        v-if="isMenuOpen"
        class="md:hidden bg-white/95 backdrop-blur-lg shadow-lg px-6 py-8 flex flex-col gap-6 font-medium text-black"
      >
        <a href="/" @click="closeMenu">Accueil</a>
        <a v-if="isHome" href="#services-section" @click="closeMenu">Services</a>
        <a v-if="isHome" href="#projects-section" @click="closeMenu">Projets</a>
        <a v-if="isHome" href="#about-stats" @click="closeMenu">À propos</a>
        <a href="#contact-form" @click="closeMenu">Contact</a>

        <div class="pt-6 border-t text-sm text-gray-600 space-y-2">
          <div class="flex items-center gap-2"><i class="fas fa-phone-alt"></i> +33 7 66 21 22 07</div>
          <div class="flex items-center gap-2"><i class="fas fa-envelope"></i> contact@hudata-dev.fr</div>
        </div>
      </nav>
    </transition>
  </header>
</template>


<script setup>
import { ref, onMounted, onBeforeUnmount, watch } from 'vue'

const isMenuOpen = ref(false)
const isHidden = ref(false)
const isHome = window.location.pathname === '/'

let lastScrollY = 0

const toggleMenu = () => (isMenuOpen.value = !isMenuOpen.value)
const closeMenu = () => (isMenuOpen.value = false)

const handleScroll = () => {
  if (window.innerWidth < 768) {
    const current = window.scrollY
    isHidden.value = current > lastScrollY && current > 80
    lastScrollY = current
  } else {
    isHidden.value = false
  }
}

onMounted(() => window.addEventListener('scroll', handleScroll))
onBeforeUnmount(() => window.removeEventListener('scroll', handleScroll))

watch(isHidden, hidden => hidden && (isMenuOpen.value = false))
watch(isMenuOpen, open => {
  document.body.style.overflow = open ? 'hidden' : ''
})

</script>

<style scoped>
header { will-change: transform, opacity; }

.slide-fade-enter-active,
.slide-fade-leave-active {
  transition: all 0.3s ease;
}
.slide-fade-enter-from,
.slide-fade-leave-to {
  transform: translateY(-10px);
  opacity: 0;
}

</style>
