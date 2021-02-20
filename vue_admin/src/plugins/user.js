export function getUserInfo(){
    console.log(11111)
    this.$MyHttpServer.get('/rbac/userinfo/').then(ret =>{
        console.log(ret)
    })
}