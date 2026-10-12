seg430		segment	para public 'OVERLAY' use16
		assume cs:seg430
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE 2026-10-12. Ex-'TimedTrigger_NotifySingleListener'. (instance, rang n) : sous-objet
; attaché n° n (WorldObject_GetNthChild_22E27 sur la liste +0x1E = sous-objets CHLD) ; s'il
; existe, appelle sa méthode +4 avec 0 (masque/désactive). Renvoie 1 si le sous-objet existe.
; ==============================================================================================
Aircraft_SetChildVisible_9DD30	proc far		; CODE XREF: VROOMM_StubThunk_6C320J Aircraft_InitGearChildren_9DDCF+4Dp

var_8		= word ptr -8
var_6		= dword	ptr -6
var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp

loc_9DD33:
		sub	sp, 8
		push	si
		mov	si, [bp+arg_0]

loc_9DD3A:
		mov	[bp+var_1], 0
		mov	ax, [bp+arg_2]

loc_9DD41:
		mov	[bp+var_8], ax
		push	ax
		push	word ptr [si+1Eh]
		call	WorldObject_GetNthChild_22E27
		add	sp, 4
		mov	si, ax
		or	si, si
		jz	short loc_9DD7B
		mov	eax, [si+0Ah]
		mov	[bp+var_6], eax

loc_9DD5E:
		cmp	[bp+var_6], 0

loc_9DD63:
		jz	short loc_9DD7B

loc_9DD65:
		mov	[bp+var_1], 1
		push	0
		push	large [bp+var_6]
		les	bx, [bp+var_6]
		mov	bx, es:[bx]
		call	dword ptr [bx+4]
		add	sp, 6

loc_9DD7B:				; CODE XREF: Aircraft_SetChildVisible_9DD30+24j
					; Aircraft_SetChildVisible_9DD30:loc_9DD63j
		mov	al, [bp+var_1]
		pop	si
		leave
		retf
Aircraft_SetChildVisible_9DD30	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE 2026-10-12. Ex-'TimedTrigger_NotifyConditional'. À la création d'un avion
; (Camera_ConstructWithHandle_9D610) : si JINF champ 6 (modèle +0x59) ≠ 0, le sous-objet CHLD
; de rang JINF champ 7 (modèle +0x66) est mémorisé en +0x65 et sa méthode +4 appelée avec 0.
; La mise à jour (Aircraft_Update_3DEFB) le désactive définitivement après 3 images où sa
; méthode +8 est vraie (compteur +0x67).
; ==============================================================================================
Aircraft_InitSpecialChild_9DD81	proc far		; CODE XREF: VROOMM_StubThunk_6C325J

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= dword	ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+1Eh], 0
		jz	short loc_9DDCC

loc_9DD91:
		les	bx, [bp+arg_2]
		cmp	byte ptr es:[bx+59h], 0
		jz	short loc_9DDCC
		mov	ax, es:[bx+66h]

loc_9DD9F:
		mov	[bp+var_2], ax
		push	ax
		push	word ptr [si+1Eh]
		call	WorldObject_GetNthChild_22E27
		add	sp, 4
		mov	[si+65h], ax
		cmp	word ptr [si+65h], 0
		jz	short loc_9DDCC
		push	0
		mov	bx, [si+65h]
		push	large dword ptr	[bx+0Ah]
		les	bx, [bx+0Ah]
		mov	bx, es:[bx]
		call	dword ptr [bx+4]
		add	sp, 6

loc_9DDCC:				; CODE XREF: Aircraft_InitSpecialChild_9DD81+Ej
					; Aircraft_InitSpecialChild_9DD81+18j ...
		pop	si
		leave
		retf
Aircraft_InitSpecialChild_9DD81	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE 2026-10-12. Ex-'TimedTrigger_ReleaseIfInactive'. À la création d'un avion : +0x73
; bit 1 (« a un train escamotable ») = JINF champ 1 bit 0 (modèle +0x53) ; si posé et si
; l'avion a des sous-objets, chaque sous-objet CHLD de rang [JINF champ 2, champ 2 + champ 3)
; (modèle +0x54 / +0x56) doit exister (Aircraft_SetChildVisible_9DD30), sinon le bit est
; retiré. +0x73 bits 2 et 3 remis à 0, +0x62 = 0.
; ==============================================================================================
Aircraft_InitGearChildren_9DDCF	proc far		; CODE XREF: VROOMM_StubThunk_6C32AJ

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= dword	ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		les	bx, [bp+arg_2]
		mov	al, es:[bx+53h]

loc_9DDE1:
		and	ax, 1
		and	byte ptr [si+73h], 0FDh
		shl	al, 1

loc_9DDEA:
		or	[si+73h], al
		mov	word ptr [si+63h], 0
		mov	al, [si+73h]
		shr	ax, 1
		and	ax, 1
		or	al, al
		jz	short loc_9DE34
		cmp	word ptr [si+1Eh], 0
		jz	short loc_9DE34
		or	byte ptr [si+73h], 2
		mov	ax, es:[bx+54h]
		add	ax, es:[bx+56h]
		mov	[bp+var_2], ax
		mov	di, es:[bx+54h]
		jmp	short loc_9DE2F
; ���������������������������������������������������������������������������

loc_9DE19:				; CODE XREF: Aircraft_InitGearChildren_9DDCF+63j
		push	di
		push	si
		push	cs
		call	near ptr Aircraft_SetChildVisible_9DD30
		add	sp, 4
		mov	ah, 0
		or	ax, ax
		jnz	short loc_9DE2E
		and	byte ptr [si+73h], 0FDh
		jmp	short loc_9DE34
; ���������������������������������������������������������������������������

loc_9DE2E:				; CODE XREF: Aircraft_InitGearChildren_9DDCF+57j
		inc	di

loc_9DE2F:				; CODE XREF: Aircraft_InitGearChildren_9DDCF+48j
		cmp	di, [bp+var_2]
		jl	short loc_9DE19

loc_9DE34:				; CODE XREF: Aircraft_InitGearChildren_9DDCF+2Dj
					; Aircraft_InitGearChildren_9DDCF+33j ...
		and	byte ptr [si+73h], 0FBh

loc_9DE38:
		and	byte ptr [si+73h], 0F7h
		mov	byte ptr [si+62h], 0
		pop	di
		pop	si
		leave
		retf
Aircraft_InitGearChildren_9DDCF	endp

seg430		ends
