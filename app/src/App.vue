<script setup>
import userImage from '@/assets/images/avatar.png'
import '@/assets/css/layout.css'
import '@/assets/css/object.css'
</script>

<template>
  <div class="l-layout">
    <aside class="l-sidebar">
      <div class="p-profile">
        <img :src="userImage" alt="Profile Image" class="p-profile__image" />
        <div class="p-profile__body">
          <h2 class="p-profile__name">Your Name</h2>
          <p class="p-profile__role">役職名</p>
        </div>
      </div>
      <nav class="p-sidenav">
        <button class="p-sidenav__btn" @click="currentView = 'about'">About</button>
        <button class="p-sidenav__btn" @click="currentView = 'news'">Hacker News</button>
      </nav>
    </aside>

    <header class="l-header">
      <h1>ヘッダー</h1>
      <SocialIcons />
      <ToggleTheme />
    </header>

    <main class="l-main">
      <h2>メイン</h2>
      <component :is="currentView" />
    </main>

    <footer class="l-footer">
      <p class="l-footer__title">フッター</p>
      <p class="l-footer__copy">©︎2025 Aya Ozeki.</p>
    </footer>
  </div>
</template>

<script>
import ToggleTheme from "@/components/atoms/ToggleTheme.vue";
import SocialIcons from "@/components/molecules/SocialIcons.vue";
import AboutSection from "@/components/organisms/AboutSection.vue";
import NewsList from "@/components/organisms/NewsList.vue";

export default {
  name: "App",
  components: {
    about: AboutSection,
    news: NewsList,
  },
  data() {
    return {
      currentView: "about",
    };
  },
};
</script>