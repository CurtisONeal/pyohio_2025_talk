<script setup>
import { onMounted } from 'vue'

onMounted(async () => {
  const { default: Chatbot } = await import('https://cdn.jsdelivr.net/npm/flowise-embed/dist/web.js')
  Chatbot.init({
    chatflowid: '90a73351-5e91-488d-bc54-1e73c51473cf',
    apiHost: 'http://localhost:3000',
  })
})
</script>

<template>
  <div id="my-element"></div>
</template>