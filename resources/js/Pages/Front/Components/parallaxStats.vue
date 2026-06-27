<template>
  <section
    id="about-stats"
    class="relative overflow-hidden py-20 lg:py-28 px-6 sm:px-10 lg:px-20
           bg-gradient-to-b from-[#f7f8f9] to-[#eef0f1]"
  >
    <!-- Mot de fond -->
    <div class="hero-bg-word">
      Values
    </div>

    <div class="relative max-w-7xl mx-auto grid lg:grid-cols-2 gap-16 items-center">

      <!-- LEFT -->
      <div>

        <!-- Title -->
        <p class="text-4xl sm:text-5xl lg:text-6xl font-extrabold text-[#3f5360] leading-tight">
          {{ content.title || "Notre priorité" }}
        </p>

        <!-- separator -->
        <div class="mt-6 flex items-center gap-4">
          <div class="h-[2px] w-24 bg-[#c98f60]"></div>
          <div class="h-[2px] w-10 bg-[#3f5360]/20"></div>
        </div>

        <!-- description -->
        <p class="mt-6 text-lg text-[#5c6670] max-w-xl leading-relaxed">
          {{ content.description }}
        </p>

        <!-- CTA -->
        <div v-if="content.cta" class="mt-10">
          <a
            :href="content.cta.href"
            class="inline-flex items-center gap-3 px-6 py-3 rounded-full
                   bg-[#3f5360] text-white
                   hover:bg-[#2f3d46]
                   transition-all duration-300 shadow-md"
          >
            {{ content.cta.label }}

            <svg class="w-5 h-5" viewBox="0 0 24 24" fill="none" stroke="currentColor">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5"
                    d="M5 12h14M12 5l7 7-7 7"/>
            </svg>
          </a>
        </div>

      </div>

      <!-- RIGHT -->
      <div class="grid sm:grid-cols-2 gap-6">

        <div
          v-for="(stat, index) in content.stats"
          :key="index"
          class="group bg-white/80 backdrop-blur-xl
                 border border-white/60
                 rounded-3xl p-8 text-center
                 shadow-sm hover:shadow-2xl
                 transition-all duration-500
                 hover:-translate-y-2"
        >

          <!-- number -->
          <h3 class="text-4xl font-extrabold text-[#3f5360] mb-2">
            <span ref="statRefs">{{ stat.value }}</span>+
          </h3>

          <!-- label -->
          <p class="text-[#c98f60] font-semibold text-sm uppercase tracking-wide">
            {{ stat.label }}
          </p>

          <!-- description -->
          <p class="text-[#5c6670]/80 text-xs mt-3 leading-relaxed">
            {{ stat.long_description }}
          </p>

        </div>

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
  top: 8%;
  transform: translateX(-50%);
  font-size: clamp(5rem, 12vw, 9rem);
  font-weight: 800;
  color: rgba(63, 83, 96, 0.05);
  white-space: nowrap;
  pointer-events: none;
  user-select: none;
}
</style>
