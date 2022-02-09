ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

print("[^1Auteur^0] : ^4Création : Lzq^0")

RegisterNetEvent('lzq:locationBMX')
AddEventHandler('lzq:locationBMX', function(prix)
	local xPlayer = ESX.GetPlayerFromId(source)
	local playerMoney = xPlayer.getAccount('bank').money
    local car = "bmx"
    if playerMoney >= prix then
    xPlayer.removeAccountMoney('bank', prix)
    TriggerClientEvent('g:spawnCar',source,car)
	TriggerClientEvent('esx:showNotification', source, "Vous avez bien reçu votre véhicule ~s~! ")
    else
        TriggerClientEvent('esx:showNotification', source, "Vous n\'avez assez ~r~d\'argent")
    end
end)



RegisterNetEvent('lzq:locationScooter')
AddEventHandler('lzq:locationScooter', function(prix)
	local xPlayer = ESX.GetPlayerFromId(source)
		local playerMoney = xPlayer.getAccount('bank').money
    local car = "faggio"
    if playerMoney >= prix then
	xPlayer.removeAccountMoney('bank', prix)
    TriggerClientEvent('g:spawnCar',source,car)
	TriggerClientEvent('esx:showNotification', source, "~g~Vous avez bien reçu votre véhicule ~s~!! ")
    else
        TriggerClientEvent('esx:showNotification', source, "Vous n\'avez assez ~r~d\'argent")
    end
end)


RegisterNetEvent('lzq:locationVoiture')
AddEventHandler('lzq:locationVoiture', function(prix)
	local xPlayer = ESX.GetPlayerFromId(source)
	local playerMoney = xPlayer.getMoney()
    local car = "brioso"
    if playerMoney >= prix then
	xPlayer.removeAccountMoney('bank', prix)
    TriggerClientEvent('g:spawnCar',source,car)
	TriggerClientEvent('esx:showNotification', source, "~g~Vous avez bien reçu votre véhicule ~s~! ")
    else
        TriggerClientEvent('esx:showNotification', source, "Vous n\'avez assez ~r~d\'argent")
    end
end)

RegisterNetEvent('lzq:locationVoiture2')
AddEventHandler('lzq:locationVoiture2', function(prix)
	local xPlayer = ESX.GetPlayerFromId(source)
	local playerMoney = xPlayer.getMoney()
    local car = "kanjo"
    if playerMoney >= prix then
	xPlayer.removeAccountMoney('bank', prix)
    TriggerClientEvent('g:spawnCar',source,car)
	TriggerClientEvent('esx:showNotification', source, "~g~Vous avez bien reçu votre véhicule ~s~! ")
    else
        TriggerClientEvent('esx:showNotification', source, "Vous n\'avez assez ~r~d\'argent")
    end
end)