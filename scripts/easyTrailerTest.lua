-- Testmod für den LS25


easyTrailer = {}

print("easyTrailer: ")

-- function easyTrailer.registerEventListeners(vehicleType)

    -- print("easyTrailer: Event-Listener registriert")

    -- local functionNames = {

        -- "onLoad",

        -- "onUpdate"

    -- }

    -- for _, functionName in ipairs(functionNames) do

        -- SpecializationUtil.registerEventListener(vehicleType, functionName, easyTrailer);

    -- end;

-- end

function easyTrailer.GetCurrentVehicle()
	return g_currentMission.playerSystem:getLocalPlayer():getCurrentVehicle()
end

function easyTrailer.GetPrerequisites(specializations)
	return SpecializationUtil.hasSpecialization(motorized, specializations);
end;

function easyTrailer:GetReverseGear(vehicle)
	local isMotorized = self.spec_motorized
    print("easyTrailer: GetReverseGear()")
	if isMotorized ~= nil then
		return  vehicle.spec_motorized.motor:getDrivingDirection() == -1
	end
	
	return false

end


function easyTrailer:update(dt, isActiveForInput, isActiveForInputIngnoreSelection, isSelected)

	if g_currentMission ~= nil then
		print("easyTrailer: update()")
		local vehicle = easyTrailer.GetCurrentVehicle()
		if vehicle ~= nil then
		print("Fahrzeug erkannt")
			if self.GetReverseGear(vehicle) then

				print("Ein Rückwärtsgang ist eingelegt.")

			end
		end
	end
end


-- function easyTrailer:load(savegame)

    -- g_game.mission:addUpdateListener(self.update)

    -- print("easyTrailer: geladen")

-- end


addModEventListener(easyTrailer)

-- g_currentMission:addEventListener(g_currentMission.EVENT_CONTROL_VEHICLE, easyTrailer.onUpdate)
