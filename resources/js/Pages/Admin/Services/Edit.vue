<script setup>
import { useForm } from '@inertiajs/vue3'
import DashboardLayout from '@/Layouts/AuthenticatedLayout.vue'
import IconSelector from '@/Components/IconSelector.vue'

const props = defineProps({
  service: Object
})

const form = useForm({
  title: props.service.title,
  description: props.service.description,
  long_description: props.service.long_description || '',
  icon: props.service.icon || null
})

const submit = () => {
  form.put(route('services.update', props.service.id))
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
    <h1 class="text-xl font-bold mb-4">Modifier le service</h1>
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
        
        <button type="submit" class="bg-blue-600 text-white px-4 py-2 rounded">Mettre à jour</button>
    </form>
  </div>
    </DashboardLayout>      
</template>
