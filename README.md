<h1 style="text-align: center">RBAC权限管理系统</h1>

#### 项目简介
一个基于 Django、Django REST framework（DRF）、Vue的前后端分离的后台管理系统


####  系统功能
- 系统管理
    - 用户管理: 提供用户的相关配置及用户筛选，新增用户后，默认密码为123456
    - 角色管理: 对权限进行分配，可依据实际需要设置角色
    - 权限管理: 权限自由控制，增删改查等
    - 部门管理: 可配置系统组织架构，树形表格展示
    - 任务调度: Cron任务管理


#### 系统预览
<table>
    <tr>
        <td><img src="https://img-blog.csdnimg.cn/2020111416290077.png" border="0" /></td>
        <td><img src="https://img-blog.csdnimg.cn/20201114162859446.png" border="0" /></td>
    </tr>
    <tr>
        <td><img src="https://img-blog.csdnimg.cn/20201114162858969.png" border="0" /></td>
        <td><img src="https://img-blog.csdnimg.cn/20201114162858867.png" border="0" /></td>
    </tr>
    <tr>
        <td><img src="https://img-blog.csdnimg.cn/20201114162858866.png" border="0" /></td>
        <td><img src="https://img-blog.csdnimg.cn/20201114162858950.png" border="0" /></td>
    </tr>
    <tr>
        <td><img src="https://img-blog.csdnimg.cn/20201114162858834.png" border="0" /></td>
        <td><img src="https://img-blog.csdnimg.cn/20201114162859656.png" border="0" /></td>
    </tr>
</table>



#### 代码结构
```python
"""
├── celery_task                # Celery异步任务
├── docs                       # 文档
├── drf_admin                  # 项目主文件
│   ├── apps                   # 项目app
│   ├── common                 # 公共接口
│   ├── media                  # 上传文件media
│   ├── settings               # 配置文件
│   ├── utils                  # 全局工具
│   │   ├── exceptions.py      # 异常捕获
│   │   ├── middleware.py      # 中间件
│   │   ├── models.py          # 基类models文件
│   │   ├── pagination.py      # 分页配置
│   │   ├── permissions.py     # RBAC权限控制
│   │   ├── routers.py         # 视图routers
│   │   ├── views.py           # 基类视图
│   │   └── websocket.py       # WebSocket用户验证
│   ├── routing.py             # WebSocket路由
│   ├── urls.py                # 项目根路由
│   └── wsgi.py                # wsgi
├── .gitignore                 # .gitignore文件
├── LICENSE                    # LICENSE
├── README.md                  # README
├── manage.py                  # 项目入口、启动文件
└── requirements.txt           # requirements文件
"""
```

#### 特别鸣谢
- 感谢 [JetBrains](https://www.jetbrains.com/) 提供的非商业开源软件开发授权
- 感谢 [Django](https://github.com/django/django) 提供后端Django框架
- 感谢 [DRF](https://github.com/encode/django-rest-framework) 提供后端DRF框架
- 感谢 [PanJiaChen](https://github.com/PanJiaChen/vue-element-admin) 提供的前端模板
- 感谢 [EL-ADMIN](https://github.com/elunez/eladmin) 提供的页面布局及前端模板
