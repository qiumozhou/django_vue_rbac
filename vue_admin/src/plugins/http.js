import axios from 'axios'

axios.defaults.timeout = 1000*10

axios.defaults.headers.post['Content-Type'] = "application/json;charset=UTF-8"

//  axios.defaults.baseURL = "http://192.168.84.131:8000";
axios.defaults.baseURL = "http://192.168.60.129:8000";

axios.interceptors.request.use(function (config) {
  const token = localStorage.getItem("token")
  if(token){
                config.headers = {
                    'token':token
                  }
              }
  console.log(config);
  // 在发送请求之前做些什么
  return config;
}, function (error) {
  console.log(error);
  // 对请求错误做些什么
  return Promise.reject(error);
});

// 添加响应拦截器
axios.interceptors.response.use(function (response) {
  console.log(response);
  // 对响应数据做点什么
  return response;
}, function (error) {
  console.log(error);
  // 对响应错误做点什么
  return Promise.reject(error);
});

export default axios