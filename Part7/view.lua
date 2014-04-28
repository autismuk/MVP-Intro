--[[
															
																			View File

--]]

local view = { }

---
---		Create the view.
---
function view.initialise(presenter)
	view.background = display.newRect(0,0,display.contentWidth,display.contentHeight) 	-- create a background (part 3, exercise, optional)
	view.background.anchorX,view.background.anchorY = 0,0
	display.setDefault( "textureWrapX", "repeat" ) 										-- tell the texture renderer to repeat
	display.setDefault( "textureWrapY", "repeat" )
	view.background.fill = { type = "image", filename = "texture.jpg" } 				-- repeat the texture png
	view.background.fill.scaleX,view.background.fill.scaleY = 0.2,0.2 					-- initially it automatically scales it to fit.


	view.batObject = display.newRect(0,0,10,10)											-- create the bat object. We don't care about width, comes from the model.
	view.batObject:setFillColor( 1,1,0 )
	view.presenter = presenter 															-- store the presenter reference (part 3)
	view.batObject:addEventListener( "tap",view ) 										-- add event listener for bat object (part 3)

	view.ballObject = display.newImage("ball.png")										-- create a ball object (part 6, changed from part 4)

	view.scoreObject = display.newText("<score>",315,5,native.systemFontBold,32) 		-- create a score object (part 4, exercise)
	view.scoreObject.anchorX,view.scoreObject.anchorY = 1,0

	view.actionButton = display.newImage("button.png") 									-- create an action button (part 7)
	view.actionButton.anchorX, view.actionButton.anchorY = 0.5,1 							-- position it, size it, make it slightly see through.
	view.actionButton.x,view.actionButton.y = 160,475
	view.actionButton.xScale,view.actionButton.yScale = 0.3,0.25
	view.actionButton.alpha = 0.8
	view.actionButton:addEventListener( "tap",view )  									-- it sends the message as well.
end

---
---		On a 'tap' event, send the presenter a 'tapMessage'. Note, we are using methods as messages here. (part 3)
---
function view:tap(e)
	self.presenter.tapMessage()
end

---
---		Update the view
---
function view.update(model)

	view.batObject.x = model.bat.x 														-- update the view from the model.
	view.batObject.y = model.bat.y
	view.batObject.width = model.bat.width

	view.ballObject.x = model.ball.x 													-- update the ball (part 4)
	view.ballObject.y = model.ball.y
	view.ballObject.width = model.ball.radius * 2 										-- change ball size (part 6)
	view.ballObject.height = model.ball.radius * 2

	view.scoreObject.text = ("00000" .. model.score):sub(-5,-1) 						-- update the score (part 4, exercise)
end

return view

--[[

	Changes:

		Part 2:		No changes made to the view.
		Part 3: 	Store the presenter reference, and send the message to the presenter on tap. Added the background code (exercise for reader)
		Part 4:		Create ball/score objects and update them.
		Part 5: 	Unchanged
		Part 6: 	Changed ball shape to ball graphic
		Part 7:		Added button to 'action' reversal.

--]]