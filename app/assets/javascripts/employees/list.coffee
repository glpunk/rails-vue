#= require employees/update
#= require employees/fire
#= require employees/row
#= require employees/hire

@employeesList = new Vue(
  el: '#employees'
  data: 
    employees: []
    employee:
      name: ''
      email: ''
      manager: false
    errors: {}
  mounted: ->
    that = undefined
    that = this
    $.ajax
      url: '/employees.json'
      success: (res) ->
        that.employees = res
        return
    return
)