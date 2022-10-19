import { createRouter, createWebHistory } from 'vue-router'
import HomeView from '../views/HomeView.vue'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'HomeView',
      component: HomeView
    },
    {
      path: '/search-adverts',
      name: 'SearchAdverts',
      // Permet de mettre un petit temps de 
      component: () => import('../views/SearchAdverts.vue')
    },
    {
      path: '/connexion',
      name: 'Connexion',
      // Permet de mettre un petit temps de 
      component: () => import('../components/LoginForm.vue')
    },
    {
      path: '/my-adverts',
      name: 'MyAdverts',
      // Permet de mettre un petit temps de 
      component: () => import('../components/CreateAdvertForm.vue')
    },
    {
      path: '/Signup',
      name: 'signup',
      component: () => import('../components/RegisterForm.vue')
    },
    {
      path: '/MyProfile',
      name: 'MyProfile',
      component: () => import('../views/MyProfile.vue')
    },{
      path: '/createComapny',
      name: 'createComapny',
      component: () => import('../components/registercompany.vue')
    }

  ]
})

export default router
