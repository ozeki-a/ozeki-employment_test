<template>
    <button @click="toggleTheme" class="theme-toggle">
      <span v-if="theme === 'light'">🌞</span>
      <span v-else>🌙</span>
    </button>
  </template>
  
  <script setup>
  import { ref, onMounted } from 'vue';
  
  // ✅ `theme` の状態を作成
  const theme = ref('light');
  
  // ✅ システムのデフォルトを取得
  const systemTheme = window.matchMedia('(prefers-color-scheme: dark)').matches ? 'dark' : 'light';
  
  // ✅ `localStorage` の値を確認し、適用する
  onMounted(() => {
    const savedTheme = localStorage.getItem('theme');
    theme.value = savedTheme || systemTheme;
    document.documentElement.setAttribute('data-theme', theme.value);
  });
  
  // ✅ テーマの切り替え処理
  const toggleTheme = () => {
    theme.value = theme.value === 'light' ? 'dark' : 'light';
    localStorage.setItem('theme', theme.value);
    document.documentElement.setAttribute('data-theme', theme.value);
  };
  </script>
  
  <style scoped>
  .theme-toggle {
    background: transparent;
    border: none;
    font-size: 1.5rem;
    cursor: pointer;
    padding: 8px;
    transition: transform 0.3s ease;
  }
  
  .theme-toggle:hover {
    transform: scale(1.1);
  }
  </style>
  