local curBg = ''

function onCreatePost()
    setProperty('gf.visible', false)

    for i = 1, 20 do
        makeLuaSprite('memeOfThe'.. i, 'memeBg/meme'..i, 0, 50)
        setObjectOrder('memeOfThe'.. i, getObjectOrder('gfGroup'))
        scaleObject('memeOfThe'.. i, 2.15, 1.9) -- yes, I just streched them to fit the screen, bite me
        screenCenter('memeOfThe'..i, 'x')
        addLuaSprite('memeOfThe'.. i, false)

        if i == 1 then else 
            setProperty('memeOfThe'.. i ..'.visible', false) -- mother fuck 
        end
    end

    for i = 1, 2 do
        if i == 1 then
            makeAnimatedLuaSprite('fakeBee_ef'..i, 'characters/bee_ef', getProperty('boyfriend.x') + 150, getProperty('boyfriend.y') - 200)
        else
            makeAnimatedLuaSprite('fakeBee_ef'..i, 'characters/bee_ef', getProperty('boyfriend.x') + 250, getProperty('boyfriend.y') + 180)
        end
        addAnimationByPrefix('fakeBee_ef'..i, 'beeOp', 'bf idle dance0', 24, false)
        scaleObject('fakeBee_ef'..i, 0.8, 0.8)
        addLuaSprite('fakeBee_ef'..i, false)
    end

    triggerEvent('Camera Follow Pos', '650', '550')

end

function onCountdownTick(count)
    if count % 2 == 0 then
        objectPlayAnimation('fakeBee_ef1', 'beeOp', true)
        objectPlayAnimation('fakeBee_ef2', 'beeOp', true)
    end
end

function onSongStart()
    curBg = 'memeOfThe1'
end

local rand = 0
function onUpdate()
    rand = math.random(1, 20)
end

function onBeatHit()
    if curBeat % 2 == 0 then
        objectPlayAnimation('fakeBee_ef1', 'beeOp', true)
        objectPlayAnimation('fakeBee_ef2', 'beeOp', true)
    end

    --debugPrint(curBg)
    setProperty(curBg..'.visible', false)
    setProperty('memeOfThe'..rand..'.visible', true)
    curBg = 'memeOfThe' .. rand

    if curBeat >= 70 and curBeat < 136 then
        if curBeat % 2 == 0 then triggerEvent('Add Camera Zoom', '0.05', '0.05') end
    end

    if curBeat >= 168 and curBeat < 200 then
        if curBeat % 2 == 0 then triggerEvent('Add Camera Zoom', '0.05', '0.054') end
    end

    if curBeat > 200 and curBeat <= 231 then
        triggerEvent('Add Camera Zoom', '0.05', '0.054') 
    end

    if curBeat >= 232 and curBeat < 264 then
        if curBeat % 2 == 0 then
            triggerEvent('Add Camera Zoom', '0.058', '0.055')
            setProperty('camHUD.angle', -3)
            setProperty('camGame.angle', -3)

            doTweenAngle('center', 'camHUD', 0, 0.2 + (crochet/5000), 'circOut')
            doTweenAngle('centerG', 'camGame', 0, 0.2 + (crochet/5000), 'circOut')
        else
            triggerEvent('Add Camera Zoom', '0.058', '0.055')
            setProperty('camHUD.angle', 3)
            setProperty('camGame.angle', 3)

            doTweenAngle('center', 'camHUD', 0, 0.2 + (crochet/5000), 'circOut')
            doTweenAngle('centerG', 'camGame', 0, 0.2 + (crochet/5000), 'circOut')
        end
    end
end

function onStepHit()
    if curStep == 1060 then
        setProperty('defaultCamZoom', 1.4)
        setProperty('camSpeed', 2.8)
    end
    if curStep == 1061 then
        triggerEvent('Camera Follow Pos', '350', '550')
    end
    if curStep == 1076 then
        swapCam('bf')
    end
    if curStep == 1085 then
        swapCam('pico')
    end
    if curStep == 1103 then
        swapCam('bf')
    end
    if curStep == 1115 then
        swapCam('pico')
    end

    if curStep == 1168 then
        swapCam('bf')
    end
    if curStep == 1200 then
        swapCam('pico')
    end
    if curStep == 1210 then
        swapCam('bf')
    end
    if curStep == 1217 then
        swapCam('pico')
    end
    if curStep == 1234 then
        swapCam('bf')
    end
    if curStep == 1254 then
        swapCam('pico')
    end

    if curStep == 1294 then -- look at the top of his head
        setProperty('defaultCamZoom', 2.1)
        swapCam('final')
    end

    if curStep == 1320 then
        doTweenAlpha('fadeCam', 'camGame', 0, 1, 'linear')
    end
end

function swapCam(char)
    if char == 'bf' then
        setProperty('camFollowPos.x', 890)
        setProperty('camFollowPos.y', 550)
        triggerEvent('Camera Follow Pos', '890', '550') -- keeps it from movin
    end
    if char == 'pico' then
        setProperty('camFollowPos.x', 350)
        setProperty('camFollowPos.y', 550)
        triggerEvent('Camera Follow Pos', '350', '550')
    end
    if char == 'final' then
        setProperty('camFollowPos.x', 1050)
        setProperty('camFollowPos.y', 550)
        triggerEvent('Camera Follow Pos', '1050', '550')
    end
end