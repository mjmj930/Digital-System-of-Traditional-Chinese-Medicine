<template>
  <el-header class="header">
    <div class="logo">中医药材系统</div>
    <el-menu :default-active="activeIndex" class="el-menu-demo" mode="horizontal">
      <el-menu-item index="1">首页</el-menu-item>
      <el-menu-item index="2">关于中医</el-menu-item>
      <el-menu-item index="3">药材目录</el-menu-item>
      <el-menu-item index="4">研究论文</el-menu-item>
      <el-menu-item index="5">联系我们</el-menu-item>
    </el-menu>
  </el-header>
</template>

<script lang="ts">
import { defineComponent, ref } from 'vue'

export default defineComponent({
  setup() {
    const activeIndex = ref('1')
    return {
      activeIndex
    }
  }
})
</script>

<style scoped>
.header {
  display: flex;
  justify-content: space-between;
  align-items: center;
}
.logo {
  font-size: 20px;
  font-weight: bold;
}
</style>
