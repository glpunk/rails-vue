Vue.component 'employee-update',
  template: '<button @click="updateEmployee">{{ type | setLabel(employee) }}</button>'
  props:
    employee: Object 
    type: String 
  filters:
    setLabel: (type, employee) ->
      console.log employee
      if type == 'save'
        return 'Save'
      else 
        if employee.manager
          return 'Demote' 
        else 
          return 'Promote'
  methods: 
    updateEmployee: ->
      that = this
      if that.type == 'promote'
        that.employee.manager = !that.employee.manager

      employeeResource.update({id: that.employee.id}, {employee: that.employee}).then ((response) ->
        that.errors = {}
        that.$emit('updated')
        return
      ), (response) ->
        that.errors = res.responseJSON.errors
        return