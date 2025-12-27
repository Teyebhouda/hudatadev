<template>
  <section id="contact-form" class="relative bg-[#f0f4f8] py-28 px-6 sm:px-10 lg:px-20 overflow-visible">
    <!-- grand mot en arrière-plan -->
    <h2 aria-hidden="true" class="hero-bg-word select-none pointer-events-none">Ensemble</h2>

    <div class="relative max-w-6xl mx-auto">
      <div class="grid grid-cols-1 lg:grid-cols-12 gap-8 items-center">
        <!-- gauche : texte principal -->
        <div class="lg:col-span-8">
          <p class="text-4xl sm:text-5xl lg:text-6xl font-extrabold tracking-tight text-[#3f5360] leading-tight">
            Créons quelque chose ensemble
          </p>
          <div class="mt-4 flex items-center gap-6">
            <div class="h-[2px] w-36 bg-[#c98f60]"></div>
            <p class="text-lg text-[#5c6670] max-w-xl">
           Partagez vos idées — ensemble, nous concevons et développons des produits élégants qui offrent une expérience utilisateur exceptionnelle. </p>
          </div>
        </div>

        <!-- droite : CTA -->
        <div class="lg:col-span-4 flex justify-start lg:justify-end">
          <a
            @click="open = true"
            class="text-[#c98f60] font-semibold hover:text-[#b7794f] text-lg transition-colors"
          >
            Contactez-Nous &rarr;
          </a>
        </div>
      </div>

      <!-- Réseaux sociaux -->
      <div class="mt-12 flex justify-center gap-8">
        <!-- Les icônes restent les mêmes -->
      </div>
    </div>

    <!-- Modal formulaire -->
    <transition name="fade-scale">
      <div v-if="open" class="fixed inset-0 z-50 flex items-center justify-center px-4">
        <div class="absolute inset-0 bg-black/30 backdrop-blur-sm" @click="open = false" aria-hidden="true"></div>

        <form @submit.prevent="handleSubmit" class="relative bg-white w-full max-w-xl rounded-2xl shadow-2xl p-8 sm:p-10 z-10">
          <button type="button" class="absolute right-4 top-4 text-[#5c6670] hover:text-[#3f5360]" @click="open = false" aria-label="Fermer">
            <svg class="w-6 h-6" viewBox="0 0 24 24" fill="none" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M6 18L18 6M6 6l12 12"/></svg>
          </button>

          <h3 class="text-2xl font-bold text-[#3f5360] mb-2">Envoyez un message</h3>
          <p class="text-sm text-[#5c6670] mb-6">Décrivez brièvement votre projet et je vous répondrai sous 1 à 2 jours ouvrés.</p>

          <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
            <input v-model="form.nom" type="text" placeholder="Nom complet" class="input" />
            <input v-model="form.email" type="email" placeholder="Email" class="input" />
            <input v-model="form.telephone" type="tel" placeholder="Téléphone (facultatif)" class="input sm:col-span-2" />
            <select v-model="form.service" class="input sm:col-span-2">
              <option value="">Choisissez un service</option>
              <option v-for="s in services" :key="s" :value="s">{{ s }}</option>
            </select>
            <textarea v-model="form.message" rows="4" placeholder="Votre message..." class="input sm:col-span-2"></textarea>
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
  </section>
</template>

<script setup>
import { ref, reactive } from 'vue'
import axios from 'axios'

const services = ['Site web', 'Application mobile', 'Design', 'Consultation']

const open = ref(false)
const loading = ref(false)
const errorText = ref('')

const form = reactive({
  nom: '',
  email: '',
  telephone: '',
  service: '',
  message: ''
})

function resetForm() {
  form.nom = ''
  form.email = ''
  form.telephone = ''
  form.service = ''
  form.message = ''
  errorText.value = ''
}

async function handleSubmit() {
  errorText.value = ''
  if (!form.nom.trim() || !form.email.trim() || !form.message.trim()) {
    errorText.value = 'Veuillez remplir le nom, l’email et le message.'
    return
  }
  loading.value = true
  try {
    await axios.post(route('contact.send'), form, {
      headers: { 'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]')?.content || '' }
    })
    resetForm()
    open.value = false
  } catch (e) {
    errorText.value = "Une erreur est survenue. Veuillez réessayer."
  } finally {
    loading.value = false
  }
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
  letter-spacing: -0.02em;
  line-height: 0.8;
  pointer-events: none;
  user-select: none;
  z-index: 0;
  white-space: nowrap;
}

/* inputs */
.input {
  background: #ffffff;
  border: 1px solid #e6e8eb;
  padding: 0.85rem 1rem;
  border-radius: 0.75rem;
  color: #3f5360;
  transition: box-shadow .18s ease, transform .12s ease, border-color .12s ease;
}
.input:focus {
  outline: none;
  box-shadow: 0 6px 18px rgba(63,83,96,0.06);
  border-color: #3f5360;
  transform: translateY(-1px);
}

/* modal transition */
.fade-scale-enter-active,
.fade-scale-leave-active {
  transition: all .22s ease;
}
.fade-scale-enter-from { opacity: 0; transform: translateY(8px) scale(.98); }
.fade-scale-enter-to { opacity: 1; transform: translateY(0) scale(1); }
.fade-scale-leave-from { opacity: 1; transform: translateY(0) scale(1); }
.fade-scale-leave-to { opacity: 0; transform: translateY(6px) scale(.98); }
</style>
