<script setup>
import Navbar from './Components/Navbar.vue'
import Footer from './Components/Footer.vue'
import Hero from './Components/Hero.vue'
import Services from './Components/Services.vue'
import whyChooseUs from './Components/Whychoseus.vue'
import Contat_form from './Components/Contact_form.vue'
import Testimonials from './Components/Testimonials.vue'
import AboutUs from './Components/Aboutus.vue'
import Ourprojects from './Components/Ourprojects.vue'
import { computed } from 'vue'
import { usePage } from '@inertiajs/vue3'
import { ref, onMounted } from 'vue'
import ParallaxStats from './Components/parallaxStats.vue'
import Topbar from './Components/Topbar.vue'
import Competences from './Components/Competences.vue'
const footerPages = computed(() => page.props.footerPages) // ✅ dispo direct



const contactSection = ref(null)
const selectedService = ref('')

// Fonction appelée au clic sur "Demander un devis"
const scrollToContact = (serviceName) => {
  selectedService.value = serviceName

  // Scroll vers la section via son ID
  const section = document.getElementById('contact-form')
  if (section) {
    section.scrollIntoView({ behavior: 'smooth' })
  }
}



const handleSelectService = (serviceId) => {
  selectedService.value = serviceId
}


const page = usePage()
const sections =computed(() => page.props.sections )



const heroContent = computed(() =>sections.value.hero?.content || {})
const aboutUsContent = computed(() => sections.value.aboutus?.content || {})
const servicesContent = computed(() =>sections.value.services?.content || {})
const projectsContent = computed(() =>sections.value.projects?.content || {})
const whyChooseUsContent = computed(() => sections.value.whyChooseUs?.content || {})
const testimonialsContent = computed(() =>sections.value.testimonials?.content || {})
const contactContent = computed(() =>sections.value.footer?.content || {})
const footerContent = computed(() =>sections.value.footer?.content || {})
const services = computed(() => sections.value.services?.content.items || [])
const projects = computed(() => sections.value.projects?.content.items || [])
const parallaxStatsContent = computed(() => sections.value.ParallaxStats?.content || {})
console.log('parallaxStatsContent', parallaxStatsContent.value)
console.log('servicesitems', services.value)
console.log('projects_items', projects.value)

//scroll haut 
const showScrollTop = ref(false)

const handleScrollTopVisibility = () => {
  showScrollTop.value = window.scrollY > 400
}

const scrollToTop = () => {
  window.scrollTo({ top: 0, behavior: 'smooth' })
}

onMounted(() => {
  window.addEventListener('scroll', handleScrollTopVisibility)
})


</script>
<template>

  <!-- Scroll to top -->
<button
  v-show="showScrollTop"
  @click="scrollToTop"
  aria-label="Retour en haut"
  class="fixed bottom-28 right-6 z-50
         w-12 h-12 rounded-full
         bg-white border-2 border-[#c98f60]
         text-[#c98f60]
         flex items-center justify-center
         shadow-lg
         transition-all duration-300
         hover:bg-[#c98f60] hover:text-white
         hover:-translate-y-1"
>
  <i class="fas fa-arrow-up text-lg"></i>
</button>

  <div class="min-h-screen flex flex-col text-gray-800">
   

    <!-- Header -->
   
   <Navbar  />
 
    <!-- Contenu -->
<main class="flex-1">

    <Hero
  :content="heroContent"
  :services="services"
  @selectService="handleSelectService"
/>
<!-- Bouton flottant "Me contacter" -->
<a
  href="#contact-form"
  class="fixed top-1/2 right-0 -translate-y-1/2 z-50 bg-white text-[#c98f60] font-semibold tracking-wide px-6 py-3 border-2 border-[#c98f60] rounded-l-full shadow-md hover:bg-[#c98f60] hover:text-white transition-all duration-300"
>
  Nous contacter
</a>









 <ParallaxStats :content="parallaxStatsContent"   />

<Services
  :content="servicesContent"
  :scrollToContact="scrollToContact"
  :initialService="selectedService"
/>


     
       <!-- <whyChooseUs :content="whyChooseUsContent" /> -->
      <!-- <Testimonials :content="testimonialsContent"/> -->
       
      
      <Ourprojects :content="projectsContent"/>
     <!-- Image flottante à gauche -->
    <div
      class="absolute left-0 top-[30%] w-[30vw] h-[80vh] overflow-hidden rounded-r-3xl  z-0"
    >
      <img
        src="/images/illustra_image.png"
        alt="Illustration décorative"
        class="w-full h-full object-cover opacity-70"
      />
    </div>
      <competences />
      <Contat_form :content="contactContent" :services="services" :initialService="selectedService" />
     
    </main>

    <!-- Footer -->
    <Footer :footerPages="footerPages" />  
     <!-- Bouton WhatsApp flottant -->
   <!-- Bouton WhatsApp flottant -->
<a
  href="https://wa.me/+330766212207"
  target="_blank"
  rel="noopener noreferrer"
  aria-label="Discuter sur WhatsApp"
  class="whatsapp-button group"
>
  <i class="fab fa-whatsapp text-3xl z-10"></i>
  <span class="whatsapp-pulse"></span>
</a>

  </div>



  
</template>
<style scoped>
/* Dans ton <style> global ou ton fichier CSS principal */
main {
  position: relative;
}

@media (max-width: 1024px) {
  main > div.absolute {
    display: none; /* On masque l’image sur mobile pour la lisibilité */
  }
}

.vertical-text {
  writing-mode: vertical-rl;
  text-orientation: mixed;
  letter-spacing: 0.1em;
  transform: translateY(-50%) rotate(180deg);
}
.whatsapp-button {
  position: fixed;
  bottom: 24px;
  left: 24px;
  width: 60px;
  height: 60px;
  background: linear-gradient(135deg, #c98f60, #b7794f);
  color: white;
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  box-shadow: 0 10px 25px rgba(201, 143, 96, 0.35);
  z-index: 1000;
  cursor: pointer;
  transition: transform 0.3s ease, box-shadow 0.3s ease;
  overflow: visible;
}

.whatsapp-button:hover {
  transform: translateY(-4px) scale(1.05);
  box-shadow: 0 16px 32px rgba(201, 143, 96, 0.5);
}

/* Halo animé élégant */
.whatsapp-pulse {
  position: absolute;
  width: 100%;
  height: 100%;
  border-radius: 50%;
  background: rgba(201, 143, 96, 0.45);
  animation: whatsappPulse 2.6s infinite;
  z-index: 0;
}

@keyframes whatsappPulse {
  0% {
    transform: scale(1);
    opacity: 0.6;
  }
  70% {
    transform: scale(1.9);
    opacity: 0;
  }
  100% {
    opacity: 0;
  }
}




</style>


