fibonacci = (x)->
  return 0 if x == 0
  return 1 if x == 1
  return fibonacci(x-1) + fibonacci(x-2)

exports.fibonacci = fibonacci
