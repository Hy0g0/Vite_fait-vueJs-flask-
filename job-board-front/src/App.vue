<script setup>
import { RouterLink, RouterView } from 'vue-router'
import Nav from './components/Nav.vue'
import axios from 'axios';


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

<script>
export default {
  async mounted() {
    if (this.$cookies.get("myUSerId") != null) this.$store.dispatch("setUserId", this.$cookies.get("myUSerId"))
    if (this.$cookies.get("token") != null) axios.defaults.headers.common['Authorization'] = "Bearer "+this.$cookies.get("token");
  }
}

</script>