<template>
  <section class="relative w-full h-[100vh] overflow-hidden">
    <Swiper
      :modules="[Autoplay, Pagination, EffectFade]"
      :slides-per-view="1"
      :loop="true"
      :autoplay="{ delay: 5000, disableOnInteraction: false }"
      :pagination="{ clickable: true }"
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
        <!-- ✅ Image de fond -->
        <div
          class="absolute inset-0 w-full h-full z-0 animate-zoom-bg"
          :style="{
            backgroundImage: `url('${slide.background_image}')`,
            backgroundSize: 'cover',
            backgroundPosition: 'center',
            filter: 'brightness(0.65) blur(1px)',
            transition: 'opacity 1.2s ease-in-out'   
          }"
        ></div>

        <!-- ✅ Overlay dégradé -->
        <div class="absolute inset-0 bg-gradient-to-b from-black/60 via-black/40 to-black/10 z-10"></div>

        <!-- ✅ Contenu -->
        <div class="relative z-20 flex items-center justify-center h-full px-4 text-center">
          <div class="max-w-3xl mx-auto">
            <h1
              class="text-3xl md:text-5xl font-extrabold text-white drop-shadow-xl mb-6 animate-title font-inter tracking-tight"
            >
              {{ slide.title }}
            </h1>
            <p
              class="text-lg md:text-2xl text-white/90 mb-8 drop-shadow animate-subtitle font-inter tracking-wide"
            >
              {{ slide.subtitle }}
            </p>

            <!-- ✅ Bouton -->
            <a
              v-if="slide.button_text"
              href="#contact-form"
              class="inline-block rounded-full bg-[rgb(136,145,154)] hover:bg-[rgb(110,120,130)] px-8 py-3 font-semibold text-white text-lg shadow-lg transition-transform duration-300 hover:scale-105 focus:outline-none focus:ring-4 focus:ring-[rgba(136,145,154,0.5)] animate-button"
            >
              {{ slide.button_text }}
            </a>
          </div>
        </div>
      </SwiperSlide>

      <!-- ✅ Pagination -->
      <div class="swiper-pagination !bottom-6"></div>
    </Swiper>
  </section>
</template>


<script setup>
import { Swiper, SwiperSlide } from 'swiper/vue'
import { Autoplay, Pagination, EffectFade } from 'swiper/modules'
import 'swiper/css'
import 'swiper/css/pagination'
import 'swiper/css/effect-fade'

const props = defineProps({
  content: {
    type: Object,
    default: () => ({
      slides: [
        {
          title: 'Construisons vos rêves',
          subtitle: 'Votre partenaire en construction et rénovation',
          button_text: 'Demander un devis',
          background_image: '/images/slide1.jpg'
        },
        {
          title: 'Des projets sur mesure',
          subtitle: 'Qualité, sécurité et innovation',
          button_text: 'Nos Services',
          background_image: '/images/slide2.jpg'
        },
        {
          title: 'Un savoir-faire unique',
          subtitle: 'Des années d’expérience au service de vos projets',
          button_text: 'Contactez-nous',
          background_image: '/images/slide3.jpg'
        }
      ]
    })
  }
})

const slides = props.content.slides || []
</script>

<style scoped>
/* ✅ Animations */
@keyframes zoomBg {
  0% {
    transform: scale(1);
  }
  100% {
    transform: scale(1.08);
  }
}
.animate-zoom-bg {
  animation: zoomBg 8s ease-in-out infinite alternate;
  will-change: transform;
}

@keyframes titleIn {
  from {
    opacity: 0;
    transform: translateY(40px) scale(0.98);
    filter: blur(6px);
  }
  to {
    opacity: 1;
    transform: translateY(0) scale(1);
    filter: blur(0);
  }
}
@keyframes subtitleIn {
  from {
    opacity: 0;
    transform: translateY(30px) scale(0.98);
    filter: blur(8px);
  }
  to {
    opacity: 1;
    transform: translateY(0) scale(1);
    filter: blur(0);
  }
}
@keyframes buttonIn {
  from {
    opacity: 0;
    transform: translateY(20px) scale(0.97);
    filter: blur(10px);
  }
  to {
    opacity: 1;
    transform: translateY(0) scale(1);
    filter: blur(0);
  }
}
.animate-title {
  animation: titleIn 1s cubic-bezier(.4, 0, .2, 1) 0.2s both;
}
.animate-subtitle {
  animation: subtitleIn 1s cubic-bezier(.4, 0, .2, 1) 0.6s both;
}
.animate-button {
  animation: buttonIn 1s cubic-bezier(.4, 0, .2, 1) 1s both;
}

/* ✅ Pagination Swiper */
::v-deep .swiper-pagination-bullet {
  background-color: rgba(255, 255, 255, 0.7);
  width: 8px;
  height: 8px;
  opacity: 0.7;
  transition: all 0.3s ease;
}
::v-deep .swiper-pagination-bullet-active {
  background-color: rgb(28, 56, 78);
  width: 12px;
  height: 12px;
  box-shadow: 0 0 8px rgba(28, 56, 78, 0.6);
}
</style>
