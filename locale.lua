-- locale.lua
-- @Author : Dencer (tdaddon@163.com)
-- @Link   : https://dengsir.github.io
-- @Date   : 6/25/2019, 1:28:11 AM

local Locale = {}

local _L = {}

function Locale:newLocale(locale)
    if locale ~= self:currentLocale() then
        return
    end

    return setmetatable({}, {
        __index = function()
            error('Cannot read locale in write mode', 2)
        end,
        __newindex = function(t, k, v)
            if type(k) ~= 'string' then
                error('bad key to L (string expected)', 2)
            end
            local tv = type(v)
            if not (tv == 'boolean' or tv == 'string') then
                error('bad value for L (string|boolean expected)', 2)
            end
            if _L[k] then
                error('Canot reset locale ' .. k, 2)
            end
            if tv == 'boolean' then
                v = k
            end
            _L[k] = v
        end
    })
end

function Locale:getLocale(slient)
    return setmetatable({}, {
        __index = function(t, k)
            if not slient and not _L[k] then
                print('lose locale ' .. k)
                return k
            end
            return _L[k]
        end,
        __newindex = function(t, k)
            error('Cannot write locale in read mode', 2)
        end
    })
end

function Locale:currentLocale()
    return _LOCALE or 'enUS'
end

return Locale
