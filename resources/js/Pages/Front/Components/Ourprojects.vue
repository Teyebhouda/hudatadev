<template>
  <section
    id="projects-section"
    class="relative bg-gradient-to-b from-[#f0f4f8] to-white py-12 px-6 sm:px-10 lg:px-20 overflow-visible"
    role="region"
    aria-labelledby="projects-title"
  >
    <!-- large faint background word -->
    <h2 aria-hidden="true" class="hero-bg-word select-none pointer-events-none">Projects</h2>

    <div class="relative max-w-6xl mx-auto text-center mb-12">
      <!-- Titre -->
      <p class="text-4xl sm:text-5xl lg:text-6xl font-extrabold tracking-tight text-[#3f5360] leading-tight">
        {{ content.title }}
      </p>

      <!-- Séparateur + Description -->
      <div class="mt-4 flex flex-col sm:flex-row items-center justify-center gap-4">
        <div class="h-[2px] w-24 sm:w-36 bg-[#c98f60]"></div>
        <p class="text-lg text-[#5c6670] max-w-2xl">
          {{ content.description }}
        </p>
      </div>

     
    </div>

    <!-- Swiper Coverflow -->
  <swiper
  :effect="'coverflow'"
  :grabCursor="true"
  :centeredSlides="true"
  :slidesPerView="'auto'"
  :loop="true"
  :initialSlide="Math.floor(content.items.length / 2)"
  :coverflowEffect="{
    rotate: 50,
    stretch: 0,
    depth: 120,
    modifier: 1,
    slideShadows: false
  }"
  :pagination="{ clickable: true }"
  :modules="modules"
  class="mySwiper"
  @swiper="onSwiperInit"
>

    <swiper-slide
  v-for="project in content.items"
  :key="project.id"
  class="relative rounded-2xl overflow-hidden shadow-md hover:shadow-xl transition-all duration-300 bg-white"
>
  <div
    class="absolute inset-0 bg-[#3f5360]/10 backdrop-blur-md z-0 rounded-2xl"
    aria-hidden="true"
  ></div>

  <img
    v-if="project.images.length"
    :src="`/storage/${project.images[0].path}`"
    :alt="project.title"
    class="w-full h-60 object-cover relative z-10"
    loading="lazy"
  />
  <div
    v-else
    class="w-full h-60 bg-[#f0f4f8] flex items-center justify-center text-[#5c6670] text-sm italic relative z-10"
  >
    Aucune image disponible
  </div>

  <div class="p-5 bg-white relative z-10">
    <h3 class="text-lg font-semibold text-[#3f5360] mb-1">
      {{ project.title }}
    </h3>

    <!-- Description courte affichée totalement -->
    <p class="text-[#5c6670] text-sm mb-3">
      {{ project.description }}
    </p>

    <!-- Description longue affichée totalement -->
    <p class="text-[#5c6670] text-sm mb-3">
      {{ project.long_description }}
    </p>

    <!-- Lien direct vers le site -->
    <a
      :href="project.link"
      target="_blank"
      rel="noopener noreferrer"
      class="inline-block text-[#c98f60] hover:text-[#b7794f] font-semibold text-sm transition-colors"
    >
      Visiter le site &rarr;
    </a>
  </div>
</swiper-slide>


    </swiper>
  </section>
</template>

<script setup>
import { defineProps } from "vue"
import { Swiper, SwiperSlide } from "swiper/vue"
import "swiper/css"
import "swiper/css/effect-coverflow"
import "swiper/css/pagination"
import { EffectCoverflow, Pagination } from "swiper/modules"

import { nextTick } from 'vue'

const onSwiperInit = (swiper) => {
  nextTick(() => {
    swiper.update()
    swiper.slideToLoop(
      Math.floor(props.content.items.length / 2),
      0
    )
  })
}


const props = defineProps({
  content: {
    type: Object,
    default: () => ({
      title: "Nos Projets",
      description: "Découvrez une sélection de nos projets récents...",
      items: []
    })
  }
})

const modules = [EffectCoverflow, Pagination]
</script>

<style scoped>
.hero-bg-word {
  position: absolute;
  left: 50%;
  top: 10%;
  transform: translateX(-50%);
  font-size: clamp(5rem, 11vw, 9rem);
  font-weight: 800;
  color: rgba(63, 83, 96, 0.06);
  letter-spacing: -0.02em;
  line-height: 0.8;
  pointer-events: none;
  user-select: none;
  z-index: 0;
  white-space: nowrap;
}

.mySwiper {
  width: 100%;
  padding-top: 1.5rem;
  padding-bottom: 2rem;
  display: flex;
  justify-content: center;
  align-items: center;
}
.swiper-wrapper {
  align-items: center;
}
.swiper-slide {
  width: 300px;
 /* height: 340px;*/
 height: auto;
  border-radius: 1rem;
}

.line-clamp-2 {
  display: -webkit-box;
  -webkit-line-clamp: 2;
  -webkit-box-orient: vertical;
  overflow: hidden;
}
</style>
