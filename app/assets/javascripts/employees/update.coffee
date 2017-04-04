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
      if that.type = 'promote'
        that.employee.manager = !that.employee.manager

      $.ajax
        method: 'PUT'
        data: employee: that.employee
        url: '/employees/' + that.employee.id + '.json'
        success: (res) ->
          that.errors = {}
          that.$emit('updated')
          return
        error: (res) ->
          that.errors = res.responseJSON.errors
          return
      return