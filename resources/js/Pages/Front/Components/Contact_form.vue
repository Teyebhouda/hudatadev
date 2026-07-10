<template>
  <section
   id="contact-form"
    class="relative bg-[#f0f4f8] py-28 px-6 sm:px-10 lg:px-20 overflow-hidden"
  >
    <!-- Background word -->
    <h2 class="hero-bg-word">Ensemble</h2>

    <div class="relative max-w-7xl mx-auto grid grid-cols-1 lg:grid-cols-12 gap-12 items-center">

      <!-- ================= LEFT : CONTACT ================= -->
      <div class="lg:col-span-6">
        <p class="text-4xl sm:text-5xl lg:text-6xl font-extrabold text-[#3f5360] leading-tight">
          Créons quelque chose ensemble
        </p>

        <div class="mt-4 flex items-center gap-6">
          <div class="h-[2px] w-28 bg-[#c98f60]"></div>
          <p class="text-lg text-[#5c6670] max-w-xl">
            Partagez vos idées — ensemble, nous concevons des expériences digitales élégantes et performantes.
          </p>
        </div>

        <div class="mt-8 ml-2">
          <button
 @click="open = true"

            class="inline-flex items-center gap-2 text-[#c98f60] font-semibold text-lg hover:text-[#b7794f] transition"
          >
            Discutons de votre projet →
          </button>
        </div>
      </div>

      <!-- ================= RIGHT : TESTIMONIALS ================= -->
      <div class="lg:col-span-6">
        <Swiper
          class="testimonials-swiper"
          :modules="[Autoplay]"
          :slides-per-view="'auto'"
          :space-between="25"
          :loop="true"
          :speed="4500"
          :autoplay="{ delay: 0, disableOnInteraction: false }"
          :allowTouchMove="false"
        >
          <SwiperSlide
            v-for="(testimonial, index) in testimonialsContent.items"
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
              <div class="quote">"</div>

              <div class="stars">
                <span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
              </div>

              <p class="message">
                {{ testimonial.message }}
              </p>

              <div class="author">
                <!--<div class="avatar">
                  <img :src="testimonial.background_image" :alt="testimonial.name" />
                </div> -->

                <div>
                  <h3>{{ testimonial.name }}</h3>
                  <span>{{ testimonial.role }}</span>
                </div>
              </div>
            </div>
          </SwiperSlide>
        </Swiper>
      </div>

    </div>

    <!-- ================= MODAL CONTACT ================= -->
       <!-- Modal formulaire -->
    <transition name="fade-scale">
      <div v-if="open" class="fixed inset-0 z-50 flex items-center justify-center px-4">
        <div class="absolute inset-0 bg-black/30 backdrop-blur-sm" @click="open = false" aria-hidden="true"></div>

        <form @submit.prevent="handleSubmit" class="relative bg-white w-full max-w-xl rounded-2xl shadow-2xl p-8 sm:p-10 z-10">
          <button type="button" class="absolute right-4 top-4 text-[#5c6670] hover:text-[#3f5360]" @click="open = false" aria-label="Fermer">
            <svg class="w-6 h-6" viewBox="0 0 24 24" fill="none" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M6 18L18 6M6 6l12 12"/></svg>
          </button>

          <h3 class="text-2xl font-bold text-[#3f5360] mb-2">Envoyez un message</h3>
          <p class="text-sm text-[#5c6670] mb-6">Merci de décrivez brièvement votre projet et nous vous répondrons sous 1 à 2 jours ouvrés.</p>

          <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
            <input v-model="form.nom" type="text" placeholder="Nom complet" class="input" />
            <input v-model="form.email" type="email" placeholder="Email" class="input" />
            <input v-model="form.telephone" type="tel" placeholder="Téléphone (facultatif)" class="input sm:col-span-2" />
            <select v-model="form.service" class="input sm:col-span-2">
              <option value="">Choisissez un service</option>
              <option v-for="s in services" :key="s" :value="s">{{ s }}</option>
            </select>

            <textarea
  v-model="form.message"
  :placeholder="form.service === 'Autre'
    ? 'Expliquez votre besoin spécifique...'
    : 'Décrivez votre projet...'"
  class="input sm:col-span-2"
  rows="4"
></textarea>
<!-- Honeypot -->
<input
    v-model="form.website"
    type="text"
    autocomplete="off"
    tabindex="-1"
    class="hidden"
/>

<!-- Cloudflare Turnstile -->
<!-- Cloudflare Turnstile explicit render -->
<div ref="turnstileContainer"></div>

</div>

          <div class="mt-6 flex items-center justify-between gap-4">
            <div class="text-sm text-red-500" v-if="errorText">{{ errorText }}</div>
            <button type="submit" :disabled="loading" class="ml-auto inline-flex items-center gap-3 px-5 py-3 bg-[#3f5360] text-white rounded-full hover:bg-[#5c6670] transition">
              <span v-if="loading" class="w-4 h-4 border-2 border-white border-t-transparent rounded-full animate-spin"></span>
              {{ loading ? 'Envoi...' : 'Envoyer le message' }}
            </button>
          </div>
        </form>
      </div>
    </transition>
    <!-- Toast succès -->
<transition name="toast">
  <div
    v-if="showToast"
    class="fixed bottom-6 right-6 z-[60] flex items-center gap-3 bg-white border border-green-100 shadow-xl rounded-xl px-5 py-4"
  >
    <div class="flex items-center justify-center w-9 h-9 rounded-full bg-green-100 text-green-600">
      ✔
    </div>

    <div>
      <p class="font-semibold text-[#3f5360]">Message envoyé</p>
      <p class="text-sm text-[#5c6670]">Merci pour votre message. Nous vous répondrons très bientôt.</p>
    </div>
  </div>
</transition>

  </section>
</template>

<script setup>
import { ref, reactive, nextTick, watch } from "vue"
import axios from "axios"
import { Swiper, SwiperSlide } from "swiper/vue"
import { Autoplay } from "swiper/modules"
import "swiper/css"
import { useContactModal } from '@/Composables/useContactModal'


const { isContactOpen } = useContactModal()

defineProps({
  testimonialsContent: {
    type: Object,
    default: () => ({
      items: []
    })
  }
})


const open = isContactOpen


const loading = ref(false)
const errorText = ref('')
const showToast = ref(false)


const turnstileContainer = ref(null)
const turnstileWidgetId = ref(null)


const turnstileSiteKey = import.meta.env.VITE_TURNSTILE_SITE_KEY

console.log(
    "TURNSTILE SITE KEY:::",
    turnstileSiteKey
)


const services = [
  'Site web vitrine',
  'Application mobile',
  'Application web sur mesure (SaaS, dashboard)',
  'UX / UI Design',
  'Audit & consultation technique',
  'Autre'
]


const form = reactive({

    nom:'',
    email:'',
    telephone:'',
    service:'',
    message:'',
    website:'',
    turnstile:'',
    started_at:Date.now()

})



watch(open, async(value)=>{

    if(value){

        console.log("Modal ouvert")

        await nextTick()

        initTurnstile()

    }

})



// =========================
// LOAD SCRIPT
// =========================

function loadTurnstileScript(){

    return new Promise((resolve)=>{


        if(window.turnstile){

            console.log(
                "Turnstile déjà chargé"
            )

            resolve()
            return
        }


        const script=document.createElement('script')

        script.src =
        "https://challenges.cloudflare.com/turnstile/v0/api.js?render=explicit"


        script.async=true
        script.defer=true


        script.onload=()=>{

            console.log(
                "Script Turnstile chargé"
            )

            console.log(
                window.turnstile
            )

            resolve()

        }


        script.onerror=()=>{

            console.error(
                "Erreur chargement Turnstile"
            )

        }


        document.head.appendChild(script)


    })

}




// =========================
// INIT TURNSTILE
// =========================

async function initTurnstile(){


    console.log(
        "INIT TURNSTILE"
    )


    if(turnstileWidgetId.value){

        console.log(
            "Widget déjà créé"
        )

        return

    }



    await loadTurnstileScript()


    await nextTick()



    console.log(
        "Container:",
        turnstileContainer.value
    )


    if(!turnstileContainer.value){

        console.error(
            "Container introuvable"
        )

        return

    }



    turnstileWidgetId.value =
        window.turnstile.render(

            turnstileContainer.value,

            {


                sitekey:turnstileSiteKey,


                theme:"light",



                callback(token){


                    console.log(
                        "TOKEN RECU:",
                        token
                    )


                    form.turnstile = token


                    console.log(
                        "FORM TOKEN:",
                        form.turnstile
                    )


                },



                "expired-callback":()=>{


                    console.log(
                        "Token expiré"
                    )


                    form.turnstile=''


                },



                "error-callback":()=>{


                    console.log(
                        "Erreur Turnstile"
                    )


                    form.turnstile=''


                }


            }

        )


    console.log(
        "Widget ID:",
        turnstileWidgetId.value
    )

}



// =========================
// SUBMIT
// =========================

async function handleSubmit(){


    errorText.value=''


    console.log(
        "SUBMIT TOKEN:",
        form.turnstile
    )


    if(!form.nom.trim()
    || !form.email.trim()
    || !form.message.trim()){


        errorText.value=
        "Veuillez remplir le nom, l’email et le message."


        return

    }



    if(!form.turnstile){


        errorText.value=
        "Veuillez compléter la vérification de sécurité."


        return

    }



    loading.value=true


    try{


        await axios.post(
            route('contact.send'),
            form,
            {
                headers:{
                    'X-CSRF-TOKEN':
                    document.querySelector(
                    'meta[name="csrf-token"]'
                    )?.content || ''
                }
            }
        )


        showToast.value=true


        open.value=false



        if(window.turnstile){

            window.turnstile.reset(
                turnstileWidgetId.value
            )

        }


        form.turnstile=''



    }
    catch(e){

        console.error(e)

        errorText.value=
        "Une erreur est survenue."


    }
    finally{

        loading.value=false

    }

}



function triggerToast(){

    showToast.value=true

    setTimeout(()=>{

        showToast.value=false

    },3000)

}

</script>
<style scoped>
.hero-bg-word {
  position: absolute;
  left: 50%;
  top: 10%;
  transform: translateX(-50%);
  font-size: clamp(6rem, 12vw, 10rem);
  font-weight: 800;
  color: rgba(63, 83, 96, 0.06);
  pointer-events: none;
  user-select: none;
}

.testimonial-slide {
  width: 360px;
}

.testimonial-card {
  background: rgba(255,255,255,0.7);
  backdrop-filter: blur(16px);
  padding: 30px;
  border-radius: 20px;
}
</style>