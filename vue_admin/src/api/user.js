import axios from "@/plugins/http.js"


function getUserList() {
    return axios.get('/rbac/user/')
}

function editUser(id, data) {
    return axios.put('/rbac/user/' + id + "/", data)
}


function addUser(data) {
    return axios.post('/rbac/user/', data)
}


export { getUserList, editUser, addUser }