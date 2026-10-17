ovr214		segment	para public 'OVERLAY' use16
		assume cs:ovr214
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_BFA30	proc far		; CODE XREF: sub_4274AJ EntityTracker_AddEntryObj+10p

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jnz	short loc_BFA52
		push	1Ah
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_BFAB6

loc_BFA52:				; CODE XREF: sub_BFA30+10j
		mov	word ptr [si], 5CEh
		mov	word ptr [si+2], 0
		mov	word ptr [si], 2DD0h
		mov	ax, si
		add	ax, 5
		push	ax
		call	sub_C7A3
		add	sp, 2
		mov	dword ptr [si+10h], 0
		mov	byte ptr [si+14h], 2
		mov	byte ptr [si+15h], 0
		mov	dword ptr [si+16h], 0
		mov	[si+0Eh], di
		push	di
		mov	bx, [di+50h]
		call	dword ptr [bx+14h]
		add	sp, 2
		mov	[si+4],	al
		mov	ax, di
		add	ax, 53h	; 'S'
		mov	[bp+var_2], ax
		mov	bx, [bp+var_2]
		mov	eax, [bx]
		mov	[si+5],	eax
		mov	bx, [bp+var_2]
		mov	eax, [bx+4]
		mov	[si+9],	eax
		mov	byte ptr [si+0Dh], 0

loc_BFAB6:				; CODE XREF: sub_BFA30+20j
		mov	ax, si
		pop	di
		pop	si
		leave
		retf
sub_BFA30	endp

; ���������������������������������������������������������������������������
		pop	di
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_BFAC0	proc far		; CODE XREF: sub_4274FJ EntityTracker_AddEntryText+14p

var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= byte ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_4]
		or	si, si
		jnz	short loc_BFAE5
		push	1Ah
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jnz	short loc_BFAE5
		jmp	loc_BFBC4
; ���������������������������������������������������������������������������

loc_BFAE5:				; CODE XREF: sub_BFAC0+10j
					; sub_BFAC0+20j
		mov	word ptr [si], 5CEh
		mov	word ptr [si+2], 0
		mov	word ptr [si], 2DD0h
		mov	ax, si
		add	ax, 5
		push	ax
		call	sub_C7A3
		add	sp, 2
		mov	dword ptr [si+10h], 0
		mov	byte ptr [si+14h], 2
		mov	byte ptr [si+15h], 0
		mov	dword ptr [si+16h], 0
		mov	word ptr [si+0Eh], 0
		mov	al, [bp+arg_2]
		mov	[si+4],	al
		mov	eax, [di+72h]
		mov	[bp+var_4], eax
		push	1
		push	0
		push	2
		push	large [bp+var_4]
		push	661Ah
		call	Memory_TypedFreeWrapper_2B7E1
		add	sp, 0Ch
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		mov	eax, [bp+var_8]
		mov	[si+10h], eax
		mov	byte ptr [si+14h], 2
		mov	byte ptr [si+15h], 1
		mov	dword ptr [si+16h], 0
		mov	eax, [bp+var_4]
		mov	[si+16h], eax
		push	large dword ptr	[di+72h]
		push	0
		mov	al, [si+14h]
		push	ax
		push	word ptr [si+12h]
		push	word ptr [si+10h]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		push	di
		call	ResourceRecord_ReadFieldGroupA_3C289
		add	sp, 0Ah
		push	0
		mov	al, [si+14h]
		push	ax
		push	word ptr [si+12h]
		push	word ptr [si+10h]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		mov	[bp+var_A], dx
		mov	[bp+var_C], ax
		push	8
		push	[bp+var_A]
		push	[bp+var_C]
		push	ds
		mov	ax, si
		add	ax, 5
		push	ax
		call	CRT_MemFamily_Extra8
		add	sp, 0Ah
		mov	byte ptr [si+0Dh], 0

loc_BFBC4:				; CODE XREF: sub_BFAC0+22j
		mov	ax, si
		pop	di
		pop	si
		leave
		retf
sub_BFAC0	endp

; ���������������������������������������������������������������������������
		pop	di
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_BFBCE	proc far		; CODE XREF: sub_42754J sub_BFE6E+4Ap	...

var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	word ptr [si+0Eh], 0
		jnz	short loc_BFC5D
		mov	[bp+var_2], 0
		mov	al, [si+4]
		mov	ah, 0
		or	ax, ax
		jz	short loc_BFBEF
		jmp	short loc_BFC57
; ���������������������������������������������������������������������������

loc_BFBEF:				; CODE XREF: sub_BFBCE+1Dj
		push	0
		mov	al, [si+14h]
		push	ax
		push	word ptr [si+12h]
		push	word ptr [si+10h]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		mov	[bp+var_4], dx
		mov	[bp+var_6], ax
		push	7Eh ; '~'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	di, ax
		or	ax, ax
		jz	short loc_BFC50
		mov	ax, di
		add	ax, 20h	; ' '
		push	ax
		call	sub_25718
		add	sp, 2
		mov	word ptr [di+50h], 2DACh
		mov	ax, di
		add	ax, 53h	; 'S'
		push	ax
		call	sub_C7A3
		add	sp, 2
		push	[bp+var_4]
		push	[bp+var_6]
		push	di
		call	sub_42890
		add	sp, 6
		mov	ax, di
		jmp	short loc_BFC52
; ���������������������������������������������������������������������������

loc_BFC50:				; CODE XREF: sub_BFBCE+4Cj
		mov	ax, di

loc_BFC52:				; CODE XREF: sub_BFBCE+80j
		mov	[bp+var_2], ax
		jmp	short $+2

loc_BFC57:				; CODE XREF: sub_BFBCE+1Fj
		mov	ax, [bp+var_2]
		mov	[si+0Eh], ax

loc_BFC5D:				; CODE XREF: sub_BFBCE+Fj
		pop	di
		pop	si
		leave
		retf
sub_BFBCE	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_BFC61	proc far		; CODE XREF: sub_42759J sub_C003D+15p	...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+0Eh], 0
		jz	short loc_BFCBA
		mov	bx, [si+0Eh]
		mov	al, [bx+52h]
		and	ax, 1
		or	al, al
		jz	short loc_BFC8A
		push	word ptr [si+0Eh]
		mov	bx, [si+0Eh]
		mov	bx, [bx+50h]
		call	dword ptr [bx+4]
		add	sp, 2

loc_BFC8A:				; CODE XREF: sub_BFC61+18j
		cmp	dword ptr [si+10h], 0
		jz	short loc_BFC96
		mov	ax, 1
		jmp	short loc_BFC98
; ���������������������������������������������������������������������������

loc_BFC96:				; CODE XREF: sub_BFC61+2Ej
		xor	ax, ax

loc_BFC98:				; CODE XREF: sub_BFC61+33j
		or	ax, ax
		jz	short loc_BFCBA
		cmp	word ptr [si+0Eh], 0
		jz	short loc_BFCB5
		push	3
		push	word ptr [si+0Eh]
		mov	bx, [si+0Eh]
		mov	bx, [bx+50h]
		call	dword ptr [bx+0Ch]
		add	sp, 4
		jmp	short $+2

loc_BFCB5:				; CODE XREF: sub_BFC61+3Fj
		mov	word ptr [si+0Eh], 0

loc_BFCBA:				; CODE XREF: sub_BFC61+Bj
					; sub_BFC61+39j
		pop	si
		pop	bp
		retf
sub_BFC61	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_BFCBD	proc far		; CODE XREF: sub_4275EJ sub_C0071+21p	...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+0Eh], 0
		jz	short loc_BFD04
		mov	bx, [si+0Eh]
		mov	al, [bx+52h]
		and	ax, 1
		or	al, al
		jz	short loc_BFCE6
		push	word ptr [si+0Eh]
		mov	bx, [si+0Eh]
		mov	bx, [bx+50h]
		call	dword ptr [bx+4]
		add	sp, 2

loc_BFCE6:				; CODE XREF: sub_BFCBD+18j
		cmp	word ptr [si+0Eh], 0
		jz	short loc_BFCFF
		push	3
		push	word ptr [si+0Eh]
		mov	bx, [si+0Eh]
		mov	bx, [bx+50h]
		call	dword ptr [bx+0Ch]
		add	sp, 4
		jmp	short $+2

loc_BFCFF:				; CODE XREF: sub_BFCBD+2Dj
		mov	word ptr [si+0Eh], 0

loc_BFD04:				; CODE XREF: sub_BFCBD+Bj
		cmp	byte ptr [si+15h], 0
		jz	short loc_BFD2A
		cmp	dword ptr [si+10h], 0
		jz	short loc_BFD2A
		push	0
		mov	al, [si+14h]
		push	ax
		mov	ax, si
		add	ax, 10h
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_BFD2A:				; CODE XREF: sub_BFCBD+4Bj
					; sub_BFCBD+52j
		mov	dword ptr [si+10h], 0
		mov	byte ptr [si+15h], 0
		mov	dword ptr [si+16h], 0
		pop	si
		pop	bp
		retf
sub_BFCBD	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à EntityTracker_AddEntryObj (sub_2387E de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, LUE
; INTEGRALEMENT. RENOMMEE (ancien 'Kneeboard_AddEntryObj', ancien nom d'appelant
; 'Cinematic_LoadCameraDef' egalement a reconsiderer). Construit une entree via
; EntityTracker_EntryConstructObj puis l'insere en queue de liste
; (LinkedListB_InsertAtTail_5F57F).
; ==============================================================================================
EntityTracker_AddEntryObj	proc far		; CODE XREF: sub_42777J sub_C03D0+ADp

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		push	[bp+arg_2]
		push	0
		push	cs
		call	near ptr sub_BFA30
		add	sp, 4
		mov	[bp+var_2], ax
		push	[bp+var_2]
		push	si
		call	LinkedListB_InsertAtTail_2FDF4
		add	sp, 4
		pop	si
		leave
		retf
EntityTracker_AddEntryObj	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à EntityTracker_AddEntryText (sub_238A4 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, LUE
; INTEGRALEMENT. RENOMMEE (ancien 'Kneeboard_AddEntryText'). Construit une entree texte via
; EntityTracker_EntryConstructText puis l'insere en queue de liste.
; ==============================================================================================
EntityTracker_AddEntryText	proc far		; CODE XREF: sub_4277CJ sub_C03D0+C7p

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= byte ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		push	[bp+arg_4]
		mov	al, [bp+arg_2]
		push	ax
		push	0
		push	cs
		call	near ptr sub_BFAC0
		add	sp, 6
		mov	[bp+var_2], ax
		push	[bp+var_2]
		push	si
		call	LinkedListB_InsertAtTail_2FDF4
		add	sp, 4
		pop	si
		leave
		retf
EntityTracker_AddEntryText	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_BFD95	proc far		; CODE XREF: sub_42781J

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= dword	ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	short loc_BFDD8
; ���������������������������������������������������������������������������

loc_BFDA6:				; CODE XREF: sub_BFD95+52j
		mov	bx, [bp+var_2]
		mov	eax, [bx+5]
		les	bx, [bp+arg_2]
		cmp	eax, es:[bx]
		jnz	short loc_BFDCC
		mov	bx, [bp+var_2]
		mov	eax, [bx+9]
		les	bx, [bp+arg_2]
		cmp	eax, es:[bx+4]
		jnz	short loc_BFDCC
		mov	ax, 1
		jmp	short loc_BFDCE
; ���������������������������������������������������������������������������

loc_BFDCC:				; CODE XREF: sub_BFD95+1Fj
					; sub_BFD95+30j
		xor	ax, ax

loc_BFDCE:				; CODE XREF: sub_BFD95+35j
		or	al, al
		jz	short loc_BFDD8
		mov	ax, [bp+var_2]
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_BFDD8:				; CODE XREF: sub_BFD95+Fj
					; sub_BFD95+3Bj
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	sub_2FF1E
		add	sp, 4
		or	ax, ax
		jnz	short loc_BFDA6
		xor	ax, ax
		pop	si
		leave
		retf
sub_BFD95	endp

; ���������������������������������������������������������������������������
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_BFDF1	proc far		; CODE XREF: sub_42786J

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	short loc_BFE16
; ���������������������������������������������������������������������������

loc_BFE02:				; CODE XREF: sub_BFDF1+34j
		mov	bx, [bp+var_2]
		mov	al, [bx+4]
		cmp	al, [bp+arg_2]
		jnz	short loc_BFE16
		mov	bx, [bp+var_2]
		mov	ax, [bx+0Eh]
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_BFE16:				; CODE XREF: sub_BFDF1+Fj
					; sub_BFDF1+1Aj
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	sub_2FF1E
		add	sp, 4
		or	ax, ax
		jnz	short loc_BFE02
		xor	ax, ax
		pop	si
		leave
		retf
sub_BFDF1	endp

; ���������������������������������������������������������������������������
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_BFE2F	proc far		; CODE XREF: sub_4278BJ

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	[bp+var_2], 0
		jmp	short loc_BFE53
; ���������������������������������������������������������������������������

loc_BFE44:				; CODE XREF: sub_BFE2F+33j
		mov	bx, [bp+var_2]
		cmp	[bx+0Eh], di
		jnz	short loc_BFE53
		mov	ax, [bp+var_2]
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_BFE53:				; CODE XREF: sub_BFE2F+13j
					; sub_BFE2F+1Bj
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	sub_2FF1E
		add	sp, 4
		or	ax, ax
		jnz	short loc_BFE44
		xor	ax, ax
		pop	di
		pop	si
		leave
		retf
sub_BFE2F	endp

; ���������������������������������������������������������������������������
		pop	di
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_BFE6E	proc far		; CODE XREF: sub_42795J sub_C017F+17p

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= dword	ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	short loc_BFEC7
; ���������������������������������������������������������������������������

loc_BFE7F:				; CODE XREF: sub_BFE6E+68j
		mov	bx, [bp+var_2]
		mov	eax, [bx+5]
		les	bx, [bp+arg_2]
		cmp	eax, es:[bx]
		jnz	short loc_BFEA5
		mov	bx, [bp+var_2]
		mov	eax, [bx+9]
		les	bx, [bp+arg_2]
		cmp	eax, es:[bx+4]
		jnz	short loc_BFEA5
		mov	ax, 1
		jmp	short loc_BFEA7
; ���������������������������������������������������������������������������

loc_BFEA5:				; CODE XREF: sub_BFE6E+1Fj
					; sub_BFE6E+30j
		xor	ax, ax

loc_BFEA7:				; CODE XREF: sub_BFE6E+35j
		or	al, al
		jz	short loc_BFEC7
		mov	bx, [bp+var_2]
		cmp	word ptr [bx+0Eh], 0
		jnz	short loc_BFEBE
		push	[bp+var_2]
		push	cs
		call	near ptr sub_BFBCE
		add	sp, 2

loc_BFEBE:				; CODE XREF: sub_BFE6E+44j
		mov	bx, [bp+var_2]
		mov	ax, [bx+0Eh]
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_BFEC7:				; CODE XREF: sub_BFE6E+Fj
					; sub_BFE6E+3Bj
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	sub_2FF1E
		add	sp, 4
		or	ax, ax
		jnz	short loc_BFE7F
		xor	ax, ax
		pop	si
		leave
		retf
sub_BFE6E	endp

; ���������������������������������������������������������������������������
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_BFEE0	proc far		; CODE XREF: sub_4279AJ sub_C01BA+1Dp

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	short loc_BFF18
; ���������������������������������������������������������������������������

loc_BFEF1:				; CODE XREF: sub_BFEE0+47j
		mov	bx, [bp+var_2]
		mov	al, [bx+4]
		cmp	al, [bp+arg_2]
		jnz	short loc_BFF18
		mov	bx, [bp+var_2]
		cmp	word ptr [bx+0Eh], 0
		jnz	short loc_BFF0F
		push	[bp+var_2]
		push	cs
		call	near ptr sub_BFBCE
		add	sp, 2

loc_BFF0F:				; CODE XREF: sub_BFEE0+23j
		mov	bx, [bp+var_2]
		mov	ax, [bx+0Eh]
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_BFF18:				; CODE XREF: sub_BFEE0+Fj
					; sub_BFEE0+1Aj
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	sub_2FF1E
		add	sp, 4
		or	ax, ax
		jnz	short loc_BFEF1
		xor	ax, ax
		pop	si
		leave
		retf
sub_BFEE0	endp

; ���������������������������������������������������������������������������
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_BFF31	proc far		; CODE XREF: sub_4279FJ

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= byte ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	[bp+var_2], 0
		jmp	short loc_BFF50
; ���������������������������������������������������������������������������

loc_BFF46:				; CODE XREF: sub_BFF31+2Ej
		mov	bx, [bp+var_2]
		cmp	[bx+0Eh], di
		jnz	short loc_BFF50
		jmp	short loc_BFF61
; ���������������������������������������������������������������������������

loc_BFF50:				; CODE XREF: sub_BFF31+13j
					; sub_BFF31+1Bj
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	sub_2FF1E
		add	sp, 4
		or	ax, ax
		jnz	short loc_BFF46

loc_BFF61:				; CODE XREF: sub_BFF31+1Dj
		mov	ax, [bp+var_2]
		mov	[bp+var_4], ax
		jmp	short loc_BFF91
; ���������������������������������������������������������������������������

loc_BFF69:				; CODE XREF: sub_BFF31+6Fj
		mov	bx, [bp+var_2]
		mov	al, [bx+4]
		cmp	al, [bp+arg_4]
		jnz	short loc_BFF91
		mov	bx, [bp+var_2]
		cmp	word ptr [bx+0Eh], 0
		jnz	short loc_BFF87
		push	[bp+var_2]
		push	cs
		call	near ptr sub_BFBCE
		add	sp, 2

loc_BFF87:				; CODE XREF: sub_BFF31+4Aj
		mov	bx, [bp+var_2]
		mov	ax, [bx+0Eh]
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_BFF91:				; CODE XREF: sub_BFF31+36j
					; sub_BFF31+41j
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	sub_2FF1E
		add	sp, 4
		or	ax, ax
		jnz	short loc_BFF69
		mov	[bp+var_2], 0
		jmp	short loc_BFFD1
; ���������������������������������������������������������������������������

loc_BFFA9:				; CODE XREF: sub_BFF31+B7j
		mov	bx, [bp+var_2]
		mov	al, [bx+4]
		cmp	al, [bp+arg_4]
		jnz	short loc_BFFD1
		mov	bx, [bp+var_2]
		cmp	word ptr [bx+0Eh], 0
		jnz	short loc_BFFC7
		push	[bp+var_2]
		push	cs
		call	near ptr sub_BFBCE
		add	sp, 2

loc_BFFC7:				; CODE XREF: sub_BFF31+8Aj
		mov	bx, [bp+var_2]
		mov	ax, [bx+0Eh]
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_BFFD1:				; CODE XREF: sub_BFF31+76j
					; sub_BFF31+81j
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	sub_2FF1E
		add	sp, 4
		or	ax, ax
		jz	short loc_BFFEA
		mov	ax, [bp+var_2]
		cmp	ax, [bp+var_4]
		jnz	short loc_BFFA9

loc_BFFEA:				; CODE XREF: sub_BFF31+AFj
		xor	ax, ax
		pop	di
		pop	si
		leave
		retf
sub_BFF31	endp

; ���������������������������������������������������������������������������
		pop	di
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_BFFF4	proc far		; CODE XREF: sub_427B3J

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		nop
		push	cs
		call	near ptr sub_C003D
		add	sp, 2
		pop	si
		pop	bp
		retf
sub_BFFF4	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C0007	proc far		; CODE XREF: sub_42790J

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	byte ptr [si+11h], 14h
		mov	[bp+var_2], 0
		mov	word ptr [si+0Fh], 0
		mov	word ptr [si+12h], 0
		push	ds
		mov	ax, si
		add	ax, 6
		push	ax
		push	si
		nop
		push	cs
		call	near ptr sub_C017F
		add	sp, 6
		mov	ax, [si+12h]
		pop	si
		leave
		retf
sub_C0007	endp

; ���������������������������������������������������������������������������
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C003D	proc far		; CODE XREF: sub_427A9J sub_BFFF4+Ap

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	short loc_C0058
; ���������������������������������������������������������������������������

loc_C004E:				; CODE XREF: sub_C003D+2Aj
		push	[bp+var_2]
		push	cs
		call	near ptr sub_BFC61
		add	sp, 2

loc_C0058:				; CODE XREF: sub_C003D+Fj
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	sub_2FF1E
		add	sp, 4
		or	ax, ax
		jnz	short loc_C004E
		mov	word ptr [si+12h], 0
		pop	si
		leave
		retf
sub_C003D	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C0071	proc far		; CODE XREF: sub_427A4J

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	short loc_C00BF
; ���������������������������������������������������������������������������

loc_C0083:				; CODE XREF: sub_C0071+5Dj
		mov	bx, [bp+var_2]
		mov	di, [bx+0Eh]
		cmp	di, [bp+arg_2]
		jnz	short loc_C00BF
		push	[bp+var_2]
		push	cs
		call	near ptr sub_BFCBD
		add	sp, 2
		push	0
		push	[bp+var_2]
		push	si
		call	LinkedListB_FindAndDispatch_2FE19
		add	sp, 6
		cmp	[si+12h], di
		jnz	short loc_C00B0
		mov	word ptr [si+12h], 0

loc_C00B0:				; CODE XREF: sub_C0071+38j
		mov	ax, [si+0Fh]
		cmp	ax, [bp+var_2]
		jnz	short loc_C00BD
		mov	word ptr [si+0Fh], 0

loc_C00BD:				; CODE XREF: sub_C0071+45j
		jmp	short loc_C00D0
; ���������������������������������������������������������������������������

loc_C00BF:				; CODE XREF: sub_C0071+10j
					; sub_C0071+1Bj
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	sub_2FF1E
		add	sp, 4
		or	ax, ax
		jnz	short loc_C0083

loc_C00D0:				; CODE XREF: sub_C0071:loc_C00BDj
		pop	di
		pop	si
		leave
		retf
sub_C0071	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C00D4	proc far		; CODE XREF: sub_427AEJ sub_C01FB+64p	...

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	short loc_C0101
; ���������������������������������������������������������������������������

loc_C00E6:				; CODE XREF: sub_C00D4+3Cj
		mov	bx, [bp+var_2]
		mov	di, [bx+0Eh]
		cmp	di, [bp+arg_2]
		jnz	short loc_C0101
		push	[bp+var_2]
		push	cs
		call	near ptr sub_BFC61
		add	sp, 2
		mov	ax, [bp+var_2]
		mov	[si+0Fh], ax

loc_C0101:				; CODE XREF: sub_C00D4+10j
					; sub_C00D4+1Bj
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	sub_2FF1E
		add	sp, 4
		or	ax, ax
		jnz	short loc_C00E6
		pop	di
		pop	si
		leave
		retf
sub_C00D4	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C0116	proc far		; CODE XREF: sub_42763J sub_C0162+9p

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	short loc_C0144
; ���������������������������������������������������������������������������

loc_C0127:				; CODE XREF: sub_C0116+3Dj
		push	[bp+var_2]
		push	cs
		call	near ptr sub_BFCBD
		add	sp, 2
		push	0
		push	[bp+var_2]
		push	si
		call	LinkedListB_FindAndDispatch_2FE19
		add	sp, 6
		mov	[bp+var_2], 0

loc_C0144:				; CODE XREF: sub_C0116+Fj
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	sub_2FF1E
		add	sp, 4
		or	ax, ax
		jnz	short loc_C0127
		mov	word ptr [si+12h], 0
		mov	word ptr [si+0Fh], 0
		pop	si
		leave
		retf
sub_C0116	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C0162	proc far		; CODE XREF: sub_427CCJ sub_C0395+15p

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		push	cs
		call	near ptr sub_C0116
		add	sp, 2
		push	60B6h
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		pop	si
		pop	bp
		retf
sub_C0162	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C017F	proc far		; CODE XREF: sub_427B8J sub_C0007+27p

var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_1], 0
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr sub_BFE6E
		add	sp, 6
		mov	di, ax
		or	di, di
		jz	short loc_C01AF
		push	di
		push	si
		nop
		push	cs
		call	near ptr sub_C01FB
		add	sp, 4
		mov	[bp+var_1], al

loc_C01AF:				; CODE XREF: sub_C017F+21j
		mov	al, [bp+var_1]
		pop	di
		pop	si
		leave
		retf
sub_C017F	endp

; ���������������������������������������������������������������������������
		pop	di
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C01BA	proc far		; CODE XREF: sub_427BDJ

var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_1], 0
		mov	al, [si+11h]
		cmp	al, [bp+arg_2]
		jz	short loc_C01F0
		mov	al, [bp+arg_2]
		push	ax
		push	si
		push	cs
		call	near ptr sub_BFEE0
		add	sp, 4
		mov	di, ax
		or	di, di
		jz	short loc_C01F0
		push	di
		push	si
		nop
		push	cs
		call	near ptr sub_C01FB
		add	sp, 4
		mov	[bp+var_1], al

loc_C01F0:				; CODE XREF: sub_C01BA+15j
					; sub_C01BA+27j
		mov	al, [bp+var_1]
		pop	di
		pop	si
		leave
		retf
sub_C01BA	endp

; ���������������������������������������������������������������������������
		pop	di
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C01FB	proc far		; CODE XREF: sub_427C2J sub_C017F+27p	...

var_8		= word ptr -8
var_6		= dword	ptr -6
var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	[bp+var_1], 0
		cmp	[si+12h], di
		jnz	short loc_C0215
		jmp	loc_C02C5
; ���������������������������������������������������������������������������

loc_C0215:				; CODE XREF: sub_C01FB+15j
		mov	byte_4644D, 0
		or	di, di
		jnz	short loc_C0221
		jmp	loc_C02C5
; ���������������������������������������������������������������������������

loc_C0221:				; CODE XREF: sub_C01FB+21j
		mov	[bp+var_6], 100h
		lea	ax, [bp+var_6]
		push	ax
		push	62D0h
		call	Cockpit_PanAzimuthUpdate
		add	sp, 4
		cmp	word ptr [si+12h], 0
		jz	short loc_C024D
		push	word ptr [si+12h]
		mov	bx, [si+12h]
		mov	bx, [bx+50h]
		call	dword ptr [bx+4]
		add	sp, 2

loc_C024D:				; CODE XREF: sub_C01FB+41j
		push	di
		mov	bx, [di+50h]
		call	dword ptr [bx]
		add	sp, 2
		or	al, al
		jz	short loc_C0285
		push	word ptr [si+12h]
		push	si
		push	cs
		call	near ptr sub_C00D4
		add	sp, 4
		mov	[si+12h], di
		push	di
		mov	bx, [di+50h]
		call	dword ptr [bx+14h]
		add	sp, 2
		mov	[si+11h], al
		push	di
		mov	bx, [di+50h]
		call	dword ptr [bx+10h]
		add	sp, 2
		mov	[bp+var_1], 1
		jmp	short loc_C02C5
; ���������������������������������������������������������������������������

loc_C0285:				; CODE XREF: sub_C01FB+5Dj
		cmp	word ptr [si+12h], 0
		jz	short loc_C02C5
		mov	ax, [si+0Fh]
		mov	[bp+var_8], ax
		push	di
		push	si
		push	cs
		call	near ptr sub_C00D4
		add	sp, 4
		mov	ax, [bp+var_8]
		mov	[si+0Fh], ax
		push	word ptr [si+12h]
		mov	bx, [si+12h]
		mov	bx, [bx+50h]
		call	dword ptr [bx]
		add	sp, 2
		mov	ah, 0
		or	ax, ax
		jnz	short loc_C02B6
		jmp	short loc_C02C5
; ���������������������������������������������������������������������������

loc_C02B6:				; CODE XREF: sub_C01FB+B7j
		push	word ptr [si+12h]
		mov	bx, [si+12h]
		mov	bx, [bx+50h]
		call	dword ptr [bx+10h]
		add	sp, 2

loc_C02C5:				; CODE XREF: sub_C01FB+17j
					; sub_C01FB+23j ...
		mov	al, [bp+var_1]
		pop	di
		pop	si
		leave
		retf
sub_C01FB	endp

; ���������������������������������������������������������������������������
		pop	di
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C02D0	proc far		; CODE XREF: sub_427C7J

var_8		= dword	ptr -8
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	word ptr [si+12h], 0
		jz	short loc_C0342
		mov	bx, [si+12h]
		cmp	word ptr [bx+5Ch], 0
		jz	short loc_C0310
		mov	bx, [si+12h]
		push	word ptr [bx+5Ch]
		mov	bx, [si+12h]
		mov	bx, [bx+5Ch]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		add	sp, 2
		mov	bx, [si+12h]
		push	word ptr [bx+5Ch]
		mov	bx, [si+12h]
		mov	bx, [bx+5Ch]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 2
		jmp	short $+2

loc_C0310:				; CODE XREF: sub_C02D0+15j
		push	word ptr [si+12h]
		mov	bx, [si+12h]
		mov	bx, [bx+50h]
		call	dword ptr [bx+14h]
		add	sp, 2
		cmp	al, 4
		jz	short loc_C0342
		sub	sp, 4
		mov	ax, [si+12h]
		add	ax, 5Eh	; '^'
		mov	di, ax
		mov	eax, [di]
		mov	[bp+var_8], eax
		push	word ptr [si+12h]
		call	sub_42872
		add	sp, 6
		jmp	short $+2

loc_C0342:				; CODE XREF: sub_C02D0+Cj
					; sub_C02D0+51j
		pop	di
		pop	si
		pop	bp
		retf
sub_C02D0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C0346	proc far		; CODE XREF: sub_42768J

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_C0361
		push	14h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_C038D

loc_C0361:				; CODE XREF: sub_C0346+9j
		mov	word ptr [si], 2BDh
		xor	ax, ax
		mov	[si+4],	ax
		mov	[si+2],	ax
		mov	word ptr [si], 2DA8h
		mov	ax, si
		add	ax, 6
		push	ax
		call	sub_C7A3
		add	sp, 2
		mov	byte ptr [si+11h], 14h
		mov	word ptr [si+0Fh], 0
		mov	word ptr [si+12h], 0

loc_C038D:				; CODE XREF: sub_C0346+19j
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_C0346	endp

; ���������������������������������������������������������������������������
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C0395	proc far		; CODE XREF: sub_42772J

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_C03CC
		mov	word ptr [si], 2DA8h
		push	si
		push	cs
		call	near ptr sub_C0162
		add	sp, 2
		mov	word ptr [si], 2BDh
		push	si
		call	sub_2FEE0
		add	sp, 2
		test	di, 1
		jz	short loc_C03CC
		push	si
		call	sub_308
		add	sp, 2

loc_C03CC:				; CODE XREF: sub_C0395+Dj
					; sub_C0395+2Cj
		pop	di
		pop	si
		pop	bp
		retf
sub_C0395	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C03D0	proc far		; CODE XREF: sub_4276DJ

var_4		= byte ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	[bp+var_2], 0
		mov	word_490DA, 0
		mov	word_490DC, 0
		mov	word_490DE, 13Fh
		mov	word_490E0, 0C7h ; '�'
		push	0
		push	60B6h
		call	TextRenderer_ApplyFormatChange_2EA21
		add	sp, 4
		mov	word_45DC6, 0
		push	0
		push	large 524D4143h
		push	di
		call	ResourceRecord_SeekAndReadB_3C022
		add	sp, 8
		or	ax, ax
		jnz	short loc_C0426
		jmp	loc_C04DA
; ���������������������������������������������������������������������������

loc_C0426:				; CODE XREF: sub_C03D0+51j
		jmp	short loc_C04A5
; ���������������������������������������������������������������������������

loc_C0428:				; CODE XREF: sub_C03D0+FEj
		push	di
		call	ResourceRecord_ComputeAlignedBounds_3C431
		add	sp, 2
		mov	[bp+var_4], 14h
		cmp	dword ptr [di+6Dh], 524D4143h
		jnz	short loc_C0444
		mov	ax, 1
		jmp	short loc_C0446
; ���������������������������������������������������������������������������

loc_C0444:				; CODE XREF: sub_C03D0+6Dj
		xor	ax, ax

loc_C0446:				; CODE XREF: sub_C03D0+72j
		or	ax, ax
		jz	short loc_C044E
		mov	[bp+var_4], 0

loc_C044E:				; CODE XREF: sub_C03D0+78j
		cmp	dword ptr [di+6Dh], 54525453h
		jnz	short loc_C045D
		mov	ax, 1
		jmp	short loc_C045F
; ���������������������������������������������������������������������������

loc_C045D:				; CODE XREF: sub_C03D0+86j
		xor	ax, ax

loc_C045F:				; CODE XREF: sub_C03D0+8Bj
		or	ax, ax
		jz	short loc_C0472
		push	di
		mov	ax, si
		add	ax, 6
		push	ax
		call	String_ConstructFromPtrLen
		add	sp, 4

loc_C0472:				; CODE XREF: sub_C03D0+91j
		cmp	[bp+var_2], 0
		jz	short loc_C048A
		push	[bp+var_2]
		push	si
		push	cs
		call	near ptr EntityTracker_AddEntryObj
		add	sp, 4
		mov	[bp+var_2], 0
		jmp	short loc_C049D
; ���������������������������������������������������������������������������

loc_C048A:				; CODE XREF: sub_C03D0+A6j
		cmp	[bp+var_4], 14h
		jz	short loc_C049D
		push	di
		mov	al, [bp+var_4]
		push	ax
		push	si
		push	cs
		call	near ptr EntityTracker_AddEntryText
		add	sp, 6

loc_C049D:				; CODE XREF: sub_C03D0+B8j
					; sub_C03D0+BEj
		mov	eax, [di+76h]
		mov	[di+65h], eax

loc_C04A5:				; CODE XREF: sub_C03D0:loc_C0426j
		cmp	word ptr [di+7Ch], 0
		jnz	short loc_C04B6
		push	di
		call	ResourceRecord_ReadPayload_3C623
		add	sp, 2
		jmp	short loc_C04CA
; ���������������������������������������������������������������������������

loc_C04B6:				; CODE XREF: sub_C03D0+D9j
		mov	eax, [di+65h]
		mov	bx, [di+7Ch]
		cmp	eax, [bx+0Fh]
		jl	short loc_C04C8
		mov	ax, 1
		jmp	short loc_C04CA
; ���������������������������������������������������������������������������

loc_C04C8:				; CODE XREF: sub_C03D0+F1j
		xor	ax, ax

loc_C04CA:				; CODE XREF: sub_C03D0+E4j
					; sub_C03D0+F6j
		or	ax, ax
		jnz	short loc_C04D1
		jmp	loc_C0428
; ���������������������������������������������������������������������������

loc_C04D1:				; CODE XREF: sub_C03D0+FCj
		push	di
		call	ResourceRecord_ReleaseAndClear_3C595
		add	sp, 2

loc_C04DA:				; CODE XREF: sub_C03D0+53j
		pop	di
		pop	si
		leave
		retf
sub_C03D0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C04DE	proc far		; CODE XREF: sub_42745J

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		xor	ax, ax
		pop	bp
		retf
sub_C04DE	endp

; ���������������������������������������������������������������������������
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C04EA	proc far		; CODE XREF: sub_42740J

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_C0546
		cmp	byte ptr [si+15h], 0
		jz	short loc_C051F
		cmp	dword ptr [si+10h], 0
		jz	short loc_C051F
		push	0
		mov	al, [si+14h]
		push	ax
		mov	ax, si
		add	ax, 10h
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_C051F:				; CODE XREF: sub_C04EA+13j
					; sub_C04EA+1Aj
		mov	dword ptr [si+10h], 0
		mov	byte ptr [si+15h], 0
		mov	dword ptr [si+16h], 0
		test	di, 1
		jz	short loc_C0544
		push	si
		call	sub_308
		add	sp, 2
		jmp	short $+2

loc_C0544:				; CODE XREF: sub_C04EA+4Dj
		jmp	short $+2

loc_C0546:				; CODE XREF: sub_C04EA+Dj
		pop	di
		pop	si
		pop	bp
		retf
sub_C04EA	endp

; ���������������������������������������������������������������������������
		pop	di
		pop	si
		pop	bp
		retf
ovr214		ends
