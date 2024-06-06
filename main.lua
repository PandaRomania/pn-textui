local isShowing = false

function Show(input, text)
    isShowing = true
    SendNUIMessage({
        type = 'show',
        input = input,
        text = text
    })
end

function Hide()
    if not isShowing then return end
    isShowing = false
    SendNUIMessage({
        type = 'hide'
    })
end

exports('Show', Show)
exports('Hide', Hide)