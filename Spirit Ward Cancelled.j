
//===========================================================================
function Trig_spirit_ward_cancelled_Conditions takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetCancelledStructure()) == UNIT_SPIRIT_WARD ) ) then
        return false
    endif
    if ( not ( udg_STARTED == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_spirit_ward_cancelled_Actions takes nothing returns nothing
    call CreateItemLoc( ITEM_SPIRIT_WARD_KIT, GetUnitLoc(GetCancelledStructure()) )
endfunction

//===========================================================================
function InitTrig_spirit_ward_cancelled takes nothing returns nothing
    set gg_trg_spirit_ward_cancelled = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_spirit_ward_cancelled, EVENT_PLAYER_UNIT_CONSTRUCT_CANCEL )
    call TriggerAddCondition( gg_trg_spirit_ward_cancelled, Condition( function Trig_spirit_ward_cancelled_Conditions ) )
    call TriggerAddAction( gg_trg_spirit_ward_cancelled, function Trig_spirit_ward_cancelled_Actions )
endfunction

//===========================================================================
