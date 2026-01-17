<template>
  <section
  id="hero" ref="heroSection"
  class="relative min-h-screen flex flex-col items-center justify-center text-center px-6
         bg-gradient-to-br from-[#fafbfc] to-[#f3f4f6] text-[#2b2e31] overflow-hidden"
>
 <!-- Image décorative tech -->
    <div
      class="absolute inset-0 bg-[url('/images/pc_theme.png')] bg-center bg-cover opacity-[0.06] pointer-events-none"
    ></div>
 <!-- Halo doré doux visible -->
<div
  class="absolute left-1/2 top-1/2 -translate-x-1/2 -translate-y-1/2 w-[950px] h-[950px]
         rounded-full bg-[radial-gradient(circle,_rgba(201,143,96,0.45)_0%,_rgba(255,255,255,0)_75%)]
         blur-[250px] opacity-90 animate-pulse-slow animate-spin-slow z-[1]"
></div>

<!-- Reflet subtil diagonal -->
<div
  class="absolute inset-0 bg-[radial-gradient(circle_at_40%_30%,rgba(255,255,255,0.35),transparent_80%),
                linear-gradient(135deg, rgba(255,255,255,0.1), transparent 70%)] pointer-events-none"
></div>

    <!-- Texte principal -->
    <div class="relative z-10 max-w-3xl">
      <transition-group name="fade-line" tag="div" class="flex flex-col items-center space-y-3">
        <h1
          key="title"
          class="text-5xl md:text-6xl font-bold tracking-tight text-[#3f5360] leading-tight"
        >
          <span class="text-[#c98f60]">HuData</span> Développement
        </h1>

        <h2
          key="subtitle"
          class="text-lg md:text-2xl font-medium text-[#555c63] max-w-2xl leading-relaxed"
        >
          Ingénierie logicielle sur mesure & solutions numériques haut de gamme
        </h2>

        <p
          key="desc"
          class="text-base md:text-lg text-[#5c6670]/90 mt-2"
        >
          Une expertise complète en conception, architecture et développement Full-Stack.
        </p>
      </transition-group>

      <!-- Boutons d’action -->
      <div class="flex justify-center gap-5 mt-10">
        <a
          href="#projects-section"
          class="border border-[#2b2e31]/40 px-8 py-3 rounded-full font-semibold text-[#2b2e31]/80 hover:bg-[#2b2e31]/5 transition-all duration-300"
        >
          Voir nos projets
        </a>
        <a
          href="#contact-form"
          class="px-8 py-3 rounded-full font-semibold text-[#c98f60] border border-[#c98f60]/50 hover:bg-[#c98f60]/10 transition-all duration-300"
        >
          Nous contacter
      </a>
      </div>
    </div>

    <!-- Mot-clé de fond -->
    <div
      class="absolute bottom-10 left-1/2 -translate-x-1/2 text-[8rem] md:text-[12rem] font-extrabold uppercase tracking-widest text-[#2b2e31]/[0.03] select-none pointer-events-none"
    >
      Excellence
    </div>
  </section>
</template>

<script setup>
import { onMounted, ref } from "vue"

// Animation typographique séquentielle
const lines = ref([])
onMounted(() => {
  lines.value = document.querySelectorAll(".fade-line-enter-active")
})
</script>

<style scoped>
/* Animation du halo doré */
@keyframes pulse-slow {
  0%, 100% {
    transform: scale(1);
    opacity: 0.7;
  }
  50% {
    transform: scale(1.05);
    opacity: 0.9;
  }
}
.animate-pulse-slow {
  animation: pulse-slow 8s ease-in-out infinite;
}

/* Animation typographique progressive */
.fade-line-enter-active {
  animation: fadeLine 0.8s ease forwards;
}
.fade-line-leave-active {
  opacity: 0;
}
@keyframes fadeLine {
  0% {
    opacity: 0;
    transform: translateY(10px);
  }
  100% {
    opacity: 1;
    transform: translateY(0);
  }
}

/* Effet de fondu séquentiel */
.fade-line-enter-active:nth-child(1) {
  animation-delay: 0.2s;
}
.fade-line-enter-active:nth-child(2) {
  animation-delay: 0.5s;
}
.fade-line-enter-active:nth-child(3) {
  animation-delay: 0.8s;
}

/* Adaptation responsive */
@media (max-width: 1024px) {
  .bg-word {
    font-size: 7rem;
  }
}
@media (max-width: 640px) {
  .bg-word {
    font-size: 4.5rem;
  }
}
@keyframes pulse-slow {
  0%, 100% {
    transform: scale(1);
    opacity: 0.75;
  }
  50% {
    transform: scale(1.08);
    opacity: 0.95;
  }
}
.animate-pulse-slow {
  animation: pulse-slow 8s ease-in-out infinite;
}

</style>
