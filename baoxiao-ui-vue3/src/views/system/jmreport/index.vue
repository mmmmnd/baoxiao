<template>
  <div v-loading="loading" :style="'height:'+ height">
    <iframe src="http://localhost:8080/jmreport/list" frameborder="no" style="width: 100%;height: 100%" scrolling="auto" />
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue';
import { getToken } from '@/utils/auth';
import { getReport } from '@/api/system/jmreport';

const src = ref('');
const loading = ref(true);
const height = ref('0px');

onMounted(async () => {
  const res = await getReport();
  src.value = `${import.meta.env.VITE_APP_BASE_API}${res}?token=Bearer ${getToken()}`;
  console.log(import.meta.env.VITE_APP_BASE_API)
  loading.value = false;
});

window.onresize = () => {
  height.value = `${document.documentElement.clientHeight - 94.5}px`;
};
</script>
