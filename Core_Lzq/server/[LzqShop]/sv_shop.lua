ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

print("[^1Auteur^0] : ^4Création : Lzq^0")

RegisterNetEvent('lzq:shop')
AddEventHandler('lzq:shop', function(ITEM,price)

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local xMoney = xPlayer.getMoney()

    if xMoney >= price then
        xPlayer.removeMoney(price)
        xPlayer.addInventoryItem(ITEM, 1)
        TriggerClientEvent('esx:showNotification', source, "~g~Achats~w~ effectué !")
    else
         TriggerClientEvent('esx:showNotification', source, "Vous n'avez assez ~r~d\'argent")
    end
end)

