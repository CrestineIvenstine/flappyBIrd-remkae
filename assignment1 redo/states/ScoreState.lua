--[[
    ScoreState Class
    Author: Colton Ogden
    cogden@cs50.harvard.edu

    A simple state used to display the player's score before they
    transition back into the play state. Transitioned to from the
    PlayState when they collide with a Pipe.
]]

ScoreState = Class{__includes = BaseState}

local THUMBUP_MEDAL_IMAGE = love.graphics.newImage('reward1.png')
local BRONZE_MEDAL_IMAGE = love.graphics.newImage('reward2.jpg')
local SILVER_MEDAL_IMAGE = love.graphics.newImage('reward3.jpg')

--[[
    When we enter the score state, we expect to receive the score
    from the play state so we know what to render to the State.
]]
function ScoreState:enter(params)
    self.score = params.score
end

function ScoreState:update(dt)
    -- go back to play if enter is pressed
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateMachine:change('countdown')
    end
end

function ScoreState:render()
    -- simply render the score to the middle of the screen
if self.score == 0  then
    love.graphics.setFont(flappyFont)
    love.graphics.printf('Oof! You lost!', 0, 64, VIRTUAL_WIDTH, 'center')

    love.graphics.setFont(mediumFont)
    love.graphics.printf('Score: ' .. tostring(self.score), 0, 100, VIRTUAL_WIDTH, 'center')

    love.graphics.printf('Press Enter to Play Again!', 0, 160, VIRTUAL_WIDTH, 'center')

elseif self.score == 3  then
	love.graphics.draw(THUMBUP_MEDAL_IMAGE, VIRTUAL_WIDTH/ 2 , VIRTUAL_HEIGHT/ 2, 0, .3, .3)
	love.graphics.setFont(mediumFont)
	love.graphics.printf('you won a Thumbs up medal', 0 , 64, VIRTUAL_WIDTH, 'center')
	love.graphics.setFont(mediumFont)
 	love.graphics.printf('Score: ' .. tostring(self.score), 0, 100, VIRTUAL_WIDTH, 'center')
        love.graphics.printf('Press Enter to Play Again!', 0, 250, VIRTUAL_WIDTH, 'center')


    elseif self.score == 5 then 
	love.graphics.draw(BRONZE_MEDAL_IMAGE, VIRTUAL_WIDTH/ 1,VIRTUAL_HEIGHT/2, 0, .3, .3) 
	love.graphics.setFont(mediumFont)
	love.graphics.printf('you won a Bronze medal', 0 , 64, VIRTUAL_WIDTH, 'center')
	love.graphics.setFont(mediumFont)
	love.graphics.printf('Score: ' .. tostring(self.score), 0, 100, VIRTUAL_WIDTH, 'center')
	love.graphics.printf('Press Enter to Play Again!', 0, 250, VIRTUAL_WIDTH, 'center')


    elseif self.score == 10 then 
	love.graphics.draw(SILVER_MEDAL_IMAGE, VIRTUAL_WIDTH/ 2,VIRTUAL_HEIGHT/2, 0, .3, .3) 
	love.graphics.setFont(mediumFont)
	love.graphics.printf('you won a Silver medal', 0 , 64, VIRTUAL_WIDTH, 'center')
	love.graphics.setFont(mediumFont)
	love.graphics.printf('Score: ' .. tostring(self.score), 0, 100, VIRTUAL_WIDTH, 'center')
	love.graphics.printf('Press Enter to Play Again!', 0, 250, VIRTUAL_WIDTH, 'center')

love.graphics.printf('Press Enter to Play Again!', 0, 160, VIRTUAL_WIDTH, 'center')


end

end