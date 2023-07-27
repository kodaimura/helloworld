<template>
  <form>
    <table>
      <tr><input type="text" v-model="taskName"/></tr>
      <tr><textarea v-model="description"></textarea></tr>
      <tr><input type="date" v-model="dueDate"></tr>
      <tr><input type="number" v-model="percentage"></tr>
      <tr><button @click="register()">登録</button></tr>
    </table>
  </form>
</template>

<script>
export default {
    name: "TaskPage",
    data() {
      return {
        taskName: '',
        description: '',
        dueDate: '',
        percentage: 0,
      }
    },
    methods: {
      register() {
        let data = {
          "task_name": this.taskName,
          "description": this.description,
          "due_date": this.dueDate,
          "percentage": this.percentage,
        }
        fetch('/api/tasks', {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json'
          },
          body: JSON.stringify(data)
        })
        .then(response => {
          console.log(response.json())
        })
        .catch(console.error)
      }
    }
};
</script>