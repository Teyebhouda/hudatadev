<template>
  <section class="bg-gray-50 py-20 px-4">
    <div class="max-w-screen-xl mx-auto">
      <h2 class="text-4xl font-bold text-center text-gray-800 mb-12">
        Nos Projets
      </h2>
      
      <div class="grid gap-8 md:grid-cols-2 lg:grid-cols-3">
        <div
          v-for="project in content"
          :key="project.id"
          class="bg-white rounded-2xl shadow-md overflow-hidden hover:shadow-lg transition-shadow"
        >
          <!-- Image principale -->
          <img
            v-if="project.images.length"
            :src="`/storage/${project.images[0].path}`"
            :alt="project.title"
            class="w-full h-56 object-cover"
          />
          <div v-else class="w-full h-56 bg-gray-200 flex items-center justify-center text-gray-500">
            Pas d’image
          </div>

          <!-- Détails -->
          <div class="p-6">
            <h3 class="text-xl font-semibold text-gray-800 mb-2">
              {{ project.title }}
            </h3>
            <p class="text-gray-600 text-sm mb-3">
              {{ project.description }}
            </p>
            <div class="text-gray-500 text-xs space-y-1">
              <p><strong>📍 Lieu:</strong> {{ project.location }}</p>
              <p><strong>📅 Date:</strong> {{ formatDate(project.date) }}</p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>

<script setup>
import { defineProps } from "vue"

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
</script>
