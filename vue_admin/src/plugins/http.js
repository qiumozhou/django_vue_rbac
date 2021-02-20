import axios from "axios"

const MyHttpServer = {}




MyHttpServer.install  = (Vue) =>{
    axios.defaults.baseURL = "http://192.168.84.131:8000";

    axios.interceptors.request.use(
        config => {
          const token = localStorage.getItem("token")
        //   config.data = JSON.stringify(config.data);
   
          if(token){
            config.headers = {
                'token':token
              }
          }
          return config;
        },
        error => {
          return Promise.reject(err);
        }
      );

    Vue.prototype.$http  = axios;
}

export default MyHttpServer