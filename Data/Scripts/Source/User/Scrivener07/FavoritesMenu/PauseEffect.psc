Scriptname Scrivener07:FavoritesMenu:PauseEffect Extends ActiveMagicEffect

InputEnableLayer InputLayer

Event OnInit()
	InputLayer = InputEnableLayer.Create()
EndEvent

Event OnEffectStart(Actor akTarget, Actor akCaster)
	Debug.Notification("OnEffectStart")
	SFM_SlowTime.Cast(akTarget)
	InputLayer.EnableCamSwitch(false)
	InputLayer.EnableLooking(false)
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	Debug.Notification("OnEffectFinish")
	akTarget.DispelSpell(SFM_SlowTime)
	InputLayer.Reset()
EndEvent

Group AutoFill
	Spell Property SFM_SlowTime Auto Const Mandatory
EndGroup