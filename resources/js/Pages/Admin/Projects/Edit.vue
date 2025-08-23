<script setup>
import { useForm } from '@inertiajs/vue3'
import DashboardLayout from '@/Layouts/AuthenticatedLayout.vue'
import { ref } from 'vue'

const props = defineProps({
  project: Object
})

// Formulaire Inertia
const form = useForm({
  title: props.project?.title || '',
  description: props.project?.description || '',
  location: props.project?.location || '',
  date: props.project?.date || '',
  images: [], // fichiers sélectionnés
})

// Aperçus images (existantes + nouvelles)
const previews = ref(
  props.project?.images?.map(img => '/storage/' + img.path) || []
)

// Gestion des fichiers sélectionnés
const handleFiles = (e) => {
  const files = Array.from(e.target.files)
  form.images.push(...files)
  previews.value.push(...files.map(f => URL.createObjectURL(f)))
}

// Supprimer un aperçu/image sélectionnée
const removeFile = (index) => {
  form.images.splice(index, 1)
  previews.value.splice(index, 1)
}

// Soumission du formulaire
const submit = () => {
  form.put(route('projects.update', props.project.id), {
    forceFormData: true, // important pour les fichiers
    onSuccess: () => console.log('Projet mis à jour avec succès'),
    onError: err => console.error('Erreur lors de la mise à jour', err),
  })
}
</script>

<template>
  <DashboardLayout>
    <div class="max-w-3xl mx-auto bg-white p-6 rounded-xl shadow">
      <h1 class="text-2xl font-bold mb-4">Modifier le projet</h1>

      <form @submit.prevent="submit" class="space-y-4">
        <input
          v-model="form.title"
          type="text"
          placeholder="Titre"
          class="w-full border rounded p-2 focus:ring focus:ring-blue-300"
        />
        <textarea
          v-model="form.description"
          placeholder="Description"
          class="w-full border rounded p-2 focus:ring focus:ring-blue-300"
        ></textarea>
        <input
          v-model="form.location"
          type="text"
          placeholder="Lieu"
          class="w-full border rounded p-2 focus:ring focus:ring-blue-300"
        />
        <input
          v-model="form.date"
          type="date"
          class="w-full border rounded p-2 focus:ring focus:ring-blue-300"
        />

        <!-- Upload fichiers -->
        <input
          type="file"
          multiple
          accept=".png,.jpg,.jpeg,.webp,.avif"
          @change="handleFiles"
          class="w-full border p-2"
        />

        <!-- Aperçus -->
        <div class="flex gap-2 flex-wrap mt-2">
          <div v-for="(img, i) in previews" :key="i" class="relative w-24 h-24">
            <img
              :src="img"
              class="w-24 h-24 object-cover rounded border shadow-sm"
            />
            <button
              type="button"
              @click="removeFile(i)"
              class="absolute top-1 right-1 bg-red-600 text-white rounded-full px-1.5 py-0.5 text-xs hover:bg-red-700"
            >
              ✕
            </button>
          </div>
        </div>

        <button
          type="submit"
          class="bg-green-600 text-white px-4 py-2 rounded hover:bg-green-700 transition"
        >
          Mettre à jour
        </button>
      </form>
    </div>
  </DashboardLayout>
</template>
