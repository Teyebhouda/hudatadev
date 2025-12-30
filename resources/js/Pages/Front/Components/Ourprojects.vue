<template>
  <section
    id="projects-section"
    class="relative bg-gradient-to-b from-[#f0f4f8] to-white py-12 px-6 sm:px-10 lg:px-20 overflow-visible"
    role="region"
    aria-labelledby="projects-title"
  >
    <!-- Background word -->
    <h2 aria-hidden="true" class="hero-bg-word">Projects</h2>

    <!-- Header -->
    <div class="relative max-w-6xl mx-auto text-center mb-12">
      <p class="text-4xl sm:text-5xl lg:text-6xl font-extrabold text-[#3f5360]">
        {{ content.title }}
      </p>

      <div class="mt-4 flex items-center justify-center gap-4">
        <div class="h-[2px] w-32 bg-[#c98f60]" />
        <p class="text-lg text-[#5c6670] max-w-2xl">
          {{ content.description }}
        </p>
      </div>
    </div>

    <!-- Swiper -->
    <swiper
      class="mySwiper"
      effect="coverflow"
      grabCursor
      centeredSlides
      slidesPerView="auto"
      loop
      :loopedSlides="content.items.length"
      :loopAdditionalSlides="content.items.length * 2"
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
      @swiper="onSwiperInit"
    >
      <swiper-slide
        v-for="project in content.items"
        :key="project.id"
        class="project-slide"
      >
        <img
          v-if="project.images.length"
          :src="`/storage/${project.images[0].path}`"
          :alt="project.title"
          class="slide-image"
        />

        <div v-else class="no-image">
          Aucune image disponible
        </div>

        <div class="p-5">
          <h3 class="text-lg font-semibold text-[#3f5360]">
            {{ project.title }}
          </h3>

          <p class="text-sm text-[#5c6670] mb-3">
            {{ project.description }}
          </p>

          <a
            :href="project.link"
            target="_blank"
            class="text-[#c98f60] font-semibold text-sm hover:underline"
          >
            Visiter le site →
          </a>
        </div>
      </swiper-slide>
    </swiper>
  </section>
</template>

<script setup>
import { defineProps, nextTick } from 'vue'
import { Swiper, SwiperSlide } from 'swiper/vue'
import { EffectCoverflow, Pagination } from 'swiper/modules'

import 'swiper/css'
import 'swiper/css/effect-coverflow'
import 'swiper/css/pagination'

const props = defineProps({
  content: {
    type: Object,
    default: () => ({
      title: 'Nos Projets',
      description: 'Découvrez nos réalisations',
      items: []
    })
  }
})

const modules = [EffectCoverflow, Pagination]

const onSwiperInit = (swiper) => {
  nextTick(() => {
    swiper.update()
    swiper.slideToLoop(
      Math.floor(props.content.items.length / 2),
      0,
      false
    )
  })
}
</script>


<style scoped>
.hero-bg-word {
  position: absolute;
  top: 10%;
  left: 50%;
  transform: translateX(-50%);
  font-size: clamp(5rem, 11vw, 9rem);
  font-weight: 800;
  color: rgba(63, 83, 96, 0.06);
  z-index: 0;
  white-space: nowrap;
}

.mySwiper {
  width: 100%;
  padding: 2rem 0;
}

.swiper-wrapper {
  align-items: center;
}

.project-slide {
  width: 300px;
  background: white;
  border-radius: 1rem;
  overflow: hidden;
  box-shadow: 0 10px 30px rgba(0,0,0,.08);
}

.slide-image {
  width: 100%;
  height: 240px;
  object-fit: cover;
}

.no-image {
  height: 240px;
  display: flex;
  align-items: center;
  justify-content: center;
  background: #f0f4f8;
  font-style: italic;
}
</style>

