
<script setup>

import { defineProps } from 'vue'

const props = defineProps({
  footerPages: Array, 
})


</script>

<template>
      <footer class="bg-gray-900 text-white text-center py-4">
        <nav class="mb-4">
          <a
            v-for="page in footerPages"
            :key="page.id"
            :href="`pages/${page.slug}`"
            class="mx-2 hover:underline"
          >
            {{ page.title }}
          </a>
        </nav>
      <p>&copy; 2025 FSD BATIMENT - Tous droits réservés.</p>
    </footer>
</template>