import Vue from 'vue'
import Vuex from 'vuex' 
import {getUserInfo} from "@/plugins/user.js"
import router from "@/router/index.js"
import { menusToRoutes } from "@/router/index.js"

Vue.use(Vuex)

const store = new Vuex.Store({
    state:{
        username:'',
        menu:[],
        permission:[],
    },
    mutations:{
        setUserInfo(state){
            const menu = sessionStorage.getItem("menu")
            if(!menu){
                getUserInfo().then(ret=>{
                    sessionStorage.setItem("username",ret.data.data.username)
                    sessionStorage.setItem("menu",JSON.stringify(ret.data.data.menu) )
                    sessionStorage.setItem("permission",JSON.stringify(ret.data.data.permission) )
                    sessionStorage.setItem("router",JSON.stringify(ret.data.data.router) )
                    state.username = ret.data.data.username
                    state.menu = ret.data.data.menu
                    state.permission = ret.data.data.permission
                    state.router = ret.data.data.router

                    const newRouter = menusToRoutes(state.router)
                    newRouter.forEach(el =>{
                        router.addRoute(el)
                    })
                })
            }else{
                state.username = sessionStorage.getItem("username")
                state.menu = JSON.parse(sessionStorage.getItem("menu")) 
                state.permission = JSON.parse(sessionStorage.getItem("permission")) 
                state.router = JSON.parse(sessionStorage.getItem("router")) 

                const newRouter = menusToRoutes(state.router)
                newRouter.forEach(el =>{
                    router.addRoute(el)
                })
            }
            
        },
    }
})


export default store