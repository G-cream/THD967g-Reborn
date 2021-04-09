function ReisenNo2ExEffectTimerProc takes nothing returns nothing
	local timer t = GetExpiredTimer()
	local integer task = GetHandleId(t)
	local real x = LoadReal(udg_ht, task, 0)
	local real y = LoadReal(udg_ht, task, 1)
	local real a = LoadReal(udg_ht, task, 2)
	local integer i = LoadInteger(udg_ht, task, 3)
	if i != 0 then
		call DestroyEffect(AddSpecialEffect("Abilities\\Weapons\\AncestralGuardianMissile\\AncestralGuardianMissile.mdl", x + i * 35 * CosBJ(a), y + i * 35 * SinBJ(a)))
		call DestroyEffect(AddSpecialEffect("Abilities\\Weapons\\AncestralGuardianMissile\\AncestralGuardianMissile.mdl", x + i * 35 * CosBJ(a + 90), y + i * 35 * SinBJ(a + 90)))
		call DestroyEffect(AddSpecialEffect("Abilities\\Weapons\\AncestralGuardianMissile\\AncestralGuardianMissile.mdl", x + i * 35 * CosBJ(a + 180), y + i * 35 * SinBJ(a + 180)))
		call DestroyEffect(AddSpecialEffect("Abilities\\Weapons\\AncestralGuardianMissile\\AncestralGuardianMissile.mdl", x + i * 35 * CosBJ(a + 270), y + i * 35 * SinBJ(a + 270)))
		call SaveInteger(udg_ht, task, 3, i - 1)
	else
		call DestroyTimer(t)
		call FlushChildHashtable(udg_ht, task)
	endif    
	set t = null
endfunction
function CreateReisenNo2ExEffect takes real x, real y, real a returns nothing
	local timer t = CreateTimer()
	local integer task = GetHandleId(t)
	call SaveReal(udg_ht, task, 0, x)
	call SaveReal(udg_ht, task, 1, y)
	call SaveReal(udg_ht, task, 2, a)
	call SaveInteger(udg_ht, task, 3, 5)
	call TimerStart(t, 0.04, true, function ReisenNo2ExEffectTimerProc)     
	set t = null
endfunction
function GetReisenNo2ExDuration takes nothing returns real
	return LoadReal(udg_ht, StringHash("ReisenNo2ExDurationAccumulator"), StringHash("ReisenNo2ExDuration"))
endfunction
function SetReisenNo2ExDuration takes real duration returns real
	call SaveReal(udg_ht, StringHash("ReisenNo2ExDurationAccumulator"), StringHash("ReisenNo2ExDuration"), duration)
	return duration
endfunction
function AccumulateReisenNo2ExDurationTimerProc takes nothing returns nothing
	local unit target = LoadUnitHandle(udg_ht, StringHash("InitialingReisenNo2Trigger"), StringHash("CharacterHandle"))
	local real reisenNo2ExDuration = LoadReal(udg_ht, StringHash("ReisenNo2ExDurationAccumulator"), StringHash("ReisenNo2ExDuration"))
	call SaveReal(udg_ht, StringHash("ReisenNo2ExDurationAccumulator"), StringHash("ReisenNo2ExDuration"), reisenNo2ExDuration + 0.02)
	set target = null
endfunction
function AccumulateReisenNo2ExDuration takes nothing returns nothing
	local timer t = CreateTimer()    
	call SaveReal(udg_ht, StringHash("ReisenNo2ExDurationAccumulator"), StringHash("ReisenNo2ExDuration"), 0.00)
	call TimerStart(t, 0.02, true, function AccumulateReisenNo2ExDurationTimerProc)    
	set t = null
endfunction
function Trig_ReisenNo2ExAttacked_Conditions takes nothing returns boolean
	if GetUnitAbilityLevel(GetTriggerUnit(), 'A0ZL') == 0 then
		return false
	elseif IsUnitAlly(GetTriggerUnit(), GetOwningPlayer(GetEventDamageSource())) then
		return false
	elseif IsUnitIllusion(GetEventDamageSource()) then
		return false
	elseif GetEventDamage()== 0 then
		return false
	endif
	return true
endfunction
function Trig_ReisenNo2ExAttacked_Actions takes nothing returns nothing
	call SetReisenNo2ExDuration(GetReisenNo2ExDuration() + 1.00)
endfunction
function Trig_ReisenNo2ExDamage_Actions takes nothing returns nothing
	local unit caster = LoadUnitHandle(udg_ht, StringHash("ReisenNo2ExDamageTrigger"), StringHash("Attacker"))
	local unit target = GetTriggerUnit()
	local trigger reisenNo2ExDamageTrigger = GetTriggeringTrigger()
	local triggeraction reisenNo2ExDamageTriggerAction = LoadTriggerActionHandle(udg_ht, StringHash("ReisenNo2ExDamageTrigger"), StringHash("Action"))
	local real extraDamage = GetHeroLevel(caster) * 5 + 35
	local real lifeGained = GetHeroLevel(caster) * 5 + 35
	local real reisenNo2ExBoundary = 8.00     
	if GetTriggerEventId() == EVENT_UNIT_DAMAGED and GetEventDamageSource() == caster then
		if GetReisenNo2ExDuration() >= reisenNo2ExBoundary then
			if GetWidgetLife(target) > 0.405 then
				call UnitDamageTargetHJ(caster, target, extraDamage, 3)
			endif
			call CreateReisenNo2ExEffect(GetUnitX(target), GetUnitY(target), GetRandomInt(0, 90))
			call UnitGainLife(caster, lifeGained)
			call SetReisenNo2ExDuration(0.00)
		endif
	endif
	if GetTriggerEventId() != EVENT_UNIT_DAMAGED or GetEventDamageSource() == caster then
		call TriggerRemoveAction(reisenNo2ExDamageTrigger, reisenNo2ExDamageTriggerAction)
		call DestroyTrigger(reisenNo2ExDamageTrigger)
		call FlushChildHashtable(udg_ht, StringHash("ReisenNo2ExDamageTrigger"))
	endif
	set reisenNo2ExDamageTrigger = null
	set reisenNo2ExDamageTriggerAction = null
	set caster = null
	set target = null
endfunction
function Trig_ReisenNo2ExAttack_Conditions takes nothing returns boolean
	if GetUnitAbilityLevel(GetAttacker(), 'A0ZL') == 0 then
		return false
	elseif IsUnitType(GetTriggerUnit(), UNIT_TYPE_STRUCTURE) then
		return false
	elseif IsUnitAlly(GetTriggerUnit(), GetOwningPlayer(GetAttacker())) then
		return false
	elseif IsUnitIllusion(GetAttacker()) then
		return false
	endif
	return true
endfunction
function Trig_ReisenNo2ExAttack_Actions takes nothing returns nothing
	local unit caster = GetAttacker()
	local unit target = GetTriggerUnit()
	local trigger reisenNo2ExDamageTrigger = CreateTrigger()
	local triggeraction reisenNo2ExDamageTriggerAction = TriggerAddAction(reisenNo2ExDamageTrigger, function Trig_ReisenNo2ExDamage_Actions)
	call TriggerRegisterUnitEvent(reisenNo2ExDamageTrigger, target, EVENT_UNIT_DAMAGED)
	call TriggerRegisterUnitEvent(reisenNo2ExDamageTrigger, caster, EVENT_UNIT_ISSUED_ORDER)
	call TriggerRegisterUnitEvent(reisenNo2ExDamageTrigger, caster, EVENT_UNIT_ISSUED_POINT_ORDER)
	call TriggerRegisterUnitEvent(reisenNo2ExDamageTrigger, caster, EVENT_UNIT_ISSUED_TARGET_ORDER)
	call SaveTriggerActionHandle(udg_ht, StringHash("ReisenNo2ExDamageTrigger"), StringHash("Action"), reisenNo2ExDamageTriggerAction)
	call SaveUnitHandle(udg_ht, StringHash("ReisenNo2ExDamageTrigger"), StringHash("Attacker"), GetAttacker())
	set caster = null
	set target = null
	set reisenNo2ExDamageTriggerAction = null
	set reisenNo2ExDamageTrigger = null
endfunction
function UnitAliveFilter takes nothing returns boolean
	if GetWidgetLife(GetFilterUnit()) > 0.405 then
		return true
	endif
	return false
endfunction 
function DestructableCounter takes nothing returns nothing
	local integer count = LoadInteger(udg_ht, StringHash("Reisen201SpellEffectTrigger"), StringHash("DestructableCount"))
	call SaveInteger(udg_ht, StringHash("Reisen201SpellEffectTrigger"), StringHash("DestructableCount"), count + 1)
endfunction
function RepelTargetTimerProc takes nothing returns nothing
	local timer t = GetExpiredTimer()
	local unit target = LoadUnitHandle(udg_ht, StringHash("Reisen201SpellEffectTrigger"), StringHash("Target"))
	local real repelAngle = LoadReal(udg_ht, StringHash("Reisen201SpellEffectTrigger"), StringHash("Angle"))
	local real repelMaxDistance = LoadReal(udg_ht, StringHash("Reisen201SpellEffectTrigger"), StringHash("MaxDistance"))
	local real repelDistance = 9.0
	local real unitRepelPathWidth = 45.0
	local real destructableRepelPathWidth = 100.0
	local location repelStartPoint = LoadLocationHandle(udg_ht, StringHash("Reisen201SpellEffectTrigger"), StringHash("StartPoint"))
	local location repelCurrentPoint = LoadLocationHandle(udg_ht, StringHash("Reisen201SpellEffectTrigger"), StringHash("CurrentPoint"))
	local location repelNextPoint = PolarProjectionBJ(repelCurrentPoint, repelDistance, repelAngle)
	local real repelNextPointX = GetLocationX(repelNextPoint)
	local real repelNextPointY = GetLocationY(repelNextPoint)
	local group g = CreateGroup()
	local boolean repelEndFlag = false
	local integer destructableCount    
	if IsUnitInRangeLoc(target, repelStartPoint, repelMaxDistance) == false then
		set repelEndFlag = true
	endif
	call GroupEnumUnitsInRange(g, repelNextPointX, repelNextPointY, unitRepelPathWidth, Condition(function UnitAliveFilter))
	call EnumDestructablesInCircleBJ(destructableRepelPathWidth, repelNextPoint, function DestructableCounter)
	set destructableCount = LoadInteger(udg_ht, StringHash("Reisen201SpellEffectTrigger"), StringHash("DestructableCount"))
	if CountUnitsInGroup(g) > 1 or destructableCount > 0 or IsTerrainPathable(repelNextPointX, repelNextPointY, PATHING_TYPE_WALKABILITY) then
		set repelEndFlag = true
	endif
	if repelEndFlag == false then
		call DestroyEffect(AddSpecialEffect("Abilities\\Weapons\\GlaiveMissile\\GlaiveMissileTarget.mdl", GetUnitX(target), GetUnitY(target)))
		call SetUnitXY(target, repelNextPointX, repelNextPointY)
		call SaveLocationHandle(udg_ht, StringHash("Reisen201SpellEffectTrigger"), StringHash("CurrentPoint"), repelNextPoint)
	else
		call SetUnitFlag(target, CS_DRAG(), false)
		call SetUnitFlag(target, CS_REPEL(), false)
		call RemoveLocation(repelStartPoint)
		call RemoveLocation(repelNextPoint)
		call DestroyTimer(t)
	endif
	call DestroyGroup(g)
	call RemoveLocation(repelCurrentPoint)    
	set t = null
	set target = null
	set repelStartPoint = null
	set repelCurrentPoint = null
	set repelNextPoint = null
	set g = null
endfunction
function RepelTarget takes nothing returns nothing
	local timer t = CreateTimer()
	local unit caster = LoadUnitHandle(udg_ht, StringHash("Reisen201SpellEffectTrigger"), StringHash("Caster"))
	local unit target = LoadUnitHandle(udg_ht, StringHash("Reisen201SpellEffectTrigger"), StringHash("Target"))
	call SetUnitFlag(target, CS_DRAG(), true)
	call SetUnitFlag(target, CS_REPEL(), true)
	call TimerStart(t, 0.01, true, function RepelTargetTimerProc)
	call DestroyEffect(AddSpecialEffect("Abilities\\Spells\\Human\\StormBolt\\StormBoltMissile.mdl", GetUnitX(target), GetUnitY(target)))
	set t = null
	set caster = null
	set target = null
endfunction
function SlowTarget takes nothing returns nothing
	local unit caster = LoadUnitHandle(udg_ht, StringHash("Reisen201SpellEffectTrigger"), StringHash("Caster"))
	local unit target = LoadUnitHandle(udg_ht, StringHash("Reisen201SpellEffectTrigger"), StringHash("Target"))
	local unit dummyUnit = CreateUnit(GetOwningPlayer(caster), 'o000', GetUnitX(caster), GetUnitY(caster), 0.0)
	local integer level = GetUnitAbilityLevel(caster, 'A0ZD')
	call UnitAddAbility(dummyUnit, 'A0ZE')
	call SetUnitAbilityLevel(dummyUnit, 'A0ZE', level)
	call IssueTargetOrder(dummyUnit, "slow", target)
	call KillUnit(dummyUnit)
	set caster = null
	set target = null
	set dummyUnit = null
endfunction
function Trig_ReisenNo201SpellEffect_Conditions takes nothing returns boolean
	return GetSpellAbilityId()=='A0ZD'
endfunction
function Trig_ReisenNo201SpellEffect_Actions takes nothing returns nothing
	local unit caster = GetTriggerUnit()
	local unit target = GetSpellTargetUnit()
	local integer level = GetUnitAbilityLevel(caster, 'A0ZD')
	local real abilityCoolDown = 17 - 2 * level
	local real extraDamage = level * 45
	local real repelAngle = AngleBetween(caster, target)
	local real repelMaxDistance = 750.0
	local location repelStartPoint = GetUnitLoc(target)
	local location repelCurrentPoint = Location(GetLocationX(repelStartPoint), GetLocationY(repelStartPoint))
	if caster == target then
		set repelAngle = GetUnitFacing(caster)
	endif
	call SaveUnitHandle(udg_ht, StringHash("Reisen201SpellEffectTrigger"), StringHash("Caster"), caster)
	call SaveUnitHandle(udg_ht, StringHash("Reisen201SpellEffectTrigger"), StringHash("Target"), target)
	call SaveReal(udg_ht, StringHash("Reisen201SpellEffectTrigger"), StringHash("Angle"), repelAngle)
	call SaveReal(udg_ht, StringHash("Reisen201SpellEffectTrigger"), StringHash("MaxDistance"), repelMaxDistance)
	call SaveLocationHandle(udg_ht, StringHash("Reisen201SpellEffectTrigger"), StringHash("StartPoint"), repelStartPoint)
	call SaveLocationHandle(udg_ht, StringHash("Reisen201SpellEffectTrigger"), StringHash("CurrentPoint"), repelCurrentPoint)
	call SaveInteger(udg_ht, StringHash("Reisen201SpellEffectTrigger"), StringHash("DestructableCount"), 0)
	if UnitHasItemOfTypeBJ(caster, 'I00B') then
		call Item_HeroAbilityCoolDownReset(caster, 'A0ZD', abilityCoolDown)
	endif
	call TriggerSleepAction(0.1)
	if IsUnitAlly(target, GetOwningPlayer(caster)) == false then
		if IsUnitType(target, UNIT_TYPE_HERO) and udg_SK_BLTalismanicAvaliable[GetConvertedPlayerId(GetOwningPlayer(target))] and IsUnitIllusionBJ(target)== false then
			call Item_BLTalismanicRunningCD(target)
		else
			call RepelTarget()
			if GetWidgetLife(target) > 0.405 then
				call UnitMagicDamageTarget(caster, target, extraDamage)
				call SlowTarget()
			endif
		endif
	else
		call RepelTarget()
	endif    
	set caster = null
	set target = null
	set repelStartPoint = null
endfunction
function Reisen202EffectTimerProc takes nothing returns nothing
	local unit target = LoadUnitHandle(udg_ht, StringHash("Reisen202SpellEffectEffect"), StringHash("Target"))
	local unit effectUnit = LoadUnitHandle(udg_ht, StringHash("Reisen202SpellEffectEffect"), StringHash("EffectUnit"))
	call SetUnitXY(effectUnit, GetUnitX(target), GetUnitY(target))
	set target = null
	set effectUnit = null
endfunction
function CreateReisen202Effect takes unit target returns nothing
	local player currentPlayer = GetOwningPlayer(target)
	local unit effectUnit = CreateUnit(currentPlayer, 'h01W', GetUnitX(target), GetUnitY(target), 0.0)
	local timer t = CreateTimer()
	call SaveUnitHandle(udg_ht, StringHash("Reisen202SpellEffectEffect"), StringHash("EffectUnit"), effectUnit)
	call SaveUnitHandle(udg_ht, StringHash("Reisen202SpellEffectEffect"), StringHash("Target"), target)
	call SaveTimerHandle(udg_ht, StringHash("Reisen202SpellEffectEffect"), StringHash("Timer"), t)
	call TimerStart(t, 0.02, true, function Reisen202EffectTimerProc)
	set currentPlayer = null
	set effectUnit = null
	set t = null
endfunction
function DestroyReisen202Effect takes unit target returns nothing
	local unit effectUnit = LoadUnitHandle(udg_ht, StringHash("Reisen202SpellEffectEffect"), StringHash("EffectUnit"))
	local timer t = LoadTimerHandle(udg_ht, StringHash("Reisen202SpellEffectEffect"), StringHash("Timer"))
	call ShowUnit(effectUnit, false)
	call KillUnit(effectUnit)
	call DestroyTimer(t)
	call FlushChildHashtable(udg_ht, StringHash("Reisen202SpellEffectEffect"))
	set effectUnit = null
	set t = null
endfunction
function SetUnitPathingTrue takes nothing returns nothing
	local timer t = GetExpiredTimer()
	local unit caster = LoadUnitHandle(udg_ht, StringHash("Reisen202SpellEffectTrigger"), StringHash("Caster"))
	call SetUnitPathing(caster, true)
	call DestroyTimer(t)
	set caster = null
	set t = null
endfunction
function IsReisenNo202SpellEffectTriggering takes nothing returns boolean
	if LoadBoolean(udg_ht, StringHash("Reisen202SpellEffectTrigger"), StringHash("TriggeringFlag")) then
		return true
	endif
	return false
endfunction
function ReisenNo202SpellEffectTimerProc takes nothing returns nothing
	local unit target = LoadUnitHandle(udg_ht, StringHash("Reisen202SpellEffectTrigger"), StringHash("Caster"))
	local timer t = GetExpiredTimer()
	call SaveBoolean(udg_ht, StringHash("Reisen202SpellEffectTrigger"), StringHash("TriggeringFlag"), false)
	call DestroyTimer(t)
	call DestroyReisen202Effect(target)
	set target = null
	set t = null
endfunction
function Trig_Reisen202SpellEffect_Conditions takes nothing returns boolean
	return GetSpellAbilityId() == 'A0ZF'
endfunction
function Trig_Reisen202SpellEffect_Actions takes nothing returns nothing
	local unit caster = GetTriggerUnit()
	local integer level = GetUnitAbilityLevel(caster, GetSpellAbilityId())
	local real abilityCoolDown = 15.00
	local real abilityDuration = 1.0 + level * 0.5
	local timer t = CreateTimer()
	local timer t1 = CreateTimer()
	call SaveUnitHandle(udg_ht, StringHash("Reisen202SpellEffectTrigger"), StringHash("Caster"), caster)
	call SaveBoolean(udg_ht, StringHash("Reisen202SpellEffectTrigger"), StringHash("TriggeringFlag"), true)
	if UnitHasItemOfTypeBJ(caster,'I00B') then
		call Item_HeroAbilityCoolDownReset(caster, GetSpellAbilityId(), abilityCoolDown)
	endif
	call TimerStart(t, abilityDuration, false, function ReisenNo202SpellEffectTimerProc)
	call TimerStart(t1, 0.01, false, function SetUnitPathingTrue)
	call CreateReisen202Effect(caster)
	set caster = null
endfunction
function RemoveTargetDamage takes nothing returns nothing
	local unit target = LoadUnitHandle(udg_ht, StringHash("Reisen202AttackedTrigger"), StringHash("Target"))
	local integer removeTimes = 0
	if HaveSavedInteger(udg_ht, StringHash("Reisen202AttackedTrigger"), StringHash("RemoveTimes")) then
		set removeTimes = LoadInteger(udg_ht, StringHash("Reisen202AttackedTrigger"), StringHash("RemoveTimes"))
	endif
	call SaveInteger(udg_ht, StringHash("Reisen202AttackedTrigger"), StringHash("RemoveTimes"), removeTimes + 1)
	if GetUnitAbilityLevel(target, 'A0ZM') == 0 then
		call SaveReal(udg_ht, StringHash("Reisen202AttackedTrigger"), StringHash("CurrentLife"), GetUnitState(target, UNIT_STATE_LIFE))
		call UnitAddAbility(target, 'A0ZM')
		call SetUnitState(target, UNIT_STATE_LIFE, GetUnitState(target, UNIT_STATE_MAX_LIFE))
	endif
	set target = null
endfunction
function TargetReceiveDamageTimerProc takes nothing returns nothing
	local unit target = LoadUnitHandle(udg_ht, StringHash("Reisen202AttackedTrigger"), StringHash("Target"))
	local real currentLife = LoadReal(udg_ht, StringHash("Reisen202AttackedTrigger"), StringHash("CurrentLife"))
	local integer removeTimes = LoadInteger(udg_ht, StringHash("Reisen202AttackedTrigger"), StringHash("RemoveTimes"))
	set removeTimes = removeTimes - 1
	call SaveInteger(udg_ht, StringHash("Reisen202AttackedTrigger"), StringHash("RemoveTimes"), removeTimes)
	if removeTimes == 0 then
		call UnitRemoveAbility(target, 'A0ZM')
		if GetWidgetLife(target) > 0.405 then
			call SetUnitState(target, UNIT_STATE_LIFE, currentLife)
		endif
	endif
	call DestroyTimer(GetExpiredTimer())
	set target = null
endfunction
function TargetReceiveDamage takes nothing returns nothing
	local timer t = CreateTimer()
	call TimerStart(t, 0.00, false, function TargetReceiveDamageTimerProc)
	set t = null
endfunction
function Trig_Reisen202Attacked_Conditions takes nothing returns boolean
	if IsReisenNo202SpellEffectTriggering() then
		return true
	endif
	return false
endfunction
function Trig_Reisen202Attacked_Actions takes nothing returns nothing
	local unit target = GetTriggerUnit()
	call SaveUnitHandle(udg_ht, StringHash("Reisen202AttackedTrigger"), StringHash("Target"), target)
	call RemoveTargetDamage()
	call DestroyEffect(AddSpecialEffectTarget("Abilities\\Weapons\\PriestMissile\\PriestMissile.mdl", target, "right hand"))
	call TargetReceiveDamage()
	set target = null
endfunction
function UnitPhysicalDamageArea takes unit caster, real x, real y, real range, real damage returns nothing
	local unit v
	local group g = CreateGroup()
	local boolexpr iff = GetPlayerFilter(GetOwningPlayer(caster))
	call GroupEnumUnitsInRange(g, x, y, range, iff)
	loop
		set v = FirstOfGroup(g)
	exitwhen v == null
		call GroupRemoveUnit(g, v)
		if GetWidgetLife(v)> 0.405 or IsUnitType(v, UNIT_TYPE_STRUCTURE)== false then
			call UnitDamageTargetHJ(caster, v, damage, 1)
		endif
	endloop
	call DestroyGroup(g)
	set v = null
	set g = null
	set iff = null
endfunction
function GenerateThiefMissile takes nothing returns nothing
	local timer t = GetExpiredTimer()
	local integer task = GetHandleId(t)
	local real x = LoadReal(udg_ht, task, 0)
	local real y = LoadReal(udg_ht, task, 1)
	local real a = LoadReal(udg_ht, task, 2)
	local integer i = LoadInteger(udg_ht, task, 3)
	local integer l = LoadInteger(udg_ht, task, 4)
	local integer k = 0
	local integer p = LoadInteger(udg_ht, task, 5)
	if l == 0 then
		set k = 1
	else
		set k =-1
	endif
	if i <= p then
		call DestroyEffect(AddSpecialEffect("Abilities\\Weapons\\BloodElfSpellThiefMISSILE\\BloodElfSpellThiefMISSILE.mdl", x + i * 45 * CosBJ(a + i * 12 * k), y + i * 45 * SinBJ(a + i * 12 * k)))
		call DestroyEffect(AddSpecialEffect("Abilities\\Weapons\\BloodElfSpellThiefMISSILE\\BloodElfSpellThiefMISSILE.mdl", x + i * 45 * CosBJ(a + i * 12 * k + 72), y + i * 45 * SinBJ(a + i * 12 * k + 72)))
		call DestroyEffect(AddSpecialEffect("Abilities\\Weapons\\BloodElfSpellThiefMISSILE\\BloodElfSpellThiefMISSILE.mdl", x + i * 45 * CosBJ(a + i * 12 * k + 144), y + i * 45 * SinBJ(a + i * 12 * k + 144)))
		call DestroyEffect(AddSpecialEffect("Abilities\\Weapons\\BloodElfSpellThiefMISSILE\\BloodElfSpellThiefMISSILE.mdl", x + i * 45 * CosBJ(a + i * 12 * k + 216), y + i * 45 * SinBJ(a + i * 12 * k + 216)))
		call DestroyEffect(AddSpecialEffect("Abilities\\Weapons\\BloodElfSpellThiefMISSILE\\BloodElfSpellThiefMISSILE.mdl", x + i * 45 * CosBJ(a + i * 12 * k + 288), y + i * 45 * SinBJ(a + i * 12 * k + 288)))
		call SaveInteger(udg_ht, task, 3, i + 1)
	else
		call DestroyTimer(t)
		call FlushChildHashtable(udg_ht, task)
	endif
	set t = null
endfunction
function CreateReisenNo203Effect takes real x, real y, real a, integer p returns nothing
	local timer t =(CreateTimer())
	local integer task = GetHandleId(t)
	call SaveReal(udg_ht, task, 0, x)
	call SaveReal(udg_ht, task, 1, y)
	call SaveReal(udg_ht, task, 2, a)
	call SaveInteger(udg_ht, task, 3, 1)
	call SaveInteger(udg_ht, task, 4, GetRandomInt(0, 1))
	call SaveInteger(udg_ht, task, 5, p)
	call TimerStart(t, 0.05, true, function GenerateThiefMissile)
	set t = null
endfunction
function Trig_Reisen203Kill_Conditions takes nothing returns boolean
	if GetUnitAbilityLevel(GetPlayerCharacter(GetOwningPlayer(GetKillingUnit())),'A0ZJ') == 0 then
		return false
	elseif IsUnitAlly(GetTriggerUnit(), GetOwningPlayer(GetKillingUnit())) then
		return false
	endif
	return true
endfunction
function Trig_Reisen203Kill_Actions takes nothing returns nothing
	local unit caster = GetPlayerCharacter(GetOwningPlayer(GetKillingUnit()))
	local unit target = GetTriggerUnit()
	local integer level = GetUnitAbilityLevel(caster,'A0ZJ')
	local real newDamage = 0.0
	local real currentDamage = udg_SK_Reisen203_ExtraDamage
	if IsUnitType(target, UNIT_TYPE_HERO) then
		set newDamage = GetUnitState(target, UNIT_STATE_MAX_LIFE)* (0.04 + 0.04 * level)
	else
		set newDamage = GetUnitState(target, UNIT_STATE_MAX_LIFE)* (0.04 + 0.04 * level) * 0.5
	endif
	if currentDamage < newDamage then
		set udg_SK_Reisen203_ExtraDamage = newDamage
	endif
	set caster = null
	set target = null
endfunction
function Trig_Reisen203Damage_Actions takes nothing returns nothing
	local unit caster = LoadUnitHandle(udg_ht, StringHash("reisenNo203Damage"), StringHash("Attacker"))
	local unit target = GetTriggerUnit()
	local trigger reisenNo203DamageTrigger = GetTriggeringTrigger()
	local triggeraction reisenNo203DamageTriggerAction = LoadTriggerActionHandle(udg_ht, StringHash("reisenNo203Damage"), StringHash("Action"))
	local integer abilityLevel = GetUnitAbilityLevel(caster,'A0ZJ')
	local real areaDamage = 5 + abilityLevel * 5 + GetHeroAgi(caster, true) * (0.02 + 0.02 * abilityLevel)
	local real extraDamage = udg_SK_Reisen203_ExtraDamage
	local integer effectSize = 0    
	if GetTriggerEventId() == EVENT_UNIT_DAMAGED and GetEventDamageSource() == caster then
		if abilityLevel >= 1 then
			if extraDamage > 0 then
				if GetWidgetLife(target)> 0.405 then
					call UnitDamageTargetHJ(caster, target, extraDamage, 1)
				endif
				set effectSize = R2I(RMaxBJ(extraDamage * 0.1, 1))
				call CreateReisenNo203Effect(GetUnitX(target), GetUnitY(target), GetRandomInt(0, 72), effectSize)
			endif
			set udg_SK_Reisen203_ExtraDamage = 0.0
			call UnitPhysicalDamageArea(caster, GetUnitX(target), GetUnitY(target), 225.00, areaDamage)
		endif
	endif
	if GetTriggerEventId() != EVENT_UNIT_DAMAGED or GetEventDamageSource() == caster then
		call TriggerRemoveAction(reisenNo203DamageTrigger, reisenNo203DamageTriggerAction)
		call DestroyTrigger(reisenNo203DamageTrigger)
		call FlushChildHashtable(udg_ht, StringHash("reisenNo203Damage"))
	endif
	set reisenNo203DamageTrigger = null
	set reisenNo203DamageTriggerAction = null
	set caster = null
	set target = null
endfunction
function Trig_Reisen203Attack_Conditions takes nothing returns boolean
	if GetUnitAbilityLevel(GetAttacker(),'A0ZJ')== 0 then
		return false
	elseif IsUnitType(GetTriggerUnit(), UNIT_TYPE_STRUCTURE) then
		return false
	elseif IsUnitAlly(GetTriggerUnit(), GetOwningPlayer(GetAttacker())) then
		return false
	elseif IsUnitIllusion(GetAttacker()) then
		return false
	endif
	return true
endfunction
function Trig_Reisen203Attack_Actions takes nothing returns nothing
	local unit caster = GetAttacker()
	local unit target = GetTriggerUnit()
	local trigger reisenNo203DamageTrigger = CreateTrigger()
	local triggeraction reisenNo203DamageTriggerAction = TriggerAddAction(reisenNo203DamageTrigger, function Trig_Reisen203Damage_Actions)
	call TriggerRegisterUnitEvent(reisenNo203DamageTrigger, target, EVENT_UNIT_DAMAGED)
	call TriggerRegisterUnitEvent(reisenNo203DamageTrigger, caster, EVENT_UNIT_ISSUED_ORDER)
	call TriggerRegisterUnitEvent(reisenNo203DamageTrigger, caster, EVENT_UNIT_ISSUED_POINT_ORDER)
	call TriggerRegisterUnitEvent(reisenNo203DamageTrigger, caster, EVENT_UNIT_ISSUED_TARGET_ORDER)
	call SaveTriggerActionHandle(udg_ht, StringHash("reisenNo203Damage"), StringHash("Action"), reisenNo203DamageTriggerAction)
	call SaveUnitHandle(udg_ht, StringHash("reisenNo203Damage"), StringHash("Attacker"), GetAttacker())
	set caster = null
	set target = null
	set reisenNo203DamageTriggerAction = null
	set reisenNo203DamageTrigger = null
endfunction
function ReisenNo204SpeedUpBegin takes nothing returns nothing
	local unit target = LoadUnitHandle(udg_ht, StringHash("ReisenNo204SpellEffectTrigger"), StringHash("Caster"))
	local integer level = LoadInteger(udg_ht, StringHash("ReisenNo204SpellEffectTrigger"), StringHash("AbilityLevel"))
	call UnitAddAbility(target, 'A0ZH')
	call SetUnitAbilityLevel(target, 'A0ZG', level)
	call SetPlayerAbilityAvailable(GetOwningPlayer(target), 'A0ZH', false)
	set target = null
endfunction
function ReisenNo204SpeedUpEnd takes nothing returns nothing
	local unit target = LoadUnitHandle(udg_ht, StringHash("ReisenNo204SpellEffectTrigger"), StringHash("Caster"))
	call UnitRemoveAbility(target, 'A0ZH')
	call UnitRemoveAbility(target, 'B06F')
	set target = null
endfunction
function GetReisenNo204SpellEffectTriggerDuration takes nothing returns real
	return LoadReal(udg_ht, StringHash("ReisenNo204SpellEffectTrigger"), StringHash("Duration"))
endfunction
function SetReisenNo204SpellEffectTriggerDuration takes real duration returns real
	call SaveReal(udg_ht, StringHash("ReisenNo204SpellEffectTrigger"), StringHash("Duration"), duration)
	return duration
endfunction
function IsReisenNo204SpellEffectTriggering takes nothing returns boolean
	if LoadBoolean(udg_ht, StringHash("ReisenNo204SpellEffectTrigger"), StringHash("TriggeringFlag")) then
		return true
	endif
	return false
endfunction
function ReisenNo204SpellEffectTimerProc takes nothing returns nothing
	local unit target = LoadUnitHandle(udg_ht, StringHash("ReisenNo204SpellEffectTrigger"), StringHash("Caster"))
	local real abilityDuration = LoadReal(udg_ht, StringHash("ReisenNo204SpellEffectTrigger"), StringHash("Duration"))
	local timer t = GetExpiredTimer()
	if GetWidgetLife(target)> 0.405 and abilityDuration > 0 then
		call SaveReal(udg_ht, StringHash("ReisenNo204SpellEffectTrigger"), StringHash("Duration"), abilityDuration - 0.01)
	else
		call ReisenNo204SpeedUpEnd()
		call SaveBoolean(udg_ht, StringHash("ReisenNo204SpellEffectTrigger"), StringHash("TriggeringFlag"), false)
		call DestroyTimer(t)
	endif     
	set target = null
	set t = null
endfunction
function Trig_ReisenNo204SpellEffect_Conditions takes nothing returns boolean
	return GetSpellAbilityId() == 'A0ZI'
endfunction
function Trig_ReisenNo204SpellEffect_Actions takes nothing returns nothing
	local unit caster = GetTriggerUnit()
	local integer level = GetUnitAbilityLevel(caster, GetSpellAbilityId())
	local real abilityCoolDown = 95 - level * 5
	local real abilityDuration = 8.0
	local timer t = CreateTimer()    
	call SaveUnitHandle(udg_ht, StringHash("ReisenNo204SpellEffectTrigger"), StringHash("Caster"), caster)
	call SaveInteger(udg_ht, StringHash("ReisenNo204SpellEffectTrigger"), StringHash("AbilityLevel"), level)
	call SaveReal(udg_ht, StringHash("ReisenNo204SpellEffectTrigger"), StringHash("Duration"), abilityDuration)
	call SaveBoolean(udg_ht, StringHash("ReisenNo204SpellEffectTrigger"), StringHash("TriggeringFlag"), true)
	if UnitHasItemOfTypeBJ(caster, 'I00B') then
		call Item_HeroAbilityCoolDownReset(caster, GetSpellAbilityId(), abilityCoolDown)
	endif
	call ReisenNo204SpeedUpBegin()
	call TimerStart(t, 0.01, true, function ReisenNo204SpellEffectTimerProc)    
	set caster = null
	set t = null
endfunction
function Trig_ReisenNo204Damage_Actions takes nothing returns nothing
	local unit caster = LoadUnitHandle(udg_ht, StringHash("ReisenNo204AttackTrigger"), StringHash("Attacker"))
	local real abilityDurationGained = 5.0
	local real abilityDuration = GetReisenNo204SpellEffectTriggerDuration()
	local trigger reisenNo204DamageTrigger = GetTriggeringTrigger()
	local triggeraction reisenNo204DamageTriggerAction = LoadTriggerActionHandle(udg_ht, StringHash("ReisenNo204AttackTrigger"), StringHash("DamageAction"))
	if GetTriggerEventId() == EVENT_UNIT_DAMAGED and GetEventDamageSource() == caster then
		if abilityDuration < abilityDurationGained then
			call SetReisenNo204SpellEffectTriggerDuration(abilityDurationGained)
		endif
	endif
	if GetTriggerEventId() != EVENT_UNIT_DAMAGED or GetEventDamageSource() == caster then
		call TriggerRemoveAction(reisenNo204DamageTrigger, reisenNo204DamageTriggerAction)
		call DestroyTrigger(reisenNo204DamageTrigger)
		call FlushChildHashtable(udg_ht, StringHash("ReisenNo204AttackTrigger"))
	endif
	set caster = null
	set reisenNo204DamageTrigger = null
	set reisenNo204DamageTriggerAction = null
endfunction
function Trig_ReisenNo204Attack_Conditions takes nothing returns boolean
	if GetUnitAbilityLevel(GetAttacker(),'A0ZI')== 0 then
		return false
	elseif IsReisenNo204SpellEffectTriggering() == false then
		return false
	elseif IsUnitType(GetTriggerUnit(), UNIT_TYPE_HERO) == false then
		return false
	elseif IsUnitAlly(GetTriggerUnit(), GetOwningPlayer(GetAttacker())) then
		return false
	elseif IsUnitIllusion(GetAttacker()) then
		return false
	endif
	return true
endfunction
function Trig_ReisenNo204Attack_Actions takes nothing returns nothing
	local unit caster = GetAttacker()
	local unit target = GetTriggerUnit()
	local trigger reisenNo204DamageTrigger = CreateTrigger()
	local triggeraction reisenNo204DamageTriggerAction = TriggerAddAction(reisenNo204DamageTrigger, function Trig_ReisenNo204Damage_Actions)
	call TriggerRegisterUnitEvent(reisenNo204DamageTrigger, target, EVENT_UNIT_DAMAGED)
	call TriggerRegisterUnitEvent(reisenNo204DamageTrigger, caster, EVENT_UNIT_ISSUED_ORDER)
	call TriggerRegisterUnitEvent(reisenNo204DamageTrigger, caster, EVENT_UNIT_ISSUED_POINT_ORDER)
	call TriggerRegisterUnitEvent(reisenNo204DamageTrigger, caster, EVENT_UNIT_ISSUED_TARGET_ORDER)
	call SaveTriggerActionHandle(udg_ht, StringHash("ReisenNo204AttackTrigger"), StringHash("DamageAction"), reisenNo204DamageTriggerAction)
	call SaveUnitHandle(udg_ht, StringHash("ReisenNo204AttackTrigger"), StringHash("Attacker"), GetAttacker())
	set caster = null
	set target = null
	set reisenNo204DamageTriggerAction = null
	set reisenNo204DamageTrigger = null
endfunction
function Trig_Initialing_ReisenNo2_Actions takes nothing returns nothing
	local unit h = GetCharacterHandle('E02E')
	local trigger reisenNo2ExAttackTrigger
	local trigger reisenNo2ExAttackedTrigger
	local trigger reisenNo201SpellEffectTrigger
	local trigger reisenNo202AttackedTrigger
	local trigger reisenNo202SpellEffectTrigger
	local trigger reisenNo203AttackTrigger
	local trigger reisenNo203KillTrigger
	local trigger reisenNo204AttackTrigger
	local trigger reisenNo204SpellEffectTrigger
	if h == null then
		return
	endif
	call DebugMsg(GetHeroProperName(h)+ "ܳʼ")
	call SaveUnitHandle(udg_ht, StringHash("InitialingReisenNo2Trigger"), StringHash("CharacterHandle"), h)
	call DestroyTrigger(GetTriggeringTrigger())
	call AccumulateReisenNo2ExDuration()
	set reisenNo2ExAttackTrigger = CreateTrigger()
	call TriggerRegisterAnyUnitEventBJ(reisenNo2ExAttackTrigger, EVENT_PLAYER_UNIT_ATTACKED)
	call TriggerAddCondition(reisenNo2ExAttackTrigger, Condition(function Trig_ReisenNo2ExAttack_Conditions))
	call TriggerAddAction(reisenNo2ExAttackTrigger, function Trig_ReisenNo2ExAttack_Actions)
	set reisenNo2ExAttackedTrigger = CreateTrigger()
	call TriggerRegisterUnitEvent(reisenNo2ExAttackedTrigger, h, EVENT_UNIT_DAMAGED)
	call TriggerAddCondition(reisenNo2ExAttackedTrigger, Condition(function Trig_ReisenNo2ExAttacked_Conditions))
	call TriggerAddAction(reisenNo2ExAttackedTrigger, function Trig_ReisenNo2ExAttacked_Actions)
	set reisenNo201SpellEffectTrigger = CreateTrigger()
	call TriggerRegisterUnitEvent(reisenNo201SpellEffectTrigger, h, EVENT_UNIT_SPELL_EFFECT)
	call TriggerAddCondition(reisenNo201SpellEffectTrigger, Condition(function Trig_ReisenNo201SpellEffect_Conditions))
	call TriggerAddAction(reisenNo201SpellEffectTrigger, function Trig_ReisenNo201SpellEffect_Actions)
	set reisenNo202AttackedTrigger = CreateTrigger()
	call TriggerRegisterUnitEvent(reisenNo202AttackedTrigger, h, EVENT_UNIT_DAMAGED)
	call TriggerAddCondition(reisenNo202AttackedTrigger, Condition(function Trig_Reisen202Attacked_Conditions))
	call TriggerAddAction(reisenNo202AttackedTrigger, function Trig_Reisen202Attacked_Actions)
	set reisenNo202SpellEffectTrigger = CreateTrigger()
	call TriggerRegisterUnitEvent(reisenNo202SpellEffectTrigger, h, EVENT_UNIT_SPELL_EFFECT)
	call TriggerAddCondition(reisenNo202SpellEffectTrigger, Condition(function Trig_Reisen202SpellEffect_Conditions))
	call TriggerAddAction(reisenNo202SpellEffectTrigger, function Trig_Reisen202SpellEffect_Actions)
	set reisenNo203AttackTrigger = CreateTrigger()
	call TriggerRegisterAnyUnitEventBJ(reisenNo203AttackTrigger, EVENT_PLAYER_UNIT_ATTACKED)
	call TriggerAddCondition(reisenNo203AttackTrigger, Condition(function Trig_Reisen203Attack_Conditions))
	call TriggerAddAction(reisenNo203AttackTrigger, function Trig_Reisen203Attack_Actions)
	set reisenNo203KillTrigger = CreateTrigger()
	call TriggerRegisterAnyUnitEventBJ(reisenNo203KillTrigger, EVENT_PLAYER_UNIT_DEATH)
	call TriggerAddCondition(reisenNo203KillTrigger, Condition(function Trig_Reisen203Kill_Conditions))
	call TriggerAddAction(reisenNo203KillTrigger, function Trig_Reisen203Kill_Actions)
	set reisenNo204AttackTrigger = CreateTrigger()
	call TriggerRegisterAnyUnitEventBJ(reisenNo204AttackTrigger, EVENT_PLAYER_UNIT_ATTACKED)
	call TriggerAddCondition(reisenNo204AttackTrigger, Condition(function Trig_ReisenNo204Attack_Conditions))
	call TriggerAddAction(reisenNo204AttackTrigger, function Trig_ReisenNo204Attack_Actions)
	set reisenNo204SpellEffectTrigger = CreateTrigger()
	call TriggerRegisterUnitEvent(reisenNo204SpellEffectTrigger, h, EVENT_UNIT_SPELL_EFFECT)
	call TriggerAddCondition(reisenNo204SpellEffectTrigger , Condition(function Trig_ReisenNo204SpellEffect_Conditions))
	call TriggerAddAction(reisenNo204SpellEffectTrigger, function Trig_ReisenNo204SpellEffect_Actions)
	set h = null
	set reisenNo2ExAttackTrigger = null
	set reisenNo2ExAttackedTrigger = null
	set reisenNo202AttackedTrigger = null
	set reisenNo202SpellEffectTrigger = null
	set reisenNo203AttackTrigger = null
	set reisenNo203KillTrigger = null
	set reisenNo204AttackTrigger = null
	set reisenNo204SpellEffectTrigger = null
endfunction
function InitTrig_Initialing_ReisenNo2 takes nothing returns nothing
	set gg_trg_Initialing_ReisenNo2 = CreateTrigger()
	call TriggerAddAction(gg_trg_Initialing_ReisenNo2, function Trig_Initialing_ReisenNo2_Actions)
endfunction