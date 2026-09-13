seg111		segment	byte public 'CODE' use16
		assume cs:seg111
		;org 4
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, avance un index de trame cyclique (modulo compteur +6) dans une table d'images (stride
; 6 octets, base +8), copie la trame courante (dword+2 octets) dans l'objet (+0,+4,+5).
; ==============================================================================================
Anim_AdvanceFrameCycle_4FB84	proc far		; CODE XREF: Anim_UpdateFrameCycleArray_4FBC3+19p
					; TextCycler_AdvanceRandomA_A7245+BFP ...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	word ptr [si+6], 0
		jle	short loc_4FBBF
		inc	word ptr [si+0Ah]
		mov	ax, [si+0Ah]
		cmp	ax, [si+6]
		jl	short loc_4FBA2
		mov	word ptr [si+0Ah], 0

loc_4FBA2:				; CODE XREF: Anim_AdvanceFrameCycle_4FB84+17j
		mov	ax, [si+0Ah]
		imul	ax, 6
		mov	di, [si+8]
		add	di, ax
		mov	eax, [di]
		mov	[si], eax
		mov	al, [di+4]
		mov	[si+4],	al
		mov	al, [di+5]
		mov	[si+5],	al

loc_4FBBF:				; CODE XREF: Anim_AdvanceFrameCycle_4FB84+Cj
		pop	di
		pop	si
		pop	bp
		retf
Anim_AdvanceFrameCycle_4FB84	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, boucle sur un tableau d'objets animés (stride 0Ch, compteur/base via pointeur far) et
; appelle Anim_AdvanceFrameCycle sur chacun. Référencé depuis seg077 (terrain streaming/LOD)
; et sub_2BD51 — probable cyclage de texture animée (eau, lumières) sur éléments de terrain.
; ==============================================================================================
Anim_UpdateFrameCycleArray_4FBC3	proc far		; CODE XREF: Damage_CheckTimer+3CP
					; seg077:0240P

arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+2], 0
		jz	short loc_4FBED
		mov	si, es:[bx+6]
		xor	di, di
		jmp	short loc_4FBE4
; ���������������������������������������������������������������������������

loc_4FBDA:				; CODE XREF: Anim_UpdateFrameCycleArray_4FBC3+28j
		push	si
		push	cs
		call	near ptr Anim_AdvanceFrameCycle_4FB84
		pop	cx
		inc	di
		add	si, 0Ch

loc_4FBE4:				; CODE XREF: Anim_UpdateFrameCycleArray_4FBC3+15j
		les	bx, [bp+arg_0]
		cmp	es:[bx+2], di
		ja	short loc_4FBDA

loc_4FBED:				; CODE XREF: Anim_UpdateFrameCycleArray_4FBC3+Dj
		pop	di
		pop	si
		pop	bp

locret_4FBF0:
		retf
Anim_UpdateFrameCycleArray_4FBC3	endp

seg111		ends
