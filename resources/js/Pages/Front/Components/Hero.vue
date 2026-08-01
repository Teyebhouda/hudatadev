<template>
 <section
  id="hero"
  ref="heroSection"
  class="relative
         min-h-[100svh]
         flex items-center justify-center
         text-center
         px-5 sm:px-6
         pt-[90px] md:pt-0
         pb-16 md:pb-0
         bg-gradient-to-b
         from-[#f8f9fa]
         via-[#f5f6f7]
         to-[#eef0f1]
         overflow-hidden"
>
    <!-- ================================================= -->
    <!-- BACKGROUND GRADIENT -->
    <!-- ================================================= -->

    <div
      class="absolute inset-0
             bg-gradient-to-b
             from-[#f7f8f9]
             via-[#f5f6f7]
             to-[#eef0f1]
             pointer-events-none"
    ></div>


    <!-- ================================================= -->
    <!-- LARGE BACKGROUND WORD -->
    <!-- ================================================= -->

    <div class="hero-bg-word">
      Excellence
    </div>


    <!-- ================================================= -->
    <!-- TECH BACKGROUND -->
    <!-- ================================================= -->

    <div
      class="absolute inset-0
             bg-[url('/images/pc_theme.png')]
             bg-center
             bg-cover
             opacity-[0.035]
             pointer-events-none"
    ></div>


    <!-- ================================================= -->
    <!-- TOP LIGHT -->
    <!-- ================================================= -->

    <div
      class="absolute
             -top-40
             left-1/2
             -translate-x-1/2
             w-[650px]
             h-[400px]
             rounded-full
             bg-[radial-gradient(ellipse,rgba(255,255,255,0.95)_0%,transparent_70%)]
             blur-3xl
             pointer-events-none"
    ></div>


    <!-- ================================================= -->
    <!-- CENTRAL ORANGE GLOW -->
    <!-- ================================================= -->

    <div
      class="absolute
             left-1/2
             top-[48%]
             -translate-x-1/2
             -translate-y-1/2
             w-[600px]
             md:w-[850px]
             h-[600px]
             md:h-[850px]
             rounded-full
             bg-[radial-gradient(circle,rgba(201,143,96,0.16)_0%,rgba(201,143,96,0.06)_35%,transparent_70%)]
             blur-[90px]
             pointer-events-none"
    ></div>


    <!-- ================================================= -->
    <!-- DECORATIVE CIRCLES -->
    <!-- ================================================= -->

    <div
      class="absolute
             left-1/2
             top-1/2
             -translate-x-1/2
             -translate-y-1/2
             w-[420px]
             h-[420px]
             md:w-[600px]
             md:h-[600px]
             rounded-full
             border border-[#3f5360]/[0.035]
             pointer-events-none"
    ></div>

    <div
      class="absolute
             left-1/2
             top-1/2
             -translate-x-1/2
             -translate-y-1/2
             w-[280px]
             h-[280px]
             md:w-[420px]
             md:h-[420px]
             rounded-full
             border border-[#c98f60]/[0.07]
             pointer-events-none"
    ></div>


    <!-- ================================================= -->
    <!-- SMALL DECORATIVE DOTS -->
    <!-- ================================================= -->

    <div
      class="absolute
             top-[28%]
             left-[8%]
             w-2
             h-2
             rounded-full
             bg-[#c98f60]/40
             blur-[1px]"
    ></div>

    <div
      class="absolute
             top-[38%]
             right-[10%]
             w-1.5
             h-1.5
             rounded-full
             bg-[#3f5360]/20"
    ></div>

    <div
      class="absolute
             bottom-[22%]
             left-[14%]
             w-1
             h-1
             rounded-full
             bg-[#c98f60]/50"
    ></div>


    <!-- ================================================= -->
    <!-- MAIN CONTENT -->
    <!-- ================================================= -->

    <div
      class="relative z-10
             w-full
             max-w-5xl
             mx-auto
             text-center"
    >

      <!-- ================================================= -->
      <!-- LABEL -->
      <!-- ================================================= -->

     


      <!-- ================================================= -->
      <!-- TITLE -->
      <!-- ================================================= -->

      <h1
  class="hero-item
         mt-5 md:mt-7
         text-[clamp(2.65rem,11vw,5.8rem)]
         font-extrabold
         leading-[0.94]
         tracking-[-0.045em]
         text-[#3f5360]"
>
  <span class="text-[#c98f60]">
    HuData
  </span>

  <span class="block sm:inline">
    Développement
  </span>
</h1>


      <!-- ================================================= -->
      <!-- DECORATIVE LINE -->
      <!-- ================================================= -->

      <div
        class="hero-item
               mt-7
               flex
               items-center
               justify-center
               gap-3"
      >

        <span
          class="w-16 sm:w-24
                 h-[2px]
                 rounded-full
                 bg-[#c98f60]"
        ></span>

        <span
          class="w-2
                 h-2
                 rounded-full
                 bg-[#c98f60]
                 shadow-[0_0_12px_rgba(201,143,96,.35)]"
        ></span>

        <span
          class="w-8 sm:w-12
                 h-[2px]
                 rounded-full
                 bg-[#3f5360]/15"
        ></span>

      </div>


      <!-- ================================================= -->
      <!-- SUBTITLE -->
      <!-- ================================================= -->

    <h2
  class="hero-item
         mt-6 md:mt-7
         max-w-3xl
         mx-auto
         text-[18px]
         sm:text-2xl
         md:text-[27px]
         leading-[1.4]
         font-medium
         tracking-[-0.015em]
         text-[#5c6670]"
>
  Ingénierie logicielle sur mesure
  <span class="text-[#c98f60]">&</span>
  solutions numériques haut de gamme
</h2>


      <!-- ================================================= -->
      <!-- DESCRIPTION -->
      <!-- ================================================= -->

     <p
  class="hero-item
         mt-4
         max-w-2xl
         mx-auto
         text-[14px]
         sm:text-base
         md:text-lg
         leading-[1.7]
         text-[#5c6670]/75"
>
  Conception, architecture et développement Full-Stack
  pour créer des produits modernes, performants et
  évolutifs.
</p>


      <!-- ================================================= -->
      <!-- BUTTONS -->
      <!-- ================================================= -->

   <div
  class="hero-item
         mt-8 md:mt-9
         flex
         flex-col
         sm:flex-row
         items-center
         justify-center
         gap-3"
>

  <a
    href="#projects-section"
    class="group
           w-full sm:w-auto
           min-w-[200px]
           inline-flex
           items-center
           justify-center
           gap-2
           px-7
           py-3.5
           rounded-full
           border border-[#3f5360]/20
           bg-white/70
           backdrop-blur-md
           text-[#3f5360]
           text-sm
           font-semibold
           shadow-[0_8px_25px_rgba(63,83,96,0.06)]
           hover:bg-[#3f5360]
           hover:text-white
           hover:border-[#3f5360]
           hover:-translate-y-1
           transition-all duration-300"
  >
    <span>Voir nos projets</span>

    <i
      class="fas fa-arrow-down text-[9px]
             transition-transform duration-300
             group-hover:translate-y-1"
    ></i>
  </a>


  <a
    href="#contact-form"
    class="group
           w-full sm:w-auto
           min-w-[200px]
           inline-flex
           items-center
           justify-center
           gap-2
           px-7
           py-3.5
           rounded-full
           bg-[#c98f60]
           text-white
           text-sm
           font-semibold
           shadow-[0_12px_30px_rgba(201,143,96,0.22)]
           hover:bg-[#b7794f]
           hover:-translate-y-1
           hover:shadow-[0_16px_35px_rgba(201,143,96,0.28)]
           transition-all duration-300"
  >
    <span>Nous contacter</span>

    <i
      class="fas fa-arrow-right text-[9px]
             transition-transform duration-300
             group-hover:translate-x-1"
    ></i>
  </a>

</div>


      <!-- ================================================= -->
      <!-- SERVICES / EXPERTISE -->
      <!-- ================================================= -->

      <div
        class="hero-item
               mt-12
               flex
               flex-wrap
               items-center
               justify-center
               gap-x-4
               gap-y-2
               text-[10px]
               sm:text-[11px]
               uppercase
               tracking-[0.18em]
               text-[#3f5360]/45"
      >

        <span>Web</span>

        <span
          class="w-1
                 h-1
                 rounded-full
                 bg-[#c98f60]"
        ></span>

        <span>Mobile</span>

        <span
          class="w-1
                 h-1
                 rounded-full
                 bg-[#c98f60]"
        ></span>

        <span>Full-Stack</span>

        <span
          class="w-1
                 h-1
                 rounded-full
                 bg-[#c98f60]"
        ></span>

        <span>API</span>

      </div>

    </div>


    <!-- ================================================= -->
    <!-- SCROLL INDICATOR -->
    <!-- ================================================= -->

    <a
      href="#services-section"
      class="absolute
             bottom-7
             left-1/2
             -translate-x-1/2
             hidden
             md:flex
             flex-col
             items-center
             gap-2
             group"
    >

      <span
        class="text-[9px]
               uppercase
               tracking-[0.25em]
               text-[#3f5360]/40
               group-hover:text-[#c98f60]
               transition-colors"
      >
        Découvrir
      </span>

      <span
        class="relative
               w-px
               h-9
               overflow-hidden
               bg-[#3f5360]/10"
      >

        <span
          class="absolute
                 top-0
                 left-0
                 w-full
                 h-1/2
                 bg-[#c98f60]
                 animate-scroll-line"
        ></span>

      </span>

    </a>

  </section>
</template>


<style scoped>

/* ========================================================= */
/* BACKGROUND WORD */
/* ========================================================= */

.hero-bg-word {

  position: absolute;

  left: 50%;
  top: 12%;

  transform:
    translateX(-50%);

  font-size:
    clamp(5rem, 14vw, 12rem);

  line-height: 1;

  font-weight: 800;

  letter-spacing:
    0.04em;

  color:
    rgba(63, 83, 96, 0.035);

  white-space:
    nowrap;

  pointer-events:
    none;

  user-select:
    none;

}


/* ========================================================= */
/* HERO ENTRANCE */
/* ========================================================= */

.hero-item {

  opacity: 0;

  transform:
    translateY(24px);

  animation:
    heroReveal
    .85s
    cubic-bezier(.22, 1, .36, 1)
    forwards;

}


/* ========================================================= */
/* STAGGER */
/* ========================================================= */

.hero-item:nth-child(1) {
  animation-delay: .12s;
}

.hero-item:nth-child(2) {
  animation-delay: .25s;
}

.hero-item:nth-child(3) {
  animation-delay: .38s;
}

.hero-item:nth-child(4) {
  animation-delay: .51s;
}

.hero-item:nth-child(5) {
  animation-delay: .64s;
}

.hero-item:nth-child(6) {
  animation-delay: .77s;
}


/* ========================================================= */
/* REVEAL */
/* ========================================================= */

@keyframes heroReveal {

  0% {

    opacity: 0;

    transform:
      translateY(24px);

  }

  100% {

    opacity: 1;

    transform:
      translateY(0);

  }

}


/* ========================================================= */
/* SCROLL LINE */
/* ========================================================= */

.animate-scroll-line {

  animation:
    scrollLine
    1.8s
    ease-in-out
    infinite;

}


@keyframes scrollLine {

  0% {

    transform:
      translateY(-100%);

    opacity: 0;

  }

  30% {

    opacity: 1;

  }

  70% {

    opacity: 1;

  }

  100% {

    transform:
      translateY(200%);

    opacity: 0;

  }

}


/* ========================================================= */
/* MOBILE */
/* ========================================================= */

@media (max-width: 640px) {

  .hero-bg-word {

    top: 21%;

    font-size:
      5rem;

  }

}


/* ========================================================= */
/* REDUCED MOTION */
/* ========================================================= */

@media (prefers-reduced-motion: reduce) {

  .hero-item {

    animation:
      none;

    opacity: 1;

    transform:
      none;

  }

  .animate-scroll-line {

    animation:
      none;

  }

}

</style>
