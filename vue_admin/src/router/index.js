import Vue from 'vue'
import Router from 'vue-router'

import Login from "@/components/login/login.vue"
import Index from "@/components/index/index.vue"
import Users from "@/components/users/users.vue"
import Roles from "@/components/permission/roles.vue"
import Permissions from "@/components/permission/permissions.vue"



const originalPush = Router.prototype.push
Router.prototype.push = function push(location) {
  return originalPush.call(this, location).catch(err => err)
}
Vue.use(Router)

const router =  new Router({
  routes: [
    {
      name:"index",
      path: '/',
      component:Index,
      children:[
        {name:"uesrs",
        path: '/users',
        component:Users},
        {
          name:"roles",
          path:"/roles",
          component:Roles
        },{
          name:"permission",
          path:"/permissions",
          component:Permissions
        }
      ]
    },
        {
      name:"login",
      path: '/login',
      component: Login
    },
  ]
})


router.beforeEach((to, from, next) => {
  if(to.name == "login"){
    next()
  }else{
    const token = localStorage.getItem("token")
    if(!token){
          router.push({name:"login"})
          // return
      }
      next()
  }

})




export default router