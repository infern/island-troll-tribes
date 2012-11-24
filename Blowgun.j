
//===========================================================================
//TESH.scrollpos=2
//TESH.alwaysfold=0
function QMBlowGun takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A06J' ) ) then
        return false
    endif
    return true
endfunction

function QMClayBall takes nothing returns boolean
    return ( GetItemTypeId(GetFilterItem()) == ITEM_CLAY_BALL ) and ( GetWidgetLife(GetFilterItem()) > 0)
endfunction

function QMBlowGunAct takes nothing returns nothing
local integer slotsNeeded=2
local real range=700
local unit u=GetSpellAbilityUnit()
local item i = null
    if((UnitInventorySizeBJ(u) - UnitInventoryCount(u)) >= slotsNeeded) then
        call cleanInventory(u)
        set i = RandomItemInRectBJ(GetRectFromCircleBJ(GetUnitLoc(u), range),Condition(function QMStick))
        call UnitAddItemSwapped( i, u )
        set i = null
        
        set i = RandomItemInRectBJ(GetRectFromCircleBJ(GetUnitLoc(u), range),Condition(function QMClayBall))
        call UnitAddItemSwapped( i, u )
        set i = null
    endif
set u=null
endfunction

//===========================================================================
function InitTrig_Blowgun takes nothing returns nothing
    set gg_trg_Blowgun = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_Blowgun, EVENT_PLAYER_UNIT_SPELL_FINISH )
    call TriggerAddCondition( gg_trg_Blowgun, Condition( function QMBlowGun ) )
    call TriggerAddAction( gg_trg_Blowgun, function QMBlowGunAct )
endfunction//===========================================================================
