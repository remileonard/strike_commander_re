ovr244		segment	para public 'OVERLAY' use16
		assume cs:ovr244
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Input_ReadJoystickButtons_7AC70 (sub_7AC70 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; combine Joystick_GetAxisMin_67BC9/GetAxisMax_67BD8/TestButtonMasked_67B6C (seg208) — lecture
; combinée des axes et boutons joystick.
; ==============================================================================================
Input_ReadJoystickButtons_8A880		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		cmp	byte_7CAC6, 0
		jz	short loc_8A8D0
		push	0
		call	sub_5292
		pop	cx
		sar	ax, 1
		mov	[bp+var_4], ax
		push	0
		call	sub_52A1
		pop	cx
		sar	ax, 1
		mov	[bp+var_2], ax
		push	[bp+arg_2]
		push	[bp+var_4]
		push	ax
		push	si
		call	sub_16738
		add	sp, 8
		push	1
		push	0
		call	sub_5235
		add	sp, 4
		or	al, al
		jz	short loc_8A8D0
		mov	byte ptr [si+17Ch], 1

loc_8A8D0:
		pop	si
		leave
		retf
Input_ReadJoystickButtons_8A880		endp
ovr244		ends
