<h1 align="center">How To Make Glass UI</h1>

Alright, to start we need to get [the module](https://raw.githubusercontent.com/kuraise/UI-Tuts/main/scripts/glass.lua) and put it inside your main source script like this:

![ScreenShot](https://cdn.upload.systems/uploads/TGFvgmUl.png)


Now we need a couple settings that will help us through making this:

#1: `Depth Of View Property`

What I did for my project, Proton, I checked if there was an DepthOfView instance with a custom name (whatever you'd like):
```lua
if not game.Lighting:FindFirstChild("Proton_DOF") then -- checks if there's already my own lighting property
  -- making lighting property
	local ProtonDOF = Instance.new("DepthOfFieldEffect")
	ProtonDOF.FarIntensity = 0
	ProtonDOF.FocusDistance = 51.6
	ProtonDOF.InFocusRadius = 50
	ProtonDOF.NearIntensity = 1
	ProtonDOF.Enabled = true
  ProtonDOF.Name = "Proton_DOF"
	ProtonDOF.Parent = game.Lighting
end
```
You will insert this in a LocalScript or in a ModuleScript but you'd have to call the ModuleScript like I do.

#2: `Making the UI`

Make the main frame and a glass frame that will hold the glass (make sure your main frame has at least some transparency and your glass frame has a zindex of 1).

![Scr](https://cdn.upload.systems/uploads/CfgWFqwB.png)

#3: `Scripting`
Call the `glass` module script's path:
```lua
-- if this is on a ModuleScript make sure to call the ModuleScript from a LocalScript
local glass = require(pathtoGlass)

glass:BindFrame(frameyouwanttoglass, {Transparency = 0.98, BrickColor = BrickColor.new("Institutional white")}
```

<h1 align="center">Conclusion</h1>
And that's how you make a glass UI wooooooo, anyways if there's any errors make sure to dm me on Discord: kura#6311.
