<template>
  <section class="bg-white py-20 px-4">
    <div class="max-w-screen-xl mx-auto">
      <!-- Titre -->
      <h2 class="text-4xl font-bold text-center text-gray-800 mb-4 relative">
        {{ content.title }}
        <span class="block w-16 h-[2px] bg-[#F8A91D] mx-auto mt-2"></span>
      </h2>
      <p class="text-lg text-center text-gray-500 mb-12">{{ content.subtitle }}</p>

      <!-- Onglets -->
      <div class="border border-[#f8a91d66] rounded-t-xl overflow-hidden">
        <div class="flex divide-x divide-gray-200">
          <button
            v-for="(service, index) in content.items"
            :key="service.title"
            @click="activeTab = index"
            class="flex-1 text-center py-3 px-4 text-sm sm:text-base font-medium transition-all relative"
            :class="activeTab === index
              ? 'text-[#F8A91D] bg-white'
              : 'text-gray-600 hover:text-[#F8A91D] bg-[#f9f9f9]'"
          >
            {{ service.title }}
            <div
              v-if="activeTab === index"
              class="absolute bottom-0 left-0 w-full h-[3px] bg-[#F8A91D]"
            />
          </button>
        </div>

        <!-- Contenu actif -->
        <div class="grid grid-cols-1 md:grid-cols-2 gap-8 bg-[#F8F9FB] px-6 py-8 border-t border-gray-100 rounded-b-xl">
          <!-- Image -->
          <div class="flex justify-center items-start">
            <img
              src="/images/worker-silhouette.png"
              alt="Worker silhouette"
              class="max-h-[300px] object-contain opacity-20"
            />
          </div>

          <!-- Texte -->
          <div>
            <h3 class="text-2xl font-bold text-[#F8A91D] mb-2">
              {{ content.items[activeTab].title }}
            </h3>
            <p class="font-semibold text-gray-800 mb-4">
              {{ content.items[activeTab].subtitle }}
            </p>
            <div
              class="text-gray-700 leading-relaxed space-y-3 text-sm sm:text-base"
              v-html="content.items[activeTab].description"
            />
          </div>
        </div>
      </div>
    </div>
  </section>
</template>

<script setup>
import { ref } from 'vue'

const props = defineProps({
  content: {
    type: Object,
    default: () => ({
      title: '',
      subtitle: '',
      items: []
    })
  }
})

const activeTab = ref(0)
</script>
