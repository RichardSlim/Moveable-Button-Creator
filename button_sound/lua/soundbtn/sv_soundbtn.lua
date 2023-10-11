SoundBtn = SoundBtn or {}

SoundBtn.Class = "button_soundbtn"

SoundBtn.BtnList = {
	[1] = {
		["Model"] = "models/props_combine/combinebutton.mdl",
		["Sound"] = "menu/rationsofflinepw.mp3",
		["Cooldown"] = 10,
		["Pos"] = Vector( -1994, 905.18, 825.93 ),
		["Ang"] = Angle( 0, -90, 0 )
	},
	[2] = {
		["Model"] = "models/props_combine/combinebutton.mdl",
		["Sound"] = "dispatch/rationsoffline.mp3",
		["Cooldown"] = 1,
		["Pos"] = Vector( -1962.38, 905.18, 825.93 ),
		["Ang"] = Angle( -45, -90, 0 ),
	},
	[3] = {
		["Model"] = "models/props_lab/citizenradio.mdl",
		["Sound"] = "dispatch/bassfadedeepfactoryonlinehq.wav",
		["Cooldown"] = 1,
		["Pos"] = Vector( 306.71, -1787.97, 235.96 ),
		["Ang"] = Angle( 0, -90, 0 ),
	},
	[4] = {
		["Model"] = "models/dav0r/buttons/button.mdl",
		["Sound"] = "dispatch/announcer_judgementwaiver.wav",
		["Cooldown"] = 1,
		["Pos"] = Vector( 8991.78, 2835.78, 6978.68 ),
		["Ang"] = Angle(0,90,0),
	},
	[5] = {
		["Model"] = "models/props_combine/combinebutton.mdl",
		["Sound"] = "dispatch/announcer_gate.wav",
		["Cooldown"] = 1,
		["Pos"] = Vector(0,0,0),
		["Ang"] = Angle(0,90,0),
	},
}

hook.Add( "InitPostEntity", "SpawnBtn", function()
	SoundBtn.SpawnButton()
end )

hook.Add( "PostCleanupMap", "RespawnBtn", function()
	SoundBtn.SpawnButton()
end )

function SoundBtn.SpawnButton(remove)
	if remove then
		for k, v in ipairs( ents.FindByClass( SoundBtn.Class ) ) do
			v:Remove()
		end
	end

	for i = 1, #SoundBtn.BtnList do
		local entbtn = ents.Create( SoundBtn.Class )
		entbtn:SetPos( SoundBtn.BtnList[i].Pos )
		entbtn:SetAngles( SoundBtn.BtnList[i].Ang )
		entbtn:SetModel( SoundBtn.BtnList[i].Model )
		entbtn:Spawn()
		entbtn.SoundBtnID = i
	end
end

concommand.Add( "respawn_soundbtn", function( ply, cmd, args )
	if ply:IsValid() and ( ply:IsAdmin() or ply:IsSuperAdmin() ) then
		SoundBtn.SpawnButton(true)
	end
end )

