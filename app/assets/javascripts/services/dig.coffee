angular.module('DigApp').factory 'Dig', ($http) ->
  base = '/api/digs'

  index: -> $http.get(base)
  update: (dig) -> $http.put("#{base}/#{dig.id}", dig: dig)
  create: (dig) -> $http.post(base, dig:dig)
  delete: (dig) -> $http.delete("#{base}/#{dig.id}")
  vote: (dig, amount) -> $http.post("/api/digs/#{dig.id}/vote", {vote: amount})
  show: (id) -> $http.get("#{base}/#{id}")
