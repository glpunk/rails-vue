Vue.http.interceptors.push (request, next) ->
  # modify headers
  request.headers.set 'X-CSRF-Token', $('[name="csrf-token"]').attr('content')
  #request.headers.set 'Authorization', 'Bearer TOKEN'
  # continue to next interceptor
  next()
  return

@employeeResource = Vue.resource('/employees{/id}.json')