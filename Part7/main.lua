-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

display.setStatusBar( display.HiddenStatusBar ) 									-- oops I forgot this (part 3)

local model = require("model") 														-- pull in the model and the view.
local view = require("view")
local presenter = require("presenter")

model.initialise() 																	-- initialise the model,view and presenter.
view.initialise(presenter) 															-- the view needs to know about the presenter (Part 3)
presenter.initialise() 																

Runtime:addEventListener( "enterFrame", 											-- added code to update the presenter.
					function(e) presenter.update(model,view) end)

--[[

	Changes:

		Part 2:		Added code to run the presenter. Moved view.update() to the presenter.
		Part 3: 	Added 'presenter' as a parameter to view initialise, so the view can send the presenter messages. Added code to hide status bar.
		Part 4: 	Unchanged
		Part 5: 	Unchanged
		Part 6:		Unchanged
		Part 7:		Unchanged
		
--]]