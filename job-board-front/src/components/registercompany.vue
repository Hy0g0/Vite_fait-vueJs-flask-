<template>
    <div class="vue-tempalte">
        <div class="container">
            <form @submit.prevent="submit">
                <h3>Create my company</h3>

                <div class="form-group">
                    <label>Email address</label>
                    <input type="email" v-model="email" class="form-control form-control-lg" required />
                </div>

                <div class="form-group">
                    <label>Name</label>
                    <input type="text" v-model="name" class="form-control form-control-lg" required />
                </div>

                <button type="submit" class="btn btn-dark btn-lg btn-block">Create</button>
            </form>
        </div>
        {{msg}}

    </div>
</template>
 
<script>
import axios from "axios";
export default {
    data() {
        return {
            email: "",
            name: "",
        }
    },
    methods: {
        async submit() {
            try {
                const result = await axios.post("http://127.0.0.1:5000/API/POST/CREATECOMPANY", `mail=${this.email}&companyName=${this.name}`)
                alert("Company created")

            }
            catch (error) {
                alert(error)
                console.log(error)
            }
        }
    }
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
    margin-top: 150px;
    position: relative;
    width: 30%;
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