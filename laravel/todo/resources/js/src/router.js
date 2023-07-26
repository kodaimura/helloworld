import { createRouter, createWebHistory } from "vue-router";
import TaskListPage from "./components/TaskListPage.vue";
import TaskPage from "./components/TaskPage.vue";

const router = createRouter({
    history: createWebHistory(import.meta.env.BASE_URL),
    routes: [
        {
            path: "/",
            name: "tasks",
            component: TaskListPage,
        },
        {
            path: "/new",
            name: "task",
            component: TaskPage,
        },
    ],
});

export default router;