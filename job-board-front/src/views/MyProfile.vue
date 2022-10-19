<script setup>
import Profil from "../components/profile.vue"
import Admin from "../components/admin.vue"
</script>

<template>
    <div class="container-fluid">
        <div v-if="this.isAdmin === 'True'">
            <Admin></Admin>
        </div>
        <div v-else-if="this.isAdmin=== 'False'">
            <Profil></Profil>
        </div>
        <div v-else>
            <h1> Erreur lors du chargement des infos de votre Profil</h1>
        </div>
    </div>
</template>

<script>

import axios from "axios";
export default {
    component: {
        Profil,
        Admin
    },
    data() {
        return {
            isAdmin: "",
        }
    }
    ,
    async mounted() {
        let myuser = Object.values(this.$store.state.myUserId)[0]
        const result = await axios.get(`http://127.0.0.1:5000/API/GET/GETINFOUSER?idUser=${myuser}`)
        this.isAdmin = result.data.isAdmin
    },
}

</script>

<style>

</style>