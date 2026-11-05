ovr203		segment	para public 'OVERLAY' use16
		assume cs:ovr203
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_726B0		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	[bp+arg_2]
		push	si
		call	sub_58F75
		add	sp, 4
		cmp	word ptr [si+26h], 0
		jz	short loc_726E3
		mov	ax, si
		add	ax, 2Dh
		push	ax
		push	word ptr [si+26h]
		call	AI_ComputeGeometryHelper_3B608
		add	sp, 4
		mov	bx, [si+26h]
		or	byte ptr [bx+30h], 2
		jmp	short loc_726EC

loc_726E3:
		push	0C021h
		call	sub_9D47
		pop	cx

loc_726EC:
		push	word ptr [si+24h]
		mov	bx, [si+24h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax
		mov	ax, si
		add	ax, 2Dh
		push	ax
		call	WorldObject_ApplyOrientationVariantA_3BF49
		add	sp, 4
		cmp	dword ptr [si+0Ah], 0
		jz	short loc_7271E
		push	large [si+0Ah]
		les	bx, [si+0Ah]
		mov	bx, es:[bx]
		call	dword ptr [bx+20h]
		add	sp, 4

loc_7271E:
		cmp	word ptr [si+1Eh], 0
		jz	short loc_7272D
		push	word ptr [si+1Eh]
		call	Container_Op_371BC
		pop	cx

loc_7272D:
		pop	si
		pop	bp
		retf
sub_726B0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; AI_ComputeGeometryWrapper_AD5F0 (sub_AD5F0 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : même suite d'instructions,
; 2 opérande(s) différent(s) (adresses de données ou constantes) — à vérifier à
; AI_ComputeGeometryWrapper_9D095 (sub_9D095 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, appelle AI_ComputeGeometryHelper_56E29.
; ==============================================================================================
AI_ComputeGeometryWrapper_72730		proc far

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
		call	AI_ComputeGeometryHelper_3B608
		add	sp, 4
		push	si
		call	sub_58F7A
		pop	cx
		pop	si
		pop	bp
		retf
AI_ComputeGeometryWrapper_72730		endp
ovr203		ends
