ovr323		segment	para public 'OVERLAY' use16
		assume cs:ovr323
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B1B10		proc far

var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	55h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_B1B49
		push	ax
		call	sub_3B1B6
		pop	cx
		mov	word ptr [si], 28DEh
		push	large [bp+var_4]
		push	si
		nop
		push	cs
		call	near ptr sub_B1BAB
		add	sp, 6
		mov	ax, si
		jmp	short loc_B1B4B

loc_B1B49:
		mov	ax, si

loc_B1B4B:
		mov	si, ax
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 36h
		mov	word ptr [bp+var_8+2], ax
		mov	word ptr [bp+var_8], dx
		mov	eax, [bp+var_8]
		mov	[si+6], eax
		mov	ax, si
		pop	si
		leave
		retf
sub_B1B10		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; IFF_LoadAngleParam_Wrapper (sub_460E8 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far,16L — wrapper direct vers IFF_LoadAngleParam
; (sub_3C942, seg084) : chargement d'un paramètre angulaire IFF, appelé depuis le chargeur de
; modèle principal.
; ==============================================================================================
IFF_LoadAngleParam_Wrapper_B1B69		proc far

arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	[bp+arg_4]
		push	large [bp+arg_0]
		call	sub_3B14C
		add	sp, 6
		pop	bp
		retf
IFF_LoadAngleParam_Wrapper_B1B69		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B1B7D		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, si
		add	ax, 2Dh
		push	ax
		call	Matrix_BuildFromAngle_58B3B
		pop	cx
		push	0
		push	si
		call	sub_7434A
		add	sp, 4
		or	byte ptr [si+2], 10h
		and	byte ptr [si+2], 0FDh
		mov	word ptr [si+52h], 0
		pop	si
		pop	bp
		retf
sub_B1B7D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B1BAB		proc far

arg_0		= word ptr  6
arg_2		= dword ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		push	cs
		call	near ptr sub_B1B7D
		pop	cx
		push	large [bp+arg_2]
		push	si
		call	sub_36985
		add	sp, 6
		and	byte ptr [si+2], 0FDh
		pop	si
		pop	bp
		retf
sub_B1BAB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B1BCC		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_B1BF5
		push	0
		push	si
		call	sub_3B2B9
		add	sp, 4
		test	di, 1
		jz	short loc_B1BF5
		push	si
		call	sub_3B2
		pop	cx
		jmp	short loc_B1BF5

loc_B1BF5:
		pop	di
		pop	si
		pop	bp
		retf
sub_B1BCC		endp
ovr323		ends
