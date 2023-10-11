AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include( "shared.lua" )

function ENT:Initialize()
	--self:SetModel( self.Models )
	self:PhysicsInit( SOLID_VPHYSICS )
	self:SetMoveType( MOVETYPE_VPHYSICS )
	self:SetSolid( SOLID_VPHYSICS )
	self:SetUseType( SIMPLE_USE )

	self:SetCollisionGroup(COLLISION_GROUP_PUSHAWAY)
	local obj = self:GetPhysicsObject()
	if obj:IsValid() then
		obj:EnableMotion(false)
		obj:Sleep()
	end
	self.LastUse = 0
	self.PosePosition = 0
end




local LoadedSounds

local function ReadSound( FileName )
	local sound
	local filter
	filter = RecipientFilter()
	filter:AddAllPlayers()

	sound = CreateSound( game.GetWorld(), FileName, filter )
	if sound then
		sound:SetSoundLevel( 0 )
	end

	if sound then
		sound:Play()
	end
	return sound
end

function ENT:MakeAnim()
	if self:GetModel() == "models/props_combine/combinebutton.mdl" then
		self:ResetSequence( "Press" )
	end
end


function ENT:Use(activator)
	if !activator:IsPlayer() then return end
	if self.LastUse > CurTime() then return end
	local btnid = self.SoundBtnID
	self.LastUse = CurTime()+SoundBtn.BtnList[btnid].Cooldown
	
	ReadSound( SoundBtn.BtnList[btnid].Sound )
	self:MakeAnim()
end

function ENT:Think()
	self:NextThink( CurTime() )
	return true
end

function ENT:OnTakeDamage( dmginfo )
end

function ENT:OnRemove()
end