ovr279		segment	para public 'OVERLAY' use16
		assume cs:ovr279
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; AircraftComponent_Helper2_971A0 (sub_971A0 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, aucun appel externe visible (29 lignes).
; ==============================================================================================
AircraftComponent_Helper2_A5910		proc far

arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_4]
		push	si
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr AircraftComponent_LoadMixedFieldsC_A5934
		add	sp, 6
		push	si
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr AircraftComponent_LoadWithDwordFieldsD_A5985
		add	sp, 6
		pop	si
		pop	bp
		retf
AircraftComponent_Helper2_A5910		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; AircraftComponent_LoadMixedFieldsC_971C4 (sub_971C4 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, combine ReadFieldGroupB_64A54 ×2
; et ReadFinalField_64B51 (39 lignes).
; ==============================================================================================
AircraftComponent_LoadMixedFieldsC_A5934		proc far

arg_0		= word ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_4]
		push	0
		push	large 4F464E49h
		push	si
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_A5982
		push	si
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		les	bx, [bp+arg_0]
		mov	es:[bx+2], ax
		push	si
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		les	bx, [bp+arg_0]
		mov	es:[bx+4], ax
		push	si
		call	ResourceRecord_ReadFinalField_6DBCA
		pop	cx
		les	bx, [bp+arg_0]
		mov	es:[bx+16h], al
		mov	eax, [si+76h]
		mov	[si+65h], eax

loc_A5982:
		pop	si
		pop	bp
		retf
AircraftComponent_LoadMixedFieldsC_A5934		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 7 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à AircraftComponent_LoadWithDwordFieldsD_97215
; (sub_97215 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far, variante de AircraftComponent_LoadWithDwordFields_94D40 (130 lignes).
; ==============================================================================================
AircraftComponent_LoadWithDwordFieldsD_A5985		proc far

var_28		= dword ptr -28h
var_24		= dword ptr -24h
var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 28h
		push	si
		mov	si, [bp+arg_4]
		push	0
		push	large 50414853h
		push	si
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jnz	short loc_A59A7
		jmp	loc_A5AD2

loc_A59A7:
		mov	eax, [si+72h]
		mov	[bp+var_4], eax
		push	1
		push	0
		push	3
		push	eax
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		les	bx, [bp+arg_0]
		mov	eax, [bp+var_8]
		mov	es:[bx+8], eax
		mov	byte ptr es:[bx+0Ch], 3
		mov	byte ptr es:[bx+0Dh], 1
		mov	dword ptr es:[bx+0Eh], 0
		mov	eax, [bp+var_4]
		mov	es:[bx+0Eh], eax
		push	0
		mov	al, es:[bx+0Ch]
		push	ax
		push	large es:[bx+8]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	si
		call	ResourceRecord_ReadDwordFieldB_6DB78
		add	sp, 6
		push	0
		les	bx, [bp+arg_0]
		mov	al, es:[bx+0Ch]
		push	ax
		push	large es:[bx+8]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		call	sub_68060
		les	bx, [bp+arg_0]
		mov	es:[bx+12h], ax
		push	0
		mov	al, es:[bx+0Ch]
		push	ax
		push	large es:[bx+8]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		call	Text_ComputeMaxLineWidth_68019
		les	bx, [bp+arg_0]
		mov	es:[bx+14h], ax
		mov	ax, es:[bx+12h]
		sar	ax, 1
		movsx	eax, ax
		mov	[bp+var_14], eax
		mov	ax, es:[bx+14h]
		sar	ax, 1
		movsx	eax, ax
		mov	[bp+var_18], eax
		mov	eax, [bp+var_14]
		shl	eax, 8
		mov	[bp+var_1C], eax
		mov	eax, [bp+var_1C]
		mov	[bp+var_10], eax
		mov	eax, [bp+var_18]
		shl	eax, 8
		mov	[bp+var_20], eax
		mov	eax, [bp+var_20]
		mov	[bp+var_C], eax
		push	large 0
		push	eax
		push	large [bp+var_10]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_24], eax
		mov	[bp+var_28], eax
		mov	ax, word ptr [bp+var_28+1]
		les	bx, [bp+arg_0]
		mov	es:[bx+6], ax
		mov	eax, [si+76h]
		mov	[si+65h], eax

loc_A5AD2:
		pop	si
		leave
		retf
AircraftComponent_LoadWithDwordFieldsD_A5985		endp
ovr279		ends
