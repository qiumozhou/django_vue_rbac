<template>
<el-card class="box-card">
    <div>
        <my-bread level1 = "用户管理" level2 = "用户列表"></my-bread>
    </div>
    <div>

        <el-row>
            <el-col :span="8" :offset="0" style="margin-left:-36px">
                <div class="grid-content bg-purple">
                    <el-input placeholder="请输入内容" style=" width:150px"></el-input>
                    <el-button type="info" icon="el-icon-search">搜索</el-button>
                    <el-button type="success" icon="el-icon-plus">添加客户</el-button>
                </div>
            </el-col>
        </el-row>
        <el-row>
            <el-table :data="tableData" stripe style="width: 100%">
                <el-table-column prop="date" label="日期" >
                </el-table-column>
                <el-table-column prop="name" label="姓名" >
                </el-table-column>
                <el-table-column prop="address" label="地址" >
                </el-table-column>
                <el-table-column label="用户状态" >
                    <template slot-scope="scope">
                        <el-switch v-model="scope.row.status" active-color="#13ce66" inactive-color="#ff4949" active-value=1 inactive-value=0>
                        </el-switch>
                    </template>
                </el-table-column>
                <el-table-column prop="address" label="操作" >
                        <el-button type="primary" plain icon="el-icon-edit" circle></el-button>
                        <el-button type="danger" plain icon="el-icon-delete" circle></el-button>                
                </el-table-column>
            </el-table>
        </el-row>
        <el-row>
            <el-pagination style="float:right;margin-top:50px" @size-change="handleSizeChange" @current-change="handleCurrentChange" :current-page="currentPage4" :page-sizes="[100, 200, 300, 400]" :page-size="100" layout="total, sizes, prev, pager, next, jumper" :total="400">
            </el-pagination>
        </el-row>
    </div>

</el-card>
</template>

<script>
export default {
    data() {
        return {
            tableData: [{
                date: '2016-05-02',
                name: '王小虎',
                address: '上海市普陀区金沙江路 1518 弄',
                statu: 1
            }, {
                date: '2016-05-04',
                name: '王小虎',
                address: '上海市普陀区金沙江路 1517 弄',
                statu: 1
            }, {
                date: '2016-05-01',
                name: '王小虎',
                address: '上海市普陀区金沙江路 1519 弄',
                statu: 1
            }, {
                date: '2016-05-03',
                name: '王小虎',
                address: '上海市普陀区金沙江路 1516 弄',
                statu: 1
            }],
            currentPage1: 5,
            currentPage2: 5,
            currentPage3: 5,
            currentPage4: 4
        }
    },
    methods: {
        handleSizeChange(val) {
            console.log(`每页 ${val} 条`);
        },
        handleCurrentChange(val) {
            console.log(`当前页: ${val}`);
        }
    },
}
</script>

<style>
.left-float {
    float: left;
}
</style>
