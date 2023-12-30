ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(100)
	end
end)

--(((((((( SCRIPT LTD CREE PAR KAITO POUR FIVE DEV ))))))))

Kaito              = {}
Kaito.DrawDistance = 300
Kaito.Size         = {x = 1.0, y = 1.0, z = 1.0}
Kaito.Color        = {r = 255, g = 255, b = 255}
Kaito.Type         = 1

local position = {
    {x = 25.74, y = -1345.56, z = 29.49},
    {x = 373.875,   y = 325.896,  z = 102.66},
	{x = 2557.458,  y = 382.282,  z = 107.722}, 
	{x = -3038.939, y = 585.954,  z = 6.97},
	{x = -3241.927, y = 1001.462, z = 11.850}, 
	{x = 547.431,   y = 2671.710, z = 41.176}, 
	{x = 1961.464,  y = 3740.672, z = 31.363}, 
	{x = 2678.916,  y = 3280.671, z = 54.261}, 
    {x = 1729.216,  y = 6414.131, z = 34.057}, 
    {x = 1135.808,  y = -982.281,  z = 45.45}, 
	{x = -1222.93, y = -906.99,  z = 11.35}, 
	{x = -1487.553, y = -379.107,  z = 39.163}, 
	{x = -2968.243, y = 390.910,   z = 14.054}, 
	{x = 1166.024,  y = 2708.930,  z = 37.167}, 
	{x = 1392.562,  y = 3604.684,  z = 33.995}, 
	{x = -1393.409, y = -606.624,  z = 29.319}, 
    {x = -48.519,   y = -1757.514, z = 28.47}, 
	{x = 1163.373,  y = -323.801,  z = 68.27}, 
	{x = -707.67,  y = -914.22,  z = 18.26}, 
	{x = -1820.523, y = 792.518,   z = 137.20},
	{x = 1698.388,  y = 4924.404,  z = 41.083}
  }


  -- BLIPS 

  Citizen.CreateThread(function()

	for i=1, #Config.Kaito, 1 do

		local blip = AddBlipForCoord(Config.Kaito[i].x, Config.Kaito[i].y, Config.Kaito[i].z)

		SetBlipSprite (blip, 52)
		SetBlipDisplay(blip, 4)
		SetBlipScale  (blip, 0.8)
		SetBlipColour (blip, 5)
        SetBlipAsShortRange(blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString("LDT")
        EndTextCommandSetBlipName(blip)
	end

end)



Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local coords, letSleep = GetEntityCoords(PlayerPedId()), true

        for k in pairs(position) do
            if (Kaito.Type ~= -1 and GetDistanceBetweenCoords(coords, position[k].x, position[k].y, position[k].z, true) < Kaito.DrawDistance) then
                DrawMarker(Kaito.Type, position[k].x, position[k].y, position[k].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Kaito.Size.x, Kaito.Size.y, Kaito.Size.z, Kaito.Color.r, Kaito.Color.g, Kaito.Color.b, 100, false, true, 2, false, false, false, false)
                letSleep = false
            end
        end

        if letSleep then
            Citizen.Wait(500)
        end
    end
end)

--(((((((( SCRIPT LTD CREE PAR KAITO POUR FIVE DEV ))))))))

RMenu.Add('KRage_LTD', 'main', RageUI.CreateMenu("LTD", "Magasin"))
RMenu.Add('KRage_LTD', 'nourriture', RageUI.CreateSubMenu(RMenu:Get('KRage_LTD', 'main'), "LTD", "Nourriture"))
RMenu.Add('KRage_LTD', 'boissons', RageUI.CreateSubMenu(RMenu:Get('KRage_LTD', 'main'), "LTD", "Boissons"))

Citizen.CreateThread(function()
    while true do
        RageUI.IsVisible(RMenu:Get('KRage_LTD', 'main'), true, true, true, function()

            RageUI.Button("🍙 ~p~Achat Nourriture~", nil, {RightLabel = "→→"},true, function ()
            end, RMenu:Get('KRage_LTD', 'nourriture'))

            RageUI.Button("🥤 ~y~Achat Boissons~", nil, {RightLabel = "→→"},true, function ()
            end, RMenu:Get('KRage_LTD', 'boissons'))

            RageUI.Button("⏳~g~ Fermer le menu", nil, {}, true, function(Hovered, Active, Selected)
                if (Selected) then
                    RageUI.CloseAll()
            end
            end)
           

        end, function()
        end)

        RageUI.IsVisible(RMenu:Get('KRage_LTD', 'nourriture'), true, true, true, function()

        RageUI.Button("🥖 Pain", nil, {RightLabel = "~g~40$"},true, function(Hovered, Active, Selected)
            if (Selected) then   
            	local item = "pain"
            	local prix = 40
                TriggerServerEvent('KRage_LTD:acheter', item, prix)

            end
        end)

        RageUI.Button("🍔  Hamburger", nil, {RightLabel = "~g~50$"},true, function(Hovered, Active, Selected)
            if (Selected) then   
            	local item = "hamburger"
            	local prix = 50
                TriggerServerEvent('KRage_LTD:acheterA', item, prix)

            end
        end)

        RageUI.Button("🥝  Kiwi", nil, {RightLabel = "~g~50$"},true, function(Hovered, Active, Selected)
            if (Selected) then   
            	local item = "kiwi"
            	local prix = 50
                TriggerServerEvent('KRage_LTD:acheterI', item, prix)

            end
        end)
        
        RageUI.Button("🍕 Pizza", nil, {RightLabel = "~g~50$"},true, function(Hovered, Active, Selected)
            if (Selected) then   
            	local item = "pizza"
            	local prix = 50
                TriggerServerEvent('KRage_LTD:acheterJ', item, prix)

            end
        end)

        RageUI.Button("🍗 Poulet", nil, {RightLabel = "~g~50$"},true, function(Hovered, Active, Selected)
            if (Selected) then   
            	local item = "poulet"
            	local prix = 50
                TriggerServerEvent('KRage_LTD:acheterK', item, prix)

            end
        end)

        RageUI.Button("🥙 Wrap", nil, {RightLabel = "~g~50$"},true, function(Hovered, Active, Selected)
            if (Selected) then   
            	local item = "wrap"
            	local prix = 50
                TriggerServerEvent('KRage_LTD:acheterL', item, prix)

            end
        end)

        RageUI.Button("🍪 Cookie", nil, {RightLabel = "~g~50$"},true, function(Hovered, Active, Selected)
            if (Selected) then   
            	local item = "cookie"
            	local prix = 50
                TriggerServerEvent('KRage_LTD:acheterM', item, prix)

            end
        end)

    end, function()
    end)

    RageUI.IsVisible(RMenu:Get('KRage_LTD', 'boissons'), true, true, true, function()

        RageUI.Button("🥤 Icetea", nil, {RightLabel = "~g~50$"},true, function(Hovered, Active, Selected)
            if (Selected) then   
            	local item = "icetea"
            	local prix = 50
                TriggerServerEvent('KRage_LTD:acheterB', item, prix)

            end
        end)

        RageUI.Button("🥤 Coca", nil, {RightLabel = "~g~50$"},true, function(Hovered, Active, Selected)
            if (Selected) then   
            	local item = "coca"
            	local prix = 50
                TriggerServerEvent('KRage_LTD:acheterC', item, prix)

            end
        end)

        RageUI.Button("🥤 Sprite", nil, {RightLabel = "~g~50$"},true, function(Hovered, Active, Selected)
            if (Selected) then   
            	local item = "sprite"
            	local prix = 50
                TriggerServerEvent('KRage_LTD:acheterD', item, prix)
            end
        end)

        RageUI.Button("🥤 Fanta", nil, {RightLabel = "~g~50$"},true, function(Hovered, Active, Selected)
            if (Selected) then   
                 local item = "fanta"
                 local prix = 50
                 TriggerServerEvent('KRage_LTD:acheterE', item, prix)

            end
        end)

        RageUI.Button("🥤 Shwepps", nil, {RightLabel = "~g~50$"},true, function(Hovered, Active, Selected)
            if (Selected) then   
                 local item = "shwepps"
                 local prix = 50
                 TriggerServerEvent('KRage_LTD:acheterF', item, prix)

            end
        end)

        RageUI.Button("🥤 Oasis", nil, {RightLabel = "~g~50$"},true, function(Hovered, Active, Selected)
            if (Selected) then   
                 local item = "oasis"
                 local prix = 50
                 TriggerServerEvent('KRage_LTD:acheterG', item, prix)
                end
            end)


                 RageUI.Button("🥤 Orangina", nil, {RightLabel = "~g~50$"},true, function(Hovered, Active, Selected)
                    if (Selected) then   
                         local item = "orangina"
                         local prix = 50
                         TriggerServerEvent('KRage_LTD:acheterH', item, prix)

            end
        end)

    end, function()
    end)

      Citizen.Wait(0)
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        for k in pairs(position) do

            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, position[k].x, position[k].y, position[k].z)

            if dist <= 1.0 then
                ESX.ShowHelpNotification("Appuyez sur [~b~E~w~] pour accéder au Magasin")
                if IsControlJustPressed(1,51) then
                    RageUI.Visible(RMenu:Get('KRage_LTD', 'main'), not RageUI.Visible(RMenu:Get('KRage_LTD', 'main')))
                end   
            end
        end
    end
end)

--######## PARTIE PED #######--

Citizen.CreateThread(function()
    local hash = GetHashKey("a_m_m_soucent_03") --"a_f_y_beach_01" ped a modif: https://docs.fivem.net/docs/game-references/ped-models/
    while not HasModelLoaded(hash) do
    RequestModel(hash)
    Wait(20)
    end
    ped = CreatePed("PED_TYPE_CIVFEMALE", "a_m_m_soucent_03", 393.16, -832.42, 28.30, true, true) --"a_f_y_beach_01" ped a modif: https://docs.fivem.net/docs/game-references/ped-models/
    SetBlockingOfNonTemporaryEvents(ped, true)
    FreezeEntityPosition(ped, true)                      
end)

local v1 = vector3(393.16, -832.42, 30.20)

function Draw3DText(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local p = GetGameplayCamCoords()
    local distance = GetDistanceBetweenCoords(p.x, p.y, p.z, x, y, z, 1)
    local scale = (1 / distance) * 2
    local fov = (1 / GetGameplayCamFov()) * 100
    local scale = scale * fov
    if onScreen then
        SetTextScale(0.0, 0.35)
        SetTextFont(0)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x,_y)
    end
end

local distance = 20

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if Vdist2(GetEntityCoords(PlayerPedId(), false), v1) < distance then
            Draw3DText(v1.x,v1.y,v1.z, "Yo mon reuf!") --Text du ped
        end
    end
end)

--(((((((( SCRIPT LTD CREE PAR KAITO POUR FIVE DEV ))))))))