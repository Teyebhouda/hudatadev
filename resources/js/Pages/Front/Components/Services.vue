<template>
  <section
    id="services-section"
    class="relative overflow-hidden py-20 lg:py-28 px-6 sm:px-10 lg:px-20
           bg-gradient-to-b from-[#f7f8f9] to-[#eef0f1]"
  >

    <!-- Background word -->
    <div class="hero-bg-word">Services</div>

    <!-- Header -->
    <div class="relative max-w-6xl mx-auto text-center mb-16">

      <p class="text-4xl sm:text-5xl lg:text-6xl font-extrabold text-[#3f5360]">
        {{ content.title }}
      </p>

     <!-- <div class="mt-5 flex justify-center items-center gap-4">
        <div class="h-[2px] w-24 bg-[#c98f60]"></div>
        <p class="text-lg text-[#5c6670] max-w-2xl">
          {{ content.subtitle }}
        </p>
      </div>  -->

    </div>  

    <!-- Layout moderne -->
    <div class="relative max-w-7xl mx-auto grid lg:grid-cols-3 gap-8 items-stretch">

      <!-- LEFT -->
      <div class="space-y-6">

        <div
          v-for="(service, i) in leftServices"
          :key="service.title"
          class="service-card"
        >
          <div class="icon-box">
            <Icon :icon="service.icon" />
          </div>

          <div>
            <h3>{{ service.title }}</h3>
            <p>{{ service.description }}</p>
          </div>
        </div>

      </div>

      <!-- CENTER (featured) -->
      <div class="featured-card">

        <div class="icon-big">
          <Icon :icon="featured.icon" />
        </div>

        <h2>Chez HUDATA-DEV</h2>

        <p class="text">
          {{ content.subtitle }}
        </p>
        <p>
          {{ content.description }}
        </p>

       

        <a :href="`/services/${featured.slug}`" class="btn">
          Explorer →
        </a>

      </div>

      <!-- RIGHT -->
      <div class="space-y-6">

        <div
          v-for="(service, i) in rightServices"
          :key="service.title"
          class="service-card"
        >
          <div class="icon-box">
            <Icon :icon="service.icon" />
          </div>

          <div>
            <h3>{{ service.title }}</h3>
            <p>{{ service.description }}</p>
          </div>
        </div>

      </div>

    </div>

  </section>
</template>

<script setup>
import { computed } from "vue"
import { Icon } from "@iconify/vue"


const props = defineProps({
  content: {  
    type: Object,
    default: () => ({
      title: "Mes Services",
      description: "Ingénierie logicielle moderne, performante et élégante.",
      items: [
        {
          title: "Développement Web",
          description: "Applications modernes avec Vue.js, Laravel et TailwindCSS.",
          long_description: "Des solutions performantes, maintenables et évolutives.",
          icon: "mdi:code-tags",
        },
        {
          title: "Applications Mobiles",
          description: "Développement cross-platform fluide et intuitif.",
          long_description: "Une expérience utilisateur homogène sur tous les appareils.",
          icon: "mdi:cellphone-link",
        },
        {
          title: "Design UI/UX",
          description: "Création d’interfaces esthétiques et centrées sur l’utilisateur.",
          long_description: "Conjuguer clarté, efficacité et identité visuelle.",
          icon: "mdi:palette-outline",
        },
        {
          title: "Architecture & Optimisation",
          description: "Conception logicielle et optimisation des performances.",
          long_description: "Robustesse, scalabilité et efficacité du code.",
          icon: "mdi:cogs",
        },
      ],
    }),
  },
})
const featured = computed(() => props.content.items?.[0] || {})

const leftServices = computed(() =>
  props.content.items?.slice(0, 3) || []
)

const rightServices = computed(() =>
  props.content.items?.slice(3, 6) || []
)
</script>

<style scoped>

/* Background word */
.hero-bg-word {
  position: absolute;
  left: 50%;
  top: 8%;
  transform: translateX(-50%);
  font-size: clamp(5rem, 12vw, 9rem);
  font-weight: 800;
  color: rgba(63, 83, 96, 0.05);
  pointer-events: none;
  white-space: nowrap;
}

/* small cards */
.service-card {
  display: flex;
  gap: 14px;
  align-items: flex-start;

  background: rgba(255,255,255,0.7);
  backdrop-filter: blur(16px);

  border: 1px solid rgba(255,255,255,0.6);
  border-radius: 20px;

  padding: 18px;

  transition: all 0.4s ease;
}

.service-card:hover {
  transform: translateY(-6px);
  box-shadow: 0 18px 40px rgba(0,0,0,0.08);
}

/* icon */
.icon-box {
  width: 42px;
  height: 42px;
  border-radius: 12px;

  display: flex;
  align-items: center;
  justify-content: center;

  background: rgba(201,143,96,0.1);
  color: #c98f60;

  flex-shrink: 0;
}

/* text */
.service-card h3 {
  font-weight: 700;
  color: #3f5360;
  font-size: 15px;
}

.service-card p {
  font-size: 13px;
  color: #5c6670;
  margin-top: 2px;
}

/* featured card */
.featured-card {
  background: linear-gradient(145deg, #ffffff, #f6f7f8);
  border: 1px solid rgba(255,255,255,0.8);
  border-radius: 28px;

  padding: 40px;
  text-align: center;

  box-shadow:
    0 20px 60px rgba(0,0,0,0.08),
    0 5px 20px rgba(201,143,96,0.08);

  transition: all 0.4s ease;
}

.featured-card:hover {
  transform: translateY(-10px);
}

.icon-big {
  width: 70px;
  height: 70px;
  margin: 0 auto 20px;

  display: flex;
  align-items: center;
  justify-content: center;

  border-radius: 18px;

  background: rgba(201,143,96,0.12);
  color: #c98f60;
  font-size: 30px;
}

.featured-card h2 {
  font-size: 22px;
  font-weight: 800;
  color: #3f5360;
}

.featured-card .text {
  margin-top: 10px;
  color: #5c6670;
  font-size: 14px;
}

.featured-card .subtext {
  margin-top: 10px;
  font-size: 12px;
  color: rgba(92,102,112,0.8);
}

.btn {
  display: inline-block;
  margin-top: 20px;
  padding: 10px 18px;

  background: #c98f60;
  color: white;

  border-radius: 999px;
  font-weight: 600;

  transition: 0.3s;
}

.btn:hover {
  background: #b7794f;
}
</style>



