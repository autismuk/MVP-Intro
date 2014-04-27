--[[
															
																			Presenter File

--]]


local presenter = { }

function presenter.initialise() 														-- our initialisation function does absolutely nothing.
end

function presenter.update(model, view)
	presenter.model = model 															-- save a reference to the model.
	model.moveBat()  																	-- move the bat.
	view.update(model) 																	-- update the view from the model (moved from main.lua)
end

---
---		This handles a 'message' from the view - that the 'reverse' action needs to be taken. You could implement this using a listener,
--- 	or a global event system. For simplicity, it is just a message.
---
function presenter.tapMessage()
	presenter.model.setBatDirection(-presenter.model.bat.dx)
end

return presenter


--[[

	Changes:

		Part 2:		Added the presenter
		Part 3:		Added the 'tapMessage' handler, and keep a reference to the model.
		Part 4:		Unchanged

--]]
