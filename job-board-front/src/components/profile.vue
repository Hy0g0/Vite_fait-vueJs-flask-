<template>
  <div class="container">
    <div>
      <h1>Mon profil</h1>
      <div
        v-if="this.inModif === false"
        class="d-flex flex-column align-items-center"
      >
        <div class="myProfile1 mb-3">
          <div>
            <p>Name : {{ this.Name }}</p>
            <p>FirstName : {{ this.FirstName }}</p>
            <p>Phone : {{ this.phone }}</p>
            <p>Mail : {{ this.mail }}</p>
          </div>
          <input class="mt-2" type="button" @click="modif" value="Modifier" id="submit" />
        </div>
      </div>
      <div v-else class="d-flex flex-column align-items-center">
        <form class="myProfile2 mb-3" @submit.prevent="save">
          <label for="Name">Name</label><br />
          <input id="Name" type="text" v-model="Name" /><br />
          <label for="FirstName">FirstName</label><br />
          <input id="FirstName" type="text" v-model="FirstName" /><br />
          <label for="phone">Phone</label><br />
          <input
            id="phone"
            type="tel"
            pattern="[0-9]{10}"
            v-model="phone"
          /><br />
          <label for="mail">Mail</label><br />
          <input id="mail" type="email" v-model="mail" /><br /><br />
          <input type="submit" value="Sauvegarder" id="submit" />
        </form>
      </div>
    </div>
    <h1>Mes Candidatures</h1>
    <div class="row">
      <div v-for="inter in interactions" :key="inter.id" class="col-6">
        <div class="card mt-2">
          <div class="card-header d-flex justify-content-between">
            <h3>
              <strong>
                {{
                  filteredAdvertbyId(inter.advertisement)[0].advertisementName
                }}
              </strong>
            </h3>
            <div class="publishedDate">
              {{ filteredAdvertbyId(inter.advertisement)[0].publishedDate }}
            </div>
          </div>

          <div class="card-body">
            <h5><strong>Détails du poste</strong></h5>
            <p>
              <strong>Localisation</strong> <br />

              {{
                filteredAdvertbyId(inter.advertisement)[0].advertisementlocation
              }}
            </p>
            <p>
              <strong>Salaire</strong><br />
              {{ filteredAdvertbyId(inter.advertisement)[0].salary }}€
            </p>
            <p>
              <strong>Type de contrat</strong><br />

              {{ filteredAdvertbyId(inter.advertisement)[0].contractType }}
            </p>
            <h5><strong>Description</strong></h5>
            <p v-if="varLearnMore == false">
              {{
                filteredAdvertbyId(
                  inter.advertisement
                )[0].advertisementDescription.slice(0, 100)
              }}
            </p>
            <p v-else-if="varLearnMore == true && idinter == inter.id">
              {{
                filteredAdvertbyId(inter.advertisement)[0]
                  .advertisementDescription
              }}
            </p>
          </div>
          <div class="card-footer d-flex justify-content-between">
            <div class="msg">
              <strong>Message de candidature</strong>
              <p>{{ inter.msgPostuler }}</p>
            </div>
            <button
              @click="learnmore(inter.id)"
              class="btn text-light rounded-2"
            >
              Learn More ...
            </button>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from "axios";
export default {
  name: "Profil",
  data() {
    return {
      Name: "",
      inModif: false,
      FirstName: "",
      phone: "",
      mail: "",
      idcompany: null,
      interactions: [],
      idinter: -1,
      varLearnMore: false,
    };
  },
  methods: {
    modif() {
      this.inModif = !this.inModif;
    },

    async save() {
      this.inModif = !this.inModif;
      const result = await axios.post(
        `http://127.0.0.1:5000/API/POST/MODIFYUSER`,
        `idUser=${Object.values(this.$store.state.myUserId)[0]}&mail=${
          this.mail
        }&userFirstName=${this.FirstName}&userName=${this.Name}&phone=${
          this.phone
        }`
      );
      alert(result.data.result);
    },
    filteredAdvertbyId(idAvert) {
      return this.$store.state.advertsFromVueX.filter((item) => {
        return item.id.includes(idAvert);
      });
    },
    learnmore(id) {
      if (!this.varLearnMore) {
        this.varLearnMore = true;
      } else {
        this.varLearnMore = false;
      }
      this.idinter = id;
    },
  },
  async mounted() {
    let myuser = Object.values(this.$store.state.myUserId)[0];
    console.log(this.$store.state.myUserId)
    try {
      const result = await axios.get(
        `http://127.0.0.1:5000/API/GET/GETINFOUSER?idUser=${myuser}`
      );
      const res = await axios.get(
        `http://127.0.0.1:5000/API/GET/INFOINTERACTION?userid=${myuser}`
      );
      this.interactions = res.data;
      this.Name = result.data.userName;
      this.FirstName = result.data.userFirstName;
      this.phone = result.data.phone;
      this.mail = result.data.mail;
    } catch (e) {
      console.error(e);
    }
  },
};
</script>

<style scoped>
.myProfile1 {
  background-color: rgba(255, 255, 255, 0.5);
  padding: 13px;
  border-radius: 6px;
}

.myProfile1 p {
  margin: 3px 0;
  background-color: #303245;
  color: #eee;
  border-radius: 6px;
  padding: 5px;
}

form {
  padding: 10px;
  border-radius: 15px;
  background-color: rgba(255, 255, 255, 0.5);
  justify-content: center;
}

input[type="number"] {
  -moz-appearance: textfield;
}

input::-webkit-outer-spin-button,
input::-webkit-inner-spin-button {
  -webkit-appearance: none;
  margin: 0;
}

.myProfile2 input, .myProfile1 input {
  background-color: #303245;
  border-radius: 6px;
  border: 0;
  box-sizing: border-box;
  color: #eee;
  height: 5vh;
  outline: 0;
  margin: 3px 0;
  width: 100%;

}

.btn {
  background: linear-gradient(
    140deg,
    #42c3ca 0%,
    #42c3ca 50%,
    #42c3cac7 75%
  ) !important;
  border: 0;
  height: 40px;
}

 #submit {
  width: 60%;
  margin-left: 50px;
 }

 .msg {
  padding-right: 10px;
 }
</style>