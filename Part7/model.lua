--[[
															
																			Model File

--]]

local model = { }

--
--		Initialise the model.
--
function model.initialise()
	model.bat = { x = 160, y = 440, width = 60 } 										-- initialise the bat
	model.bat.dx = 0 																	-- create model.bat.dx, model.bat.speed (part 2)
	model.bat.speed = 5  																-- (these could be set in the table initialiser)
	model.setBatDirection(1) 															-- set bat direction (part 2)

	model.ball = { x = 100,y = 100, dx = 1,dy = 1,speed = 10, radius = 10 }				-- initialise the ball (part 4)
	model.score = 0 																	-- initialise the score (part 4, exercise)

end


---
---		Set the bat direction (added in part 2). See the blog comments about over-engineering.
---
function model.setBatDirection(newdx)
	model.bat.dx = newdx
end

--- 
---		move bat method (added in part 2)
---
function model.moveBat()
	model.bat.x = model.bat.x + model.bat.dx * model.bat.speed 							-- move the bat.
	if model.bat.x > display.contentWidth - model.bat.width/2 then 						-- check off the right
		model.setBatDirection(-1)
	end
	if model.bat.x < model.bat.width/2 then 											-- check off the left.
		model.setBatDirection(1)
	end
end

return model

--[[

	Changes:

		Part 2:		Added model.bat.dx, model.bat.speed, moveBat(),  setBatDirection() methods.
		Part 3: 	Unchanged
		Part 4:		Added the ball and score data to the model.
		Part 5: 	Unchanged
		Part 6:		Unchanged
		Part 7:		Unchanged

--]]