<template>
  <section class="relative min-h-screen bg-[#0F172A] text-white font-sans py-16 px-4 md:px-20">
    <div class="max-w-4xl mx-auto relative z-10">

      <!-- LOGO -->
      <div class="flex justify-center mb-10">
        <img src="/images/logo-fsd.png" alt="FSD Bâtiment" class="h-20 object-contain drop-shadow-md" />
      </div>

      <div class="bg-[#1E293B] rounded-xl shadow-2xl p-10">
        <h2 class="text-3xl font-bold mb-8 text-center text-[#F1F5F9]">Demande de projet</h2>

        <!-- ÉTAPE 0 -->
        <div v-if="step === 0" class="text-center space-y-6">
          <p class="text-lg text-[#CBD5E1]">Un projet en tête ? Lancez votre demande en quelques étapes simples.</p>
          <button
            @click="step = 1"
            class="bg-[#1B2B50] hover:bg-[#14213d] text-white py-3 px-8 rounded text-lg font-semibold transition shadow-md"
          >
            Faire une demande
          </button>
        </div>

        <!-- ÉTAPE 1 : Type de projet -->
        <div v-if="step === 1" class="space-y-6">
          <h3 class="text-xl font-semibold mb-4">Quel type de projet ?</h3>
          <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
            <button
              v-for="(type, index) in services"
              :key="index"
              @click="form.service = type.title"
              :class="[
                'py-3 px-4 rounded-lg border text-left font-medium transition duration-200',
                form.service === type.title
                  ? 'bg-[#1B2B50] border-[#1B2B50] text-white'
                  : 'bg-[#1E293B] hover:bg-[#334155] border-[#334155] text-[#CBD5E1]'
              ]"
            >
              {{ type.title }}
            </button>
          </div>
          <div class="text-right mt-6">
            <button
              :disabled="!form.service"
              @click="step++"
              class="bg-[#1B2B50] hover:bg-[#14213d] text-white py-2 px-6 rounded font-semibold transition disabled:opacity-50"
            >
              Suivant
            </button>
          </div>
        </div>

        <!-- ÉTAPE 2 : Détails projet -->
        <div v-if="step === 2" class="space-y-6">
          <h3 class="text-xl font-semibold mb-4">Parlez-nous de votre projet</h3>
          <textarea
            v-model="form.message"
            rows="6"
            placeholder="Décrivez votre projet ici..."
            class="w-full p-4 rounded bg-[#1E293B] border border-[#334155] text-white placeholder-[#94A3B8] focus:outline-none focus:ring-2 focus:ring-[#FBBF24]"
            required
          ></textarea>
          <div class="flex justify-between">
            <button @click="step--" class="text-white underline">Précédent</button>
            <button
              :disabled="!form.message"
              @click="step++"
              class="bg-[#1B2B50] hover:bg-[#14213d] text-white py-2 px-6 rounded font-semibold transition disabled:opacity-50"
            >
              Suivant
            </button>
          </div>
        </div>

        <!-- ÉTAPE 3 : Coordonnées -->
        <div v-if="step === 3" class="space-y-6">
          <h3 class="text-xl font-semibold mb-4">Vos coordonnées</h3>
          <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
            <input v-model="form.nom" type="text" placeholder="Nom complet"
              class="bg-[#1E293B] border border-[#334155] p-3 rounded placeholder-[#94A3B8] text-white focus:ring-2 focus:ring-[#FBBF24]" required />
            <input v-model="form.email" type="email" placeholder="Email"
              class="bg-[#1E293B] border border-[#334155] p-3 rounded placeholder-[#94A3B8] text-white focus:ring-2 focus:ring-[#FBBF24]" required />
            <input v-model="form.telephone" type="tel" placeholder="Téléphone"
              class="bg-[#1E293B] border border-[#334155] p-3 rounded placeholder-[#94A3B8] text-white focus:ring-2 focus:ring-[#FBBF24]" required />
            <input v-model="form.entreprise" type="text" placeholder="Entreprise"
              class="bg-[#1E293B] border border-[#334155] p-3 rounded placeholder-[#94A3B8] text-white focus:ring-2 focus:ring-[#FBBF24]" required />
          </div>
          <div class="flex justify-between">
            <button @click="step--" class="text-white underline">Précédent</button>
            <button
              @click="submitForm"
              :disabled="loading"
              class="bg-[#1B2B50] hover:bg-[#14213d] text-white py-2 px-6 rounded font-semibold transition disabled:opacity-50"
            >
              {{ loading ? 'Envoi...' : 'Envoyer' }}
            </button>
          </div>
        </div>
      </div>
    </div>

    <!-- ✅ Modale de confirmation -->
    <div v-if="showModal" class="fixed inset-0 bg-black bg-opacity-70 flex items-center justify-center z-50">
      <div class="bg-white text-black rounded-lg shadow-lg p-8 max-w-md text-center">
        <h2 class="text-xl font-bold mb-4">Merci pour votre demande</h2>
        <p class="mb-6">{{ modalMessage }}</p>
        <button @click="closeModal" class="bg-[#1B2B50] text-white py-2 px-6 rounded hover:bg-[#14213d]">Fermer</button>
      </div>
    </div>
  </section>
</template>

<script setup>
import { reactive, ref } from 'vue'
import axios from 'axios'

const props = defineProps({
  services: { type: Array, default: () => [] }
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
    const response = await axios.post(
      route('contact.send'),
      form,
      {
        headers: {
          'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').content
        }
      }
    )

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

const closeModal = () => {
  showModal.value = false
}
</script>
