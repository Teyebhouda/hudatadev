<template>
  <section
    id="hero"
    ref="heroSection"
    class="relative
           min-h-[100svh]
           flex items-center justify-center
           text-center
           px-5 sm:px-6
           pt-[125px]
           pb-24
           md:pt-[115px]
           md:pb-20
           lg:pt-[105px]
           lg:pb-16
           bg-gradient-to-b
           from-[#f8f9fa]
           via-[#f5f6f7]
           to-[#eef0f1]
           overflow-hidden"
  >

    <!-- ================================================= -->
    <!-- BACKGROUND -->
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

    <div
      class="hero-bg-word"
      aria-hidden="true"
    >
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
             opacity-[0.025]
             sm:opacity-[0.03]
             lg:opacity-[0.035]
             pointer-events-none"
      aria-hidden="true"
    ></div>


    <!-- ================================================= -->
    <!-- TOP LIGHT -->
    <!-- ================================================= -->

    <div
      class="absolute
             -top-40
             left-1/2
             -translate-x-1/2
             w-[600px]
             h-[380px]
             rounded-full
             bg-[radial-gradient(ellipse,rgba(255,255,255,0.95)_0%,transparent_70%)]
             blur-3xl
             pointer-events-none"
      aria-hidden="true"
    ></div>


    <!-- ================================================= -->
    <!-- CENTRAL ORANGE GLOW -->
    <!-- ================================================= -->

    <div
      class="absolute
             left-1/2
             top-[52%]
             -translate-x-1/2
             -translate-y-1/2
             w-[560px]
             md:w-[820px]
             h-[560px]
             md:h-[820px]
             rounded-full
             bg-[radial-gradient(circle,rgba(201,143,96,0.13)_0%,rgba(201,143,96,0.05)_35%,transparent_70%)]
             blur-[90px]
             pointer-events-none"
      aria-hidden="true"
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
             w-[360px]
             h-[360px]
             sm:w-[480px]
             sm:h-[480px]
             md:w-[600px]
             md:h-[600px]
             rounded-full
             border border-[#3f5360]/[0.035]
             pointer-events-none"
      aria-hidden="true"
    ></div>


    <div
      class="absolute
             left-1/2
             top-1/2
             -translate-x-1/2
             -translate-y-1/2
             w-[240px]
             h-[240px]
             sm:w-[320px]
             sm:h-[320px]
             md:w-[420px]
             md:h-[420px]
             rounded-full
             border border-[#c98f60]/[0.07]
             pointer-events-none"
      aria-hidden="true"
    ></div>


    <!-- ================================================= -->
    <!-- DECORATIVE DOTS -->
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
      aria-hidden="true"
    ></div>

    <div
      class="absolute
             top-[38%]
             right-[10%]
             w-1.5
             h-1.5
             rounded-full
             bg-[#3f5360]/20"
      aria-hidden="true"
    ></div>

    <div
      class="absolute
             bottom-[22%]
             left-[14%]
             w-1
             h-1
             rounded-full
             bg-[#c98f60]/50"
      aria-hidden="true"
    ></div>


    <!-- ================================================= -->
    <!-- MAIN CONTENT -->
    <!-- ================================================= -->

    <div
      class="relative z-10
             w-full
             max-w-4xl
             mx-auto
             text-center
             flex
             flex-col
             items-center
             translate-y-5
             sm:translate-y-4
             md:translate-y-3"
    >

      <!-- ================================================= -->
      <!-- TITLE -->
      <!-- ================================================= -->

      <h1
        class="hero-item
               hero-title
               text-[clamp(2.35rem,8vw,4.9rem)]
               font-extrabold
               leading-[0.98]
               tracking-[-0.045em]
               text-[#3f5360]"
      >

        <span
          class="text-[#c98f60]"
        >
          HuData
        </span>

        <span
          class="block
                 sm:inline
                 sm:ml-3"
        >
          Développement
        </span>

      </h1>


      <!-- ================================================= -->
      <!-- DECORATIVE LINE -->
      <!-- ================================================= -->

      <div
        class="hero-item
               hero-line
               mt-6
               sm:mt-7
               flex
               items-center
               justify-center
               gap-3"
        aria-hidden="true"
      >

        <span
          class="w-12
                 sm:w-20
                 md:w-24
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
          class="w-7
                 sm:w-10
                 md:w-12
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
               hero-subtitle
               mt-6
               md:mt-7
               max-w-3xl
               mx-auto
               px-2
               text-[17px]
               sm:text-xl
               md:text-[25px]
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
               hero-description
               mt-4
               max-w-2xl
               mx-auto
               px-3
               text-[13px]
               sm:text-[15px]
               md:text-base
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
               hero-buttons
               mt-7
               md:mt-8
               flex
               flex-col
               sm:flex-row
               items-center
               justify-center
               gap-3
               sm:gap-4
               w-full"
      >

        <!-- PROJECTS -->

        <a
          href="#projects-section"
          class="group
                 w-full
                 sm:w-auto
                 min-w-[190px]
                 inline-flex
                 items-center
                 justify-center
                 gap-2
                 px-6
                 py-3
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
                 transition-all
                 duration-300"
        >

          <span>
            Voir nos projets
          </span>

          <i
            class="fas fa-arrow-down
                   text-[9px]
                   transition-transform
                   duration-300
                   group-hover:translate-y-1"
            aria-hidden="true"
          ></i>

        </a>


        <!-- CONTACT -->

        <a
          href="#contact-form"
          class="group
                 w-full
                 sm:w-auto
                 min-w-[190px]
                 inline-flex
                 items-center
                 justify-center
                 gap-2
                 px-6
                 py-3
                 rounded-full
                 bg-[#c98f60]
                 text-white
                 text-sm
                 font-semibold
                 shadow-[0_12px_30px_rgba(201,143,96,0.22)]
                 hover:bg-[#b7794f]
                 hover:-translate-y-1
                 hover:shadow-[0_16px_35px_rgba(201,143,96,0.28)]
                 transition-all
                 duration-300"
        >

          <span>
            Nous contacter
          </span>

          <i
            class="fas fa-arrow-right
                   text-[9px]
                   transition-transform
                   duration-300
                   group-hover:translate-x-1"
            aria-hidden="true"
          ></i>

        </a>

      </div>


      <!-- ================================================= -->
      <!-- EXPERTISE -->
      <!-- ================================================= -->

      <div
        class="hero-item
               hero-expertise
               mt-9
               md:mt-10
               px-2
               flex
               flex-wrap
               items-center
               justify-center
               gap-x-3
               sm:gap-x-4
               gap-y-2
               text-[9px]
               sm:text-[10px]
               md:text-[11px]
               uppercase
               tracking-[0.16em]
               sm:tracking-[0.18em]
               text-[#3f5360]/45"
      >

        <span>Web</span>

        <span
          class="w-1 h-1 rounded-full bg-[#c98f60]"
          aria-hidden="true"
        ></span>

        <span>Mobile</span>

        <span
          class="w-1 h-1 rounded-full bg-[#c98f60]"
          aria-hidden="true"
        ></span>

        <span>Full-Stack</span>

        <span
          class="w-1 h-1 rounded-full bg-[#c98f60]"
          aria-hidden="true"
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
             bottom-6
             md:bottom-7
             left-1/2
             -translate-x-1/2
             hidden
             md:flex
             flex-col
             items-center
             gap-2
             group"
      aria-label="Découvrir les services"
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

  top: 16%;

  transform:
    translateX(-50%);

  font-size:
    clamp(4.5rem, 12vw, 10rem);

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
/* HERO ITEM */
/* ========================================================= */

.hero-item {

  opacity: 0;

  transform:
    translateY(20px);

  animation:
    heroReveal
    .8s
    cubic-bezier(.22, 1, .36, 1)
    forwards;

}


/* ========================================================= */
/* STAGGER */
/* ========================================================= */

.hero-title {
  animation-delay: .10s;
}

.hero-line {
  animation-delay: .20s;
}

.hero-subtitle {
  animation-delay: .30s;
}

.hero-description {
  animation-delay: .40s;
}

.hero-buttons {
  animation-delay: .50s;
}

.hero-expertise {
  animation-delay: .60s;
}


/* ========================================================= */
/* REVEAL */
/* ========================================================= */

@keyframes heroReveal {

  0% {

    opacity: 0;

    transform:
      translateY(20px);

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

    opacity:
      0;

  }

  30% {

    opacity:
      1;

  }

  70% {

    opacity:
      1;

  }

  100% {

    transform:
      translateY(200%);

    opacity:
      0;

  }

}


/* ========================================================= */
/* MOBILE */
/* ========================================================= */

@media (max-width: 640px) {

  .hero-bg-word {

    top:
      22%;

    font-size:
      4.5rem;

  }

}


/* ========================================================= */
/* VERY SMALL MOBILE */
/* ========================================================= */

@media (max-width: 380px) {

  .hero-bg-word {

    top:
      24%;

    font-size:
      4rem;

  }

}


/* ========================================================= */
/* REDUCED MOTION */
/* ========================================================= */

@media (prefers-reduced-motion: reduce) {

  .hero-item {

    animation:
      none;

    opacity:
      1;

    transform:
      none;

  }

  .animate-scroll-line {

    animation:
      none;

  }

}

</style>