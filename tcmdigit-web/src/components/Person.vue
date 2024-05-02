<template>
  <div class="person">
    <h2>name: {{ name }}</h2>
    <h2>age:{{ age }}</h2>
    <el-button type="primary" @click="handleClick">LOOK TEL</el-button>
  </div>
</template>

<script lang="ts">
export default {
  name: 'Person',
  data() {
    return {
      name: 'aaaa',
      age: 'bbb',
      tel: '1111'
    }
  },
  methods: {
    handleClick() {
      alert(this.tel)
    }
  }
}
</script>

<style scoped>
.person {
  background-color: aquamarine;
  box-shadow: 0px 0px 10px;
  border-radius: 10px;
  padding: 20px;
}
</style>
