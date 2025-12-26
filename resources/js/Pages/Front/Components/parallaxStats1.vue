<template>
 <section
  class="relative bg-fixed bg-center bg-cover py-24 px-6 sm:px-12 overflow-hidden mt-[-1px]"
  :style="{ backgroundImage: `url('${content.background_image || defaultBackground}')` }"
  role="region"
  aria-label="Section illustration + stats"
>
  

    <div class="relative z-10 max-w-6xl mx-auto grid md:grid-cols-2 gap-12 items-center">
      <!-- Texte et statistiques -->
      <div class="text-white space-y-6">
        <h2 class="text-4xl sm:text-5xl font-extrabold leading-tight bg-clip-text text-transparent bg-gradient-to-r from-white to-gray-300">
          {{ content.title || "Notre priorité" }}
        </h2>
        <p class="text-lg sm:text-xl text-gray-100 leading-relaxed">
          {{ content.description || "La satisfaction client et le succès de vos projets sont notre mission principale." }}
        </p>

        <!-- Stats en cartes flottantes -->
        <div class="grid grid-cols-1 sm:grid-cols-2 gap-6 mt-8 relative">
          <div
            v-for="(stat, index) in content.stats || []"
            :key="index"
            class="stat-card relative bg-white/20 backdrop-blur-md p-6 rounded-2xl text-center shadow-xl hover:scale-105 transition-transform cursor-default"
            :style="{ top: `${index * 10}px`, left: `${index * 5}px` }"
          >
            <h3 class="text-4xl font-bold text-white drop-shadow-lg">
              <span ref="statRefs">{{ stat.value }}</span>+
            </h3>
            <p class="text-sm text-gray-200 mt-1">{{ stat.label }}</p>
            <p class="text-xs text-gray-300 mt-2">{{ stat.long_description }}</p>
          </div>
        </div>
      </div>

      <!-- Illustration / schéma -->
      <div
        v-if="content.image"
        class="image-decor hidden md:flex justify-center items-center relative rounded-2xl overflow-hidden shadow-2xl border-4 border-secondary transform transition-transform duration-700 group hover:scale-105 hover:-translate-y-2"
      >
        <img
          :src="content.image"
          :alt="content.image_alt || 'Illustration succès'"
          class="rounded-2xl object-contain w-full h-full transition-transform duration-700 group-hover:scale-110"
        />
        <div
          v-if="content.badge"
          class="absolute -bottom-6 -left-6 bg-secondary text-white font-semibold text-sm px-5 py-2 rounded-lg shadow-xl select-none"
        >
          {{ content.badge }}
        </div>
      </div>
    </div>
  </section>
</template>

<script setup>
import { ref, onMounted, nextTick } from "vue";

const props = defineProps({
  content: {
    type: Object,
    default: () => ({
      title: "",
      description: "",
      stats: [
        { value: 100, label: "Clients satisfaits", long_description: "Chaque projet est traité avec soin." },
        { value: 50, label: "Projets livrés", long_description: "Des solutions de qualité livrées à temps." }
      ],
      background_image: "",
      image: "",
      image_alt: "",
      badge: ""
    }),
  },
});

const defaultBackground = "https://images.unsplash.com/photo-1600585154340-be6161a56a0c?auto=format&fit=crop&w=1600&q=80";

// Chiffres animés
const statRefs = ref([]);

const animateNumber = (el, target) => {
  let current = 0;
  const increment = target / 100;
  const interval = setInterval(() => {
    current += increment;
    if (current >= target) {
      el.innerText = target;
      clearInterval(interval);
    } else {
      el.innerText = Math.floor(current);
    }
  }, 15);
};

onMounted(() => {
  nextTick(() => {
    if ("IntersectionObserver" in window) {
      const observer = new IntersectionObserver((entries, obs) => {
        entries.forEach((entry) => {
          if (entry.isIntersecting) {
            statRefs.value.forEach((el, idx) => {
              const target = parseInt(props.content.stats[idx].value, 10);
              animateNumber(el, target);
            });
            obs.disconnect();
          }
        });
      }, { threshold: 0.5 });
      statRefs.value.forEach((el) => observer.observe(el));
    } else {
      statRefs.value.forEach((el, idx) => {
        el.innerText = props.content.stats[idx].value;
      });
    }
  });
});
</script>

<style scoped>
.stat-card {
  opacity: 0;
  animation: fadeUp 0.8s ease forwards;
}
.stat-card:nth-child(1) { animation-delay: 0.2s; }
.stat-card:nth-child(2) { animation-delay: 0.4s; }
.stat-card:nth-child(3) { animation-delay: 0.6s; }
.stat-card:nth-child(4) { animation-delay: 0.8s; }

@keyframes fadeUp {
  0% { opacity: 0; transform: translateY(30px); }
  100% { opacity: 1; transform: translateY(0); }
}

.image-decor img {
  transition: transform 0.7s ease;
}

/* Parallax background */
section[role="region"] {
  background-attachment: fixed;
  background-position: center;
  background-size: cover;
}
</style>
