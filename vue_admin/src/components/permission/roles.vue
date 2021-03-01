<template>
  <div>
    <el-card class="box-card">
      <div>
        <my-bread level1="权限管理" level2="角色列表"></my-bread>
      </div>
      <div>
        <el-row>
          <el-col :span="2"
            ><div class="grid-content bg-purple-dark" label-position="left">
              <el-button
                type="success"
                icon="el-icon-plus"
                :disabled="!$store.state.permission.includes('permission_add')"
                @click="add = true"
                >添加角色</el-button
              >
            </div></el-col
          >
        </el-row>
        <el-row>
          <el-table
            :data="tableData"
            stripe
            style="width: 100%"
            ref="userTable"
          >
            <el-table-column prop="name" label="角色名称"> </el-table-column>

            <el-table-column label="菜单" >
              <template slot-scope="scope">
                <div slot="reference" class="name-wrapper">
                  <el-tag
                    size="medium"
                    v-for="item in scope.row.menus"
                    :key="item.id"
                    >{{ item.title }}</el-tag
                  >
                </div>
              </template>
            </el-table-column>

            <el-table-column label="权限" >
              <template slot-scope="scope">
                <div slot="reference" class="name-wrapper">
                  <el-tag
                    size="medium"
                    v-for="item in scope.row.permissions"
                    :key="item.id"
                    >{{ item.name }}</el-tag
                  >
                </div>
              </template>
            </el-table-column>

            <el-table-column prop="address" label="操作">
              <template slot-scope="scope">
                <el-button
                  type="primary"
                  plain
                  icon="el-icon-edit"
                  circle
                  :disabled="
                    !$store.state.permission.includes('permission_reset')
                  "
                  @click="editUser(scope.row)"
                ></el-button>
                <el-button
                  type="danger"
                  plain
                  icon="el-icon-delete"
                  circle
                  :disabled="
                    !$store.state.permission.includes('permission_delete')
                  "
                  @click="deletepermission(scope.row)"
                ></el-button>
              </template>
            </el-table-column>
          </el-table>
        </el-row>
        <el-row>
          <el-pagination
            style="float: right; margin-top: 50px"
            :current-page="currentPage4"
            :page-sizes="[100, 200, 300, 400]"
            :page-size="100"
            layout="total, sizes, prev, pager, next, jumper"
            :total="400"
          >
          </el-pagination>
        </el-row>
      </div>
    </el-card>

    <el-dialog title="修改角色" :visible.sync="edit" width="60%">
      <el-row :gutter="4">
  
<el-form label-position="left" label-width="100px">
        <el-form-item label="角色名称">
          <el-input v-model="selectUser.name"></el-input>
        </el-form-item>
       </el-form>
  <el-col :md="4" :offset="2" >
      <div class="grid-content bg-purple-light"><el-tree
            ref="tree"
            :data="menuData"
            show-checkbox
            node-key="id"
            :default-expanded-keys="chenckedmenu"
            :default-checked-keys="chenckedmenu"
            :props="defaultProps">
            </el-tree></div>
      </el-col>
  <el-col :md="16" >
      <div class="grid-content bg-purple"> <el-transfer :titles="['未拥有权限', '已拥有权限']" :props="defaultoption" v-model="checkedpermission" :data="permissiData"></el-transfer></div>
      </el-col>
  
  
</el-row>

      <span slot="footer" class="dialog-footer">
        <el-button @click="edit = false">取 消</el-button>
        <el-button type="primary" @click="resetUser()">确 定</el-button>
      </span>
    </el-dialog>

    <el-dialog title="新增权限" :visible.sync="add" width="30%">
      <el-form label-position="left" label-width="100px">
        <el-form-item label="权限名称">
          <el-input v-model="newUser.name"></el-input>
        </el-form-item>

        <el-form-item label="权限码">
          <el-input v-model="newUser.code"></el-input>
        </el-form-item>

        <el-form-item label="是否根权限">
          <el-select v-model="newUser.is_root" style="width: 100%">
            <el-option
              v-for="item in rootoptions"
              :key="item.label"
              :label="item.label"
              :value="item.value"
            >
            </el-option>
          </el-select>
        </el-form-item>

        <el-form-item label="所属菜单">
          <el-select
            v-model="newUser.menu"
            placeholder="请选择"
            style="width: 100%"
          >
            <el-option
              v-for="item in menuoptions"
              :key="item.id"
              :label="item.title"
              :value="item.id"
            >
            </el-option>
          </el-select>
        </el-form-item>
      </el-form>

      <span slot="footer" class="dialog-footer">
        <el-button @click="edit = false">取 消</el-button>
        <el-button type="primary" @click="addNewUser()">确 定</el-button>
      </span>
    </el-dialog>
   
  </div>
</template>

<script>
import { getRoleList,getRoleInfo,editRole } from "@/api/role.js";
import { getMenuList,getTreeMenu } from "@/api/menu.js";
import {getPermissionList} from "@/api/permission.js"
import { deepClone } from "@/utils/index.js";

export default {
  data() {
    return {
      edit: false,
      add: false,
      tableData: [],
      rootoptions: [
        { label: "是", value: 1 },
        { label: "否", value: 0 },
      ],
      roleList: [],
      chenckedmenu:[],
      newUser: {},
      currentPage1: 5,
      currentPage2: 5,
      currentPage3: 5,
      currentPage4: 4,
      selectUser: {},
      menuoptions: [],
      permissiData:[],
      menuData: [],
      checkedpermission:[],
      defaultoption:{
          key:"id",
          label:"name"
      },
      defaultProps: {
        children: "children",
        label: "title",
      },
      ldata: [
        { key: 1, label: "备选项1" },
        { key: 1, label: "备选项2" },
        { key: 1, label: "备选项3" },
      ],
    };
  },

  created: function () {
    getRoleList().then((ret) => {
      this.tableData = ret.data.data;
    });
    getMenuList().then((ret) => {
      this.menuoptions = ret.data.data;
    });
    getTreeMenu().then(ret=>{
        this.menuData = ret.data.data
    }),
    getPermissionList().then(ret=>{
        this.permissiData = ret.data.data
    })
  },
  methods: {
    rootFormmat(row, column) {
      if (row.is_root == 1) {
        return "是";
      } else {
        return "否";
      }
    },

    resetUser() {
        this.selectUser.permissions = this.checkedpermission
        this.selectUser.menus = this.$refs.tree.getCheckedKeys().concat(this.$refs.tree.getHalfCheckedKeys())
        console.log(111,)
      editRole(this.selectUser.id, this.selectUser).then((ret) => {
        if ((ret.data.code = 10001)) {
          this.$message({
            showClose: true,
            message: "修改成功",
            type: "success",
          });
        }
        getRoleList().then(ret => {
          this.tableData = ret.data.data;
        
        });
        this.edit = false;
      });
    },
    editUser(data) {
      this.selectUser = deepClone(data);
      getRoleInfo(this.selectUser.id).then(ret=>{
       this.chenckedmenu = ret.data.data.menus;
       this.checkedpermission = ret.data.data.permissions
           this.edit = true;
      }
      )
     
    },
    deletepermission(data) {
      deletePermission(data.id).then((ret) => {
        if ((ret.data.code = 10001)) {
          this.$message({
            showClose: true,
            message: "删除成功",
            type: "success",
          });
          getPermissionList().then((ret) => {
            this.tableData = ret.data.data;
          });
        }
      });
    },

    setStatus(data) {
      editUser(data.id, data);
    },
    addNewUser() {
      addPermission(this.newUser)
        .then((ret) => {
          if (ret.data.code == 10001) {
            this.$message({
              showClose: true,
              message: "新增成功",
              type: "success",
            });
            this.add = false;
            this.newUser = {};
            getPermissionList().then((ret) => {
              this.tableData = ret.data.data;
            });
          }
        })
        .catch((e) => {
          this.$message({
            showClose: true,
            message: "用户名已存在",
            type: "error",
          });
        });
    },
  },
  filters: {
    status: function (data) {
      if (data == 1) {
        return true;
      } else {
        return false;
      }
    },
  },
};
</script>

<style>
.left-float {
  float: left;
}
</style>
