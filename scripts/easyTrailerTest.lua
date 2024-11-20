-- Testmod für den LS25


easyTrailer = {}

print("easyTrailer: ")

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

addModEventListener(easyTrailer)
