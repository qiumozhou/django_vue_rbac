<template>
  <div>
    <el-card class="box-card">
      <div>
        <my-bread level1="用户管理" level2="用户列表"></my-bread>
      </div>
      <div>
        <el-row>
          <el-col :span="24"
            ><div class="grid-content bg-purple-dark" label-position="left">
              <el-input
                placeholder="请输入内容"
                style="width: 150px"
              ></el-input>
              <el-button type="info" icon="el-icon-search">搜索</el-button>
              <el-button
                type="success"
                icon="el-icon-plus"
                :disabled="!$store.state.permission.includes('user_add')"
                @click="add = true"
                >添加客户</el-button
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
            <el-table-column prop="date_joined" label="日期" :formatter="state">
            </el-table-column>
            <el-table-column prop="username" label="用户名"> </el-table-column>
            <el-table-column prop="email" label="邮箱"> </el-table-column>
            <el-table-column
              prop="gender"
              label="性别"
              :formatter="genderFormmat"
            >
            </el-table-column>
            <el-table-column label="用户状态">
              <template slot-scope="scope">
                <el-switch
                  v-model="scope.row.is_active"
                  active-color="#ff4949"
                  inactive-color="#13ce66"
                  :active-value="0"
                  :inactive-value="1"
                  @change="setStatus(scope.row)"
                >
                </el-switch>
              </template>
            </el-table-column>
            <el-table-column prop="address" label="操作">
              <template slot-scope="scope">
                <el-button
                  type="primary"
                  plain
                  icon="el-icon-edit"
                  circle
                  :disabled="!$store.state.permission.includes('user_reset')"
                  @click="editUser(scope.row)"
                ></el-button>
                <el-button
                  type="danger"
                  plain
                  icon="el-icon-delete"
                  circle
                  :disabled="!$store.state.permission.includes('user_delete')"
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

    <el-dialog title="修改用户" :visible.sync="edit" width="30%">
      <el-form label-position="left" label-width="80px">
        <el-form-item label="用户名">
          <el-input v-model="selectUser.username"></el-input>
        </el-form-item>
        <el-form-item label="邮箱">
          <el-input v-model="selectUser.email"></el-input>
        </el-form-item>
        <el-form-item label="角色">
          <el-select
            v-model="selectUser.roles"
            multiple
            placeholder="请选择"
            style="width: 100%"
          >
            <el-option
              v-for="item in roleList"
              :key="item.id"
              :label="item.name"
              :value="item.id"
            >
            </el-option>
          </el-select>
        </el-form-item>
      </el-form>

      <span slot="footer" class="dialog-footer">
        <el-button @click="edit = false">取 消</el-button>
        <el-button type="primary" @click="resetUser()">确 定</el-button>
      </span>
    </el-dialog>

    <el-dialog title="新增用户" :visible.sync="add" width="30%">
      <el-form label-position="left" label-width="80px">
        <el-form-item label="用户名">
          <el-input v-model="newUser.username"></el-input>
        </el-form-item>

        <el-form-item label="密码">
          <el-input v-model="newUser.password"></el-input>
        </el-form-item>

        <el-form-item label="邮箱">
          <el-input v-model="newUser.email"></el-input>
        </el-form-item>
        <el-form-item label="性别">
          <el-select
            v-model="newUser.gender"
            placeholder="请选择"
            style="width: 100%"
          >
            <el-option
              v-for="item in genderoptions"
              :key="item.value"
              :label="item.label"
              :value="item.value"
            >
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="角色">
          <el-select
            v-model="newUser.roles"
            multiple
            placeholder="请选择"
            style="width: 100%"
          >
            <el-option
              v-for="item in roleList"
              :key="item.id"
              :label="item.name"
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
import { getUserList, editUser, addUser } from "@/api/user.js";
import { getRoleList } from "@/api/role.js";
import { dateFormat } from "@/utils/index.js";
import {deepClone} from "@/utils/index.js"

export default {
  data() {
    return {
      edit: false,
      add: false,
      tableData: [],
      genderoptions: [
        { label: "男", value: 1 },
        { label: "女", value: 0 },
      ],
      roleList: [],
      newUser: {},
      currentPage1: 5,
      currentPage2: 5,
      currentPage3: 5,
      currentPage4: 4,
      selectUser: {},
    };
  },
  created: function () {
    getUserList().then((ret) => {
      this.tableData = ret.data.data;
    });
    getRoleList().then((ret) => {
      this.roleList = ret.data.data;
    });
  },
  methods: {
    genderFormmat(row, column) {
      if (row.gender == 1) {
        return "男";
      } else {
        return "女";
      }
    },
    state(row, column) {
      return dateFormat(row.date_joined);
    },
    resetUser() {
      editUser(this.selectUser.id, this.selectUser).then((ret) => {
        if ((ret.data.code = 10001)) {
          this.$message({
            showClose: true,
            message: "修改成功",
            type: "success",
          });
        }
       getUserList().then(ret => {
      this.tableData = ret.data.data;
    });
        this.edit = false;
      });
    },
    editUser(data) {
      this.selectUser = deepClone(data);
      console.log(999,this.selectUser )
      this.edit = true;
    },
    setStatus(data) {
      editUser(data.id, data);
    },
    addNewUser() {
      addUser(this.newUser)
        .then((ret) => {
          if (ret.data.code == 10001) {
            this.$message({
              showClose: true,
              message: "新增成功",
              type: "success",
            });
            this.add = false;
            getUserList().then(ret => {
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

<style scoped>
.left-float {
  float: left;
}
</style>
