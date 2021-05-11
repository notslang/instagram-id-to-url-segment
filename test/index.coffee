should = require 'should'
{instagramIdToUrlSegment, urlSegmentToInstagramId} = require '../lib'
samples = require './samples'

describe 'instagram-id-to-url-segment', ->
  it 'should convert ids to URL segments', ->
    for [id, urlSegment] in samples
      instagramIdToUrlSegment(id).should.equal(urlSegment)

  it 'should convert URL segments to ids', ->
    for [id, urlSegment] in samples
      urlSegmentToInstagramId(urlSegment).should.equal(id)
