import axios from "@/plugins/http.js"


function getPermissionList() {
    return axios.get('/rbac/permission/')
}

function editPermission(id, data) {
    return axios.put('/rbac/permission/' + id + "/", data)
}


function addPermission(data) {
    return axios.post('/rbac/permission/', data)
}

function deletePermission(id) {
    return axios.delete('/rbac/permission/' + id + "/")
}


export { getPermissionList, editPermission, addPermission, deletePermission }