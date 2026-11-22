ovr303		segment	para public 'OVERLAY' use16
		assume cs:ovr303
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_AD570		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	[bp+arg_2]
		push	si
		call	sub_74135
		add	sp, 4
		cmp	word ptr [si+26h], 0
		jz	short loc_AD5A3
		mov	ax, si
		add	ax, 2Dh
		push	ax
		push	word ptr [si+26h]
		call	AI_ComputeGeometryHelper_58BF2
		add	sp, 4
		mov	bx, [si+26h]
		or	byte ptr [bx+30h], 2
		jmp	short loc_AD5AC

loc_AD5A3:
		push	0C021h
		call	sub_1DDFE
		pop	cx

loc_AD5AC:
		push	word ptr [si+24h]
		mov	bx, [si+24h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax
		mov	ax, si
		add	ax, 2Dh
		push	ax
		call	WorldObject_ApplyOrientationVariantA_59533
		add	sp, 4
		cmp	dword ptr [si+0Ah], 0
		jz	short loc_AD5DE
		push	large [si+0Ah]
		les	bx, [si+0Ah]
		mov	bx, es:[bx]
		call	dword ptr [bx+20h]
		add	sp, 4

loc_AD5DE:
		cmp	word ptr [si+1Eh], 0
		jz	short loc_AD5ED
		push	word ptr [si+1Eh]
		call	Container_Op_1F06D
		pop	cx

loc_AD5ED:
		pop	si
		pop	bp
		retf
sub_AD570		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à AI_ComputeGeometryWrapper_9D095 (sub_9D095 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; appelle AI_ComputeGeometryHelper_56E29.
; ==============================================================================================
AI_ComputeGeometryWrapper_AD5F0		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+7Ch]
		pop	cx
		push	ax
		mov	ax, si
		add	ax, 2Dh
		push	ax
		call	AI_ComputeGeometryHelper_58BF2
		add	sp, 4
		push	si
		call	sub_7413A
		pop	cx
		pop	si
		pop	bp
		retf
AI_ComputeGeometryWrapper_AD5F0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_AD617		proc far

arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	al, [bp+arg_2]
		mov	[si+51h], al
		pop	si
		pop	bp
		retf
sub_AD617		endp
ovr303		ends
