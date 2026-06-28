<script setup>
import { ref, reactive, onMounted } from 'vue'
import axios from 'axios'

const open = ref(false)
const loading = ref(false)
const errorText = ref('')
const success = ref(false)

const turnstileSiteKey = import.meta.env.VITE_TURNSTILE_SITE_KEY

const form = reactive({
  nom: '',
  email: '',
  telephone: '',
  service: '',
  message: '',

  // security
  website: '',       // honeypot
  turnstile: '',     // token
  started_at: Date.now()
})

const services = [
  'Développement Web',
  'Applications Mobile',
  'API & Intégration',
  'UI/UX Design',
  'SEO',
  'Maintenance'
]

function handleTurnstile(token) {
  form.turnstile = token
}

onMounted(() => {
  const script = document.createElement('script')
  script.src = 'https://challenges.cloudflare.com/turnstile/v0/api.js'
  script.async = true
  script.defer = true
  document.head.appendChild(script)

  window.onTurnstileSuccess = handleTurnstile
})

async function handleSubmit() {
  errorText.value = ''

  const duration = (Date.now() - form.started_at) / 1000

  if (duration < 3) {
    errorText.value = "Soumission trop rapide détectée."
    return
  }

  if (!form.turnstile) {
    errorText.value = "Veuillez valider la vérification de sécurité."
    return
  }

  loading.value = true

  try {
    const res = await axios.post('/contact', form)

    success.value = true
    open.value = false

    // reset
    Object.assign(form, {
      nom: '',
      email: '',
      telephone: '',
      service: '',
      message: '',
      website: '',
      turnstile: '',
      started_at: Date.now()
    })

  } catch (e) {
    errorText.value =
      e?.response?.data?.message || "Erreur lors de l'envoi."
  }

  loading.value = false
}
</script>

<template>
<div class="relative max-w-7xl mx-auto grid grid-cols-1 lg:grid-cols-12 gap-12 items-center">

  <!-- LEFT -->
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

  <!-- RIGHT -->
  <div class="lg:col-span-6">
    <Swiper
      :modules="[Autoplay]"
      :slides-per-view="'auto'"
      :space-between="25"
      :loop="true"
      :speed="4500"
      :autoplay="{ delay: 0, disableOnInteraction: false }"
      :allowTouchMove="false"
    >
      <SwiperSlide
v-for="(testimonial, index) in testimonialsContent?.items || []"
        :key="index"
      >
        <div
          class="testimonial-card"
          :class="index % 2 === 0 ? 'rotate-[2deg]' : '-rotate-[2deg]'"
        >
          <div class="quote">"</div>

          <div class="stars">
            ★★★★★
          </div>

          <p class="message">
            {{ testimonial.message }}
          </p>

          <div class="author">
            <img :src="testimonial.background_image" />
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

<!-- MODAL -->
<transition name="fade-scale">
<div v-if="open" class="fixed inset-0 z-50 flex items-center justify-center px-4">

  <div class="absolute inset-0 bg-black/30 backdrop-blur-sm" @click="open = false"></div>

  <form
    @submit.prevent="handleSubmit"
    class="relative bg-white w-full max-w-xl rounded-2xl shadow-2xl p-8 z-10"
  >

    <button type="button" @click="open = false" class="absolute top-4 right-4">
      ✕
    </button>

    <h3 class="text-2xl font-bold">Envoyez un message</h3>

    <p class="text-sm text-gray-500 mb-6">
      Réponse sous 24-48h
    </p>

    <!-- honeypot -->
    <input v-model="form.website" class="hidden" autocomplete="off" />

    <div class="grid gap-3">

      <input v-model="form.nom" placeholder="Nom" class="input" />
      <input v-model="form.email" placeholder="Email" class="input" />
      <input v-model="form.telephone" placeholder="Téléphone" class="input" />

      <select v-model="form.service" class="input">
        <option value="">Service</option>
        <option v-for="s in services" :key="s">{{ s }}</option>
      </select>

      <textarea
        v-model="form.message"
        :placeholder="form.service === 'Autre'
          ? 'Expliquez votre besoin spécifique...'
          : 'Décrivez votre projet...'"
        class="input"
        rows="4"
      />

      <!-- TURNSTILE -->
      <div
        class="cf-turnstile"
        :data-sitekey="turnstileSiteKey"
        data-theme="light"
        data-callback="onTurnstileSuccess"
      ></div>

    </div>

    <div class="mt-4 flex justify-between items-center">

      <p v-if="errorText" class="text-red-500 text-sm">
        {{ errorText }}
      </p>

      <button
        type="submit"
        :disabled="loading"
        class="px-5 py-2 bg-[#3f5360] text-white rounded-full"
      >
        {{ loading ? 'Envoi...' : 'Envoyer' }}
      </button>

    </div>

  </form>

</div>
</transition>

<!-- SUCCESS -->
<div v-if="success" class="fixed bottom-6 right-6 bg-white shadow p-4 rounded-xl">
  <p class="font-semibold text-[#3f5360]">Message envoyé</p>
  <p class="text-sm text-gray-500">
    Merci pour votre message
  </p>
</div>

</template>