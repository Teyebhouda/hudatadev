
<template>
  <section
    id="contact-form"
    ref="sectionRef"
    class="relative overflow-hidden
           py-24 lg:py-32
           px-5 sm:px-8 lg:px-16
           bg-gradient-to-b from-[#f7f8f9] to-[#eef0f1]"
  >

    <!-- ================================================= -->
    <!-- BACKGROUND -->
    <!-- ================================================= -->

    <div class="section-bg-word">
      Ensemble
    </div>

    <div
      class="absolute
             left-1/2
             top-1/2
             -translate-x-1/2
             -translate-y-1/2
             w-[700px]
             h-[500px]
             rounded-full
             bg-[radial-gradient(circle,rgba(201,143,96,0.10)_0%,transparent_70%)]
             blur-[100px]
             pointer-events-none"
    ></div>


    <!-- ================================================= -->
    <!-- MAIN -->
    <!-- ================================================= -->

    <div
      class="relative z-10
             max-w-7xl
             mx-auto
             grid
             lg:grid-cols-12
             gap-14
             lg:gap-20
             items-center"
    >

      <!-- ================================================= -->
      <!-- LEFT -->
      <!-- ================================================= -->

      <div
        class="lg:col-span-5"
      >

        <!-- badge -->

        <div
          class="reveal
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

          Parlons de votre projet

        </div>


        <!-- title -->

        <h2
          class="reveal
                 mt-7
                 text-4xl
                 sm:text-5xl
                 lg:text-[4rem]
                 font-extrabold
                 leading-[1.02]
                 tracking-[-0.045em]
                 text-[#3f5360]"
          :class="{ 'is-visible': isVisible }"
          style="--delay:100ms"
        >

          Créons quelque chose
          <span class="text-[#c98f60]">
            ensemble.
          </span>

        </h2>


        <!-- separator -->

        <div
          class="reveal
                 mt-7
                 flex
                 items-center
                 gap-3"
          :class="{ 'is-visible': isVisible }"
          style="--delay:180ms"
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


        <!-- description -->

        <p
          class="reveal
                 mt-7
                 max-w-xl
                 text-base
                 sm:text-lg
                 leading-relaxed
                 text-[#5c6670]/85"
          :class="{ 'is-visible': isVisible }"
          style="--delay:250ms"
        >

          Partagez-nous votre idée, votre besoin ou votre projet.
          Nous vous accompagnons dans la conception d'une solution
          digitale moderne, performante et adaptée à vos objectifs.

        </p>


        <!-- CTA -->

        <button
          @click="open = true"
          class="reveal
                 mt-9
                 group
                 inline-flex
                 items-center
                 gap-3
                 px-7
                 py-3.5
                 rounded-full
                 bg-[#c98f60]
                 text-white
                 font-semibold
                 shadow-[0_12px_30px_rgba(201,143,96,.22)]
                 hover:bg-[#b7794f]
                 hover:shadow-[0_16px_35px_rgba(201,143,96,.28)]
                 transition-all
                 duration-300"
          :class="{ 'is-visible': isVisible }"
          style="--delay:320ms"
        >

          Discutons de votre projet

          <span
            class="w-7
                   h-7
                   rounded-full
                   bg-white/15
                   flex
                   items-center
                   justify-center
                   group-hover:translate-x-1
                   transition-transform"
          >

            <i class="fas fa-arrow-right text-xs"></i>

          </span>

        </button>


        <!-- mini info -->

        <div
          class="mt-8
                 flex
                 flex-wrap
                 gap-x-6
                 gap-y-3
                 text-xs
                 text-[#3f5360]/50"
        >

          <span class="flex items-center gap-2">

            <i class="fas fa-check text-[#c98f60]"></i>

            Réponse rapide

          </span>

          <span class="flex items-center gap-2">

            <i class="fas fa-check text-[#c98f60]"></i>

            Étude personnalisée

          </span>

        </div>

      </div>


      <!-- ================================================= -->
      <!-- RIGHT : TESTIMONIALS -->
      <!-- ================================================= -->

      <div
        class="lg:col-span-7 min-w-0"
      >

        <div
          class="relative
                 rounded-[32px]
                 p-5 sm:p-7
                 bg-white/45
                 backdrop-blur-xl
                 border border-white/70
                 shadow-[0_25px_70px_rgba(63,83,96,.08)]"
        >

          <!-- small heading -->

          <div
            class="flex
                   items-center
                   justify-between
                   mb-6
                   px-2"
          >

            <div>

              <p
                class="text-[10px]
                       uppercase
                       tracking-[0.2em]
                       font-semibold
                       text-[#c98f60]"
              >
                Ils nous font confiance
              </p>

              <h3
                class="mt-1
                       text-xl
                       font-bold
                       text-[#3f5360]"
              >
                Quelques témoignages
              </h3>

            </div>


            <div
              class="hidden sm:flex
                     items-center
                     gap-1.5"
            >

              <span
                class="w-2 h-2
                       rounded-full
                       bg-[#c98f60]"
              ></span>

              <span
                class="text-[10px]
                       uppercase
                       tracking-widest
                       text-[#3f5360]/35"
              >
                Clients
              </span>

            </div>

          </div>


          <!-- Swiper -->

          <Swiper
            class="testimonials-swiper"
            :modules="[Autoplay]"
            :slides-per-view="'auto'"
            :space-between="20"
            :loop="testimonialsContent.items?.length > 2"
            :speed="5000"
            :autoplay="{
              delay: 0,
              disableOnInteraction: false,
              pauseOnMouseEnter: true
            }"
            :allowTouchMove="true"
          >

            <SwiperSlide
              v-for="(testimonial, index) in testimonialsContent.items"
              :key="index"
              class="testimonial-slide"
            >

              <article
                class="testimonial-card"
              >

                <!-- quote -->

                <div
                  class="quote-mark"
                >
                  “
                </div>


                <!-- stars -->

                <div
                  class="flex
                         gap-1
                         text-[#c98f60]
                         text-xs
                         mb-5"
                >

                  <span
                    v-for="star in 5"
                    :key="star"
                  >
                    ★
                  </span>

                </div>


                <!-- message -->

                <p
                  class="text-sm
                         leading-relaxed
                         text-[#5c6670]"
                >
                  {{ testimonial.message }}
                </p>


                <!-- author -->

                <div
                  class="mt-7
                         pt-5
                         border-t
                         border-[#3f5360]/8
                         flex
                         items-center
                         gap-3"
                >

                  <div
                    class="w-10
                           h-10
                           rounded-full
                           flex
                           items-center
                           justify-center
                           bg-[#3f5360]
                           text-white
                           text-sm
                           font-bold"
                  >

                    {{ getInitials(testimonial.name) }}

                  </div>


                  <div>

                    <h4
                      class="text-sm
                             font-bold
                             text-[#3f5360]"
                    >
                      {{ testimonial.name }}
                    </h4>

                    <span
                      class="text-xs
                             text-[#5c6670]/60"
                    >
                      {{ testimonial.role }}
                    </span>

                  </div>

                </div>

              </article>

            </SwiperSlide>

          </Swiper>

        </div>

      </div>

    </div>


    <!-- ================================================= -->
    <!-- CONTACT MODAL -->
    <!-- ================================================= -->

    <transition name="modal">

      <div
        v-if="open"
        class="fixed
               inset-0
               z-[100]
               flex
               items-center
               justify-center
               p-4
               sm:p-6"
      >

        <!-- backdrop -->

        <div
          class="absolute
                 inset-0
                 bg-[#26343d]/40
                 backdrop-blur-md"
          @click="open = false"
        ></div>


        <!-- modal -->

        <form
          @submit.prevent="handleSubmit"
          class="relative
                 z-10
                 w-full
                 max-w-xl
                 max-h-[92vh]
                 overflow-y-auto
                 rounded-[28px]
                 bg-white
                 shadow-[0_30px_100px_rgba(0,0,0,.20)]
                 p-6
                 sm:p-9"
        >

          <!-- close -->

          <button
            type="button"
            @click="open = false"
            class="absolute
                   top-5
                   right-5
                   w-9
                   h-9
                   rounded-full
                   flex
                   items-center
                   justify-center
                   bg-[#f3f5f6]
                   text-[#5c6670]
                   hover:bg-[#3f5360]
                   hover:text-white
                   transition"
            aria-label="Fermer"
          >

            <i class="fas fa-times text-sm"></i>

          </button>


          <!-- modal header -->

          <div class="pr-10">

            <span
              class="text-[10px]
                     uppercase
                     tracking-[0.18em]
                     font-semibold
                     text-[#c98f60]"
            >
              Nouveau projet
            </span>

            <h3
              class="mt-2
                     text-2xl
                     sm:text-3xl
                     font-extrabold
                     text-[#3f5360]"
            >
              Parlons de votre idée.
            </h3>

            <p
              class="mt-3
                     text-sm
                     leading-relaxed
                     text-[#5c6670]"
            >
              Décrivez-nous votre projet et nous reviendrons vers vous
              rapidement avec les premières informations.
            </p>

          </div>


          <!-- inputs -->

          <div
            class="grid
                   grid-cols-1
                   sm:grid-cols-2
                   gap-4
                   mt-7"
          >

            <input
              v-model="form.nom"
              type="text"
              placeholder="Nom complet"
              class="input"
              required
            />

            <input
              v-model="form.email"
              type="email"
              placeholder="Email"
              class="input"
              required
            />

            <input
              v-model="form.telephone"
              type="tel"
              placeholder="Téléphone (facultatif)"
              class="input sm:col-span-2"
            />

            <select
              v-model="form.service"
              class="input sm:col-span-2"
            >

              <option value="">
                Choisissez un service
              </option>

              <option
                v-for="s in services"
                :key="s"
                :value="s"
              >
                {{ s }}
              </option>

            </select>


            <textarea
              v-model="form.message"
              :placeholder="
                form.service === 'Autre'
                  ? 'Expliquez votre besoin spécifique...'
                  : 'Décrivez votre projet...'
              "
              class="input
                     sm:col-span-2
                     min-h-[120px]
                     resize-y"
              rows="5"
              required
            ></textarea>


            <!-- Honeypot -->

            <input
              v-model="form.website"
              type="text"
              autocomplete="off"
              tabindex="-1"
              class="hidden"
            />


            <!-- Turnstile -->

            <div
              ref="turnstileContainer"
              class="sm:col-span-2
                     flex
                     justify-center"
            ></div>

          </div>


          <!-- error -->

          <div
            v-if="errorText"
            class="mt-4
                   rounded-xl
                   bg-red-50
                   border border-red-100
                   px-4
                   py-3
                   text-sm
                   text-red-600"
          >

            {{ errorText }}

          </div>


          <!-- submit -->

          <div
            class="mt-6
                   flex
                   flex-col-reverse
                   sm:flex-row
                   sm:items-center
                   sm:justify-between
                   gap-4"
          >

            <p
              class="text-[10px]
                     leading-relaxed
                     text-[#5c6670]/50"
            >
              Vos informations restent strictement confidentielles.
            </p>


            <button
              type="submit"
              :disabled="loading"
              class="inline-flex
                     justify-center
                     items-center
                     gap-3
                     px-6
                     py-3
                     rounded-full
                     bg-[#3f5360]
                     text-white
                     font-semibold
                     hover:bg-[#2f3d46]
                     disabled:opacity-60
                     transition"
            >

              <span
                v-if="loading"
                class="w-4
                       h-4
                       border-2
                       border-white
                       border-t-transparent
                       rounded-full
                       animate-spin"
              ></span>

              {{ loading ? "Envoi..." : "Envoyer le message" }}

              <i
                v-if="!loading"
                class="fas fa-arrow-right text-xs"
              ></i>

            </button>

          </div>

        </form>

      </div>

    </transition>


    <!-- ================================================= -->
    <!-- SUCCESS TOAST -->
    <!-- ================================================= -->

    <transition name="toast">

      <div
        v-if="showToast"
        class="fixed
               bottom-5
               right-5
               left-5
               sm:left-auto
               z-[120]
               sm:w-[380px]
               flex
               items-start
               gap-3
               bg-white
               border
               border-green-100
               shadow-[0_20px_50px_rgba(0,0,0,.12)]
               rounded-2xl
               px-5
               py-4"
      >

        <div
          class="flex
                 shrink-0
                 items-center
                 justify-center
                 w-9
                 h-9
                 rounded-full
                 bg-green-100
                 text-green-600"
        >

          <i class="fas fa-check"></i>

        </div>


        <div>

          <p
            class="font-semibold
                   text-[#3f5360]"
          >
            Message envoyé
          </p>

          <p
            class="mt-1
                   text-sm
                   leading-relaxed
                   text-[#5c6670]"
          >
            Merci pour votre message. Nous vous répondrons très bientôt.
          </p>

        </div>

      </div>

    </transition>

  </section>
</template>


<script setup>

import {
  ref,
  reactive,
  nextTick,
  watch,
  onMounted,
  onBeforeUnmount
} from "vue"

import axios from "axios"

import {
  Swiper,
  SwiperSlide
} from "swiper/vue"

import {
  Autoplay
} from "swiper/modules"

import "swiper/css"

import {
  useContactModal
} from "@/Composables/useContactModal"


/*
|--------------------------------------------------------------------------
| PROPS
|--------------------------------------------------------------------------
*/

const { isContactOpen } = useContactModal()

const props = defineProps({

  testimonialsContent: {

    type: Object,

    default: () => ({
      items: []
    })

  }

})


/*
|--------------------------------------------------------------------------
| MODAL
|--------------------------------------------------------------------------
*/

const open = isContactOpen


/*
|--------------------------------------------------------------------------
| STATES
|--------------------------------------------------------------------------
*/

const loading = ref(false)

const errorText = ref("")

const showToast = ref(false)


/*
|--------------------------------------------------------------------------
| SCROLL ANIMATION
|--------------------------------------------------------------------------
*/

const sectionRef = ref(null)

const isVisible = ref(false)

let observer = null


/*
|--------------------------------------------------------------------------
| TURNSTILE
|--------------------------------------------------------------------------
*/

const turnstileContainer = ref(null)

const turnstileWidgetId = ref(null)

const turnstileSiteKey =
  import.meta.env.VITE_TURNSTILE_SITE_KEY


/*
|--------------------------------------------------------------------------
| SERVICES
|--------------------------------------------------------------------------
*/

const services = [

  "Site web vitrine",

  "Application mobile",

  "Application web sur mesure (SaaS, dashboard)",

  "UX / UI Design",

  "Audit & consultation technique",

  "Autre"

]


/*
|--------------------------------------------------------------------------
| FORM
|--------------------------------------------------------------------------
*/

const form = reactive({

  nom: "",

  email: "",

  telephone: "",

  service: "",

  message: "",

  website: "",

  turnstile: "",

  started_at: Date.now()

})


/*
|--------------------------------------------------------------------------
| INITIALS
|--------------------------------------------------------------------------
*/

function getInitials(name) {

  if (!name) {
    return "H"
  }

  return name
    .trim()
    .split(/\s+/)
    .slice(0, 2)
    .map(word => word[0])
    .join("")
    .toUpperCase()

}


/*
|--------------------------------------------------------------------------
| SCROLL OBSERVER
|--------------------------------------------------------------------------
*/

onMounted(() => {

  if (!sectionRef.value) {
    return
  }


  if ("IntersectionObserver" in window) {

    observer = new IntersectionObserver(

      entries => {

        entries.forEach(entry => {

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


    observer.observe(sectionRef.value)

  } else {

    isVisible.value = true

  }

})


onBeforeUnmount(() => {

  observer?.disconnect()

})


/*
|--------------------------------------------------------------------------
| OPEN MODAL
|--------------------------------------------------------------------------
*/

watch(
  open,
  async value => {

    if (value) {

      await nextTick()

      await initTurnstile()

    }

  }
)


/*
|--------------------------------------------------------------------------
| LOAD TURNSTILE
|--------------------------------------------------------------------------
*/

function loadTurnstileScript() {

  return new Promise((resolve, reject) => {

    if (window.turnstile) {

      resolve()

      return

    }


    const existing =
      document.querySelector(
        'script[src*="challenges.cloudflare.com/turnstile"]'
      )


    if (existing) {

      existing.addEventListener(
        "load",
        resolve,
        { once: true }
      )

      return

    }


    const script =
      document.createElement("script")


    script.src =
      "https://challenges.cloudflare.com/turnstile/v0/api.js?render=explicit"

    script.async = true

    script.defer = true


    script.onload = resolve

    script.onerror = reject


    document.head.appendChild(script)

  })

}


/*
|--------------------------------------------------------------------------
| INIT TURNSTILE
|--------------------------------------------------------------------------
*/

async function initTurnstile() {

  if (turnstileWidgetId.value) {
    return
  }


  if (!turnstileSiteKey) {

    console.error(
      "VITE_TURNSTILE_SITE_KEY est manquante."
    )

    return

  }


  try {

    await loadTurnstileScript()

    await nextTick()


    if (!turnstileContainer.value) {
      return
    }


    turnstileWidgetId.value =
      window.turnstile.render(

        turnstileContainer.value,

        {

          sitekey:
            turnstileSiteKey,

          theme:
            "light",

          callback(token) {

            form.turnstile =
              token

          },

          "expired-callback"() {

            form.turnstile = ""

          },

          "error-callback"() {

            form.turnstile = ""

          }

        }

      )

  } catch (error) {

    console.error(
      "Erreur Turnstile :",
      error
    )

  }

}


/*
|--------------------------------------------------------------------------
| SUBMIT
|--------------------------------------------------------------------------
*/

async function handleSubmit() {

  errorText.value = ""


  if (
    !form.nom.trim() ||
    !form.email.trim() ||
    !form.message.trim()
  ) {

    errorText.value =
      "Veuillez remplir le nom, l’email et le message."

    return

  }


  if (!form.turnstile) {

    errorText.value =
      "Veuillez compléter la vérification de sécurité."

    return

  }


  loading.value = true


  try {

    await axios.post(

      route("contact.send"),

      form,

      {

        headers: {

          "X-CSRF-TOKEN":
            document.querySelector(
              'meta[name="csrf-token"]'
            )?.content || ""

        }

      }

    )


    open.value = false

    showToast.value = true


    form.nom = ""

    form.email = ""

    form.telephone = ""

    form.service = ""

    form.message = ""

    form.website = ""

    form.turnstile = ""


    if (
      window.turnstile &&
      turnstileWidgetId.value
    ) {

      window.turnstile.reset(
        turnstileWidgetId.value
      )

    }


    setTimeout(() => {

      showToast.value = false

    }, 4000)


  } catch (error) {

    console.error(
      "Erreur formulaire :",
      error
    )


    errorText.value =
      error?.response?.data?.message ||
      "Une erreur est survenue. Veuillez réessayer."

  } finally {

    loading.value = false

  }

}

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
    clamp(5rem, 13vw, 10rem);

  font-weight:
    800;

  line-height:
    1;

  letter-spacing:
    .04em;

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

.reveal {

  opacity:
    0;

  transform:
    translateY(25px);

  transition:
    opacity .8s ease var(--delay),
    transform .8s cubic-bezier(.22,1,.36,1) var(--delay);

}


.reveal.is-visible {

  opacity:
    1;

  transform:
    translateY(0);

}


/* ========================================================= */
/* TESTIMONIAL */
/* ========================================================= */

.testimonials-swiper {

  width:
    100%;

  padding:
    8px 5px 15px;

}


.testimonial-slide {

  width:
    320px;

  max-width:
    calc(100vw - 90px);

}


.testimonial-card {

  position:
    relative;

  min-height:
    280px;

  padding:
    26px;

  border-radius:
    24px;

  background:
    rgba(255,255,255,.78);

  border:
    1px solid
    rgba(255,255,255,.95);

  box-shadow:
    0 15px 40px
    rgba(63,83,96,.07);

  backdrop-filter:
    blur(18px);

  -webkit-backdrop-filter:
    blur(18px);

  transition:
    transform .4s ease,
    box-shadow .4s ease;

}


.testimonial-card:hover {

  transform:
    translateY(-5px);

  box-shadow:
    0 25px 55px
    rgba(63,83,96,.11);

}


/* quote */

.quote-mark {

  position:
    absolute;

  top:
    14px;

  right:
    22px;

  font-size:
    58px;

  line-height:
    1;

  font-family:
    Georgia,
    serif;

  color:
    rgba(201,143,96,.18);

}


/* ========================================================= */
/* FORM */
/* ========================================================= */

.input {

  width:
    100%;

  border:
    1px solid
    rgba(63,83,96,.12);

  border-radius:
    13px;

  padding:
    12px 14px;

  background:
    #f9fafb;

  color:
    #3f5360;

  font-size:
    14px;

  outline:
    none;

  transition:
    border-color .25s ease,
    box-shadow .25s ease,
    background .25s ease;

}


.input::placeholder {

  color:
    rgba(92,102,112,.45);

}


.input:focus {

  background:
    white;

  border-color:
    rgba(201,143,96,.65);

  box-shadow:
    0 0 0 4px
    rgba(201,143,96,.08);

}


/* ========================================================= */
/* MODAL */
/* ========================================================= */

.modal-enter-active,
.modal-leave-active {

  transition:
    opacity .3s ease;

}


.modal-enter-active form,
.modal-leave-active form {

  transition:
    transform .35s cubic-bezier(.22,1,.36,1),
    opacity .3s ease;

}


.modal-enter-from,
.modal-leave-to {

  opacity:
    0;

}


.modal-enter-from form,
.modal-leave-to form {

  opacity:
    0;

  transform:
    translateY(20px)
    scale(.97);

}


/* ========================================================= */
/* TOAST */
/* ========================================================= */

.toast-enter-active,
.toast-leave-active {

  transition:
    all .4s cubic-bezier(.22,1,.36,1);

}


.toast-enter-from,
.toast-leave-to {

  opacity:
    0;

  transform:
    translateY(20px);

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


  .testimonial-slide {

    width:
      300px;

  }


  .testimonial-card {

    min-height:
      260px;

    padding:
      22px;

  }

}


/* ========================================================= */
/* REDUCED MOTION */
/* ========================================================= */

@media (prefers-reduced-motion: reduce) {

  .reveal {

    opacity:
      1;

    transform:
      none;

    transition:
      none;

  }

}

</style>

