<script setup>
import { Link } from '@inertiajs/vue3'
import DashboardLayout from '@/Layouts/AuthenticatedLayout.vue'

defineProps({
  services: Array
})
</script>

<template>
  <DashboardLayout>
    <div class="max-w-6xl mx-auto p-6">

      <!-- Header -->
      <div class="flex flex-col sm:flex-row justify-between items-start sm:items-center mb-6 gap-4">
        <h1 class="text-3xl font-bold text-gray-800">Services</h1>
        <Link 
          :href="route('services.create')" 
          class="bg-blue-600 hover:bg-blue-700 text-white px-5 py-2 rounded-lg shadow transition-colors duration-300"
        >
          Ajouter un service
        </Link>
      </div>

      <!-- Table Desktop -->
      <div class="hidden md:block overflow-x-auto shadow-md rounded-lg">
        <table class="w-full border-collapse">
          <thead class="bg-blue-600 text-white">
            <tr>
              <th class="p-3 text-left">Titre</th>
              <th class="p-3 text-left">Description</th>
              <th class="p-3 text-left">Actions</th>
            </tr>
          </thead>
          <tbody class="bg-white">
            <tr 
              v-for="service in services" 
              :key="service.id" 
              class="border-b hover:bg-gray-50 transition-colors duration-300"
            >
              <td class="p-3">{{ service.title }}</td>
              <td class="p-3">{{ service.description }}</td>
              <td class="p-3 flex gap-3">
                <Link 
                  :href="route('services.edit', service.id)" 
                  class="text-blue-600 hover:text-blue-800 font-medium"
                >
                  Modifier
                </Link>
                <Link 
                  as="button" 
                  method="delete" 
                  :href="route('services.destroy', service.id)" 
                  class="text-red-600 hover:text-red-800 font-medium"
                >
                  Supprimer
                </Link>
              </td>
            </tr>
          </tbody>
        </table>
      </div>

      <!-- Cards Mobile -->
      <div class="md:hidden grid gap-4">
        <div 
          v-for="service in services" 
          :key="service.id" 
          class="bg-white p-4 rounded-lg shadow hover:shadow-lg transition-shadow duration-300"
        >
          <h3 class="font-bold text-lg text-gray-800">{{ service.title }}</h3>
          <p class="text-gray-600 mt-2">{{ service.description }}</p>
          <div class="mt-3 flex gap-3">
            <Link 
              :href="route('services.edit', service.id)" 
              class="text-blue-600 hover:text-blue-800 font-medium"
            >
              Modifier
            </Link>
            <Link 
              as="button" 
              method="delete" 
              :href="route('services.destroy', service.id)" 
              class="text-red-600 hover:text-red-800 font-medium"
            >
              Supprimer
            </Link>
          </div>
        </div>
      </div>

    </div>
  </DashboardLayout>
</template>
