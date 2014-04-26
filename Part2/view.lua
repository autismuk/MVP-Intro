--[[
															
																			View File

--]]

local view = { }

---
---		Create the view.
---
function view.initialise()
	view.batObject = display.newRect(0,0,10,10)											-- create the bat object. We don't care about width, comes from the model.
	view.batObject:setFillColor( 1,1,0 )
end

---
---		Update the view
---
function view.update(model)
	view.batObject.x = model.bat.x 														-- update the view from the model.
	view.batObject.y = model.bat.y
	view.batObject.width = model.bat.width
end
return view

--[[

	Changes:

		Part 2:		No changes made to the view.

--]]