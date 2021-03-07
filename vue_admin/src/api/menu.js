import axios from "@/plugins/http.js"


function getTreeMenu() {
    return axios.get('/rbac/treemenu/')
}

function getMenuList() {
    return axios.get('/rbac/rootmenu/')
}

function editMenu(id, data) {
    return axios.put('/rbac/menu/' + id + "/", data)
}


function addMenu(data) {
    return axios.post('/rbac/menu/', data)
}


function deleteMenu(id) {
    return axios.delete('/rbac/menu/' + id + "/")
}





export { getTreeMenu, getMenuList, editMenu, addMenu, deleteMenu }