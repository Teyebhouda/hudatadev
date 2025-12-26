<template>
  <section
    id="hero"
    class="relative overflow-hidden min-h-screen flex flex-col items-center justify-center text-center px-6 bg-[#f0f4f8]"
  >
    <!-- Canvas réseau + particules -->
    <canvas ref="heroCanvas" class="absolute inset-0 w-full h-full z-0 pointer-events-none"></canvas>

    <!-- Halos plus visibles -->
    <div
      ref="haloMain"
      class="absolute top-[-180px] left-1/2 -translate-x-1/2 w-[700px] h-[700px] bg-[radial-gradient(circle,_rgba(63,83,96,0.12),transparent_80%)] blur-[140px] opacity-90 pointer-events-none"
    ></div>
    <div
      ref="haloSecondary"
      class="absolute bottom-[-120px] right-[15%] w-[400px] h-[400px] bg-[radial-gradient(circle,_rgba(92,102,112,0.08),transparent_80%)] blur-[120px] opacity-80 pointer-events-none"
    ></div>

    <!-- Contenu -->
    <div class="relative z-10 max-w-3xl text-center text-[#3f5360] drop-shadow-[0_2px_8px_rgba(0,0,0,0.05)]">
      <h2 class="uppercase tracking-[0.25em] text-sm md:text-base font-semibold mb-3 text-[#3f5360]/70">
        HU<span class="font-normal text-[#c98f60]">DATA</span>-DEV
      </h2>

      <h1 class="text-5xl md:text-6xl font-extrabold leading-tight mb-4 text-[#3f5360]">
        Ingénieure Développeuse Full-Stack
      </h1>

      <h3 class="text-2xl md:text-3xl font-semibold mb-6 text-[#5c6670]">
        {{ currentRole }}
      </h3>

      <p class="text-lg md:text-xl mb-8 max-w-2xl mx-auto leading-relaxed text-[#5c6670]/90">
        Passionnée par le code propre, les architectures scalables et les expériences utilisateurs élégantes.
      </p>

      <!-- Boutons sobres / CTA -->
      <div class="flex justify-center gap-4">
        <a
          href="#projects"
          class="px-6 py-3 border border-[#3f5360] text-[#3f5360] rounded-full font-semibold hover:bg-[#3f5360]/10 transition-all duration-300"
        >
          Voir mes projets
        </a>
        <button
          @click="$emit('open-contact')"
          class="px-6 py-3 border border-[#c98f60] text-[#c98f60] rounded-full font-semibold hover:bg-[#c98f60]/10 transition-all duration-300"
        >
          Me contacter
        </button>
      </div>
    </div>
  </section>
</template>

<script setup>
import { ref, onMounted, onUnmounted } from "vue"

const heroCanvas = ref(null)
const haloMain = ref(null)
const haloSecondary = ref(null)

const roles = ["Développeuse Web", "Développeuse Mobile", "UI/UX Designer", "Architecte Logiciel"]
const currentRole = ref(roles[0])
let roleInterval

onMounted(() => {
  // Texte tournant
  let index = 0
  roleInterval = setInterval(() => {
    index = (index + 1) % roles.length
    currentRole.value = roles[index]
  }, 2500)

  // Canvas réseau + particules
  const canvas = heroCanvas.value
  const ctx = canvas.getContext("2d")
  let width = (canvas.width = canvas.offsetWidth)
  let height = (canvas.height = canvas.offsetHeight)

  const particleCount = 50
  const lineDistance = 120
  const particles = Array.from({ length: particleCount }, () => ({
    x: Math.random() * width,
    y: Math.random() * height,
    vx: (Math.random() - 0.5) * 0.3,
    vy: (Math.random() - 0.5) * 0.3,
    r: Math.random() * 2 + 0.5,
  }))

  const mouse = { x: width / 2, y: height / 2 }

  const draw = () => {
    ctx.clearRect(0, 0, width, height)

    particles.forEach((p, i) => {
      p.x += p.vx
      p.y += p.vy
      if (p.x < 0 || p.x > width) p.vx *= -1
      if (p.y < 0 || p.y > height) p.vy *= -1

      // lignes interactives
     // lignes interactives
for (let j = i + 1; j < particles.length; j++) {
  const dx = p.x - particles[j].x
  const dy = p.y - particles[j].y
  const dist = Math.sqrt(dx * dx + dy * dy)
  if (dist < lineDistance) {
    const glow = 0.25 * (1 - dist / lineDistance) // <- un peu plus fort
    ctx.beginPath()
    ctx.moveTo(p.x, p.y)
    ctx.lineTo(particles[j].x, particles[j].y)
    ctx.strokeStyle = `rgba(63,83,96,${glow})`  // lignes plus visibles
    ctx.lineWidth = 1  // légèrement plus épais
    ctx.shadowColor = `rgba(63,83,96,${glow * 2})`
    ctx.shadowBlur = 8  // glow un peu plus marqué
    ctx.stroke()
  }
}

// particules
ctx.beginPath()
ctx.arc(p.x, p.y, p.r, 0, Math.PI * 2)
ctx.fillStyle = "rgba(63,83,96,0.25)" // particules un peu plus visibles
ctx.shadowColor = "rgba(63,83,96,0.25)"
ctx.shadowBlur = 5
ctx.fill()


      // glow vers la souris
      const dxMouse = p.x - mouse.x
      const dyMouse = p.y - mouse.y
      const distMouse = Math.sqrt(dxMouse * dxMouse + dyMouse * dyMouse)
      if (distMouse < 150) {
        ctx.beginPath()
        ctx.arc(p.x, p.y, p.r + 1, 0, Math.PI * 2)
        ctx.fillStyle = `rgba(63,83,96,${0.05 * (1 - distMouse / 150)})`
        ctx.fill()
      }
    })

    requestAnimationFrame(draw)
  }

  draw()

  // Parallax souris halos
  const handleMouseMove = (e) => {
    mouse.x = e.clientX
    mouse.y = e.clientY
    const x = (e.clientX / window.innerWidth - 0.5) * 40
    const y = (e.clientY / window.innerHeight - 0.5) * 40
    haloMain.value.style.transform = `translate3d(calc(-50% + ${x}px), ${-180 + y}px, 0)`
    haloSecondary.value.style.transform = `translate3d(${15 + x / 5}%, calc(-120px + ${y / 5}px), 0)`
  }

  window.addEventListener("mousemove", handleMouseMove)

  // Resize adaptatif
  const handleResize = () => {
    width = canvas.width = canvas.offsetWidth
    height = canvas.height = canvas.offsetHeight
  }
  window.addEventListener("resize", handleResize)

  onUnmounted(() => {
    clearInterval(roleInterval)
    window.removeEventListener("resize", handleResize)
    window.removeEventListener("mousemove", handleMouseMove)
  })
})
</script>

<style scoped>
.hero-bg-word {
  position: absolute;
  left: 50%;
  top: 10%;
  transform: translateX(-50%);
  font-size: clamp(6rem, 12vw, 10rem);
  font-weight: 800;
  color: rgba(63,83,96,0.06);
  letter-spacing: -0.02em;
  line-height: 0.8;
  pointer-events: none;
  user-select: none;
  z-index: 0;
  white-space: nowrap;
}
</style>
