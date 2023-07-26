<template>
  タスク一覧
  <table v-for="task in tasks">
    <tr>
      <td>{{task.id}}</td>

      <td>{{task.task_name}}</td>
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
    this.fetchRepresent()
  },
  data() {
    return {
      tasks: []
    };
  },
  methods: {
    async fetchRepresent() {
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