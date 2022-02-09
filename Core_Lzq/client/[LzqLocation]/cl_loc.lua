ESX = nil

local PlayerData = {}


Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

function Lzqlocation()
    local Location = RageUI.CreateMenu("Location", ('ID : ~g~'..GetPlayerServerId(PlayerId())))
    local Voiture = RageUI.CreateSubMenu(Location, "Loc")
    local Moto = RageUI.CreateSubMenu(Location, "Loc")
   
    RageUI.Visible(Location, not RageUI.Visible(Location))
  
    while Location do
        Citizen.Wait(0)
       
            RageUI.IsVisible(Location, true, true, true, function()

            RageUI.Separator("~w~__________________")
        
            RageUI.ButtonWithStyle("Voitures", nil,  {RightBadge = RageUI.BadgeStyle.Star}, true, function(Hovered, Active, Selected)
            end, Voiture)

            RageUI.ButtonWithStyle("Moto", nil,  {RightBadge = RageUI.BadgeStyle.Star}, true, function(Hovered, Active, Selected)
            end, Moto)

            RageUI.Separator("")

            RageUI.ButtonWithStyle("~r~Fais Attention sur la Route", nil,  {}, true, function(Hovered, Active, Selected)
            end, Blc)

            end)

----------------------------------------------------------------------------------------------------------------------------|
        
            RageUI.IsVisible(Moto, true, true, true, function()
                RageUI.Separator("~w~__________________")
                RageUI.ButtonWithStyle("Bmx", nil, {RightLabel = "~r~15$"},true, function(Hovered, Active, Selected)
                    if (Selected) then   
                        RageUI.Separator("~y~__________________");
                        TriggerServerEvent('lzq:locationBMX',15) -- Prix Bmx
                        RageUI.CloseAll()
                    end
                end)

                RageUI.ButtonWithStyle("Booster", nil, {RightLabel = "~r~35$"},true, function(Hovered, Active, Selected)
                    if (Selected) then   
                        RageUI.Separator("~y~__________________");
                        TriggerServerEvent('lzq:locationScooter',35) -- Prix Booster
                        RageUI.CloseAll()
                    end
                 end)

        end, function()
    end)

----------------------------------------------------------------------------------------------------------------------------|
                
                RageUI.IsVisible(Voiture, true, true, true, function()
                    RageUI.Separator("~w~__________________")
                    RageUI.ButtonWithStyle("Fiat 500", "tah l'époque", {RightLabel = "~r~50$"},true, function(Hovered, Active, Selected)
                    if (Selected) then   
                        RageUI.Separator("~y~__________________");
                        TriggerServerEvent('lzq:locationVoiture',50)
                        RageUI.CloseAll()
                    end
                end)
                
                RageUI.ButtonWithStyle("Honda Civic", "tah l'époque", {RightLabel = "~r~80$"},true, function(Hovered, Active, Selected)
                    if (Selected) then   
                        RageUI.Separator("~y~__________________");
                        TriggerServerEvent('lzq:locationVoiture2',80)
                        RageUI.CloseAll()
                    end
                end)

             end, function()
        end)

----------------------------------------------------------------------------------------------------------------------------|

  if not RageUI.Visible(Location) and not RageUI.Visible(Voiture) and not RageUI.Visible(Moto) then
    Location = RMenu:DeleteType("Loc", true)
    FreezeEntityPosition(PlayerPedId(), false) -- Freeze Joueurs
        end
    end
end

----------------------------------------------------------------------------------------------------------------------------|

local position = {
    {x = -179.04, y = -797.53, z = 31.61} -- Position du Blips
    }    

----------------------------------------------------------------------------------------------------------------------------|

    local npc2 = {
        {hash="a_m_y_business_02", x = -179.04, y = -797.53, z = 31.55, a=257.73}, -- Position du Ped + Nom Ped
    }
    
    Citizen.CreateThread(function()
        for _, item2 in pairs(npc2) do
            local hash = GetHashKey(item2.hash)
            while not HasModelLoaded(hash) do
            RequestModel(hash)
            Wait(20)
            end
            ped2 = CreatePed("PED_TYPE_CIVFEMALE", item2.hash, item2.x, item2.y, item2.z-0.92, item2.a, false, true)
            SetBlockingOfNonTemporaryEvents(ped2, true)
            FreezeEntityPosition(ped2, true)
            SetEntityInvincible(ped2, true)
        end
    end)

----------------------------------------------------------------------------------------------------------------------------|

Citizen.CreateThread(function()
    for k, v in pairs(position) do
        local blip = AddBlipForCoord(v.x, v.y, v.z)
        SetBlipSprite(blip, 206) -- Blips
        SetBlipScale (blip, 0.6) -- Taille Blips
        SetBlipColour(blip, 3)   -- Couleur Blips
        SetBlipAsShortRange(blip, true)
        BeginTextCommandSetBlipName('STRING')
        AddTextComponentSubstringPlayerName('Location') -- Nom du Blips
        EndTextCommandSetBlipName(blip)
    end
end)    
    
----------------------------------------------------------------------------------------------------------------------------|

Citizen.CreateThread(function()
  while true do

    local wait = 750

      for k in pairs(position) do 
          local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
          local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, position[k].x, position[k].y, position[k].z)
          if dist <= 1.0 then
             wait = 0
       RageUI.Text({

        message = "Appuyez sur [~b~E~w~] pour parler avec le Vendeur",

      time_display = 1

    })
              if IsControlJustPressed(1,51) then
                  FreezeEntityPosition(PlayerPedId(), true)
        Lzqlocation()

  end
  end
  Citizen.Wait(wait)
  end
end
end)

----------------------------------------------------------------------------------------------------------------------------|

RegisterNetEvent('g:spawnCar') -- Ne pas Toucher ce Code
AddEventHandler('g:spawnCar', function(car)  
    local car = GetHashKey(car)

    RequestModel(car)
    while not HasModelLoaded(car) do
        RequestModel(car)
        Citizen.Wait(0)
    end

    local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), false))
    local vehicle = CreateVehicle(car, -164.3, -798.92, 31.71, 167.43, true, false)
    SetEntityAsMissionEntity(vehicle, true, true)
    local plaque = "LzqLoc" -- Nom de la Plaque
    SetVehicleNumberPlateText(vehicle, plaque) 
    SetPedIntoVehicle(GetPlayerPed(-1),vehicle,-1)
end)