<template>
  <form class="space-y-6">
    <!-- Section: Services -->
    <div v-for="(item, index) in localForm.items" :key="index" class="border rounded-lg mb-4 bg-white shadow-md">
      <!-- Titre cliquable -->
      <div
        class="flex justify-between items-center p-4 bg-gray-100 cursor-pointer"
        @click="toggleService(index)"
      >
        <span class="font-semibold text-lg">{{ item.title || 'Service' }}</span>
        <span class="text-xl">{{ expandedIndex === index ? '−' : '+' }}</span>
      </div>

      <!-- Champs visibles si déplié -->
      <div v-show="expandedIndex === index" class="p-4 space-y-4">
        <input v-model="item.title" type="text" placeholder="Titre" class="input" />
        <textarea v-model="item.description" rows="2" placeholder="Description courte" class="input" />

        <!-- ✅ Description longue en HTML -->
        <div>
          <label class="block font-semibold mb-1">Description longue (HTML)</label>
          <QuillEditor
            v-model:content="item.longDescription"
            contentType="html"
            theme="snow"
            class="bg-white rounded shadow h-[150px] resize-y overflow-auto"
          />
        </div>

        <!-- Sélecteur d'icône -->
        <IconSelector v-model="item.icon" />

        <button class="text-red-600" type="button" @click="removeItem(index)">
          Supprimer ce service
        </button>
      </div>
    </div>

    <button type="button" class="btn-secondary" @click="addItem">+ Ajouter un service</button>
  </form>
</template>

<script setup>
import { ref, computed } from 'vue'
import IconSelector from '@/Components/IconSelector.vue'

const props = defineProps({ form: Object })
const emit = defineEmits(['update:form'])
const localForm = computed({
  get: () => props.form,
  set: value => emit('update:form', value)
})

const expandedIndex = ref(null)
const toggleService = index => {
  expandedIndex.value = expandedIndex.value === index ? null : index
}

function addItem() {
  if (!Array.isArray(localForm.value.items)) localForm.value.items = []
  localForm.value.items.push({ title: '', description: '', longDescription: '', icon: '' })
}

function removeItem(index) {
  localForm.value.items.splice(index, 1)
  if (expandedIndex.value === index) expandedIndex.value = null
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
