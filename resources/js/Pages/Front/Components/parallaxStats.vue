<template>
  <section
    class="relative bg-fixed bg-center bg-cover py-24 px-6 sm:px-12"
    :style="`background-image: url('${content.background_image || defaultBackground}')`"
  >
    <!-- Overlay sombre -->
    <div class="absolute inset-0 bg-gradient-to-r from-black/80 to-black/40"></div>

    <!-- Contenu -->
    <div class="relative z-10 max-w-6xl mx-auto grid md:grid-cols-2 gap-12 items-center">
      
      <!-- Texte -->
      <div class="text-white space-y-6">
        <h2 class="text-4xl sm:text-5xl font-extrabold leading-tight">
          {{ content.title || 'Titre par défaut' }}
        </h2>
        <p class="text-lg sm:text-xl text-gray-200">
          {{ content.description || 'Description par défaut...' }}
        </p>

        <div class="grid grid-cols-2 gap-6 mt-8">
          <div
            v-for="(stat, index) in content.stats || []"
            :key="index"
            class="bg-white/10 backdrop-blur-md p-6 rounded-xl text-center shadow-lg"
          >
            <h3 class="text-4xl font-bold text-yellow-400">{{ stat.value }}</h3>
            <p class="text-sm">{{ stat.label }}</p>
          </div>
        </div>
      </div>

      <!-- Image décorative -->
      <div class="hidden md:block" v-if="content.image">
        <div class="relative">
          <img
            :src="content.image"
            :alt="content.image_alt || 'Image décorative'"
            class="rounded-2xl shadow-2xl border-4 border-yellow-400"
          />
          <div
            v-if="content.badge"
            class="absolute -bottom-6 -left-6 bg-yellow-400 text-black font-bold text-lg px-6 py-4 rounded-lg shadow-xl"
          >
            {{ content.badge }}
          </div>
        </div>
      </div>
    </div>
  </section>
</template>

<script setup>
const props = defineProps({
  content: {
    type: Object,
    default: () => ({
      title: '',
      description: '',
      stats: [],
      background_image: '',
      image: '',
      badge: '',
      image_alt: '',
    }),
  },
})

// Optionnel : image par défaut si la DB ne contient rien
//const defaultBackground = 'https://images.unsplash.com/photo-1600585154340-be6161a56a0c?auto=format&fit=crop&w=1600&q=80'
</script>
