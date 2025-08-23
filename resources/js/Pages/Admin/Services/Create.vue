<script setup>
import { useForm } from '@inertiajs/vue3'
import DashboardLayout from '@/Layouts/AuthenticatedLayout.vue'
import IconSelector from '@/Components/IconSelector.vue'

const form = useForm({
  title: '',
  description: '',
  long_description: '',
  icon: null
})

const submit = () => {
  form.post(route('services.store'))
}
</script>
<style scoped>
.input {
  width: 100%;
  padding: 0.5rem;
  border: 1px solid #ccc;
  border-radius: 0.375rem;
  font-size: 1rem;
}
.btn-secondary {
  background-color: #f3f4f6;
  color: #111827;
  padding: 0.5rem 1rem;
  border-radius: 0.375rem;
}
</style>

<template>
    <DashboardLayout>
    <br />
  <div class="max-w-2xl mx-auto bg-white p-6 rounded shadow">
    <h1 class="text-xl font-bold mb-4">Ajouter un service</h1>
<form @submit.prevent="submit" class="p-4 space-y-4">
        <input v-model="form.title" type="text" placeholder="Titre" class="input" />
        <textarea v-model="form.description" rows="2" placeholder="Description courte" class="input" />

        <!-- ✅ Description longue en HTML -->
        <div>
          <label class="block font-semibold mb-1">Description longue (HTML)</label>
          <QuillEditor
            v-model:content="form.long_description"
            contentType="html"
            theme="snow"
            class="bg-white rounded shadow h-[150px] resize-y overflow-auto"
          />
        </div>

        <!-- Sélecteur d'icône -->
        <IconSelector v-model="form.icon" />
    <button
  type="submit"
  class="bg-blue-600 hover:bg-blue-700 text-white font-semibold px-6 py-2 rounded-lg shadow-md transition-colors duration-300"
>
  Enregistrer
</button>

    </form>
  </div>
  </DashboardLayout>
</template>
