<template>
  <div>
    <el-card class="box-card">
      <div>
        <my-bread level1="权限管理" level2="菜单列表"></my-bread>
      </div>
      <div>
        <el-row>
          <el-col :span="2"
            ><div class="grid-content bg-purple-dark" label-position="left">
              <el-button
                type="success"
                icon="el-icon-plus"
                :disabled="!$store.state.permission.includes('menu_add')"
                @click="add = true"
                >添加菜单</el-button
              >
            </div></el-col
          >
        </el-row>
        <el-row>
          <el-table
            :data="tableData"
            style="width: 100%; margin-bottom: 20px"
            row-key="id"
            border
            default-expand-all
            :tree-props="{ children: 'children', hasChildren: 'hasChildren' }"
          >
            <el-table-column prop="title" label="菜单名称"> </el-table-column>
            <el-table-column prop="path" label="路径"> </el-table-column>
            <el-table-column prop="icon" label="图标"> </el-table-column>
            <el-table-column prop="component" label="组件名称">
            </el-table-column>

            <el-table-column label="操作">
              <template slot-scope="scope">
                <el-button
                  type="primary"
                  plain
                  icon="el-icon-edit"
                  circle
                  :disabled="!$store.state.permission.includes('menu_reset')"
                  @click="edit_menu(scope.row)"
                ></el-button>
                <el-button
                  type="danger"
                  plain
                  icon="el-icon-delete"
                  circle
                  :disabled="!$store.state.permission.includes('menu_delete')"
                  @click="delete_menu(scope.row)"
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

    <el-dialog title="修改菜单" :visible.sync="edit" width="30%">
      <el-form label-position="left" label-width="100px">
        <el-form-item label="菜单名称">
          <el-input v-model="selectUser.title"></el-input>
        </el-form-item>
        <el-form-item label="路径" v-if="selectUser.path">
          <el-input v-model="selectUser.path"></el-input>
        </el-form-item>
        <el-form-item label="图标">
          <el-input v-model="selectUser.icon"></el-input>
        </el-form-item>
        <el-form-item label="组件名称" v-if="selectUser.component">
          <el-input v-model="selectUser.component"></el-input>
        </el-form-item>

        <el-form-item label="所属菜单" v-if="selectUser.parent_id">
          <el-select
            v-model="selectUser.parent_id"
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
        <el-button type="primary" @click="resetUser()">确 定</el-button>
      </span>
    </el-dialog>

    <el-dialog title="新增菜单" :visible.sync="add" width="30%">
      <el-form label-position="left" label-width="100px">
        <el-form-item label="菜单名称">
          <el-input v-model="newUser.title"></el-input>
        </el-form-item>

        <el-form-item label="路径">
          <el-input v-model="newUser.path"></el-input>
        </el-form-item>

          <el-form-item label="图标">
          <el-input v-model="newUser.icon"></el-input>
        </el-form-item>

          <el-form-item label="组件名称">
          <el-input v-model="newUser.component"></el-input>
        </el-form-item>

      

        <el-form-item label="父菜单">
          <el-select
            v-model="newUser.parent_id"
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
import { getTreeMenu, editMenu, getMenuList,addMenu,deleteMenu } from "@/api/menu.js";
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
      newUser: {},
      currentPage1: 5,
      currentPage2: 5,
      currentPage3: 5,
      currentPage4: 4,
      selectUser: {},
      menuoptions: [],
    };
  },
  created: function () {
    getTreeMenu().then((ret) => {
      this.tableData = ret.data.data;
    });
    getMenuList().then((ret) => {
      this.menuoptions = ret.data.data;
    });
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
      editMenu(this.selectUser.id, this.selectUser).then((ret) => {
        if ((ret.data.code = 10001)) {
          this.$message({
            showClose: true,
            message: "修改成功",
            type: "success",
          });
        }
        getTreeMenu().then((ret) => {
          this.tableData = ret.data.data;
        });
        this.edit = false;
      });
    },
    edit_menu(data) {
      this.selectUser = deepClone(data);
      this.edit = true;
    },
    delete_menu(data) {
      deleteMenu(data.id).then((ret) => {
        if ((ret.data.code = 10001)) {
          this.$message({
            showClose: true,
            message: "删除成功",
            type: "success",
          });
          getTreeMenu().then((ret) => {
            this.tableData = ret.data.data;
          });
        }
      });
    },

    setStatus(data) {
      editUser(data.id, data);
    },
    addNewUser() {
      addMenu(this.newUser)
        .then((ret) => {
          if (ret.data.code == 10001) {
            this.$message({
              showClose: true,
              message: "新增成功",
              type: "success",
            });
            this.add = false;
            this.newUser = {};
            getTreeMenu().then((ret) => {
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
