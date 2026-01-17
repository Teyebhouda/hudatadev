<template>
  <header
    :class="[
      'fixed top-0 left-0 w-full z-50 transition-all duration-500 ease-in-out',
      isHidden ? '-translate-y-full opacity-0' : 'translate-y-0 opacity-100'
    ]"
  >
    <!-- Barre supérieure noire -->
    <div class="bg-[#3f5360] text-white text-sm md:text-base">
      <div class="max-w-screen-xl mx-auto px-6 py-2 flex justify-between items-center">
        <!-- Coordonnées -->
        <div class="flex items-center gap-6">
          
          <div class="flex items-center gap-2">
            <a
    href="tel:+33766212207"
   aria-label="Appeler Hudata Dev"
  >
            <i class="fas fa-phone-alt"></i>
            <span>+33 7 66 21 22 07</span>
            </a>
          </div>
          <!-- Addresse France -->
          <div class="flex items-center gap-2">
            <a  href="https://goo.gl/maps/XYZ" target="_blank" rel="noopener" aria-label="Voir l'adresse de Hudata Dev sur Google Maps">
            <i class="fas fa-map-marker-alt"></i>
            <span>Paris, France</span>
            </a>
          </div>
          <!-- Email -->
          <div class="flex items-center gap-2">
             <a
    href="mailto:contact@hudata-dev.fr"
   aria-label="Envoyer un email à Hudata Dev"
  >
            <i class="fas fa-envelope"></i>
            <span>contact@hudata-dev.fr</span>
            </a>
          </div>
        </div>

        <!-- Réseaux sociaux -->
        <div class="flex items-center gap-4">
          <a href="#" class="hover:text-blue-400 transition"><i class="fab fa-linkedin-in"></i></a>
          <a href="https://www.facebook.com/profile.php?id=61586022465451" class="hover:text-blue-400 transition"><i class="fab fa-facebook-f"></i></a>
          <a href="https://www.instagram.com/hudata_dev/" class="hover:text-blue-400 transition"><i class="fab fa-instagram"></i></a>
        </div>
      </div>
    </div>

    <!-- Menu principal -->
    <div class="max-w-screen-xl mx-auto px-6 py-4 flex items-center justify-between bg-white/0 backdrop-blur-md">
      <!-- Logo -->
      <div class="flex-shrink-0">
        <img
          :src="$page.props.settings?.logo"
          alt="Hudata-Dev Logo"
          class="h-20 md:h-24 object-contain"
        />
      </div>

      <!-- Desktop Menu -->
      <nav class="hidden md:flex items-center gap-8 font-medium text-black">
        <a href="/" class="hover:text-blue-400 transition">Accueil</a>
        <a href="#services-section" class="hover:text-blue-400 transition">Services</a>
        <a href="#projects-section" class="hover:text-blue-400 transition">Projets</a>
        <a href="#about-stats" class="hover:text-blue-400 transition">À propos</a>
        <a href="#contact-form" class="hover:text-blue-400 transition">Contact</a>
      </nav>

      <!-- Mobile Hamburger -->
      <div class="md:hidden">
        <button @click="toggleMenu" class="text-black text-3xl" aria-label="Toggle menu">
          <i :class="isMenuOpen ? 'fas fa-times' : 'fas fa-bars'"></i>
        </button>
      </div>
    </div>

    <!-- Mobile Menu -->
    <transition name="slide-fade">
      <nav
        v-if="isMenuOpen"
        class="md:hidden bg-white/90 backdrop-blur-md shadow-lg px-6 py-6 flex flex-col gap-4 font-medium text-black"
      >
        <a href="/" @click="closeMenu" class="hover:text-blue-400 transition">Accueil</a>
        <a href="#services-section" @click="closeMenu" class="hover:text-blue-400 transition">Services</a>
        <a href="#projects-section" @click="closeMenu" class="hover:text-blue-400 transition">Projets</a>
        <a href="#about-stats" @click="closeMenu" class="hover:text-blue-400 transition">À propos</a>
        <a href="#contact-form" @click="closeMenu" class="hover:text-blue-400 transition">Contact</a>
        <!-- Coordonnées pour mobile -->
        <div class="flex flex-col gap-2 mt-4 text-sm text-gray-700">
          <div class="flex items-center gap-2"><i class="fas fa-phone-alt"></i> +33 6 12 34 56 78</div>
          <div class="flex items-center gap-2"><i class="fas fa-envelope"></i> contact@hudata-dev.com</div>
          <div class="flex items-center gap-4 mt-2">
            <a href="#"><i class="fab fa-linkedin-in"></i></a>
            <a href="#"><i class="fab fa-github"></i></a>
            <a href="#"><i class="fab fa-twitter"></i></a>
          </div>
        </div>
      </nav>
    </transition>
  </header>
</template>

<script setup>
import { ref, onMounted, onBeforeUnmount } from "vue";

const isMenuOpen = ref(false);
const isHidden = ref(false);
let lastScrollY = 0;
const showTopBar = ref(false);

const toggleMenu = () => { isMenuOpen.value = !isMenuOpen.value; };
const closeMenu = () => { isMenuOpen.value = false; };

const handleScroll = () => {
  const currentScrollY = window.scrollY;
  isHidden.value = currentScrollY > lastScrollY && currentScrollY > 100;
  lastScrollY = currentScrollY;
};

onMounted(() => window.addEventListener("scroll", handleScroll));
onBeforeUnmount(() => window.removeEventListener("scroll", handleScroll));
</script>

<style scoped>
header { will-change: transform, opacity; }

.slide-fade-enter-active,
.slide-fade-leave-active { transition: all 0.3s ease; }
.slide-fade-enter-from,
.slide-fade-leave-to { transform: translateY(-10px); opacity: 0; }
</style>
