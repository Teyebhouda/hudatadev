<template>
  <section
    id="services-section"
    class="relative w-full overflow-hidden py-10 sm:py-14 px-6 sm:px-10 lg:px-20 bg-gradient-to-b from-[#f7f8f9] to-[#eef0f1]"
  >
    <!-- Mot de fond -->
    <h2 aria-hidden="true" class="hero-bg-word select-none pointer-events-none">
      Services
    </h2>

    <div class="relative max-w-6xl mx-auto text-center mb-10">
      <!-- Titre principal -->
      <p class="text-3xl sm:text-4xl lg:text-5xl font-extrabold tracking-tight text-[#3f5360] leading-tight">
        {{ content.title }}
      </p>

      <!-- Ligne + Description -->
      <div class="mt-4 flex flex-col sm:flex-row items-center justify-center gap-4">
        <div class="h-[1px] w-20 sm:w-32 bg-[#c98f60]/60"></div>
        <p class="text-base sm:text-lg text-[#5c6670] max-w-2xl leading-relaxed">
          {{ content.subtitle }}
        </p>
      </div>
    </div>

    <!-- Cartes services -->
    <div
      class="relative z-10 flex flex-col sm:flex-row flex-wrap justify-center items-stretch gap-5 sm:gap-4"
    >
      <div
        v-for="(service, i) in content.items"
        :key="service.title"
        class="group relative flex-1 min-w-[220px] max-w-[300px] flex flex-col justify-center items-center text-center transition-all duration-700 ease-[cubic-bezier(0.25,0.1,0.25,1)] overflow-hidden rounded-2xl p-6 sm:p-8 backdrop-blur-sm border border-[#d9dbdd]/60 shadow-sm"
        :class="[ 
          i % 2 === 0
            ? 'bg-[#3f5360]/95 text-white hover:shadow-xl hover:scale-[1.03]'
            : 'bg-white text-[#2f3438] hover:shadow-lg hover:scale-[1.02]'
        ]"
      >
        <Icon
          :icon="service.icon"
          class="w-10 h-10 sm:w-12 sm:h-12 mb-3 sm:mb-4 transition-transform duration-500 group-hover:scale-110 text-[#c98f60]"
        />
        <h3 class="text-lg sm:text-xl font-semibold mb-2 tracking-wide">
          {{ service.title }}
        </h3>
        <p class="max-w-xs mx-auto text-sm leading-relaxed opacity-90">
          {{ service.description }}
        </p>
        <p class="max-w-xs mx-auto text-xs leading-relaxed mt-2 opacity-70 italic line-clamp-3"  v-html="service.long_description"
        >
        </p>
        <div class="flex-grow">
        <a
        :href="`/services/${service.slug}`"
          class="mt-4 inline-block text-sm font-medium text-[#c98f60] underline underline-offset-4 hover:text-[#a66e40] transition-colors"
        >
          En savoir plus
        </a>
        </div>
      </div>
    </div>
  </section>
</template>

<script setup>
import { Icon } from "@iconify/vue"

defineProps({
  content: {
    type: Object,
    default: () => ({
      title: "Mes Services",
      description: "Ingénierie logicielle moderne, performante et élégante.",
      items: [
        {
          title: "Développement Web",
          description: "Applications modernes avec Vue.js, Laravel et TailwindCSS.",
          long_description: "Des solutions performantes, maintenables et évolutives.",
          icon: "mdi:code-tags",
        },
        {
          title: "Applications Mobiles",
          description: "Développement cross-platform fluide et intuitif.",
          long_description: "Une expérience utilisateur homogène sur tous les appareils.",
          icon: "mdi:cellphone-link",
        },
        {
          title: "Design UI/UX",
          description: "Création d’interfaces esthétiques et centrées sur l’utilisateur.",
          long_description: "Conjuguer clarté, efficacité et identité visuelle.",
          icon: "mdi:palette-outline",
        },
        {
          title: "Architecture & Optimisation",
          description: "Conception logicielle et optimisation des performances.",
          long_description: "Robustesse, scalabilité et efficacité du code.",
          icon: "mdi:cogs",
        },
      ],
    }),
  },
})
</script>

<style scoped>
.hero-bg-word {
  position: absolute;
  left: 50%;
  top: 8%;
  transform: translateX(-50%);
  font-size: clamp(3.5rem, 8vw, 6rem);
  font-weight: 800;
  color: rgba(63, 83, 96, 0.05);
  letter-spacing: -0.02em;
  line-height: 0.8;
  white-space: nowrap;
  pointer-events: none;
  user-select: none;
  z-index: 0;
}

.group {
  transition: all 0.6s cubic-bezier(0.25, 0.1, 0.25, 1);
}
</style>
