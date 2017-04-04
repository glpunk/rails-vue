Vue.component 'employee-hire',
  template: '#employee-hire'
  data: ->
    {
      name: '',
      email: '',
      manager: false,
      errors: {}
    }
  methods: 
    hireEmployee: ->
      that = this
      employeesList
      $.ajax
        method: 'POST'
        data: 
          employee:
            name: @name
            email: @email
            manager: @manager
        url: '/employees.json'
        success: (res) ->
          that.errors = {}
          employeesList.employees.push res
          return
        error: (res) ->
          that.errors = res.responseJSON.errors
          return
      return