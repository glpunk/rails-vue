@bus = new Vue()

App.cable.subscriptions.create "EmployeesChannel",
  connected: ->
    console.log 'App.cable.subscriptions connected'

  received: (data) ->
    bus.$emit('employeeList-updated', data)