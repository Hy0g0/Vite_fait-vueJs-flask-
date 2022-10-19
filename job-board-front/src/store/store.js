// Import the createStore object from Vuex
import { createStore } from 'vuex'
// Import axios to make HTTP requests
import axios from "axios"

const store = createStore({
    state() {  // Data du store
        return {
            advertsFromVueX: [],
            idOfAdvertCard: [-1],
            myUserId: [-1]
        }
    },
    getters: { // Comme le computed mais pour store

    },
    mutations: { // Permet de modifier les states avec des fonction 
        // Permet l'affectation des adverts lors de l'action getAdvert
        SET_ADVERTISSEMENT(state, adverts) {
            state.advertsFromVueX = adverts
            console.log(state.advertsFromVueX)
        },
        //Permet le changement d'Id quand learn More est cliqué (Component Cards pour l'utilisé dans Description)
        SET_IDOFADVERTCARD(state, idOfAdvertCard) {
            state.idOfAdvertCard = idOfAdvertCard;
        },
        SET_USERID(state,userid)  {
            state.myUserId = userid
        }

    }, 

    actions: {
        // Récuparation des advertissement dans la BDD
        async getAdverts({ commit }) {
            try {
                const data = await (await axios.get("http://127.0.0.1:5000//API/GET/Advert")).data.data
                commit('SET_ADVERTISSEMENT', data) // Appel de la mutation SET_ADVERTISSEMENT
            }
            catch (error) {
                alert(error)
                console.log(error)
            }
        },
        // Fait appel a la mutation SET_IDOFADVERTCARD
        getIdOfAdvertCard({ commit }, idOfAdvertCard) {
            commit('SET_IDOFADVERTCARD', idOfAdvertCard)
        },
        setUserId({commit},userid){
            commit('SET_USERID', userid)
        }
    },
    modules: {

    }
})

export default store