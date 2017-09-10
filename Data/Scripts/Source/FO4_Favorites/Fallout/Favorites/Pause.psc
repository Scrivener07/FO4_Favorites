Scriptname Fallout:Favorites:Pause extends Papyrus:Project:Modules:Required
import Papyrus:Diagnostics:Log

UserLog Log

string FavoritesMenu = "FavoritesMenu" Const
InputEnableLayer InputLayer


; Events
;---------------------------------------------

Event OnInitialize()
	Log = LogNew(Context.Title, self)
	InputLayer = InputEnableLayer.Create()
EndEvent


Event OnEnable()
	WriteLine(Log, "Enabling..")
	RegisterForMenuOpenCloseEvent(FavoritesMenu)
EndEvent


Event OnDisable()
	WriteLine(Log, "Disabling..")
	UnregisterForMenuOpenCloseEvent(FavoritesMenu)
	Player.RemoveSpell(Fallout_Favorites_Pause)
	InputLayer.Reset()
EndEvent


Event OnMenuOpenCloseEvent(string asMenuName, bool abOpening)
	WriteLine(Log, "The menu '"+asMenuName+"' is opening equals '"+abOpening+"'.")
	If (abOpening)
		If (Player.IsInCombat())
			bool bSneaking = Player.IsSneaking()

			Player.AddSpell(Fallout_Favorites_Pause, false)
			InputLayer.EnableLooking(false)

			If (bSneaking)
				Player.StartSneaking()
				WriteLine(Log, "Reapplying the players sneak state.")
			EndIf

			WriteLine(Log, "The favorites pause spell has been cast on the player.")
		Else
			WriteLine(Log, "The player must be in combat to pause the favorites menu.")
		EndIf
	Else
		Player.RemoveSpell(Fallout_Favorites_Pause)
		InputLayer.Reset()
		WriteLine(Log, "The favorites pause spell has been removed from the player.")
	EndIf
EndEvent


; Properties
;---------------------------------------------

Group Properties
	Spell Property Fallout_Favorites_Pause Auto Const Mandatory
EndGroup
