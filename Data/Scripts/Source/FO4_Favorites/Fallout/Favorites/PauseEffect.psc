Scriptname Favorites:PauseEffect Extends ActiveMagicEffect

InputEnableLayer InputLayer


; Events
;---------------------------------------------

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


; Properties
;---------------------------------------------

Group Properties
	Spell Property SFM_SlowTime Auto Const Mandatory
EndGroup
