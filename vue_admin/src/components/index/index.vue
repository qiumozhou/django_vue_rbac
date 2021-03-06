<template>
  <el-container style="height: 100%;  solid #eee">
    <el-header height="60px" style="line-height: 60px">
      <el-row type="flex" class="row-bg" justify="end">
        <el-col :span="4">
          <span style="margin-right: 10px"
            >欢迎您！{{ this.$store.state.username }}</span
          ><span
            class="grid-content bg-purple"
            style="cursor: pointer; color: blue"
            @click.prevent="doLogout"
            >注销</span
          ></el-col
        >
      </el-row>
    </el-header>

    <el-container>
      <el-aside width="200px" style="background-color: rgb(238, 241, 246)">
        <el-menu default-active="1" router>
          <el-submenu
            v-for="item in this.$store.state.menu"
            :index="item.title"
            :key="item.id"
          >
            <template slot="title">
              <i :class="item.icon"></i>
              <span> {{ item.title }}</span>
            </template>
            <el-menu-item
              :index="subitem.path"
              v-for="subitem in item.children"
              :key="subitem.id"
            >
              <i :class="subitem.icon"></i>
              <span>{{ subitem.title }}</span>
            </el-menu-item>
          </el-submenu>
        </el-menu>
      </el-aside>
      <el-main>
        <router-view></router-view>
      </el-main>
    </el-container>
  </el-container>
</template>

<script>
export default {
  data() {
    return {};
  },

  methods: {
    handleOpen(key, keyPath) {
      console.log(key, keyPath);
    },
    handleClose(key, keyPath) {
      console.log(key, keyPath);
    },
    doLogout() {
      sessionStorage.clear();
      this.$router.push({ name: "login" });
      this.$message({
        message: "退出登录",
        type: "success",
      });
    },
  },
};
</script>

<style scoped>
.el-header {
  background-color: #b3c0d1;
  color: #333;
  text-align: center;
  line-height: 80px;
}

.el-aside {
  background-color: #545c64;
  color: #333;
  text-align: center;
  line-height: 100px;
}

.el-main {
  background-color: whitesmoke;
  color: #333;
  /* text-align: center; */
  line-height: 100px;
}

body > .el-container {
  margin-bottom: 40px;
}

/* .el-container:nth-child(5) .el-aside,
.el-container:nth-child(6) .el-aside {
  line-height: 260px;
} */

/* .el-container:nth-child(7) .el-aside {
  line-height: 320px;
} */
</style>