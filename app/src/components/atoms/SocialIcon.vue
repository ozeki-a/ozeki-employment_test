<template>
  <a :href="link" target="_blank" rel="noopener noreferrer" class="social-icon">
    <slot /> <!-- 親コンポーネントからアイコン (img) を挿入 -->
  </a>
</template>

<script setup>
defineProps({
  link: { type: String, required: true } // リンクをpropsで受け取る
});
</script>

<style scoped>
.social-icon {
  display: inline-block;
  width: 24px;
  height: 24px;
}
</style>
