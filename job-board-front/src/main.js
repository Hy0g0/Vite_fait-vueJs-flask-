import { createApp } from 'vue'
import App from './App.vue'
import router from './router'
import store from '@/store/store'
import axios from 'axios'
import VueAxios from 'vue-axios'
import VueCookies from 'vue-cookies';

const app = createApp(App)

app.use(router)

app.use(store)

app.use(VueAxios, axios)

app.use(VueCookies);

app.mount('#app')
