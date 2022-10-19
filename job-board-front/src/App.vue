<script setup>
import { RouterLink, RouterView } from 'vue-router'
import Nav from './components/Nav.vue'
</script>

<template>
  <div>
    <header>
      <Nav />
    </header>
    

      <RouterView />
    </div>
</template>


<style>
body {
  background-color: teal;
}
</style>
