<template>
  <section
    class="relative bg-center bg-cover bg-fixed contact-section py-16 px-4 sm:py-20 sm:px-8 lg:px-12"
    :class="{ 'lg:bg-fixed': true }"
    role="region"
    aria-labelledby="contact-title"
    ref="contactSection"
    id="contact-form"
  >
    <!-- Overlay -->
    <div class="absolute inset-0 bg-black/70 backdrop-blur-sm z-0" aria-hidden="true"></div>

    <!-- Contenu -->
    <div class="relative z-10 max-w-screen-xl mx-auto grid grid-cols-1 lg:grid-cols-2 gap-12 lg:gap-20">
      
      <!-- Bloc gauche (texte) -->
      <div class="text-white">
        <h2 id="contact-title" class="text-3xl sm:text-4xl md:text-5xl font-extrabold mb-6 leading-tight">
          Transformez vos idées en <span class="text-secondary">réalité</span>
        </h2>
        <div class="w-12 h-1 bg-secondary mt-3 rounded-full mb-8" aria-hidden="true"></div>
        <p class="text-base sm:text-lg leading-relaxed">
          Que vous ayez un projet concret ou juste une idée, notre équipe est prête à vous accompagner à chaque étape.
        </p>
        <p class="mt-3 italic text-gray-300 text-sm sm:text-base">
          Ensemble, donnons vie à votre vision avec créativité et expertise.
        </p>
      </div>

      <!-- Bloc droit (formulaire) avec scroll -->
      <div class="overflow-y-auto max-h-[90vh] lg:max-h-none pr-1">
        
        <!-- Étape 0 -->
        <div v-if="step === 0" class="space-y-6 pb-8">
          <button
            @click="step = 1"
            class="bg-primary text-white py-3 px-6 sm:px-8 rounded-full font-semibold shadow-md hover:bg-indigo-700 transition duration-300 w-full sm:w-auto text-center"
            aria-label="Commencer une demande de projet"
          >
            Faire une demande
          </button>
        </div>

        <!-- Étape 1 -->
        <transition name="fade" mode="out-in">
          <div v-if="step === 1" class="space-y-6 sm:space-y-8 pb-10">
            <h3 class="text-xl sm:text-2xl font-semibold text-gray-800 mb-4">Quel type de projet ?</h3>
            <div class="grid grid-cols-1 sm:grid-cols-2 gap-4 sm:gap-6">
              <button
                v-for="(type, index) in services"
                :key="index"
                @click="form.service = type.title"
                :class="[
                  'py-3 sm:py-4 px-4 sm:px-6 rounded-xl border font-semibold text-left transition-all duration-300 w-full',
                  form.service === type.title
                    ? 'bg-primary text-white border-primary shadow-lg scale-105'
                    : 'bg-gray-100 hover:bg-gray-200 text-gray-700 border-gray-300'
                ]"
                :aria-pressed="form.service === type.title"
              >
                {{ type.title }}
              </button>
            </div>
            <div class="text-right mt-4 sm:mt-6">
              <button
                :disabled="!form.service"
                @click="step++"
                class="bg-primary text-white py-3 px-6 sm:px-8 rounded-full font-semibold shadow-md disabled:opacity-50 disabled:cursor-not-allowed hover:bg-indigo-700 transition duration-300"
              >
                Suivant
              </button>
            </div>
          </div>
        </transition>

        <!-- Étape 2 -->
        <transition name="fade" mode="out-in">
          <div v-if="step === 2" class="space-y-6 sm:space-y-8 pb-10">
            <h3 class="text-xl sm:text-2xl font-semibold text-gray-800 mb-4">Parlez-nous de votre projet</h3>
            <textarea
              v-model="form.message"
              rows="5"
              placeholder="Décrivez votre projet ici..."
              class="w-full p-4 sm:p-5 rounded-xl bg-gray-50 border border-gray-300 text-gray-800 placeholder-gray-400 focus:outline-none focus:ring-4 focus:ring-secondary/30 transition"
              required
              aria-required="true"
            ></textarea>
            <div class="flex justify-between items-center mt-2 sm:mt-4">
              <button
                @click="step--"
                class="text-sm text-gray-600 underline hover:text-gray-800 focus:outline-none focus:ring-2 focus:ring-secondary rounded"
              >
                Précédent
              </button>
              <button
                :disabled="!form.message"
                @click="step++"
                class="bg-primary text-white py-3 px-6 sm:px-8 rounded-full font-semibold shadow-md disabled:opacity-50 disabled:cursor-not-allowed hover:bg-indigo-700 transition duration-300"
              >
                Suivant
              </button>
            </div>
          </div>
        </transition>

        <!-- Étape 3 -->
        <transition name="fade" mode="out-in">
          <div v-if="step === 3" class="space-y-6 sm:space-y-8 pb-10">
            <h3 class="text-xl sm:text-2xl font-semibold text-gray-800 mb-4">Vos coordonnées</h3>
            <div class="grid grid-cols-1 md:grid-cols-2 gap-4 sm:gap-6">
              <input v-model="form.nom" type="text" placeholder="Nom complet" class="input w-full" required />
              <input v-model="form.email" type="email" placeholder="Email" class="input w-full" required />
              <input v-model="form.telephone" type="tel" placeholder="Téléphone" class="input w-full" />
              <input v-model="form.entreprise" type="text" placeholder="Entreprise" class="input w-full" />
            </div>
            <div class="flex justify-between items-center mt-2 sm:mt-4">
              <button
                @click="step--"
                class="text-sm text-gray-600 underline hover:text-gray-800 focus:outline-none focus:ring-2 focus:ring-secondary rounded"
              >
                Précédent
              </button>
              <button
                @click="submitForm"
                :disabled="loading"
                class="bg-primary text-white py-3 px-6 sm:px-8 rounded-full font-semibold shadow-md disabled:opacity-50 disabled:cursor-not-allowed hover:bg-indigo-700 transition duration-300 flex items-center justify-center"
              >
                <span v-if="loading" class="animate-spin mr-2 border-2 border-white border-t-transparent rounded-full w-5 h-5"></span>
                {{ loading ? 'Envoi...' : 'Envoyer' }}
              </button>
            </div>
          </div>
        </transition>
      </div>
    </div>

    <!-- Modale confirmation -->
    <div
      v-if="showModal"
      class="fixed inset-0 bg-black bg-opacity-70 flex items-center justify-center z-50 px-4"
    >
      <div class="bg-white text-gray-800 rounded-2xl shadow-2xl p-8 sm:p-10 max-w-md w-full text-center relative">
        <h2 class="text-2xl sm:text-3xl font-bold mb-4">Merci pour votre demande</h2>
        <p class="mb-6 text-gray-600">{{ modalMessage }}</p>
        <button
          @click="closeModal"
          class="bg-primary text-white py-3 px-8 rounded-full font-semibold hover:bg-indigo-700 focus:outline-none focus:ring-4 focus:ring-indigo-400 transition"
        >
          Fermer
        </button>
      </div>
    </div>
  </section>
</template>

<script setup>
import { reactive, ref } from 'vue'
import axios from 'axios'

const props = defineProps({
  services: { type: Array, default: () => [] },
  backgroundImage: { type: String, default: '' }
})

const step = ref(0)
const loading = ref(false)
const showModal = ref(false)
const modalMessage = ref('Votre demande a bien été envoyée. Nous vous contacterons rapidement.')

const form = reactive({
  nom: '',
  email: '',
  telephone: '',
  entreprise: '',
  service: '',
  message: ''
})

const submitForm = async () => {
  loading.value = true
  try {
    const response = await axios.post(route('contact.send'), form, {
      headers: { 'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').content }
    })
    if (response.data.success) {
      showModal.value = true
      Object.keys(form).forEach(key => form[key] = '')
      step.value = 0
    } else {
      modalMessage.value = 'Une erreur est survenue. Merci de réessayer.'
      showModal.value = true
    }
  } catch (error) {
    modalMessage.value = "Erreur lors de l'envoi. Merci de vérifier vos informations."
    showModal.value = true
  } finally {
    loading.value = false
  }
}

const closeModal = () => showModal.value = false
</script>

<style scoped>
.input {
  background-color: #f9fafb;
  border: 1px solid #d1d5db;
  padding: 0.75rem;
  border-radius: 0.75rem;
  color: #111827;
  transition: all 0.3s ease;
}
.input:focus {
  border-color: #f97316;
  box-shadow: 0 0 0 4px rgba(249,115,22,0.2);
  outline: none;
}

/* Animation fade */
.fade-enter-active, .fade-leave-active {
  transition: all 0.4s ease;
}
.fade-enter-from {
  opacity: 0;
  transform: translateY(20px);
}
.fade-leave-to {
  opacity: 0;
  transform: translateY(-10px);
}
.fade-enter-to, .fade-leave-from {
  opacity: 1;
  transform: translateY(0);
}
.contact-section {
  background-image: url('/images/bg-12.jpg');
  background-size: cover;
  background-position: center;
  background-repeat: no-repeat;
  background-attachment: fixed; /* optionnel pour effet parallax */
}

</style>
