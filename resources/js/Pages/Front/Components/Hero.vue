<template>
  <section class="hero relative w-full h-[70vh] md:h-[100vh] overflow-visible pt-20">

    <!-- 🎞️ Swiper Hero Slider -->
    <Swiper
      :modules="[Autoplay, Pagination, EffectFade]"
      :slides-per-view="1"
      :loop="true"
      :autoplay="{ delay: 5000, disableOnInteraction: false }"
      :pagination="{ clickable: true, el: '.custom-pagination' }"
      effect="fade"
      :fadeEffect="{ crossFade: true }"
      speed="1200"
      class="w-full h-full"
    >
      <SwiperSlide
        v-for="(slide, i) in slides"
        :key="i"
        class="relative w-full h-full"
      >
        <div class="hero-bg" :style="{ backgroundImage: `url('${slide.background_image}')` }"></div>
        <div class="hero-overlay-gradient"></div>
        <div class="relative z-20 flex items-center h-full px-4 md:px-20">
          <div :class="['w-full', isMobile ? 'text-center' : 'text-left', 'max-w-full md:max-w-2xl', isMobile ? 'mx-auto' : 'ml-16']">
            <h2 class="text-2xl sm:text-3xl md:text-5xl font-extrabold mb-3 text-white glow-text leading-tight">
              {{ displayedText }}
            </h2>
            <h1 class="text-xl sm:text-2xl md:text-4xl hero-title animate-fadeInUp leading-snug">
              {{ slide.title }}
            </h1>
            <p class="text-sm sm:text-base md:text-lg hero-subtitle animate-fadeInDelay leading-relaxed">
              {{ slide.subtitle }}
            </p>
            <a
              v-if="slide.button_text"
              href="#contact-form"
              class="btn-glass hero-btn animate-fadeInDelay2 mt-4 inline-block text-center text-sm sm:text-base"
            >
              {{ slide.button_text }}
            </a>
          </div>
        </div>
      </SwiperSlide>

      <div class="custom-pagination absolute bottom-8 left-1/2 -translate-x-1/2 z-30 flex space-x-3"></div>
    </Swiper>

   <!-- 💡 Services Cards Section -->
<div class="relative z-40 -mt-10 md:-mt-16 px-4 md:px-16">
  <div class="services-wrapper bg-white/80 backdrop-blur-sm rounded-xl shadow-md py-4 px-3 md:px-10">

  <!-- 📱 Mobile Swiper -->
<div class="block md:hidden">
  <Swiper
    :modules="[Pagination]"
    :slides-per-view="2.3"
    :space-between="12"
    :pagination="{ clickable: true }"
    class="!pb-6"
    :breakpoints="{
      320: { slidesPerView: 1.4 },
      480: { slidesPerView: 2.1 },
      640: { slidesPerView: 2.3 }
    }"
  >
    <SwiperSlide v-for="(service, i) in services" :key="i">
      <div
        class="service-card-mobile group p-3 bg-white border border-gray-100 rounded-xl shadow-sm hover:shadow-md transition-all duration-300 flex flex-col items-center justify-center text-center cursor-pointer"
        @click="scrollToService(service.id)"
      >
        <component
          :is="icons[i % icons.length]"
          class="h-6 w-6 text-primary mb-2 group-hover:scale-110 transform transition duration-300"
        />
        <h3 class="text-xs font-semibold text-gray-700 group-hover:text-primary">
          {{ service.title }}
        </h3>
      </div>
    </SwiperSlide>
  </Swiper>
</div>


   <!-- 🖥️ Desktop Grid -->
<div class="hidden md:grid grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 2xl:grid-cols-5 gap-4 lg:gap-6">
  <div
    v-for="(service, i) in services"
    :key="i"
    class="service-card group p-4 bg-white border border-gray-100 rounded-xl shadow-sm hover:shadow-md transition-all duration-300 text-center cursor-pointer flex flex-col items-center justify-center"
    @click="scrollToService(service.id)"
  >
    <component
      :is="icons[i % icons.length]"
      class="h-8 w-8 text-primary mb-2 group-hover:scale-110 transition-transform duration-300"
    />
    <h3 class="text-sm font-semibold text-gray-700 group-hover:text-primary">
      {{ service.title }}
    </h3>
  </div>
</div>


  </div>
</div>

  </section>
</template>


<script setup>
import { ref, onMounted } from 'vue'
import { Swiper, SwiperSlide } from 'swiper/vue'
import { Autoplay, Pagination, EffectFade } from 'swiper/modules'
import 'swiper/css'
import 'swiper/css/pagination'
import 'swiper/css/effect-fade'

import {
  WrenchIcon,
  BuildingOffice2Icon,
  SparklesIcon,
  ShieldCheckIcon,
  LightBulbIcon,
  ClipboardDocumentListIcon,
} from '@heroicons/vue/24/outline'

// Icônes en boucle (adaptées à tes services)
const icons = [
  WrenchIcon,
  BuildingOffice2Icon,
  SparklesIcon,
  ShieldCheckIcon,
  LightBulbIcon,
  ClipboardDocumentListIcon,
]

const props = defineProps({
  content: { type: Object, default: () => ({ slides: [] }) },
  services: { type: Array, default: () => [] },
})

const slides = props.content.slides || []
const services = props.services || []

const emit = defineEmits(['selectService'])
const scrollToService = (serviceId) => {
  emit('selectService', serviceId)
  const section = document.getElementById('services-section')
  if (section) section.scrollIntoView({ behavior: 'smooth' })
}

// Machine à écrire
const companyName = 'FSD BÂTIMENT'
const displayedText = ref('')
let index = 0
const typeWriter = () => {
  if (index < companyName.length) {
    displayedText.value += companyName.charAt(index)
    index++
    setTimeout(typeWriter, 120)
  }
}
onMounted(() => typeWriter())

// Détection mobile
const isMobile = ref(false)
onMounted(() => {
  isMobile.value = window.innerWidth < 768
  window.addEventListener('resize', () => {
    isMobile.value = window.innerWidth < 768
  })
})
</script>


<style scoped>
/* ===== Hero Background Parallax ===== */
.hero-bg {
  transform: scale(1.2) translateY(-10%);
  transition: transform 6s ease-out;
  background-size: cover;
  background-position: center;
  animation: heroParallax 20s ease-in-out infinite alternate;
}
.swiper-slide-active .hero-bg {
  transform: scale(1) translateY(0);
}
@keyframes heroParallax {
  from {
    transform: scale(1.2) translateY(-5%);
  }
  to {
    transform: scale(1.25) translateY(5%);
  }
}

/* ===== Overlay ===== */
.hero-overlay-gradient {
  position: absolute;
  inset: 0;
  background: linear-gradient(to right, rgba(0, 0, 0, 0.6), rgba(0, 0, 0, 0.3));
}

/* ===== Typing Glow ===== */
.glow-text {
  color: #fff;
  text-shadow: 0 0 8px rgba(27, 43, 80, 0.6), 0 0 16px rgba(255, 183, 3, 0.6);
  opacity: 0;
  animation: fadeInGlow 2s ease forwards;
}
@keyframes fadeInGlow {
  0% {
    opacity: 0;
    filter: blur(10px);
    letter-spacing: 8px;
  }
  100% {
    opacity: 1;
    filter: blur(0);
    letter-spacing: normal;
  }
}

/* ===== Hero Title ===== */
.hero-title {
  font-weight: 800;
  margin-bottom: 1rem;
  opacity: 0;
  background: linear-gradient(90deg, #ff8800, #ffb703, #ffffff);
  background-size: 300% 300%;
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  animation: gradientShift 6s infinite, fadeInUp 1s forwards;
}
@keyframes gradientShift {
  0% {
    background-position: 0% 50%;
  }
  50% {
    background-position: 100% 50%;
  }
  100% {
    background-position: 0% 50%;
  }
}

/* ===== Subtitle ===== */
.hero-subtitle {
  color: #e5e7eb;
  margin-bottom: 1.5rem;
  opacity: 0;
  animation: fadeInUp 1.2s ease forwards;
  animation-delay: 0.4s;
}

/* ===== Glass Button ===== */
.btn-glass {
  padding: 0.75rem 1.5rem;
  border-radius: 1rem;
  font-weight: 600;
  background: rgba(255, 255, 255, 0.15);
  backdrop-filter: blur(12px);
  border: 1px solid rgba(255, 255, 255, 0.25);
  color: #fff;
  transition: all 0.3s;
}
.btn-glass:hover {
  background: rgba(255, 255, 255, 0.25);
}

/* ===== Pagination ===== */
.custom-pagination .swiper-pagination-bullet {
  width: 12px;
  height: 12px;
  background: white;
  opacity: 0.6;
  border-radius: 50%;
  transition: all 0.3s;
}
.custom-pagination .swiper-pagination-bullet-active {
  transform: scale(1.3);
  opacity: 1;
  background: #ffb703;
}

/* ===== Fade Animations ===== */
@keyframes fadeInUp {
  from {
    opacity: 0;
    transform: translateY(20px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}
.animate-fadeInUp { animation: fadeInUp 0.6s ease forwards; }

/* ===== Services Cards ===== */
@keyframes fadeInUpCard { from { opacity:0; transform: translateY(20px); } to { opacity:1; transform: translateY(0); } }
.animate-fadeInUpCard { opacity:0; transform:translateY(20px); animation: fadeInUpCard 0.6s ease forwards; }

/* ===== Icon Glow ===== */
@keyframes iconGlow { 0%{filter:drop-shadow(0 0 0px rgba(255,183,3,0.5));}50%{filter:drop-shadow(0 0 8px rgba(255,183,3,0.8));}100%{filter:drop-shadow(0 0 0px rgba(255,183,3,0.5));} }
.group-hover\:animate-iconGlow:hover { animation: iconGlow 0.8s infinite alternate; }

/* ===== Scrollbar hide ===== */
.scrollbar-hide { scrollbar-width: none; -ms-overflow-style: none; }
.scrollbar-hide::-webkit-scrollbar { display:none; }

/* ===== Mobile adjustments ===== */
@media (max-width: 768px) {
  .grid { grid-template-columns: repeat(2,1fr); gap:16px; }
  .rounded-xl { border-radius:1rem; }
  .p-3 { padding:0.75rem; }
  .w-10, .h-10 { width:2.5rem !important; height:2.5rem !important; }
  .text-xs { font-size:0.85rem; }
 }

.scrollbar-hide {
  display: none;
}
.service-card {
  transition: all 0.3s ease;
}
@media (max-width: 768px) {
  .service-card {
    padding: 0.75rem 0.5rem;
    border-radius: 0.75rem;
    border: 1px solid #f0f0f0;
    background-color: #fff;
  }

  .service-card h3 {
    font-size: 0.8rem;
    line-height: 1.1rem;
  }

  .service-card svg {
    width: 1.5rem;
    height: 1.5rem;
  }

  .services-wrapper {
    padding: 1rem 0.75rem;
  }
}
/* ===== Mobile Card Service ===== */
.service-card-mobile {
  min-width: 120px;
  max-width: 140px;
}
@media (max-width: 768px) {
  .service-card-mobile {
    min-width: 120px;
    max-width: 140px;
    padding: 1rem;
    border-radius: 1rem;
  }
  .service-card-mobile h3 {
    font-size: 0.75rem;
    line-height: 1rem;
  }
}




</style>
