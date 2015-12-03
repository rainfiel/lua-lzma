# lua-lzma

## Usage
```
local lzma = require "lzma"

local src = [[
local lzma = require "lzma"
local src = [[

]]
local comp = lzma.compress(src)
assert(lzma.uncompress(comp) == src)
]]

local comp = lzma.compress(src)
assert(lzma.uncompress(comp) == src)

```
