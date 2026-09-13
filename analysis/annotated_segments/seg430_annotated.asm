seg430		segment	para public 'OVERLAY' use16
		assume cs:seg430
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, résout un handle faible via sub_22E27 (motif +0x1E déjà vu dans
; Trigger_TimedRangedSpawnOnce_4F351, seg109) puis, si résolu et non nul, appelle sa méthode
; virtuelle de notification (dword ptr [bx+4]) avec le champ +0x0A comme argument far.
; Retourne si un listener a été notifié. Référencée via jmp depuis un stub VROOMM (sub_6C320)
; et par TimedTrigger_ReleaseIfInactive_9DDCF.
; ==============================================================================================
TimedTrigger_NotifySingleListener_9DD30	proc far		; CODE XREF: VROOMM_StubThunk_6C320J TimedTrigger_ReleaseIfInactive_9DDCF+4Dp

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
		call	Container_Op_22E27
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

loc_9DD7B:				; CODE XREF: TimedTrigger_NotifySingleListener_9DD30+24j
					; TimedTrigger_NotifySingleListener_9DD30:loc_9DD63j
		mov	al, [bp+var_1]
		pop	si
		leave
		retf
TimedTrigger_NotifySingleListener_9DD30	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, variante conditionnelle de TimedTrigger_NotifySingleListener_9DD30 : ne notifie que si
; un flag externe (arg+0x59) est posé, résout le handle faible (sub_22E27) et le stocke dans
; le champ local +0x65 avant de dispatcher. Référencée via jmp depuis un stub VROOMM
; (sub_6C325).
; ==============================================================================================
TimedTrigger_NotifyConditional_9DD81	proc far		; CODE XREF: VROOMM_StubThunk_6C325J

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
		call	Container_Op_22E27
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

loc_9DDCC:				; CODE XREF: TimedTrigger_NotifyConditional_9DD81+Ej
					; TimedTrigger_NotifyConditional_9DD81+18j ...
		pop	si
		leave
		retf
TimedTrigger_NotifyConditional_9DD81	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, gère des bits de flags d'état (+0x73) à partir d'un champ source (arg+0x53), puis si
; actif, parcourt une plage d'indices de listeners ([arg+0x54, arg+0x54+arg+0x56)) en appelant
; TimedTrigger_NotifySingleListener_9DD30 pour chacun — désactive le flag si aucun listener ne
; confirme le maintien. Référencée via jmp depuis un stub VROOMM (sub_6C32A).
; ==============================================================================================
TimedTrigger_ReleaseIfInactive_9DDCF	proc far		; CODE XREF: VROOMM_StubThunk_6C32AJ

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

loc_9DE19:				; CODE XREF: TimedTrigger_ReleaseIfInactive_9DDCF+63j
		push	di
		push	si
		push	cs
		call	near ptr TimedTrigger_NotifySingleListener_9DD30
		add	sp, 4
		mov	ah, 0
		or	ax, ax
		jnz	short loc_9DE2E
		and	byte ptr [si+73h], 0FDh
		jmp	short loc_9DE34
; ���������������������������������������������������������������������������

loc_9DE2E:				; CODE XREF: TimedTrigger_ReleaseIfInactive_9DDCF+57j
		inc	di

loc_9DE2F:				; CODE XREF: TimedTrigger_ReleaseIfInactive_9DDCF+48j
		cmp	di, [bp+var_2]
		jl	short loc_9DE19

loc_9DE34:				; CODE XREF: TimedTrigger_ReleaseIfInactive_9DDCF+2Dj
					; TimedTrigger_ReleaseIfInactive_9DDCF+33j ...
		and	byte ptr [si+73h], 0FBh

loc_9DE38:
		and	byte ptr [si+73h], 0F7h
		mov	byte ptr [si+62h], 0
		pop	di
		pop	si
		leave
		retf
TimedTrigger_ReleaseIfInactive_9DDCF	endp

seg430		ends
