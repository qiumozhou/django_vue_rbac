import axios from "@/plugins/http.js"


function getRoleList() {
    return axios.get('/rbac/role/')
}

function getRoleInfo(id) {
    return axios.get('/rbac/role/' + id + "/")
}

function editRole(id, data) {
    return axios.put('/rbac/role/' + id + "/", data)
}


function addRole(data) {
    return axios.post('/rbac/role/', data)
}

function deleteRole(id) {
    return axios.delete('/rbac/role/' + id + '/')
}





export { getRoleList, getRoleInfo, editRole, addRole, deleteRole }