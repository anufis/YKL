KeyPressed = {}

KeyPressed.lalt = false
KeyPressed.mouse1 = false

local KeyPressed = KeyPressed

--local SoundData = love.sound.newSoundData("sound/bossUlt.mp3")
--local source = love.audio.newSource(SoundData)

function love.keypressed(key, scancode, isrepeat)
    if scancode == "lalt" then
        KeyPressed.lalt = true
        --source:play()
    elseif scancode == "return" and KeyPressed.lalt then
        if love.window.getFullscreen() then
            love.window.setFullscreen(false)
            Graphics.resetScale()
        else
            love.window.setFullscreen(true)
            Graphics.resetScale()
        end
    elseif scancode == "w" or scancode == "s" or scancode == "a" or scancode == "d" then
        if scancode == "w" then
            Player.y = Player.y - 1
        elseif scancode == "s" then
            Player.y = Player.y + 1
        elseif scancode == "a" then
            Player.x = Player.x - 1
        elseif scancode == "d" then
            Player.x = Player.x + 1
        end
    end
end

function love.keyreleased(key, scancode)
    if scancode == "lalt" then
        KeyPressed.lalt = false
    end
    if scancode == "escape" then
        love.event.quit()
     end
end

function love.mousepressed(x, y, button, istouch)
    if button == 1 then
        KeyPressed.mouse1 = true
    end
 end

 function love.mousereleased(x, y, button, presses)
    if button == 1 then
        KeyPressed.mouse1 = false
    end
 end