<template>
  <div class="social-icons">
    <SocialIcon v-for="icon in icons" :key="icon.name" :link="icon.link">
      <img :src="icon.src" :alt="icon.name" />
    </SocialIcon>
  </div>
</template>

<script setup>
import SocialIcon from '@/components/atoms/SocialIcon.vue';

// **画像をimport**
import githubIcon from '@/assets/images/github.svg';
import twitterIcon from '@/assets/images/twitter.svg';
import linkedinIcon from '@/assets/images/linkedin.svg';
import facebookIcon from '@/assets/images/facebook.svg';
import lineIcon from '@/assets/images/line.svg';
import mixiIcon from '@/assets/images/mixi.png';

const icons = [
  { name: 'GitHub', link: 'https://github.com/ozeki-a/', src: githubIcon },
  { name: 'Twitter', link: 'https://twitter.com/', src: twitterIcon },
  { name: 'LinkedIn', link: 'https://www.linkedin.com/', src: linkedinIcon },
  { name: 'Facebook', link: 'https://www.facebook.com/', src: facebookIcon },
  { name: 'Line', link: 'https://line.me/', src: lineIcon },
  { name: 'Mixi', link: 'https://mixi.jp/', src: mixiIcon }
];
</script>

<style scoped>
.social-icons {
  display: flex;
  justify-content: flex-end; /* 右寄せ */
  gap: 10px;
}

.social-icons img {
  width: 24px;
  height: 24px;
}
</style>
