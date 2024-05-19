<script lang="ts">
import { defineComponent, ref } from 'vue'
import { ElInput, ElButton, ElIcon } from 'element-plus'
import { Search } from '@element-plus/icons-vue'

export default defineComponent({
  name: 'SearchBar',
  components: {
    ElInput,
    ElButton,
    ElIcon,
    Search
  },
  setup() {
    const searchQuery = ref('')

    const handleSearch = () => {
      // 处理搜索逻辑,例如发送搜索请求到后端
      console.log('搜索关键词:', searchQuery.value)
      // 这里可以根据需要添加更多的搜索逻辑
    }

    return {
      searchQuery,
      handleSearch
    }
  }
})
</script>

<template>
  <div class="search-bar">
    <el-input
      v-model="searchQuery"
      placeholder="请输入搜索关键词"
      @keyup.enter="handleSearch"
      clearable
    >
      <template #append>
        <el-button @click="handleSearch">
          <el-icon><Search /></el-icon>
        </el-button>
      </template>
    </el-input>
  </div>
</template>

<style scoped>
.search-bar {
  display: flex;
  justify-content: center;
  margin-top: 20px;
}

.search-bar .el-input {
  width: 400px;
}
</style>
