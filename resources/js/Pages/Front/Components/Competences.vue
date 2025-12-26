<template>
  <section id="skills-section" class="relative bg-white py-8  sm:px-10 lg:px-20 overflow-hidden">
   

    <Swiper
      :modules="[Autoplay]"
      :slides-per-view="5"
      :space-between="40"
      :loop="true"
      :speed="2500"
      :autoplay="{
        delay: 0,
        disableOnInteraction: false
      }"
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
            'bg-gray-50 rounded-xl p-8 shadow-md hover:shadow-xl transition-all duration-500 flex flex-col items-center w-44 cursor-pointer',
            index % 2 === 0
              ? 'rotate-[3deg] hover:rotate-0'
              : '-rotate-[3deg] hover:rotate-0'
          ]"
        >
       <!--   <div class="text-primary mb-4">
            <component :is="skill.icon" class="w-10 h-10" />
          </div> -->
          <h3 class="text-md font-semibold text-gray-900 text-center">
            {{ skill.name }}
          </h3>
          <p class="text-gray-500 text-sm text-center">{{ skill.level }}</p>
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

import {
  CodeBracketIcon,
  ServerIcon,
  DevicePhoneMobileIcon
} from "@heroicons/vue/24/outline"

const skills = [
  { name: "Laravel", level: "Expert", icon: CodeBracketIcon },
  { name: "Vue.js", level: "Avancé", icon: CodeBracketIcon },
  { name: "Symfony", level: "Intermédiaire", icon: ServerIcon },
  { name: "Angular", level: "Intermédiaire", icon: CodeBracketIcon },
  { name: "Java EE", level: "Avancé", icon: DevicePhoneMobileIcon },
  { name: "Tailwind CSS", level: "Avancé", icon: CodeBracketIcon },
  { name: "Node.js", level: "Intermédiaire", icon: ServerIcon },
  { name: "React", level: "Intermédiaire", icon: CodeBracketIcon }
]
</script>

<style scoped>
.text-primary {
  color: rgb(79 70 229);
}

/* Swiper global */
.skills-swiper {
  perspective: 1000px;
  overflow: hidden;
}

.skills-swiper .swiper-wrapper {
  transition-timing-function: linear !important; /* mouvement continu */
}
</style>
