<template>
  <section
    id="projects-section"
    class="relative overflow-hidden py-20  px-6 sm:px-10 lg:px-20
           bg-gradient-to-b from-[#f7f8f9] to-[#eef0f1]"
  >

    <!-- Background word -->
    <div class="hero-bg-word">Projets</div>

    <!-- Header -->
    <div class="relative max-w-6xl mx-auto text-center mb-16">

      <p class="text-4xl sm:text-5xl lg:text-6xl font-extrabold text-[#3f5360]">
        {{ content.title }}
      </p>

      <div class="mt-5 flex flex-col sm:flex-row items-center justify-center gap-4">
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
      :centeredSlides="true"
      slidesPerView="auto"
      :spaceBetween="40"
      :loop="true"
      :initialSlide="initialIndex"
      :speed="800"
      :coverflowEffect="{
        rotate: 0,
        stretch: 0,
        depth: 250,
        modifier: 1.2,
        slideShadows: false
      }"
      :pagination="{ clickable: true }"
    >

      <SwiperSlide
        v-for="project in content.items"
        :key="project.id"
        class="project-slide"
      >

        <!-- IMAGE -->
        <div class="image-wrapper">

          <img
            v-if="project.images?.length"
            :src="`/storage/${project.images[0].path}`"
            :alt="project.title"
            class="slide-image"
          />

          <!-- overlay -->
          <div class="overlay"></div>

          <!-- badge -->
          <div class="badge">
            Projet
          </div>

        </div>

        <!-- CONTENT -->
        <div class="slide-content">

          <h3 class="title">
            {{ project.title }}
          </h3>

          <p class="desc">
            {{ project.description }}
          </p>

          <p class="subdesc">
            {{ project.long_description }}
          </p>

          <a
            :href="project.link"
            target="_blank"
            class="link"
          >
            Voir le projet →
          </a>

        </div>

      </SwiperSlide>

    </Swiper>

  </section>
</template>

<script setup>
import { Swiper, SwiperSlide } from "swiper/vue"
import { EffectCoverflow, Pagination } from "swiper/modules"
import { ref } from "vue"

import "swiper/css"
import "swiper/css/effect-coverflow"
import "swiper/css/pagination"

const props = defineProps({
  content: { type: Object, required: true }
})

const modules = [EffectCoverflow, Pagination]

const initialIndex = Math.floor(props.content.items.length / 2)
</script>

<style scoped>

/* Background word */
.hero-bg-word {
  position: absolute;
  left: 50%;
  top: 6%;
  transform: translateX(-50%);
  font-size: clamp(5rem, 12vw, 9rem);
  font-weight: 800;
  color: rgba(63, 83, 96, 0.05);
  pointer-events: none;
  white-space: nowrap;
}

/* Swiper */
.projects-swiper {
  padding-bottom: 4rem;
}

/* SLIDE */
.project-slide {
  width: 420px;
  max-width: 90vw;

  border-radius: 28px;
  overflow: hidden;

  background: white;
  box-shadow: 0 25px 60px rgba(0,0,0,0.08);

  transition: all 0.5s ease;
}

/* ACTIVE */
.swiper-slide-active {
  transform: scale(1.08);
  z-index: 20;
}

/* INACTIVE */
.swiper-slide:not(.swiper-slide-active) {
  opacity: 0.6;
  filter: blur(0.5px);
}

/* IMAGE */
.image-wrapper {
  position: relative;
  height: 240px;
  overflow: hidden;
}

.slide-image {
  width: 100%;
  height: 100%;
  object-fit: cover;
  transition: transform 0.6s ease;
}

.project-slide:hover .slide-image {
  transform: scale(1.1);
}

/* overlay */
.overlay {
  position: absolute;
  inset: 0;
  background: linear-gradient(
    to top,
    rgba(0,0,0,0.25),
    transparent
  );
}

/* badge */
.badge {
  position: absolute;
  top: 16px;
  left: 16px;

  background: rgba(201,143,96,0.9);
  color: white;

  font-size: 12px;
  padding: 6px 10px;
  border-radius: 999px;
  font-weight: 600;
}

/* CONTENT */
.slide-content {
  padding: 22px;
}

.title {
  font-size: 18px;
  font-weight: 800;
  color: #3f5360;
}

.desc {
  font-size: 14px;
  color: #5c6670;
  margin-top: 6px;
}

.subdesc {
  font-size: 12px;
  color: rgba(92,102,112,0.75);
  margin-top: 8px;
}

/* LINK */
.link {
  display: inline-block;
  margin-top: 14px;

  font-weight: 600;
  color: #c98f60;

  transition: 0.3s;
}

.link:hover {
  color: #b7794f;
}

/* pagination */
:global(.swiper-pagination-bullet) {
  background: #cbd5e1;
  opacity: 1;
}

:global(.swiper-pagination-bullet-active) {
  background: linear-gradient(135deg,#c98f60,#b7793e);
  width: 22px;
  border-radius: 999px;
}
</style>