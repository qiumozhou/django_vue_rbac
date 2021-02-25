import axios from "@/plugins/http.js"


function getRoleList(){
    return axios.get('/rbac/role/')
}


export { getRoleList }