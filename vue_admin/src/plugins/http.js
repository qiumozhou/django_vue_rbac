import axios from "axios"

const MyHttpServer = {}

MyHttpServer.install  = (Vue) =>{
    axios.defaults.baseURL = "http://127.0.0.1:5000/v1";
    Vue.prototype.$http  = axios;
}

export default MyHttpServer