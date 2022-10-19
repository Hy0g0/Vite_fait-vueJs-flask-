<template>
  <div class="card sticky-top" v-if="getIdOfAdvertCard >= 0">
    <div class="card-header">
      <h3> <strong> {{ advertprops[id].advertisementName }} </strong> </h3>
      <p>{{ advertprops[id].advertisementlocation }}</p>
    </div>
    <div class="card-body">
      <h5><strong>Détails du poste</strong></h5>
      <p><strong>Salaire</strong></p>
      <p>{{ advertprops[id].salary }}€</p>
      <p><strong>Type de contrat</strong></p>
      <p>{{ advertprops[id].contractType }}</p>
    </div>
    <div class="card-body">
      <h5><strong>Description</strong></h5>
      <p>{{ advertprops[id].advertisementDescription }}</p>
    </div>
    <div class="card-footer d-flex justify-content-between">
      <div class="publishedDate">
        <p><strong>Date de publication</strong></p>
        <p>{{ advertprops[id].publishedDate }}</p>
      </div>
      <button @click="postulerAdvert" class="text-light rounded-2">
        Postuler
      </button>
    </div>
  </div>
</template>

<script>
import axios from "axios";

export default {
  name: "Description",
  props: ["advertprops"],
  data() {
    return {
      id: -1,
      msg: "",
    };
  },
  computed: {
    // Récupère l'Id du store envoyé par le component card de base
    getIdOfAdvertCard() {
      if (this.advertprops.length > 0) {
        this.id = Object.values(this.$store.state.idOfAdvertCard)[0];
        return this.id;
      }
    },
  },
  methods: {
    async postulerAdvert() {
      let msg = ""
      do {
        msg = prompt("Ecrivez un message au recruteur :");
      } while (msg == "");

      if (msg != null) {
        try {
          const result = await axios.post(
            "http://127.0.0.1:5000/API/POST/CREATEDINTERACTION",
            `msgPostuler=${msg}&advertisement=${
              this.advertprops[this.id].id
            }&userid=${Object.values(this.$store.state.myUserId)[0]}`
          );
          if (
            result.data.msg !=
            "Merci de votre confiance ! Votre candidature va être traitée."
          ) {
            alert(result.data.msg);
          } else {
            let ok = confirm("Veuillez confirmer votre message.");
            if (ok) {
              alert(result.data.msg);
            }
          }
        } catch (error) {
          alert(error);
          console.log(error);
        }
      }
    },
  },
};
</script>

<style scoped>
p,
h2 {
  margin-bottom: 0;
}

button {
  background: linear-gradient(
    140deg,
    #42c3ca 0%,
    #42c3ca 50%,
    #42c3cac7 75%
  ) !important;
  border: 0;
}
</style>