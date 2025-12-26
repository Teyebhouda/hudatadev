<template>
  <section id="skills-section" class="relative bg-white py-16">
    <h2 class="text-3xl font-extrabold text-center text-gray-900 mb-12">
      Compétences
    </h2>

    <Swiper
      :slides-per-view="getSlidesPerView"
      :space-between="40"
      :loop="true"
      :autoplay="{ delay: 2500, disableOnInteraction: false }"
      :breakpoints="{
        320: { slidesPerView: 2 },
        640: { slidesPerView: 3 },
        1024: { slidesPerView: 5 }
      }"
      class="skills-swiper px-4"
    >
      <SwiperSlide
        v-for="skill in skills"
        :key="skill.name"
        class="transform transition-transform duration-500 hover:rotate-0"
      >
        <div
          class="bg-gray-50 rounded-2xl p-8 shadow-md hover:shadow-xl transform rotate-[8deg] hover:-rotate-[2deg] transition-all duration-500 flex flex-col items-center"
        >
          <div class="text-primary text-5xl mb-4">
            <component :is="skill.icon" class="w-12 h-12" />
          </div>
          <h3 class="text-lg font-semibold text-gray-900">{{ skill.name }}</h3>
          <p class="text-gray-500 text-sm">{{ skill.level }}</p>
        </div>
      </SwiperSlide>
    </Swiper>
  </section>
</template>

<script setup>
import { Swiper, SwiperSlide } from "swiper/vue"
import "swiper/css"
import "swiper/css/autoplay"

import { Autoplay } from "swiper/modules"
import { CodeBracketIcon, ServerIcon, DevicePhoneMobileIcon } from "@heroicons/vue/24/outline"

const modules = [Autoplay]

const skills = [
  { name: "Laravel", level: "Expert", icon: CodeBracketIcon },
  { name: "Vue.js", level: "Avancé", icon: CodeBracketIcon },
  { name: "Symfony", level: "Intermédiaire", icon: ServerIcon },
  { name: "Angular", level: "Intermédiaire", icon: CodeBracketIcon },
  { name: "Java EE", level: "Avancé", icon: DevicePhoneMobileIcon },
  { name: "Tailwind CSS", level: "Avancé", icon: CodeBracketIcon },
  { name: "Node.js", level: "Intermédiaire", icon: ServerIcon },
  { name: "React", level: "Intermédiaire", icon: CodeBracketIcon },
]

const getSlidesPerView = 4
</script>

<style scoped>
.text-primary {
  color: rgb(79 70 229);
}

.skills-swiper {
  perspective: 1000px;
}

.skills-swiper .swiper-slide {
  transition: transform 0.5s;
}

.skills-swiper .swiper-slide:hover {
  transform: rotateY(5deg) scale(1.05);
}
</style>
