seg123		segment	byte public 'CODE' use16
		assume cs:seg123
		;org 2
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Struct_GetElementCountMinusOne_625CC (sub_625CC de STRIKE.EXE). Résumé repris de STRIKE.EXE
; ; appelants et contexte à revérifier ici. — far, lit le champ +4 (taille en octets) d'une
; structure via pointeur far, le divise par 4 et soustrait 1 — retourne l'index du dernier
; élément d'un tableau de dwords. Référencée par ParticleEmitter_PeriodicUpdate_4C413 (seg106)
; et CachedObject_BuildAndTransform_5DEC9 (seg141).
; ==============================================================================================
Struct_GetElementCountMinusOne_33352	proc far		; CODE XREF: sub_4A1D+20P seg014:125AP ...

arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	ds

loc_33357:				; DATA XREF: seg170:04AEo
		lds	si, [bp+arg_0]
		mov	ax, [si+4]
		shr	ax, 1
		shr	ax, 1
		dec	ax
		pop	ds
		pop	si
		pop	bp
		retf	4
Struct_GetElementCountMinusOne_33352	endp

seg123		ends
