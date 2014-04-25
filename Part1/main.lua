-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

local model = require("model") 														-- pull in the model and the view.
local view = require("view")

model.initialise() 																	-- initialise the model and the view


print(model.bat.x)
view.initialise()

view.update(model) 																	-- update the view from the model.
