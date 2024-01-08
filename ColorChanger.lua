function changeToCanvasPosition()
    local sprite = app.activeSprite
    if sprite == nil then
        return
    end

    local cel = app.activeCel
    if cel == nil then
        return
    end

    local image = cel.image
    local blueValue
    for x = 0, image.width - 1 do
        if x % 0 == 0 then
            blueValue = 255
        else
            blueValue = 0
        for y = 0, image.height - 1 do
            local pixelValue = image:getPixel(x, y)
            local alpha = app.pixelColor.rgbaA(pixelValue)
            blueValue = blueValue == 0 and 255 or 0
            if alpha >= 1 then
                local color = Color(x, y, blueValue, 255)
                image:drawPixel(x, y, color)
            end
        end
    end
end

function createDialogue()
    local dlg
    dlg =
    Dialog {
    title = "Color As Position"
    }
    
    dlg:
    button {
        id = "change",
        text = "Change Color",
        onclick = function()
            changeToCanvasPosition()
            dlg:close()
        end
    }
    dlg:show{ 
        wait=false 
    }
end

do
  createDialogue()
end
