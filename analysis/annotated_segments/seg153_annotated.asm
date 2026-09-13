seg153		segment	byte public 'CODE' use16
		assume cs:seg153
		;org 0Dh
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, aucun appel externe visible — modifie un champ de flags sur l'objet police/style.
; Appelée massivement par sub_5EDEC et les blocs voisins.
; ==============================================================================================
FontStyle_ClearFlag_5EAED	proc far		; CODE XREF: seg153:0240p seg153:02C3p ...

var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp

loc_5EAEE:
		mov	bp, sp
		sub	sp, 8

loc_5EAF3:
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
FontStyle_ClearFlag_5EAED	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, alloue (sub_658). Référencée via le thunk loc_5EEBE (tag 5C60h) — constructeur de la
; classe police/style de texte.
; ==============================================================================================
FontStyle_Construct_5EB18	proc far		; CODE XREF: seg153:loc_5EEC5p

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_5EB31
		push	79h ; 'y'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_5EB99

loc_5EB31:				; CODE XREF: FontStyle_Construct_5EB18+9j
		xor	eax, eax
		mov	[si+18h], eax
		mov	[si+14h], eax
		mov	[si+10h], eax
		mov	[si+0Ch], eax
		mov	[si+8],	eax
		mov	[si+4],	eax
		mov	[si], eax

loc_5EB4F:
		mov	dword ptr [si+1Ch], 33330000h
		mov	byte ptr [si+20h], 0
		and	byte ptr [si+64h], 0FDh
		xor	ax, ax
		mov	[si+68h], al
		mov	[si+67h], al
		mov	[si+66h], al
		mov	[si+65h], al
		xor	dx, dx
		jmp	short loc_5EB78
; ���������������������������������������������������������������������������

loc_5EB71:				; CODE XREF: FontStyle_Construct_5EB18+63j
		mov	bx, dx
		mov	byte ptr [bx+si+69h], 0
		inc	dx

loc_5EB78:				; CODE XREF: FontStyle_Construct_5EB18+57j
		cmp	dx, 7
		jl	short loc_5EB71
		mov	ax, 1209h
		mov	bx, 4143h
		int	15h
		or	ax, ax
		jnz	short loc_5EB95
		cmp	bx, 1209h
		jnz	short loc_5EB95
		or	byte ptr [si+64h], 1
		jmp	short loc_5EB99
; ���������������������������������������������������������������������������

loc_5EB95:				; CODE XREF: FontStyle_Construct_5EB18+6Fj
					; FontStyle_Construct_5EB18+75j
		and	byte ptr [si+64h], 0FEh

loc_5EB99:				; CODE XREF: FontStyle_Construct_5EB18+17j
					; FontStyle_Construct_5EB18+7Bj
		mov	ax, si
		pop	si
		pop	bp
		retf
FontStyle_Construct_5EB18	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle sub_18D5 puis libère (sub_338). Référencée via le thunk loc_5EECB (tag 5C60h) —
; destructeur de la classe police/style de texte.
; ==============================================================================================
FontStyle_Destruct_5EB9E	proc far		; CODE XREF: seg153:03F4p

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
		jz	short loc_5EC0E
		mov	al, [si+64h]
		and	ax, 1
		or	al, al
		jz	short loc_5EC00
		mov	[bp+var_8], ds
		mov	[bp+var_C], si
		mov	[bp+var_18], 0DE09h

loc_5EBC2:
		mov	dword ptr [si+1Ch], 33330000h

loc_5EBCA:
		lea	ax, [bp+var_18]
		push	ax
		push	67h ; 'g'
		call	CRT_Int86x
		add	sp, 4
		mov	ax, si
		add	ax, 20h	; ' '
		mov	[bp+var_2], ds

loc_5EBE0:
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

loc_5EC00:				; CODE XREF: FontStyle_Destruct_5EB9E+17j
		test	[bp+arg_2], 1
		jz	short loc_5EC0E
		push	si
		call	CRT_FreeNear_Wrap
		pop	cx

loc_5EC0E:				; CODE XREF: FontStyle_Destruct_5EB9E+Dj
					; FontStyle_Destruct_5EB9E+67j
		pop	di
		pop	si
		leave
		retf
FontStyle_Destruct_5EB9E	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine 4 indicateurs de style (bits 0x80 des champs +0x65..+0x68, probables
; gras/italique/souligné/barré) en un mot de flags composite (+0x1C). Référencée directement
; par TextRenderer_Main (sub_27477, seg048).
; ==============================================================================================
FontStyle_CombineFlags_5EC12	proc far		; CODE XREF: TextRenderer_Main+ABP
					; seg153:02A8p	...

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
		jnz	short loc_5EC2A
		jmp	loc_5ED07
; ���������������������������������������������������������������������������

loc_5EC2A:				; CODE XREF: FontStyle_CombineFlags_5EC12+13j
		mov	word ptr [bp+var_6+2], ds
		mov	word ptr [bp+var_6], si
		mov	dword ptr [si+1Ch], 0
		test	byte ptr [si+65h], 80h
		jz	short loc_5EC46
		or	dword ptr [si+1Ch], 303h

loc_5EC46:				; CODE XREF: FontStyle_CombineFlags_5EC12+2Aj
		test	byte ptr [si+66h], 80h
		jz	short loc_5EC54
		or	dword ptr [si+1Ch], 30Ch

loc_5EC54:				; CODE XREF: FontStyle_CombineFlags_5EC12+38j
		test	byte ptr [si+67h], 80h
		jz	short loc_5EC62

loc_5EC5A:
		or	dword ptr [si+1Ch], 330h

loc_5EC62:				; CODE XREF: FontStyle_CombineFlags_5EC12+46j
		test	byte ptr [si+68h], 80h
		jz	short loc_5EC70

loc_5EC68:
		or	dword ptr [si+1Ch], 3C0h

loc_5EC70:				; CODE XREF: FontStyle_CombineFlags_5EC12+54j
		mov	[bp+var_2], 0
		jmp	short loc_5EC9B
; ���������������������������������������������������������������������������

loc_5EC77:				; CODE XREF: FontStyle_CombineFlags_5EC12+8Dj
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

loc_5EC9B:				; CODE XREF: FontStyle_CombineFlags_5EC12+63j
		cmp	[bp+var_2], 4
		jl	short loc_5EC77
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
		jnz	short loc_5ECEC
		mov	[bp+var_2], 7
		jmp	short loc_5ECE6
; ���������������������������������������������������������������������������

loc_5ECC6:				; CODE XREF: FontStyle_CombineFlags_5EC12+D8j
		shl	byte ptr [si+20h], 1

loc_5ECC9:
		shl	byte ptr [si+21h], 1
		mov	bx, [bp+var_2]
		cmp	byte ptr [bx+si+69h], 0
		jz	short loc_5ECE3
		or	byte ptr [si+20h], 1
		cmp	byte ptr [bx+si+71h], 0
		jz	short loc_5ECE3

loc_5ECDF:
		or	byte ptr [si+21h], 1

loc_5ECE3:				; CODE XREF: FontStyle_CombineFlags_5EC12+C1j
					; FontStyle_CombineFlags_5EC12+CBj
		dec	[bp+var_2]

loc_5ECE6:				; CODE XREF: FontStyle_CombineFlags_5EC12+B2j
		cmp	[bp+var_2], 0
		jge	short loc_5ECC6

loc_5ECEC:				; CODE XREF: FontStyle_CombineFlags_5EC12+ABj
		mov	ax, si
		add	ax, 20h	; ' '
		mov	ax, si

loc_5ECF3:
		add	ax, 20h	; ' '
		mov	word ptr [bp+var_6+2], ds
		mov	word ptr [bp+var_6], ax
		les	di, [bp+var_6]
		mov	ax, 1209h
		mov	bx, 5352h
		int	15h

loc_5ED07:				; CODE XREF: FontStyle_CombineFlags_5EC12+15j
		pop	di
		pop	si
		leave
		retf
FontStyle_CombineFlags_5EC12	endp

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
		call	near ptr FontStyle_ClearFlag_5EAED
		push	dx
		push	ax
		pop	eax
		add	sp, 4
		mov	[bp-6],	eax
		mov	di, si

loc_5ED30:
		xor	dx, dx

loc_5ED32:
		jmp	short loc_5ED81
; ���������������������������������������������������������������������������

loc_5ED34:				; CODE XREF: seg153:02A4j
		mov	bx, dx

loc_5ED36:
		mov	al, [bx+si+65h]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_5ED7D
		mov	al, [bp+0Ch]
		mov	ah, 0
		cmp	ax, 1
		jz	short loc_5ED63
		cmp	ax, 2
		jz	short loc_5ED5B
		cmp	ax, 3
		jnz	short loc_5ED6B
		mov	bx, dx
		mov	byte ptr [bx+si+65h], 80h ; '�'

loc_5ED59:
		jmp	short loc_5ED71
; ���������������������������������������������������������������������������

loc_5ED5B:				; CODE XREF: seg153:026Cj
		mov	bx, dx
		mov	byte ptr [bx+si+65h], 81h ; '�'

loc_5ED61:
		jmp	short loc_5ED71
; ���������������������������������������������������������������������������

loc_5ED63:				; CODE XREF: seg153:0267j
		mov	bx, dx
		mov	byte ptr [bx+si+65h], 82h ; '�'
		jmp	short loc_5ED71
; ���������������������������������������������������������������������������

loc_5ED6B:				; CODE XREF: seg153:0271j
		mov	bx, dx
		mov	byte ptr [bx+si+65h], 83h ; '�'

loc_5ED71:				; CODE XREF: seg153:loc_5ED59j
					; seg153:loc_5ED61j ...
		mov	eax, [bp-6]
		mov	[di], eax
		mov	[bp-2],	dx
		jmp	short loc_5ED86
; ���������������������������������������������������������������������������

loc_5ED7D:				; CODE XREF: seg153:025Dj
		inc	dx
		add	di, 4

loc_5ED81:				; CODE XREF: seg153:loc_5ED32j
		cmp	dx, 4
		jl	short loc_5ED34

loc_5ED86:				; CODE XREF: seg153:029Bj
		push	si
		push	cs
		call	near ptr FontStyle_CombineFlags_5EC12
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
		call	near ptr FontStyle_ClearFlag_5EAED
		push	dx
		push	ax
		pop	eax
		add	sp, 4
		mov	[bp-4],	eax
		mov	byte ptr [bp-5], 0
		mov	di, si
		xor	dx, dx
		jmp	short loc_5EDDA
; ���������������������������������������������������������������������������

loc_5EDBB:				; CODE XREF: seg153:02FDj
		mov	bx, dx
		cmp	byte ptr [bx+si+65h], 0
		jz	short loc_5EDD6

loc_5EDC3:
		mov	eax, [di]

loc_5EDC6:
		cmp	eax, [bp-4]

loc_5EDCA:
		jnz	short loc_5EDD6
		mov	byte ptr [bx+si+65h], 0

loc_5EDD0:
		mov	byte ptr [bp-5], 1
		jmp	short loc_5EDDF
; ���������������������������������������������������������������������������

loc_5EDD6:				; CODE XREF: seg153:02E1j
					; seg153:loc_5EDCAj
		inc	dx

loc_5EDD7:
		add	di, 4

loc_5EDDA:				; CODE XREF: seg153:02D9j
		cmp	dx, 4
		jl	short loc_5EDBB

loc_5EDDF:				; CODE XREF: seg153:02F4j
		push	si
		push	cs
		call	near ptr FontStyle_CombineFlags_5EC12

loc_5EDE4:
		pop	cx

loc_5EDE5:
		mov	al, [bp-5]

loc_5EDE8:
		pop	di
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine FontStyle_ClearFlag_5EAED et FontStyle_CombineFlags_5EC12.
; ==============================================================================================
FontStyle_ApplyVariantB_5EDEC	proc far		; CODE XREF: Program_InitVideoFontArgs+65P
					; Program_InitVideoFontArgs+97P

var_6		= word ptr -6
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= dword	ptr  8
arg_6		= dword	ptr  0Ch
arg_A		= byte ptr  10h

		push	bp

loc_5EDED:
		mov	bp, sp
		sub	sp, 6
		push	si

loc_5EDF3:
		push	di
		mov	si, [bp+arg_0]
		push	large [bp+arg_2]
		push	cs
		call	near ptr FontStyle_ClearFlag_5EAED
		push	dx
		push	ax
		pop	eax
		add	sp, 4
		mov	[bp+var_4], eax
		mov	[bp+var_6], 0FFFFh
		mov	di, si
		add	di, 24h	; '$'
		cmp	[bp+arg_6], 0
		jle	short loc_5EE55
		xor	dx, dx
		jmp	short loc_5EE50
; ���������������������������������������������������������������������������

loc_5EE1F:				; CODE XREF: FontStyle_ApplyVariantB_5EDEC:loc_5EE53j
		mov	bx, dx
		mov	al, [bx+si+69h]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_5EE4C
		mov	byte ptr [bx+si+69h], 1
		mov	al, [bp+arg_A]
		mov	[bx+si+71h], al
		mov	eax, [bp+var_4]
		mov	[di], eax
		add	di, 4

loc_5EE3E:
		add	eax, [bp+arg_6]

loc_5EE42:
		dec	eax
		mov	[di], eax

loc_5EE47:
		mov	[bp+var_6], dx
		jmp	short loc_5EE55
; ���������������������������������������������������������������������������

loc_5EE4C:				; CODE XREF: FontStyle_ApplyVariantB_5EDEC+3Cj
		add	di, 8
		inc	dx

loc_5EE50:				; CODE XREF: FontStyle_ApplyVariantB_5EDEC+31j
		cmp	dx, 8

loc_5EE53:
		jl	short loc_5EE1F

loc_5EE55:				; CODE XREF: FontStyle_ApplyVariantB_5EDEC+2Dj
					; FontStyle_ApplyVariantB_5EDEC+5Ej
		push	si
		push	cs
		call	near ptr FontStyle_CombineFlags_5EC12
		pop	cx

loc_5EE5B:
		mov	ax, [bp+var_6]
		pop	di
		pop	si

locret_5EE60:
		leave
		retf
FontStyle_ApplyVariantB_5EDEC	endp

; ���������������������������������������������������������������������������
		push	bp

loc_5EE63:
		mov	bp, sp
		sub	sp, 6
		push	si
		push	di
		mov	si, [bp+6]
		push	large dword ptr	[bp+8]
		push	cs
		call	near ptr FontStyle_ClearFlag_5EAED
		push	dx
		push	ax
		pop	eax
		add	sp, 4
		mov	[bp-4],	eax
		mov	byte ptr [bp-5], 0
		mov	di, si
		add	di, 24h	; '$'
		xor	dx, dx
		jmp	short loc_5EEAC
; ���������������������������������������������������������������������������

loc_5EE8D:				; CODE XREF: seg153:03CFj
		mov	bx, dx
		cmp	byte ptr [bx+si+69h], 0
		jz	short loc_5EEA8
		mov	eax, [di]
		cmp	eax, [bp-4]
		jnz	short loc_5EEA8
		mov	byte ptr [bx+si+69h], 0
		mov	byte ptr [bp-5], 1
		jmp	short loc_5EEB1
; ���������������������������������������������������������������������������

loc_5EEA8:				; CODE XREF: seg153:03B3j seg153:03BCj
		add	di, 8
		inc	dx

loc_5EEAC:				; CODE XREF: seg153:03ABj
		cmp	dx, 8
		jl	short loc_5EE8D

loc_5EEB1:				; CODE XREF: seg153:03C6j
		push	si
		push	cs
		call	near ptr FontStyle_CombineFlags_5EC12
		pop	cx
		mov	al, [bp-5]
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, référencée via vtable (DATA XREF seg339), thunk appelant
; FontStyle_Construct_5EB18(tag=5C60h).
; ==============================================================================================
FontStyle_ConstructThunk_5EEBE:				; DATA XREF: seg339:4E88o
		push	bp
		mov	bp, sp

loc_5EEC1:
		push	5C60h
		push	cs

loc_5EEC5:
		call	near ptr FontStyle_Construct_5EB18
		pop	cx
		pop	bp
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, référencée via vtable (DATA XREF seg339), thunk appelant
; FontStyle_Destruct_5EB9E(tag=5C60h, flag=2).
; ==============================================================================================
FontStyle_DestructThunk_5EECB:				; DATA XREF: seg339:off_71FF2o
		push	bp
		mov	bp, sp
		push	2

loc_5EED0:
		push	5C60h
		push	cs
		call	near ptr FontStyle_Destruct_5EB9E
		add	sp, 4
		pop	bp
		retf
seg153		ends
