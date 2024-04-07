if GetResourceState('qb-core') ~= 'started' then return end

local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    OnPlayerLoaded()
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
    OnPlayerUnload()
end)

function handleVehicleKeys(veh)
    if Config.UseSk-Keys then
        local plate = GetVehicleNumberPlateText(veh)
        exports['sk-keys']:tempkey(plate)
    else
        local plate = GetVehicleNumberPlateText(veh)
        TriggerServerEvent('qb-vehiclekeys:server:AcquireVehicleKeys', plate)
    end
end

function hasPlyLoaded()
    return LocalPlayer.state.isLoggedIn
end

function DoNotification(text, nType)
    QBCore.Functions.Notify(text, nType)
end
