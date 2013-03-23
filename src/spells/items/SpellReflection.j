//TESH.scrollpos=2
//TESH.alwaysfold=0
scope SpellReflection initializer init
    
globals
    private constant integer    SPELL_ID = 'A0CB'
    private constant integer    DUMMY_ID = 'h02U'
endglobals

private function Spell_Reflection_Condition takes nothing returns boolean
    if ( not ( UnitHasBuffBJ(GetSpellTargetUnit(), SPELL_ID) == true ) ) then
        return false
    endif
    if ( not ( IsUnitEnemy(GetTriggerUnit(), GetOwningPlayer(GetSpellTargetUnit())) == true ) ) then
        return false
    endif
    if ( not ( GetUnitTypeId(GetTriggerUnit()) != DUMMY_ID ) ) then
        return false
    endif
    return true
endfunction

private function Spell_Reflection takes unit caster, unit target, integer abilityid returns nothing
    local unit dummy
    local real x
    local real y
    local integer order
    local integer level = GetUnitAbilityLevel(caster, abilityid)
    if GetRandomInt(1, 100) <= 35 then
        set order = GetUnitCurrentOrder(caster)
        set x = GetUnitX(target)+100*Cos(GetUnitFacing(target)*bj_DEGTORAD)
        set y = GetUnitY(target)+100*Sin(GetUnitFacing(target)*bj_DEGTORAD)       
        set dummy = CreateUnit(GetOwningPlayer(target), DUMMY_ID, x, y, GetUnitFacing(target))
        call UnitApplyTimedLife(dummy, 'BTLF', 2.0)
        call UnitAddAbility(dummy, abilityid)
        call SetUnitAbilityLevel(dummy, abilityid, level)
        call IssueTargetOrderById(dummy, order, caster)
        set dummy = null
    endif    
endfunction

private function doit takes nothing returns boolean
    if ( Spell_Reflection_Condition() != false ) then
        call Spell_Reflection(GetTriggerUnit(), GetSpellTargetUnit(), GetSpellAbilityId())
    endif
    return false
endfunction

private function init takes nothing returns nothing
    local trigger t = CreateTrigger()      
    call TriggerRegisterAnyUnitEventBJ(t, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddCondition(t, Condition(function doit))
    set t = null
endfunction

endscope