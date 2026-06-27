<script setup>
import { Swiper, SwiperSlide } from "swiper/vue"
import { Autoplay } from "swiper/modules"

import "swiper/css"

defineProps({
  testimonialsContent: {
    type: Object,
    default: () => ({
      title: "Ils nous font confiance",
      subtitle:
        "Découvrez les retours de nos clients après la réalisation de leurs projets.",
      items: [
        {
          name: "John Doe",
          role: "Développeur",
          message: "Ce service est incroyable !",
          background_image: "/images/testimonial1.jpg",
        },
        {
          name: "Jane Smith",
          role: "Designer",
          message: "J'adore travailler avec cette équipe.",
          background_image: "/images/testimonial2.jpg",
        },
        {
          name: "Alice Johnson",
          role: "Chef de projet",
          message: "Leur professionnalisme est inégalé.",
          background_image: "/images/testimonial3.jpg",
        },
      ],
    }),
  },
})
</script>

<template>
  <section
    id="testimonials-section"
    class="relative overflow-hidden py-10 sm:py-14 px-6 sm:px-10 lg:px-20 bg-gradient-to-b from-[#f7f8f9] to-[#eef0f1]"
  >
    <!-- Mot de fond -->
    <h2 class="hero-bg-word">
      Avis
    </h2>

    <!-- Header -->
    <div class="relative max-w-6xl mx-auto text-center mb-14">

      <p
        class="text-4xl sm:text-5xl lg:text-6xl font-extrabold text-[#3f5360]"
      >
        {{ testimonialsContent.title }}
      </p>

      <div
        class="mt-5 flex flex-col sm:flex-row justify-center items-center gap-5"
      >
        <div class="w-24 h-[2px] bg-[#c98f60]"></div>

        <p class="max-w-2xl text-lg text-[#5c6670]">
          {{ testimonialsContent.subtitle }}
        </p>
      </div>

    </div>

    <!-- Slider -->

    <Swiper
      class="testimonials-swiper"
      :modules="[Autoplay]"
      :slides-per-view="'auto'"
      :space-between="35"
      :loop="true"
      :speed="4500"
      :autoplay="{
        delay:0,
        disableOnInteraction:false
      }"
      :allowTouchMove="false"
    >
      <SwiperSlide
        v-for="(testimonial,index) in testimonialsContent.items"
        :key="index"
        class="testimonial-slide"
      >

        <div
          :class="[
            'testimonial-card',
            index % 2 === 0
              ? 'rotate-[2deg] hover:rotate-0'
              : '-rotate-[2deg] hover:rotate-0'
          ]"
        >

          <!-- quote -->

          <div class="quote">
            "
          </div>

          <!-- étoiles -->

          <div class="stars">

            <span>★</span>
            <span>★</span>
            <span>★</span>
            <span>★</span>
            <span>★</span>

          </div>

          <!-- message -->

          <p class="message">
            {{ testimonial.message }}
          </p>

          <!-- footer -->

          <div class="author">

            <div class="avatar">

              <img
                v-if="testimonial.background_image"
                :src="testimonial.background_image"
                :alt="testimonial.name"
              >

            </div>

            <div>

              <h3>
                {{ testimonial.name }}
              </h3>

              <span>
                {{ testimonial.role }}
              </span>

            </div>

          </div>

        </div>

      </SwiperSlide>

    </Swiper>

  </section>
</template>

<style scoped>

.hero-bg-word{

position:absolute;
left:50%;
top:7%;

transform:translateX(-50%);

font-size:clamp(5rem,12vw,9rem);

font-weight:800;

color:rgba(63,83,96,.05);

white-space:nowrap;

pointer-events:none;

user-select:none;

}

/* slider */

.testimonials-swiper{

overflow:visible;
padding:20px 0 40px;

}

.testimonials-swiper .swiper-wrapper{

transition-timing-function:linear !important;

}

.testimonial-slide{

width:380px;

max-width:90vw;

}

/* card */

.testimonial-card{

position:relative;

overflow:hidden;

padding:35px;

border-radius:26px;

background:rgba(255,255,255,.72);

backdrop-filter:blur(18px);

border:1px solid rgba(255,255,255,.7);

box-shadow:
0 15px 40px rgba(0,0,0,.08),
0 4px 10px rgba(201,143,96,.08);

transition:.45s;

}

.testimonial-card:hover{

transform:translateY(-10px) scale(1.02);

box-shadow:
0 25px 60px rgba(0,0,0,.12),
0 10px 25px rgba(201,143,96,.18);

}

/* quote */

.quote{

position:absolute;

top:-20px;

right:20px;

font-size:120px;

font-family:serif;

color:rgba(201,143,96,.08);

line-height:1;

}

/* stars */

.stars{

display:flex;

gap:5px;

color:#c98f60;

font-size:20px;

margin-bottom:18px;

}

/* message */

.message{

color:#5c6670;

line-height:1.9;

font-size:15px;

font-style:italic;

min-height:130px;

position:relative;

z-index:2;

}

/* author */

.author{

display:flex;

align-items:center;

margin-top:30px;

}

.avatar{

width:64px;

height:64px;

border-radius:999px;

overflow:hidden;

border:4px solid white;

box-shadow:0 6px 18px rgba(0,0,0,.12);

margin-right:16px;

flex-shrink:0;

}

.avatar img{

width:100%;

height:100%;

object-fit:cover;

}

.author h3{

font-size:18px;

font-weight:700;

color:#3f5360;

}

.author span{

color:#c98f60;

font-size:14px;

}

@media(max-width:768px){

.testimonial-slide{

width:300px;

}

.message{

min-height:auto;

}

}

</style>