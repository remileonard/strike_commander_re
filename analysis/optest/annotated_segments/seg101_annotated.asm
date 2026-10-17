seg101		segment	byte public 'CODE' use16
		assume cs:seg101
		;org 1
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; LinkedList_InsertAtHead_5F19C (sub_5F19C de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, insère un nœud (di) en tête d'une liste
; doublement chaînée (si, head/tail à +2/+4), met à jour les liens next/prev du nœud voisin.
; Référencée par sub_5F1F8 et sub_664D5.
; ==============================================================================================
LinkedList_InsertAtHead_2FA11	proc far		; CODE XREF: seg084:00EEP
					; LinkedList_InsertAfter_2FA6D+19p ...

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di

loc_2FA16:				; DATA XREF: seg170:03FEo
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	word ptr [di+4], 0
		mov	ax, [si+2]
		mov	[di+2],	ax
		cmp	word ptr [si+2], 0
		jz	short loc_2FA35
		mov	bx, [si+2]
		mov	[bx+4],	di
		jmp	short loc_2FA38
; ���������������������������������������������������������������������������

loc_2FA35:				; CODE XREF: LinkedList_InsertAtHead_2FA11+1Aj
		mov	[si+4],	di

loc_2FA38:				; CODE XREF: LinkedList_InsertAtHead_2FA11+22j
		mov	[si+2],	di
		pop	di
		pop	si
		pop	bp
		retf
LinkedList_InsertAtHead_2FA11	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; LinkedList_InsertAtTail_5F1CA (sub_5F1CA de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, symétrique de LinkedList_InsertAtHead_5F19C,
; insère en queue de liste. Référencée par sub_5F245.
; ==============================================================================================
LinkedList_InsertAtTail_2FA3F	proc far		; CODE XREF: sub_2DA16+46P
					; LinkedList_InsertBefore_2FABA+19p

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	ax, [si+4]
		mov	[di+4],	ax
		mov	word ptr [di+2], 0
		cmp	word ptr [si+4], 0
		jz	short loc_2FA63
		mov	bx, [si+4]
		mov	[bx+2],	di
		jmp	short loc_2FA66
; ���������������������������������������������������������������������������

loc_2FA63:				; CODE XREF: LinkedList_InsertAtTail_2FA3F+1Aj
		mov	[si+2],	di

loc_2FA66:				; CODE XREF: LinkedList_InsertAtTail_2FA3F+22j
		mov	[si+4],	di
		pop	di
		pop	si
		pop	bp
		retf
LinkedList_InsertAtTail_2FA3F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; LinkedList_InsertAfter_5F1F8 (sub_5F1F8 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, insère un nœud après un nœud de référence
; donné (ou en tête via LinkedList_InsertAtHead_5F19C si aucune référence).
; ==============================================================================================
LinkedList_InsertAfter_2FA6D	proc far		; CODE XREF: seg101:0112p seg101:015Bp ...

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
		jz	short loc_2FAB6
		or	dx, dx
		jnz	short loc_2FA8E
		push	di
		push	si
		push	cs
		call	near ptr LinkedList_InsertAtHead_2FA11
		add	sp, 4
		jmp	short loc_2FAB6
; ���������������������������������������������������������������������������

loc_2FA8E:				; CODE XREF: LinkedList_InsertAfter_2FA6D+14j
		cmp	[si+4],	dx
		jz	short loc_2FAA6
		mov	bx, dx
		mov	ax, [bx+2]
		mov	[di+2],	ax
		mov	[di+4],	dx
		mov	bx, [bx+2]
		mov	[bx+4],	di
		jmp	short loc_2FAB1
; ���������������������������������������������������������������������������

loc_2FAA6:				; CODE XREF: LinkedList_InsertAfter_2FA6D+24j
		mov	[si+4],	di
		mov	word ptr [di+2], 0
		mov	[di+4],	dx

loc_2FAB1:				; CODE XREF: LinkedList_InsertAfter_2FA6D+37j
		mov	bx, dx
		mov	[bx+2],	di

loc_2FAB6:				; CODE XREF: LinkedList_InsertAfter_2FA6D+10j
					; LinkedList_InsertAfter_2FA6D+1Fj
		pop	di
		pop	si
		pop	bp
		retf
LinkedList_InsertAfter_2FA6D	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; LinkedList_InsertBefore_5F245 (sub_5F245 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, insère un nœud avant un nœud de référence
; donné (ou en queue via LinkedList_InsertAtTail_5F1CA si aucune référence).
; ==============================================================================================
LinkedList_InsertBefore_2FABA	proc far		; CODE XREF: seg101:0137p seg101:017Fp

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
		jz	short loc_2FB03
		or	dx, dx
		jnz	short loc_2FADB
		push	di
		push	si
		push	cs
		call	near ptr LinkedList_InsertAtTail_2FA3F
		add	sp, 4
		jmp	short loc_2FB03
; ���������������������������������������������������������������������������

loc_2FADB:				; CODE XREF: LinkedList_InsertBefore_2FABA+14j
		cmp	[si+2],	dx
		jz	short loc_2FAF3
		mov	[di+2],	dx
		mov	bx, dx
		mov	ax, [bx+4]
		mov	[di+4],	ax
		mov	bx, [bx+4]
		mov	[bx+2],	di
		jmp	short loc_2FAFE
; ���������������������������������������������������������������������������

loc_2FAF3:				; CODE XREF: LinkedList_InsertBefore_2FABA+24j
		mov	[si+2],	di
		mov	word ptr [di+4], 0
		mov	[di+2],	dx

loc_2FAFE:				; CODE XREF: LinkedList_InsertBefore_2FABA+37j
		mov	bx, dx
		mov	[bx+4],	di

loc_2FB03:				; CODE XREF: LinkedList_InsertBefore_2FABA+10j
					; LinkedList_InsertBefore_2FABA+1Fj
		pop	di
		pop	si
		pop	bp
		retf
LinkedList_InsertBefore_2FABA	endp

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
		call	near ptr LinkedList_Remove_2FB99
		add	sp, 4
		push	di
		push	word ptr [bp+8]
		push	si
		push	cs
		call	near ptr LinkedList_InsertAfter_2FA6D
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
		call	near ptr LinkedList_Remove_2FB99
		add	sp, 4
		push	di
		push	word ptr [bp+8]
		push	si
		push	cs
		call	near ptr LinkedList_InsertBefore_2FABA
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
		call	near ptr LinkedList_Remove_2FB99
		add	sp, 4
		push	di
		push	0
		push	si
		push	cs
		call	near ptr LinkedList_InsertAfter_2FA6D
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
		call	near ptr LinkedList_Remove_2FB99
		add	sp, 4
		push	di
		push	0
		push	si
		push	cs
		call	near ptr LinkedList_InsertBefore_2FABA
		add	sp, 6
		pop	di
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à LinkedList_Remove_5F324
; (sub_5F324 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far, retire un nœud (di) d'une liste doublement chaînée (si), reliant ses voisins
; entre eux.
; ==============================================================================================
LinkedList_Remove_2FB99	proc far		; CODE XREF: LayerGroup_Remove_2DBC1+23P
					; seg101:0106p	...

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	di, di
		jz	short loc_2FBE2
		mov	dx, [di+4]
		or	dx, dx
		jz	short loc_2FBB9
		mov	ax, [di+2]
		mov	bx, dx
		mov	[bx+2],	ax
		jmp	short loc_2FBBF
; ���������������������������������������������������������������������������

loc_2FBB9:				; CODE XREF: LinkedList_Remove_2FB99+14j
		mov	ax, [di+2]
		mov	[si+2],	ax

loc_2FBBF:				; CODE XREF: LinkedList_Remove_2FB99+1Ej
		cmp	word ptr [di+2], 0
		jz	short loc_2FBCD
		mov	bx, [di+2]
		mov	[bx+4],	dx
		jmp	short loc_2FBE2
; ���������������������������������������������������������������������������

loc_2FBCD:				; CODE XREF: LinkedList_Remove_2FB99+2Aj
		or	dx, dx
		jz	short loc_2FBDA
		mov	bx, dx
		mov	word ptr [bx+2], 0
		jmp	short loc_2FBDF
; ���������������������������������������������������������������������������

loc_2FBDA:				; CODE XREF: LinkedList_Remove_2FB99+36j
		mov	word ptr [si+2], 0

loc_2FBDF:				; CODE XREF: LinkedList_Remove_2FB99+3Fj
		mov	[si+4],	dx

loc_2FBE2:				; CODE XREF: LinkedList_Remove_2FB99+Dj
					; LinkedList_Remove_2FB99+32j
		pop	di
		pop	si
		pop	bp
		retf
LinkedList_Remove_2FB99	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		mov	ax, [bp+6]
		mov	si, [bp+8]
		push	si
		push	ax
		push	cs
		call	near ptr LinkedList_Remove_2FB99
		add	sp, 4
		or	si, si
		jz	short loc_2FC09
		push	3
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short $+2

loc_2FC09:				; CODE XREF: seg101:01EBj
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_2FC0C	proc far		; CODE XREF: seg014:2BB3P
					; sub_2DABA+58P ...

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		jmp	short loc_2FC39
; ���������������������������������������������������������������������������

loc_2FC18:				; CODE XREF: sub_2FC0C+31j
		mov	bx, [si+2]
		mov	ax, [bx+2]
		mov	[bp+var_2], ax
		cmp	word ptr [si+2], 0
		jz	short loc_2FC33
		push	3
		push	bx
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short $+2

loc_2FC33:				; CODE XREF: sub_2FC0C+19j
		mov	ax, [bp+var_2]
		mov	[si+2],	ax

loc_2FC39:				; CODE XREF: sub_2FC0C+Aj
		cmp	word ptr [si+2], 0
		jnz	short loc_2FC18
		xor	ax, ax
		mov	[si+4],	ax
		mov	[si+2],	ax
		pop	si
		leave
		retf
sub_2FC0C	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_2FC4A	proc far		; CODE XREF: sub_502B+C0P sub_942D+47P ...

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		cmp	word ptr [di], 0
		jnz	short loc_2FC5F
		mov	ax, [si+2]
		jmp	short loc_2FC64
; ���������������������������������������������������������������������������

loc_2FC5F:				; CODE XREF: sub_2FC4A+Ej
		mov	bx, [di]
		mov	ax, [bx+2]

loc_2FC64:				; CODE XREF: sub_2FC4A+13j
		mov	[di], ax
		cmp	word ptr [di], 0
		jz	short loc_2FC70
		mov	ax, 1
		jmp	short loc_2FC72
; ���������������������������������������������������������������������������

loc_2FC70:				; CODE XREF: sub_2FC4A+1Fj
		xor	ax, ax

loc_2FC72:				; CODE XREF: sub_2FC4A+24j
		pop	di
		pop	si
		pop	bp
		retf
sub_2FC4A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à LinkedList_Helper_5F401
; (sub_5F401 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far, aucun appel externe visible (rôle exact non détaillé, voisin du cluster liste
; chaînée).
; ==============================================================================================
LinkedList_Helper_2FC76	proc far		; CODE XREF: JoystickCallback_UpdateAndNotifyChain_3DCD1+23P

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		cmp	word ptr [di], 0
		jnz	short loc_2FC8B
		mov	ax, [si+4]
		jmp	short loc_2FC90
; ���������������������������������������������������������������������������

loc_2FC8B:				; CODE XREF: LinkedList_Helper_2FC76+Ej
		mov	bx, [di]
		mov	ax, [bx+4]

loc_2FC90:				; CODE XREF: LinkedList_Helper_2FC76+13j
		mov	[di], ax
		cmp	word ptr [di], 0
		jz	short loc_2FC9C
		mov	ax, 1
		jmp	short loc_2FC9E
; ���������������������������������������������������������������������������

loc_2FC9C:				; CODE XREF: LinkedList_Helper_2FC76+1Fj
		xor	ax, ax

loc_2FC9E:				; CODE XREF: LinkedList_Helper_2FC76+24j
		pop	di
		pop	si
		pop	bp
		retf
LinkedList_Helper_2FC76	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+6]
		mov	dword ptr [bp-4], 0
		jmp	short loc_2FCBA
; ���������������������������������������������������������������������������

loc_2FCB6:				; CODE XREF: seg101:02AFj
		inc	dword ptr [bp-4]

loc_2FCBA:				; CODE XREF: seg101:02A4j
		mov	si, [si+2]
		or	si, si
		jnz	short loc_2FCB6
		mov	eax, [bp-4]
		shld	edx, eax, 10h
		pop	si
		leave
		retf
seg101		ends
