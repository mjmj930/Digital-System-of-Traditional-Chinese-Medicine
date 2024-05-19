<template>
  <div class="home-page">
    <header-component></header-component>
    <main class="main-content">
      <h1>欢迎使用中医药材数字化系统</h1>
      <p>这是一个用于管理中医药材的现代化系统,旨在提高药材管理的效率和准确性。</p>
    </main>
    <footer-component></footer-component>
  </div>
</template>

<script lang="ts">
import { defineComponent } from 'vue'
import { ElRow, ElCol, ElCard } from 'element-plus'
import HeaderComponent from '../components/Header.vue'
import FooterComponent from '../components/Footer.vue'
import Footer from '../components/Footer.vue'

export default defineComponent({
  name: 'HomePage',
  components: {
    HeaderComponent,
    FooterComponent,
    ElRow,
    ElCol,
    ElCard
  }
})
</script>

<style scoped>
.home-page {
  display: flex;
  flex-direction: column;
  min-height: 100vh;
}

.main-content {
  flex: 1;
  padding: 20px;
}

.card-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.card-content {
  margin-top: 20px;
}

.card-link {
  display: inline-block;
  margin-top: 10px;
  color: #1890ff;
  text-decoration: none;
}
</style>
