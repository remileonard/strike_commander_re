seg156		segment	byte public 'CODE' use16
		assume cs:seg156
		;org 0Ch
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, insère un nœud (di) en tête d'une liste doublement chaînée (si, head/tail à +2/+4), met
; à jour les liens next/prev du nœud voisin. Référencée par sub_5F1F8 et sub_664D5.
; ==============================================================================================
LinkedList_InsertAtHead_5F19C	proc far		; CODE XREF: LinkedList_InsertAfter_5F1F8+19p
					; JoystickCallback_RegisterInChain_664D5+40P

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	word ptr [di+4], 0
		mov	ax, [si+2]
		mov	[di+2],	ax
		cmp	word ptr [si+2], 0
		jz	short loc_5F1C0
		mov	bx, [si+2]
		mov	[bx+4],	di
		jmp	short loc_5F1C3
; ���������������������������������������������������������������������������

loc_5F1C0:				; CODE XREF: LinkedList_InsertAtHead_5F19C+1Aj
		mov	[si+4],	di

loc_5F1C3:				; CODE XREF: LinkedList_InsertAtHead_5F19C+22j
		mov	[si+2],	di
		pop	di
		pop	si

loc_5F1C8:
		pop	bp
		retf
LinkedList_InsertAtHead_5F19C	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, symétrique de LinkedList_InsertAtHead_5F19C, insère en queue de liste. Référencée par
; sub_5F245.
; ==============================================================================================
LinkedList_InsertAtTail_5F1CA	proc far		; CODE XREF: LinkedList_InsertBefore_5F245+19p

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp

loc_5F1CD:
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	ax, [si+4]
		mov	[di+4],	ax
		mov	word ptr [di+2], 0
		cmp	word ptr [si+4], 0

loc_5F1E4:
		jz	short loc_5F1EE
		mov	bx, [si+4]
		mov	[bx+2],	di
		jmp	short loc_5F1F1
; ���������������������������������������������������������������������������

loc_5F1EE:				; CODE XREF: LinkedList_InsertAtTail_5F1CA:loc_5F1E4j
		mov	[si+2],	di

loc_5F1F1:				; CODE XREF: LinkedList_InsertAtTail_5F1CA+22j
		mov	[si+4],	di
		pop	di
		pop	si
		pop	bp
		retf
LinkedList_InsertAtTail_5F1CA	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, insère un nœud après un nœud de référence donné (ou en tête via
; LinkedList_InsertAtHead_5F19C si aucune référence).
; ==============================================================================================
LinkedList_InsertAfter_5F1F8	proc far		; CODE XREF: seg156:011Dp seg156:0166p ...

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	dx, [bp+arg_2]
		mov	di, [bp+arg_4]
		or	di, di
		jz	short loc_5F241
		or	dx, dx
		jnz	short loc_5F219
		push	di
		push	si
		push	cs
		call	near ptr LinkedList_InsertAtHead_5F19C
		add	sp, 4
		jmp	short loc_5F241
; ���������������������������������������������������������������������������

loc_5F219:				; CODE XREF: LinkedList_InsertAfter_5F1F8+14j
		cmp	[si+4],	dx
		jz	short loc_5F231
		mov	bx, dx
		mov	ax, [bx+2]
		mov	[di+2],	ax
		mov	[di+4],	dx
		mov	bx, [bx+2]
		mov	[bx+4],	di
		jmp	short loc_5F23C
; ���������������������������������������������������������������������������

loc_5F231:				; CODE XREF: LinkedList_InsertAfter_5F1F8+24j
		mov	[si+4],	di
		mov	word ptr [di+2], 0
		mov	[di+4],	dx

loc_5F23C:				; CODE XREF: LinkedList_InsertAfter_5F1F8+37j
		mov	bx, dx
		mov	[bx+2],	di

loc_5F241:				; CODE XREF: LinkedList_InsertAfter_5F1F8+10j
					; LinkedList_InsertAfter_5F1F8+1Fj
		pop	di
		pop	si
		pop	bp
		retf
LinkedList_InsertAfter_5F1F8	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, insère un nœud avant un nœud de référence donné (ou en queue via
; LinkedList_InsertAtTail_5F1CA si aucune référence).
; ==============================================================================================
LinkedList_InsertBefore_5F245	proc far		; CODE XREF: seg156:0142p seg156:018Ap

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	dx, [bp+arg_2]

loc_5F250:
		mov	di, [bp+arg_4]
		or	di, di
		jz	short loc_5F28E
		or	dx, dx
		jnz	short loc_5F266
		push	di
		push	si
		push	cs
		call	near ptr LinkedList_InsertAtTail_5F1CA
		add	sp, 4
		jmp	short loc_5F28E
; ���������������������������������������������������������������������������

loc_5F266:				; CODE XREF: LinkedList_InsertBefore_5F245+14j
		cmp	[si+2],	dx
		jz	short loc_5F27E
		mov	[di+2],	dx
		mov	bx, dx
		mov	ax, [bx+4]
		mov	[di+4],	ax
		mov	bx, [bx+4]
		mov	[bx+2],	di
		jmp	short loc_5F289
; ���������������������������������������������������������������������������

loc_5F27E:				; CODE XREF: LinkedList_InsertBefore_5F245+24j
		mov	[si+2],	di
		mov	word ptr [di+4], 0
		mov	[di+2],	dx

loc_5F289:				; CODE XREF: LinkedList_InsertBefore_5F245+37j
		mov	bx, dx
		mov	[bx+4],	di

loc_5F28E:				; CODE XREF: LinkedList_InsertBefore_5F245+10j
					; LinkedList_InsertBefore_5F245+1Fj
		pop	di
		pop	si
		pop	bp
		retf
LinkedList_InsertBefore_5F245	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]

loc_5F29A:
		mov	di, [bp+0Ah]
		push	di
		push	si
		nop
		push	cs
		call	near ptr LinkedList_Remove_5F324
		add	sp, 4
		push	di
		push	word ptr [bp+8]
		push	si
		push	cs
		call	near ptr LinkedList_InsertAfter_5F1F8
		add	sp, 6
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+0Ah]
		push	di
		push	si
		nop
		push	cs
		call	near ptr LinkedList_Remove_5F324
		add	sp, 4
		push	di
		push	word ptr [bp+8]
		push	si
		push	cs
		call	near ptr LinkedList_InsertBefore_5F245
		add	sp, 6
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		push	di
		push	si
		nop
		push	cs
		call	near ptr LinkedList_Remove_5F324
		add	sp, 4
		push	di
		push	0
		push	si
		push	cs
		call	near ptr LinkedList_InsertAfter_5F1F8
		add	sp, 6
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		push	di
		push	si
		nop
		push	cs
		call	near ptr LinkedList_Remove_5F324
		add	sp, 4
		push	di
		push	0
		push	si
		push	cs
		call	near ptr LinkedList_InsertBefore_5F245
		add	sp, 6
		pop	di
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, retire un nœud (di) d'une liste doublement chaînée (si), reliant ses voisins entre eux.
; ==============================================================================================
LinkedList_Remove_5F324	proc far		; CODE XREF: seg156:0111p seg156:0136p ...

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	di, di

loc_5F331:
		jz	short loc_5F36D

loc_5F333:
		mov	dx, [di+4]

loc_5F336:
		or	dx, dx

loc_5F338:
		jz	short loc_5F344
		mov	ax, [di+2]
		mov	bx, dx

loc_5F33F:
		mov	[bx+2],	ax
		jmp	short loc_5F34A
; ���������������������������������������������������������������������������

loc_5F344:				; CODE XREF: LinkedList_Remove_5F324:loc_5F338j
		mov	ax, [di+2]
		mov	[si+2],	ax

loc_5F34A:				; CODE XREF: LinkedList_Remove_5F324+1Ej
		cmp	word ptr [di+2], 0
		jz	short loc_5F358

loc_5F350:
		mov	bx, [di+2]
		mov	[bx+4],	dx
		jmp	short loc_5F36D
; ���������������������������������������������������������������������������

loc_5F358:				; CODE XREF: LinkedList_Remove_5F324+2Aj
		or	dx, dx
		jz	short loc_5F365
		mov	bx, dx
		mov	word ptr [bx+2], 0

loc_5F363:
		jmp	short loc_5F36A
; ���������������������������������������������������������������������������

loc_5F365:				; CODE XREF: LinkedList_Remove_5F324+36j
		mov	word ptr [si+2], 0

loc_5F36A:				; CODE XREF: LinkedList_Remove_5F324:loc_5F363j
		mov	[si+4],	dx

loc_5F36D:				; CODE XREF: LinkedList_Remove_5F324:loc_5F331j
					; LinkedList_Remove_5F324+32j
		pop	di
		pop	si
		pop	bp
		retf
LinkedList_Remove_5F324	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		mov	ax, [bp+6]
		mov	si, [bp+8]
		push	si
		push	ax
		push	cs
		call	near ptr LinkedList_Remove_5F324
		add	sp, 4
		or	si, si
		jz	short loc_5F394
		push	3
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short $+2

loc_5F394:				; CODE XREF: seg156:01F6j
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, parcourt et vide entièrement une liste chaînée en appelant la méthode virtuelle de
; destruction (dispatch [bx], méthode 3) sur chaque nœud. Référencée depuis seg200.
; ==============================================================================================
LinkedList_RemoveAllAndDestroy_5F397	proc far		; CODE XREF: seg200:02C2P
					; seg200:loc_666AEP ...

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp

loc_5F398:
		mov	bp, sp

loc_5F39A:
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]

loc_5F3A1:
		jmp	short loc_5F3C4
; ���������������������������������������������������������������������������

loc_5F3A3:				; CODE XREF: LinkedList_RemoveAllAndDestroy_5F397+31j
		mov	bx, [si+2]

loc_5F3A6:
		mov	ax, [bx+2]
		mov	[bp+var_2], ax
		cmp	word ptr [si+2], 0
		jz	short loc_5F3BE
		push	3
		push	bx
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short $+2

loc_5F3BE:				; CODE XREF: LinkedList_RemoveAllAndDestroy_5F397+19j
		mov	ax, [bp+var_2]
		mov	[si+2],	ax

loc_5F3C4:				; CODE XREF: LinkedList_RemoveAllAndDestroy_5F397:loc_5F3A1j
		cmp	word ptr [si+2], 0
		jnz	short loc_5F3A3
		xor	ax, ax
		mov	[si+4],	ax
		mov	[si+2],	ax
		pop	si
		leave
		retf
LinkedList_RemoveAllAndDestroy_5F397	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, aucun appel externe visible (rôle exact non détaillé, voisin du cluster liste chaînée).
; ==============================================================================================
LinkedList_Helper_5F3D5	proc far		; CODE XREF: JoystickCallback_FindOrTraverse_66573+26P
					; seg200:020BP	...

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		cmp	word ptr [di], 0
		jnz	short loc_5F3EA
		mov	ax, [si+2]
		jmp	short loc_5F3EF
; ���������������������������������������������������������������������������

loc_5F3EA:				; CODE XREF: LinkedList_Helper_5F3D5+Ej
		mov	bx, [di]
		mov	ax, [bx+2]

loc_5F3EF:				; CODE XREF: LinkedList_Helper_5F3D5+13j
		mov	[di], ax
		cmp	word ptr [di], 0
		jz	short loc_5F3FB
		mov	ax, 1
		jmp	short loc_5F3FD
; ���������������������������������������������������������������������������

loc_5F3FB:				; CODE XREF: LinkedList_Helper_5F3D5+1Fj
		xor	ax, ax

loc_5F3FD:				; CODE XREF: LinkedList_Helper_5F3D5+24j
		pop	di
		pop	si
		pop	bp
		retf
LinkedList_Helper_5F3D5	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, aucun appel externe visible (rôle exact non détaillé, voisin du cluster liste chaînée).
; ==============================================================================================
LinkedList_Helper_5F401	proc far		; CODE XREF: JoystickCallback_UpdateAndNotifyChain_66461+23P

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		cmp	word ptr [di], 0
		jnz	short loc_5F416
		mov	ax, [si+4]
		jmp	short loc_5F41B
; ���������������������������������������������������������������������������

loc_5F416:				; CODE XREF: LinkedList_Helper_5F401+Ej
		mov	bx, [di]
		mov	ax, [bx+4]

loc_5F41B:				; CODE XREF: LinkedList_Helper_5F401+13j
		mov	[di], ax
		cmp	word ptr [di], 0
		jz	short loc_5F427
		mov	ax, 1
		jmp	short loc_5F429
; ���������������������������������������������������������������������������

loc_5F427:				; CODE XREF: LinkedList_Helper_5F401+1Fj
		xor	ax, ax

loc_5F429:				; CODE XREF: LinkedList_Helper_5F401+24j
		pop	di
		pop	si
		pop	bp
		retf
LinkedList_Helper_5F401	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp

loc_5F430:
		sub	sp, 4
		push	si
		mov	si, [bp+6]
		mov	dword ptr [bp-4], 0
		jmp	short loc_5F445
; ���������������������������������������������������������������������������

loc_5F441:				; CODE XREF: seg156:02BAj
		inc	dword ptr [bp-4]

loc_5F445:				; CODE XREF: seg156:02AFj
		mov	si, [si+2]
		or	si, si
		jnz	short loc_5F441
		mov	eax, [bp-4]

loc_5F450:
		shld	edx, eax, 10h
		pop	si

locret_5F456:
		leave

locret_5F457:
		retf
seg156		ends
