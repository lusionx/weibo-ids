nx = require 'number-x'

chars = [
  '0123456789'
  'abcdefghijklmnopqrstuvwxyz'
  'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
].join ''


_chunk = (arr, n) ->
  ls = []
  for e, i in arr
    ls.push r = [] if 0 is i % n
    r.push e
  return ls

# 不变顺序, 将字符串从右取段分割 '1212345671234567' / 7 -> [12, 1234567, 1234567]
_rsplite = (str, n) ->
  ss = str.split ''
  ar = _chunk ss.reverse(), n
  ar = (e.reverse().join('') for e in ar)
  ar.reverse()

id2mid = (id) ->
  throw Error 'not all number' if not /^\d+$/.test id
  id = _rsplite id, 7
  mid = (nx.lpad(nx.toStr(e, chars), 4, '0') for e in id)
  mid = mid.join ''
  mid.replace /^0*/, ''

mid2id = (mid) ->
  mid = _rsplite mid, 4
  id = (nx.lpad(nx.to10(e, chars), 7, '0') for e in mid)
  id = id.join ''
  id.replace /^0*/, ''

conv = (str) ->
  if /^\d+$/.test str
    return id: +str, mid: id2mid str
  else
    return mid: str, id: +mid2id str

module.exports = {id2mid, mid2id, conv}
