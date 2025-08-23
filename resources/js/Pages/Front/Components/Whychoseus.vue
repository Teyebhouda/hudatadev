<template>
  <section
    class="relative min-h-fit flex items-center justify-center px-4 sm:px-8 py-16 bg-cover bg-center bg-fixed"
    :style="bgStyle"
  >
    <!-- Overlay sombre -->
    <div class="absolute inset-0 bg-black/60"></div>

    <!-- Carte centrale -->
    <div
      class="relative z-10 w-full max-w-4xl bg-white border-l-[6px] border-yellow-400 rounded-xl shadow-lg px-6 sm:px-12 py-12"
    >
      <h2 class="text-3xl sm:text-4xl font-extrabold mb-6 text-gray-800">
        {{ content.title }}
      </h2>

      <p class="mb-8 text-base sm:text-lg text-gray-600 font-medium">
        {{ content.description }}
      </p>

      <ul class="space-y-4">
        <li
          v-for="item in content.items"
          :key="item.text"
          class="flex items-start gap-4"
        >
          <span
            class="flex items-center justify-center w-10 h-10 rounded-full bg-yellow-100 text-yellow-700 shadow-md text-xl flex-shrink-0"
          >
            <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7" />
            </svg>
          </span>
          <span class="text-gray-700 font-medium text-base sm:text-lg">{{ item.text }}</span>
        </li>
      </ul>
    </div>
  </section>
</template>

<script setup>
const props = defineProps({
  content: {
    type: Object,
    default: () => ({
      title: 'Pourquoi nous choisir ?',
      description:
        "Nous mettons la qualité, la rigueur et le respect des engagements au cœur de chaque chantier.",
      background_image:
        'https://images.unsplash.com/photo-1600585154340-be6161a56a0c?auto=format&fit=crop&w=1600&q=80', // chantier, béton, etc.
      items: [
        { text: 'Accompagnement personnalisé à chaque étape' },
        { text: 'Respect des délais, normes et budgets' },
        { text: 'Équipe expérimentée et professionnelle' },
      ],
    }),
  },
})

const bgStyle = {
  backgroundImage: `url(${props.content.background_image})`,
}
</script>

<style scoped>
/* Aucun style additionnel requis ici */
</style>
