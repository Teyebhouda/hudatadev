<template>
  <section
    id="skills-section"
    class="relative w-full overflow-hidden py-10 sm:py-14 px-6 sm:px-10 lg:px-20 bg-gradient-to-b from-[#f7f8f9] to-[#eef0f1]"
  >
    <Swiper
      :modules="[Autoplay]"
      :slides-per-view="5"
      :space-between="40"
      :loop="true"
      :speed="2500"
      :autoplay="{ delay: 0, disableOnInteraction: false }"
      :allowTouchMove="false"
      :breakpoints="{
        320: { slidesPerView: 2 },
        640: { slidesPerView: 3 },
        1024: { slidesPerView: 5 },
        1440: { slidesPerView: 6 }
      }"
      class="skills-swiper px-8"
    >
      <SwiperSlide
        v-for="(skill, index) in skills"
        :key="skill.name"
        class="flex justify-center"
      >
        <div
          :class="[
            'bg-white rounded-xl p-8 shadow-md hover:shadow-xl transition-all duration-500 flex flex-col items-center w-44 cursor-pointer border border-[#e6e8ea]',
            index % 2 === 0 ? 'rotate-[3deg] hover:rotate-0' : '-rotate-[3deg] hover:rotate-0'
          ]"
        >
          <div class="text-[#c98f60] mb-4">
            <Icon :icon="skill.icon" class="w-10 h-10" />
          </div>

          <h3 class="text-md font-semibold text-gray-900 text-center">
            {{ skill.name }}
          </h3>
        </div>
      </SwiperSlide>
    </Swiper>
  </section>
</template>

<script setup>
import { Swiper, SwiperSlide } from "swiper/vue"
import { Autoplay } from "swiper/modules"
import "swiper/css"
import "swiper/css/autoplay"

import { Icon } from "@iconify/vue"

const skills = [
  { name: "Laravel", icon: "logos:laravel" },
  { name: "Vue.js", icon: "logos:vue" },
  { name: "Symfony", icon: "logos:symfony" },
  { name: "Angular", icon: "logos:angular-icon" },
  { name: "Java EE", icon: "logos:java" },
  { name: "Tailwind CSS", icon: "logos:tailwindcss-icon" },
  { name: "Nuxt.js", icon: "logos:nuxt-icon" },
  { name: "Blazor C#", icon: "logos:csharp" }
]
</script>

<style scoped>
.skills-swiper {
  perspective: 1000px;
  overflow: hidden;
}

.skills-swiper .swiper-wrapper {
  transition-timing-function: linear !important;
}
</style>
