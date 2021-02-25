import axios from "@/plugins/http.js"


function getUserList(){
    return axios.get('/rbac/user')
}


export { getUserList }