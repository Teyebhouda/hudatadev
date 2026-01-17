import { ref } from 'vue'

const isContactOpen = ref(false)

export function useContactModal() {
  return { isContactOpen }
}
