Vue.component 'employee-row',
  template: '#employee-row'
  props: 
    employee: Object
    index: Number
  data: ->
    {
      editMode: false
      errors: {}
    }
  methods:
    updateEmployee: (data) ->
      console.log 'updateEmployee', data
      
