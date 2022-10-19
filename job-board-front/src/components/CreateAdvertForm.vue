<script setup>
import Catégorie from "../components/optionsCategorys.vue";</script>

<template>
    <div class="container">
    <form @submit.prevent="submit">
        <h3>Create my advert</h3>
        <div class="form-group">
            <label>Category</label>
            <select v-model="Category" id="Category" required>
                <Catégorie></Catégorie>
            </select>
        </div>
        <div class="form-group">
            <label>Job's name</label>
            <input v-model="Name" type="text"  required />
        </div>
        <div class="form-group">
            <label>Description</label>
            <textarea v-model="Description" type="text"  required></textarea>
        </div>
        <div class="form-group">
            <label>Salary</label>
            <input v-model="Salary" type="number"  required />
        </div>
        <div class="form-group">
            <label>Contract</label>
            <select v-model="Contract" id="Contract" required>
                <option value="CDI">CDI</option>
                <option value="CDD">CDD</option>
                <option value="Stage">Stage</option>
                <option value="Alternance">Alternance</option>

                <option value="Autres">Autres</option>
            </select>
        </div>
        <div class="form-group">
            <label>Location</label>
            <input v-model="Location" type="text"  required />
        </div>
        <button type="submit" class="btn btn-dark btn-lg btn-block">Submit</button>
    </form>
</div>
</template>

<script>
import axios from "axios";
export default {
    data() {
        return {
            Category: "",
            Name: "",
            Description: "",
            Salary: 0,
            Contract: "",
            Location: "",
        }
    },
    methods: {

        async submit() {
            try {
                let myuser = Object.values(this.$store.state.myUserId)[0]
                if (myuser > -1) {
                    let ladate = new Date();
                    ladate = ladate.getFullYear() + "-" + (ladate.getMonth() + 1) + "-" + ladate.getDate();
                    const result = await axios.post("http://127.0.0.1:5000/API/POST/CREATED", `advertisementName=${this.Name}&advertisementCategory=${this.Category}&advertisementDescription=${this.Description}&publishedDate=${ladate}&salary=${this.Salary}&contractType=${this.Contract}&advertisementlocation=${this.Location}&idUser=${myuser}`
                    )
                    if (!result.data.result) {
                        alert("Vous n'etes pas connectez à une entreprise vous devez le faire avant de pouvoir poster une annonce")
                    } else {
                        alert("Annonce créée")
                        this.$router.push("/search-adverts")
                    }
                } else {

                    alert("Connectez vous pour pouvoir créer une annonce ")
                    this.$router.push("/connexion")
                }
            }
            catch (error) {
                alert(error)
                console.log(error)
            }
        }
    },
}

</script>

<style scoped>
.container {
    align-items: center;
  display: flex;
  justify-content: center;
  
}
form {
    margin: 15px;
  position: relative;
  width: 350px;
  padding: 20px;
  border-radius: 15px;
  background-color: rgba(255, 255, 255, 0.5);
  justify-content: center;
}
label{
    font-size: 3vh;
}
input[type=number] {
  -moz-appearance: textfield;
}
input::-webkit-outer-spin-button,
input::-webkit-inner-spin-button {
  -webkit-appearance: none;
  margin: 0;
}
input,textarea,select,option {
    background-color: #303245;
    border-radius: 12px;
    border: 0;
    box-sizing: border-box;
    color: #eee;
    font-size: 20px;
    height: 5vh;
    outline: 0;
    padding: 4px 20px 0;
    margin:3px;
    width: 100%;
}
button{
    background-color: #494b55;
    border-radius: 12px;
    border: 0;
    box-sizing: border-box;
    color: #eee;
    font-size: 20px;
    height: 6vh;
    outline: 0;
    padding: 4px 20px 0;
    margin:3px;
    width: 60%;
    margin-left: 18%;
    margin-top: 20px;
}
</style>