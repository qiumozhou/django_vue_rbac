import Vue from 'vue'
import Vuex from 'vuex' 

Vue.use(Vuex)

const store = new Vuex.Store({
    state:{
        username:'',
        menu:[],
        permission:[]
    },
    mutations:{
        setUserName(state,payload){
            state.username = payload
        },
        setMenu(state,payload){
            state.menu = payload
        },
        setPermiSsion(state,payload){
            state.permission = payload
        }
    }
})


export default store