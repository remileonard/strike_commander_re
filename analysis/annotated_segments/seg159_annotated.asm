seg159		segment	byte public 'CODE' use16
		assume cs:seg159
		;org 7
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
		push	bp

; ==============================================================================================
; far, référencée via vtable (DATA XREF seg216) — insère un nœud en tête d'une liste
; simplement chaînée (structure de nœud distincte du cluster seg156).
; ==============================================================================================
LinkedListB_InsertAtHead_5F558:				; DATA XREF: seg216:05BEo
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		or	di, di
		jz	short loc_5F57B
		mov	ax, [si+2]
		mov	[di+2],	ax
		mov	[si+2],	di
		cmp	word ptr [si+4], 0
		jnz	short loc_5F57B
		mov	ax, [si+2]
		mov	[si+4],	ax

loc_5F57B:				; CODE XREF: seg159:0014j seg159:0023j
		pop	di
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, insère un nœud en queue de la même structure de liste. Référencée par sub_1F4BB et
; sub_2387E.
; ==============================================================================================
LinkedListB_InsertAtTail_5F57F	proc far		; CODE XREF: UIList_CreateMarker+55P
					; EntityTracker_AddEntryObj+1BP ...

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	dx, [bp+arg_2]
		or	dx, dx
		jz	short loc_5F5A1
		cmp	word ptr [si+4], 0

loc_5F591:
		jz	short loc_5F59B
		mov	bx, [si+4]
		mov	[bx+2],	dx
		jmp	short loc_5F59E
; ���������������������������������������������������������������������������

loc_5F59B:				; CODE XREF: LinkedListB_InsertAtTail_5F57F:loc_5F591j
		mov	[si+2],	dx

loc_5F59E:				; CODE XREF: LinkedListB_InsertAtTail_5F57F+1Aj
		mov	[si+4],	dx

loc_5F5A1:				; CODE XREF: LinkedListB_InsertAtTail_5F57F+Cj
		pop	si
		pop	bp
		retf
LinkedListB_InsertAtTail_5F57F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, recherche un nœud (sub_5F604) puis dispatch vtable [bx] si trouvé.
; ==============================================================================================
LinkedListB_FindAndDispatch_5F5A4	proc far		; CODE XREF: EntityTracker_RemoveByTarget+29P
					; EntityTracker_ClearAllFull+1AP ...

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	ax, [bp+arg_0]
		mov	si, [bp+arg_2]
		push	[bp+arg_4]
		push	si
		push	ax
		nop
		push	cs
		call	near ptr LinkedListB_FindByKey_5F604
		add	sp, 6
		or	si, si
		jz	short loc_5F5CB
		push	3
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short $+2

loc_5F5CB:				; CODE XREF: LinkedListB_FindAndDispatch_5F5A4+19j
		pop	si
		pop	bp
		retf
LinkedListB_FindAndDispatch_5F5A4	endp

; ���������������������������������������������������������������������������
		push	bp

loc_5F5CF:
		mov	bp, sp
		push	si
		push	di

loc_5F5D3:
		mov	si, [bp+6]

loc_5F5D6:
		mov	di, [bp+8]
		mov	dx, [bp+0Ah]
		or	di, di
		jz	short loc_5F600
		or	dx, dx
		jz	short loc_5F600
		cmp	[si+4],	di
		jz	short loc_5F5F3
		mov	ax, [di+2]
		mov	bx, dx
		mov	[bx+2],	ax
		jmp	short loc_5F5FD
; ���������������������������������������������������������������������������

loc_5F5F3:				; CODE XREF: seg159:0097j
		mov	[si+4],	dx
		mov	bx, dx
		mov	word ptr [bx+2], 0

loc_5F5FD:				; CODE XREF: seg159:00A1j
		mov	[di+2],	dx

loc_5F600:				; CODE XREF: seg159:008Ej seg159:0092j
		pop	di
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, recherche un nœud par clé (cx) en parcourant la liste (champ +2). Appelée par
; LinkedListB_FindAndDispatch_5F5A4.
; ==============================================================================================
LinkedListB_FindByKey_5F604	proc far		; CODE XREF: LinkedListB_FindAndDispatch_5F5A4+11p

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	cx, [bp+arg_2]
		mov	di, [bp+arg_4]
		or	di, di
		jnz	short loc_5F62E
		mov	dx, [si+2]
		jmp	short loc_5F622
; ���������������������������������������������������������������������������

loc_5F61B:				; CODE XREF: LinkedListB_FindByKey_5F604+24j
		mov	di, dx
		mov	bx, dx
		mov	dx, [bx+2]

loc_5F622:				; CODE XREF: LinkedListB_FindByKey_5F604+15j
		or	dx, dx
		jz	short loc_5F62A
		cmp	dx, cx
		jnz	short loc_5F61B

loc_5F62A:				; CODE XREF: LinkedListB_FindByKey_5F604+20j
		or	dx, dx
		jz	short loc_5F667

loc_5F62E:				; CODE XREF: LinkedListB_FindByKey_5F604+10j
		or	di, di
		jnz	short loc_5F648

loc_5F632:
		mov	bx, [si+2]

loc_5F635:
		mov	ax, [bx+2]

loc_5F638:
		mov	[si+2],	ax

loc_5F63B:
		cmp	word ptr [si+2], 0
		jnz	short loc_5F667

loc_5F641:
		mov	word ptr [si+4], 0
		jmp	short loc_5F667
; ���������������������������������������������������������������������������

loc_5F648:				; CODE XREF: LinkedListB_FindByKey_5F604+2Cj
		cmp	[si+4],	cx
		jz	short loc_5F65F
		mov	bx, cx
		mov	ax, [bx+2]
		mov	[di+2],	ax
		cmp	[si+2],	cx
		jnz	short loc_5F667
		mov	[si+2],	ax
		jmp	short loc_5F667
; ���������������������������������������������������������������������������

loc_5F65F:				; CODE XREF: LinkedListB_FindByKey_5F604+47j
		mov	[si+4],	di

loc_5F662:
		mov	word ptr [di+2], 0

loc_5F667:				; CODE XREF: LinkedListB_FindByKey_5F604+28j
					; LinkedListB_FindByKey_5F604+3Bj ...
		pop	di
		pop	si
		pop	bp
		retf
LinkedListB_FindByKey_5F604	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, dispatch vtable [bx] (rôle exact non détaillé, voisin du cluster liste chaînée B).
; ==============================================================================================
LinkedListB_Helper_5F66B	proc far		; CODE XREF: seg032:loc_1F5B1P
					; EntityTracker_Destruct+1EP ...

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		jmp	short loc_5F698
; ���������������������������������������������������������������������������

loc_5F677:				; CODE XREF: LinkedListB_Helper_5F66B+31j
		mov	bx, [si+2]
		mov	ax, [bx+2]
		mov	[bp+var_2], ax
		cmp	word ptr [si+2], 0
		jz	short loc_5F692
		push	3
		push	bx
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short $+2

loc_5F692:				; CODE XREF: LinkedListB_Helper_5F66B+19j
		mov	ax, [bp+var_2]
		mov	[si+2],	ax

loc_5F698:				; CODE XREF: LinkedListB_Helper_5F66B+Aj
		cmp	word ptr [si+2], 0
		jnz	short loc_5F677
		xor	ax, ax
		mov	[si+4],	ax

loc_5F6A3:
		mov	[si+2],	ax
		pop	si
		leave
		retf
LinkedListB_Helper_5F66B	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, aucun appel externe visible (rôle exact non détaillé).
; ==============================================================================================
LinkedListB_Helper_5F6A9	proc far		; CODE XREF: UI_NotifyListRepaint+25P
					; UI_NotifyListEvent:loc_16949P	...

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		cmp	word ptr [di], 0
		jnz	short loc_5F6BE
		mov	ax, [si+2]
		jmp	short loc_5F6C3
; ���������������������������������������������������������������������������

loc_5F6BE:				; CODE XREF: LinkedListB_Helper_5F6A9+Ej
		mov	bx, [di]
		mov	ax, [bx+2]

loc_5F6C3:				; CODE XREF: LinkedListB_Helper_5F6A9+13j
		mov	[di], ax
		cmp	word ptr [di], 0

loc_5F6C8:
		jz	short loc_5F6CF

loc_5F6CA:
		mov	ax, 1
		jmp	short loc_5F6D1
; ���������������������������������������������������������������������������

loc_5F6CF:				; CODE XREF: LinkedListB_Helper_5F6A9:loc_5F6C8j
		xor	ax, ax

loc_5F6D1:				; CODE XREF: LinkedListB_Helper_5F6A9+24j
		pop	di

loc_5F6D2:
		pop	si
		pop	bp
		retf
LinkedListB_Helper_5F6A9	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, aucun appel externe visible (rôle exact non détaillé).
; ==============================================================================================
LinkedListB_Helper_5F6D5	proc far		; CODE XREF: ListItem_AddNumberedLimited+46P
					; TerrainTile_CacheEntryConstruct+CP	...

var_4		= dword	ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_4], 0
		jmp	short loc_5F6ED
; ���������������������������������������������������������������������������

loc_5F6E9:				; CODE XREF: LinkedListB_Helper_5F6D5+1Dj
		inc	[bp+var_4]

loc_5F6ED:				; CODE XREF: LinkedListB_Helper_5F6D5+12j
		mov	si, [si+2]
		or	si, si
		jnz	short loc_5F6E9
		mov	eax, [bp+var_4]
		shld	edx, eax, 10h
		pop	si
		leave
		retf
LinkedListB_Helper_5F6D5	endp

seg159		ends
