BigNumber = require 'bignumber.js'
BigNumber.config({
  ALPHABET: 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789$_',
});

instagramIdToUrlSegment = (id) ->
  if (typeof id == 'number' && id > Number.MAX_SAFE_INTEGER)
    throw ('Input value too large, please pass as string')
  (new BigNumber(id)).toString(64).replace(/\$/g, '-')

urlSegmentToInstagramId = (urlSegment) ->
  (new BigNumber(urlSegment.replace(/-/g, '$'), 64)).toString(10)

module.exports = {instagramIdToUrlSegment, urlSegmentToInstagramId}
