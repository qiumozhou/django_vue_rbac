import axios from "@/plugins/http.js"

export  function getUserInfo(){
  return  axios.get('/rbac/userinfo/')
}