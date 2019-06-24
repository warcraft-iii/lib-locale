## Usage

#### In enUS.lua

```lua
local L = Locale:newLocale('enUS')
if not L then return end

L['Hello World'] = true     -- is same as the key
L.A_SUMMARY = 'Hello everyone'
```

#### In other Lua files

```lua
L = Locale:getLocale()      -- normal mode: notify the locale is not defined
L = Locale:getLocale(true)  -- slient mode
```

#### Define current locale
```lua
-- **MUST** before all the [locale].lua files
_LOCALE = 'zhCN'
```
