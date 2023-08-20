import { ref } from 'vue'

export default {
  data() {
    return {
      message: 'Hello from Component!'
    };
  },
  methods: {
    changeMessage() {
      this.message = 'Hello from Component, again!';
    }
  },
  template:
  `<div>
    <p>{{ message }}</p>
    <button @click="changeMessage">Change Message</button>
  </div>`
}