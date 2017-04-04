Vue.component 'employee-fire',
  template: '<button v-if="!editMode" @click="fireEmployee">Fire</button>'
  props:
    employee: Object
    editMode: false
    index: 0  
  methods: 
    fireEmployee: ->
      that = this
      $.ajax
        method: 'DELETE'
        url: '/employees/' + that.employee.id + '.json'
        success: (res) ->
          console.log that.index
          employeesList.employees.splice(that.index, 1)
          return
      return