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
    errorSystem.new = function(callType, reason, callback)
        assert(type(callType) == "string", "Bad argument #1 to errorSystem.new: must be a string") 
        assert(type(reason) == "string", "Bad argument #2 to errorSystem.new: must be a string  ")
        assert(isCallable(callback), "Bad argument #3 to errorSystem.new: must be a function (callback)")

        table.insert(errorSystem.err, callType)
        errorSystem.err[callType] = reason

        callback()
    end

    errorSystem.new("Woah", "Testing", function()
        
    end)
end

return tbl
