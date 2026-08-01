
<template>
  <section
    id="projects-section"
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
      Projets
    </div>


    <!-- Soft glow -->

    <div
      class="absolute
             left-1/2
             top-[35%]
             -translate-x-1/2
             -translate-y-1/2
             w-[750px]
             h-[600px]
             rounded-full
             bg-[radial-gradient(circle,rgba(201,143,96,0.10)_0%,transparent_70%)]
             blur-[100px]
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
          class="w-2
                 h-2
                 rounded-full
                 bg-[#c98f60]
                 shadow-[0_0_10px_rgba(201,143,96,.4)]"
        ></span>

        Notre savoir-faire

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

        {{ content.title || "Nos projets" }}

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


      <!-- Description -->

      <p
        v-if="content.description"
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

        {{ content.description }}

      </p>

    </div>


    <!-- ================================================= -->
    <!-- PROJECTS SWIPER -->
    <!-- ================================================= -->

    <div
      class="relative z-10
             max-w-[1500px]
             mx-auto"
    >

      <Swiper
        class="projects-swiper"
        effect="coverflow"
        :modules="modules"
        :grabCursor="true"
        :centeredSlides="true"
        slidesPerView="auto"
        :spaceBetween="28"
        :loop="content.items?.length > 2"
        :initialSlide="initialIndex"
        :speed="750"
        :coverflowEffect="{
          rotate: 0,
          stretch: 0,
          depth: 180,
          modifier: 1.15,
          slideShadows: false
        }"
        :pagination="{
          clickable: true,
          dynamicBullets: true
        }"
        :breakpoints="{
          640: {
            spaceBetween: 35
          },
          1024: {
            spaceBetween: 45
          }
        }"
      >

        <SwiperSlide
          v-for="(project, index) in content.items"
          :key="project.id || index"
          class="project-slide"
        >

          <!-- ================================================= -->
          <!-- IMAGE -->
          <!-- ================================================= -->

          <div class="image-wrapper">

            <img
              v-if="project.images?.length"
              :src="`/storage/${project.images[0].path}`"
              :alt="project.title"
              class="slide-image"
              loading="lazy"
            />

            <!-- fallback -->

            <div
              v-else
              class="image-placeholder"
            >

              <span>
                HUDATA DEV
              </span>

            </div>


            <!-- Image overlay -->

            <div class="image-overlay"></div>


            <!-- Project number -->

            <div class="project-number">
              {{ String(index + 1).padStart(2, "0") }}
            </div>


            <!-- Badge -->

            <div class="project-badge">

              <span></span>

              Projet

            </div>


            <!-- Hover icon -->

            <div class="image-action">

              <i class="fas fa-arrow-up-right-from-square"></i>

            </div>

          </div>


          <!-- ================================================= -->
          <!-- CONTENT -->
          <!-- ================================================= -->

          <div class="slide-content">

            <!-- Title -->

            <h3 class="project-title">
              {{ project.title }}
            </h3>


            <!-- Description -->

            <p
              v-if="project.description"
              class="project-description"
            >
              {{ project.description }}
            </p>


            <!-- Long description -->

            <p
              v-if="project.long_description"
              class="project-long-description"
            >
              {{ project.long_description }}
            </p>


            <!-- Bottom -->

            <div
              class="project-footer"
            >

              <span
                class="project-type"
              >
                Projet digital
              </span>


              <a
                v-if="project.link"
                :href="project.link"
                target="_blank"
                rel="noopener noreferrer"
                class="project-link"
              >

                <span>
                  Voir le projet
                </span>

                <span
                  class="project-link-icon"
                >

                  <i
                    class="fas fa-arrow-right"
                  ></i>

                </span>

              </a>

            </div>

          </div>

        </SwiperSlide>

      </Swiper>

    </div>


    <!-- ================================================= -->
    <!-- BOTTOM -->
    <!-- ================================================= -->

    <div
      class="relative z-10
             mt-10
             flex
             justify-center
             text-[10px]
             uppercase
             tracking-[0.2em]
             text-[#3f5360]/35"
    >

      <span class="flex items-center gap-2">

        <span
          class="w-1.5
                 h-1.5
                 rounded-full
                 bg-[#c98f60]"
        ></span>

        Faites glisser pour découvrir nos réalisations

      </span>

    </div>

  </section>
</template>


<script setup>

import {
  ref,
  computed,
  onMounted,
  onBeforeUnmount
} from "vue"

import {
  Swiper,
  SwiperSlide
} from "swiper/vue"

import {
  EffectCoverflow,
  Pagination
} from "swiper/modules"


import "swiper/css"
import "swiper/css/effect-coverflow"
import "swiper/css/pagination"


/*
|--------------------------------------------------------------------------
| PROPS
|--------------------------------------------------------------------------
*/

const props = defineProps({

  content: {

    type: Object,

    required: true

  }

})


/*
|--------------------------------------------------------------------------
| SWIPER
|--------------------------------------------------------------------------
*/

const modules = [
  EffectCoverflow,
  Pagination
]


const items = computed(() => {

  return props.content?.items || []

})


const initialIndex = computed(() => {

  if (!items.value.length) {
    return 0
  }

  return Math.floor(
    items.value.length / 2
  )

})


/*
|--------------------------------------------------------------------------
| SCROLL ANIMATION
|--------------------------------------------------------------------------
*/

const sectionRef = ref(null)

const isVisible = ref(false)

let observer = null


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

                isVisible.value = true

                observer?.disconnect()

              }

            }
          )

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

  top: 5%;

  transform:
    translateX(-50%);

  font-size:
    clamp(5rem, 13vw, 11rem);

  line-height:
    1;

  font-weight:
    800;

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

  opacity:
    0;

  transform:
    translateY(25px);

  transition:
    opacity .8s ease var(--delay),
    transform .8s cubic-bezier(.22,1,.36,1) var(--delay);

}


.section-reveal.is-visible {

  opacity:
    1;

  transform:
    translateY(0);

}


/* ========================================================= */
/* SWIPER */
/* ========================================================= */

.projects-swiper {

  width:
    100%;

  padding:
    15px
    20px
    70px;

}


/* ========================================================= */
/* PROJECT SLIDE */
/* ========================================================= */

.project-slide {

  width:
    420px;

  max-width:
    calc(100vw - 40px);

  overflow:
    hidden;

  border-radius:
    28px;

  background:
    rgba(255,255,255,.82);

  border:
    1px solid
    rgba(255,255,255,.9);

  backdrop-filter:
    blur(18px);

  -webkit-backdrop-filter:
    blur(18px);

  box-shadow:
    0 18px 50px
    rgba(63,83,96,.07);

  transition:
    opacity .5s ease,
    filter .5s ease,
    transform .5s ease,
    box-shadow .5s ease;

}


/* ========================================================= */
/* ACTIVE */
/* ========================================================= */

:global(.swiper-slide-active) {

  box-shadow:
    0 30px 70px
    rgba(63,83,96,.13);

}


/* ========================================================= */
/* INACTIVE */
/* ========================================================= */

:global(.swiper-slide:not(.swiper-slide-active)) {

  opacity:
    .55;

  filter:
    blur(.4px);

}


/* ========================================================= */
/* IMAGE */
/* ========================================================= */

.image-wrapper {

  position:
    relative;

  height:
    255px;

  overflow:
    hidden;

  background:
    #e8ebed;

}


.slide-image {

  width:
    100%;

  height:
    100%;

  object-fit:
    cover;

  transition:
    transform .8s cubic-bezier(.22,1,.36,1);

}


.project-slide:hover .slide-image {

  transform:
    scale(1.06);

}


/* ========================================================= */
/* PLACEHOLDER */
/* ========================================================= */

.image-placeholder {

  width:
    100%;

  height:
    100%;

  display:
    flex;

  align-items:
    center;

  justify-content:
    center;

  background:
    linear-gradient(
      145deg,
      #eef0f1,
      #dfe3e5
    );

  color:
    rgba(63,83,96,.35);

  font-size:
    12px;

  font-weight:
    800;

  letter-spacing:
    .2em;

}


/* ========================================================= */
/* IMAGE OVERLAY */
/* ========================================================= */

.image-overlay {

  position:
    absolute;

  inset:
    0;

  background:
    linear-gradient(
      to bottom,
      rgba(63,83,96,.02),
      transparent 45%,
      rgba(25,32,37,.35)
    );

  pointer-events:
    none;

}


/* ========================================================= */
/* PROJECT NUMBER */
/* ========================================================= */

.project-number {

  position:
    absolute;

  right:
    18px;

  top:
    17px;

  font-size:
    11px;

  font-weight:
    800;

  letter-spacing:
    .12em;

  color:
    white;

  opacity:
    .85;

}


/* ========================================================= */
/* BADGE */
/* ========================================================= */

.project-badge {

  position:
    absolute;

  left:
    18px;

  top:
    17px;

  display:
    inline-flex;

  align-items:
    center;

  gap:
    7px;

  padding:
    7px 11px;

  border-radius:
    999px;

  background:
    rgba(255,255,255,.86);

  backdrop-filter:
    blur(10px);

  color:
    #3f5360;

  font-size:
    10px;

  font-weight:
    700;

  text-transform:
    uppercase;

  letter-spacing:
    .12em;

}


.project-badge span {

  width:
    6px;

  height:
    6px;

  border-radius:
    50%;

  background:
    #c98f60;

}


/* ========================================================= */
/* IMAGE ACTION */
/* ========================================================= */

.image-action {

  position:
    absolute;

  right:
    18px;

  bottom:
    18px;

  width:
    38px;

  height:
    38px;

  display:
    flex;

  align-items:
    center;

  justify-content:
    center;

  border-radius:
    50%;

  background:
    rgba(255,255,255,.90);

  color:
    #3f5360;

  opacity:
    0;

  transform:
    translateY(8px);

  transition:
    all .35s ease;

}


.project-slide:hover .image-action {

  opacity:
    1;

  transform:
    translateY(0);

}


/* ========================================================= */
/* CONTENT */
/* ========================================================= */

.slide-content {

  padding:
    24px;

}


/* ========================================================= */
/* TITLE */
/* ========================================================= */

.project-title {

  font-size:
    20px;

  font-weight:
    800;

  line-height:
    1.25;

  letter-spacing:
    -.02em;

  color:
    #3f5360;

}


/* ========================================================= */
/* DESCRIPTION */
/* ========================================================= */

.project-description {

  margin-top:
    8px;

  font-size:
    14px;

  line-height:
    1.6;

  color:
    #5c6670;

}


.project-long-description {

  margin-top:
    7px;

  font-size:
    12px;

  line-height:
    1.65;

  color:
    rgba(92,102,112,.68);

}


/* ========================================================= */
/* FOOTER */
/* ========================================================= */

.project-footer {

  margin-top:
    20px;

  padding-top:
    16px;

  border-top:
    1px solid
    rgba(63,83,96,.07);

  display:
    flex;

  align-items:
    center;

  justify-content:
    space-between;

  gap:
    10px;

}


.project-type {

  font-size:
    9px;

  font-weight:
    700;

  text-transform:
    uppercase;

  letter-spacing:
    .14em;

  color:
    rgba(63,83,96,.35);

}


/* ========================================================= */
/* LINK */
/* ========================================================= */

.project-link {

  display:
    inline-flex;

  align-items:
    center;

  gap:
    8px;

  color:
    #c98f60;

  font-size:
    12px;

  font-weight:
    700;

  transition:
    color .3s ease;

}


.project-link:hover {

  color:
    #b7794f;

}


.project-link-icon {

  width:
    25px;

  height:
    25px;

  display:
    flex;

  align-items:
    center;

  justify-content:
    center;

  border-radius:
    50%;

  background:
    rgba(201,143,96,.10);

  transition:
    transform .3s ease,
    background .3s ease;

}


.project-link:hover .project-link-icon {

  transform:
    translateX(3px);

  background:
    rgba(201,143,96,.18);

}


/* ========================================================= */
/* PAGINATION */
/* ========================================================= */

:global(.swiper-pagination) {

  bottom:
    15px !important;

}


:global(.swiper-pagination-bullet) {

  width:
    6px;

  height:
    6px;

  background:
    #3f5360;

  opacity:
    .18;

  transition:
    all .35s ease;

}


:global(.swiper-pagination-bullet-active) {

  width:
    25px;

  border-radius:
    999px;

  background:
    #c98f60;

  opacity:
    1;

}


/* ========================================================= */
/* MOBILE */
/* ========================================================= */

@media (max-width: 640px) {

  .section-bg-word {

    top:
      4%;

    font-size:
      5rem;

  }


  .projects-swiper {

    padding-left:
      5px;

    padding-right:
      5px;

    padding-bottom:
      65px;

  }


  .project-slide {

    width:
      350px;

    border-radius:
      24px;

  }


  .image-wrapper {

    height:
      220px;

  }


  .slide-content {

    padding:
      20px;

  }


  .project-title {

    font-size:
      18px;

  }


  .project-footer {

    align-items:
      flex-start;

    flex-direction:
      column;

  }

}


/* ========================================================= */
/* REDUCED MOTION */
/* ========================================================= */

@media (prefers-reduced-motion: reduce) {

  .section-reveal {

    opacity:
      1;

    transform:
      none;

    transition:
      none;

  }

}

</style>

