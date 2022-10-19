<template>
    <div class="vue-tempalte">
        <div class="container">
            <form @submit.prevent="register">
                <h3>Sign Up</h3>

                <div class="form-group">
                    <label>First Name</label>
                    <input v-model="FirstName" type="text" class="form-control form-control-lg" required />
                </div>
                <div class="form-group">
                    <label>Last Name</label>
                    <input v-model="LastName" type="text" class="form-control form-control-lg" required />
                </div>
                <div class="form-group">
                    <label>Email address</label>
                    <input v-model="email" type="email" class="form-control form-control-lg" required />
                </div>
                <div class="form-group">
                    <label>Phone</label>
                    <input v-model="Phone" type="tel" pattern="[0-9]{10}" class="form-control form-control-lg"
                        required />
                </div>
                <div class="form-group">
                    <label>Password</label>
                    <input v-model="password" type="password" class="form-control form-control-lg" required />
                </div>
                <div class="form-group">
                    <label>Confirm Password</label>
                    <input v-model="confirm" type="password" class="form-control form-control-lg" required />
                </div>
                <label> I'm a recruiter: </label><input id="check" type="checkbox" v-model="isrecruiter">
                <div v-if="isrecruiter === true">
                    <select v-model="selectedCompany">
                        <option v-for="option in this.options" :value="option.idcompany">{{option.companyName}}</option>
                    </select>

                    <RouterLink to="/createComapny">
                        Create my company
                    </RouterLink>
                </div>
                <div>
                    {{msg}}
                </div>
                <button type="submit" class="btn btn-dark btn-lg btn-block">Sign Up</button>
            </form>
        </div>
    </div>
</template>
 
<script>
import axios from "axios";
export default {
    data() {
        return {
            email: "",
            password: "",
            FirstName: "",
            LastName: "",
            Phone: "",
            confirm: "",
            msg: "",
            isrecruiter: "false",
            options: [],
            selectedCompany: -1,
        }
    },
    methods: {
        async register(e) {
            e.preventDefault();
            try {
                if (!(this.confirm === this.password)) alert("incorect password")
                else {

                    const result = await axios.post("http://127.0.0.1:5000/API/POST/REGISTER", `mail=${this.email}&password=${this.password}&firstName=${this.FirstName}&name=${this.LastName}&phone=${this.Phone}&idcompany=${this.selectedCompany}`
                    )
                    this.msg = result.data.result
                }
                if (this.msg === "register done") {
                    alert("Votre compte à été créer avec succes veuillez vous connecter")
                    this.$router.push("/connexion")
                }
            }
            catch (error) {
                alert(error)
                console.log(error)
            }
        }
    }, async mounted() {
        const res = await axios.get(`http://127.0.0.1:5000/API/GET/INFOCOMPANYS`)
        this.options = res.data
    }
}
</script>
<style scoped>
.container {
    align-items: center;
    display: flex;
    justify-content: center;
    width: 400px;

}

form {
    margin: 15px;
    position: relative;
    padding: 20px;
    border-radius: 15px;
    background-color: rgba(255, 255, 255, 0.5);
    justify-content: center;
}

label {
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

input,
textarea,
select,
option {
    background-color: #303245;
    border-radius: 12px;
    border: 0;
    box-sizing: border-box;
    color: #eee;
    font-size: 20px;
    height: 5vh;
    outline: 0;
    padding: 4px 20px 0;
    margin: 3px;
    width: 100%;
}

#check {
    width: 30px;
    position: absolute;
}

button {
    background-color: #494b55;
    border-radius: 12px;
    border: 0;
    box-sizing: border-box;
    color: #eee;
    font-size: 20px;
    height: 6vh;
    outline: 0;
    padding: 4px 20px 0;
    margin: 3px;
    width: 60%;
    margin-left: 18%;
    margin-top: 20px;
}
</style>