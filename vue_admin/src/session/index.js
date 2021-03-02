function setUsername(ret){
    sessionStorage.setItem("username",ret.data.data.username)
}

function setMenu(ret){
    sessionStorage.setItem("menu",JSON.stringify(ret.data.data.menu) )
}

function setPermission(ret){
    sessionStorage.setItem("permission",JSON.stringify(ret.data.data.permission) )
}

function setRouter(ret){
    sessionStorage.setItem("router",JSON.stringify(ret.data.data.router) )
}

function getUsername(){
    return sessionStorage.getItem("username")
}

function getMenu(){
    return JSON.parse(sessionStorage.getItem("menu")) 
}

function getPermission(){
    return JSON.parse(sessionStorage.getItem("permission")) 
}

function getRouter(){
    return JSON.parse(sessionStorage.getItem("router")) 
}


export {setUsername,setMenu,setPermission,setRouter,getUsername,getMenu,getPermission,getRouter}