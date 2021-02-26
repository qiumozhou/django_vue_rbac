<template>
<div><el-card class="box-card">
    <div>
        <my-bread level1 = "用户管理" level2 = "用户列表"></my-bread>
    </div>
    <div>
        <el-row >
        <el-col :span="24"><div class="grid-content bg-purple-dark" label-position="left">
             <el-input placeholder="请输入内容" style=" width:150px"></el-input>
                    <el-button type="info" icon="el-icon-search">搜索</el-button>
                    <el-button type="success" icon="el-icon-plus" :disabled = '!$store.state.permission.includes("添加用户")'>添加客户</el-button></div></el-col>
        </el-row>
        <!-- <el-row>
            <el-col :span="8" :offset="0" style="margin-left:-36px">
                <div class="grid-content bg-purple">
                    <el-input placeholder="请输入内容" style=" width:150px"></el-input>
                    <el-button type="info" icon="el-icon-search">搜索</el-button>
                    <el-button type="success" icon="el-icon-plus" :disabled = '!$store.state.permission.includes("添加用户")'>添加客户</el-button>
                </div>  
            </el-col>
        </el-row> -->
        <el-row>
            <el-table :data="tableData" stripe style="width: 100%" ref="userTable">
                <el-table-column prop="date_joined" label="日期" :formatter="state">
                </el-table-column>
                <el-table-column prop="username" label="姓名" >
                </el-table-column>
                <el-table-column prop="email" label="邮箱" >
                </el-table-column>
                <el-table-column label="用户状态" >
                    <template slot-scope="scope">
                        <el-switch v-model="scope.row.is_active" active-color="#ff4949" inactive-color="#13ce66" :active-value=0 :inactive-value=1 @change="setStatus(scope.row)">
                        </el-switch>
                    </template>
                </el-table-column>
                <el-table-column prop="address" label="操作" >
                   <template slot-scope="scope">
                        <el-button type="primary" plain icon="el-icon-edit" circle :disabled = '!$store.state.permission.includes("修改用户")' @click="editUser(scope.row)"></el-button>
                        <el-button type="danger" plain icon="el-icon-delete" circle :disabled = '!$store.state.permission.includes("删除用户")'></el-button>                
                    </template>
                </el-table-column>
            </el-table>
        </el-row>
        <el-row>
            <el-pagination style="float:right;margin-top:50px"   :current-page="currentPage4" :page-sizes="[100, 200, 300, 400]" :page-size="100" layout="total, sizes, prev, pager, next, jumper" :total="400">
            </el-pagination>
        </el-row>
    </div>


</el-card>

    <el-dialog
  title="修改用户"
  :visible.sync="edit"
  width="30%"
>

  <el-form label-position="left" label-width="80px" >
  <el-form-item label="姓名">
    <el-input v-model="selectUser.username"></el-input>
  </el-form-item>
  <el-form-item label="邮箱">
    <el-input v-model="selectUser.email"></el-input>
  </el-form-item>
  <el-form-item label="角色">
     <el-select v-model="selectUser.roles" multiple placeholder="请选择" style="width:100%">
        <el-option
        v-for="item in roleList"
        :key="item.id"
        :label="item.name"
        :value="item.id">
        </el-option>
    </el-select>
  </el-form-item>
</el-form>

  <span slot="footer" class="dialog-footer" >
    <el-button @click="edit = false">取 消</el-button>
    <el-button type="primary" @click="resetUser()">确 定</el-button>
  </span>
</el-dialog></div>




</template>

<script>
import { getUserList,editUser } from "@/api/user.js"
import { getRoleList } from "@/api/role.js"
import { dateFormat } from "@/utils/index.js"

export default {
    data() {
        return {
            edit:false,
            tableData:[],
            roleList:[],
            currentPage1: 5,
            currentPage2: 5,
            currentPage3: 5,
            currentPage4: 4,
            selectUser:{}
        }
    },
    created: function(){
         getUserList().then(ret =>{this.tableData = ret.data.data});
         getRoleList().then(ret =>{this.roleList = ret.data.data});

    },
    methods: {
            state(row, column) {
        return dateFormat(row.date_joined)
    },
    resetUser(){
           editUser(this.selectUser.id,this.selectUser).then(ret =>{
               if(ret.data.code = 10001){
                   this.$message({
                    showClose: true,
                    message: '修改成功',
                    type: 'success'
                    });
               };
               this.edit = false;
           })
    },
    editUser(data){
        this.selectUser = data
        this.edit = true
    },
    setStatus(data){
            editUser(data.id,data)
    },
    },
    filters: {      
    'status': function (data) { 
        if(data == 1){
            return true
        }else{
            return false
        }
      } 
         }   
}
</script>

<style>
.left-float {
    float: left;
}
</style>
