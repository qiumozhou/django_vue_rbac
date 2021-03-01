import axios from "@/plugins/http.js"


function getMenuList() {
    return axios.get('/rbac/menu/')
}

function editUser(id, data) {
    return axios.put('/rbac/user/' + id + "/", data)
}


function addUser(data) {
    return axios.post('/rbac/user/', data)
}


function getTreeMenu() {
    return axios.get('/rbac/treemenu/')
}


export { getMenuList, editUser, addUser, getTreeMenu }