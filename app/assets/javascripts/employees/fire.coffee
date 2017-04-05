Vue.component 'employee-fire',
  template: '<button v-if="!editMode" @click="fireEmployee">Fire</button>'
  props:
    employee: Object
    editMode: false
    index: 0  
  methods: 
    fireEmployee: ->
      that = this
      employeeResource.delete({id: that.employee.id}).then ((response) ->
        that.errors = {}
        employeesList.employees.splice(that.index, 1)
        return
      ), (response) ->
        console.log response
        return
      return


