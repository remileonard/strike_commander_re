seg050		segment	byte public 'CODE' use16
		assume cs:seg050
		;org 3
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à Debris_BodyReset
; (sub_37C4C de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far,23L — remet à zéro les champs d'accumulation (forces, position, cible, sous-
; composants) : constructeur/reset d'un corps physique de débris.
; ==============================================================================================
Debris_BodyReset	proc far		; CODE XREF: sub_210C0+Cp seg052:00D1P ...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]

loc_2108A:				; DATA XREF: seg170:0256o
		mov	dword ptr [si+0Ah], 0
		mov	dword ptr [si+0Eh], 0
		xor	eax, eax
		mov	[si+1Ah], eax
		mov	[si+16h], eax
		mov	[si+12h], eax
		mov	word ptr [si+2Ah], 0
		mov	word ptr [si+24h], 0
		mov	word ptr [si+26h], 0
		mov	word ptr [si+1Eh], 0
		pop	si
		pop	bp
		retf
Debris_BodyReset	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_210C0	proc far		; CODE XREF: seg051:0054P
					; sub_21F29+65P

var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= dword	ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		mov	si, [bp+arg_0]
		push	si
		push	cs
		call	near ptr Debris_BodyReset
		add	sp, 2
		mov	eax, [bp+arg_2]
		mov	[bp+var_4], eax
		mov	eax, [bp+var_4]
		mov	[si+0Eh], eax
		les	bx, [si+0Eh]
		mov	ax, es:[bx+0Ah]
		mov	dx, es:[bx+8]
		add	dx, 10h
		mov	word ptr [bp+var_8+2], ax
		mov	word ptr [bp+var_8], dx
		les	bx, [bp+var_8]
		mov	eax, es:[bx]
		mov	[bp+var_C], eax
		mov	eax, [bp+var_C]
		mov	[si+20h], eax
		les	bx, [si+0Eh]
		les	bx, es:[bx+8]
		cmp	byte ptr es:[bx+16h], 0
		jz	short loc_2111D
		or	byte ptr [si+4], 2
		jmp	short loc_21121
; ���������������������������������������������������������������������������

loc_2111D:				; CODE XREF: sub_210C0+55j
		and	byte ptr [si+4], 0FDh

loc_21121:				; CODE XREF: sub_210C0+5Bj
		les	bx, [si+0Eh]
		mov	al, es:[bx+12h]
		mov	[si+28h], al
		les	bx, [si+0Eh]
		mov	al, es:[bx+14h]
		mov	[si+29h], al
		pop	si
		leave
		retf
sub_210C0	endp

; ���������������������������������������������������������������������������

loc_21138:				; DATA XREF: dseg:32B4o dseg:338Co
		push	bp
		mov	bp, sp
		mov	cx, [bp+6]
		mov	bx, cx
		mov	dx, [bx+10h]
		mov	ax, [bx+0Eh]
		pop	bp
		retf
; ���������������������������������������������������������������������������
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	dx, [bp+6]
		mov	si, [bp+8]
		mov	ax, dx
		add	ax, 12h
		mov	di, ax
		mov	eax, [di]
		mov	[si], eax
		mov	eax, [di+4]
		mov	[si+4],	eax
		mov	eax, [di+8]
		mov	[si+8],	eax
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_21176:				; DATA XREF: dseg:32BCo dseg:3394o
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		cmp	word ptr [si+26h], 0
		jz	short loc_2118A
		mov	bx, [si+26h]
		and	byte ptr [bx+30h], 0FEh

loc_2118A:				; CODE XREF: seg050:0101j
		cmp	word ptr [si+1Eh], 0
		jz	short loc_2119B
		push	word ptr [si+1Eh]
		call	sub_20E68
		add	sp, 2

loc_2119B:				; CODE XREF: seg050:010Ej
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		mov	eax, [di]
		add	[si+12h], eax
		mov	ax, [bp+0Ah]
		mov	[bp-2],	ax
		mov	bx, [bp-2]
		mov	eax, [bx]
		add	[si+16h], eax
		mov	ax, [bp+0Ch]
		mov	[bp-4],	ax
		mov	bx, [bp-4]
		mov	eax, [bx]
		add	[si+1Ah], eax
		cmp	word ptr [si+24h], 0
		jz	short loc_211E4
		push	word ptr [si+24h]
		nop
		push	cs
		call	near ptr sub_212BA
		add	sp, 2

loc_211E4:				; CODE XREF: seg050:0157j
		push	si
		mov	bx, [si]
		call	dword ptr [bx+8]
		add	sp, 2
		pop	di
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_211F1	proc far		; CODE XREF: seg052:01E3P seg052:020DP ...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	dword ptr [si+0Ah], 0
		jz	short loc_21211
		push	word ptr [si+0Ch]
		push	word ptr [si+0Ah]
		les	bx, [si+0Ah]
		mov	bx, es:[bx]
		call	dword ptr [bx+20h]
		add	sp, 4

loc_21211:				; CODE XREF: sub_211F1+Cj
		cmp	word ptr [si+26h], 0
		jz	short loc_2121E
		mov	bx, [si+26h]
		and	byte ptr [bx+30h], 0FDh

loc_2121E:				; CODE XREF: sub_211F1+24j
		cmp	word ptr [si+1Eh], 0
		jz	short loc_2122F
		push	word ptr [si+1Eh]
		call	sub_20DB2
		add	sp, 2

loc_2122F:				; CODE XREF: sub_211F1+31j
		pop	si
		pop	bp
		retf
sub_211F1	endp

; ���������������������������������������������������������������������������

loc_21232:				; DATA XREF: dseg:32C0o dseg:3398o
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		cmp	dword ptr [si+0Ah], 0
		jz	short loc_21252
		push	word ptr [si+0Ch]
		push	word ptr [si+0Ah]
		les	bx, [si+0Ah]
		mov	bx, es:[bx]
		call	dword ptr [bx+20h]
		add	sp, 4

loc_21252:				; CODE XREF: seg050:01BEj
		cmp	word ptr [si+26h], 0
		jz	short loc_21266
		mov	bx, [si+26h]
		and	byte ptr [bx+30h], 0FEh
		mov	bx, [si+26h]
		and	byte ptr [bx+30h], 0FDh

loc_21266:				; CODE XREF: seg050:01D6j
		cmp	word ptr [si+1Eh], 0
		jz	short loc_21277
		push	word ptr [si+1Eh]
		call	sub_20DB2
		add	sp, 2

loc_21277:				; CODE XREF: seg050:01EAj
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_2127A:				; DATA XREF: dseg:32E0o
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+28h]
		add	sp, 2
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_2128D:				; DATA XREF: dseg:32E4o
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+28h]
		add	sp, 2
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_212A0:				; DATA XREF: dseg:3320o
		push	bp
		mov	bp, sp
		mov	dx, [bp+6]
		mov	ax, [bp+8]
		pop	bp
		retf
; ���������������������������������������������������������������������������
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_212AD:				; DATA XREF: dseg:3324o
		push	bp
		mov	bp, sp
		mov	dx, [bp+6]
		mov	ax, [bp+8]
		pop	bp
		retf
; ���������������������������������������������������������������������������
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_212BA	proc far		; CODE XREF: seg050:015Ep
					; sub_212BA+55p ...

var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+1Eh], 0
		jz	short loc_21305
		les	bx, [si+0Eh]
		mov	ax, es:[bx+0Ah]
		mov	dx, es:[bx+8]
		add	dx, 10h
		mov	word ptr [bp+var_4+2], ax
		mov	word ptr [bp+var_4], dx
		les	bx, [bp+var_4]
		mov	eax, es:[bx]
		mov	[bp+var_8], eax
		lea	ax, [bp+var_8]
		push	ax
		push	word ptr [si+1Eh]
		push	ss
		lea	ax, [bp+var_C]
		push	ax
		call	sub_20DF1
		add	sp, 8
		mov	eax, [bp+var_C]
		mov	[si+20h], eax

loc_21305:				; CODE XREF: sub_212BA+Ej
		cmp	word ptr [si+24h], 0
		jz	short loc_21315
		push	word ptr [si+24h]
		push	cs
		call	near ptr sub_212BA
		add	sp, 2

loc_21315:				; CODE XREF: sub_212BA+4Fj
		pop	si
		leave
		retf
sub_212BA	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_21318	proc far		; CODE XREF: sub_20DF1+1DP

var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 10h
		push	si
		push	di
		mov	si, [bp+arg_4]
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	large dword ptr	[si+1Ah]
		push	large dword ptr	[si+16h]
		push	large dword ptr	[si+12h]
		call	Math_VectorLength3D_Raw_26DF9
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 0Ch
		mov	[bp+var_8], eax
		mov	eax, [bp+var_8]
		mov	[bp+var_C], eax
		mov	ax, si
		add	ax, 20h	; ' '
		mov	di, ax
		mov	eax, [bp+var_C]
		add	eax, [di]
		mov	[bp+var_10], eax
		mov	bx, word ptr [bp+var_4]
		mov	eax, [bp+var_10]
		mov	[bx], eax
		les	bx, [bp+var_4]
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
sub_21318	endp

; ���������������������������������������������������������������������������
		pop	di
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_21381	proc far		; CODE XREF: seg039:03E2P
					; sub_213AD+6Fp ...

arg_0		= word ptr  6

; FUNCTION CHUNK AT 032A SIZE 00000003 BYTES

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+26h], 0
		jz	short loc_213A2
		push	si
		nop
		push	cs
		call	near ptr sub_213AD
		add	sp, 2
		mov	ax, [si+26h]
		add	ax, 24h	; '$'
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		jmp	short loc_213AA
; ���������������������������������������������������������������������������

loc_213A2:				; CODE XREF: sub_21381+Bj
		mov	ax, si
		add	ax, 12h
		pop	si
		pop	bp
		retf
sub_21381	endp

; ���������������������������������������������������������������������������
; START	OF FUNCTION CHUNK FOR sub_21381

loc_213AA:				; CODE XREF: sub_21381+1Fj
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK	FOR sub_21381

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_213AD	proc far		; CODE XREF: sub_21381+10p

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	word ptr [si+26h], 0
		jnz	short loc_213C1
		jmp	loc_21455
; ���������������������������������������������������������������������������

loc_213C1:				; CODE XREF: sub_213AD+Fj
		mov	bx, [si+26h]
		mov	al, [bx+30h]
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jz	short loc_213D3
		jmp	loc_21455
; ���������������������������������������������������������������������������

loc_213D3:				; CODE XREF: sub_213AD+21j
		mov	ax, si
		add	ax, 12h
		mov	di, ax
		mov	eax, [di]
		mov	bx, [si+26h]
		mov	[bx+24h], eax
		mov	eax, [di+4]
		mov	bx, [si+26h]
		mov	[bx+28h], eax
		mov	eax, [di+8]
		mov	bx, [si+26h]
		mov	[bx+2Ch], eax
		push	word ptr [si+24h]
		mov	bx, [si+24h]
		mov	bx, [bx]
		call	dword ptr [bx+78h]
		add	sp, 2
		push	ax
		mov	ax, [si+26h]
		add	ax, 24h	; '$'
		push	ax
		call	Matrix_LocalToWorld_27393
		add	sp, 4
		push	word ptr [si+24h]
		push	cs
		call	near ptr sub_21381
		add	sp, 2
		mov	[bp+var_2], ax
		mov	bx, [bp+var_2]
		mov	eax, [bx]
		mov	bx, [si+26h]
		add	[bx+24h], eax
		mov	bx, [bp+var_2]
		mov	eax, [bx+4]
		mov	bx, [si+26h]
		add	[bx+28h], eax
		mov	bx, [bp+var_2]
		mov	eax, [bx+8]
		mov	bx, [si+26h]
		add	[bx+2Ch], eax
		mov	bx, [si+26h]
		or	byte ptr [bx+30h], 1

loc_21455:				; CODE XREF: sub_213AD+11j
					; sub_213AD+23j
		pop	di
		pop	si
		leave
		retf
sub_213AD	endp

; ���������������������������������������������������������������������������

loc_21459:				; DATA XREF: dseg:3328o
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_21461:				; DATA XREF: dseg:32B8o dseg:3390o
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		cmp	dword ptr [si+0Ah], 0
		jz	short loc_214CF
		push	di
		push	word ptr [si+0Ch]
		push	word ptr [si+0Ah]
		les	bx, [si+0Ah]
		mov	bx, es:[bx]
		call	dword ptr [bx]
		add	sp, 6
		cmp	word ptr [si+1Eh], 0
		jz	short loc_214CF
		push	word ptr [si+0Ch]
		push	word ptr [si+0Ah]
		les	bx, [si+0Ah]
		mov	bx, es:[bx]
		call	dword ptr [bx+8]
		add	sp, 4
		or	al, al
		jz	short loc_214CF
		les	bx, [si+0Ah]
		cmp	byte ptr es:[bx+8], 0
		jz	short loc_214CF
		push	word ptr [si+0Ch]
		push	word ptr [si+0Ah]
		les	bx, [si+0Ah]
		mov	bx, es:[bx]
		call	dword ptr [bx+0Ch]
		add	sp, 4
		mov	ah, 0
		or	ax, ax
		jnz	short loc_214CF
		push	di
		push	word ptr [si+1Eh]
		call	sub_20EA7
		add	sp, 4

loc_214CF:				; CODE XREF: seg050:03F1j seg050:0409j ...
		pop	di
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_214D3	proc far		; CODE XREF: seg052:02E4P
					; DATA XREF: dseg:32C4o

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	dword ptr [si+0Ah], 0
		jz	short loc_214FE
		push	word ptr [si+0Ch]
		push	word ptr [si+0Ah]
		les	bx, [si+0Ah]
		mov	bx, es:[bx]
		call	dword ptr [bx+18h]
		add	sp, 4
		mov	ah, 0
		or	ax, ax
		jnz	short loc_214FE
		mov	al, 0
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_214FE:				; CODE XREF: sub_214D3+Cj
					; sub_214D3+24j
		cmp	word ptr [si+1Eh], 0
		jz	short loc_2150F
		push	word ptr [si+1Eh]
		call	sub_20199
		add	sp, 2

loc_2150F:				; CODE XREF: sub_214D3+2Fj
		mov	al, 1
		pop	si
		pop	bp
		retf
sub_214D3	endp

; ���������������������������������������������������������������������������
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_21517:				; DATA XREF: dseg:32C8o
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_2151F:				; DATA XREF: dseg:3318o
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_21527:				; DATA XREF: dseg:331Co
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_2152F:				; DATA XREF: dseg:32ECo dseg:33C4o
		push	bp
		mov	bp, sp
		mov	dx, [bp+6]
		mov	ax, dx
		pop	bp
		retf
; ���������������������������������������������������������������������������
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+3Ch]
		add	sp, 2
		push	ax
		push	word ptr [bp+8]
		call	sub_2581F
		add	sp, 4
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_2155A:				; DATA XREF: dseg:32F0o
		push	bp
		mov	bp, sp
		mov	dx, [bp+6]
		mov	ax, 6504h
		pop	bp
		retf
; ���������������������������������������������������������������������������
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_21567:				; DATA XREF: dseg:332Co
		push	bp
		mov	bp, sp
		mov	dx, [bp+6]
		mov	ax, 6504h
		pop	bp
		retf
; ���������������������������������������������������������������������������
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_21574:				; DATA XREF: dseg:32F8o dseg:33D0o
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+0Ah]
		mov	di, [bp+6]
		or	di, di
		jz	short loc_21587
		mov	ax, di
		jmp	short loc_21593
; ���������������������������������������������������������������������������

loc_21587:				; CODE XREF: seg050:0501j
		push	0Ch
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	di, ax

loc_21593:				; CODE XREF: seg050:0505j
		or	ax, ax
		jz	short loc_215B2
		mov	eax, dword_466B4
		mov	[di], eax
		mov	eax, dword_466B8
		mov	[di+4],	eax
		mov	eax, dword_466BC
		mov	[di+8],	eax
		mov	ax, di
		jmp	short loc_215B4
; ���������������������������������������������������������������������������

loc_215B2:				; CODE XREF: seg050:0515j
		mov	ax, di

loc_215B4:				; CODE XREF: seg050:0530j
		mov	dx, [bp+8]
		mov	ax, [bp+6]
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_215C2:				; DATA XREF: dseg:3308o dseg:33E0o
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+0Ah]
		mov	di, [bp+6]
		or	di, di
		jz	short loc_215D5
		mov	ax, di
		jmp	short loc_215E1
; ���������������������������������������������������������������������������

loc_215D5:				; CODE XREF: seg050:054Fj
		push	0Ch
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	di, ax

loc_215E1:				; CODE XREF: seg050:0553j
		or	ax, ax
		jz	short loc_21600
		mov	eax, dword_466B4
		mov	[di], eax
		mov	eax, dword_466B8
		mov	[di+4],	eax
		mov	eax, dword_466BC
		mov	[di+8],	eax
		mov	ax, di
		jmp	short loc_21602
; ���������������������������������������������������������������������������

loc_21600:				; CODE XREF: seg050:0563j
		mov	ax, di

loc_21602:				; CODE XREF: seg050:057Ej
		mov	dx, [bp+8]
		mov	ax, [bp+6]
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_21610:				; DATA XREF: dseg:3300o dseg:33D8o
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+0Ah]
		mov	di, [bp+6]
		or	di, di
		jz	short loc_21623
		mov	ax, di
		jmp	short loc_2162F
; ���������������������������������������������������������������������������

loc_21623:				; CODE XREF: seg050:059Dj
		push	0Ch
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	di, ax

loc_2162F:				; CODE XREF: seg050:05A1j
		or	ax, ax
		jz	short loc_2164E
		mov	eax, dword_466B4
		mov	[di], eax
		mov	eax, dword_466B8
		mov	[di+4],	eax
		mov	eax, dword_466BC
		mov	[di+8],	eax
		mov	ax, di
		jmp	short loc_21650
; ���������������������������������������������������������������������������

loc_2164E:				; CODE XREF: seg050:05B1j
		mov	ax, di

loc_21650:				; CODE XREF: seg050:05CCj
		mov	dx, [bp+8]
		mov	ax, [bp+6]
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_2165E:				; DATA XREF: dseg:3310o dseg:33E8o
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+0Ah]
		mov	di, [bp+6]
		or	di, di
		jz	short loc_21671
		mov	ax, di
		jmp	short loc_2167D
; ���������������������������������������������������������������������������

loc_21671:				; CODE XREF: seg050:05EBj
		push	0Ch
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	di, ax

loc_2167D:				; CODE XREF: seg050:05EFj
		or	ax, ax
		jz	short loc_2169C
		mov	eax, dword_466B4
		mov	[di], eax
		mov	eax, dword_466B8
		mov	[di+4],	eax
		mov	eax, dword_466BC
		mov	[di+8],	eax
		mov	ax, di
		jmp	short loc_2169E
; ���������������������������������������������������������������������������

loc_2169C:				; CODE XREF: seg050:05FFj
		mov	ax, di

loc_2169E:				; CODE XREF: seg050:061Aj
		mov	dx, [bp+8]
		mov	ax, [bp+6]
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_216AC:				; DATA XREF: dseg:32F4o
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_216B4:				; DATA XREF: dseg:32FCo dseg:33D4o
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_216BC:				; DATA XREF: dseg:330Co dseg:33E4o
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_216C4:				; DATA XREF: dseg:3304o dseg:33DCo
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_216CC:				; DATA XREF: dseg:3314o dseg:33ECo
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_216D4:				; DATA XREF: dseg:32E8o
		push	bp
		mov	bp, sp
		mov	dx, [bp+6]
		mov	al, 0
		pop	bp
		retf
; ���������������������������������������������������������������������������
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_216E0:				; DATA XREF: dseg:3330o dseg:3408o
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		mov	al, [si+28h]
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		mov	dx, [bp+6]
		mov	bx, dx
		les	bx, [bx+0Eh]
		mov	al, es:[bx+13h]
		pop	bp
		retf
; ���������������������������������������������������������������������������
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		mov	al, [si+29h]
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_21713:				; DATA XREF: dseg:3338o dseg:3410o
		push	bp
		mov	bp, sp
		sub	sp, 4Eh
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		add	sp, 2
		or	ax, dx
		jz	short loc_21745
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		add	sp, 2
		mov	[bp-4],	dx
		mov	[bp-6],	ax
		les	bx, [bp-6]
		mov	ax, es:[bx+6]
		mov	[bp-2],	ax

loc_21745:				; CODE XREF: seg050:06ABj
		push	si
		push	ss
		lea	ax, [bp-42h]
		push	ax
		mov	bx, [si]
		call	dword ptr [bx+4Ch]
		add	sp, 6
		push	di
		push	ss
		lea	ax, [bp-4Eh]
		push	ax
		mov	bx, [di]
		call	dword ptr [bx+4Ch]
		add	sp, 6
		mov	eax, [bp-42h]
		add	eax, [bp-4Eh]
		mov	[bp-36h], eax
		mov	eax, [bp-3Eh]
		add	eax, [bp-4Ah]
		mov	[bp-32h], eax
		mov	eax, [bp-3Ah]
		add	eax, [bp-46h]
		mov	[bp-2Eh], eax
		push	large dword ptr	[bp-2Eh]
		push	large dword ptr	[bp-32h]
		push	large dword ptr	[bp-36h]
		call	Math_VectorLength3D_Raw_26DF9
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 0Ch
		mov	[bp-0Eh], eax
		mov	eax, [bp-0Eh]
		mov	[bp-0Ah], eax
		mov	eax, [bp-0Ah]
		mov	edx, [bp-0Ah]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-0Ah], eax
		mov	eax, [bp-0Ah]
		mov	edx, eax
		mov	dword ptr [bp-12h], 0C800h
		mov	ecx, [bp-12h]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp-0Ah], eax
		mov	eax, [bp-0Ah]
		mov	[bp-16h], eax
		mov	dword ptr [bp-1Ah], 0A00h
		mov	eax, [bp-1Ah]
		mov	[bp-1Eh], eax
		mov	eax, [bp-16h]
		cmp	eax, [bp-1Eh]
		jge	short loc_2180B
		mov	ax, 1
		jmp	short loc_2180D
; ���������������������������������������������������������������������������

loc_2180B:				; CODE XREF: seg050:0784j
		xor	ax, ax

loc_2180D:				; CODE XREF: seg050:0789j
		or	al, al
		jz	short loc_21816
		lea	ax, [bp-16h]
		jmp	short loc_21819
; ���������������������������������������������������������������������������

loc_21816:				; CODE XREF: seg050:078Fj
		lea	ax, [bp-1Eh]

loc_21819:				; CODE XREF: seg050:0794j
		mov	[bp-20h], ax
		mov	bx, [bp-20h]
		mov	eax, [bx]
		mov	[bp-24h], eax
		mov	eax, [bp-24h]
		mov	[bp-0Ah], eax
		mov	eax, [bp-0Ah]
		mov	ax, [bp-2]
		mov	[bp-26h], ax
		movsx	eax, word ptr [bp-26h]
		shl	eax, 8
		mov	[bp-2Ah], eax
		mov	edx, [bp-2Ah]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-0Ah], eax
		mov	ax, [bp-9]
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

loc_21860:				; DATA XREF: dseg:333Co dseg:3414o
		push	bp
		mov	bp, sp
		mov	dx, [bp+6]
		xor	ax, ax
		pop	bp
		retf
; ���������������������������������������������������������������������������
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_2186C:				; DATA XREF: dseg:5910o
		push	bp
		mov	bp, sp
		mov	word_49370, 2BDh
		xor	ax, ax
		mov	word_49374, ax
		mov	word_49372, ax
		mov	word_49370, 32A8h
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_21885:				; DATA XREF: dseg:59BEo
		push	bp
		mov	bp, sp
		push	2
		push	6350h
		call	sub_2197A
		add	sp, 4
		pop	bp
		retf
seg050		ends
