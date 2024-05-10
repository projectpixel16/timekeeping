import { createRouter, createWebHistory } from "vue-router";

import timein from  '../Components/timein.vue'

import notFound from '../Components/notFound.vue'

const routes = [

   
    {
        path:'/',
        name:'timein',
        component: timein,
        // meta:{
        //     requiresAuth:false
        // }
    },
    

    // Masterfile--------------------------------------------------------------------------------------------------------------------------------
    
    

    {
        path:'/:pathMatch(.*)*',
        name:'notFound',
        component: notFound,
    }
]

const router = createRouter({
    history: createWebHistory(),
    routes
})

router.beforeEach((to,from) => {
    if(to.meta.requiresAuth && !localStorage.getItem('token')){
        return { name: 'login'}
    }

    // if(to.meta.requiresAuth == false && localStorage.getItem('token')){
    //     return { name: 'dashboard'}
    // }
})


export default router