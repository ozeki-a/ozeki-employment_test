<template>
  <section class="news-list">
    <h2>Latest Hacker News</h2>

    <div v-if="loading" class="spinner-container">
      <div class="spinner"></div>
      <p class="loading-text">Loading...</p>
    </div>

    <ul v-else>
      <li v-for="item in newsItems" :key="item.id">
        <a :href="item.url" target="_blank" rel="noopener noreferrer">{{ item.title }}</a>
      </li>
    </ul>
  </section>
</template>

<script setup>
import { ref, onMounted } from 'vue';

const newsItems = ref([]);
const loading = ref(true);

async function fetchNews() {
  loading.value = true;
  try {
    const response = await fetch(
      "https://hacker-news.firebaseio.com/v0/newstories.json?print=pretty"
    );
    const ids = await response.json();
    const top50Ids = ids.slice(0, 50);

    const promises = top50Ids.map((id) =>
      fetch(`https://hacker-news.firebaseio.com/v0/item/${id}.json?print=pretty`)
        .then((res) => res.json())
    );
    newsItems.value = await Promise.all(promises);
  } catch (error) {
    console.error("Failed to fetch Hacker News stories:", error);
  } finally {
    loading.value = false;
  }
}

onMounted(fetchNews);
</script>

<style scoped>
.news-list {
  padding: 16px;
}

.spinner-container {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  margin-top: 20px;
}

.spinner {
  width: 40px;
  height: 40px;
  border: 4px solid #f3f3f3;
  border-top: 4px solid #ff6600;
  border-radius: 50%;
  animation: spin 1s linear infinite;
}

@keyframes spin {
  0% { transform: rotate(0deg); }
  100% { transform: rotate(360deg); }
}

.loading-text {
  font-size: 1.2rem;
  font-weight: bold;
  color: #ff6600;
  margin-top: 10px;
}
</style>
