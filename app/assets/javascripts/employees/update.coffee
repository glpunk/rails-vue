Vue.component 'employee-update',
  template: '<button @click="updateEmployee">{{ type | setLabel(employee) }}</button>'
  props:
    employee: Object 
    type: String 
  filters:
    setLabel: (type, employee) ->
      l = ''
      if employee.manager
        l = 'Demote' 
      else 
        l = 'Promote'

      if type == 'save'
        l = 'Save'

      return l
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