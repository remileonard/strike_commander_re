seg176		segment	byte public 'CODE' use16
		assume cs:seg176
		;org 0Ch
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, lit le champ +4 (taille en octets) d'une structure via pointeur far, le divise par 4 et
; soustrait 1 — retourne l'index du dernier élément d'un tableau de dwords. Référencée par
; ParticleEmitter_PeriodicUpdate_4C413 (seg106) et CachedObject_BuildAndTransform_5DEC9
; (seg141).
; ==============================================================================================
Struct_GetElementCountMinusOne_625CC	proc far		; CODE XREF: ParticleEmitter_PeriodicUpdate+145P
					; CachedObject_BuildAndTransform_5DEC9+3FP ...

arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	ds

loc_625D1:
		lds	si, [bp+arg_0]

loc_625D4:
		mov	ax, [si+4]
		shr	ax, 1
		shr	ax, 1
		dec	ax
		pop	ds
		pop	si
		pop	bp

locret_625DF:
		retf	4
Struct_GetElementCountMinusOne_625CC	endp

seg176		ends
