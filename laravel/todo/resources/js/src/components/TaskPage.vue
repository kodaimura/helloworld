<template>
  <div>{{error}}</div>
  <table>
    <tr><input type="text" v-model="taskName"/></tr>
    <tr><textarea v-model="description"></textarea></tr>
    <tr><input type="date" v-model="dueDate"></tr>
    <tr><input type="number" v-model="percentage"></tr>
    <tr><button @click="register()">登録</button></tr>
  </table>
</template>

<script>
export default {
    name: "TaskPage",
    data() {
      return {
        id: this.$route.params.id,
        taskName: '',
        description: '',
        dueDate: '',
        percentage: 0,
        error: '',
      }
    },
    beforeMount() {
      this.fetchTask()
    },
    watch: {
      $route(to, from) {
        this.id = this.$route.params.id;
      },
      id(newValue, oldValue) {
        this.fetchTask();
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
        if (this.id !== undefined) {
          this.putTask(data);
        } else {
          this.postTask(data);
        }
      },
      postTask(data) {
        fetch('/api/tasks', {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json'
          },
          body: JSON.stringify(data)
        })
        .then(response => {
          if (response.status === 422) {
            return response.json().then(error => {
              throw new Error(JSON.stringify(error));
            });
          }
          this.$router.push('/');
        })
        .catch(error => {
          this.error = error.message;
        })
      },
      putTask(data) {
        fetch(`/api/tasks/${this.id}`, {
          method: 'PUT',
          headers: {
            'Content-Type': 'application/json'
          },
          body: JSON.stringify(data)
        })
        .then(response => {
          if (response.status === 422) {
            return response.json().then(error => {
              throw new Error(JSON.stringify(error));
            });
          }
          this.$router.push('/');
        })
        .catch(error => {
          this.error = error.message;
        })
      },
      fetchTask() {
        if (this.id !== undefined) {
          fetch(`/api/tasks/${this.id}`)
          .then(response => {
            return response.json()
          })
          .then(data => {
            this.taskName = data.task_name;
            this.description = data.description;
            this.dueDate = data.due_date;
            this.percentage = data.percentage;
          })
          .catch(console.error);
        } else {
          this.taskName = '';
          this.description = '';
          this.dueDate = '';
          this.percentage = 0;
        }
      },
    },
};
</script>