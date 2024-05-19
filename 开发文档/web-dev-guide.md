### 版本

> Vue: `3.4.18`

> Node:`v20.12.2`

____

### 目录结构

```
├── build                      # 构建相关
├── node_module                # 所需node模块
├── plop-templates             # 基本模板
├── public                     # 静态资源
│   └── favicon.ico            # favicon图标
├── src                        # 源代码
│   ├── api                    # 所有请求
│   ├── assets                 # 主题 字体等静态资源
│   ├── components             # 全局公用组件
│   ├── router                 # 路由
│   ├── store                  # 全局 store管理
│   ├── styles                 # 全局样式
│   ├── utils                  # 全局公用方法
│   ├── vendor                 # 公用vendor
│   ├── views                  # views 所有页面
│   ├── App.vue                # 入口页面
│   └── main.ts                # 入口文件 加载组件 初始化等
├── tests                      # 测试
├── env.d.ts                   # 环境变量配置
├── index.html                 # 项目的入口HTML文件
├── vite-env.d.js              # ts声明
├── .eslintrc.js               # ESLint配置文件 检查代码规范
├── .gitignore                 # git忽略文件 配置git
├── package.json               # package.json
├── package-lock.json          # 记录当前状态安装npm版本
├── package.json               # 记录项目的依赖和配置信息的npm配置
├── shims-vue.d.ts             # 提供TypeScript的类型声明
├── tsconfig*.json             # TypeScript配置文件
├── vite.config.ts             # 配置Vite 自定义构建和开发服务器行为
├── vitest.config.ts           # 配置Vitest 单元测试
└── 

```





__________

### Issues

#### 界面重复

![](images/2024-05-03-19-59-48-image.png)

原因：index.ts , 路由配置重复： routes: []

> 每个 <Route> 组件类似于在 routes 数组中的一个对象，定义了一个路径与组件之间的关系。
