import Vue from 'vue'
import Vuex from 'vuex' 
import {getUserInfo} from "@/plugins/user.js"
Vue.use(Vuex)

const store = new Vuex.Store({
    state:{
        username:'',
        menu:[],
        permission:[]
    },
    mutations:{
        setUserInfo(state){
            getUserInfo().then(ret=>{
                console.log(5555,ret.data.data)
                state.username = ret.data.data.username
                state.menu = ret.data.data.menu
                state.permission = ret.data.data.permission
            })
        },
    }
})


export default store