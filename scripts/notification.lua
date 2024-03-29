--[[
THIS IS CODE FROM THE SOURCE: https://github.com/kuraise/UI-Tuts/blob/main/rblx-models/notify.rbxm
If you want to make a custom  UI on it you will have to edit this.
]]

-- Variables
local Notification = {}
Notification.path = script.Parent.Parent.Notification
Notification.Config = {
	Duration = 5,
	DebugNoti = false,
}

-- Tween Library
local tween = game:GetService("TweenService")
local tweeninfo = TweenInfo.new
local wait, spawn = task.wait, task.spawn

local function tweenLib(o: Instance, p, d: TweenInfo, ...)
	return tween:Create(o, tweeninfo(d, ...), p)
end

local function convertToJSON(args)
	local json = "{\n"
	for i,v in pairs(args) do
		json = json .. "\"".. v .. "\",\n"
	end
	json = json .. "}"

  return json
end


function Notification:Send(args)
	
	--// [?] This is pre-made notifications
	if type(args["Name"]) ~= "string" then error("Argument #1 Missing") end
	if type(args["Description"]) ~= "string" then error("Argument #2 Missing") end
	if type(args["TimeLimit"]) ~= "boolean" then error("Argument #3 Missing") end
	if type(args["Time"]) ~= "number" then error("Argument #4 Missing") end
	
	if Notification.Config.DebugNoti then
		print(convertToJSON({"HEADER: " .. args["Name"] , "DESCRIPTION: " .. args["Description"], 
		"TIMElIMIT: " .. tostring(args["TimeLimit"]), "TIME: " .. args["Time"]}))
	end
	local old = script.NotifName:Clone()
	old.Parent = Notification.path
	
	-- setting values
	
	old.Main.Header.Text = args["Name"]
	old.Main.Desc.Text = args["Description"]
	old.Name = args["Name"]
	tweenLib(old, {Size = UDim2.new(1,0,0,110)}, .65, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
	wait(0.25)
	tweenLib(old.Main, {Size = UDim2.new(1,0,0,90)}, .65, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
	tweenLib(old.Main, {Position = UDim2.fromScale(.5,.5)}, .65, Enum.EasingStyle.Back, Enum.EasingDirection.Out):Play()
	tweenLib(old.Main, {BackgroundTransparency = 0}, .65):Play()
	wait(0.15)
	tweenLib(old.Main.EShadow, {ImageTransparency = .4}, .35):Play()
	tweenLib(old.Main.UIStroke, {Transparency = 0}, .35):Play()
	wait(0.15)
	tweenLib(old.Main.Logo, {ImageTransparency = 0}, .35):Play()
	wait(0.05)
	tweenLib(old.Main.name, {TextTransparency = 0}, .35):Play()
	wait(0.05)
	if args["TimeLimit"] then
		old.Main.countDown.Text = tostring(args["Time"])
		wait(0.01)
		tweenLib(old.Main.countDown, {TextTransparency = 0}, .35):Play()
	elseif not args["TimeLimit"] then
		tweenLib(old.Main.Close, {ImageTransparency = 0}, .35):Play()
		
		old.Main.Close.MouseButton1Click:Connect(function()
			tweenLib(old.Main.Header, {TextTransparency = 1}, .35):Play()
			wait(0.05)
			tweenLib(old.Main.Desc, {TextTransparency = 1}, .35):Play()
			wait(0.05)
			tweenLib(old.Main.name, {TextTransparency = 1}, .35):Play()
			wait(0.05)
			tweenLib(old.Main.Logo, {ImageTransparency = 1}, .35):Play()
			tweenLib(old.Main.Close, {ImageTransparency = 1}, .35):Play()
			wait(0.05)
			tweenLib(old.Main.EShadow, {ImageTransparency = 1}, .35):Play()
			tweenLib(old.Main.UIStroke, {Transparency = 1}, .35):Play()
			wait(0.15)
			tweenLib(old.Main, {Size = UDim2.new(1,0,0,75)}, .45, Enum.EasingStyle.Quint, Enum.EasingDirection.In):Play()
			tweenLib(old.Main, {BackgroundTransparency = 1}, .45):Play()
			wait(0.25)
			tweenLib(old, {Size = UDim2.new(1,0,0,0)}, .55, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
			wait(0.75)
			old:Destroy()
		end)
	end
	wait(0.05)
	tweenLib(old.Main.Header, {TextTransparency = 0}, .35):Play()
	wait(0.05)
	tweenLib(old.Main.Desc, {TextTransparency = 0}, .35):Play()
	
	if args["TimeLimit"] then
		spawn(function()
			while tonumber(old.Main.countDown.Text) > 0 do
				old.Main.countDown.Text -= 1
				wait(1)
			end
			tweenLib(old.Main.Header, {TextTransparency = 1}, .35):Play()
			wait(0.05)
			tweenLib(old.Main.Desc, {TextTransparency = 1}, .35):Play()
			wait(0.05)
			tweenLib(old.Main.name, {TextTransparency = 1}, .35):Play()
			wait(0.05)
			tweenLib(old.Main.Logo, {ImageTransparency = 1}, .35):Play()
			tweenLib(old.Main.countDown, {TextTransparency = 1}, .35):Play()
			wait(0.05)
			tweenLib(old.Main.EShadow, {ImageTransparency = 1}, .35):Play()
			tweenLib(old.Main.UIStroke, {Transparency = 1}, .35):Play()
			wait(0.15)
			tweenLib(old.Main, {Size = UDim2.new(1,0,0,75)}, .45, Enum.EasingStyle.Quint, Enum.EasingDirection.In):Play()
			tweenLib(old.Main, {BackgroundTransparency = 1}, .45):Play()
			wait(0.25)
			tweenLib(old, {Size = UDim2.new(1,0,0,0)}, .55, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
			wait(0.75)
			old:Destroy()
		end)
	end
end

return Notification
