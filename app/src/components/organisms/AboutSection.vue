<template>
  <section class="about-section">
    <div v-html="content"></div>
  </section>
</template>

<script>
import aboutContent from '@/assets/markdown/about.md'; // ここでMarkdownをimport

import { marked } from "marked";

export default {
  name: "AboutSection",
  data() {
    return {
      content: marked(aboutContent),
    };
  },
};
</script>

<style scoped>
.about-section {
  padding: 16px;
  background-color: #f9f9f9;
  border-radius: 8px;
}
</style>
