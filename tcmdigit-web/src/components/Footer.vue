<template>
  <el-footer class="footer">
    <div class="footer-content">
      <div class="footer-left">
        <p>© 2024 中医药材数字化系统</p>
      </div>
      <div class="footer-right">
        <el-link href="https://www.facebook.com" target="_blank">
          <i class="el-icon-facebook"></i>
        </el-link>
        <el-link href="https://www.twitter.com" target="_blank">
          <i class="el-icon-twitter"></i>
        </el-link>
        <el-link href="https://www.linkedin.com" target="_blank">
          <i class="el-icon-linkedin"></i>
        </el-link>
      </div>
    </div>
  </el-footer>
</template>

<script lang="ts">
import { defineComponent } from 'vue'

export default defineComponent({
  name: 'FooterBar'
})
</script>

<style scoped>
.footer {
  background-color: #f5f5f5;
  padding: 20px 0;
}
.footer-content {
  display: flex;
  justify-content: center;
  align-items: center;
  max-width: 1200px;
  margin: 0 auto;
}
.footer-left,
.footer-right {
  margin: 0 10px;
}
.footer-right .el-link {
  margin: 0 8px;
}
</style>
