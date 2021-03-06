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


function addUser(data) {
    return axios.post('/rbac/user/', data)
}




export { getTreeMenu, getMenuList, editMenu }