<template>
  タスク一覧
  <table v-for="task in tasks">
    <tr>
      <td>{{task.id}}</td>
      <td><router-link :to="{name: 'task', params: {id: task.id}}">{{task.task_name}}</router-link></td>
      <td>{{task.description}}</td>
      <td>{{task.due_date}}</td>
      <td>{{task.percentage}}</td>
    </tr>
  </table>
</template>

<script>
export default {
  name: "TaskListPage",
  beforeMount() {
    this.fetchTasks()
  },
  data() {
    return {
      tasks: []
    };
  },
  methods: {
    async fetchTasks() {
      fetch("/api/tasks")
      .then(response => {
        return response.json()
      })
      .then(data => {
        this.tasks = data;
      })
      .catch(console.error);
    }
  }
};
</script>