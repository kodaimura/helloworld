import './bootstrap';
import App from './src/App.vue'
import router from "./src/router";

import { createApp } from 'vue';

const app = createApp(App)
app.use(router).mount("#app");