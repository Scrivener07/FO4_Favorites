Scriptname Favorites:SettingsReference Extends ObjectReference Const


; Events
;---------------------------------------------

; Event is sent to the player
Event OnHolotapePlay(ObjectReference akTerminalRef)
	Debug.MessageBox(self + " was just played on terminal " + akTerminalRef)
EndEvent
