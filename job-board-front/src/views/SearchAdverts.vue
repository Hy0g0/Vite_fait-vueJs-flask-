<script setup>
import Catégorie from "../components/optionsCategorys.vue";
</script>
<template>
  <div class="container">
    <div
      id="container-search-job"
      class="container d-flex justify-content-center p-4"
    >
      <input
        v-model="searchkey"
        class="rounded-2 border border-3"
        type="search"
        placeholder="Nom du poste..."
        autocomplete="off"
      />
      <select v-model="searchCategory" id="Category" class="rounded-2 border border-3" required>
        <Catégorie></Catégorie>
      </select>
      <select v-model="searchContract" id="Contract" class="rounded-2 border border-3" required>
        <option value="" selected data-default>Type du contrat</option>
        <option value="CDI">CDI</option>
        <option value="CDD">CDD</option>
        <option value="Stage">Stage</option>
        <option value="Alternance">Alternance</option>

        <option value="Autres">Autres</option>
      </select>
    </div>
    <div id="container-advert-descri" class="container">
      <div class="row">
        <div id="container-advert" class="col-md-6 p-3">
          <!-- advertsprops permet de passer au composant la data adverts -->
          <Cards :advertsprops="filteredAdvert" />
        </div>
        <div id="container-description" class="col-md-6 p-3">
          <Description :advertprops="filteredAdvert" />
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import Cards from "../components/Cards.vue";
import Description from "../components/Description.vue";

export default {
  name: "SearchAdverts",
  components: {
    Cards,
    Description,
  },
  data() {
    return {
      adverts: [],
      searchkey: "", // Variable de recherche d'annonces par nom
      searchCategory: "", // Variable de recherche d'annonce par catgeroy
      searchContract: "", // Variable de recherche d'annonce par type de contrat
      getIsOK: false,
    };
  },
  computed: {
    // Filtre les annonces par le nom via searchkey (ne fait pas de différence entre majuscules et minuscules)
    filteredAdvert() {
      return this.$store.state.advertsFromVueX.filter((item) => {
        return item.advertisementName.toLowerCase().includes(this.searchkey.toLowerCase()) && item.advertisementCategory.toLowerCase().includes(this.searchCategory.toLowerCase()) && item.contractType.toLowerCase().includes(this.searchContract.toLowerCase())
      });
    }
  },
  //A chaque chargement du composants
  mounted() {
    this.$store.dispatch("getAdverts"); // .dispatch permet d'appeler une action dans le store (ici celle qui récupère les adverts dans la BDD)
    setTimeout(() => {
      this.adverts = this.$store.state.advertsFromVueX;
    }, 40);
  },
};
</script>

<style scoped>
.container {
  border-radius: 10px;
  --secondary-color: #151226;
  --contrast-color: teal;
  margin-top: 10px;
}
#container-advert {
  background-color: var(--secondary-color);
  border-top-left-radius: 20px;
  border-bottom-left-radius: 20px;
}
#container-description {
  border-top-right-radius: 20px;
  border-bottom-right-radius: 20px;
  background-color: var(--secondary-color);
}
#container-search-job {
  background-color: rgba(255, 255, 255, 0.5);
}
/* Container Search CSS */
#container-search-job button {
  background: linear-gradient(
    140deg,
    #42c3ca 0%,
    #42c3ca 50%,
    #42c3cac7 75%
  ) !important;
  border: 0;
}
#container-search-job button,
#container-search-job input {
  height: 45px;
}
#container-search-job input {
  width: 30%;
}

select, select option {
  background-color: white;
}

select option[data-default] {
  color: white;
} 

/* ---------------------------- */

@media screen and (max-width: 767px) {
  #container-description {
    display: none;
  }
}
</style>