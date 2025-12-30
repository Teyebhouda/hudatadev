<template>
  <section
    id="projects-section"
    class="relative bg-gradient-to-b from-[#f0f4f8] to-white py-12 px-6 sm:px-10 lg:px-20 overflow-visible"
  >
    <!-- Background word -->
    <h2 aria-hidden="true" class="hero-bg-word">Projects</h2>

    <!-- Title -->
    <div class="relative max-w-6xl mx-auto text-center mb-14">
      <p class="text-4xl sm:text-5xl lg:text-6xl font-extrabold text-[#3f5360]">
        {{ content.title }}
      </p>

      <div class="mt-4 flex items-center justify-center gap-4 flex-wrap">
        <div class="h-[2px] w-24 bg-[#c98f60]"></div>
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
      :centeredSlides="true"
      :slidesPerView="'auto'"
      :loop="content.items.length > 3"
      :initialSlide="0"
      :coverflowEffect="{
        rotate: 20,
        stretch: 100,
        depth: 240,
        modifier: 1,
        slideShadows: false
      }"
      :pagination="{ clickable: true }"
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

          <p class="slide-text">
            {{ project.description }}
          </p>

          <p class="slide-text text-sm opacity-90">
            {{ project.long_description }}
          </p>

          <a
            :href="project.link"
            target="_blank"
            rel="noopener noreferrer"
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

import "swiper/css"
import "swiper/css/effect-coverflow"
import "swiper/css/pagination"

defineProps({
  content: {
    type: Object,
    required: true
  }
})

const modules = [EffectCoverflow, Pagination]
</script>
<style scoped>

.hero-bg-word {
  position: absolute;
  top: 6%;
  left: 50%;
  transform: translateX(-50%);
  font-size: clamp(5rem, 12vw, 9rem);
  font-weight: 800;
  color: rgba(63, 83, 96, 0.06);
  pointer-events: none;
  white-space: nowrap;
}

/* Swiper container */
.projects-swiper {
  width: 100vw;
  padding-bottom: 4rem;
}

/* Slide */
.project-slide {
  width: 360px;
  background: white;
  border-radius: 1.25rem;
  overflow: hidden;
  box-shadow: 0 18px 40px rgba(0, 0, 0, 0.08);
  transition: transform 0.45s ease, opacity 0.45s ease;
}

/* Active slide */
.swiper-slide-active {
  transform: scale(1.15);
  z-index: 20;
}

/* Neighbours */
.swiper-slide-prev,
.swiper-slide-next {
  opacity: 0.6;
}

/* Image */
.slide-image {
  width: 100%;
  height: 220px;
  object-fit: cover;
}

/* Content */
.slide-content {
  padding: 1.25rem;
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
  margin-top: 0.5rem;
  font-weight: 600;
  color: #c98f60;
  transition: color 0.2s ease;
}

.slide-link:hover {
  color: #b7794f;
}

/* Mobile */
@media (max-width: 640px) {
  .project-slide {
    width: 85vw;
  }

  .swiper-slide-active {
    transform: scale(1.05);
  }
}
</style>
