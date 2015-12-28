
_ = require 'lodash'
nx = require 'number-x'

chars = [
  '0123456789'
  'abcdefghijklmnopqrstuvwxyz'
  'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
].join ''

# 不变顺序, 将字符串从右取段分割 '1212345671234567' / 7 -> [12, 1234567, 1234567]
_rsplite = (str, n) ->
  ss = str.split ''
  ar = _.chunk ss.reverse(), n
  ar = _.map ar, (e) ->
    e.reverse().join ''
  ar.reverse()

id2mid = (id) ->
  throw Error 'not all number' if not /^\d+$/.test id
  id = _rsplite id, 7
  mid = _.map id, (e) ->
    s = nx.toStr e, chars
    nx.lpad s, 4, 0
  mid = mid.join ''
  mid.replace /^0*/, ''


mid2id = (mid) ->
  mid = _rsplite mid, 4
  id = _.map mid, (e) ->
    s = nx.to10 e, chars
    #console.log s
    nx.lpad s, 7, 0
  id = id.join ''
  id.replace /^0*/, ''

module.exports = {id2mid, mid2id}


