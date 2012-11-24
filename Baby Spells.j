
//===========================================================================
function Trig_Baby_Spells_Actions takes nothing returns nothing

    local player p=GetOwningPlayer(udg_parameterUnit)
    call SetPlayerAbilityAvailableBJ( false, SPELL_PET_TAME, p )//tame
    call SetPlayerAbilityAvailableBJ( true, SPELL_PET_RELEASE, p )//release
    call SetPlayerAbilityAvailableBJ( true, SPELL_PET_FOLLOW, p )//Follow
    call SetPlayerAbilityAvailableBJ( true, 'A01D', p )//stay
    call SetPlayerAbilityAvailableBJ( false, SPELL_PET_SLEEP, p )//sleep
    call SetPlayerAbilityAvailableBJ( false, SPELL_PET_ATTACK, p )//attack
    call SetPlayerAbilityAvailableBJ( false, SPELL_PET_SCOUT, p )//scout
    call SetPlayerAbilityAvailableBJ( false, SPELL_PET_BRING_ITEMS, p )//bring items
    call SetPlayerAbilityAvailableBJ( false, SPELL_PET_GO_TO_HATCHERY, p )//go to hatchery
    call SetPlayerAbilityAvailableBJ( false, SPELL_PET_DROP_ITEMS, p )//drop items
    set p=null
endfunction

//===========================================================================
function InitTrig_Baby_Spells takes nothing returns nothing
    set gg_trg_Baby_Spells = CreateTrigger(  )
    call TriggerAddAction( gg_trg_Baby_Spells, function Trig_Baby_Spells_Actions )
endfunction

//===========================================================================
