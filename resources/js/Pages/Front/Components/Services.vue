<template>
  <section
  ref="servicesSection"
  id="services-section"
  class="relative py-24 transition-all duration-700 ease-out overflow-hidden bg-gradient-to-br from-white via-gray-50 to-gray-100"
    :class="{ 'opacity-100 translate-y-0': isVisible, 'opacity-0 translate-y-10': !isVisible }"
  >
    <!-- Fond décoratif -->
    <div class="absolute inset-0 pointer-events-none">
      <div class="absolute -top-20 -right-20 w-96 h-96 bg-primary/10 rounded-full blur-3xl animate-pulse"></div>
      <div class="absolute -bottom-24 -left-16 w-80 h-80 bg-indigo-200/20 rounded-full blur-2xl animate-bounce-slow"></div>
    </div>

    <div class="relative max-w-screen-xl mx-auto px-4 sm:px-6 lg:px-8">
      <!-- Titre -->
      <div class="mb-12 text-left">
        <h2 class="text-3xl sm:text-4xl font-extrabold text-gray-900 mb-4 leading-tight">
          {{ content.title }}
        </h2>
        <div class="flex items-center gap-3 mb-4">
          <div class="w-12 h-1 bg-primary rounded-full"></div>
          <span class="text-gray-400 text-sm uppercase tracking-widest">{{ content.subtitle }}</span>
        </div>
        <p class="text-base sm:text-lg text-gray-600 mt-2 max-w-2xl leading-relaxed">
          {{ content.description }}
        </p>
      </div>

      <!-- Onglets -->
      <div class="-mx-4 px-4 overflow-x-auto no-scrollbar relative ">
        <div
          class="flex gap-6 pt-2 border-b border-gray-200 pb-2 whitespace-nowrap border-b border-gray-200 pb-2 snap-x snap-mandatory"
          role="tablist"
        >
          <button
            v-for="(service, index) in content.items"
            :key="service.title"
            role="tab"
            :aria-selected="activeTab === index"
            :tabindex="activeTab === index ? 0 : -1"
            @click="activeTab = index"
            @keydown.left.prevent="prevTab"
            @keydown.right.prevent="nextTab"
            class="snap-start relative pb-2 px-6 py-2 rounded-full transition-all duration-300 font-medium focus:outline-none focus:ring-2 focus:ring-primary/70 transform"
            :class="[
              activeTab === index
                ? 'bg-primary text-white shadow-md -translate-y-0.5'
                : 'bg-gray-100 text-gray-600 hover:bg-gray-200 hover:-translate-y-0.5 hover:shadow-md'
            ]"
          >
            {{ service.title }}
          </button>
        </div>
      </div>

      <!-- Contenu -->
      <transition name="fade" mode="out-in">
        <div
          :key="activeTab"
          class="mt-12 grid grid-cols-1 md:grid-cols-2 gap-10 bg-gradient-to-br from-gray-50 via-white to-gray-100 rounded-2xl shadow-xl ring-1 ring-gray-100 p-6 sm:p-12 transition-all duration-500 relative overflow-hidden"
        >
          <!-- Image -->
          <div class="w-full h-full min-h-[300px] flex items-center justify-center overflow-hidden rounded-2xl relative group">
            <img
              :src="content.items[activeTab].background_image || '/images/worker-silhouette.png'"
              :alt="`Illustration pour ${content.items[activeTab].title}`"
              class="w-full h-full object-cover rounded-2xl shadow-2xl transition-transform duration-700 ease-in-out group-hover:scale-105 group-hover:-translate-y-1 transform"
            />
            <div class="absolute inset-0 bg-gradient-to-t from-black/40 via-black/10 to-transparent opacity-0 group-hover:opacity-100 transition duration-500"></div>
          </div>

          <!-- Texte -->
          <div :key="activeTab + '-text'" class="animate-fadeInRight delay-200">
            <h3 class="text-2xl sm:text-3xl font-semibold text-gray-900 mb-2">
              {{ content.items[activeTab].title }}
            </h3>
            <p class="text-primary text-lg font-medium mb-4">
              {{ content.items[activeTab].subtitle }}
            </p>
            <div
              class="prose prose-sm sm:prose-lg max-w-none text-gray-700 leading-relaxed"
              v-html="content.items[activeTab].description"
            />
            <div
              class="mt-4 text-gray-500 text-sm sm:text-base leading-relaxed"
              v-html="content.items[activeTab].long_description"
            />

            <!-- Bouton CTA -->
            <div class="mt-6 flex gap-4">
              <a
                href="#contact-form"
                class="px-6 py-3 bg-primary text-white font-semibold rounded-xl shadow-md hover:bg-primary/90 hover:-translate-y-1 hover:shadow-lg transition transform duration-300 focus:outline-none focus:ring-2 focus:ring-primary/70"
              >
                Demander un devis
              </a>
            </div>
          </div>
        </div>
      </transition>
    </div>
  </section>
</template>

<script setup>
import { ref, watch, onMounted } from 'vue'

const servicesSection = ref(null)
const isVisible = ref(false)

onMounted(() => {
  if ('IntersectionObserver' in window) {
    const observer = new IntersectionObserver((entries) => {
      entries.forEach(entry => {
        if (entry.isIntersecting) {
          isVisible.value = true
          observer.disconnect()
        }
      })
    }, { threshold: 0.2 })
    if (servicesSection.value) observer.observe(servicesSection.value)
  } else {
    isVisible.value = true
  }
})

const props = defineProps({
  content: {
    type: Object,
    default: () => ({
      title: "Nos services",
      subtitle: "Des prestations adaptées à vos besoins dans le bâtiment et la construction.",
      items: []
    })
  },
  initialService: [String, Number]
})

const activeTab = ref(0)

watch(
  () => props.initialService,
  (serviceId) => {
    if (serviceId) {
      const idx = props.content.items.findIndex(item => item.id === serviceId)
      if (idx !== -1) activeTab.value = idx
    }
  },
  { immediate: true }
)

const prevTab = () => {
  activeTab.value = (activeTab.value - 1 + props.content.items.length) % props.content.items.length
}

const nextTab = () => {
  activeTab.value = (activeTab.value + 1) % props.content.items.length
}
</script>

<style scoped>
.fade-enter-active, .fade-leave-active {
  transition: all 0.5s cubic-bezier(0.22, 1, 0.36, 1);
}
.fade-enter-from {
  opacity: 0;
  transform: scale(0.98) translateY(10px);
}
.fade-leave-to {
  opacity: 0;
  transform: scale(0.98) translateY(-10px);
}

@keyframes fadeInRight {
  0% { opacity: 0; transform: translateX(30px); }
  100% { opacity: 1; transform: translateX(0); }
}
.animate-fadeInRight {
  animation: fadeInRight 0.8s ease-out forwards;
}

/* Animation lente pour les éléments décoratifs */
@keyframes bounce-slow {
  0%, 100% { transform: translateY(0px); }
  50% { transform: translateY(-15px); }
}
.animate-bounce-slow {
  animation: bounce-slow 6s infinite ease-in-out;
}
</style>
