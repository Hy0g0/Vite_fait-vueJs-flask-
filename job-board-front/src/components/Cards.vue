<template>
  <div v-for="advert in advertsprops" :key="advert.id" class="container-cards">
    <div class="card mt-2">
      <div class="card-header">{{ advert.advertisementName }}</div>
      <div class="card-body">
        <p>{{ advert.contractType }}</p>
        <p>{{ advert.advertisementDescription.slice(0, 100) }} ...</p>
        <p>{{ advert.companyName }}</p>
      </div>
      <div class="card-footer d-flex justify-content-end">
        <!-- indexOf permet de selectionner ici l'id de advert dans advertsprops -->
        <button
          @click="returnIdAdvert(advertsprops.indexOf(advert))"
          class="btn rounded-2 text-light btn-learn-more"
        >
          Learn More...
        </button>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "Cards",
  props: ["advertsprops"], // Permet de récupérer des données d'un composants (ici SearchAdverts)
  methods: {
    // Appelle l'action getIdOfAdvertCard dans store
    returnIdAdvert(idOfAdvert) {
      this.$store.dispatch("getIdOfAdvertCard", { idOfAdvert });
    },
  },
};
</script>

<style scoped>
.btn-learn-more {
  background: linear-gradient(
    140deg,
    #42c3ca 0%,
    #42c3ca 50%,
    #42c3cac7 75%
  ) !important;
  border: 0;
}
</style>