ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

function LzqTouches() 
    local Touche = RageUI.CreateMenu("Menu", ('ID : ~g~'..GetPlayerServerId(PlayerId())))
    local Info = RageUI.CreateSubMenu(Touche, "Info")
    local Touches1 = RageUI.CreateSubMenu(Touche, "Touches")
    local Commandes1 = RageUI.CreateSubMenu(Touche, "Commandes")
   
    RageUI.Visible(Touche, not RageUI.Visible(Touche))

    while Touche do
        Citizen.Wait(0)

        RageUI.IsVisible(Touche, true, true, true, function()

              RageUI.Separator("~w~__________________")

              RageUI.ButtonWithStyle("Mes Infos", nil, {RightBadge = RageUI.BadgeStyle.Star}, true, function(Hovered, Active, Selected)
              end, Info)

              RageUI.ButtonWithStyle("Liste des Touches", nil, {RightBadge = RageUI.BadgeStyle.Star}, true, function(Hovered, Active, Selected)
              end, Touches1)

              RageUI.ButtonWithStyle("Liste des Commandes", nil, {RightBadge = RageUI.BadgeStyle.Star}, true, function(Hovered, Active, Selected)
              end, Commandes1)

              end)


----------------------------------------------------------------------------------------------------------------------------|

              RageUI.IsVisible(Info, true, true, true, function()
                RageUI.Separator("~w~__________________")
                RageUI.Separator('Votre Steam : ~g~'..GetPlayerName(PlayerId()))
                RageUI.Separator('Votre ID : ~g~'..GetPlayerServerId(PlayerId()))
                RageUI.Separator("~w~__________________")
                RageUI.Separator("discord.gg/ce que tu veux")

                end)

----------------------------------------------------------------------------------------------------------------------------|

              RageUI.IsVisible(Touches1, true, true, true, function()
                RageUI.Separator("~w~__________________")
                RageUI.ButtonWithStyle("Boutique", nil, {RightLabel = "F1"}, true, function(Hovered, Active, Selected)
                end)
                RageUI.ButtonWithStyle("Menu Personel", nil, {RightLabel = "F5"}, true, function(Hovered, Active, Selected)
                end)
                RageUI.ButtonWithStyle("Menu Entreprise", nil, {RightLabel = "F6"}, true, function(Hovered, Active, Selected)
                end)
                RageUI.ButtonWithStyle("Menu Illegal", nil, {RightLabel = "F7"}, true, function(Hovered, Active, Selected)
                end)
                RageUI.ButtonWithStyle("Telephone", nil, {RightLabel = "G"}, true, function(Hovered, Active, Selected)
                end)
                RageUI.ButtonWithStyle("Ceinture", nil, {RightLabel = "K"}, true, function(Hovered, Active, Selected)
                end)
                
                end)

----------------------------------------------------------------------------------------------------------------------------|

              RageUI.IsVisible(Commandes1, true, true, true, function()
                RageUI.Separator("~w~__________________")
                RageUI.ButtonWithStyle("Faire appel ?? un Staff", nil, {RightLabel = "/report"}, true, function(Hovered, Active, Selected)
                end)
                RageUI.ButtonWithStyle("Message au dessus de sa tete", nil, {RightLabel = "/me"}, true, function(Hovered, Active, Selected)
                end)
                RageUI.ButtonWithStyle("Message Crypt??", nil, {RightLabel = "/ano"}, true, function(Hovered, Active, Selected)
                end)
                RageUI.ButtonWithStyle("Message Twitter", nil, {RightLabel = "/twt"}, true, function(Hovered, Active, Selected)
                end)
                RageUI.ButtonWithStyle("Prendre en Otage", nil, {RightLabel = "/otage"}, true, function(Hovered, Active, Selected)
                end)
                RageUI.ButtonWithStyle("Porter un Joueur", nil, {RightLabel = "/porter"}, true, function(Hovered, Active, Selected)
                end)
                
                end)
                
----------------------------------------------------------------------------------------------------------------------------|

 if not RageUI.Visible(Touche) and not RageUI.Visible(Info) and not RageUI.Visible(Touches1) and not RageUI.Visible(Commandes1) then
          Touche = RMenu:DeleteType("Touche", true)
          FreezeEntityPosition(PlayerPedId(), false) -- Freeze joueurs
        end
    end
end

----------------------------------------------------------------------------------------------------------------------------|

Keys.Register('F1', 'F1', 'Ouvrir le Menu Touches', function() -- touche par d??faut pour ouvrir le menu / Possible de la changer dans parametre FiveM
    LzqTouches() -- nom de la fonction principale
end)
 