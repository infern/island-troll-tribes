
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_Ship_2_Ordered_Object_Conditions takes nothing returns boolean
    return GetOrderedUnit() == udg_ship2
endfunction

function Trig_Ship_2_Ordered_Object_Actions takes nothing returns nothing
local real X = LoadReal(udg_GameHash, StringHash("ship2"), StringHash("X"))
local real Y = LoadReal(udg_GameHash, StringHash("ship2"), StringHash("Y"))
local timer t
if SHIP2_STOPPED then
    set t = NewTimer()
    call TimerStart(t,0,false, function shipStop2)
    set t = null
else
    call IssuePointOrder( udg_ship2, "move", X, Y) 
endif
endfunction

//===========================================================================
function InitTrig_Ship_2_Ordered_Object takes nothing returns nothing
    set gg_trg_Ship_2_Ordered_Object = CreateTrigger(  )
    call TriggerRegisterPlayerUnitEvent(gg_trg_Ship_2_Ordered_Object, Player(15), EVENT_PLAYER_UNIT_ISSUED_TARGET_ORDER, null)
    call TriggerAddCondition( gg_trg_Ship_2_Ordered_Object, Condition( function Trig_Ship_2_Ordered_Object_Conditions ) )
    call TriggerAddAction( gg_trg_Ship_2_Ordered_Object, function Trig_Ship_2_Ordered_Object_Actions )
endfunction

//===========================================================================
