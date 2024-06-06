# pn-textui
The new TextUI system works by using export (Show / Hide)

# Examples
## Show
```exports['pn-textui']:Show(key, displayText)```

## Hide
```exports['pn-textui']:Hide()```

# How to implement it in QBCore & ESX

## QBCore
Go to qb-core/client/drawtext.lua and replace

```lua
RegisterNetEvent('qb-core:client:DrawText', function(text, position)
    drawText(text, position)
end)

RegisterNetEvent('qb-core:client:HideText', function()
    hideText()
end)
```

to 

```lua
RegisterNetEvent('qb-core:client:DrawText', function(key, text)
    exports['TextUI']:Show(key, text)
end)

RegisterNetEvent('qb-core:client:HideText', function()
   exports['TextUI']:Hide()
end)
```

## ESX

Go to es_extended/client/functions.lua and replace

```lua
function ESX.TextUI(message, notifyType)
    if GetResourceState("esx_textui") ~= "missing" then
        return exports["esx_textui"]:TextUI(message, notifyType)
    end

    print("[^1ERROR^7] ^5ESX TextUI^7 is Missing!")
end

function ESX.HideUI()
    if GetResourceState("esx_textui") ~= "missing" then
        return exports["esx_textui"]:HideUI()
    end

    print("[^1ERROR^7] ^5ESX TextUI^7 is Missing!")
end
```

to 

```lua
function ESX.TextUI(key, text)
    if GetResourceState("TextUI") ~= "missing" then
        return exports['TextUI']:Show(key, text)
    end

    print("[^1ERROR^7] ^5ESX TextUI^7 is Missing!")
end

function ESX.HideUI()
    if GetResourceState("TextUI") ~= "missing" then
        return exports['TextUI']:Hide()
    end

    print("[^1ERROR^7] ^5ESX TextUI^7 is Missing!")
end

```
# Preview
[Video](https://streamable.com/w3sbri)
