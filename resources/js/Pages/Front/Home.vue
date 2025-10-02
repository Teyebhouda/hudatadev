
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

const props = defineProps({
  projectsData: {
    type: Array,
    default: () => []
  }
})
const projects = ref(props.projectsData)
const footerPages = computed(() => page.props.footerPages) // ✅ dispo direct

console.log('projectsdata', projects.value)

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
const whyChooseUsContent = computed(() => sections.value.whyChooseUs?.content || {})
const testimonialsContent = computed(() =>sections.value.testimonials?.content || {})
const contactContent = computed(() =>sections.value.footer?.content || {})
const footerContent = computed(() =>sections.value.footer?.content || {})
const services = computed(() => sections.value.services?.content.items || [])
const parallaxStatsContent = computed(() => sections.value.ParallaxStats?.content || {})
console.log('servicesitems', services.value)

</script>
<template>
  <div class="min-h-screen flex flex-col text-gray-800">
   

    <!-- Header -->
   
   <Navbar :services="services" :projects="projects" />
 
    <!-- Contenu -->
<main class="flex-1">

    <Hero
  :content="heroContent"
  :services="services"
  @selectService="handleSelectService"
/>
<div class="my-16"></div>
 <ParallaxStats :content="parallaxStatsContent"   />
<Services
  :content="servicesContent"
  :scrollToContact="scrollToContact"
  :initialService="selectedService"
/>
     
       <!-- <whyChooseUs :content="whyChooseUsContent" /> -->
      <!-- <Testimonials :content="testimonialsContent"/> -->
      <Ourprojects :content="projects" />
     
      <Contat_form :content="contactContent" :services="services" :initialService="selectedService" />
    </main>

    <!-- Footer -->
    <Footer :footerPages="footerPages" />  
  </div>



  
</template>


