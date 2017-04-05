#= require employees/update
#= require employees/fire
#= require employees/row
#= require employees/hire
#= require interceptors

employeesList = new Vue(
  el: '#employees'
  data: 
    employees: []
    employee:
      name: ''
      email: ''
      manager: false
    errors: {}
  created: ->
    that = this
    bus.$on 'employeeList-updated', (data) ->
      that.employees = data

  mounted: ->
    that = undefined
    that = this
    employeeResource.get('/employees.json').then ((response) ->
      that.errors = {}
      that.employees = response.data
      return
    ), (response) ->
      that.errors = response.data.errors
      return
)
