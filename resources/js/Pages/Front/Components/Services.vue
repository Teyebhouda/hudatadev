```vue
<template>
  <section
    id="services-section"
    ref="sectionRef"
    class="relative overflow-hidden
           py-24 lg:py-32
           px-5 sm:px-8 lg:px-16
           bg-[#f7f8f9]"
  >

    <!-- ================================================= -->
    <!-- BACKGROUND -->
    <!-- ================================================= -->

    <div
      class="absolute inset-0
             bg-gradient-to-b
             from-[#f7f8f9]
             via-[#f4f6f7]
             to-[#eef0f1]
             pointer-events-none"
    ></div>


    <!-- Background word -->

    <div class="section-bg-word">
      Services
    </div>


    <!-- Soft glow -->

    <div
      class="absolute
             -top-40
             left-1/2
             -translate-x-1/2
             w-[650px]
             h-[450px]
             rounded-full
             bg-[radial-gradient(circle,rgba(201,143,96,0.10)_0%,transparent_70%)]
             blur-[90px]
             pointer-events-none"
    ></div>


    <div
      class="absolute
             right-[-200px]
             bottom-[-200px]
             w-[500px]
             h-[500px]
             rounded-full
             bg-[radial-gradient(circle,rgba(63,83,96,0.06)_0%,transparent_70%)]
             blur-[90px]
             pointer-events-none"
    ></div>


    <!-- ================================================= -->
    <!-- HEADER -->
    <!-- ================================================= -->

    <div
      class="relative z-10
             max-w-4xl
             mx-auto
             text-center
             mb-14 lg:mb-20"
    >

      <!-- Badge -->

      <div
        class="section-reveal
               inline-flex
               items-center
               gap-2
               px-4 py-2
               rounded-full
               bg-white/70
               backdrop-blur-md
               border border-[#3f5360]/10
               shadow-sm
               text-[10px]
               sm:text-[11px]
               uppercase
               tracking-[0.18em]
               text-[#3f5360]/70"
        :class="{ 'is-visible': isVisible }"
      >

        <span
          class="w-2 h-2
                 rounded-full
                 bg-[#c98f60]
                 shadow-[0_0_10px_rgba(201,143,96,.4)]"
        ></span>

        Notre expertise

      </div>


      <!-- Title -->

      <h2
        class="section-reveal
               mt-6
               text-4xl
               sm:text-5xl
               lg:text-[4.2rem]
               font-extrabold
               leading-[1]
               tracking-[-0.045em]
               text-[#3f5360]"
        :class="{ 'is-visible': isVisible }"
        style="--delay: 100ms"
      >

        {{ content.title || "Nos services" }}

      </h2>


      <!-- Separator -->

      <div
        class="section-reveal
               mt-7
               flex
               items-center
               justify-center
               gap-3"
        :class="{ 'is-visible': isVisible }"
        style="--delay: 180ms"
      >

        <span
          class="w-20
                 h-[2px]
                 rounded-full
                 bg-[#c98f60]"
        ></span>

        <span
          class="w-2
                 h-2
                 rounded-full
                 bg-[#c98f60]"
        ></span>

        <span
          class="w-10
                 h-[2px]
                 rounded-full
                 bg-[#3f5360]/15"
        ></span>

      </div>


      <!-- Subtitle -->

      <p
        v-if="content.subtitle"
        class="section-reveal
               mt-6
               max-w-2xl
               mx-auto
               text-base
               sm:text-lg
               leading-relaxed
               text-[#5c6670]/80"
        :class="{ 'is-visible': isVisible }"
        style="--delay: 260ms"
      >

        {{ content.subtitle }}

      </p>

    </div>


    <!-- ================================================= -->
    <!-- SERVICES GRID -->
    <!-- ================================================= -->

    <div
      class="relative z-10
             max-w-7xl
             mx-auto
             grid
             lg:grid-cols-[1fr_1.15fr_1fr]
             gap-5
             lg:gap-6
             items-stretch"
    >


      <!-- ================================================= -->
      <!-- LEFT SERVICES -->
      <!-- ================================================= -->

      <div
        class="flex
               flex-col
               gap-5"
      >

        <article
          v-for="(service, index) in leftServices"
          :key="`left-${service.title}`"
          class="service-card"
          :class="{ 'is-visible': isVisible }"
          :style="{
            '--delay': `${300 + index * 120}ms`
          }"
        >

          <!-- Number -->

          <div
            class="service-number"
          >
            0{{ index + 1 }}
          </div>


          <!-- Icon -->

          <div class="service-number-large">
  0{{ index + 1 }}
</div>


          <!-- Content -->

          <div class="flex-1">

            <h3>
              {{ service.title }}
            </h3>

            <p>
              {{ service.description }}
            </p>

          </div>


          <!-- Arrow -->

          <div
            class="service-arrow"
          >

            <Icon
              icon="mdi:arrow-top-right"
              class="text-sm"
            />

          </div>

        </article>

      </div>


      <!-- ================================================= -->
      <!-- CENTER FEATURED -->
      <!-- ================================================= -->

      <div
        class="featured-card"
        :class="{ 'is-visible': isVisible }"
        style="--delay: 420ms"
      >

        <!-- Decorative circle -->

        <div class="featured-orbit"></div>


        <!-- Icon -->

      


        <!-- Small label -->

        <span
          class="inline-flex
                 items-center
                 gap-2
                 text-[10px]
                 uppercase
                 tracking-[0.2em]
                 font-semibold
                 text-[#c98f60]"
        >

          <span
            class="w-1.5
                   h-1.5
                   rounded-full
                   bg-[#c98f60]"
          ></span>

          HUDATA DEV

        </span>


        <!-- Title -->

        <h3
          class="mt-5
                 text-2xl
                 sm:text-3xl
                 font-extrabold
                 leading-tight
                 tracking-[-0.03em]
                 text-[#3f5360]"
        >

          Des solutions pensées
          <span class="text-[#c98f60]">
            pour durer.
          </span>

        </h3>


        <!-- Description -->

        <p
          class="mt-5
                 text-sm
                 sm:text-base
                 leading-relaxed
                 text-[#5c6670]/80"
        >

          {{ content.description ||
            "Nous concevons des solutions digitales modernes, performantes et évolutives, adaptées aux besoins réels de chaque entreprise."
          }}

        </p>


        <!-- Features -->

        <div
          class="mt-7
                 space-y-3
                 text-left"
        >

          <div
            v-for="item in featuredPoints"
            :key="item"
            class="flex
                   items-center
                   gap-3
                   text-sm
                   text-[#5c6670]"
          >

            <span
              class="flex
                     items-center
                     justify-center
                     w-5
                     h-5
                     rounded-full
                     bg-[#c98f60]/10
                     text-[#c98f60]"
            >

              <Icon
                icon="mdi:check"
                class="text-xs"
              />

            </span>

            {{ item }}

          </div>

        </div>


        <!-- CTA -->

        <a
          href="#contact-form"
          class="group
                 mt-8
                 w-full
                 inline-flex
                 items-center
                 justify-center
                 gap-3
                 px-6
                 py-3.5
                 rounded-full
                 bg-[#3f5360]
                 text-white
                 text-sm
                 font-semibold
                 shadow-lg
                 shadow-[#3f5360]/10
                 hover:bg-[#c98f60]
                 hover:-translate-y-0.5
                 hover:shadow-xl
                 transition-all
                 duration-300"
        >

          <span>
            Discutons de votre projet
          </span>

          <span
            class="w-7
                   h-7
                   flex
                   items-center
                   justify-center
                   rounded-full
                   bg-white/10"
          >

            <Icon
              icon="mdi:arrow-right"
              class="text-sm
                     transition-transform
                     duration-300
                     group-hover:translate-x-1"
            />

          </span>

        </a>

      </div>


      <!-- ================================================= -->
      <!-- RIGHT SERVICES -->
      <!-- ================================================= -->

      <div
        class="flex
               flex-col
               gap-5"
      >

        <article
          v-for="(service, index) in rightServices"
          :key="`right-${service.title}`"
          class="service-card"
          :class="{ 'is-visible': isVisible }"
          :style="{
            '--delay': `${540 + index * 120}ms`
          }"
        >

          <!-- Number -->

          <div
            class="service-number"
          >
            0{{ index + leftServices.length + 1 }}
          </div>


          <!-- Icon -->

        <div class="service-number-large">
  0{{ index + leftServices.length + 1 }}
</div>


          <!-- Content -->

          <div class="flex-1">

            <h3>
              {{ service.title }}
            </h3>

            <p>
              {{ service.description }}
            </p>

          </div>


          <!-- Arrow -->

          <div
            class="service-arrow"
          >

            <Icon
              icon="mdi:arrow-top-right"
              class="text-sm"
            />

          </div>

        </article>

      </div>

    </div>


    <!-- ================================================= -->
    <!-- BOTTOM TAGS -->
    <!-- ================================================= -->

    <div
      class="relative z-10
             mt-14
             flex
             flex-wrap
             justify-center
             items-center
             gap-x-5
             gap-y-3
             text-[10px]
             sm:text-[11px]
             uppercase
             tracking-[0.18em]
             text-[#3f5360]/40"
    >

      <span>Web</span>

      <span class="dot"></span>

      <span>Mobile</span>

      <span class="dot"></span>

      <span>UI / UX</span>

      <span class="dot"></span>

      <span>API</span>

      <span class="dot"></span>

      <span>Architecture</span>

    </div>

  </section>
</template>


<script setup>

import {
  computed,
  ref,
  onMounted,
  onBeforeUnmount
} from "vue"



/*
|--------------------------------------------------------------------------
| PROPS
|--------------------------------------------------------------------------
*/

const props = defineProps({

  content: {

    type: Object,

    default: () => ({

      title: "Nos services",

      subtitle:
        "Une expertise technique au service de vos ambitions.",

      description:
        "Nous concevons des solutions digitales modernes, performantes et évolutives, adaptées aux besoins réels de chaque entreprise.",

      items: [

        {
          title: "Développement Web",

          description:
            "Applications modernes avec Vue.js, Laravel et TailwindCSS.",

          long_description:
            "Des solutions performantes, maintenables et évolutives.",

          icon:
            "mdi:code-tags",
        },

        {
          title: "Applications Mobiles",

          description:
            "Développement cross-platform fluide et intuitif.",

          long_description:
            "Une expérience utilisateur homogène sur tous les appareils.",

          icon:
            "mdi:cellphone-link",
        },

        {
          title: "Design UI/UX",

          description:
            "Création d’interfaces esthétiques et centrées sur l’utilisateur.",

          long_description:
            "Conjuguer clarté, efficacité et identité visuelle.",

          icon:
            "mdi:palette-outline",
        },

        {
          title: "Architecture & Optimisation",

          description:
            "Conception logicielle et optimisation des performances.",

          long_description:
            "Robustesse, scalabilité et efficacité du code.",

          icon:
            "mdi:cogs",
        },

      ],

    }),

  },

})


/*
|--------------------------------------------------------------------------
| STATE
|--------------------------------------------------------------------------
*/

const sectionRef = ref(null)

const isVisible = ref(false)

let observer = null


/*
|--------------------------------------------------------------------------
| SERVICES
|--------------------------------------------------------------------------
*/

const services = computed(() => {

  return props.content?.items || []

})


const leftServices = computed(() => {

  const middle =
    Math.ceil(services.value.length / 2)

  return services.value.slice(
    0,
    middle
  )

})


const rightServices = computed(() => {

  const middle =
    Math.ceil(services.value.length / 2)

  return services.value.slice(
    middle
  )

})


/*
|--------------------------------------------------------------------------
| FEATURED POINTS
|--------------------------------------------------------------------------
*/

const featuredPoints = computed(() => [

  "Architecture moderne et évolutive",

  "Interface pensée pour l'utilisateur",

  "Code propre et maintenable",

  "Performance et sécurité",

])


/*
|--------------------------------------------------------------------------
| INTERSECTION OBSERVER
|--------------------------------------------------------------------------
*/

onMounted(() => {

  if (!sectionRef.value) {
    return
  }


  if ("IntersectionObserver" in window) {

    observer =
      new IntersectionObserver(

        (entries) => {

          entries.forEach((entry) => {

            if (entry.isIntersecting) {

              isVisible.value = true

              observer?.disconnect()

            }

          })

        },

        {
          threshold: 0.12
        }

      )


    observer.observe(
      sectionRef.value
    )

  } else {

    isVisible.value = true

  }

})


onBeforeUnmount(() => {

  observer?.disconnect()

})

</script>


<style scoped>

/* ========================================================= */
/* BACKGROUND WORD */
/* ========================================================= */

.section-bg-word {

  position: absolute;

  left: 50%;

  top: 6%;

  transform:
    translateX(-50%);

  font-size:
    clamp(5rem, 13vw, 11rem);

  line-height: 1;

  font-weight: 800;

  letter-spacing:
    0.04em;

  color:
    rgba(63,83,96,.035);

  white-space:
    nowrap;

  pointer-events:
    none;

  user-select:
    none;

}


/* ========================================================= */
/* REVEAL */
/* ========================================================= */

.section-reveal {

  opacity: 0;

  transform:
    translateY(25px);

  transition:
    opacity .8s ease var(--delay),
    transform .8s cubic-bezier(.22,1,.36,1) var(--delay);

}


.section-reveal.is-visible {

  opacity: 1;

  transform:
    translateY(0);

}


/* ========================================================= */
/* SERVICE CARD */
/* ========================================================= */

.service-card {

  position: relative;

  display: flex;

  align-items: center;

  gap: 14px;

  min-height: 145px;

  padding: 22px;

  border-radius:
    22px;

  background:
    rgba(255,255,255,.70);

  border:
    1px solid
    rgba(255,255,255,.85);

  backdrop-filter:
    blur(18px);

  -webkit-backdrop-filter:
    blur(18px);

  box-shadow:
    0 10px 35px
    rgba(63,83,96,.045);

  opacity: 0;

  transform:
    translateY(30px);

  transition:
    opacity .7s ease var(--delay),
    transform .7s cubic-bezier(.22,1,.36,1) var(--delay),
    box-shadow .4s ease,
    border-color .4s ease;

}


.service-card.is-visible {

  opacity: 1;

  transform:
    translateY(0);

}


.service-card:hover {

  transform:
    translateY(-6px);

  border-color:
    rgba(201,143,96,.18);

  box-shadow:
    0 24px 50px
    rgba(63,83,96,.10);

}


/* ========================================================= */
/* NUMBER */
/* ========================================================= */

.service-number {

  position: absolute;

  top: 12px;

  right: 17px;

  font-size:
    9px;

  font-weight:
    700;

  letter-spacing:
    .15em;

  color:
    rgba(63,83,96,.20);

}


/* ========================================================= */
/* ICON */
/* ========================================================= */

.icon-box {

  width:
    48px;

  height:
    48px;

  flex-shrink:
    0;

  display:
    flex;

  align-items:
    center;

  justify-content:
    center;

  border-radius:
    14px;

  background:
    rgba(201,143,96,.10);

  color:
    #c98f60;

  transition:
    all .35s ease;

}


.service-card:hover .icon-box {

  background:
    #c98f60;

  color:
    white;

  transform:
    rotate(-4deg)
    scale(1.05);

}


/* ========================================================= */
/* SERVICE TEXT */
/* ========================================================= */

.service-card h3 {

  font-size:
    15px;

  font-weight:
    800;

  color:
    #3f5360;

  line-height:
    1.3;

}


.service-card p {

  margin-top:
    5px;

  font-size:
    12px;

  line-height:
    1.6;

  color:
    rgba(92,102,112,.78);

}


/* ========================================================= */
/* ARROW */
/* ========================================================= */

.service-arrow {

  width:
    28px;

  height:
    28px;

  flex-shrink:
    0;

  display:
    flex;

  align-items:
    center;

  justify-content:
    center;

  border-radius:
    50%;

  background:
    rgba(63,83,96,.05);

  color:
    rgba(63,83,96,.45);

  transition:
    all .35s ease;

}


.service-card:hover .service-arrow {

  background:
    rgba(201,143,96,.12);

  color:
    #c98f60;

  transform:
    translate(2px,-2px);

}


/* ========================================================= */
/* FEATURED CARD */
/* ========================================================= */

.featured-card {

  position:
    relative;

  overflow:
    hidden;

  display:
    flex;

  flex-direction:
    column;

  justify-content:
    center;

  padding:
    40px 32px;

  min-height:
    100%;

  text-align:
    center;

  border-radius:
    30px;

  background:
    linear-gradient(
      145deg,
      rgba(255,255,255,.92),
      rgba(246,247,248,.82)
    );

  border:
    1px solid
    rgba(255,255,255,.95);

  backdrop-filter:
    blur(20px);

  -webkit-backdrop-filter:
    blur(20px);

  box-shadow:
    0 25px 70px
    rgba(63,83,96,.08),
    0 8px 30px
    rgba(201,143,96,.06);

  opacity:
    0;

  transform:
    translateY(35px);

  transition:
    opacity .8s ease var(--delay),
    transform .8s cubic-bezier(.22,1,.36,1) var(--delay),
    box-shadow .4s ease;

}


.featured-card.is-visible {

  opacity:
    1;

  transform:
    translateY(0);

}


.featured-card:hover {

  transform:
    translateY(-7px);

  box-shadow:
    0 35px 80px
    rgba(63,83,96,.12),
    0 12px 35px
    rgba(201,143,96,.08);

}


/* ========================================================= */
/* FEATURED ICON */
/* ========================================================= */

.featured-icon {

  position:
    relative;

  z-index:
    2;

  width:
    76px;

  height:
    76px;

  margin:
    0 auto 22px;

  display:
    flex;

  align-items:
    center;

  justify-content:
    center;

  border-radius:
    22px;

  background:
    linear-gradient(
      145deg,
      rgba(201,143,96,.18),
      rgba(201,143,96,.07)
    );

  color:
    #c98f60;

  box-shadow:
    inset 0 0 0 1px
    rgba(201,143,96,.08);

}


/* ========================================================= */
/* FEATURED ORBIT */
/* ========================================================= */

.featured-orbit {

  position:
    absolute;

  left:
    50%;

  top:
    40px;

  width:
    210px;

  height:
    210px;

  transform:
    translateX(-50%);

  border:
    1px solid
    rgba(201,143,96,.07);

  border-radius:
    50%;

  pointer-events:
    none;

}


.featured-orbit::after {

  content:
    "";

  position:
    absolute;

  inset:
    25px;

  border:
    1px solid
    rgba(63,83,96,.04);

  border-radius:
    50%;

}


/* ========================================================= */
/* DOTS */
/* ========================================================= */

.dot {

  width:
    4px;

  height:
    4px;

  border-radius:
    50%;

  background:
    #c98f60;

}


/* ========================================================= */
/* MOBILE */
/* ========================================================= */

@media (max-width: 1023px) {

  .featured-card {

    order:
      -1;

    min-height:
      auto;

  }

}


@media (max-width: 640px) {

  .section-bg-word {

    top:
      4%;

    font-size:
      5rem;

  }


  .service-card {

    min-height:
      125px;

    padding:
      18px;

  }


  .featured-card {

    padding:
      34px 24px;

    border-radius:
      26px;

  }


  .featured-orbit {

    width:
      170px;

    height:
      170px;

  }

}


/* ========================================================= */
/* REDUCED MOTION */
/* ========================================================= */

@media (prefers-reduced-motion: reduce) {

  .section-reveal,
  .service-card,
  .featured-card {

    opacity:
      1;

    transform:
      none;

    transition:
      none;

  }

}

.service-number-large {
  width: 46px;
  height: 46px;
  flex-shrink: 0;

  display: flex;
  align-items: center;
  justify-content: center;

  border-radius: 14px;

  background: rgba(201, 143, 96, 0.08);

  color: #c98f60;

  font-size: 12px;
  font-weight: 800;

  letter-spacing: 0.08em;

  transition: all 0.35s ease;
}

.service-card:hover .service-number-large {
  background: #c98f60;
  color: white;

  transform: scale(1.05);
}

</style>

