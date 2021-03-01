// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import ElementUI from 'element-ui';
import 'element-ui/lib/theme-chalk/index.css';
import App from './App'
import router from './router'
import "./assets/fonts/font_2361663_kv0jeqzw1y/iconfont.css"

import Mybread from "@/components/custom/Mybread.vue"
import store from "./store"



Vue.config.productionTip = false
Vue.use(ElementUI);

Vue.component(Mybread.name,Mybread)

/* eslint-disable no-new */
new Vue({
  el: '#app',
  store,
  router,
  components: { App },
  template: '<App/>'
})
