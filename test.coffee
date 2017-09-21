ids = require './src'
assert = require 'assert'

do ->
  assert.equal ids.id2mid('3805803444681516'), 'C2qYojDSk'
  assert.equal ids.mid2id('C2qYojDSk'), '3805803444681516'

  assert.equal ids.mid2id('CzTEqph3F'), '3885554066023775'

  s = ['CzTEqph3F', '3885554066023775']
  c1 = ids.conv s[0]
  assert.equal c1.mid, s[0]
  assert.equal c1.id, +s[1]

  c2 = ids.conv s[1]
  assert.equal c2.mid, s[0]
  assert.equal c2.id, +s[1]
