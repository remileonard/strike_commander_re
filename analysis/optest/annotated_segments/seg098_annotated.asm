seg098		segment	byte public 'CODE' use16
		assume cs:seg098
		;org 2
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; FontStyle_ClearFlag_5EAED (sub_5EAED de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants
; et contexte à revérifier ici. — far, aucun appel externe visible — modifie un champ de flags
; sur l'objet police/style. Appelée massivement par sub_5EDEC et les blocs voisins.
; ==============================================================================================
FontStyle_ClearFlag_2F362	proc far		; CODE XREF: seg098:0235p seg098:02B8p ...

var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 8

loc_2F368:				; DATA XREF: seg170:03E6o
		movzx	eax, [bp+arg_2]
		mov	[bp+var_4], eax
		movzx	eax, [bp+arg_0]
		mov	[bp+var_8], eax
		mov	eax, [bp+var_4]
		shl	eax, 4
		add	eax, [bp+var_8]
		shld	edx, eax, 10h
		leave
		retf
FontStyle_ClearFlag_2F362	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; FontStyle_Construct_5EB18 (sub_5EB18 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants
; et contexte à revérifier ici. — far, alloue (sub_658). Référencée via le thunk loc_5EEBE
; (tag 5C60h) — constructeur de la classe police/style de texte.
; ==============================================================================================
FontStyle_Construct_2F38D	proc far		; CODE XREF: seg098:03DAp

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_2F3A6
		push	79h ; 'y'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_2F40E

loc_2F3A6:				; CODE XREF: FontStyle_Construct_2F38D+9j
		xor	eax, eax
		mov	[si+18h], eax
		mov	[si+14h], eax
		mov	[si+10h], eax
		mov	[si+0Ch], eax
		mov	[si+8],	eax
		mov	[si+4],	eax
		mov	[si], eax
		mov	dword ptr [si+1Ch], 33330000h
		mov	byte ptr [si+20h], 0
		and	byte ptr [si+64h], 0FDh
		xor	ax, ax
		mov	[si+68h], al
		mov	[si+67h], al
		mov	[si+66h], al
		mov	[si+65h], al
		xor	dx, dx
		jmp	short loc_2F3ED
; ���������������������������������������������������������������������������

loc_2F3E6:				; CODE XREF: FontStyle_Construct_2F38D+63j
		mov	bx, dx
		mov	byte ptr [bx+si+69h], 0
		inc	dx

loc_2F3ED:				; CODE XREF: FontStyle_Construct_2F38D+57j
		cmp	dx, 7
		jl	short loc_2F3E6
		mov	ax, 1209h
		mov	bx, 4143h
		int	15h
		or	ax, ax
		jnz	short loc_2F40A
		cmp	bx, 1209h
		jnz	short loc_2F40A
		or	byte ptr [si+64h], 1
		jmp	short loc_2F40E
; ���������������������������������������������������������������������������

loc_2F40A:				; CODE XREF: FontStyle_Construct_2F38D+6Fj
					; FontStyle_Construct_2F38D+75j
		and	byte ptr [si+64h], 0FEh

loc_2F40E:				; CODE XREF: FontStyle_Construct_2F38D+17j
					; FontStyle_Construct_2F38D+7Bj
		mov	ax, si
		pop	si
		pop	bp
		retf
FontStyle_Construct_2F38D	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; FontStyle_Destruct_5EB9E (sub_5EB9E de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants
; et contexte à revérifier ici. — far, appelle sub_18D5 puis libère (sub_338). Référencée via
; le thunk loc_5EECB (tag 5C60h) — destructeur de la classe police/style de texte.
; ==============================================================================================
FontStyle_Destruct_2F413	proc far		; CODE XREF: seg098:03E9p

var_18		= word ptr -18h
var_C		= word ptr -0Ch
var_8		= word ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 18h
		push	si
		push	di
		mov	si, [bp+arg_0]
		or	si, si
		jz	short loc_2F483
		mov	al, [si+64h]
		and	ax, 1
		or	al, al
		jz	short loc_2F475
		mov	[bp+var_8], ds
		mov	[bp+var_C], si
		mov	[bp+var_18], 0DE09h
		mov	dword ptr [si+1Ch], 33330000h
		lea	ax, [bp+var_18]
		push	ax
		push	67h ; 'g'
		call	CRT_Int86x
		add	sp, 4
		mov	ax, si
		add	ax, 20h	; ' '
		mov	[bp+var_2], ds
		mov	ax, si
		add	ax, 20h	; ' '
		mov	[bp+var_4], ax
		mov	byte ptr [si+20h], 0
		and	byte ptr [si+64h], 0FEh
		mov	ax, [bp+var_2]
		mov	es, ax
		mov	ax, 1209h
		mov	bx, 5352h
		mov	di, [bp+var_4]
		int	15h

loc_2F475:				; CODE XREF: FontStyle_Destruct_2F413+17j
		test	[bp+arg_2], 1
		jz	short loc_2F483
		push	si
		call	sub_308
		pop	cx

loc_2F483:				; CODE XREF: FontStyle_Destruct_2F413+Dj
					; FontStyle_Destruct_2F413+67j
		pop	di
		pop	si
		leave
		retf
FontStyle_Destruct_2F413	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; FontStyle_CombineFlags_5EC12 (sub_5EC12 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, combine 4 indicateurs de style (bits 0x80 des
; champs +0x65..+0x68, probables gras/italique/souligné/barré) en un mot de flags composite
; (+0x1C). Référencée directement par TextRenderer_Main (sub_27477, seg048).
; ==============================================================================================
FontStyle_CombineFlags_2F487	proc far		; CODE XREF: seg098:029Dp seg098:02F6p ...

var_6		= dword	ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	al, [si+64h]
		and	ax, 1
		or	al, al
		jnz	short loc_2F49F
		jmp	loc_2F57C
; ���������������������������������������������������������������������������

loc_2F49F:				; CODE XREF: FontStyle_CombineFlags_2F487+13j
		mov	word ptr [bp+var_6+2], ds
		mov	word ptr [bp+var_6], si
		mov	dword ptr [si+1Ch], 0
		test	byte ptr [si+65h], 80h
		jz	short loc_2F4BB
		or	dword ptr [si+1Ch], 303h

loc_2F4BB:				; CODE XREF: FontStyle_CombineFlags_2F487+2Aj
		test	byte ptr [si+66h], 80h
		jz	short loc_2F4C9
		or	dword ptr [si+1Ch], 30Ch

loc_2F4C9:				; CODE XREF: FontStyle_CombineFlags_2F487+38j
		test	byte ptr [si+67h], 80h
		jz	short loc_2F4D7
		or	dword ptr [si+1Ch], 330h

loc_2F4D7:				; CODE XREF: FontStyle_CombineFlags_2F487+46j
		test	byte ptr [si+68h], 80h
		jz	short loc_2F4E5
		or	dword ptr [si+1Ch], 3C0h

loc_2F4E5:				; CODE XREF: FontStyle_CombineFlags_2F487+54j
		mov	[bp+var_2], 0
		jmp	short loc_2F510
; ���������������������������������������������������������������������������

loc_2F4EC:				; CODE XREF: FontStyle_CombineFlags_2F487+8Dj
		mov	bx, [bp+var_2]
		mov	al, [bx+si+65h]
		mov	ah, 0
		and	ax, 3
		movsx	eax, ax
		mov	dl, byte ptr [bp+var_2]
		shl	dl, 2
		add	dl, 10h
		mov	cl, dl
		shl	eax, cl
		or	[si+1Ch], eax
		inc	[bp+var_2]

loc_2F510:				; CODE XREF: FontStyle_CombineFlags_2F487+63j
		cmp	[bp+var_2], 4
		jl	short loc_2F4EC
		les	di, [bp+var_6]
		mov	ax, 0DE09h
		int	67h		;  - LIM EMS Program Interface - SET DEBUG REGISTERS
					; ES:DI	-> array of 8 DWORDs holding new values	of debug registers
					; Return: AH = 00h
		mov	byte ptr [si+20h], 0
		mov	byte ptr [si+21h], 0
		mov	al, [si+64h]
		shr	ax, 1
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jnz	short loc_2F561
		mov	[bp+var_2], 7
		jmp	short loc_2F55B
; ���������������������������������������������������������������������������

loc_2F53B:				; CODE XREF: FontStyle_CombineFlags_2F487+D8j
		shl	byte ptr [si+20h], 1
		shl	byte ptr [si+21h], 1
		mov	bx, [bp+var_2]
		cmp	byte ptr [bx+si+69h], 0
		jz	short loc_2F558
		or	byte ptr [si+20h], 1
		cmp	byte ptr [bx+si+71h], 0
		jz	short loc_2F558
		or	byte ptr [si+21h], 1

loc_2F558:				; CODE XREF: FontStyle_CombineFlags_2F487+C1j
					; FontStyle_CombineFlags_2F487+CBj
		dec	[bp+var_2]

loc_2F55B:				; CODE XREF: FontStyle_CombineFlags_2F487+B2j
		cmp	[bp+var_2], 0
		jge	short loc_2F53B

loc_2F561:				; CODE XREF: FontStyle_CombineFlags_2F487+ABj
		mov	ax, si
		add	ax, 20h	; ' '
		mov	ax, si
		add	ax, 20h	; ' '
		mov	word ptr [bp+var_6+2], ds
		mov	word ptr [bp+var_6], ax
		les	di, [bp+var_6]
		mov	ax, 1209h
		mov	bx, 5352h
		int	15h

loc_2F57C:				; CODE XREF: FontStyle_CombineFlags_2F487+15j
		pop	di
		pop	si
		leave
		retf
FontStyle_CombineFlags_2F487	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		push	di
		mov	si, [bp+6]
		mov	word ptr [bp-2], 0FFFFh
		push	large dword ptr	[bp+8]
		push	cs
		call	near ptr FontStyle_ClearFlag_2F362
		push	dx
		push	ax
		pop	eax
		add	sp, 4
		mov	[bp-6],	eax
		mov	di, si
		xor	dx, dx
		jmp	short loc_2F5F6
; ���������������������������������������������������������������������������

loc_2F5A9:				; CODE XREF: seg098:0299j
		mov	bx, dx
		mov	al, [bx+si+65h]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_2F5F2
		mov	al, [bp+0Ch]
		mov	ah, 0
		cmp	ax, 1
		jz	short loc_2F5D8
		cmp	ax, 2
		jz	short loc_2F5D0
		cmp	ax, 3
		jnz	short loc_2F5E0
		mov	bx, dx
		mov	byte ptr [bx+si+65h], 80h ; '�'
		jmp	short loc_2F5E6
; ���������������������������������������������������������������������������

loc_2F5D0:				; CODE XREF: seg098:0261j
		mov	bx, dx
		mov	byte ptr [bx+si+65h], 81h ; '�'
		jmp	short loc_2F5E6
; ���������������������������������������������������������������������������

loc_2F5D8:				; CODE XREF: seg098:025Cj
		mov	bx, dx
		mov	byte ptr [bx+si+65h], 82h ; '�'
		jmp	short loc_2F5E6
; ���������������������������������������������������������������������������

loc_2F5E0:				; CODE XREF: seg098:0266j
		mov	bx, dx
		mov	byte ptr [bx+si+65h], 83h ; '�'

loc_2F5E6:				; CODE XREF: seg098:026Ej seg098:0276j ...
		mov	eax, [bp-6]
		mov	[di], eax
		mov	[bp-2],	dx
		jmp	short loc_2F5FB
; ���������������������������������������������������������������������������

loc_2F5F2:				; CODE XREF: seg098:0252j
		inc	dx
		add	di, 4

loc_2F5F6:				; CODE XREF: seg098:0247j
		cmp	dx, 4
		jl	short loc_2F5A9

loc_2F5FB:				; CODE XREF: seg098:0290j
		push	si
		push	cs
		call	near ptr FontStyle_CombineFlags_2F487
		pop	cx
		mov	ax, [bp-2]
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		push	di
		mov	si, [bp+6]
		push	large dword ptr	[bp+8]
		push	cs
		call	near ptr FontStyle_ClearFlag_2F362
		push	dx
		push	ax
		pop	eax
		add	sp, 4
		mov	[bp-4],	eax
		mov	byte ptr [bp-5], 0
		mov	di, si
		xor	dx, dx
		jmp	short loc_2F64F
; ���������������������������������������������������������������������������

loc_2F630:				; CODE XREF: seg098:02F2j
		mov	bx, dx
		cmp	byte ptr [bx+si+65h], 0
		jz	short loc_2F64B
		mov	eax, [di]
		cmp	eax, [bp-4]
		jnz	short loc_2F64B
		mov	byte ptr [bx+si+65h], 0
		mov	byte ptr [bp-5], 1
		jmp	short loc_2F654
; ���������������������������������������������������������������������������

loc_2F64B:				; CODE XREF: seg098:02D6j seg098:02DFj
		inc	dx
		add	di, 4

loc_2F64F:				; CODE XREF: seg098:02CEj
		cmp	dx, 4
		jl	short loc_2F630

loc_2F654:				; CODE XREF: seg098:02E9j
		push	si
		push	cs
		call	near ptr FontStyle_CombineFlags_2F487
		pop	cx
		mov	al, [bp-5]
		pop	di
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; FontStyle_ApplyVariantB_5EDEC (sub_5EDEC de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, combine FontStyle_ClearFlag_5EAED et
; FontStyle_CombineFlags_5EC12.
; ==============================================================================================
FontStyle_ApplyVariantB_2F661	proc far		; CODE XREF: sub_3166+41P sub_3166+60P ...

var_6		= word ptr -6
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= dword	ptr  8
arg_6		= dword	ptr  0Ch
arg_A		= byte ptr  10h

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	large [bp+arg_2]
		push	cs
		call	near ptr FontStyle_ClearFlag_2F362
		push	dx
		push	ax
		pop	eax
		add	sp, 4
		mov	[bp+var_4], eax
		mov	[bp+var_6], 0FFFFh
		mov	di, si
		add	di, 24h	; '$'
		cmp	[bp+arg_6], 0
		jle	short loc_2F6CA
		xor	dx, dx
		jmp	short loc_2F6C5
; ���������������������������������������������������������������������������

loc_2F694:				; CODE XREF: FontStyle_ApplyVariantB_2F661+67j
		mov	bx, dx
		mov	al, [bx+si+69h]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_2F6C1
		mov	byte ptr [bx+si+69h], 1
		mov	al, [bp+arg_A]
		mov	[bx+si+71h], al
		mov	eax, [bp+var_4]
		mov	[di], eax
		add	di, 4
		add	eax, [bp+arg_6]
		dec	eax
		mov	[di], eax
		mov	[bp+var_6], dx
		jmp	short loc_2F6CA
; ���������������������������������������������������������������������������

loc_2F6C1:				; CODE XREF: FontStyle_ApplyVariantB_2F661+3Cj
		add	di, 8
		inc	dx

loc_2F6C5:				; CODE XREF: FontStyle_ApplyVariantB_2F661+31j
		cmp	dx, 8
		jl	short loc_2F694

loc_2F6CA:				; CODE XREF: FontStyle_ApplyVariantB_2F661+2Dj
					; FontStyle_ApplyVariantB_2F661+5Ej
		push	si
		push	cs
		call	near ptr FontStyle_CombineFlags_2F487
		pop	cx
		mov	ax, [bp+var_6]
		pop	di
		pop	si
		leave
		retf
FontStyle_ApplyVariantB_2F661	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		push	di
		mov	si, [bp+6]
		push	large dword ptr	[bp+8]
		push	cs
		call	near ptr FontStyle_ClearFlag_2F362
		push	dx
		push	ax
		pop	eax
		add	sp, 4
		mov	[bp-4],	eax
		mov	byte ptr [bp-5], 0
		mov	di, si
		add	di, 24h	; '$'
		xor	dx, dx
		jmp	short loc_2F721
; ���������������������������������������������������������������������������

loc_2F702:				; CODE XREF: seg098:03C4j
		mov	bx, dx
		cmp	byte ptr [bx+si+69h], 0
		jz	short loc_2F71D
		mov	eax, [di]
		cmp	eax, [bp-4]
		jnz	short loc_2F71D
		mov	byte ptr [bx+si+69h], 0
		mov	byte ptr [bp-5], 1
		jmp	short loc_2F726
; ���������������������������������������������������������������������������

loc_2F71D:				; CODE XREF: seg098:03A8j seg098:03B1j
		add	di, 8
		inc	dx

loc_2F721:				; CODE XREF: seg098:03A0j
		cmp	dx, 8
		jl	short loc_2F702

loc_2F726:				; CODE XREF: seg098:03BBj
		push	si
		push	cs
		call	near ptr FontStyle_CombineFlags_2F487
		pop	cx
		mov	al, [bp-5]
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_2F733:				; DATA XREF: dseg:5946o
		push	bp
		mov	bp, sp
		push	6640h
		push	cs
		call	near ptr FontStyle_Construct_2F38D
		pop	cx
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_2F740:				; DATA XREF: dseg:59E2o
		push	bp
		mov	bp, sp
		push	2
		push	6640h
		push	cs
		call	near ptr FontStyle_Destruct_2F413
		add	sp, 4
		pop	bp
		retf
seg098		ends
