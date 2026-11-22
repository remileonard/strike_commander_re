seg079		segment	byte public 'CODE' use16
		assume cs:seg079
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; SmallObject_RegisterInList_5D999 (sub_5D999 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, construit un petit objet (3 octets, sub_658)
; et le chaîne dans une liste globale (word_70E60), uniquement si un indicateur de validité
; (di) est non nul. Référencée par sub_1C5D8 et seg032 (zoom carte/radar).
; ==============================================================================================
SmallObject_RegisterInList_2CB40	proc far		; CODE XREF: sub_502B+74P seg046:014DP ...

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si

loc_2CB47:				; DATA XREF: seg170:0346o
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jnz	short loc_2CB60
		push	3
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_2CB74

loc_2CB60:				; CODE XREF: SmallObject_RegisterInList_2CB40+10j
		cmp	word ptr [di], 0
		jz	short loc_2CB74
		mov	ax, word_46F44
		mov	[si+1],	ax
		mov	[bp+var_2], di
		mov	ax, [bp+var_2]
		mov	word_46F44, ax

loc_2CB74:				; CODE XREF: SmallObject_RegisterInList_2CB40+1Ej
					; SmallObject_RegisterInList_2CB40+23j
		mov	ax, si
		pop	di
		pop	si
		leave
		retf
SmallObject_RegisterInList_2CB40	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; SmallObject_UnregisterFromList_5D9D3 (sub_5D9D3 de STRIKE.EXE). Résumé repris de STRIKE.EXE
; ; appelants et contexte à revérifier ici. — far, retire/libère (sub_338) un objet de la
; liste globale gérée par SmallObject_RegisterInList_5D999. Référencée par sub_1C5D8.
; ==============================================================================================
SmallObject_UnregisterFromList_2CB7A	proc far		; CODE XREF: sub_502B+20DP
					; sub_502B+239P ...

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	dx, [bp+arg_2]
		or	si, si
		jz	short loc_2CBA1
		mov	ax, [si+1]
		mov	[bp+var_2], ax
		mov	word_46F44, ax
		test	dx, 1
		jz	short loc_2CBA1
		push	si
		call	sub_308
		pop	cx

loc_2CBA1:				; CODE XREF: SmallObject_UnregisterFromList_2CB7A+Fj
					; SmallObject_UnregisterFromList_2CB7A+1Ej
		pop	si
		leave
		retf
SmallObject_UnregisterFromList_2CB7A	endp

seg079		ends
