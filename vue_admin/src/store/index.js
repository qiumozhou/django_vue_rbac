import Vue from 'vue'
import Vuex from 'vuex' 

Vue.use(Vuex)

const store = new Vuex.Store({
    state:{
        username:'',
        menu:{},
        permission:{}
    },
    mutations:{
        getUserName(state,payload){
            state.username = payload
        },
        getMenu(state,payload){
            state.menu = payload
        },
        getPermiSsion(state,payload){
            state.permission = payload
        }
    }
})


export default store