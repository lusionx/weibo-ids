ids = require './src'
assert = require 'assert'

do ->
  assert.equal ids.id2mid('3805803444681516'), 'C2qYojDSk'
  assert.equal ids.mid2id('C2qYojDSk'), '3805803444681516'

  assert.equal ids.mid2id('Ct1SvlQHW'), '3869187355207500'

