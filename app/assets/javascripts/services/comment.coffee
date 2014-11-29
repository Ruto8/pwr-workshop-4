angular.module('DigApp').factory 'Comment', ($http) ->
  base = '/api/digs'

  index: (dig_id) -> $http.get("#{base}/#{dig_id}/comments")
  update: (dig_id, com) -> $http.put("#{base}/#{dig_id}/comments/#{com.id}", comment: com)
  create: (dig_id, com) -> $http.post("#{base}/#{dig_id}/comments", comment: com)
  delete: (dig_id, com) -> $http.delete("#{base}/#{dig_id}/comments/#{comment.id}")
  vote: (dig_id, com, amount) -> $http.post("#{base}/#{dig_id}/comments/#{comment.id}/vote", {vote: amount})
  show: (dig_id, com_id) -> $http.get("#{base}/#{dig_id}/comments/#{com_id}")
