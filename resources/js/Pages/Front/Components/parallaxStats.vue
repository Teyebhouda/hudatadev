<template>
  <section class="py-20 bg-gray-50 text-gray-800" ref="parallaxSection" id="parallax-stats">
    <div class="max-w-7xl mx-auto px-6 md:px-10 grid md:grid-cols-2 gap-12 items-center">
      
      <!-- 🧾 Texte + Statistiques -->
      <div ref="textContainer" class="opacity-0">

        <h2 class="text-3xl sm:text-4xl font-bold leading-tight mb-4" tabindex="0">
          {{ content.title || "Titre par défaut" }}
        </h2>
        <p class="text-base sm:text-lg text-gray-600 mb-6" tabindex="0">
          {{ content.description || "Description par défaut" }}
        </p>

        <!-- 🔢 Stats -->
        <div class="grid grid-cols-2 gap-6 mt-6">
          <div
            v-for="(stat, index) in content.stats || []"
            :key="index"
            class="p-5 bg-white shadow rounded-xl text-center transform transition-all duration-300 hover:scale-105"
            role="listitem"
          >
            <h3 class="text-3xl font-extrabold  text-secondary"><span ref="statRefs">{{ stat.value }}</span></h3>
            <p class="text-sm text-gray-500">{{ stat.label }}</p>
          </div>
        </div>
      </div>

      <!-- 🖼️ Images Superposées -->
     <div ref="imageWrapper" class="relative w-full h-[400px] hidden md:block opacity-0">

        <!-- Image 1 -->
        <div
          class="absolute top-0 left-0 w-2/3 h-3/4 rounded-xl overflow-hidden shadow-lg animate-slideInLeft"
        >
          <img
            :src="content.background_image || defaultImage"
            :alt="content.image_alt || 'Image 1'"
            class="w-full h-full object-cover"
          />
        </div>

        <!-- Image 2 superposée -->
        <div
          class="absolute bottom-0 right-0 w-2/3 h-3/4 rounded-xl overflow-hidden shadow-2xl border-4 border-white animate-slideInRight delay-300"
        >
          <img
            :src="content.image || defaultImage2"
            :alt="content.image2_alt || 'Image 2'"
            class="w-full h-full object-cover"
          />
        </div>
      </div>
    </div>
  </section>
</template>
<script setup>
import { ref, onMounted, nextTick } from 'vue'
const textContainer = ref(null)
const imageWrapper = ref(null)

const props = defineProps({
  content: {
    type: Object,
    default: () => ({
      title: '',
      description: '',
      stats: [],
      image: '',
      image2: '',
      image_alt: '',
      image2_alt: ''
    })
  }
})

const defaultImage = 'https://source.unsplash.com/800x600/?construction,building'
const defaultImage2 = 'https://source.unsplash.com/800x600/?architecture,design'

const statRefs = ref([])

const animateNumber = (el, target) => {
  let current = 0
  const increment = target / 100
  const interval = setInterval(() => {
    current += increment
    if (current >= target) {
      el.innerText = target
      clearInterval(interval)
    } else {
      el.innerText = Math.floor(current)
    }
  }, 15)
}

onMounted(() => {
  nextTick(() => {
    if ('IntersectionObserver' in window) {
      const observer = new IntersectionObserver((entries, obs) => {
        entries.forEach(entry => {
          if (entry.isIntersecting) {
            statRefs.value.forEach((el, idx) => {
              const target = parseInt(props.content.stats[idx].value, 10)
              animateNumber(el, target)
            })
            obs.disconnect()
          }
        })
      }, { threshold: 0.5 })
      statRefs.value.forEach(el => observer.observe(el))
    } else {
      statRefs.value.forEach((el, idx) => {
        el.innerText = props.content.stats[idx].value
      })
    }
  })
  // Observer pour animations globales
const animateOnVisible = (elementRef, animationClass) => {
  if (!elementRef.value) return

  const observer = new IntersectionObserver((entries, obs) => {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        elementRef.value.classList.add(animationClass)
        obs.disconnect()
      }
    })
  }, { threshold: 0.3 })

  observer.observe(elementRef.value)
}

animateOnVisible(textContainer, 'animate-fadeInLeft')
animateOnVisible(imageWrapper, 'animate-fadeInRight')

})
</script>
<style scoped>

@keyframes slideInLeft {
  from {
    opacity: 0;
    transform: translateX(-40px);
  }
  to {
    opacity: 1;
    transform: translateX(0);
  }
}

@keyframes slideInRight {
  from {
    opacity: 0;
    transform: translateX(40px);
  }
  to {
    opacity: 1;
    transform: translateX(0);
  }
}

.animate-slideInLeft {
  animation: slideInLeft 1s ease forwards;
}

.animate-slideInRight {
  animation: slideInRight 1s ease forwards;
}

.delay-300 {
  animation-delay: 0.3s;
}

@keyframes fadeInLeft {
  from {
    opacity: 0;
    transform: translateX(-30px);
  }
  to {
    opacity: 1;
    transform: translateX(0);
  }
}

@keyframes fadeInRight {
  from {
    opacity: 0;
    transform: translateX(30px);
  }
  to {
    opacity: 1;
    transform: translateX(0);
  }
}

.animate-fadeInLeft {
  animation: fadeInLeft 0.8s ease forwards;
}

.animate-fadeInRight {
  animation: fadeInRight 0.8s ease forwards;
}

.delay-300 {
  animation-delay: 0.3s;
}

.delay-500 {
  animation-delay: 0.5s;
}

</style>

