ovr306		segment	para public 'OVERLAY' use16
		assume cs:ovr306
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_AD9D0		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	word ptr [si+6Ah], 0
		and	byte ptr [si+77h], 0FEh
		mov	word ptr [si+71h], 0FFFFh
		or	byte ptr [si+2], 8
		or	byte ptr [si+2], 40h
		mov	word ptr [si+78h], 0
		pop	si
		pop	bp
		retf
sub_AD9D0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Camera_InitAndGetHandleWrapper_9D4B5 (sub_9D4B5 de STRIKE.EXE). Résumé repris de STRIKE.EXE
; ; appelants et contexte à revérifier ici. — far, appelle Camera_InitAndGetHandle.
; ==============================================================================================
Camera_InitAndGetHandleWrapper_AD9F5		proc far

arg_0		= word ptr  6
arg_2		= dword ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	large [bp+arg_2]
		push	si
		call	Camera_InitAndGetHandle
		add	sp, 6
		push	si
		push	cs
		call	near ptr sub_AD9D0
		pop	cx
		pop	si
		pop	bp
		retf
Camera_InitAndGetHandleWrapper_AD9F5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à WorldObject_LoadAIProfileViaEntity_9D4D2 (sub_9D4D2 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; prend l'objet monde (arg near) et appelle AIAircraft_LoadProfileGuarded_73940 (via
; VROOMM_StubThunk_6AB07) avec l'entité IA stockée à +0x55 de cet objet. Appelée par
; AIAircraft_SpawnAndConditionalLoadProfile_53363 (via VROOMM_StubThunk_6C23A). Anciennement
; Camera_Helper4.
; ==============================================================================================
WorldObject_LoadAIProfileViaEntity_ADA12		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	bx, ax
		push	large [bx+5Ah]
		call	sub_72FAF
		add	sp, 4
		pop	bp
		retf
WorldObject_LoadAIProfileViaEntity_ADA12		endp
ovr306		ends
