ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

function LzqMeteo() 
    local Meteo = RageUI.CreateMenu("Météo", ('Votre ID : ~b~'..GetPlayerServerId(PlayerId())))
    local Theme = RageUI.CreateSubMenu(Meteo, "  Thèmes")
    local Meteos1 = RageUI.CreateSubMenu(Meteo, " Temps")
    local Heures = RageUI.CreateSubMenu(Meteo, "  Heures")

    RageUI.Visible(Meteo, not RageUI.Visible(Meteo))

    while Meteo do
        Citizen.Wait(0)

        RageUI.IsVisible(Meteo, true, true, true, function()

            RageUI.Separator("~w~__________________")

              RageUI.ButtonWithStyle("Temps", nil, {RightBadge = RageUI.BadgeStyle.Star}, true, function(Hovered, Active, Selected)
              end, Meteos1)

              RageUI.ButtonWithStyle("Thèmes", nil, {RightBadge = RageUI.BadgeStyle.Star}, true, function(Hovered, Active, Selected)
              end, Theme)

              RageUI.ButtonWithStyle("Heures", nil, {RightBadge = RageUI.BadgeStyle.Star}, true, function(Hovered, Active, Selected)
              end, Heures)

              end)


----------------------------------------------------------------------------------------------------------------------------|

              RageUI.IsVisible(Theme, true, true, true, function()

                RageUI.Separator("~w~__________________")
                RageUI.ButtonWithStyle("Freeze le temps", nil, {RightBadge = RageUI.BadgeStyle.Tick}, true, function(Hovered,Active,Selected)
                    if (Selected) then
                        ExecuteCommand("freezeweather")
                    end
                end)

                RageUI.ButtonWithStyle("Freeze l\'heure", nil, {RightBadge = RageUI.BadgeStyle.Tick}, true, function(Hovered,Active,Selected)
                    if (Selected) then
                        ExecuteCommand("freezetime")
                    end
                end)

                RageUI.ButtonWithStyle("Eteindre / Allumer les Lumières", nil, {RightBadge = RageUI.BadgeStyle.Tick}, true, function(Hovered,Active,Selected)
                    if (Selected) then
                        ExecuteCommand("blackout")
                    end
                end)

                RageUI.ButtonWithStyle("Neige", nil, {RightBadge = RageUI.BadgeStyle.Tick}, true, function(Hovered,Active,Selected)
                    if (Selected) then
                        ExecuteCommand("weather snow")
                    end
                end)  

                RageUI.ButtonWithStyle("Tempete", nil, {RightBadge = RageUI.BadgeStyle.Tick}, true, function(Hovered,Active,Selected)
                    if (Selected) then
                        ExecuteCommand("weather blizzard")
                    end
                end)  

                RageUI.ButtonWithStyle("Halloween", nil, {RightBadge = RageUI.BadgeStyle.Tick}, true, function(Hovered,Active,Selected)
                    if (Selected) then
                        ExecuteCommand("weather halloween")
                    end
                end) 

                end)

----------------------------------------------------------------------------------------------------------------------------|

              RageUI.IsVisible(Meteos1, true, true, true, function()
                RageUI.Separator("~w~__________________")
                RageUI.ButtonWithStyle("~y~Personnalisez le temps", "Exemple: xmas", {RightBadge = RageUI.BadgeStyle.Star}, true, function(Hovered,Active,Selected)
                    if (Selected) then
                        local AvailableWeatherTypes = KeyboardInput('Entrez le temps que vous souhaitez', '', 45)
                        ExecuteCommand("weather "..AvailableWeatherTypes)
                    end
                end)  

                RageUI.ButtonWithStyle("Ensoleillé", nil, {RightBadge = RageUI.BadgeStyle.Tick}, true, function(Hovered,Active,Selected)
                    if (Selected) then
                        ExecuteCommand("weather extrasunny")
                    end
                end)  

                RageUI.ButtonWithStyle("Brouillard", nil, {RightBadge = RageUI.BadgeStyle.Tick}, true, function(Hovered,Active,Selected)
                    if (Selected) then
                        ExecuteCommand("weather smog")
                    end
                end)

                RageUI.ButtonWithStyle("Pluie", nil, {RightBadge = RageUI.BadgeStyle.Tick}, true, function(Hovered,Active,Selected)
                    if (Selected) then
                        ExecuteCommand("weather rain")
                    end
                end)

                RageUI.ButtonWithStyle("Nuageux + Brouillard", nil, {RightBadge = RageUI.BadgeStyle.Tick}, true, function(Hovered,Active,Selected)
                    if (Selected) then
                        ExecuteCommand("weather foggy")
                    end
                end)

                end)

----------------------------------------------------------------------------------------------------------------------------|

              RageUI.IsVisible(Heures, true, true, true, function()
                RageUI.Separator("~w~__________________")
                RageUI.ButtonWithStyle("~y~Personnalisez l\'heure", "Exemple: 07 00", {RightBadge = RageUI.BadgeStyle.Star}, true, function(Hovered,Active,Selected)
                    if (Selected) then
                        local heure = KeyboardInput('Entrez l\'heure que vous souhaitez', '', 45)
                        ExecuteCommand("time "..heure)
                    end
                end)  

                RageUI.ButtonWithStyle("10:00", nil, {RightBadge = RageUI.BadgeStyle.Tick}, true, function(Hovered,Active,Selected)
                    if (Selected) then
                        ExecuteCommand("time 10 00")
                    end
                end)

                RageUI.ButtonWithStyle("12:00", nil, {RightBadge = RageUI.BadgeStyle.Tick}, true, function(Hovered,Active,Selected)
                    if (Selected) then
                        ExecuteCommand("time 12 00")
                    end
                end)

                RageUI.ButtonWithStyle("17:00", nil, {RightBadge = RageUI.BadgeStyle.Tick}, true, function(Hovered,Active,Selected)
                    if (Selected) then
                        ExecuteCommand("time 17 00")
                    end
                end)

                RageUI.ButtonWithStyle("22:00", nil, {RightBadge = RageUI.BadgeStyle.Tick}, true, function(Hovered,Active,Selected)
                    if (Selected) then
                        ExecuteCommand("time 22 00")
                    end
                end)

                RageUI.ButtonWithStyle("00:00", nil, {RightBadge = RageUI.BadgeStyle.Tick}, true, function(Hovered,Active,Selected)
                    if (Selected) then
                        ExecuteCommand("time 00 00")
                    end
                end)
                
                end)
                
----------------------------------------------------------------------------------------------------------------------------|

 if not RageUI.Visible(Meteo) and not RageUI.Visible(Theme) and not RageUI.Visible(Meteos1) and not RageUI.Visible(Heures) then
          Meteo = RMenu:DeleteType("Meteo", true)
          FreezeEntityPosition(PlayerPedId(), false) -- Freeze joueurs
        end
    end
end

----------------------------------------------------------------------------------------------------------------------------|

RegisterCommand("meteo", function(source, args, rawcommand) -- /meteo pour ouvrir le menu meteo
    FreezeEntityPosition(PlayerPedId(), false) -- true si vous souhaitez que le joueur soit freeze / false si vous souhaiter que le joueur soit libre dans le menu
    LzqMeteo() -- nom de la fonction principale
end, false)

--[[Keys.Register('F11', 'F11', 'Ouvrir le Menu Meteo', function() -- touche par défaut pour ouvrir le menu / Possible de la changer dans parametre FiveM
    FreezeEntityPosition(PlayerPedId(), false) -- true si vous souhaitez que le joueur soit freeze / false si vous souhaiter que le joueur soit libre dans le menu
    LzqMeteo() -- nom de la fonction principale
end)]]
 
----------------------------------------------------------------------------------------------------------------------------|

function KeyboardInput(TextEntry, ExampleText, MaxStringLenght) -- function à ne pas toucher
    AddTextEntry('FMMC_KEY_TIP1', TextEntry) 
    DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", ExampleText, "", "", "", MaxStringLenght)
    blockinput = true

    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do 
        Citizen.Wait(0)
    end
        
    if UpdateOnscreenKeyboard() ~= 2 then
        local result = GetOnscreenKeyboardResult() 
        Citizen.Wait(500) 
        blockinput = false
        return result 
    else
        Citizen.Wait(500) 
        blockinput = false 
        return nil 
    end
end