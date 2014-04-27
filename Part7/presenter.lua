--[[
															
																			Presenter File

--]]


local presenter = { }

function presenter.initialise() 														-- our initialisation function does absolutely nothing.
end

function presenter.update(model, view)
	presenter.model = model 															-- save a reference to the model.
	model.moveBat()  																	-- move the bat.
	presenter.moveBall() 																-- move the ball (added in part 5)
	view.update(model) 																	-- update the view from the model (moved from main.lua)
end

---
---		This handles a 'message' from the view - that the 'reverse' action needs to be taken. You could implement this using a listener,
--- 	or a global event system. For simplicity, it is just a message.
---
function presenter.tapMessage()
	presenter.model.setBatDirection(-presenter.model.bat.dx)
end

--
-- 		Move the ball. Could be in the model. Could be here.  This is very simple, so the bounce testing is not that great.
-- 		but it's designed for clarity and brevity :)
--
function presenter.moveBall()

	local m = presenter.model.ball 															-- shortcut to model.
	if m.dy < display.contentHeight then  													-- stop moving if off the bottom
		m.x = m.x + m.dx * m.speed 															-- move it.
		m.y = m.y + m.dy * m.speed

		if m.x < 0 or m.x > display.contentWidth then 				 						-- bounce off left/right sides of screen.
			m.dx = -m.dx 
		end

		if m.y < 0 then 																	-- bounce off top of screen
			m.dy = -m.dy
		end

		if m.y > presenter.model.bat.y and m.y-m.dy*m.speed <= presenter.model.bat.y then 	-- if gone past the bat.
			if math.abs(m.x-presenter.model.bat.x)<presenter.model.bat.width/2+m.radius then-- and in bat range
				m.dy = -m.dy 																-- bounce off the bat.
				presenter.model.score = presenter.model.score + 10 							-- score 10 points
			end
		end
	end

end

return presenter


--[[

	Changes:

		Part 2:		Added the presenter
		Part 3:		Added the 'tapMessage' handler, and keep a reference to the model.
		Part 4:		Unchanged
		Part 5: 	Added code to move the ball, bounce of the walls, and increment the score.
		Part 6:		Unchanged
		

--]]
