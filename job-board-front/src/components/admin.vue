<script setup>
import Catégorie from "../components/optionsCategorys.vue";
</script>
<template>
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-4 ">
                <h1 class="text-center">My Users</h1>
                <div v-for="user in this.users" :key="user.iduser" class="container-cards alert alert-primary">
                    <div class="card mt-2">
                        <div class="card-header">ID: {{user.iduser}}</div>
                        <div v-if="ModifyUser === user.iduser ">
                            IS ADMIN : <input type="checkbox" v-model="this.userAdmin"><br>
                            NAME :<input type="text" v-model="this.userName"><br>
                            Firstname :<input type="text" v-model="this.userFirstName"><br>
                            PHONE : <input type="text" v-model="this.phone"><br>
                            MAIL : <input type="text" v-model="this.Usermail"><br>
                            <button @click="SavemodifUser(user.iduser)">save</button>
                        </div>
                        <div v-else class="card-body">
                            <p>IS ADMIN : {{user.isAdmin}}</p>
                            <p>Firstname : {{user.userFirstName}}</p>
                            <p>NAME : {{user.userName}}</p>
                            <p>MAIL : {{user.mail }}</p>
                            <p>PHONE : {{ user.phone }}</p>
                            <p>COMPANY : {{ user.company}}</p>

                            <div class="card-footer">
                                <button @click="deleteUser(user.iduser)">X</button>
                                <button
                                    @click="ModifUser(user.iduser,user.userName,user.userFirstName,user.mail,user.phone,user.isAdmin)">Modify</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-4 ">
                <h1 class="text-center">My Adverts</h1>
                <div v-for="advert in this.adverts" :key="advert.id" class="container-cards alert alert-success">
                    <div class="card mt-2">
                        <div class="card-header">{{ advert.id }}</div>
                        <div v-if="ModifyAdvert === advert.id ">
                            NAME : <input type="texts" v-model="this.adName"><br>
                            CONTRACT :<input type="text" v-model="this.adContract"><br>
                            DESC :<textarea type="text" v-model="this.adDesc"></textarea><br>
                            SALARY : <input type="text" v-model="this.adSalary"><br>
                            Category : <select v-model="adCategory" required>
                                <Catégorie></Catégorie>
                            </select><br>
                            Location : <input type="text" v-model="this.adLocation"><br>
                            <button @click="SavemodifAd(advert.id)">save</button>
                        </div>
                        <div v-else>
                            <div class="card-body">
                                <p>NAME : {{advert.advertisementName}}</p>
                                <p>COMPANY: {{ advert.idcompany }}</p>
                                <p>CATEGORY : {{advert.advertisementCategory}}</p>
                                <p>CONTRACT : {{ advert.contractType }}</p>
                                <p>DESC : {{ advert.advertisementDescription }}</p>
                                <p>SALARY : {{ advert.salary }}</p>
                                <p>DATE : {{advert.publishedDate}}</p>
                                <p>Location : {{advert.advertisementlocation}}</p>
                            </div>
                            <div class="card-footer">
                                <button @click="deleteAd(advert.id)">X</button>
                                <button
                                    @click="ModifAd(advert.id,advert.advertisementName,advert.contractType,advert.advertisementDescription,advert.salary,advert.advertisementCategory,advert.advertisementlocation)">Modify</button>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-4 ">
                <h1 class="text-center">My Company</h1>
                <div v-for="company in this.companys" :key="company.idcompany"
                    class="container-cards alert alert-primary">
                    <div class="card mt-2">
                        <div class="card-header">ID: {{company.idcompany}}</div>
                        <div v-if="ModifyCompany === company.idcompany ">
                            NAME : <input type="texts" v-model="this.compName"><br>
                            CONTRACT :<input type="text" v-model="this.compMail"><br>
                            <button @click="SavemodifComp(company.idcompany)">save</button>
                        </div>
                        <div v-else>
                            <div class="card-body">
                                <p>NAME : {{company.companyName}}</p>
                                <p>MAIL : {{company.mail }}</p>
                            </div>
                            <div class="card-footer">
                                <button @click="deleteComp(company.idcompany)">X</button>
                                <button @click="ModifCompany(company.idcompany,company.companyName,company.mail)">Modify</button>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import axios from "axios";
export default {
    name: "Admin",
    data() {
        return {
            users: [],
            companys: [],
            adverts: [],
            ModifyUser: -1,
            ModifyAdvert: -1,
            ModifyCompany: -1,
            userAdmin: false,
            userName: "",
            userFirstName: "",
            Usermail: "",
            phone: "",
            adName: "",
            adContract: "",
            adDesc: "",
            adSalary: 0,
            adCategory: "",
            adLocation: "",
            compName: "",
            compMail: "",
        }
    }, methods: {
        async deleteAd(id) {
            console.log("deleteAd: " + id);
            const result = await axios.post("http://127.0.0.1:5000/API/GET/DELETEADVERT", `idAdv=${id}`)
            console.log(result)
            if (result.data.result) alert("Ad deleted")
        },
        async deleteUser(id) {
            console.log("deleteUser: " + id);
            const result = await axios.post("http://127.0.0.1:5000/API/POST/DELETEUSER", `idUser=${id}`)
            console.log(result)
            if (result.data.result) alert("user deleted")
        }, async deleteComp(id) {
            console.log("deleteComp: " + id);
            const result = await axios.post("http://127.0.0.1:5000/API/POST/DELETECOMPANY", `idcompany=${id}`)
            console.log(result)
            if (result.data.result) alert("company deleted")
            //todo
        }, ModifUser(id, userName, userFirstName, mail, phone, isAdmin) {
            console.log(id, userName, userFirstName, mail, phone, isAdmin)
            console.log();
            this.ModifyUser = id;
            this.userName = userName
            this.userFirstName = userFirstName
            this.Usermail = mail
            this.phone = phone
            this.userAdmin = isAdmin


        }, async SavemodifUser(id) {
            this.ModifyUser = -1
            const result = await axios.post("http://127.0.0.1:5000/API/POST/MODIFYUSER", `idUser=${id}&userName=${this.userName}&userFirstName=${this.userFirstName}&mail=${this.Usermail}&phone=${this.phone}`)
            console.log(result)
            if (result.data.result === "success") alert("Modif success")
        },
        ModifAd(id, name, contractType, advertisementDescription, salary, category, location) {
            this.ModifyAdvert = id
            this.adName = name
            this.adContract = contractType
            this.adDesc = advertisementDescription
            this.adSalary = salary
            this.adCategory = category
            this.adLocation = location
        },
        async SavemodifAd(id) {
            this.ModifyAdvert = -1
            const result = await axios.post("http://127.0.0.1:5000/API/POST/MODIFYADVERTISEMENT", `id=${id}&advertisementCategory=${this.adCategory}&advertisementDescription=${this.adDesc}&advertisementName=${this.adName}&salary=${this.adSalary}&contractType=${this.adContract}&advertisementlocation=${this.adLocation}`)
            console.log(result)
            if (result.data.result === "success") alert("Modif success")
        }, ModifCompany(id,name,mail) {
            this.ModifyCompany = id
            this.compName = name
            this.compMail = mail
        },async SavemodifComp(id){
            this.ModifyCompany = -1
            const result = await axios.post("http://127.0.0.1:5000/API/POST/MODIFYCOMPANY", `idcompany=${id}&companyName=${this.compName}&mail=${this.compMail}`)
            console.log(result)
            if (result.data.result === "success") alert("Modif success")
        }

    },
    async mounted() {
        const users = await axios.get(`http://127.0.0.1:5000/API/GET/GETUSERS`)
        this.users = users.data
        const adverts = await axios.get(`http://127.0.0.1:5000/API/GET/Advert`)
        this.adverts = adverts.data.data
        const companys = await axios.get(`http://127.0.0.1:5000/API/GET/INFOCOMPANYS`)
        this.companys = companys.data

    }

}
</script>

<style>

</style>