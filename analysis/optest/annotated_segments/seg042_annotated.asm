seg042		segment	byte public 'CODE' use16
		assume cs:seg042
		;org 7
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing
		push	bp
		mov	bp, sp

loc_1B51A:				; DATA XREF: seg170:020Eo
		sub	sp, 14h
		push	si
		push	di
		mov	di, [bp+6]
		mov	si, [bp+8]
		mov	eax, [si+0Eh]
		mov	[bp-4],	eax
		mov	eax, [si+24h]
		mov	[bp-8],	eax
		mov	eax, [si+3Ah]
		mov	[bp-0Ch], eax
		mov	eax, [bp-0Ch]
		cmp	eax, [bp-8]
		jle	short loc_1B55F
		mov	eax, [bp-8]
		mov	[bp-10h], eax
		mov	eax, [bp-0Ch]
		mov	[bp-8],	eax
		mov	eax, [bp-10h]
		mov	[bp-0Ch], eax

loc_1B55F:				; CODE XREF: seg042:0035j
		mov	eax, [bp-8]
		cmp	eax, [bp-4]
		jle	short loc_1B581
		mov	eax, [bp-4]
		mov	[bp-10h], eax
		mov	eax, [bp-8]
		mov	[bp-4],	eax
		mov	eax, [bp-10h]
		mov	[bp-8],	eax

loc_1B581:				; CODE XREF: seg042:0057j
		mov	eax, [bp-0Ch]
		cmp	eax, [bp-8]
		jle	short loc_1B5A3
		mov	eax, [bp-8]
		mov	[bp-10h], eax
		mov	eax, [bp-0Ch]
		mov	[bp-8],	eax
		mov	eax, [bp-10h]
		mov	[bp-0Ch], eax

loc_1B5A3:				; CODE XREF: seg042:0079j
		mov	eax, [bp-4]
		add	eax, [bp-0Ch]
		mov	[bp-14h], eax
		mov	eax, [bp-14h]
		sar	eax, 1
		mov	edx, [bp-14h]
		sar	edx, 4
		add	eax, edx
		cmp	eax, [bp-4]
		jge	short loc_1B5F0
		push	word ptr [bp+12h]
		push	word ptr [bp+10h]
		push	0
		push	word ptr [bp+0Eh]
		push	word ptr [bp+0Ch]
		push	word ptr [bp+0Ah]
		mov	ax, si
		add	ax, 2Ch	; ','
		push	ax
		mov	ax, si
		add	ax, 16h
		push	ax
		push	si
		push	di
		call	sub_19C02
		add	sp, 14h
		jmp	short loc_1B60C
; ���������������������������������������������������������������������������

loc_1B5F0:				; CODE XREF: seg042:00B5j
		push	word ptr [bp+12h]
		push	word ptr [bp+10h]
		push	word ptr [bp+0Eh]
		push	word ptr [bp+0Ch]
		push	word ptr [bp+0Ah]
		push	ds
		push	si
		push	3
		push	di
		call	Render_MeshPrimitive_283D0
		add	sp, 12h

loc_1B60C:				; CODE XREF: seg042:00DEj
		pop	di
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_1B610	proc far		; CODE XREF: seg042:07EDp seg042:092Cp ...

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_2]
		mov	di, [bp+arg_4]
		mov	al, [si+4]
		push	ax
		push	word ptr [di+2]
		push	word ptr [di]
		push	word ptr [si+2]
		push	word ptr [si]
		push	[bp+arg_0]
		call	Render_FillClippedRect_326E6
		add	sp, 0Ch
		mov	al, [di+4]
		push	ax
		mov	bx, [bp+arg_6]
		push	word ptr [bx+2]
		mov	bx, [bp+arg_6]
		push	word ptr [bx]
		push	word ptr [di+2]
		push	word ptr [di]
		push	[bp+arg_0]
		call	Render_FillClippedRect_326E6
		add	sp, 0Ch
		mov	bx, [bp+arg_6]
		mov	al, [bx+4]
		push	ax
		mov	bx, [bp+arg_6]
		push	word ptr [bx+2]
		mov	bx, [bp+arg_6]
		push	word ptr [bx]
		push	word ptr [si+2]
		push	word ptr [si]
		push	[bp+arg_0]
		call	Render_FillClippedRect_326E6
		add	sp, 0Ch
		pop	di
		pop	si
		pop	bp
		retf
sub_1B610	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_1B679	proc far		; CODE XREF: sub_1B829+5Cp

var_30		= dword	ptr -30h
var_2C		= dword	ptr -2Ch
var_28		= dword	ptr -28h
var_24		= dword	ptr -24h
var_20		= dword	ptr -20h
var_1C		= dword	ptr -1Ch
var_18		= dword	ptr -18h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 30h
		les	bx, [bp+arg_0]
		les	bx, es:[bx+19h]
		mov	eax, es:[bx]
		les	bx, [bp+arg_0]
		les	bx, es:[bx+21h]
		sub	eax, es:[bx]
		mov	[bp+var_C], eax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+19h]
		mov	eax, es:[bx+4]
		les	bx, [bp+arg_0]
		les	bx, es:[bx+21h]
		sub	eax, es:[bx+4]
		mov	[bp+var_8], eax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+19h]
		mov	eax, es:[bx+8]
		les	bx, [bp+arg_0]
		les	bx, es:[bx+21h]
		sub	eax, es:[bx+8]
		mov	[bp+var_4], eax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+19h]
		mov	eax, es:[bx]
		les	bx, [bp+arg_0]
		les	bx, es:[bx+1Dh]
		sub	eax, es:[bx]
		mov	[bp+var_18], eax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+19h]
		mov	eax, es:[bx+4]
		les	bx, [bp+arg_0]
		les	bx, es:[bx+1Dh]
		sub	eax, es:[bx+4]
		mov	[bp+var_14], eax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+19h]
		mov	eax, es:[bx+8]
		les	bx, [bp+arg_0]
		les	bx, es:[bx+1Dh]
		sub	eax, es:[bx+8]
		mov	[bp+var_10], eax
		lea	ax, [bp+var_18]
		push	ax
		lea	ax, [bp+var_C]
		push	ax
		push	ss
		lea	ax, [bp+var_30]
		push	ax
		call	sub_237BC
		add	sp, 8
		mov	eax, [bp+var_30]
		mov	[bp+var_24], eax
		mov	eax, [bp+var_2C]
		mov	[bp+var_20], eax
		mov	eax, [bp+var_28]
		mov	[bp+var_1C], eax
		lea	ax, [bp+var_24]
		push	ax
		call	Vector_Normalize3D_241B4
		add	sp, 2
		les	bx, [bp+arg_0]
		mov	eax, [bp+var_24]
		mov	es:[bx+1], eax
		les	bx, [bp+arg_0]
		mov	eax, [bp+var_20]
		mov	es:[bx+5], eax
		les	bx, [bp+arg_0]
		mov	eax, [bp+var_1C]
		mov	es:[bx+9], eax
		leave
		retf
sub_1B679	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_1B782	proc far		; CODE XREF: sub_1B829+69p

arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		les	bx, es:[bx+19h]
		mov	eax, es:[bx]
		les	bx, [bp+arg_0]
		les	bx, es:[bx+1Dh]
		add	eax, es:[bx]
		les	bx, [bp+arg_0]
		les	bx, es:[bx+21h]
		add	eax, es:[bx]
		mov	ebx, 3
		cdq
		idiv	ebx
		les	bx, [bp+arg_0]
		mov	es:[bx+0Dh], eax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+19h]
		mov	eax, es:[bx+4]
		les	bx, [bp+arg_0]
		les	bx, es:[bx+1Dh]
		add	eax, es:[bx+4]
		les	bx, [bp+arg_0]
		les	bx, es:[bx+21h]
		add	eax, es:[bx+4]
		mov	ebx, 3
		cdq
		idiv	ebx
		les	bx, [bp+arg_0]
		mov	es:[bx+11h], eax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+19h]
		mov	eax, es:[bx+8]
		les	bx, [bp+arg_0]
		les	bx, es:[bx+1Dh]
		add	eax, es:[bx+8]
		les	bx, [bp+arg_0]
		les	bx, es:[bx+21h]
		add	eax, es:[bx+8]
		mov	ebx, 3
		cdq
		idiv	ebx
		les	bx, [bp+arg_0]
		mov	es:[bx+15h], eax
		pop	bp
		retf
sub_1B782	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_1B829	proc far		; CODE XREF: sub_1BAF8+22p
					; sub_1BD0E+23p ...

arg_0		= dword	ptr  6
arg_4		= dword	ptr  0Ah
arg_8		= dword	ptr  0Eh
arg_C		= dword	ptr  12h
arg_10		= dword	ptr  16h

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		mov	eax, [bp+arg_4]
		mov	es:[bx+19h], eax
		les	bx, [bp+arg_0]
		mov	eax, [bp+arg_8]
		mov	es:[bx+1Dh], eax
		les	bx, [bp+arg_0]
		mov	eax, [bp+arg_C]
		mov	es:[bx+21h], eax
		les	bx, [bp+arg_10]
		mov	al, es:[bx+7]
		and	ax, 1
		les	bx, [bp+arg_0]
		and	byte ptr es:[bx+25h], 0FEh
		or	es:[bx+25h], al
		les	bx, [bp+arg_10]
		mov	al, es:[bx+5]
		and	ax, 1
		les	bx, [bp+arg_0]
		and	byte ptr es:[bx+25h], 0FDh
		shl	al, 1
		or	es:[bx+25h], al
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		push	cs
		call	near ptr sub_1B679
		add	sp, 4
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		push	cs
		call	near ptr sub_1B782
		add	sp, 4
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+1]
		les	bx, [bp+arg_0]
		les	bx, es:[bx+19h]
		add	es:[bx+0Ch], eax
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+5]
		les	bx, [bp+arg_0]
		les	bx, es:[bx+19h]
		add	es:[bx+10h], eax
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+9]
		les	bx, [bp+arg_0]
		les	bx, es:[bx+19h]
		add	es:[bx+14h], eax
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+1]
		les	bx, [bp+arg_0]
		les	bx, es:[bx+1Dh]
		add	es:[bx+0Ch], eax
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+5]
		les	bx, [bp+arg_0]
		les	bx, es:[bx+1Dh]
		add	es:[bx+10h], eax
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+9]
		les	bx, [bp+arg_0]
		les	bx, es:[bx+1Dh]
		add	es:[bx+14h], eax
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+1]
		les	bx, [bp+arg_0]
		les	bx, es:[bx+21h]
		add	es:[bx+0Ch], eax
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+5]
		les	bx, [bp+arg_0]
		les	bx, es:[bx+21h]
		add	es:[bx+10h], eax
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+9]
		les	bx, [bp+arg_0]
		les	bx, es:[bx+21h]
		add	es:[bx+14h], eax
		pop	bp
		retf
sub_1B829	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_1B94E	proc far		; CODE XREF: sub_1C0AC+25p
					; sub_1C33D+25p ...

arg_0		= dword	ptr  6
arg_4		= dword	ptr  0Ah
arg_8		= dword	ptr  0Eh
arg_C		= dword	ptr  12h
arg_10		= dword	ptr  16h

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		mov	eax, [bp+arg_4]
		mov	es:[bx+6], eax
		les	bx, [bp+arg_0]
		mov	eax, [bp+arg_8]
		mov	es:[bx+0Ah], eax
		les	bx, [bp+arg_0]
		mov	eax, [bp+arg_C]
		mov	es:[bx+0Eh], eax
		les	bx, [bp+arg_0]
		mov	eax, [bp+arg_10]
		mov	es:[bx+12h], eax
		pop	bp
		retf
sub_1B94E	endp

; ���������������������������������������������������������������������������

loc_1B983:				; DATA XREF: dseg:3025o dseg:3071o ...
		push	bp
		mov	bp, sp
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_1B988:				; DATA XREF: dseg:3001o dseg:3029o ...
		push	bp
		mov	bp, sp
		les	bx, [bp+6]
		les	bx, es:[bx+0Ah]
		mov	al, es:[bx+11h]
		shr	ax, 3
		and	ax, 1
		les	bx, [bp+6]
		les	bx, es:[bx+0Eh]
		mov	dl, es:[bx+11h]
		shr	dx, 3
		and	dx, 1
		and	al, dl
		les	bx, [bp+6]
		les	bx, es:[bx+12h]
		mov	dl, es:[bx+11h]
		shr	dx, 3
		and	dx, 1
		and	al, dl
		pop	bp
		retf
; ���������������������������������������������������������������������������
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_1B9C6:				; DATA XREF: dseg:3005o dseg:302Do ...
		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		les	bx, [bp+6]
		les	bx, es:[bx+0Ah]
		mov	eax, es:[bx+9]
		mov	[bp-4],	eax
		les	bx, [bp+6]
		les	bx, es:[bx+0Eh]
		mov	eax, es:[bx+9]
		mov	[bp-8],	eax
		mov	eax, [bp-8]
		cmp	eax, [bp-4]
		jle	short loc_1BA00
		mov	eax, [bp-8]
		mov	[bp-4],	eax
		jmp	short $+2

loc_1BA00:				; CODE XREF: seg042:04E4j
		les	bx, [bp+6]
		les	bx, es:[bx+12h]
		mov	eax, es:[bx+9]
		mov	[bp-0Ch], eax
		mov	eax, [bp-0Ch]
		cmp	eax, [bp-4]
		jle	short loc_1BA24
		mov	eax, [bp-0Ch]
		mov	[bp-4],	eax
		jmp	short $+2

loc_1BA24:				; CODE XREF: seg042:0508j
		les	bx, [bp+6]
		mov	eax, [bp-4]
		mov	es:[bx+2], eax
		leave
		retf
; ���������������������������������������������������������������������������

loc_1BA32:				; DATA XREF: dseg:308Do dseg:3149o
		push	bp
		mov	bp, sp
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_1BA37:				; DATA XREF: dseg:3009o dseg:3031o ...
		push	bp
		mov	bp, sp
		mov	al, 0
		pop	bp
		retf
; ���������������������������������������������������������������������������
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_1BA40:				; DATA XREF: dseg:3015o dseg:303Do ...
		push	bp
		mov	bp, sp
		push	si
		les	bx, [bp+6]
		mov	ax, es:[bx+0Ah]
		xor	dx, dx
		sub	ax, [bp+0Ah]
		sbb	dx, 0
		shl	eax, 10h
		shrd	eax, edx, 10h
		mov	ebx, 12h
		cdq
		idiv	ebx
		mov	dx, 12h
		imul	dx
		mov	dx, [bp+10h]
		mov	bx, [bp+0Eh]
		add	bx, ax
		les	si, [bp+6]
		mov	es:[si+0Ch], dx
		mov	es:[si+0Ah], bx
		les	bx, [bp+6]
		mov	ax, es:[bx+0Eh]
		xor	dx, dx
		sub	ax, [bp+0Ah]
		sbb	dx, 0
		shl	eax, 10h
		shrd	eax, edx, 10h
		mov	ebx, 12h
		cdq
		idiv	ebx
		mov	dx, 12h
		imul	dx
		mov	dx, [bp+10h]
		mov	bx, [bp+0Eh]
		add	bx, ax
		les	si, [bp+6]
		mov	es:[si+10h], dx
		mov	es:[si+0Eh], bx
		les	bx, [bp+6]
		mov	ax, es:[bx+12h]
		xor	dx, dx
		sub	ax, [bp+0Ah]
		sbb	dx, 0
		shl	eax, 10h
		shrd	eax, edx, 10h
		mov	ebx, 12h
		cdq
		idiv	ebx
		mov	dx, 12h
		imul	dx
		mov	dx, [bp+10h]
		mov	bx, [bp+0Eh]
		add	bx, ax
		les	si, [bp+6]
		mov	es:[si+14h], dx
		mov	es:[si+12h], bx
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_1BAF8	proc far		; CODE XREF: sub_1BC26+22p
					; sub_C4390+21AP

arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h
arg_C		= word ptr  12h
arg_E		= word ptr  14h
arg_10		= dword	ptr  16h

		push	bp
		mov	bp, sp
		push	word ptr [bp+arg_10+2]
		push	word ptr [bp+arg_10]
		push	[bp+arg_E]
		push	[bp+arg_C]
		push	[bp+arg_A]
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		push	cs
		call	near ptr sub_1B829
		add	sp, 14h
		les	bx, [bp+arg_10]
		mov	al, es:[bx+4]
		les	bx, [bp+arg_0]
		mov	es:[bx+26h], al
		pop	bp
		retf
sub_1BAF8	endp

; ���������������������������������������������������������������������������

loc_1BB30:				; DATA XREF: dseg:3101o dseg:316Do
		push	bp
		mov	bp, sp
		sub	sp, 4
		les	bx, [bp+6]
		mov	eax, es:[bx+6]
		mov	[bp-4],	eax
		les	bx, [bp-4]
		mov	al, es:[bx+26h]
		push	ax
		push	word ptr [bp+8]
		push	word ptr [bp+6]
		call	sub_1B4C0
		add	sp, 6
		les	bx, [bp+6]
		mov	es:[bx+16h], al
		leave
		retf
; ���������������������������������������������������������������������������

loc_1BB61:				; DATA XREF: dseg:314Do
		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		les	bx, [bp+6]
		mov	eax, es:[bx+0Ah]
		mov	[bp-4],	eax
		les	bx, [bp+6]
		mov	eax, es:[bx+0Eh]
		mov	[bp-8],	eax
		les	bx, [bp+6]
		mov	eax, es:[bx+12h]
		mov	[bp-0Ch], eax
		les	bx, [bp+6]
		mov	al, es:[bx+16h]
		push	ax
		les	bx, [bp-8]
		push	word ptr es:[bx+3]
		les	bx, [bp-8]
		push	word ptr es:[bx+1]
		les	bx, [bp-4]
		push	word ptr es:[bx+3]
		les	bx, [bp-4]
		push	word ptr es:[bx+1]
		push	word_46F44
		call	Render_FillClippedRect_326E6
		add	sp, 0Ch
		les	bx, [bp+6]
		mov	al, es:[bx+16h]
		push	ax
		les	bx, [bp-0Ch]
		push	word ptr es:[bx+3]
		les	bx, [bp-0Ch]
		push	word ptr es:[bx+1]
		les	bx, [bp-8]
		push	word ptr es:[bx+3]
		les	bx, [bp-8]
		push	word ptr es:[bx+1]
		push	word_46F44
		call	Render_FillClippedRect_326E6
		add	sp, 0Ch
		les	bx, [bp+6]
		mov	al, es:[bx+16h]
		push	ax
		les	bx, [bp-0Ch]
		push	word ptr es:[bx+3]
		les	bx, [bp-0Ch]
		push	word ptr es:[bx+1]
		les	bx, [bp-4]
		push	word ptr es:[bx+3]
		les	bx, [bp-4]
		push	word ptr es:[bx+1]
		push	word_46F44
		call	Render_FillClippedRect_326E6
		add	sp, 0Ch
		leave
		retf
; ���������������������������������������������������������������������������

loc_1BC1D:				; DATA XREF: dseg:3161o
		push	bp
		mov	bp, sp
		mov	al, 0
		pop	bp
		retf
; ���������������������������������������������������������������������������
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_1BC26	proc far		; CODE XREF: sub_C4390+28FP

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h
arg_C		= word ptr  12h
arg_E		= word ptr  14h
arg_10		= word ptr  16h
arg_12		= word ptr  18h

		push	bp
		mov	bp, sp
		push	[bp+arg_12]
		push	[bp+arg_10]
		push	[bp+arg_E]
		push	[bp+arg_C]
		push	[bp+arg_A]
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	cs
		call	near ptr sub_1BAF8
		add	sp, 14h
		pop	bp
		retf
sub_1BC26	endp

; ���������������������������������������������������������������������������

loc_1BC50:				; DATA XREF: dseg:30E1o
		push	bp
		mov	bp, sp
		sub	sp, 42h
		les	bx, [bp+6]
		les	bx, es:[bx+0Ah]
		mov	ax, es:[bx+1]
		mov	[bp-42h], ax
		les	bx, [bp+6]
		les	bx, es:[bx+0Ah]
		mov	ax, es:[bx+3]
		mov	[bp-40h], ax
		les	bx, [bp+6]
		mov	al, es:[bx+16h]
		mov	ah, 0
		mov	[bp-3Eh], ax
		les	bx, [bp+6]
		les	bx, es:[bx+0Eh]
		mov	ax, es:[bx+1]
		mov	[bp-2Ch], ax
		les	bx, [bp+6]
		les	bx, es:[bx+0Eh]
		mov	ax, es:[bx+3]
		mov	[bp-2Ah], ax
		les	bx, [bp+6]
		mov	al, es:[bx+16h]
		mov	ah, 0
		mov	[bp-28h], ax
		les	bx, [bp+6]
		les	bx, es:[bx+12h]
		mov	ax, es:[bx+1]
		mov	[bp-16h], ax
		les	bx, [bp+6]
		les	bx, es:[bx+12h]
		mov	ax, es:[bx+3]
		mov	[bp-14h], ax
		les	bx, [bp+6]
		mov	al, es:[bx+16h]
		mov	ah, 0
		mov	[bp-12h], ax
		mov	al, byte_46018
		mov	ah, 0
		or	ax, ax
		jnz	short loc_1BCEC
		push	ss
		lea	ax, [bp-42h]
		push	ax
		push	3
		push	word_46F44
		call	Render_PolygonPrimitive_2751E
		add	sp, 8
		jmp	short locret_1BD03
; ���������������������������������������������������������������������������

loc_1BCEC:				; CODE XREF: seg042:07C5j
		lea	ax, [bp-16h]
		push	ax
		lea	ax, [bp-2Ch]
		push	ax
		lea	ax, [bp-42h]
		push	ax
		push	word_46F44
		push	cs
		call	near ptr sub_1B610
		add	sp, 8

locret_1BD03:				; CODE XREF: seg042:07DAj
		leave
		retf
; ���������������������������������������������������������������������������

loc_1BD05:				; DATA XREF: dseg:30F5o
		push	bp
		mov	bp, sp
		mov	al, 1
		pop	bp
		retf
; ���������������������������������������������������������������������������
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_1BD0E	proc far		; CODE XREF: sub_C4390+304P

arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h
arg_C		= word ptr  12h
arg_E		= word ptr  14h
arg_10		= dword	ptr  16h

		push	bp
		mov	bp, sp
		push	si
		push	word ptr [bp+arg_10+2]
		push	word ptr [bp+arg_10]
		push	[bp+arg_E]
		push	[bp+arg_C]
		push	[bp+arg_A]
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		push	cs
		call	near ptr sub_1B829
		add	sp, 14h
		les	bx, [bp+arg_10]
		mov	al, es:[bx+4]
		cbw
		mov	si, ax
		or	si, si
		jge	short loc_1BD4B
		xor	dx, dx
		xor	ax, ax
		jmp	short loc_1BD6B
; ���������������������������������������������������������������������������

loc_1BD4B:				; CODE XREF: sub_1BD0E+35j
		push	0
		mov	al, byte_49352
		push	ax
		push	word ptr dword_4934E+2
		push	word ptr dword_4934E
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		mov	bx, si
		shl	bx, 8
		add	ax, bx

loc_1BD6B:				; CODE XREF: sub_1BD0E+3Bj
		les	bx, [bp+arg_0]
		mov	es:[bx+28h], dx
		mov	es:[bx+26h], ax
		pop	si
		pop	bp
		retf
sub_1BD0E	endp

; ���������������������������������������������������������������������������

loc_1BD79:				; DATA XREF: dseg:3125o
		push	bp
		mov	bp, sp
		sub	sp, 4
		les	bx, [bp+6]
		mov	eax, es:[bx+6]
		mov	[bp-4],	eax
		les	bx, [bp-4]
		mov	eax, es:[bx+26h]
		les	bx, [bp+6]
		mov	es:[bx+16h], eax
		leave
		retf
; ���������������������������������������������������������������������������

loc_1BD9D:				; DATA XREF: dseg:3105o
		push	bp
		mov	bp, sp
		sub	sp, 42h
		les	bx, [bp+6]
		les	bx, es:[bx+0Ah]
		mov	ax, es:[bx+1]
		mov	[bp-42h], ax
		les	bx, [bp+6]
		les	bx, es:[bx+0Ah]
		mov	ax, es:[bx+3]
		mov	[bp-40h], ax
		les	bx, [bp+6]
		les	bx, es:[bx+0Eh]
		mov	ax, es:[bx+1]
		mov	[bp-2Ch], ax
		les	bx, [bp+6]
		les	bx, es:[bx+0Eh]
		mov	ax, es:[bx+3]
		mov	[bp-2Ah], ax
		les	bx, [bp+6]
		les	bx, es:[bx+12h]
		mov	ax, es:[bx+1]
		mov	[bp-16h], ax
		les	bx, [bp+6]
		les	bx, es:[bx+12h]
		mov	ax, es:[bx+3]
		mov	[bp-14h], ax
		xor	ax, ax
		mov	[bp-12h], ax
		mov	[bp-28h], ax
		mov	[bp-3Eh], ax
		mov	al, byte_46018
		mov	ah, 0
		or	ax, ax
		jnz	short loc_1BE2B
		les	bx, [bp+6]
		push	word ptr es:[bx+18h]
		push	word ptr es:[bx+16h]
		push	ss
		lea	ax, [bp-42h]
		push	ax
		push	3
		push	word_46F44
		call	sub_2792E
		add	sp, 0Ch
		jmp	short locret_1BE42
; ���������������������������������������������������������������������������

loc_1BE2B:				; CODE XREF: seg042:08F9j
		lea	ax, [bp-16h]
		push	ax
		lea	ax, [bp-2Ch]
		push	ax
		lea	ax, [bp-42h]
		push	ax
		push	word_46F44
		push	cs
		call	near ptr sub_1B610
		add	sp, 8

locret_1BE42:				; CODE XREF: seg042:0919j
		leave
		retf
; ���������������������������������������������������������������������������

loc_1BE44:				; DATA XREF: dseg:3119o
		push	bp
		mov	bp, sp
		mov	al, 2
		pop	bp
		retf
; ���������������������������������������������������������������������������
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_1BE4D	proc far		; CODE XREF: sub_1C069+3Bp
					; sub_1C8E6+3Bp

var_8		= dword	ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword	ptr  6
arg_4		= byte ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	al, [bp+arg_4]
		mov	ah, 0
		mov	[bp+var_4], ax
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		inc	dx
		mov	word ptr [bp+var_8+2], ax
		mov	word ptr [bp+var_8], dx
		push	[bp+var_4]
		push	62D0h
		call	sub_1ED93
		add	sp, 4
		mov	si, ax
		cmp	si, 0FFFFh
		jz	short loc_1BE99
		mov	ax, si
		mov	dx, 0Fh
		imul	dx
		mov	bx, word_4934A
		add	bx, ax
		mov	al, byte ptr [bp+var_4]
		sub	al, [bx+6]
		les	bx, [bp+var_8]
		mov	es:[bx], al
		jmp	short loc_1BEA0
; ���������������������������������������������������������������������������

loc_1BE99:				; CODE XREF: sub_1BE4D+2Fj
		les	bx, [bp+var_8]
		mov	byte ptr es:[bx], 0

loc_1BEA0:				; CODE XREF: sub_1BE4D+4Aj
		mov	[bp+var_2], si
		cmp	[bp+var_2], 0FFFFh
		jnz	short loc_1BEBC
		les	bx, [bp+arg_0]
		mov	al, [bp+arg_4]
		mov	es:[bx], al
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+2], 0
		jmp	short loc_1BECD
; ���������������������������������������������������������������������������

loc_1BEBC:				; CODE XREF: sub_1BE4D+5Aj
		les	bx, [bp+arg_0]
		mov	al, byte ptr [bp+var_2]
		mov	es:[bx], al
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+2], 1

loc_1BECD:				; CODE XREF: sub_1BE4D+6Dj
		pop	si
		leave
		retf
sub_1BE4D	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_1BED0	proc far		; CODE XREF: seg042:0D71p seg042:149Ap ...

var_12		= dword	ptr -12h
var_E		= dword	ptr -0Eh
var_A		= dword	ptr -0Ah
var_5		= byte ptr -5
var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= dword	ptr  0Ah
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 12h
		push	si
		mov	si, [bp+arg_8]
		les	bx, [bp+arg_4]
		mov	eax, es:[bx+6]
		mov	[bp+var_4], eax
		les	bx, [bp+var_4]
		mov	eax, es:[bx+1]
		mov	[bp+var_12], eax
		les	bx, [bp+var_4]
		mov	eax, es:[bx+5]
		mov	[bp+var_E], eax
		les	bx, [bp+var_4]
		mov	eax, es:[bx+9]
		mov	[bp+var_A], eax
		les	bx, [bp+var_4]
		mov	al, es:[bx+25h]
		and	ax, 1
		or	al, al
		jnz	short loc_1BF1B
		jmp	loc_1C035
; ���������������������������������������������������������������������������

loc_1BF1B:				; CODE XREF: sub_1BED0+46j
		les	bx, [bp+arg_4]
		les	bx, es:[bx+0Eh]
		mov	ax, es:[bx+1]
		les	bx, [bp+arg_4]
		les	bx, es:[bx+0Ah]
		sub	ax, es:[bx+1]
		les	bx, [bp+arg_4]
		les	bx, es:[bx+12h]
		mov	dx, es:[bx+3]
		les	bx, [bp+arg_4]
		les	bx, es:[bx+0Eh]
		sub	dx, es:[bx+3]
		imul	dx
		les	bx, [bp+arg_4]
		les	bx, es:[bx+0Eh]
		push	ax
		mov	ax, es:[bx+3]
		les	bx, [bp+arg_4]
		les	bx, es:[bx+0Ah]
		sub	ax, es:[bx+3]
		les	bx, [bp+arg_4]
		les	bx, es:[bx+12h]
		mov	dx, es:[bx+1]
		les	bx, [bp+arg_4]
		les	bx, es:[bx+0Eh]
		sub	dx, es:[bx+1]
		imul	dx
		pop	dx
		sub	dx, ax
		jge	short loc_1BF81
		mov	al, 1
		jmp	short loc_1BF83
; ���������������������������������������������������������������������������

loc_1BF81:				; CODE XREF: sub_1BED0+ABj
		mov	al, 0

loc_1BF83:				; CODE XREF: sub_1BED0+AFj
		mov	[bp+var_5], al
		cmp	[bp+var_5], 0
		jz	short loc_1BFE3
		les	bx, [bp+arg_0]
		mov	al, es:[bx+5]
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jz	short loc_1BFAE
		les	bx, [bp+arg_0]
		mov	al, es:[bx+5]
		shr	ax, 1
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jnz	short loc_1BFE3

loc_1BFAE:				; CODE XREF: sub_1BED0+CAj
		les	bx, [bp+arg_0]
		or	byte ptr es:[bx+5], 1
		les	bx, [bp+arg_0]
		or	byte ptr es:[bx+5], 2
		lea	ax, [bp+var_12]
		push	ax
		call	Utility_Helper_24233
		add	sp, 2
		lea	ax, [bp+var_12]
		push	ax
		push	si
		push	6435h
		call	LightSet_FaceIntensity_1DB23
		add	sp, 6
		les	bx, [bp+arg_0]
		mov	es:[bx+4], al
		jmp	short loc_1C033
; ���������������������������������������������������������������������������

loc_1BFE3:				; CODE XREF: sub_1BED0+BAj
					; sub_1BED0+DCj
		mov	al, [bp+var_5]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_1C033
		les	bx, [bp+arg_0]
		mov	al, es:[bx+5]
		and	ax, 1
		or	al, al
		jnz	short loc_1C00C
		les	bx, [bp+arg_0]
		mov	al, es:[bx+5]
		shr	ax, 1
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jnz	short loc_1C033

loc_1C00C:				; CODE XREF: sub_1BED0+128j
		les	bx, [bp+arg_0]
		and	byte ptr es:[bx+5], 0FEh
		les	bx, [bp+arg_0]
		or	byte ptr es:[bx+5], 2
		lea	ax, [bp+var_12]
		push	ax
		push	si
		push	6435h
		call	LightSet_FaceIntensity_1DB23
		add	sp, 6
		les	bx, [bp+arg_0]
		mov	es:[bx+4], al

loc_1C033:				; CODE XREF: sub_1BED0+111j
					; sub_1BED0+11Aj ...
		jmp	short loc_1C066
; ���������������������������������������������������������������������������

loc_1C035:				; CODE XREF: sub_1BED0+48j
		les	bx, [bp+arg_0]
		mov	al, es:[bx+5]
		shr	ax, 1
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jnz	short loc_1C066
		lea	ax, [bp+var_12]
		push	ax
		push	si
		push	6435h
		call	LightSet_FaceIntensity_1DB23
		add	sp, 6
		les	bx, [bp+arg_0]
		mov	es:[bx+4], al
		les	bx, [bp+arg_0]
		or	byte ptr es:[bx+5], 2

loc_1C066:				; CODE XREF: sub_1BED0:loc_1C033j
					; sub_1BED0+175j
		pop	si
		leave
		retf
sub_1BED0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_1C069	proc far		; CODE XREF: sub_C4390+379P

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h
arg_C		= word ptr  12h
arg_E		= word ptr  14h
arg_10		= dword	ptr  16h

		push	bp
		mov	bp, sp
		push	word ptr [bp+arg_10+2]
		push	word ptr [bp+arg_10]
		push	[bp+arg_E]
		push	[bp+arg_C]
		push	[bp+arg_A]
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	cs
		call	near ptr sub_1B829
		add	sp, 14h
		les	bx, [bp+arg_10]
		mov	al, es:[bx+4]
		push	ax
		mov	ax, [bp+arg_0]
		add	ax, 26h	; '&'
		push	[bp+arg_2]
		push	ax
		push	cs
		call	near ptr sub_1BE4D
		add	sp, 6
		pop	bp
		retf
sub_1C069	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_1C0AC	proc far		; CODE XREF: sub_C4390+3B9P

var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= dword	ptr  0Ah
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h
arg_C		= word ptr  12h
arg_E		= word ptr  14h
arg_10		= word ptr  16h
arg_12		= word ptr  18h

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	[bp+arg_12]
		push	[bp+arg_10]
		push	[bp+arg_E]
		push	[bp+arg_C]
		push	[bp+arg_A]
		push	[bp+arg_8]
		push	word ptr [bp+arg_4+2]
		push	word ptr [bp+arg_4]
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		push	cs
		call	near ptr sub_1B94E
		add	sp, 14h
		mov	eax, [bp+arg_4]
		mov	[bp+var_4], eax
		les	bx, [bp+var_4]
		mov	al, es:[bx+28h]
		and	ax, 1
		les	bx, [bp+arg_0]
		and	byte ptr es:[bx+1Bh], 0FBh
		shl	al, 2
		or	es:[bx+1Bh], al
		les	bx, [bp+var_4]
		mov	al, es:[bx+26h]
		les	bx, [bp+arg_0]
		mov	es:[bx+18h], al
		les	bx, [bp+var_4]
		mov	al, es:[bx+27h]
		les	bx, [bp+arg_0]
		mov	es:[bx+19h], al
		leave
		retf
sub_1C0AC	endp

; ���������������������������������������������������������������������������

loc_1C116:				; DATA XREF: dseg:30B9o
		push	bp
		mov	bp, sp
		sub	sp, 48h
		les	bx, [bp+6]
		mov	al, es:[bx+1Bh]
		shr	ax, 2
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jnz	short loc_1C181
		les	bx, [bp+6]
		mov	eax, es:[bx+2]
		sar	eax, 8
		push	eax
		les	bx, [bp+6]
		mov	al, es:[bx+1Ah]
		mov	ah, 0
		push	ax
		push	62D0h
		call	Palette_ShadeTableFor_1ECD2
		add	sp, 8
		mov	[bp-4],	dx
		mov	[bp-6],	ax
		cmp	dword ptr [bp-6], 0
		jnz	short loc_1C16B
		les	bx, [bp+6]
		mov	al, es:[bx+18h]
		mov	[bp-1],	al
		jmp	short loc_1C17F
; ���������������������������������������������������������������������������

loc_1C16B:				; CODE XREF: seg042:0C4Dj
		les	bx, [bp+6]
		mov	al, es:[bx+18h]
		mov	ah, 0
		les	bx, [bp-6]
		add	bx, ax
		mov	al, es:[bx]
		mov	[bp-1],	al

loc_1C17F:				; CODE XREF: seg042:0C59j
		jmp	short loc_1C1BB
; ���������������������������������������������������������������������������

loc_1C181:				; CODE XREF: seg042:0C1Dj
		les	bx, [bp+6]
		mov	al, es:[bx+19h]
		mov	ah, 0
		push	ax
		les	bx, [bp+6]
		mov	eax, es:[bx+2]
		sar	eax, 8
		push	eax
		les	bx, [bp+6]
		mov	al, es:[bx+1Ah]
		mov	ah, 0
		push	ax
		les	bx, [bp+6]
		mov	al, es:[bx+18h]
		mov	ah, 0
		push	ax
		push	62D0h
		call	Palette_ShadeIndexWithFog_1F752
		add	sp, 0Ch
		mov	[bp-1],	al

loc_1C1BB:				; CODE XREF: seg042:loc_1C17Fj
		les	bx, [bp+6]
		les	bx, es:[bx+0Ah]
		mov	ax, es:[bx+1]
		mov	[bp-48h], ax
		les	bx, [bp+6]
		les	bx, es:[bx+0Ah]
		mov	ax, es:[bx+3]
		mov	[bp-46h], ax
		les	bx, [bp+6]
		les	bx, es:[bx+0Eh]
		mov	ax, es:[bx+1]
		mov	[bp-32h], ax
		les	bx, [bp+6]
		les	bx, es:[bx+0Eh]
		mov	ax, es:[bx+3]
		mov	[bp-30h], ax
		les	bx, [bp+6]
		les	bx, es:[bx+12h]
		mov	ax, es:[bx+1]
		mov	[bp-1Ch], ax
		les	bx, [bp+6]
		les	bx, es:[bx+12h]
		mov	ax, es:[bx+3]
		mov	[bp-1Ah], ax
		mov	al, [bp-1]
		mov	ah, 0
		mov	[bp-18h], ax
		mov	[bp-2Eh], ax
		mov	[bp-44h], ax
		mov	al, byte_46018
		mov	ah, 0
		or	ax, ax
		jnz	short loc_1C23B
		push	ss
		lea	ax, [bp-48h]
		push	ax
		push	3
		push	word_46F44
		call	Render_PolygonPrimitive_2751E
		add	sp, 8
		jmp	short locret_1C252
; ���������������������������������������������������������������������������

loc_1C23B:				; CODE XREF: seg042:0D14j
		lea	ax, [bp-1Ch]
		push	ax
		lea	ax, [bp-32h]
		push	ax
		lea	ax, [bp-48h]
		push	ax
		push	word_46F44
		push	cs
		call	near ptr sub_1B610
		add	sp, 8

locret_1C252:				; CODE XREF: seg042:0D29j
		leave
		retf
; ���������������������������������������������������������������������������

loc_1C254:				; DATA XREF: dseg:30BDo
		push	bp
		mov	bp, sp
		les	bx, [bp+6]
		and	byte ptr es:[bx+1Bh], 0FDh
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_1C261:				; DATA XREF: dseg:30CDo
		push	bp
		mov	bp, sp
		mov	al, 4
		pop	bp
		retf
; ���������������������������������������������������������������������������
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_1C26A:				; DATA XREF: dseg:30D9o
		push	bp
		mov	bp, sp
		push	word ptr [bp+0Ah]
		push	word ptr [bp+8]
		push	word ptr [bp+6]
		mov	ax, [bp+6]
		add	ax, 16h
		push	word ptr [bp+8]
		push	ax
		push	cs
		call	near ptr sub_1BED0
		add	sp, 0Ah
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_1C289	proc far		; CODE XREF: sub_1C2FE+37p

var_8		= dword	ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword	ptr  6
arg_4		= byte ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	al, [bp+arg_4]
		mov	ah, 0
		mov	[bp+var_4], ax
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 27h	; '''
		mov	word ptr [bp+var_8+2], ax
		mov	word ptr [bp+var_8], dx
		push	[bp+var_4]
		push	62D0h
		call	sub_1ED93
		add	sp, 4
		mov	si, ax
		cmp	si, 0FFFFh
		jz	short loc_1C2D7
		mov	ax, si
		mov	dx, 0Fh
		imul	dx
		mov	bx, word_4934A
		add	bx, ax
		mov	al, byte ptr [bp+var_4]
		sub	al, [bx+6]
		les	bx, [bp+var_8]
		mov	es:[bx], al
		jmp	short loc_1C2DE
; ���������������������������������������������������������������������������

loc_1C2D7:				; CODE XREF: sub_1C289+31j
		les	bx, [bp+var_8]
		mov	byte ptr es:[bx], 0

loc_1C2DE:				; CODE XREF: sub_1C289+4Cj
		mov	[bp+var_2], si
		cmp	[bp+var_2], 0FFFFh
		jnz	short loc_1C2F1
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+26h], 0
		jmp	short loc_1C2FB
; ���������������������������������������������������������������������������

loc_1C2F1:				; CODE XREF: sub_1C289+5Cj
		les	bx, [bp+arg_0]
		mov	al, byte ptr [bp+var_2]
		mov	es:[bx+26h], al

loc_1C2FB:				; CODE XREF: sub_1C289+66j
		pop	si
		leave
		retf
sub_1C289	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_1C2FE	proc far		; CODE XREF: sub_C4390+43DP

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h
arg_C		= word ptr  12h
arg_E		= word ptr  14h
arg_10		= dword	ptr  16h

		push	bp
		mov	bp, sp
		push	word ptr [bp+arg_10+2]
		push	word ptr [bp+arg_10]
		push	[bp+arg_E]
		push	[bp+arg_C]
		push	[bp+arg_A]
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	cs
		call	near ptr sub_1B829
		add	sp, 14h
		les	bx, [bp+arg_10]
		mov	al, es:[bx+4]
		push	ax
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	cs
		call	near ptr sub_1C289
		add	sp, 6
		pop	bp
		retf
sub_1C2FE	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_1C33D	proc far		; CODE XREF: sub_C4390+47DP

var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= dword	ptr  0Ah
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h
arg_C		= word ptr  12h
arg_E		= word ptr  14h
arg_10		= word ptr  16h
arg_12		= word ptr  18h

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	[bp+arg_12]
		push	[bp+arg_10]
		push	[bp+arg_E]
		push	[bp+arg_C]
		push	[bp+arg_A]
		push	[bp+arg_8]
		push	word ptr [bp+arg_4+2]
		push	word ptr [bp+arg_4]
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		push	cs
		call	near ptr sub_1B94E
		add	sp, 14h
		mov	eax, [bp+arg_4]
		mov	[bp+var_4], eax
		les	bx, [bp+var_4]
		mov	al, es:[bx+26h]
		les	bx, [bp+arg_0]
		mov	es:[bx+16h], al
		les	bx, [bp+var_4]
		mov	al, es:[bx+27h]
		les	bx, [bp+arg_0]
		mov	es:[bx+17h], al
		leave
		retf
sub_1C33D	endp

; ���������������������������������������������������������������������������

loc_1C38E:				; DATA XREF: dseg:30B1o
		push	bp
		mov	bp, sp
		sub	sp, 48h
		push	si
		push	di
		les	bx, [bp+6]
		mov	eax, es:[bx+6]
		mov	[bp-4],	eax
		mov	ax, [bp+0Ah]
		mov	[bp-6],	ax
		les	bx, [bp-4]
		mov	eax, es:[bx+19h]
		mov	[bp-0Ah], eax
		les	bx, [bp+6]
		les	bx, es:[bx+0Ah]
		mov	al, es:[bx+11h]
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jnz	short loc_1C41E
		mov	ax, [bp-8]
		mov	dx, [bp-0Ah]
		add	dx, 0Ch
		mov	[bp-0Ch], ax
		mov	[bp-0Eh], dx
		les	si, [bp-0Eh]
		mov	eax, es:[si]
		mov	[bp-30h], eax
		mov	eax, es:[si+4]
		mov	[bp-2Ch], eax
		mov	eax, es:[si+8]
		mov	[bp-28h], eax
		lea	ax, [bp-30h]
		push	ax
		push	word ptr [bp-6]
		push	6435h
		call	LightSet_FaceIntensity_1DB23
		add	sp, 6
		les	bx, [bp+6]
		les	bx, es:[bx+0Ah]
		mov	es:[bx], al
		les	bx, [bp+6]
		les	bx, es:[bx+0Ah]
		or	byte ptr es:[bx+11h], 1
		jmp	short $+2

loc_1C41E:				; CODE XREF: seg042:0EB6j
		mov	ax, [bp+0Ah]
		mov	[bp-10h], ax
		les	bx, [bp-4]
		mov	eax, es:[bx+1Dh]
		mov	[bp-14h], eax
		les	bx, [bp+6]
		les	bx, es:[bx+0Eh]
		mov	al, es:[bx+11h]
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jnz	short loc_1C49A
		mov	ax, [bp-12h]
		mov	dx, [bp-14h]
		add	dx, 0Ch
		mov	[bp-16h], ax
		mov	[bp-18h], dx
		les	di, [bp-18h]
		mov	eax, es:[di]
		mov	[bp-3Ch], eax
		mov	eax, es:[di+4]
		mov	[bp-38h], eax
		mov	eax, es:[di+8]
		mov	[bp-34h], eax
		lea	ax, [bp-3Ch]
		push	ax
		push	word ptr [bp-10h]
		push	6435h
		call	LightSet_FaceIntensity_1DB23
		add	sp, 6
		les	bx, [bp+6]
		les	bx, es:[bx+0Eh]
		mov	es:[bx], al
		les	bx, [bp+6]
		les	bx, es:[bx+0Eh]
		or	byte ptr es:[bx+11h], 1
		jmp	short $+2

loc_1C49A:				; CODE XREF: seg042:0F32j
		mov	ax, [bp+0Ah]
		mov	[bp-1Ah], ax
		les	bx, [bp-4]
		mov	eax, es:[bx+21h]
		mov	[bp-1Eh], eax
		les	bx, [bp+6]
		les	bx, es:[bx+12h]
		mov	al, es:[bx+11h]
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jnz	short loc_1C522
		mov	ax, [bp-1Ch]
		mov	dx, [bp-1Eh]
		add	dx, 0Ch
		mov	[bp-20h], ax
		mov	[bp-22h], dx
		les	ax, [bp-22h]
		mov	[bp-24h], ax
		mov	bx, [bp-24h]
		mov	eax, es:[bx]
		mov	[bp-48h], eax
		mov	bx, [bp-24h]
		mov	eax, es:[bx+4]
		mov	[bp-44h], eax
		mov	bx, [bp-24h]
		mov	eax, es:[bx+8]
		mov	[bp-40h], eax
		lea	ax, [bp-48h]
		push	ax
		push	word ptr [bp-1Ah]
		push	6435h
		call	LightSet_FaceIntensity_1DB23
		add	sp, 6
		les	bx, [bp+6]
		les	bx, es:[bx+12h]
		mov	es:[bx], al
		les	bx, [bp+6]
		les	bx, es:[bx+12h]
		or	byte ptr es:[bx+11h], 1
		jmp	short $+2

loc_1C522:				; CODE XREF: seg042:0FAEj
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_1C526:				; DATA XREF: dseg:3091o
		push	bp
		mov	bp, sp
		sub	sp, 5Ah
		les	bx, [bp+6]
		les	bx, es:[bx+0Ah]
		mov	ax, es:[bx+1]
		mov	[bp-5Ah], ax
		les	bx, [bp+6]
		les	bx, es:[bx+0Ah]
		mov	ax, es:[bx+3]
		mov	[bp-58h], ax
		les	bx, [bp+6]
		mov	al, es:[bx+17h]
		mov	ah, 0
		push	ax
		les	bx, [bp+6]
		mov	ax, es:[bx+0Ch]
		mov	dx, es:[bx+0Ah]
		add	dx, 9
		mov	[bp-2],	ax
		mov	[bp-4],	dx
		les	bx, [bp-4]
		mov	eax, es:[bx]
		mov	[bp-8],	eax
		mov	eax, [bp-8]
		sar	eax, 8
		push	eax
		les	bx, [bp+6]
		les	bx, es:[bx+0Ah]
		mov	al, es:[bx]
		mov	ah, 0
		push	ax
		les	bx, [bp+6]
		mov	al, es:[bx+16h]
		mov	ah, 0
		push	ax
		push	62D0h
		call	Palette_ShadeIndexWithFog_1F752
		add	sp, 0Ch
		mov	[bp-56h], ax
		les	bx, [bp+6]
		les	bx, es:[bx+0Eh]
		mov	ax, es:[bx+1]
		mov	[bp-44h], ax
		les	bx, [bp+6]
		les	bx, es:[bx+0Eh]
		mov	ax, es:[bx+3]
		mov	[bp-42h], ax
		les	bx, [bp+6]
		mov	al, es:[bx+17h]
		mov	ah, 0
		push	ax
		les	bx, [bp+6]
		mov	ax, es:[bx+10h]
		mov	dx, es:[bx+0Eh]
		add	dx, 9
		mov	[bp-0Ah], ax
		mov	[bp-0Ch], dx
		les	bx, [bp-0Ch]
		mov	eax, es:[bx]
		mov	[bp-10h], eax
		mov	eax, [bp-10h]
		sar	eax, 8
		push	eax
		les	bx, [bp+6]
		les	bx, es:[bx+0Eh]
		mov	al, es:[bx]
		mov	ah, 0
		push	ax
		les	bx, [bp+6]
		mov	al, es:[bx+16h]
		mov	ah, 0
		push	ax
		push	62D0h
		call	Palette_ShadeIndexWithFog_1F752
		add	sp, 0Ch
		mov	[bp-40h], ax
		les	bx, [bp+6]
		les	bx, es:[bx+12h]
		mov	ax, es:[bx+1]
		mov	[bp-2Eh], ax
		les	bx, [bp+6]
		les	bx, es:[bx+12h]
		mov	ax, es:[bx+3]
		mov	[bp-2Ch], ax
		les	bx, [bp+6]
		mov	al, es:[bx+17h]
		mov	ah, 0
		push	ax
		les	bx, [bp+6]
		mov	ax, es:[bx+14h]
		mov	dx, es:[bx+12h]
		add	dx, 9
		mov	[bp-12h], ax
		mov	[bp-14h], dx
		les	bx, [bp-14h]
		mov	eax, es:[bx]
		mov	[bp-18h], eax
		mov	eax, [bp-18h]
		sar	eax, 8
		push	eax
		les	bx, [bp+6]
		les	bx, es:[bx+12h]
		mov	al, es:[bx]
		mov	ah, 0
		push	ax
		les	bx, [bp+6]
		mov	al, es:[bx+16h]
		mov	ah, 0
		push	ax
		push	62D0h
		call	Palette_ShadeIndexWithFog_1F752
		add	sp, 0Ch
		mov	[bp-2Ah], ax
		cmp	byte_46016, 0
		jz	short loc_1C6D5
		mov	ax, [bp-56h]
		cmp	ax, [bp-40h]
		jnz	short loc_1C6B4
		mov	ax, [bp-56h]
		cmp	ax, [bp-2Ah]
		jnz	short loc_1C6B4
		push	ss
		lea	ax, [bp-5Ah]
		push	ax
		push	3
		push	word_46F44
		call	Render_PolygonPrimitive_2751E
		add	sp, 8
		jmp	short loc_1C6D3
; ���������������������������������������������������������������������������

loc_1C6B4:				; CODE XREF: seg042:1185j seg042:118Dj
		shl	word ptr [bp-56h], 8
		shl	word ptr [bp-40h], 8
		shl	word ptr [bp-2Ah], 8
		push	ss
		lea	ax, [bp-5Ah]
		push	ax
		push	3
		push	word_46F44
		call	Render_MeshPrimitive_27D5F
		add	sp, 8

loc_1C6D3:				; CODE XREF: seg042:11A2j
		jmp	short locret_1C721
; ���������������������������������������������������������������������������

loc_1C6D5:				; CODE XREF: seg042:117Dj
		cmp	byte_46018, 0
		jz	short loc_1C6F5
		lea	ax, [bp-2Eh]
		push	ax
		lea	ax, [bp-44h]
		push	ax
		lea	ax, [bp-5Ah]
		push	ax
		push	word_46F44
		push	cs
		call	near ptr sub_1B610
		add	sp, 8
		jmp	short locret_1C721
; ���������������������������������������������������������������������������

loc_1C6F5:				; CODE XREF: seg042:11CAj
		mov	ax, [bp-56h]
		add	ax, [bp-40h]
		add	ax, [bp-2Ah]
		mov	bx, 3
		xor	dx, dx
		div	bx
		mov	[bp-2Ah], ax
		mov	[bp-40h], ax
		mov	[bp-56h], ax
		push	ss
		lea	ax, [bp-5Ah]
		push	ax
		push	3
		push	word_46F44
		call	Render_PolygonPrimitive_2751E
		add	sp, 8

locret_1C721:				; CODE XREF: seg042:loc_1C6D3j
					; seg042:11E3j
		leave
		retf
; ���������������������������������������������������������������������������

loc_1C723:				; DATA XREF: dseg:30A5o
		push	bp
		mov	bp, sp
		mov	al, 5
		pop	bp
		retf
; ���������������������������������������������������������������������������
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_1C72C:				; DATA XREF: dseg:306Do
		push	bp
		mov	bp, sp
		sub	sp, 46h
		les	bx, [bp+6]
		les	bx, es:[bx+0Ah]
		mov	ax, es:[bx+1]
		mov	[bp-46h], ax
		les	bx, [bp+6]
		les	bx, es:[bx+0Ah]
		mov	ax, es:[bx+3]
		mov	[bp-44h], ax
		les	bx, [bp+6]
		mov	al, es:[bx+18h]
		mov	ah, 0
		mov	[bp-40h], ax
		les	bx, [bp+6]
		mov	al, es:[bx+19h]
		mov	ah, 0
		mov	[bp-3Eh], ax
		les	bx, [bp+6]
		les	bx, es:[bx+0Eh]
		mov	ax, es:[bx+1]
		mov	[bp-30h], ax
		les	bx, [bp+6]
		les	bx, es:[bx+0Eh]
		mov	ax, es:[bx+3]
		mov	[bp-2Eh], ax
		les	bx, [bp+6]
		mov	al, es:[bx+1Ah]
		mov	ah, 0
		mov	[bp-2Ah], ax
		les	bx, [bp+6]
		mov	al, es:[bx+1Bh]
		mov	ah, 0
		mov	[bp-28h], ax
		les	bx, [bp+6]
		les	bx, es:[bx+12h]
		mov	ax, es:[bx+1]
		mov	[bp-1Ah], ax
		les	bx, [bp+6]
		les	bx, es:[bx+12h]
		mov	ax, es:[bx+3]
		mov	[bp-18h], ax
		les	bx, [bp+6]
		mov	al, es:[bx+1Ch]
		mov	ah, 0
		mov	[bp-14h], ax
		les	bx, [bp+6]
		mov	al, es:[bx+1Dh]
		mov	ah, 0
		mov	[bp-12h], ax
		cmp	byte_46017, 0
		jnz	short loc_1C7D8
		jmp	loc_1C872
; ���������������������������������������������������������������������������

loc_1C7D8:				; CODE XREF: seg042:12C3j
		les	bx, [bp+6]
		cmp	word ptr es:[bx+16h], 0
		jnz	short loc_1C7E5
		jmp	loc_1C870
; ���������������������������������������������������������������������������

loc_1C7E5:				; CODE XREF: seg042:12D0j
		shl	word ptr [bp-3Eh], 8
		shl	word ptr [bp-40h], 8
		shl	word ptr [bp-28h], 8
		shl	word ptr [bp-2Ah], 8
		shl	word ptr [bp-12h], 8
		shl	word ptr [bp-14h], 8
		les	bx, [bp+6]
		mov	eax, es:[bx+2]
		sar	eax, 8
		mov	[bp-4],	eax
		push	large dword ptr	[bp-4]
		push	62D0h
		call	Palette_FogTableIndex_1F908
		add	sp, 6
		push	ax
		push	62D0h
		call	sub_1ECF9
		add	sp, 4
		push	dx
		push	ax
		les	bx, [bp+6]
		mov	bx, es:[bx+16h]
		mov	al, [bx+5]
		mov	ah, 0
		push	ax
		push	0
		les	bx, [bp+6]
		mov	bx, es:[bx+16h]
		mov	al, [bx+4]
		push	ax
		les	bx, [bp+6]
		mov	bx, es:[bx+16h]
		push	word ptr [bx+2]
		push	word ptr [bx]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		push	ss
		lea	ax, [bp-46h]
		push	ax
		push	3
		push	word_46F44
		call	Render_MeshPrimitive_283D0
		add	sp, 12h

loc_1C870:				; CODE XREF: seg042:12D2j
		jmp	short locret_1C8DB
; ���������������������������������������������������������������������������

loc_1C872:				; CODE XREF: seg042:12C5j
		cmp	byte_46018, 0
		jz	short loc_1C892
		lea	ax, [bp-1Ah]
		push	ax
		lea	ax, [bp-30h]
		push	ax
		lea	ax, [bp-46h]
		push	ax
		push	word_46F44
		push	cs
		call	near ptr sub_1B610
		add	sp, 8
		jmp	short locret_1C8DB
; ���������������������������������������������������������������������������

loc_1C892:				; CODE XREF: seg042:1367j
		push	0
		les	bx, [bp+6]
		mov	bx, es:[bx+16h]
		mov	al, [bx+4]
		push	ax
		les	bx, [bp+6]
		mov	bx, es:[bx+16h]
		push	word ptr [bx+2]
		push	word ptr [bx]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		mov	bx, ax
		mov	es, dx
		mov	al, es:[bx]
		mov	ah, 0
		mov	[bp-16h], ax
		mov	[bp-2Ch], ax
		mov	[bp-42h], ax
		push	ss
		lea	ax, [bp-46h]
		push	ax
		push	3
		push	word_46F44
		call	Render_PolygonPrimitive_2751E
		add	sp, 8

locret_1C8DB:				; CODE XREF: seg042:loc_1C870j
					; seg042:1380j
		leave
		retf
; ���������������������������������������������������������������������������

loc_1C8DD:				; DATA XREF: dseg:3081o
		push	bp
		mov	bp, sp
		mov	al, 6
		pop	bp
		retf
; ���������������������������������������������������������������������������
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_1C8E6	proc far		; CODE XREF: sub_C4390+527P

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h
arg_C		= word ptr  12h
arg_E		= word ptr  14h
arg_10		= dword	ptr  16h

		push	bp
		mov	bp, sp
		push	word ptr [bp+arg_10+2]
		push	word ptr [bp+arg_10]
		push	[bp+arg_E]
		push	[bp+arg_C]
		push	[bp+arg_A]
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	cs
		call	near ptr sub_1B829
		add	sp, 14h
		les	bx, [bp+arg_10]
		mov	al, es:[bx+4]
		push	ax
		mov	ax, [bp+arg_0]
		add	ax, 26h	; '&'
		push	[bp+arg_2]
		push	ax
		push	cs
		call	near ptr sub_1BE4D
		add	sp, 6
		pop	bp
		retf
sub_1C8E6	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_1C929	proc far		; CODE XREF: sub_C4390+567P

var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= dword	ptr  0Ah
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h
arg_C		= word ptr  12h
arg_E		= word ptr  14h
arg_10		= word ptr  16h
arg_12		= word ptr  18h

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	[bp+arg_12]
		push	[bp+arg_10]
		push	[bp+arg_E]
		push	[bp+arg_C]
		push	[bp+arg_A]
		push	[bp+arg_8]
		push	word ptr [bp+arg_4+2]
		push	word ptr [bp+arg_4]
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		push	cs
		call	near ptr sub_1B94E
		add	sp, 14h
		mov	eax, [bp+arg_4]
		mov	[bp+var_4], eax
		les	bx, [bp+var_4]
		mov	al, es:[bx+28h]
		and	ax, 1
		les	bx, [bp+arg_0]
		and	byte ptr es:[bx+23h], 0FBh
		shl	al, 2
		or	es:[bx+23h], al
		les	bx, [bp+var_4]
		mov	al, es:[bx+26h]
		les	bx, [bp+arg_0]
		mov	es:[bx+20h], al
		les	bx, [bp+var_4]
		mov	al, es:[bx+27h]
		les	bx, [bp+arg_0]
		mov	es:[bx+21h], al
		leave
		retf
sub_1C929	endp

; ���������������������������������������������������������������������������

loc_1C993:				; DATA XREF: dseg:3065o
		push	bp
		mov	bp, sp
		push	word ptr [bp+0Ah]
		push	word ptr [bp+8]
		push	word ptr [bp+6]
		mov	ax, [bp+6]
		add	ax, 1Eh
		push	word ptr [bp+8]
		push	ax
		push	cs
		call	near ptr sub_1BED0
		add	sp, 0Ah
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_1C9B2:				; DATA XREF: dseg:3045o
		push	bp
		mov	bp, sp
		sub	sp, 48h
		les	bx, [bp+6]
		mov	eax, es:[bx+2]
		sar	eax, 8
		push	eax
		les	bx, [bp+6]
		mov	al, es:[bx+22h]
		mov	ah, 0
		push	ax
		push	62D0h
		call	Palette_ShadeTableFor_1ECD2
		add	sp, 8
		mov	[bp-4],	dx
		mov	[bp-6],	ax
		les	bx, [bp+6]
		mov	al, es:[bx+23h]
		shr	ax, 2
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jnz	short loc_1CA1D
		cmp	dword ptr [bp-6], 0
		jnz	short loc_1CA07
		les	bx, [bp+6]
		mov	al, es:[bx+20h]
		mov	[bp-1],	al
		jmp	short loc_1CA1B
; ���������������������������������������������������������������������������

loc_1CA07:				; CODE XREF: seg042:14E9j
		les	bx, [bp+6]
		mov	al, es:[bx+20h]
		mov	ah, 0
		les	bx, [bp-6]
		add	bx, ax
		mov	al, es:[bx]
		mov	[bp-1],	al

loc_1CA1B:				; CODE XREF: seg042:14F5j
		jmp	short loc_1CA57
; ���������������������������������������������������������������������������

loc_1CA1D:				; CODE XREF: seg042:14E2j
		les	bx, [bp+6]
		mov	al, es:[bx+21h]
		mov	ah, 0
		push	ax
		les	bx, [bp+6]
		mov	eax, es:[bx+2]
		sar	eax, 8
		push	eax
		les	bx, [bp+6]
		mov	al, es:[bx+22h]
		mov	ah, 0
		push	ax
		les	bx, [bp+6]
		mov	al, es:[bx+20h]
		mov	ah, 0
		push	ax
		push	62D0h
		call	Palette_ShadeIndexWithFog_1F752
		add	sp, 0Ch
		mov	[bp-1],	al

loc_1CA57:				; CODE XREF: seg042:loc_1CA1Bj
		les	bx, [bp+6]
		les	bx, es:[bx+0Ah]
		mov	ax, es:[bx+1]
		mov	[bp-48h], ax
		les	bx, [bp+6]
		les	bx, es:[bx+0Ah]
		mov	ax, es:[bx+3]
		mov	[bp-46h], ax
		les	bx, [bp+6]
		mov	al, es:[bx+18h]
		mov	ah, 0
		mov	[bp-42h], ax
		les	bx, [bp+6]
		mov	al, es:[bx+19h]
		mov	ah, 0
		mov	[bp-40h], ax
		les	bx, [bp+6]
		les	bx, es:[bx+0Eh]
		mov	ax, es:[bx+1]
		mov	[bp-32h], ax
		les	bx, [bp+6]
		les	bx, es:[bx+0Eh]
		mov	ax, es:[bx+3]
		mov	[bp-30h], ax
		les	bx, [bp+6]
		mov	al, es:[bx+1Ah]
		mov	ah, 0
		mov	[bp-2Ch], ax
		les	bx, [bp+6]
		mov	al, es:[bx+1Bh]
		mov	ah, 0
		mov	[bp-2Ah], ax
		les	bx, [bp+6]
		les	bx, es:[bx+12h]
		mov	ax, es:[bx+1]
		mov	[bp-1Ch], ax
		les	bx, [bp+6]
		les	bx, es:[bx+12h]
		mov	ax, es:[bx+3]
		mov	[bp-1Ah], ax
		les	bx, [bp+6]
		mov	al, es:[bx+1Ch]
		mov	ah, 0
		mov	[bp-16h], ax
		les	bx, [bp+6]
		mov	al, es:[bx+1Dh]
		mov	ah, 0
		mov	[bp-14h], ax
		mov	al, [bp-1]
		mov	ah, 0
		mov	[bp-18h], ax
		mov	[bp-2Eh], ax
		mov	[bp-44h], ax
		mov	al, byte_46018
		mov	ah, 0
		or	ax, ax
		jnz	short loc_1CB1F
		push	ss
		lea	ax, [bp-48h]
		push	ax
		push	3
		push	word_46F44
		call	Render_PolygonPrimitive_2751E
		add	sp, 8
		jmp	short loc_1CB36
; ���������������������������������������������������������������������������

loc_1CB1F:				; CODE XREF: seg042:15F8j
		lea	ax, [bp-1Ch]
		push	ax
		lea	ax, [bp-32h]
		push	ax
		lea	ax, [bp-48h]
		push	ax
		push	word_46F44
		push	cs
		call	near ptr sub_1B610
		add	sp, 8

loc_1CB36:				; CODE XREF: seg042:160Dj
		cmp	byte_46017, 0
		jz	short locret_1CBAB
		les	bx, [bp+6]
		cmp	word ptr es:[bx+16h], 0
		jz	short locret_1CBAB
		shl	word ptr [bp-40h], 8
		shl	word ptr [bp-42h], 8
		shl	word ptr [bp-2Ah], 8
		shl	word ptr [bp-2Ch], 8
		shl	word ptr [bp-14h], 8
		shl	word ptr [bp-16h], 8
		push	word ptr [bp-4]
		push	word ptr [bp-6]
		les	bx, [bp+6]
		mov	bx, es:[bx+16h]
		mov	al, [bx+5]
		mov	ah, 0
		push	ax
		push	0
		les	bx, [bp+6]
		mov	bx, es:[bx+16h]
		mov	al, [bx+4]
		push	ax
		les	bx, [bp+6]
		mov	bx, es:[bx+16h]
		push	word ptr [bx+2]
		push	word ptr [bx]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		push	ss
		lea	ax, [bp-48h]
		push	ax
		push	3
		push	word_46F44
		call	Render_MeshPrimitive_283D0
		add	sp, 12h

locret_1CBAB:				; CODE XREF: seg042:162Bj seg042:1635j
		leave
		retf
; ���������������������������������������������������������������������������

loc_1CBAD:				; DATA XREF: dseg:3049o
		push	bp
		mov	bp, sp
		les	bx, [bp+6]
		and	byte ptr es:[bx+23h], 0FDh
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_1CBBA:				; DATA XREF: dseg:3059o
		push	bp
		mov	bp, sp
		mov	al, 7
		pop	bp
		retf
; ���������������������������������������������������������������������������
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_1CBC3	proc far		; CODE XREF: sub_1CC38+37p

var_8		= dword	ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword	ptr  6
arg_4		= byte ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	al, [bp+arg_4]
		mov	ah, 0
		mov	[bp+var_4], ax
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 27h	; '''
		mov	word ptr [bp+var_8+2], ax
		mov	word ptr [bp+var_8], dx
		push	[bp+var_4]
		push	62D0h
		call	sub_1ED93
		add	sp, 4
		mov	si, ax
		cmp	si, 0FFFFh
		jz	short loc_1CC11
		mov	ax, si
		mov	dx, 0Fh
		imul	dx
		mov	bx, word_4934A
		add	bx, ax
		mov	al, byte ptr [bp+var_4]
		sub	al, [bx+6]
		les	bx, [bp+var_8]
		mov	es:[bx], al
		jmp	short loc_1CC18
; ���������������������������������������������������������������������������

loc_1CC11:				; CODE XREF: sub_1CBC3+31j
		les	bx, [bp+var_8]
		mov	byte ptr es:[bx], 0

loc_1CC18:				; CODE XREF: sub_1CBC3+4Cj
		mov	[bp+var_2], si
		cmp	[bp+var_2], 0FFFFh
		jnz	short loc_1CC2B
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+26h], 0
		jmp	short loc_1CC35
; ���������������������������������������������������������������������������

loc_1CC2B:				; CODE XREF: sub_1CBC3+5Cj
		les	bx, [bp+arg_0]
		mov	al, byte ptr [bp+var_2]
		mov	es:[bx+26h], al

loc_1CC35:				; CODE XREF: sub_1CBC3+66j
		pop	si
		leave
		retf
sub_1CBC3	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_1CC38	proc far		; CODE XREF: sub_C4390+59CP

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h
arg_C		= word ptr  12h
arg_E		= word ptr  14h
arg_10		= dword	ptr  16h

		push	bp
		mov	bp, sp
		push	word ptr [bp+arg_10+2]
		push	word ptr [bp+arg_10]
		push	[bp+arg_E]
		push	[bp+arg_C]
		push	[bp+arg_A]
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	cs
		call	near ptr sub_1B829
		add	sp, 14h
		les	bx, [bp+arg_10]
		mov	al, es:[bx+4]
		push	ax
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	cs
		call	near ptr sub_1CBC3
		add	sp, 6
		pop	bp
		retf
sub_1CC38	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_1CC77	proc far		; CODE XREF: sub_C4390+5DCP

var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= dword	ptr  0Ah
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h
arg_C		= word ptr  12h
arg_E		= word ptr  14h
arg_10		= word ptr  16h
arg_12		= word ptr  18h

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	[bp+arg_12]
		push	[bp+arg_10]
		push	[bp+arg_E]
		push	[bp+arg_C]
		push	[bp+arg_A]
		push	[bp+arg_8]
		push	word ptr [bp+arg_4+2]
		push	word ptr [bp+arg_4]
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		push	cs
		call	near ptr sub_1B94E
		add	sp, 14h
		mov	eax, [bp+arg_4]
		mov	[bp+var_4], eax
		les	bx, [bp+var_4]
		mov	al, es:[bx+26h]
		les	bx, [bp+arg_0]
		mov	es:[bx+1Eh], al
		les	bx, [bp+var_4]
		mov	al, es:[bx+27h]
		les	bx, [bp+arg_0]
		mov	es:[bx+1Fh], al
		leave
		retf
sub_1CC77	endp

; ���������������������������������������������������������������������������

loc_1CCC8:				; DATA XREF: dseg:3041o
		push	bp
		mov	bp, sp
		sub	sp, 48h
		push	si
		push	di
		les	bx, [bp+6]
		mov	eax, es:[bx+6]
		mov	[bp-4],	eax
		mov	ax, [bp+0Ah]
		mov	[bp-6],	ax
		les	bx, [bp-4]
		mov	eax, es:[bx+19h]
		mov	[bp-0Ah], eax
		les	bx, [bp+6]
		les	bx, es:[bx+0Ah]
		mov	al, es:[bx+11h]
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jnz	short loc_1CD58
		mov	ax, [bp-8]
		mov	dx, [bp-0Ah]
		add	dx, 0Ch
		mov	[bp-0Ch], ax
		mov	[bp-0Eh], dx
		les	si, [bp-0Eh]
		mov	eax, es:[si]
		mov	[bp-30h], eax
		mov	eax, es:[si+4]
		mov	[bp-2Ch], eax
		mov	eax, es:[si+8]
		mov	[bp-28h], eax
		lea	ax, [bp-30h]
		push	ax
		push	word ptr [bp-6]
		push	6435h
		call	LightSet_FaceIntensity_1DB23
		add	sp, 6
		les	bx, [bp+6]
		les	bx, es:[bx+0Ah]
		mov	es:[bx], al
		les	bx, [bp+6]
		les	bx, es:[bx+0Ah]
		or	byte ptr es:[bx+11h], 1
		jmp	short $+2

loc_1CD58:				; CODE XREF: seg042:17F0j
		mov	ax, [bp+0Ah]
		mov	[bp-10h], ax
		les	bx, [bp-4]
		mov	eax, es:[bx+1Dh]
		mov	[bp-14h], eax
		les	bx, [bp+6]
		les	bx, es:[bx+0Eh]
		mov	al, es:[bx+11h]
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jnz	short loc_1CDD4
		mov	ax, [bp-12h]
		mov	dx, [bp-14h]
		add	dx, 0Ch
		mov	[bp-16h], ax
		mov	[bp-18h], dx
		les	di, [bp-18h]
		mov	eax, es:[di]
		mov	[bp-3Ch], eax
		mov	eax, es:[di+4]
		mov	[bp-38h], eax
		mov	eax, es:[di+8]
		mov	[bp-34h], eax
		lea	ax, [bp-3Ch]
		push	ax
		push	word ptr [bp-10h]
		push	6435h
		call	LightSet_FaceIntensity_1DB23
		add	sp, 6
		les	bx, [bp+6]
		les	bx, es:[bx+0Eh]
		mov	es:[bx], al
		les	bx, [bp+6]
		les	bx, es:[bx+0Eh]
		or	byte ptr es:[bx+11h], 1
		jmp	short $+2

loc_1CDD4:				; CODE XREF: seg042:186Cj
		mov	ax, [bp+0Ah]
		mov	[bp-1Ah], ax
		les	bx, [bp-4]
		mov	eax, es:[bx+21h]
		mov	[bp-1Eh], eax
		les	bx, [bp+6]
		les	bx, es:[bx+12h]
		mov	al, es:[bx+11h]
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jnz	short loc_1CE5C
		mov	ax, [bp-1Ch]
		mov	dx, [bp-1Eh]
		add	dx, 0Ch
		mov	[bp-20h], ax
		mov	[bp-22h], dx
		les	ax, [bp-22h]
		mov	[bp-24h], ax
		mov	bx, [bp-24h]
		mov	eax, es:[bx]
		mov	[bp-48h], eax
		mov	bx, [bp-24h]
		mov	eax, es:[bx+4]
		mov	[bp-44h], eax
		mov	bx, [bp-24h]
		mov	eax, es:[bx+8]
		mov	[bp-40h], eax
		lea	ax, [bp-48h]
		push	ax
		push	word ptr [bp-1Ah]
		push	6435h
		call	LightSet_FaceIntensity_1DB23
		add	sp, 6
		les	bx, [bp+6]
		les	bx, es:[bx+12h]
		mov	es:[bx], al
		les	bx, [bp+6]
		les	bx, es:[bx+12h]
		or	byte ptr es:[bx+11h], 1
		jmp	short $+2

loc_1CE5C:				; CODE XREF: seg042:18E8j
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_1CE60:				; DATA XREF: dseg:3021o
		push	bp
		mov	bp, sp
		sub	sp, 60h
		push	si
		push	di
		les	bx, [bp+6]
		les	bx, es:[bx+0Ah]
		mov	ax, es:[bx+1]
		mov	[bp-60h], ax
		les	bx, [bp+6]
		les	bx, es:[bx+0Ah]
		mov	ax, es:[bx+3]
		mov	[bp-5Eh], ax
		les	bx, [bp+6]
		mov	al, es:[bx+18h]
		mov	ah, 0
		shl	ax, 8
		mov	[bp-5Ah], ax
		les	bx, [bp+6]
		mov	al, es:[bx+19h]
		mov	ah, 0
		shl	ax, 8
		mov	[bp-58h], ax
		les	bx, [bp+6]
		les	bx, es:[bx+0Ah]
		mov	al, es:[bx]
		mov	ah, 0
		mov	si, ax
		les	bx, [bp+6]
		mov	al, es:[bx+1Fh]
		mov	ah, 0
		push	ax
		les	bx, [bp+6]
		mov	ax, es:[bx+0Ch]
		mov	dx, es:[bx+0Ah]
		add	dx, 9
		mov	[bp-2],	ax
		mov	[bp-4],	dx
		les	bx, [bp-4]
		mov	eax, es:[bx]
		mov	[bp-8],	eax
		mov	eax, [bp-8]
		sar	eax, 8
		push	eax
		push	si
		les	bx, [bp+6]
		mov	al, es:[bx+1Eh]
		mov	ah, 0
		push	ax
		push	62D0h
		call	Palette_ShadeIndexWithFog_1F752
		add	sp, 0Ch
		mov	[bp-5Ch], ax
		les	bx, [bp+6]
		les	bx, es:[bx+0Eh]
		mov	ax, es:[bx+1]
		mov	[bp-4Ah], ax
		les	bx, [bp+6]
		les	bx, es:[bx+0Eh]
		mov	ax, es:[bx+3]
		mov	[bp-48h], ax
		les	bx, [bp+6]
		mov	al, es:[bx+1Ah]
		mov	ah, 0
		shl	ax, 8
		mov	[bp-44h], ax
		les	bx, [bp+6]
		mov	al, es:[bx+1Bh]
		mov	ah, 0
		shl	ax, 8
		mov	[bp-42h], ax
		les	bx, [bp+6]
		les	bx, es:[bx+0Eh]
		mov	al, es:[bx]
		mov	ah, 0
		mov	di, ax
		les	bx, [bp+6]
		mov	al, es:[bx+1Fh]
		mov	ah, 0
		push	ax
		les	bx, [bp+6]
		mov	ax, es:[bx+10h]
		mov	dx, es:[bx+0Eh]
		add	dx, 9
		mov	[bp-0Ah], ax
		mov	[bp-0Ch], dx
		les	bx, [bp-0Ch]
		mov	eax, es:[bx]
		mov	[bp-10h], eax
		mov	eax, [bp-10h]
		sar	eax, 8
		push	eax
		push	di
		les	bx, [bp+6]
		mov	al, es:[bx+1Eh]
		mov	ah, 0
		push	ax
		push	62D0h
		call	Palette_ShadeIndexWithFog_1F752
		add	sp, 0Ch
		mov	[bp-46h], ax
		les	bx, [bp+6]
		les	bx, es:[bx+12h]
		mov	ax, es:[bx+1]
		mov	[bp-34h], ax
		les	bx, [bp+6]
		les	bx, es:[bx+12h]
		mov	ax, es:[bx+3]
		mov	[bp-32h], ax
		les	bx, [bp+6]
		mov	al, es:[bx+1Ch]
		mov	ah, 0
		shl	ax, 8
		mov	[bp-2Eh], ax
		les	bx, [bp+6]
		mov	al, es:[bx+1Dh]
		mov	ah, 0
		shl	ax, 8
		mov	[bp-2Ch], ax
		les	bx, [bp+6]
		les	bx, es:[bx+12h]
		mov	al, es:[bx]
		mov	ah, 0
		mov	[bp-12h], ax
		les	bx, [bp+6]
		mov	al, es:[bx+1Fh]
		mov	ah, 0
		push	ax
		les	bx, [bp+6]
		mov	ax, es:[bx+14h]
		mov	dx, es:[bx+12h]
		add	dx, 9
		mov	[bp-14h], ax
		mov	[bp-16h], dx
		les	bx, [bp-16h]
		mov	eax, es:[bx]
		mov	[bp-1Ah], eax
		mov	eax, [bp-1Ah]
		sar	eax, 8
		push	eax
		push	word ptr [bp-12h]
		les	bx, [bp+6]
		mov	al, es:[bx+1Eh]
		mov	ah, 0
		push	ax
		push	62D0h
		call	Palette_ShadeIndexWithFog_1F752
		add	sp, 0Ch
		mov	[bp-30h], ax
		cmp	byte_46016, 0
		jz	short loc_1D074
		mov	ax, [bp-5Ch]
		cmp	ax, [bp-46h]
		jnz	short loc_1D053
		mov	ax, [bp-5Ch]
		cmp	ax, [bp-30h]
		jnz	short loc_1D053
		push	ss
		lea	ax, [bp-60h]
		push	ax
		push	3
		push	word_46F44
		call	Render_PolygonPrimitive_2751E
		add	sp, 8
		jmp	short loc_1D072
; ���������������������������������������������������������������������������

loc_1D053:				; CODE XREF: seg042:1B24j seg042:1B2Cj
		shl	word ptr [bp-5Ch], 8
		shl	word ptr [bp-46h], 8
		shl	word ptr [bp-30h], 8
		push	ss
		lea	ax, [bp-60h]
		push	ax
		push	3
		push	word_46F44
		call	Render_MeshPrimitive_27D5F
		add	sp, 8

loc_1D072:				; CODE XREF: seg042:1B41j
		jmp	short loc_1D0C0
; ���������������������������������������������������������������������������

loc_1D074:				; CODE XREF: seg042:1B1Cj
		cmp	byte_46018, 0
		jz	short loc_1D094
		lea	ax, [bp-34h]
		push	ax
		lea	ax, [bp-4Ah]
		push	ax
		lea	ax, [bp-60h]
		push	ax
		push	word_46F44
		push	cs
		call	near ptr sub_1B610
		add	sp, 8
		jmp	short loc_1D0C0
; ���������������������������������������������������������������������������

loc_1D094:				; CODE XREF: seg042:1B69j
		mov	ax, [bp-5Ch]
		add	ax, [bp-46h]
		add	ax, [bp-30h]
		mov	bx, 3
		xor	dx, dx
		div	bx
		mov	[bp-30h], ax
		mov	[bp-46h], ax
		mov	[bp-5Ch], ax
		push	ss
		lea	ax, [bp-60h]
		push	ax
		push	3
		push	word_46F44
		call	Render_PolygonPrimitive_2751E
		add	sp, 8

loc_1D0C0:				; CODE XREF: seg042:loc_1D072j
					; seg042:1B82j
		cmp	byte_46017, 0
		jnz	short loc_1D0CA
		jmp	loc_1D14D
; ���������������������������������������������������������������������������

loc_1D0CA:				; CODE XREF: seg042:1BB5j
		les	bx, [bp+6]
		cmp	word ptr es:[bx+16h], 0
		jz	short loc_1D14D
		les	bx, [bp+6]
		mov	eax, es:[bx+2]
		sar	eax, 8
		push	eax
		mov	ax, si
		add	ax, di
		add	ax, [bp-12h]
		mov	bx, 3
		cwd
		idiv	bx
		push	ax
		push	62D0h
		call	Palette_ShadeTableFor_1ECD2
		add	sp, 8
		mov	[bp-1Ch], dx
		mov	[bp-1Eh], ax
		push	word ptr [bp-1Ch]
		push	word ptr [bp-1Eh]
		les	bx, [bp+6]
		mov	bx, es:[bx+16h]
		mov	al, [bx+5]
		mov	ah, 0
		push	ax
		push	0
		les	bx, [bp+6]
		mov	bx, es:[bx+16h]
		mov	al, [bx+4]
		push	ax
		les	bx, [bp+6]
		mov	bx, es:[bx+16h]
		push	word ptr [bx+2]
		push	word ptr [bx]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		push	ss
		lea	ax, [bp-60h]
		push	ax
		push	3
		push	word_46F44
		call	Render_MeshPrimitive_283D0
		add	sp, 12h

loc_1D14D:				; CODE XREF: seg042:1BB7j seg042:1BC2j
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_1D151:				; DATA XREF: dseg:3035o
		push	bp
		mov	bp, sp
		mov	al, 8
		pop	bp
		retf
; ���������������������������������������������������������������������������
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_1D15A:				; DATA XREF: dseg:3019o
		push	bp
		mov	bp, sp
		push	word ptr [bp+0Ah]
		push	word ptr [bp+8]
		push	word ptr [bp+6]
		mov	ax, [bp+6]
		add	ax, 1Eh
		push	word ptr [bp+8]
		push	ax
		push	cs
		call	near ptr sub_1BED0
		add	sp, 0Ah
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_1D179:				; DATA XREF: dseg:2FF9o
		push	bp
		mov	bp, sp
		sub	sp, 42h
		les	bx, [bp+6]
		les	bx, es:[bx+0Ah]
		mov	ax, es:[bx+1]
		mov	[bp-42h], ax
		les	bx, [bp+6]
		les	bx, es:[bx+0Ah]
		mov	ax, es:[bx+3]
		mov	[bp-40h], ax
		les	bx, [bp+6]
		mov	al, es:[bx+18h]
		mov	ah, 0
		shl	ax, 8
		mov	[bp-3Ch], ax
		les	bx, [bp+6]
		mov	al, es:[bx+19h]
		mov	ah, 0
		shl	ax, 8
		mov	[bp-3Ah], ax
		les	bx, [bp+6]
		les	bx, es:[bx+0Eh]
		mov	ax, es:[bx+1]
		mov	[bp-2Ch], ax
		les	bx, [bp+6]
		les	bx, es:[bx+0Eh]
		mov	ax, es:[bx+3]
		mov	[bp-2Ah], ax
		les	bx, [bp+6]
		mov	al, es:[bx+1Ah]
		mov	ah, 0
		shl	ax, 8
		mov	[bp-26h], ax
		les	bx, [bp+6]
		mov	al, es:[bx+1Bh]
		mov	ah, 0
		shl	ax, 8
		mov	[bp-24h], ax
		les	bx, [bp+6]
		les	bx, es:[bx+12h]
		mov	ax, es:[bx+1]
		mov	[bp-16h], ax
		les	bx, [bp+6]
		les	bx, es:[bx+12h]
		mov	ax, es:[bx+3]
		mov	[bp-14h], ax
		les	bx, [bp+6]
		mov	al, es:[bx+1Ch]
		mov	ah, 0
		shl	ax, 8
		mov	[bp-10h], ax
		les	bx, [bp+6]
		mov	al, es:[bx+1Dh]
		mov	ah, 0
		shl	ax, 8
		mov	[bp-0Eh], ax
		xor	ax, ax
		mov	[bp-12h], ax
		mov	[bp-28h], ax
		mov	[bp-3Eh], ax
		cmp	byte_46017, 0
		jz	short loc_1D2AC
		les	bx, [bp+6]
		mov	eax, es:[bx+2]
		sar	eax, 8
		push	eax
		les	bx, [bp+6]
		mov	al, es:[bx+22h]
		mov	ah, 0
		push	ax
		push	62D0h
		call	Palette_ShadeTableFor_1ECD2
		add	sp, 8
		push	dx
		push	ax
		les	bx, [bp+6]
		mov	bx, es:[bx+16h]
		mov	al, [bx+5]
		mov	ah, 0
		push	ax
		push	0
		les	bx, [bp+6]
		mov	bx, es:[bx+16h]
		mov	al, [bx+4]
		push	ax
		les	bx, [bp+6]
		mov	bx, es:[bx+16h]
		push	word ptr [bx+2]
		push	word ptr [bx]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		push	ss
		lea	ax, [bp-42h]
		push	ax
		push	3
		push	word_46F44
		call	Render_MeshPrimitive_283D0
		add	sp, 12h
		jmp	short locret_1D2DF
; ���������������������������������������������������������������������������

loc_1D2AC:				; CODE XREF: seg042:1D2Dj
		cmp	byte_46018, 0
		jz	short loc_1D2CC
		lea	ax, [bp-16h]
		push	ax
		lea	ax, [bp-2Ch]
		push	ax
		lea	ax, [bp-42h]
		push	ax
		push	word_46F44
		push	cs
		call	near ptr sub_1B610
		add	sp, 8
		jmp	short locret_1D2DF
; ���������������������������������������������������������������������������

loc_1D2CC:				; CODE XREF: seg042:1DA1j
		push	ss
		lea	ax, [bp-42h]
		push	ax
		push	3
		push	word_46F44
		call	Render_PolygonPrimitive_2751E
		add	sp, 8

locret_1D2DF:				; CODE XREF: seg042:1D9Aj seg042:1DBAj
		leave
		retf
; ���������������������������������������������������������������������������

loc_1D2E1:				; DATA XREF: dseg:2FFDo
		push	bp
		mov	bp, sp
		les	bx, [bp+6]
		and	byte ptr es:[bx+23h], 0FDh
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_1D2EE:				; DATA XREF: dseg:300Do
		push	bp
		mov	bp, sp
		mov	al, 9
		pop	bp
		retf
; ���������������������������������������������������������������������������
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_1D2F7:				; DATA XREF: dseg:58F8o
		push	bp
		mov	bp, sp
		mov	word_4918E, 2E1Ch
		mov	word_4918E, 2E20h
		mov	word_4918E, 3129h
		mov	word_4918E, 314Dh
		mov	word_491A5, 2E1Ch
		mov	word_491A5, 2E20h
		mov	word_491A5, 3129h
		mov	word_491A5, 3105h
		mov	word_491BF, 2E1Ch
		mov	word_491BF, 2E20h
		mov	word_491BF, 3129h
		mov	word_491BF, 314Dh
		mov	word_491BF, 30E1h
		mov	word_491D6, 2E1Ch
		mov	word_491D6, 2E20h
		mov	word_491D6, 3129h
		mov	word_491EC, 30B5h
		and	byte_491F1, 0FDh
		and	byte_491F1, 0FEh
		mov	word_491D6, 30B9h
		mov	word_491EC, 30DDh
		mov	word_491F2, 2E1Ch
		mov	word_491F2, 2E20h
		mov	word_491F2, 3129h
		mov	word_491F2, 3091h
		mov	word_4920A, 2E1Ch
		mov	word_4920A, 2E20h
		mov	word_4920A, 3129h
		mov	word_4920A, 306Dh
		mov	word_49220, 0
		mov	word_49228, 2E1Ch
		mov	word_49228, 2E20h
		mov	word_49228, 3129h
		mov	word_49228, 306Dh
		mov	word_4923E, 0
		mov	word_49246, 30B5h
		and	byte_4924B, 0FDh
		and	byte_4924B, 0FEh
		mov	word_49228, 3045h
		mov	word_49246, 3069h
		mov	word_4924C, 2E1Ch
		mov	word_4924C, 2E20h
		mov	word_4924C, 3129h
		mov	word_4924C, 306Dh
		mov	word_49262, 0
		mov	word_4924C, 3021h
		mov	word_4926C, 2E1Ch
		mov	word_4926C, 2E20h
		mov	word_4926C, 3129h
		mov	word_4926C, 306Dh
		mov	word_49282, 0
		mov	word_4928A, 30B5h
		and	byte_4928F, 0FDh
		and	byte_4928F, 0FEh
		mov	word_4926C, 2FF9h
		mov	word_4928A, 301Dh
		pop	bp
		retf
seg042		ends
