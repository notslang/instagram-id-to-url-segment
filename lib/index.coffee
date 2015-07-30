BigNumber = require 'bignumber.js'
map = require './charmap'

# `map` is for converting from the number -> character parings that JS uses,
# into the standard base64 table
reversedMap = {}
for i, o of map
  reversedMap[o] = i

instagramIdToUrlSegment = (id) ->
  id = (new BigNumber(id)).toString(64)
  urlSegment = ''
  for char in id
    urlSegment += map[char]
  return urlSegment

urlSegmentToInstagramId = (urlSegment) ->
  id = ''
  for char in urlSegment
    id += reversedMap[char]
  id = (new BigNumber(id, 64)).toString(10)
  return id

module.exports = {instagramIdToUrlSegment, urlSegmentToInstagramId}
