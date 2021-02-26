import Vue from 'vue'
import Router from 'vue-router'
import store from '@/store/index.js'
import Login from "@/components/login/login.vue"
import Index from "@/components/index/index.vue"
import Users from "@/components/users/users.vue"
import Roles from "@/components/permission/roles.vue"
import Permissions from "@/components/permission/permissions.vue"
import Notfound from "@/components/404/404.vue"



const originalPush = Router.prototype.push
Router.prototype.push = function push(location) {
  return originalPush.call(this, location).catch(err => err)
}
Vue.use(Router)

const router =  new Router({
  routes: [
        {
      name:"login",
      path: '/login',
      component: Login
    }
  ]
})

export const asyncRoutes = [

      {name:"uesrs",
      path: '/users',
      component:Users},
      {
        name:"roles",
        path:"/roles",
        component:Roles
      }
      ,{
        name:"permission",
        path:"/permissions",
        component:Permissions
      },

]



export function menusToRoutes(data) {
  const result = []
  const children = []

  result.push({
      name:"index",
      path: '/',
      component:Index,
      children,
  })

  data.forEach(item => {
      generateRoutes(children, item)
  })

  children.push({
      name: "404",
      path: "/404",
      component: Notfound
  })

  // 最后添加404页面 否则会在登陆成功后跳到404页面
  result.push(
      {path: '*', redirect: '/404'},
  )
  return result
}

// 将菜单信息转成对应的路由信息 动态添加
function generateRoutes(children, item) {
  asyncRoutes.forEach(function(routeitem){
    if (item.name == routeitem.name) {
      children.push(routeitem)
  } 
  })
}


router.beforeEach((to, from, next) => {
  if(to.name == "login"){
    next()
  }else{
    const token = sessionStorage.getItem("token")
    if(!token){
          router.push({name:"login"})
      }
      const menu = store.state.menu
    if(menu.length == 0){
      store.commit("setUserInfo")
      router.push(window.location.hash.split("#/")[1])
    }
    next()
  }

})


export default router