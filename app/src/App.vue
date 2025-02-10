<script setup>
import userImage from '@/assets/images/avatar.png'
import '@/assets/css/layout.css'
</script>

<template>
  <div class="l-layout">
    <aside class="l-sidebar">
      <div class="p-profile">
        <img :src="userImage" alt="Profile Image" class="p-profile__image" />
        <h2 class="p-profile__name">Your Name</h2>
        <p class="p-profile__role">役職名</p>
      </div>
    </aside>

    <header class="l-header">
      <h1>ヘッダー</h1>
    </header>

    <main class="l-main">
      <h2>メイン</h2>
    </main>

    <footer class="l-footer">
      <p>フッター</p>
    </footer>
  </div>
</template>