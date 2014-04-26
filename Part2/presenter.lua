--[[
															
																			Presenter File

--]]


local presenter = { }

function presenter.initialise() 														-- our initialisation function does absolutely nothing.
end

function presenter.update(model, view)
	model.moveBat()  																	-- move the bat.
	view.update(model) 																	-- update the view from the model (moved from main.lua)
end


return presenter


--[[

	Changes:

		Part 2:		Added the presenter

--]]
