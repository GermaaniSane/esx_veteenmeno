ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

Citizen.CreateThread(function()
	while true do 
		joku = PlayerPedId()
		Citizen.Wait(500)
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1200)
		if IsEntityInWater(joku) and IsPedSwimming(joku) then
			if Config.kateinen == true then 
			TriggerServerEvent('puhelinrikki:kateinen')
			if Config.puhelin == true then
			TriggerServerEvent('puhelinrikki:puhelin')
			 if Config.likaneraha == true then
			TriggerServerEvent('puhelinrikki:likaneraha')
			 end
			end
		end
	end
end
end)

RegisterNetEvent('prog:wammane')
AddEventHandler('prog:wammane', function()
	local pelaaja = PlayerPedId() 
	TaskStartScenarioInPlace(PlayerPedId(), 'WORLD_HUMAN_STAND_MOBILE', 0, false)
	ClearPedTasks(pelaaja)
	TriggerEvent("mythic_progbar:client:progress", {
        name = "unique_action_name",
        duration = 7500,
        label = "Korjaat puhelintasi",
        useWhileDead = false,
        canCancel = false,
        controlDisables = {
            disableMovement = false,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        },
        animation = {
            animDict = "missheistdockssetup1clipboard@idle_a",
            anim = "idle_a",
        },
        prop = {
            model = "",
        }
    }, function(status)
        if not status then
        end
    end)
	Citizen.Wait(7500)
	ClearPedTasks(pelaaja)
end)

AddEventHandler('onResourceStop', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
      return
    end
    print('--------------------------------------')
	print(''..resourceName..' stopattu onnistuneesti!')
	print('--------------------------------------')
  end)