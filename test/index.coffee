should = require 'should'
BigNumber = require 'bignumber.js'
{instagramIdToUrlSegment, urlSegmentToInstagramId} = require '../lib'
samples = require './samples'
map = require '../lib/charmap'

describe 'instagram-id-to-url-segment', ->
  it 'should have a correct internal charmap', ->
    # this is for mapping from the JS number conversion charmap to the base64
    # alphabet
    CHAR_MAPS = [
      [[0, 25], [65, 90]] # (uppercase) 36 - 52 becomes 65 - 90
      [[26, 51], [97, 122]] # (lowercase) 10 - 35 becomes 97 - 122
      [[52, 61], [48, 57]] # (number) 0 - 9 becomes 48 - 57
      [[62, 62], [45, 45]] # (hyphen) 62 becomes 45
      [[63, 63], [95, 95]] # (underscore) 63 becomes 95
    ]

    mapChar = (char, reverse = false) ->
      [from, to] = (if not reverse then [0, 1] else [1, 0])

      for charMap in CHAR_MAPS
        [startRange, endRange] = charMap[from]
        offset = charMap[to][0] - startRange
        if startRange <= char <= endRange
          return char + offset

      throw new Error("Char #{char} not in mapping")

    for char in [0...64]
      map[new BigNumber(char).toString(64)].should.equal(
        String.fromCharCode(mapChar(char))
      )

  it 'should convert ids to URL segments', ->
    for [id, urlSegment] in samples
      instagramIdToUrlSegment(id).should.equal(urlSegment)

  it 'should convert URL segments to ids', ->
    for [id, urlSegment] in samples
      urlSegmentToInstagramId(urlSegment).should.equal(id)
