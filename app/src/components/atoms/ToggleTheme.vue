<template>
  <label class="toggle-button">
    <input type="checkbox" v-model="isDark" @change="toggleTheme" />
    <span class="slider"></span>
  </label>
</template>

<script setup>
import { ref, onMounted } from 'vue';

const isDark = ref(false);

const systemTheme = window.matchMedia('(prefers-color-scheme: dark)').matches;
console.log("⭐️" + systemTheme)

onMounted(() => {
  const savedTheme = localStorage.getItem('theme');
  isDark.value = savedTheme ? savedTheme === 'dark' : systemTheme;
  document.documentElement.setAttribute('data-theme', isDark.value ? 'dark' : 'light');
});

const toggleTheme = () => {
  const newTheme = isDark.value ? 'dark' : 'light';
  localStorage.setItem('theme', newTheme);
  document.documentElement.setAttribute('data-theme', newTheme);
};
</script>

<style scoped>
.toggle-button {
  position: relative;
  display: inline-block;
  width: 50px;
  height: 25px;
}

.toggle-button input {
  opacity: 0;
  width: 0;
  height: 0;
}

.slider {
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background-color: #ccc;
  border-radius: 25px;
  transition: 0.4s;
}

.slider::before {
  content: "";
  position: absolute;
  height: 18px;
  width: 18px;
  left: 4px;
  bottom: 3.5px;
  background-color: white;
  border-radius: 50%;
  transition: 0.4s;
}

input:checked + .slider {
  background-color: var(--link-color);
}

input:checked + .slider::before {
  transform: translateX(24px);
}
</style>
