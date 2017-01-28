Scriptname Scrivener07:FavoritesMenu:SettingsReference Extends ObjectReference Const

; Event is sent to the player
Event OnHolotapePlay(ObjectReference akTerminalRef)
	Debug.MessageBox(self + " was just played on terminal " + akTerminalRef)
endEvent