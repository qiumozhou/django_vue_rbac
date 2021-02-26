import axios from "@/plugins/http.js"


function getUserList(){
    return axios.get('/rbac/user/')
}

function editUser(id,data){
    return axios.put('/rbac/user/'+id+"/",data)
}


export { getUserList,editUser }