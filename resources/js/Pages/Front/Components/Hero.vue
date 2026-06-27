<template>
  <section
    id="hero"
    ref="heroSection"
    class="relative min-h-screen flex items-center justify-center text-center px-6
           bg-gradient-to-b from-[#f7f8f9] to-[#eef0f1] overflow-hidden"
  >
    <!-- Mot de fond -->
    <div class="hero-bg-word">
      Excellence
    </div>

    <!-- Background tech -->
    <div
      class="absolute inset-0 bg-[url('/images/pc_theme.png')] bg-center bg-cover opacity-[0.05] pointer-events-none"
    ></div>

    <!-- Glow central (simplifié & cohérent design system) -->
    <div
      class="absolute left-1/2 top-1/2 -translate-x-1/2 -translate-y-1/2
             w-[800px] h-[800px]
             bg-[radial-gradient(circle,rgba(201,143,96,0.25)_0%,transparent_70%)]
             blur-[120px] opacity-80"
    ></div>

    <!-- Content -->
    <div class="relative z-10 max-w-4xl">

      <!-- Title -->
      <h1 class="text-5xl md:text-6xl font-extrabold text-[#3f5360] leading-tight">
        <span class="text-[#c98f60]">HuData</span> Développement
      </h1>

      <!-- Separator -->
      <div class="mt-6 flex items-center justify-center gap-4">
        <div class="h-[2px] w-24 bg-[#c98f60]"></div>
        <div class="h-[2px] w-10 bg-[#3f5360]/20"></div>
      </div>

      <!-- Subtitle -->
      <h2 class="mt-6 text-xl md:text-2xl text-[#5c6670] font-medium">
        Ingénierie logicielle sur mesure & solutions numériques haut de gamme
      </h2>

      <!-- Description -->
      <p class="mt-4 text-base md:text-lg text-[#5c6670]/90 max-w-2xl mx-auto">
        Conception, architecture et développement Full-Stack pour des produits modernes, performants et scalables.
      </p>

      <!-- Buttons -->
      <div class="mt-10 flex flex-col sm:flex-row justify-center gap-4">

        <a
          href="#projects-section"
          class="px-8 py-3 rounded-full font-semibold
                 border border-[#3f5360]/30
                 text-[#3f5360]
                 hover:bg-[#3f5360]/5
                 transition-all duration-300"
        >
          Voir nos projets
        </a>

        <a
          href="#contact-form"
          class="px-8 py-3 rounded-full font-semibold
                 bg-[#c98f60]
                 text-white
                 hover:bg-[#b7794f]
                 transition-all duration-300"
        >
          Nous contacter
        </a>

      </div>

    </div>
  </section>
</template>

<style scoped>
.hero-bg-word {
  position: absolute;
  left: 50%;
  top: 10%;
  transform: translateX(-50%);
  font-size: clamp(6rem, 14vw, 12rem);
  font-weight: 800;
  color: rgba(63, 83, 96, 0.04);
  letter-spacing: 0.05em;
  pointer-events: none;
  user-select: none;
  white-space: nowrap;
}
</style>