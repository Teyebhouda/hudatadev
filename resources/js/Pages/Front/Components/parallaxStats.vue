
<template>
  <section
    id="about-stats"
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


    <!-- Large background word -->

    <div class="section-bg-word">
      Values
    </div>


    <!-- Soft orange glow -->

    <div
      class="absolute
             -left-40
             top-1/3
             w-[450px]
             h-[450px]
             rounded-full
             bg-[radial-gradient(circle,rgba(201,143,96,0.10)_0%,transparent_70%)]
             blur-[80px]
             pointer-events-none"
    ></div>


    <div
      class="absolute
             -right-40
             bottom-0
             w-[500px]
             h-[500px]
             rounded-full
             bg-[radial-gradient(circle,rgba(63,83,96,0.06)_0%,transparent_70%)]
             blur-[90px]
             pointer-events-none"
    ></div>


    <!-- ================================================= -->
    <!-- CONTENT -->
    <!-- ================================================= -->

    <div
      class="relative z-10
             max-w-7xl
             mx-auto"
    >

      <div
  class="grid
         grid-cols-1
         sm:grid-cols-2
         gap-4
         lg:gap-5"
>


        <!-- ================================================= -->
        <!-- LEFT CONTENT -->
        <!-- ================================================= -->

        <div
          class="section-content"
          :class="{ 'is-visible': isVisible }"
        >

          <!-- Badge -->

          <div
            class="inline-flex
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
                   tracking-[0.16em]
                   text-[#3f5360]/70"
          >

            <span
              class="w-2
                     h-2
                     rounded-full
                     bg-[#c98f60]
                     shadow-[0_0_8px_rgba(201,143,96,.4)]"
            ></span>

            Notre engagement

          </div>


          <!-- Title -->

          <h2
            class="mt-6
                   text-4xl
                   sm:text-5xl
                   lg:text-[4.2rem]
                   font-extrabold
                   leading-[1.02]
                   tracking-[-0.04em]
                   text-[#3f5360]"
          >

            {{ content.title || "Notre priorité" }}

          </h2>


          <!-- Separator -->

          <div
            class="mt-7
                   flex
                   items-center
                   gap-3"
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


          <!-- Description -->

          <p
            class="mt-7
                   max-w-xl
                   text-base
                   sm:text-lg
                   leading-relaxed
                   text-[#5c6670]/90"
          >

            {{ content.description }}

          </p>


          <!-- Small values -->

          <div
            class="mt-8
                   flex
                   flex-wrap
                   gap-x-6
                   gap-y-3
                   text-[11px]
                   uppercase
                   tracking-[0.16em]
                   text-[#3f5360]/45"
          >

            <span class="flex items-center gap-2">

              <span
                class="w-1.5 h-1.5
                       rounded-full
                       bg-[#c98f60]"
              ></span>

              Qualité

            </span>

            <span class="flex items-center gap-2">

              <span
                class="w-1.5 h-1.5
                       rounded-full
                       bg-[#c98f60]"
              ></span>

              Fiabilité

            </span>

            <span class="flex items-center gap-2">

              <span
                class="w-1.5 h-1.5
                       rounded-full
                       bg-[#c98f60]"
              ></span>

              Innovation

            </span>

          </div>


          <!-- CTA -->

          <div
            v-if="content.cta"
            class="mt-10"
          >

            <a
              :href="content.cta.href"
              class="group
                     inline-flex
                     items-center
                     gap-3
                     px-7
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
                {{ content.cta.label }}
              </span>

              <span
                class="w-7
                       h-7
                       rounded-full
                       bg-white/10
                       flex
                       items-center
                       justify-center"
              >

                <i
                  class="fas fa-arrow-right
                         text-[9px]
                         transition-transform
                         duration-300
                         group-hover:translate-x-1"
                ></i>

              </span>

            </a>

          </div>

        </div>


        <!-- ================================================= -->
        <!-- RIGHT STATS -->
        <!-- ================================================= -->

        <div
          class="grid
                 sm:grid-cols-2
                 gap-5
                 lg:gap-6"
        >

          <div
            v-for="(stat, index) in content.stats"
            :key="index"
            class="stat-card group"
            :class="{ 'is-visible': isVisible }"
            :style="{
              '--delay': `${index * 120}ms`
            }"
          >

            <!-- Top line -->

            <div
              class="flex
                     items-center
                     justify-between
                     mb-8"
            >

              <span
                class="flex
                       items-center
                       justify-center
                       w-10
                       h-10
                       rounded-xl
                       bg-[#3f5360]/[0.05]
                       text-[#3f5360]
                       transition-all
                       duration-300
                       group-hover:bg-[#c98f60]
                       group-hover:text-white"
              >

                <i
                  :class="[
                    index === 0
                      ? 'fas fa-users'
                      : index === 1
                      ? 'fas fa-award'
                      : index === 2
                      ? 'fas fa-code'
                      : 'fas fa-chart-line'
                  ]"
                  class="text-sm"
                ></i>

              </span>


              <span
                class="text-[10px]
                       uppercase
                       tracking-[0.2em]
                       text-[#3f5360]/30"
              >
                0{{ index + 1 }}
              </span>

            </div>


            <!-- Number -->

            <div
              class="flex
                     items-baseline
                     gap-1"
            >

              <span
                ref="statRefs"
                class="text-5xl
                       sm:text-6xl
                       font-extrabold
                       tracking-[-0.05em]
                       text-[#3f5360]"
              >
                0
              </span>

              <span
                class="text-2xl
                       font-bold
                       text-[#c98f60]"
              >
                +
              </span>

            </div>


            <!-- Label -->

            <h3
              class="mt-3
                     text-sm
                     font-bold
                     uppercase
                     tracking-[0.08em]
                     text-[#c98f60]"
            >

              {{ stat.label }}

            </h3>


            <!-- Description -->

            <p
              class="mt-3
                     text-sm
                     leading-relaxed
                     text-[#5c6670]/75"
            >

              {{ stat.long_description }}

            </p>


            <!-- Bottom decoration -->

            <div
              class="mt-7
                     h-px
                     w-full
                     bg-[#3f5360]/[0.07]
                     overflow-hidden"
            >

              <div
                class="h-full
                       w-0
                       bg-[#c98f60]
                       transition-all
                       duration-1000
                       ease-out
                       group-hover:w-full"
              ></div>

            </div>

          </div>

        </div>

      </div>

    </div>


    <!-- ================================================= -->
    <!-- BOTTOM DECORATION -->
    <!-- ================================================= -->

    <div
      class="absolute
             bottom-0
             left-1/2
             -translate-x-1/2
             w-32
             h-px
             bg-gradient-to-r
             from-transparent
             via-[#c98f60]/40
             to-transparent"
    ></div>

  </section>
</template>


<script setup>

import {
  ref,
  onMounted,
  onBeforeUnmount,
  nextTick
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

      title: "Notre priorité",

      description:
        "La satisfaction de nos clients est au cœur de notre mission.",

      stats: [

        {
          value: 100,
          label: "Clients satisfaits",
          long_description:
            "Chaque client est unique et nous mettons tout en œuvre pour répondre à ses attentes.",
        },

        {
          value: 5,
          label: "Années d’expérience",
          long_description:
            "Notre expertise nous permet de garantir qualité et fiabilité.",
        },

      ],

      image: "",

      image_alt: "",

      cta: {
        label: "Contactez-nous",
        href: "#contact-form"
      },

    }),

  },

})


/*
|--------------------------------------------------------------------------
| STATE
|--------------------------------------------------------------------------
*/

const sectionRef = ref(null)

const statRefs = ref([])

const isVisible = ref(false)

let observer = null


/*
|--------------------------------------------------------------------------
| NUMBER ANIMATION
|--------------------------------------------------------------------------
*/

const animateNumber = (
  element,
  target,
  duration = 1300
) => {

  const start = performance.now()

  const update = (time) => {

    const progress = Math.min(
      (time - start) / duration,
      1
    )

    /*
     * Smooth ease-out
     */

    const eased =
      1 - Math.pow(1 - progress, 3)

    const current =
      Math.floor(eased * target)

    element.textContent =
      current.toLocaleString("fr-FR")

    if (progress < 1) {

      requestAnimationFrame(update)

    } else {

      element.textContent =
        target.toLocaleString("fr-FR")

    }

  }

  requestAnimationFrame(update)

}


/*
|--------------------------------------------------------------------------
| START ANIMATION
|--------------------------------------------------------------------------
*/

const startAnimations = () => {

  if (isVisible.value) {
    return
  }

  isVisible.value = true

  nextTick(() => {

    statRefs.value.forEach(
      (element, index) => {

        const target =
          parseInt(
            props.content.stats[index]?.value ?? 0,
            10
          )

        animateNumber(
          element,
          target,
          1200 + index * 150
        )

      }
    )

  })

}


/*
|--------------------------------------------------------------------------
| LIFECYCLE
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

          entries.forEach(
            (entry) => {

              if (entry.isIntersecting) {

                startAnimations()

                observer?.disconnect()

              }

            }
          )

        },

        {
          threshold: 0.2
        }

      )


    observer.observe(
      sectionRef.value
    )

  } else {

    startAnimations()

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
    rgba(63, 83, 96, 0.035);

  white-space:
    nowrap;

  pointer-events:
    none;

  user-select:
    none;

}


/* ========================================================= */
/* LEFT CONTENT REVEAL */
/* ========================================================= */

.section-content {

  opacity: 0;

  transform:
    translateY(25px);

  transition:
    opacity .8s ease,
    transform .8s cubic-bezier(.22,1,.36,1);

}

.section-content.is-visible {

  opacity: 1;

  transform:
    translateY(0);

}


/* ========================================================= */
/* STAT CARD */
/* ========================================================= */

/* ========================================================= */
/* STAT CARD */
/* ========================================================= */

.stat-card {

  position: relative;

  padding: 1.35rem;

  min-height: 210px;

  border-radius: 1.25rem;

  background:
    rgba(255,255,255,.72);

  border:
    1px solid
    rgba(255,255,255,.8);

  backdrop-filter:
    blur(18px);

  -webkit-backdrop-filter:
    blur(18px);

  box-shadow:
    0 8px 28px
    rgba(63,83,96,.045);

  opacity: 0;

  transform:
    translateY(24px);

  transition:
    opacity .7s ease var(--delay),
    transform .7s cubic-bezier(.22,1,.36,1) var(--delay),
    box-shadow .4s ease,
    border-color .4s ease;

}


/* ========================================================= */
/* STAT CARD VISIBLE */
/* ========================================================= */

.stat-card.is-visible {

  opacity: 1;

  transform:
    translateY(0);

}


/* ========================================================= */
/* STAT CARD HOVER */
/* ========================================================= */

.stat-card:hover {

  box-shadow:
    0 20px 45px
    rgba(63,83,96,.09);

  border-color:
    rgba(201,143,96,.18);

  transform:
    translateY(-5px);

}


/* ========================================================= */
/* STAT CARD TOP */
/* ========================================================= */

.stat-card > div:first-child {

  margin-bottom:
    1.15rem;

}


/* ========================================================= */
/* STAT ICON */
/* ========================================================= */

.stat-card .w-10 {

  width:
    2.25rem;

  height:
    2.25rem;

  border-radius:
    .7rem;

}


/* ========================================================= */
/* STAT NUMBER */
/* ========================================================= */

.stat-card .text-5xl {

  font-size:
    2.7rem;

  line-height:
    1;

}


/* ========================================================= */
/* STAT PLUS */
/* ========================================================= */

.stat-card .text-2xl {

  font-size:
    1.25rem;

}


/* ========================================================= */
/* STAT TITLE */
/* ========================================================= */

.stat-card h3 {

  margin-top:
    .6rem;

  font-size:
    .7rem;

}


/* ========================================================= */
/* STAT DESCRIPTION */
/* ========================================================= */

.stat-card p {

  margin-top:
    .55rem;

  font-size:
    .8rem;

  line-height:
    1.55;

}


/* ========================================================= */
/* BOTTOM LINE */
/* ========================================================= */

.stat-card > div:last-child {

  margin-top:
    1.15rem;

}





/* ========================================================= */
/* MOBILE */
/* ========================================================= */

@media (max-width: 640px) {

  .section-bg-word {

    top: 4%;

    font-size:
      5rem;

  }

  .stat-card {

    min-height: auto;
 padding:
      1.25rem;
  }

}


/* ========================================================= */
/* REDUCED MOTION */
/* ========================================================= */

@media (prefers-reduced-motion: reduce) {

  .section-content,
  .stat-card {

    opacity: 1;

    transform: none;

    transition: none;

  }

}

</style>

