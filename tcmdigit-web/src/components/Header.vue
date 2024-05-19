<template>
  <!-- 页面头部 -->
  <header class="header">
    <!-- Logo 和系统名称 -->
    <div class="logo">
      <img src="@/assets/tcmh-logo.png" alt="Logo" />
      <span class="system-name">中医药材数字化系统</span>
    </div>
    <!-- 导航菜单 -->
    <nav class="navigation">
      <ul>
        <li><router-link to="/" @click.native="handleClick">首页</router-link></li>
        <li><router-link to="/herbs" @click.native="handleClick">药材库</router-link></li>
        <li><router-link to="/formulas" @click.native="handleClick">方剂库</router-link></li>
        <li><router-link to="/diseases" @click.native="handleClick">疑难杂症</router-link></li>
        <li><router-link to="/price" @click.native="handleClick">药材价格</router-link></li>
      </ul>
    </nav>
    <!-- 搜索栏组件 -->
    <search-bar></search-bar>
    <!-- 用户菜单 -->
    <div class="user-menu">
      <el-dropdown>
        <span class="el-dropdown-link user-icon">
          <el-icon><UserFilled /></el-icon>
        </span>
        <template #dropdown>
          <el-dropdown-menu>
            <el-dropdown-item @click="$router.push('/users')">个人中心</el-dropdown-item>
            <el-dropdown-item>设置</el-dropdown-item>
            <el-dropdown-item divided @click="handleLogout">退出登录</el-dropdown-item>
          </el-dropdown-menu>
        </template>
      </el-dropdown>
    </div>
  </header>
</template>

<script lang="ts">
import { defineComponent } from 'vue'
import { useRouter } from 'vue-router'
import { ElDropdown, ElDropdownMenu, ElDropdownItem, ElIcon } from 'element-plus'
import { UserFilled } from '@element-plus/icons-vue'
import SearchBar from './SearchBar.vue'

export default defineComponent({
  name: 'Header',
  components: {
    ElDropdown,
    ElDropdownMenu,
    ElDropdownItem,
    ElIcon,
    UserFilled,
    SearchBar
  },
  setup() {
    const router = useRouter()

    const handleClick = (event: Event) => {
      const target = event.currentTarget as HTMLElement
      target.classList.add('bounce')
      setTimeout(() => {
        target.classList.remove('bounce')
      }, 300)
    }

    const handleLogout = () => {
      // 处理退出登录逻辑,例如清除token,跳转到登录页面
      console.log('退出登录')
      // 这里可以根据需要添加更多的退出登录逻辑
      router.push('/login')
    }

    return {
      handleClick,
      handleLogout
    }
  }
})
</script>

<style scoped>
/* 页面头部样式 */
.header {
  display: flex;
  align-items: center;
  justify-content: space-between;
  height: 60px;
  background-image: url('@/assets/images/header-background-image.png');
  background-size: cover;
  background-position: center;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
  padding: 0 20px;
}

/* Logo 样式 */
.logo {
  display: flex;
  align-items: center;
}

.logo img {
  height: 40px;
  margin-right: 10px;
}

.system-name {
  font-size: 20px; /* 放大字体 */
  font-weight: bold; /* 加粗 */
  color: #ffffff; /* 变白 */
}

/* 导航菜单样式 */
.navigation ul {
  display: flex;
  list-style: none;
  margin: 0;
  padding: 0;
}

.navigation li {
  margin-left: 20px;
}

.navigation li:hover {
  background-color: #f5f5f5;
}

.navigation a {
  text-decoration: none;
  color: #ffffff; /* 改变导航文字的颜色 */
  font-size: 16px;
  font-weight: bold;
  transition:
    color 0.3s,
    background-color 0.3s; /* 添加过渡效果 */
}

.navigation a:hover {
  color: #000000; /* 悬停时改变文字颜色 */
  background-color: rgb(255, 255, 255); /* 悬停时改变背景颜色 */
  text-decoration: underline; /* 悬停时添加下划线 */
}

/* 添加点击动画 */
.bounce {
  animation: bounce 0.3s ease;
}

@keyframes bounce {
  0%,
  20%,
  50%,
  80%,
  100% {
    transform: translateY(0);
  }
  40% {
    transform: translateY(-10px);
  }
  60% {
    transform: translateY(-5px);
  }
}

/* 用户菜单样式 */
.user-menu {
  display: flex;
  align-items: center;
}

.user-icon {
  cursor: pointer;
  color: #ffffff;
  font-size: 20px;
  transition: color 0.3s;
}

.user-icon:hover {
  color: #030303;
}
</style>
