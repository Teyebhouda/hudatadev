<template>
  <section class="bg-white mt-12 py-20 px-6" role="region" aria-labelledby="projects-title">
<!-- Wave transition depuis Services -->
      <div class="absolute -top-12 w-full overflow-hidden leading-[0]">
        <svg class="relative block w-full h-12 text-gray-200" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="none" viewBox="0 0 1200 120">
          <path d="M0 0c144.3 62.1 286.9 79.9 432 60 172.7-24 343.7-72 520 4 82.1 38.2 161 60 248 54 56.4-3.9 109.3-21 168-43 48.9-19.6 106.4-44.2 132-69V120H0V0z" fill="currentColor"/>
        </svg>
      </div>
    <div class="max-w-screen-xl mx-auto grid grid-cols-1 md:grid-cols-2 gap-16">
      <!-- Bloc gauche -->
      <div class="flex flex-col justify-start md:sticky md:top-24 h-fit">
         <div class="mb-16 text-left">
        <h2 class="text-4xl sm:text-5xl font-extrabold text-gray-900 mb-4 leading-tight" tabindex="0">
          Nos Projets
        </h2>
        <div class="flex items-center gap-3 mb-4">
          <div class="w-14 h-1 bg-primary rounded-full"></div>
          <span class="text-gray-400 text-sm uppercase tracking-widest">Expertise</span>
        </div>
          <p class="text-gray-700 text-lg leading-relaxed mb-4" tabindex="0">
          Plongez dans notre univers créatif à travers une sélection de projets récents. Chaque réalisation témoigne de notre expertise et de notre passion pour le design moderne.
        </p>
        <p class="text-lg sm:text-xl text-gray-600 mt-2 max-w-2xl leading-relaxed">
                   Faites défiler pour explorer nos réalisations les plus marquantes.

        </p>
      </div>

        <!-- CTA -->
        <a
          href="/projects"
          class="inline-flex items-center gap-2 bg-primary text-white font-medium px-6 py-3 rounded-full shadow-lg hover:bg-indigo-700 hover:scale-105 transition-all duration-300 focus:outline-none focus:ring-4 focus:ring-primary/50"
          role="button"
          tabindex="0"
          aria-label="Voir tous les projets"
        >
          <svg
            class="w-5 h-5"
            fill="none"
            stroke="currentColor"
            stroke-width="2"
            viewBox="0 0 24 24"
            aria-hidden="true"
            focusable="false"
          >
            <path stroke-linecap="round" stroke-linejoin="round" d="M17 8l4 4m0 0l-4 4m4-4H3" />
          </svg>
          Voir tous les projets
        </a>
      </div>
    

      <!-- Masonry -->
      <div class="columns-1 sm:columns-2 gap-6 space-y-6" role="list" aria-label="Liste des projets">
       <!-- 👇 Limitation à 4 projets -->
     
<article
  v-for="(project, index) in content.slice(0, 6)"
  :key="project.id"
  class="relative group rounded-xl overflow-hidden break-inside-avoid cursor-pointer shadow-md hover:shadow-xl transition-shadow duration-300"
  :data-aos="index % 2 === 0 ? 'fade-up' : 'fade-down'"
  role="listitem"
  tabindex="0"
  :aria-label="`Projet: ${project.title}`"
>
   <a
    :href="`/projects/${project.slug}`"
    class="block"
  :aria-label="`Voir les détails du projet ${project.title}`"
>
          <!-- Image -->
          <img
            v-if="project.images.length"
            :src="`/storage/${project.images[0].path}`"
            :alt="project.title"
            class="w-full h-96 object-cover rounded-xl transition-all duration-500 group-hover:scale-110 group-hover:blur-[1px]"
            loading="lazy"
          />
          <div
            v-else
            class="w-full h-96 bg-gray-200 flex items-center justify-center text-gray-500 text-sm italic"
            aria-label="Aucune image disponible"
          >
            Aucune image disponible
          </div>

          <!-- Overlay -->
          <div
            class="absolute inset-0 flex flex-col justify-end bg-gradient-to-t from-black/60 via-black/30 to-transparent backdrop-blur-s p-5
              translate-y-4 group-hover:translate-y-0 transition-all duration-500 ease-in-out"
            aria-hidden="true"
          >
            <h3 class="text-white text-xl font-bold drop-shadow-md">{{ project.title }}</h3>
            <p
              class="text-gray-200 text-sm line-clamp-2 opacity-0 group-hover:opacity-100 transition-opacity duration-500"
              tabindex="0"
            >
              {{ project.description }}
            </p>
            <div
              class="flex justify-between text-gray-300 text-xs mt-2 opacity-0 group-hover:opacity-100 transition-opacity duration-500"
              tabindex="0"
            >
              <span aria-label="Lieu du projet">📍 {{ project.location }}</span>
              <span aria-label="Date du projet">📅 {{ formatDate(project.date) }}</span>
            </div>
          </div>
    </a>
        </article>
       

      </div>
    </div>
  </section>
</template>

<script setup>
import { defineProps, onMounted, watch, nextTick } from "vue"
import AOS from "aos"
import "aos/dist/aos.css"

const props = defineProps({
  content: {
    type: Array,
    default: () => []
  }
})

function formatDate(date) {
  return new Date(date).toLocaleDateString("fr-FR", {
    year: "numeric",
    month: "long",
    day: "numeric"
  })
}

onMounted(async () => {
  await nextTick()
  AOS.init({ duration: 1000, once: true })
})

watch(
  () => props.content,
  async () => {
    await nextTick()
    AOS.refresh()
  }
)
</script>
