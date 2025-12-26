<template>
  <section
    id="about-stats"
    class="relative bg-gradient-to-b from-[#f7f8f9] to-[#eef0f1] py-20 px-6 sm:px-10 lg:px-20 overflow-hidden"
    role="region"
    aria-labelledby="about-title"
  >
    <!-- Mot de fond décoratif -->
    <h2 aria-hidden="true" class="hero-bg-word select-none pointer-events-none">
      Values
    </h2>

    <div class="relative max-w-6xl mx-auto grid md:grid-cols-2 gap-16 items-center z-10">
      <!-- Texte principal -->
      <div class="space-y-8">
        <p
          id="about-title"
          class="text-4xl sm:text-5xl lg:text-6xl font-extrabold tracking-tight text-[#3f5360] leading-tight"
        >
          {{ content.title || "Notre priorité" }}
        </p>

        <div class="flex items-center gap-6">
          <div class="h-[1px] w-28 bg-[#c98f60]/70"></div>
          <p class="text-lg text-[#5c6670] max-w-xl leading-relaxed">
            {{ content.description || "La satisfaction de nos clients est au cœur de notre mission." }}
          </p>
        </div>

        <!-- Statistiques -->
        <div class="grid grid-cols-1 sm:grid-cols-2 gap-6 mt-10">
          <div
            v-for="(stat, index) in content.stats || []"
            :key="index"
            class="bg-white border border-[#d9dbdd]/60 shadow-sm rounded-2xl p-6 text-center transition-all duration-500 hover:scale-[1.03] hover:shadow-lg"
          >
            <h3 class="text-4xl font-extrabold text-[#3f5360] mb-1">
              <span ref="statRefs">{{ stat.value }}</span>+
            </h3>
            <p class="text-[#c98f60] font-semibold text-sm uppercase tracking-wide">
              {{ stat.label }}
            </p>
            <p class="text-[#5c6670]/80 text-xs mt-1 leading-relaxed">
              {{ stat.long_description }}
            </p>
          </div>
        </div>

        <!-- Bouton CTA -->
        <div v-if="content.cta" class="mt-10">
          <a
            :href="content.cta.href"
            class="inline-flex items-center gap-3 px-6 py-3 bg-[#3f5360] text-white rounded-full shadow-md hover:bg-[#2f3d46] transition"
          >
            {{ content.cta.label }}
            <svg class="w-5 h-5" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5">
              <path stroke-linecap="round" stroke-linejoin="round" d="M5 12h14M12 5l7 7-7 7" />
            </svg>
          </a>
        </div>
      </div>

      <!-- Illustration -->
      <div
        v-if="content.image"
        class="relative flex justify-center items-center w-full h-96 md:h-full"
      >
        <img
          :src="content.image"
          :alt="content.image_alt || 'Illustration valeurs Hudata Dev'"
          class="rounded-2xl shadow-xl object-contain w-full h-full transition-transform duration-500 hover:scale-105"
        />
      </div>
    </div>
  </section>
</template>

<script setup>
import { ref, onMounted, nextTick } from "vue"

const props = defineProps({
  content: {
    type: Object,
    default: () => ({
      title: "Notre priorité",
      description:
        "La satisfaction de nos clients est au cœur de notre mission.",
      stats: [
        {
          value: 100,
          label: "Clients satisfaits",
          long_description:
            "Chaque client est unique et nous mettons tout en œuvre pour répondre à ses attentes.",
        },
        {
          value: 5,
          label: "Années d’expérience",
          long_description:
            "Notre expertise nous permet de garantir qualité et fiabilité.",
        },
      ],
      image: "",
      image_alt: "",
      cta: { label: "Contactez-nous", href: "#contact" },
    }),
  },
})

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
    if ("IntersectionObserver" in window) {
      const observer = new IntersectionObserver(
        (entries, obs) => {
          entries.forEach((entry) => {
            if (entry.isIntersecting) {
              statRefs.value.forEach((el, idx) => {
                const target = parseInt(props.content.stats[idx].value, 10)
                animateNumber(el, target)
              })
              obs.disconnect()
            }
          })
        },
        { threshold: 0.5 }
      )
      statRefs.value.forEach((el) => observer.observe(el))
    } else {
      statRefs.value.forEach((el, idx) => {
        el.innerText = props.content.stats[idx].value
      })
    }
  })
})
</script>

<style scoped>
.hero-bg-word {
  position: absolute;
  left: 50%;
  top: 6%;
  transform: translateX(-50%);
  font-size: clamp(4rem, 9vw, 7rem);
  font-weight: 800;
  color: rgba(63, 83, 96, 0.05);
  letter-spacing: -0.02em;
  line-height: 0.8;
  pointer-events: none;
  user-select: none;
  z-index: 0;
  white-space: nowrap;
}

.stat-card {
  opacity: 0;
  animation: fadeUp 0.8s ease forwards;
}
.stat-card:nth-child(1) { animation-delay: 0.1s; }
.stat-card:nth-child(2) { animation-delay: 0.3s; }

@keyframes fadeUp {
  0% { opacity: 0; transform: translateY(20px); }
  100% { opacity: 1; transform: translateY(0); }
}
</style>
