ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent("puhelinrikki:kateinen")
AddEventHandler("puhelinrikki:kateinen", function()
	local xPlayer = ESX.GetPlayerFromId(source)

    local kateinen = xPlayer.getMoney()
     if kateinen > 0 then
     xPlayer.removeMoney(kateinen)
	 --TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Kaikki taskuissasi olevat rahat kastuivat.. Et voi enään käyttää näitä rahoja..',  length = 3000})
	 TriggerClientEvent('esx:showNotification', xPlayer.source, ('Kaikki taskuissasi olevat rahat kastuivat kuleksivat nyt meressä. Miksi menit uimaan rahojen kanssa?'))
	end
end)

RegisterServerEvent("puhelinrikki:likaneraha")
AddEventHandler("puhelinrikki:likaneraha", function()
	local xPlayer = ESX.GetPlayerFromId(source)

    local likaneraha = xPlayer.getAccount('black_money').money
     if likaneraha > 0 then
     xPlayer.removeAccountMoney('black_money', likaneraha)
	 -- TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Kaikki taskuissasi olevat likaiset rahat kastuivat.. Et voi enään käyttää näitä rahoja..',  length = 3000})
	 TriggerClientEvent('esx:showNotification', xPlayer.source, ('Kaikki taskuissasi olevat likaiset rahat valuivat pois taskuistasi..'))
	end
end)

RegisterServerEvent("puhelinrikki:puhelin")
AddEventHandler("puhelinrikki:puhelin", function()
	local xPlayer = ESX.GetPlayerFromId(source)

    local puhelin = xPlayer.getInventoryItem("phone")["count"]
     if puhelin > 0 then
     xPlayer.removeInventoryItem("phone", puhelin)
     xPlayer.addInventoryItem('korjattavapuhelin', 1)
	-- TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Puhelimesi kastui ja meni rikki.. Hae kaupasta puhelimen korjausväline!',  length = 3000})
	 TriggerClientEvent('esx:showNotification', xPlayer.source, ('Puhelimesi kastui ja meni rikki.. Hae kaupasta puhelimen korjausväline!'))
    end
end)

ESX.RegisterUsableItem('korjausvaline', function(source)

	TriggerClientEvent('prog:wammane', source);

	Citizen.Wait(7500)
	local xPlayer = ESX.GetPlayerFromId(source)
	local korjausvaline = xPlayer.getInventoryItem('korjausvaline').count
	local phoneitem = xPlayer.getInventoryItem('korjattavapuhelin')
	if phoneitem.count >= 1 then
		if korjausvaline >= 1 then
			xPlayer.removeInventoryItem('korjausvaline', 1)
			--Citizen.Wait(1000) en tykkää odottamisesta
			xPlayer.removeInventoryItem('korjattavapuhelin', 1)
			--Citizen.Wait(1000) en tykkää odottamisesta
			xPlayer.addInventoryItem('phone', 1)
		end
	end
end)

AddEventHandler('onResourceStart', function(resourceName)
	if (GetCurrentResourceName() ~= resourceName) then
	  return
	end
	print('--------------------------------------')
	print(''..resourceName..' ladattu onnistuneesti!')
	print('--------------------------------------')
  end)