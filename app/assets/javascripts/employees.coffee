employees = new Vue(
  el: '#employees'
  data: employees: []
  mounted: ->
    that = undefined
    that = this
    $.ajax
      url: '/employees.json'
      success: (res) ->
        that.employees = res
        console.log res
        return
    return
)