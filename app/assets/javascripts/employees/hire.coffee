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
      send = data:
        name: @name
        email: @email
        manager: @manager

      employeeResource.save({employee: send.data}).then ((response) ->
        that.errors = {}
        employeesList.employees.push response.data
        return
      ), (response) ->
        console.log response
        return
      return