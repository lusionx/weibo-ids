#weibo-ids

```coffee
ids = require 'weibo-ids'
assert.equal ids.id2mid('3805803444681516'), 'C2qYojDSk'
assert.equal ids.mid2id('C2qYojDSk'), '3805803444681516'

ids.conv '3805803444681516' # {id: 3805803444681516, mid: 'C2qYojDSk'}
ids.conv 'C2qYojDSk'        # {id: 3805803444681516, mid: 'C2qYojDSk'}
```

