Scriptname Scrivener07:FavoritesMenu:MainAliasPlayer Extends ReferenceAlias Conditional

; http://hastebin.com/raw/olezeqimag
; search: fQuestCinematicObjectivePauseTime

; Fields
;---------------------------------------------------------------------------------------------------
string ModName = "Slow Favorites Menu" Const
string FavoritesMenu = "FavoritesMenu" Const

; Methods
;---------------------------------------------------------------------------------------------------

Event OnInit()
	OnPlayerLoadGame()
	RegisterForMenuOpenCloseEvent(FavoritesMenu)
EndEvent

Event OnPlayerLoadGame()
	If(PlayerRef.HasSpell(SFM_FavoritesSpell) == false)
		PlayerRef.AddSpell(SFM_FavoritesSpell, abVerbose = false)
	EndIf
EndEvent

Event OnMenuOpenCloseEvent(string asMenuName, bool abOpening)
	If(asMenuName == FavoritesMenu)
		If(abOpening)
			SFM_FavoritesSpell.Cast(PlayerRef)
		Else
			PlayerRef.DispelSpell(SFM_FavoritesSpell)
		EndIf
	EndIf
EndEvent

; Properties
;---------------------------------------------------------------------------------------------------
Group AutoFill
	Actor Property PlayerRef Auto Const Mandatory
;	Holotape Property SFM_Holotape Auto Const Mandatory
	Spell Property SFM_FavoritesSpell Auto Const Mandatory
EndGroup
