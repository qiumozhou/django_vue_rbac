<template>
<div class="main">
    <div class="login-form">
      <el-form :label-position="labelPosition" status-icon label-width="80px" :model="user" :rules="rules" ref="user">
  <el-form-item label="帐号" prop="username"> 
    <el-input v-model="user.username" prefix-icon="iconfont icon-icon"></el-input>
  </el-form-item>
  <el-form-item label="密码" prop="password">
    <el-input v-model="user.password" prefix-icon="iconfont icon-mima"></el-input>
  </el-form-item>
    <el-form-item >
        <el-row><el-button type="primary" class="login-btn" @click="doLogin()">登录</el-button></el-row>
    
  </el-form-item>
  
</el-form>
  </div></div>
  
</template>

<script>
import  { getUserInfo } from "@/plugins/user.js"
import  axios  from "@/plugins/http.js"
export default {
        data() {

 var validateUsername = (rule, value, callback) => {
              if (value === '') {
                callback(new Error('请输入帐号'));
              } else {
                
                callback();
              }
            };

        var validatePassword = (rule, value, callback) => {
        if (value === '') {
          callback(new Error('请输入密码'));
        } else {
          
          callback();
        }
      };
            return {
                labelPosition: 'top',
                user: {
                username: '',
                password: ''
                },
                rules: {
                username: [
                  { validator: validateUsername, trigger: 'blur' }
                ],
                 password: [
                  { validator: validatePassword, trigger: 'blur' }
                ],
        }
            };
            },
            methods:{
                doLogin(){
        this.$refs["user"].validate((valid) => {
            if(valid){
                      axios.post('/rbac/login/',this.user).then(ret =>{
                     if (ret.data.token){
                       this.$message({
                        message: '登录成功',
                        type: 'success'
                        });
                        sessionStorage.setItem("token",ret.data.token)
                        this.$store.commit("setUserInfo")                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
                        this.$router.push('/users')
                     }
                   }).catch(error => {
                     this.$message({
                        message: '用户名或密码错误',
                        type: 'warnning'
                        });
                   })
            }
        });
                }

            }

}
</script>

<style scoped>


        .main{
            position: absolute;
            height: 100%;
            width: 100%;
            background-color: #324152;}

        .login-form{
            border-radius: 5px;
            width: 400px;
            background-color:rgb(236, 226, 226);
            margin: 0 auto;
            position: relative;
            top:50%;
            margin-top: -200px;
            padding: 10px;
          
        }
        .login-btn{
          width:100%}
</style>