seg051		segment	byte public 'CODE' use16
		assume cs:seg051
		;org 7
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

loc_21897:				; DATA XREF: dseg:336Co
		push	bp
		mov	bp, sp
		mov	al, 0
		pop	bp
		retf
; ���������������������������������������������������������������������������
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_218A0:				; DATA XREF: dseg:3368o
		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	eax, [bp+6]
		mov	[bp-4],	eax
		push	2Ch ; ','
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_218F0
		mov	word ptr [si], 3340h
		mov	dword ptr [si+6], 0
		mov	word ptr [si+2], 0
		mov	byte ptr [si+4], 0
		mov	byte ptr [si+5], 0
		mov	word ptr [si], 32B4h
		push	word ptr [bp-2]
		push	word ptr [bp-4]
		push	si
		call	sub_210C0
		add	sp, 6
		mov	ax, si
		jmp	short loc_218F2
; ���������������������������������������������������������������������������

loc_218F0:				; CODE XREF: seg051:002Ej
		mov	ax, si

loc_218F2:				; CODE XREF: seg051:005Ej
		mov	di, ax
		push	di
		push	word ptr [bp+8]
		push	word ptr [bp+6]
		call	sub_429E9
		add	sp, 6
		mov	ax, di
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_2190D:				; DATA XREF: dseg:3374o dseg:3388o
		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+0Ah]
		mov	di, [bp+0Ch]
		les	bx, [bp+6]
		mov	al, es:[bx+3]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_21954
		push	si
		push	di
		mov	bx, [di]
		call	dword ptr [bx+84h]
		add	sp, 4
		mov	[bp-2],	ax
		mov	ax, [bp-2]
		mov	[bp-4],	ax
		mov	ax, [bp-4]
		add	[si+2Ah], ax
		mov	ax, [si+2Ah]
		les	bx, [bp+6]
		cmp	ax, es:[bx+6]
		jb	short loc_21954
		mov	al, 1
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_21954:				; CODE XREF: seg051:0096j seg051:00BCj
		mov	al, 0
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_21963:				; DATA XREF: dseg:3370o dseg:3384o
		push	bp
		mov	bp, sp
		les	bx, [bp+6]
		cmp	byte ptr es:[bx+3], 0
		jz	short loc_21974
		mov	al, 0
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_21974:				; CODE XREF: seg051:00DEj
		mov	al, 1
		pop	bp
		retf
; ���������������������������������������������������������������������������
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_2197A	proc far		; CODE XREF: seg050:080DP
					; DATA XREF: dseg:32A8o

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_219A9
		mov	word ptr [si], 32A8h
		mov	word ptr [si], 2BDh
		push	si
		call	sub_2FEE0
		add	sp, 2
		test	di, 1
		jz	short loc_219A9
		push	si
		call	sub_308
		add	sp, 2

loc_219A9:				; CODE XREF: sub_2197A+Dj
					; sub_2197A+24j
		pop	di
		pop	si
		pop	bp
		retf
sub_2197A	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+6]
		mov	word ptr [bp-2], 0
		xor	di, di
		jmp	short $+2

loc_219C1:				; CODE XREF: seg051:0148j
		lea	ax, [bp-2]
		push	ax
		push	si
		call	sub_2FF1E
		add	sp, 4
		or	ax, ax
		jz	short loc_219DA
		mov	ax, di
		inc	di
		cmp	ax, [bp+8]
		jl	short loc_219C1

loc_219DA:				; CODE XREF: seg051:0140j
		cmp	word ptr [bp-2], 0
		jz	short loc_219EC
		push	word ptr [bp-2]
		push	si
		nop
		push	cs
		call	near ptr sub_21A34
		add	sp, 4

loc_219EC:				; CODE XREF: seg051:014Ej
		pop	di
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_219F0	proc far		; CODE XREF: sub_C2650+72P

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= dword	ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	short $+2

loc_21A01:				; CODE XREF: sub_219F0+2Dj
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	sub_2FF1E
		add	sp, 4
		or	ax, ax
		jz	short loc_21A1F
		mov	bx, [bp+var_2]
		mov	eax, [bx+4]
		cmp	eax, [bp+arg_2]
		jnz	short loc_21A01

loc_21A1F:				; CODE XREF: sub_219F0+20j
		cmp	[bp+var_2], 0
		jz	short loc_21A31
		push	[bp+var_2]
		push	si
		nop
		push	cs
		call	near ptr sub_21A34
		add	sp, 4

loc_21A31:				; CODE XREF: sub_219F0+33j
		pop	si
		leave
		retf
sub_219F0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_21A34	proc far		; CODE XREF: seg051:0156p
					; sub_219F0+3Bp

var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	di, di
		jz	short loc_21A94
		mov	eax, [di+4]
		mov	[bp+var_4], eax
		les	bx, [bp+var_4]
		dec	word ptr es:[bx+4]
		les	bx, [bp+var_4]
		mov	al, es:[bx+4]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_21A94
		les	bx, [bp+var_4]
		cmp	byte ptr es:[bx+2], 0
		jz	short loc_21A94
		cmp	[bp+var_4], 0
		jz	short loc_21A88
		push	3
		push	word ptr [bp+var_4+2]
		push	word ptr [bp+var_4]
		les	bx, [bp+var_4]
		mov	bx, es:[bx]
		call	dword ptr [bx]
		add	sp, 6
		jmp	short $+2

loc_21A88:				; CODE XREF: sub_21A34+3Dj
		push	0
		push	di
		push	si
		call	LinkedListB_FindAndDispatch_2FE19
		add	sp, 6

loc_21A94:				; CODE XREF: sub_21A34+10j
					; sub_21A34+2Cj ...
		pop	di
		pop	si
		leave
		retf
sub_21A34	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_21A98	proc far		; CODE XREF: sub_21BA2+13p
					; seg051:03E3p	...

var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= byte ptr -8
var_6		= dword	ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= dword	ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 14h
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		mov	eax, [bp+arg_2]
		mov	[bp+var_14], eax
		push	8
		push	word ptr [bp+var_14+2]
		push	word ptr [bp+var_14]
		push	ds
		lea	ax, [bp+var_10]
		push	ax
		call	CRT_MemFamily_Extra8
		add	sp, 0Ah
		mov	[bp+var_8], 0
		jmp	short loc_21B05
; ���������������������������������������������������������������������������

loc_21ACA:				; CODE XREF: sub_21A98+7Cj
		mov	bx, [bp+var_2]
		mov	eax, [bx+4]
		mov	[bp+var_6], eax
		les	bx, [bp+var_6]
		mov	eax, es:[bx+19h]
		cmp	eax, [bp+var_10]
		jnz	short loc_21AF6
		les	bx, [bp+var_6]
		mov	eax, es:[bx+1Dh]
		cmp	eax, [bp+var_C]
		jnz	short loc_21AF6
		mov	ax, 1
		jmp	short loc_21AF8
; ���������������������������������������������������������������������������

loc_21AF6:				; CODE XREF: sub_21A98+49j
					; sub_21A98+57j
		xor	ax, ax

loc_21AF8:				; CODE XREF: sub_21A98+5Cj
		or	al, al
		jz	short loc_21B05
		mov	dx, word ptr [bp+var_6+2]
		mov	ax, word ptr [bp+var_6]
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_21B05:				; CODE XREF: sub_21A98+30j
					; sub_21A98+62j
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	sub_2FF1E
		add	sp, 4
		or	ax, ax
		jnz	short loc_21ACA
		xor	dx, dx
		xor	ax, ax
		pop	si
		leave
		retf
sub_21A98	endp

; ���������������������������������������������������������������������������
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+6]
		mov	word ptr [bp-2], 0
		jmp	short loc_21B43
; ���������������������������������������������������������������������������

loc_21B31:				; CODE XREF: seg051:02C2j
		mov	bx, [bp-2]
		mov	eax, [bx+4]
		cmp	eax, [bp+8]
		jnz	short loc_21B43
		mov	al, 1
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_21B43:				; CODE XREF: seg051:029Fj seg051:02ACj
		lea	ax, [bp-2]
		push	ax
		push	si
		call	sub_2FF1E
		add	sp, 4
		or	ax, ax
		jnz	short loc_21B31
		mov	al, 0
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+6]
		mov	word ptr [bp-2], 0
		xor	di, di
		jmp	short loc_21B85
; ���������������������������������������������������������������������������

loc_21B70:				; CODE XREF: seg051:0304j
		mov	ax, di
		inc	di
		cmp	ax, [bp+8]
		jnz	short loc_21B85
		mov	bx, [bp-2]
		mov	dx, [bx+6]
		mov	ax, [bx+4]
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_21B85:				; CODE XREF: seg051:02DEj seg051:02E6j
		lea	ax, [bp-2]
		push	ax
		push	si
		call	sub_2FF1E
		add	sp, 4
		or	ax, ax
		jnz	short loc_21B70
		xor	dx, dx
		xor	ax, ax
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		pop	di
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_21BA2	proc far		; CODE XREF: sub_1220C+17BP
					; seg026:1479P	...

var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= byte ptr  0Ch
arg_8		= byte ptr  0Eh

; FUNCTION CHUNK AT 03CC SIZE 00000004 BYTES

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr sub_21A98
		add	sp, 6
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		cmp	[bp+var_4], 0
		jnz	short loc_21BE1
		mov	al, [bp+arg_8]
		push	ax
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	si
		call	sub_42A35
		add	sp, 8
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax

loc_21BE1:				; CODE XREF: sub_21BA2+24j
		cmp	[bp+var_4], 0
		jz	short loc_21C56
		les	bx, [bp+var_4]
		mov	al, [bp+arg_6]
		mov	es:[bx+22h], al
		push	word ptr [bp+var_4+2]
		push	word ptr [bp+var_4]
		les	bx, [bp+var_4]
		mov	bx, es:[bx]
		call	dword ptr [bx+4]
		add	sp, 4
		mov	di, ax
		or	di, di
		jz	short loc_21C4E
		mov	[bp+var_8], 0
		les	bx, [bp+var_4]
		cmp	dword ptr es:[bx+15h], 0
		jz	short loc_21C3F
		push	di
		les	bx, [bp+var_4]
		push	word ptr es:[bx+17h]
		push	word ptr es:[bx+15h]
		les	bx, [bp+var_4]
		les	bx, es:[bx+15h]
		mov	bx, es:[bx]
		call	dword ptr [bx+4]
		add	sp, 6
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax

loc_21C3F:				; CODE XREF: sub_21BA2+79j
		mov	eax, [bp+var_8]
		mov	[di+0Ah], eax
		les	bx, [bp+var_4]
		inc	word ptr es:[bx+4]

loc_21C4E:				; CODE XREF: sub_21BA2+66j
		mov	ax, di
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		jmp	short loc_21C5C
; ���������������������������������������������������������������������������

loc_21C56:				; CODE XREF: sub_21BA2+44j
		xor	ax, ax
		pop	di
		pop	si
		leave
		retf
sub_21BA2	endp

; ���������������������������������������������������������������������������
; START	OF FUNCTION CHUNK FOR sub_21BA2

loc_21C5C:				; CODE XREF: sub_21BA2+B2j
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK	FOR sub_21BA2
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		push	di
		mov	si, [bp+6]
		push	word ptr [bp+0Ah]
		push	word ptr [bp+8]
		push	si
		push	cs
		call	near ptr sub_21A98
		add	sp, 6
		mov	[bp-2],	dx
		mov	[bp-4],	ax
		cmp	dword ptr [bp-4], 0
		jnz	short loc_21C9F
		mov	al, [bp+0Eh]
		push	ax
		push	word ptr [bp+0Ah]
		push	word ptr [bp+8]
		push	si
		call	sub_42A35
		add	sp, 8
		mov	[bp-2],	dx
		mov	[bp-4],	ax

loc_21C9F:				; CODE XREF: seg051:03F4j
		cmp	dword ptr [bp-4], 0
		jz	short loc_21D1F
		push	word ptr [bp-2]
		push	word ptr [bp-4]
		push	0
		call	sub_21F29
		add	sp, 6
		mov	di, ax
		or	di, di
		jz	short loc_21D17
		mov	ax, [bp-2]
		mov	dx, [bp-4]
		add	dx, 19h
		mov	[bp-6],	ax
		mov	[bp-8],	dx
		mov	eax, [bp-8]
		mov	[di+6],	eax
		mov	dword ptr [bp-0Ch], 0
		les	bx, [bp-4]
		cmp	dword ptr es:[bx+15h], 0
		jz	short loc_21D08
		push	di
		les	bx, [bp-4]
		push	word ptr es:[bx+17h]
		push	word ptr es:[bx+15h]
		les	bx, [bp-4]
		les	bx, es:[bx+15h]
		mov	bx, es:[bx]
		call	dword ptr [bx+4]
		add	sp, 6
		mov	[bp-0Ah], dx
		mov	[bp-0Ch], ax

loc_21D08:				; CODE XREF: seg051:0454j
		mov	eax, [bp-0Ch]
		mov	[di+0Ah], eax
		les	bx, [bp-4]
		inc	word ptr es:[bx+4]

loc_21D17:				; CODE XREF: seg051:042Aj
		mov	ax, di
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		jmp	short loc_21D25
; ���������������������������������������������������������������������������

loc_21D1F:				; CODE XREF: seg051:0414j
		xor	ax, ax
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_21D25:				; CODE XREF: seg051:048Dj
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		mov	word ptr [bp-2], 0
		or	di, di
		jnz	short loc_21D43
		jmp	loc_21E1F
; ���������������������������������������������������������������������������

loc_21D43:				; CODE XREF: seg051:04AEj
		mov	eax, [di+0Eh]
		mov	[bp-6],	eax
		cmp	dword ptr [bp-6], 0
		jnz	short loc_21D55
		jmp	loc_21E1F
; ���������������������������������������������������������������������������

loc_21D55:				; CODE XREF: seg051:04C0j
		les	bx, [bp-6]
		mov	al, [bp+0Ah]
		mov	es:[bx+22h], al
		push	word ptr [bp-4]
		push	word ptr [bp-6]
		les	bx, [bp-6]
		mov	bx, es:[bx]
		call	dword ptr [bx+4]
		add	sp, 4
		mov	[bp-2],	ax
		cmp	word ptr [bp-2], 0
		jz	short loc_21DF4
		mov	eax, [di+0Ah]
		mov	bx, [bp-2]
		mov	[bx+0Ah], eax
		mov	ax, [bp-2]
		mov	[bp-8],	ax
		mov	bx, [bp-2]
		les	bx, [bx+0Ah]
		mov	ax, [bp-8]
		mov	es:[bx+6], ax
		mov	dword ptr [di+0Ah], 0
		les	bx, [bp-6]
		inc	word ptr es:[bx+4]
		push	di
		call	sub_21381
		add	sp, 2
		mov	[bp-0Ah], ax
		mov	bx, [bp-0Ah]
		mov	eax, [bx]
		mov	bx, [bp-2]
		mov	[bx+12h], eax
		mov	bx, [bp-0Ah]
		mov	eax, [bx+4]
		mov	bx, [bp-2]
		mov	[bx+16h], eax
		mov	bx, [bp-0Ah]
		mov	eax, [bx+8]
		mov	bx, [bp-2]
		mov	[bx+1Ah], eax
		push	di
		mov	bx, [di]
		call	dword ptr [bx+78h]
		add	sp, 2
		push	ax
		push	word ptr [bp-2]
		mov	bx, [bp-2]
		mov	bx, [bx]
		call	dword ptr [bx+40h]
		add	sp, 4

loc_21DF4:				; CODE XREF: seg051:04E8j
		mov	ax, [di+24h]
		mov	[bp-0Ch], ax
		cmp	word ptr [bp-0Ch], 0
		jz	short loc_21E0E
		push	di
		push	word ptr [bp-0Ch]
		call	sub_42954
		add	sp, 4
		jmp	short loc_21E1F
; ���������������������������������������������������������������������������

loc_21E0E:				; CODE XREF: seg051:056Ej
		or	di, di
		jz	short loc_21E1F
		push	3
		push	di
		mov	bx, [di]
		call	dword ptr [bx+18h]
		add	sp, 4
		jmp	short $+2

loc_21E1F:				; CODE XREF: seg051:04B0j seg051:04C2j ...
		mov	ax, [bp-2]
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		pop	di
		pop	si
		leave
		retf
seg051		ends
