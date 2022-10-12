local tbl = {}
local tween = game:GetService("TweenService")
local tweeninfo = TweenInfo.new
local errorSystem = {}

-- will add more soon.

local function isCallable(value)
	if type(value) == "function" then
		return true
	end

	if type(value) == "table" then
		local metatable = getmetatable(value)
		if metatable and type(rawget(metatable, "__call")) == "function" then
			return true
		end
	end

	return false
end


function tbl:new(o: Instance, p, d: TweenInfo, ...)
	return tween:Create(o, tweeninfo(d, ...), p)
end

do
    -- Error system cuz funni
    errorSystem.new = function(callType, callback)
        assert(type(callType) == "string", "Bad argument #1 to errorSystem.new: must be a string") 
        assert(type(reason) == "string", "Bad argument #2 to errorSystem.new: must be a string  ")
        assert(isCallable(callback), "Bad argument #3 to errorSystem.new: must be a function (callback)")
        table.insert(errorSystem.err, callType)
        errorSystem.err[callType] = callback

    end
    --// Inserting functions
    errorSystem.new("Woah", function(t, y)
        error("Testing Error System!")
    end)

    --// Actual error system

    errorSystem.find = function(errName)
        if table.find(errorSystem, errName) then
            return true
        end
    end

    local function executeCallback(callback) errorSystem.err[callback]() end -- if this doesn't work i will literally oblibirate my soul.

    errorSystem.throw = function(errName)
        if errorSystem.find(errName) then executeCallback(errName) end -- should work or ima kms
    end
end

return tbl