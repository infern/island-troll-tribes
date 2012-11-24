
//
// enabled in 6v6
//===========================================================================
function Trig_spirit_ward_selection_6v6_Conditions takes nothing returns boolean
    if ( not ( IsUnitAlly(GetTriggerUnit(), GetTriggerPlayer()) == true ) ) then
        return false
    endif
    if ( not ( GetUnitTypeId(GetTriggerUnit()) == UNIT_SPIRIT_WARD ) ) then
        return false
    endif
    if ( not ( udg_revivingForce1 == false ) ) then
        return false
    endif
    return true
endfunction

function Trig_spirit_ward_selection_6v6_Actions takes nothing returns nothing
    call SetUnitOwner( GetTriggerUnit(), GetTriggerPlayer(), false )
endfunction

//===========================================================================
function InitTrig_spirit_ward_selection_6v6 takes nothing returns nothing
    set gg_trg_spirit_ward_selection_6v6 = CreateTrigger(  )
    call DisableTrigger( gg_trg_spirit_ward_selection_6v6 )
    call TriggerRegisterPlayerSelectionEventBJ( gg_trg_spirit_ward_selection_6v6, Player(0), true )
    call TriggerRegisterPlayerSelectionEventBJ( gg_trg_spirit_ward_selection_6v6, Player(1), true )
    call TriggerRegisterPlayerSelectionEventBJ( gg_trg_spirit_ward_selection_6v6, Player(2), true )
    call TriggerRegisterPlayerSelectionEventBJ( gg_trg_spirit_ward_selection_6v6, Player(3), true )
    call TriggerRegisterPlayerSelectionEventBJ( gg_trg_spirit_ward_selection_6v6, Player(4), true )
    call TriggerRegisterPlayerSelectionEventBJ( gg_trg_spirit_ward_selection_6v6, Player(5), true )
    call TriggerAddCondition( gg_trg_spirit_ward_selection_6v6, Condition( function Trig_spirit_ward_selection_6v6_Conditions ) )
    call TriggerAddAction( gg_trg_spirit_ward_selection_6v6, function Trig_spirit_ward_selection_6v6_Actions )
endfunction

//===========================================================================
