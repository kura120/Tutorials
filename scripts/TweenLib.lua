local tbl = {}
local tween = game:GetService("TweenService")
local tweeninfo = TweenInfo.new

-- will add more soon.

function tbl:tweenLib(o: Instance, p, d: TweenInfo, ...)
	return tween:Create(o, tweeninfo(d, ...), p)
end

return tbl
