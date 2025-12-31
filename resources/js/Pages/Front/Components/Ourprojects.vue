<template>
  <section
    id="projects-section"
    class="relative bg-gradient-to-b from-[#f0f4f8] to-white py-16 px-6 sm:px-10 lg:px-20 overflow-hidden"
  >
    <!-- Background word -->
    <h2 aria-hidden="true" class="hero-bg-word">Projects</h2>

    <!-- Title -->
    <div class="relative max-w-6xl mx-auto text-center mb-16">
      <p class="text-4xl sm:text-5xl lg:text-6xl font-extrabold text-[#3f5360]">
        {{ content.title }}
      </p>

      <div class="mt-4 flex flex-col sm:flex-row items-center justify-center gap-4">
        <div class="h-[2px] w-24 bg-[#c98f60]" />
        <p class="text-lg text-[#5c6670] max-w-2xl">
          {{ content.description }}
        </p>
      </div>
    </div>

    <!-- Swiper -->
 <Swiper
  class="projects-swiper"
  effect="coverflow"
  :modules="modules"
  :grabCursor="true"

  slidesPerView="auto"
  :centeredSlides="true"
  :spaceBetween="64"

  :loop="true"
  :initialSlide="initialIndex"

  :speed="700"

  :coverflowEffect="{
    rotate: 0,
    stretch: 0,
    depth: 220,
    modifier: 1,
    slideShadows: false
  }"

  :pagination="{ clickable: true }"
  @swiper="onSwiper"
>


      <SwiperSlide
        v-for="project in content.items"
        :key="project.id"
        class="project-slide"
      >
        <img
          v-if="project.images?.length"
          :src="`/storage/${project.images[0].path}`"
          :alt="project.title"
          class="slide-image"
        />

        <div class="slide-content">
          <h3 class="slide-title">{{ project.title }}</h3>

          <p class="slide-text">{{ project.description }}</p>

          <p class="slide-text text-sm opacity-90">
            {{ project.long_description }}
          </p>

          <a
            :href="project.link"
            target="_blank"
            class="slide-link"
          >
            Visiter le site →
          </a>
        </div>
      </SwiperSlide>
    </Swiper>
  </section>
</template>


<script setup>
import { Swiper, SwiperSlide } from "swiper/vue"
import { EffectCoverflow, Pagination } from "swiper/modules"
import { ref, nextTick } from "vue"

import "swiper/css"
import "swiper/css/effect-coverflow"
import "swiper/css/pagination"

const props = defineProps({
  content: {
    type: Object,
    required: true
  }
})

const modules = [EffectCoverflow, Pagination]
const swiperInstance = ref(null)

const initialIndex = Math.floor(props.content.items.length / 2)

const onSwiper = async (swiper) => {
  swiperInstance.value = swiper
  await nextTick()

  // 🔥 CENTRAGE RÉEL, PAS DE CLONE
  swiper.slideToLoop(initialIndex, 0, false)
}

</script>




<style>
/* Background word */
.hero-bg-word {
  position: absolute;
  top: 5%;
  left: 50%;
  transform: translateX(-50%);
  font-size: clamp(5rem, 12vw, 9rem);
  font-weight: 800;
  color: rgba(63, 83, 96, 0.05);
  pointer-events: none;
  white-space: nowrap;
}

/* Swiper container */
.projects-swiper {
  max-width: 100%;
  margin: 0 auto;
  padding-bottom: 4rem;
   position: relative;
}
.projects-swiper .swiper-wrapper {
  display: flex;
  align-items: center;
}

/* Pagination container */
.projects-swiper .swiper-pagination {
 position: absolute;
  left: 50% !important;
  transform: translateX(-50%);
  bottom: 12px !important;

  display: flex;
  justify-content: center;
  align-items: center;
  gap: 12px;

  width: auto !important;
}

/* Bullet */
.projects-swiper .swiper-pagination-bullet {
  width: 10px;
  height: 10px;
  background: #cbd5e1;
  opacity: 1;
  transition: all 0.3s ease;
}

.projects-swiper .swiper-pagination-bullet-active {
  width: 24px; /* PAS trop large */
  border-radius: 999px;
  background: linear-gradient(135deg, #c98f60, #b7793e);
}



/* Slide */
.project-slide {
  width: 360px;
  max-width: 90vw;
  background: white;
  border-radius: 1.25rem;
  overflow: hidden;
  box-shadow: 0 15px 35px rgba(0, 0, 0, 0.08);
  transition: transform 0.4s ease, opacity 0.4s ease, filter 0.4s ease;
}

/* Active slide */
.swiper-slide-active {
  transform: scale(1.05);
  z-index: 30;
  opacity: 1;
  filter: none;
}

/* Inactive slides */
.swiper-slide:not(.swiper-slide-active) {
  opacity: 0.65;
  filter: blur(0.6px);
}

/* Image */
.slide-image {
  width: 100%;
  height: 220px;
  object-fit: cover;
}

/* Content */
.slide-content {
  padding: 1.4rem;
}

.slide-title {
  font-size: 1.1rem;
  font-weight: 600;
  color: #3f5360;
  margin-bottom: 0.5rem;
}

.slide-text {
  font-size: 0.9rem;
  color: #5c6670;
  margin-bottom: 0.6rem;
}

.slide-link {
  display: inline-block;
  margin-top: 0.6rem;
  font-weight: 600;
  color: #c98f60;
}

/* Mobile */
@media (max-width: 640px) {
  .project-slide {
    width: 85vw;
     margin: 0 16px;
  }

  .swiper-slide-active {
    transform: scale(1.02);
  }

  .swiper-slide:not(.swiper-slide-active) {
    filter: none;
    opacity: 0.7;
  }
}
</style>
