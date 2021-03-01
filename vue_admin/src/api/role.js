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



export { getRoleList, getRoleInfo, editRole }