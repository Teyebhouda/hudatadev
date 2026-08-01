```vue
<template>
 <header
  :class="[
    'fixed top-0 left-0 w-full z-[9999]',
    'transition-transform duration-500 ease-out',
    isHidden ? '-translate-y-full' : 'translate-y-0'
  ]"
>

    <!-- ================================================= -->
    <!-- TOP BAR -->
    <!-- ================================================= -->

    <div
      class="hidden md:block
             bg-[#3f5360]
             text-white
             border-b border-white/10"
    >
      <div
        class="max-w-screen-xl mx-auto
               px-6
               h-9
               flex items-center justify-between
               text-[11px]"
      >

        <!-- Left -->

        <div class="flex items-center gap-6">

          <a
            href="tel:+33766212207"
            class="flex items-center gap-2
                   text-white/90
                   hover:text-white
                   transition-colors"
          >
            <i class="fas fa-phone-alt text-[9px]"></i>
            <span>+33 7 66 21 22 07</span>
          </a>

          <a
            href="mailto:contact@hudata-dev.fr"
            class="flex items-center gap-2
                   text-white/90
                   hover:text-white
                   transition-colors"
          >
            <i class="fas fa-envelope text-[9px]"></i>
            <span>contact@hudata-dev.fr</span>
          </a>

          <span
            class="hidden lg:flex
                   items-center gap-2
                   text-white/70"
          >
            <span
              class="w-1.5 h-1.5
                     rounded-full
                     bg-emerald-400
                     shadow-[0_0_8px_rgba(52,211,153,.8)]"
            ></span>

            Disponible pour de nouveaux projets
          </span>

        </div>


        <!-- Social -->

        <div class="flex items-center gap-4">

          <a
            href="#"
            aria-label="LinkedIn"
            class="text-white/70
                   hover:text-[#c98f60]
                   transition-colors"
          >
            <i class="fab fa-linkedin-in"></i>
          </a>

          <a
            href="#"
            aria-label="Facebook"
            class="text-white/70
                   hover:text-[#c98f60]
                   transition-colors"
          >
            <i class="fab fa-facebook-f"></i>
          </a>

          <a
            href="#"
            aria-label="Instagram"
            class="text-white/70
                   hover:text-[#c98f60]
                   transition-colors"
          >
            <i class="fab fa-instagram"></i>
          </a>

        </div>

      </div>
    </div>


    <!-- ================================================= -->
    <!-- MAIN NAV -->
    <!-- ================================================= -->
<div
  :class="[
    'relative z-[10000] transition-all duration-500',
    scrolled
      ? 'bg-white/90 backdrop-blur-xl shadow-[0_8px_30px_rgba(63,83,96,0.08)] border-b border-[#3f5360]/5'
      : 'bg-transparent'
  ]"
>

      <div
        class="max-w-screen-xl mx-auto
               px-5 sm:px-6
               h-[76px] md:h-[88px]
               flex items-center justify-between"
      >

        <!-- ================================================= -->
        <!-- LOGO -->
        <!-- ================================================= -->

        <a
          href="/"
          class="group flex items-center"
          aria-label="HuData Dev"
        >

          <img
            :src="$page.props.settings?.logo"
            alt="HuData Dev"
            class="object-contain
                   transition-all duration-500
                   group-hover:scale-[1.03]"
            :class="
              scrolled
                ? 'h-14 md:h-16'
                : 'h-16 md:h-20'
            "
          />

        </a>


        <!-- ================================================= -->
        <!-- DESKTOP NAV -->
        <!-- ================================================= -->

        <nav
          class="hidden md:flex
                 items-center
                 gap-7 lg:gap-9
                 text-[14px]
                 font-medium"
        >

          <a
            href="/"
            class="nav-link"
            :class="{ active: isHome }"
          >
            Accueil
          </a>
           <a
            v-if="isHome"
            href="#about-stats"
            class="nav-link"
          >
            À propos
          </a>

          <a
            v-if="isHome"
            href="#services-section"
            class="nav-link"
          >
            Services
          </a>

          <a
            v-if="isHome"
            href="#projects-section"
            class="nav-link"
          >
            Projets
          </a>

         

          <a
            href="#contact-form"
            class="nav-link"
          >
            Contact
          </a>

        </nav>


        <!-- ================================================= -->
        <!-- CTA -->
        <!-- ================================================= -->

        <div class="hidden md:flex items-center">

          <a
            href="#contact-form"
            class="group
                   flex items-center gap-2
                   px-5 py-2.5
                   rounded-full
                   bg-[#3f5360]
                   text-white
                   text-[13px]
                   font-semibold
                   shadow-md
                   shadow-[#3f5360]/10
                   hover:bg-[#c98f60]
                   hover:shadow-lg
                   hover:shadow-[#c98f60]/20
                   hover:-translate-y-0.5
                   transition-all duration-300"
          >

            <span>Demander un devis</span>

            <i
              class="fas fa-arrow-right
                     text-[9px]
                     transition-transform duration-300
                     group-hover:translate-x-1"
            ></i>

          </a>

        </div>


        <!-- ================================================= -->
        <!-- MOBILE BURGER -->
        <!-- ================================================= -->

        <button
          type="button"
          @click="toggleMenu"
          :aria-expanded="isMenuOpen"
          aria-label="Menu"
          class="md:hidden
                 w-11 h-11
                 rounded-full
                 flex items-center justify-center
                 bg-[#3f5360]/5
                 text-[#3f5360]
                 hover:bg-[#3f5360]
                 hover:text-white
                 transition-all duration-300"
        >

          <i
            :class="
              isMenuOpen
                ? 'fas fa-times'
                : 'fas fa-bars'
            "
            class="text-lg transition-all duration-300"
          ></i>

        </button>

      </div>

    </div>


   
    <!-- ================================================= -->
<!-- MOBILE MENU -->
<!-- ================================================= -->
<!-- ================================================= -->
<!-- MOBILE MENU -->
<!-- ================================================= -->

<transition name="mobile-menu">

  <div
    v-if="isMenuOpen"
    class="md:hidden
           absolute
           top-[76px]
           left-0
           right-0
           w-full
           h-[calc(100dvh-76px)]
           bg-white
           z-[999]
           overflow-hidden
           border-t border-[#3f5360]/10
           shadow-[0_20px_50px_rgba(63,83,96,0.15)]"
  >

    <div
      class="h-full
             overflow-y-auto
             px-6
             pt-5
             pb-10
             flex flex-col"
    >

      <!-- petit label -->

      <div class="mb-4">

        <span
          class="text-[10px]
                 uppercase
                 tracking-[0.25em]
                 text-[#c98f60]
                 font-semibold"
        >
          Navigation
        </span>

      </div>


      <!-- MENU -->

      <nav class="flex flex-col">

        <!-- Accueil -->

        <a
          href="/"
          @click="closeMenu"
          class="mobile-nav-link"
        >
          <span>01</span>

          <strong>Accueil</strong>

          <i class="fas fa-arrow-right"></i>
        </a>


        <!-- À propos -->

        <a
          v-if="isHome"
          href="#about-stats"
          @click="closeMenu"
          class="mobile-nav-link"
        >
          <span>02</span>

          <strong>À propos</strong>

          <i class="fas fa-arrow-right"></i>
        </a>


        <!-- Services -->

        <a
          v-if="isHome"
          href="#services-section"
          @click="closeMenu"
          class="mobile-nav-link"
        >
          <span>03</span>

          <strong>Services</strong>

          <i class="fas fa-arrow-right"></i>
        </a>


        <!-- Projets -->

        <a
          v-if="isHome"
          href="#projects-section"
          @click="closeMenu"
          class="mobile-nav-link"
        >
          <span>04</span>

          <strong>Projets</strong>

          <i class="fas fa-arrow-right"></i>
        </a>


        <!-- Contact -->

        <a
          href="#contact-form"
          @click="closeMenu"
          class="mobile-nav-link"
        >
          <span>05</span>

          <strong>Contact</strong>

          <i class="fas fa-arrow-right"></i>
        </a>

      </nav>


      <!-- CTA -->

      <a
        href="#contact-form"
        @click="closeMenu"
        class="mt-7
               flex items-center justify-between
               px-5 py-4
               rounded-2xl
               bg-[#3f5360]
               text-white
               font-semibold
               shadow-lg
               shadow-[#3f5360]/10
               hover:bg-[#c98f60]
               transition-all duration-300"
      >

        <div class="flex flex-col">

          <span class="text-[10px] uppercase tracking-wider text-white/60">
            Votre projet
          </span>

          <span class="mt-0.5">
            Demander un devis
          </span>

        </div>


        <span
          class="w-10 h-10
                 rounded-full
                 bg-white/10
                 flex items-center justify-center"
        >

          <i class="fas fa-arrow-right text-xs"></i>

        </span>

      </a>


      <!-- CONTACT -->

      <div
        class="mt-auto
               pt-6
               border-t border-[#3f5360]/10"
      >

        <p
          class="mb-4
                 text-[10px]
                 uppercase
                 tracking-[0.22em]
                 text-gray-400"
        >
          Parlons de votre projet
        </p>


        <!-- Phone -->

        <a
          href="tel:+33766212207"
          class="flex items-center gap-3
                 text-sm
                 text-[#3f5360]
                 mb-3"
        >

          <span
            class="w-9 h-9
                   rounded-full
                   bg-[#3f5360]/5
                   flex items-center justify-center
                   shrink-0"
          >

            <i class="fas fa-phone-alt text-xs"></i>

          </span>

          <span>
            +33 7 66 21 22 07
          </span>

        </a>


        <!-- Email -->

        <a
          href="mailto:contact@hudata-dev.fr"
          class="flex items-center gap-3
                 text-sm
                 text-[#3f5360]"
        >

          <span
            class="w-9 h-9
                   rounded-full
                   bg-[#3f5360]/5
                   flex items-center justify-center
                   shrink-0"
          >

            <i class="fas fa-envelope text-xs"></i>

          </span>

          <span class="break-all">
            contact@hudata-dev.fr
          </span>

        </a>

      </div>

    </div>

  </div>

</transition>

  </header>
</template>


<script setup>

import {
  ref,
  computed,
  onMounted,
  onBeforeUnmount,
  watch
} from 'vue'


/*
|--------------------------------------------------------------------------
| STATE
|--------------------------------------------------------------------------
*/

const isMenuOpen = ref(false)
const isHidden = ref(false)
const scrolled = ref(false)

let lastScrollY = 0


/*
|--------------------------------------------------------------------------
| HOME
|--------------------------------------------------------------------------
*/

const isHome = computed(() => {

  if (typeof window === 'undefined') {
    return false
  }

  return window.location.pathname === '/'

})


/*
|--------------------------------------------------------------------------
| MENU
|--------------------------------------------------------------------------
*/

const toggleMenu = () => {
  isMenuOpen.value = !isMenuOpen.value
}

const closeMenu = () => {
  isMenuOpen.value = false
}


/*
|--------------------------------------------------------------------------
| SCROLL
|--------------------------------------------------------------------------
*/

const handleScroll = () => {

  const current = window.scrollY

  /*
   * Glass effect after scrolling
   */

  scrolled.value = current > 30


  /*
   * Mobile hide / show
   */

  if (window.innerWidth < 768) {

    if (
      current > lastScrollY &&
      current > 100
    ) {
      isHidden.value = true
    }

    if (current < lastScrollY) {
      isHidden.value = false
    }

  } else {

    isHidden.value = false

  }

  lastScrollY = current

}


/*
|--------------------------------------------------------------------------
| ESCAPE
|--------------------------------------------------------------------------
*/

const handleKeydown = (event) => {

  if (event.key === 'Escape') {
    closeMenu()
  }

}


/*
|--------------------------------------------------------------------------
| BODY LOCK
|--------------------------------------------------------------------------
*/

watch(
  isMenuOpen,
  (open) => {

    document.body.style.overflow =
      open ? 'hidden' : ''

  }
)


/*
|--------------------------------------------------------------------------
| LIFECYCLE
|--------------------------------------------------------------------------
*/

onMounted(() => {

  lastScrollY = window.scrollY

  handleScroll()

  window.addEventListener(
    'scroll',
    handleScroll,
    { passive: true }
  )

  window.addEventListener(
    'keydown',
    handleKeydown
  )

})


onBeforeUnmount(() => {

  window.removeEventListener(
    'scroll',
    handleScroll
  )

  window.removeEventListener(
    'keydown',
    handleKeydown
  )

  document.body.style.overflow = ''

})

</script>


<style scoped>

/*
|--------------------------------------------------------------------------
| DESKTOP NAV
|--------------------------------------------------------------------------
*/

.nav-link {

  position: relative;

  color: #3f5360;

  transition:
    color .3s ease;

}

.nav-link:hover {

  color: #c98f60;

}


/*
|--------------------------------------------------------------------------
| UNDERLINE
|--------------------------------------------------------------------------
*/

.nav-link::after {

  content: "";

  position: absolute;

  left: 0;
  bottom: -7px;

  width: 100%;
  height: 2px;

  border-radius: 999px;

  background: #c98f60;

  transform: scaleX(0);

  transform-origin: right;

  transition:
    transform .35s cubic-bezier(.22,1,.36,1);

}

.nav-link:hover::after,
.nav-link.active::after {

  transform: scaleX(1);

  transform-origin: left;

}


/*
|--------------------------------------------------------------------------
| MOBILE NAV
|--------------------------------------------------------------------------
*/

.mobile-nav-link {

  display: grid;

  grid-template-columns:
    35px
    1fr
    20px;

  align-items: center;

  padding: 18px 0;

  border-bottom:
    1px solid #edf0f2;

  color: #3f5360;

  transition:
    padding-left .3s ease,
    color .3s ease;

}

.mobile-nav-link span {

  font-size: 10px;

  color: #a0a7ad;

  letter-spacing: .1em;

}

.mobile-nav-link strong {

  font-size: 22px;

  font-weight: 500;

}

.mobile-nav-link i {

  font-size: 10px;

  color: #a0a7ad;

  transition:
    transform .3s ease,
    color .3s ease;

}

.mobile-nav-link:hover {

  padding-left: 7px;

  color: #c98f60;

}

.mobile-nav-link:hover i {

  color: #c98f60;

  transform:
    translateX(4px);

}


/*
|--------------------------------------------------------------------------
| MOBILE MENU
|--------------------------------------------------------------------------
*/
.mobile-menu-enter-active,
.mobile-menu-leave-active {
  transition:
    opacity 0.35s ease,
    transform 0.45s cubic-bezier(.22, 1, .36, 1);
}

.mobile-menu-enter-from,
.mobile-menu-leave-to {
  opacity: 0;
  transform: translateY(-20px);
}

.mobile-menu-enter-to,
.mobile-menu-leave-from {
  opacity: 1;
  transform: translateY(0);
}

/*
|--------------------------------------------------------------------------
| REDUCE MOTION
|--------------------------------------------------------------------------
*/

@media (prefers-reduced-motion: reduce) {

  *,
  *::before,
  *::after {

    animation-duration: .01ms !important;

    animation-iteration-count: 1 !important;

    transition-duration: .01ms !important;

  }

}

</style>



