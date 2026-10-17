seg045		segment	byte public 'CODE' use16
		assume cs:seg045
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à Render_EdgeSetup
; (sub_2B5F9 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far,21L — stocke un pointeur sommet (+1) et copie un champ (+2→+5) depuis un second
; sommet : setup d'une arête/segment (2 sommets), analogue linéaire de sub_294C0 (triangles,
; seg055).
; ==============================================================================================
Render_EdgeSetup	proc far		; CODE XREF: sub_1E12F+16p
					; sub_1E25E+17p

arg_0		= dword	ptr  6
arg_4		= dword	ptr  0Ah
arg_8		= dword	ptr  0Eh

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		mov	eax, [bp+arg_4]
		mov	es:[bx+1], eax

loc_1DBEF:				; DATA XREF: seg170:022Eo
		les	bx, [bp+arg_8]
		mov	eax, es:[bx+2]
		les	bx, [bp+arg_0]
		mov	es:[bx+5], eax
		pop	bp
		retf
Render_EdgeSetup	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_1DC01	proc far		; CODE XREF: sub_1E2BD+19p
					; sub_C4DB0+1E4P ...

arg_0		= dword	ptr  6
arg_4		= dword	ptr  0Ah
arg_8		= dword	ptr  0Eh

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		mov	eax, [bp+arg_8]
		mov	es:[bx+0Ah], eax
		les	bx, [bp+arg_0]
		mov	eax, [bp+arg_4]
		mov	es:[bx+6], eax
		pop	bp
		retf
sub_1DC01	endp

; ���������������������������������������������������������������������������

loc_1DC1E:				; DATA XREF: dseg:31ACo dseg:31D0o ...
		push	bp
		mov	bp, sp
		les	bx, [bp+6]
		les	bx, es:[bx+0Ah]
		mov	al, es:[bx+11h]
		shr	ax, 3
		and	ax, 1
		or	al, al
		jz	short loc_1DC3A
		mov	al, 1
		jmp	short loc_1DC3C
; ���������������������������������������������������������������������������

loc_1DC3A:				; CODE XREF: seg045:0054j
		mov	al, 0

loc_1DC3C:				; CODE XREF: seg045:0058j
		pop	bp
		retf
; ���������������������������������������������������������������������������
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_1DC40:				; DATA XREF: dseg:31B0o dseg:31D4o ...
		push	bp
		mov	bp, sp
		sub	sp, 14h
		push	si
		push	di
		les	bx, [bp+6]
		mov	ax, es:[bx+0Ch]
		mov	dx, es:[bx+0Ah]
		add	dx, 5
		mov	[bp-2],	ax
		mov	[bp-4],	dx
		les	si, [bp-4]
		mov	eax, es:[si]
		mov	[bp-14h], eax
		mov	eax, es:[si+4]
		mov	[bp-10h], eax
		mov	eax, es:[si+8]
		mov	[bp-0Ch], eax
		lea	ax, [bp-14h]
		add	ax, 4
		mov	di, ax
		mov	eax, [di]
		mov	[bp-8],	eax
		mov	eax, [bp-8]
		les	bx, [bp+6]
		mov	es:[bx+2], eax
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_1DC98:				; DATA XREF: dseg:31B4o dseg:31D8o ...
		push	bp
		mov	bp, sp
		mov	al, 2
		pop	bp
		retf
; ���������������������������������������������������������������������������
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_1DCA1:				; DATA XREF: dseg:320Co dseg:3230o
		push	bp
		mov	bp, sp
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_1DCA6:				; DATA XREF: dseg:31C0o dseg:31E4o ...
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
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_1DCE8:				; DATA XREF: dseg:31BCo dseg:31E0o ...
		push	bp
		mov	bp, sp
		sub	sp, 0A8h
		push	si
		push	di
		les	bx, [bp+6]
		mov	eax, es:[bx+6]
		mov	[bp-4],	eax
		mov	ax, [bp+0Ah]
		mov	[bp-6],	ax
		les	bx, [bp-4]
		mov	eax, es:[bx+1]
		mov	[bp-0Ah], eax
		les	bx, [bp+6]
		les	bx, es:[bx+0Ah]
		mov	al, es:[bx+11h]
		shr	ax, 1
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jz	short loc_1DD28
		jmp	loc_1DF27
; ���������������������������������������������������������������������������

loc_1DD28:				; CODE XREF: seg045:0143j
		les	si, [bp-0Ah]
		mov	eax, es:[si]
		mov	[bp-84h], eax
		mov	eax, es:[si+4]
		mov	[bp-80h], eax
		mov	eax, es:[si+8]
		mov	[bp-7Ch], eax
		push	word ptr [bp-6]
		lea	ax, [bp-84h]
		push	ax
		call	Math_Helper_26F0E
		add	sp, 4
		les	bx, [bp+6]
		les	bx, es:[bx+0Ah]
		mov	eax, [bp-84h]
		mov	es:[bx+5], eax
		les	bx, [bp+6]
		les	bx, es:[bx+0Ah]
		mov	eax, [bp-80h]
		mov	es:[bx+9], eax
		les	bx, [bp+6]
		les	bx, es:[bx+0Ah]
		mov	eax, [bp-7Ch]
		mov	es:[bx+0Dh], eax
		les	bx, [bp+6]
		les	bx, es:[bx+0Ah]
		or	byte ptr es:[bx+11h], 2
		les	bx, [bp+6]
		les	bx, es:[bx+0Ah]
		mov	al, es:[bx+11h]
		shr	ax, 2
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jz	short loc_1DDAD
		jmp	loc_1DF25
; ���������������������������������������������������������������������������

loc_1DDAD:				; CODE XREF: seg045:01C8j
		cmp	byte_46014, 0
		jnz	short loc_1DDB7
		jmp	loc_1DE49
; ���������������������������������������������������������������������������

loc_1DDB7:				; CODE XREF: seg045:01D2j
		push	large dword ptr	[bp-80h]
		push	large [dword_49092]
		push	large dword ptr	[bp-84h]
		call	Math_FixedMulDiv_26BB4
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 0Ch
		mov	[bp-0Eh], eax
		mov	eax, [bp-0Eh]
		mov	[bp-12h], eax
		mov	ax, word_4908E
		add	ax, [bp-11h]
		les	bx, [bp+6]
		les	bx, es:[bx+0Ah]
		mov	es:[bx+1], ax
		push	large dword ptr	[bp-80h]
		push	large [dword_49096]
		push	large dword ptr	[bp-7Ch]
		call	Math_FixedMulDiv_26BB4
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 0Ch
		mov	[bp-16h], eax
		mov	eax, [bp-16h]
		mov	[bp-1Ah], eax
		mov	ax, word_49090
		sub	ax, [bp-19h]
		les	bx, [bp+6]
		les	bx, es:[bx+0Ah]
		mov	es:[bx+3], ax
		les	bx, [bp+6]
		les	bx, es:[bx+0Ah]
		or	byte ptr es:[bx+11h], 4
		les	bx, [bp+6]
		les	bx, es:[bx+0Ah]
		and	byte ptr es:[bx+11h], 0F7h
		jmp	loc_1DF23
; ���������������������������������������������������������������������������

loc_1DE49:				; CODE XREF: seg045:01D4j
		mov	eax, [bp-80h]
		cmp	eax, dword_46254
		jl	short loc_1DE59
		mov	ax, 1
		jmp	short loc_1DE5B
; ���������������������������������������������������������������������������

loc_1DE59:				; CODE XREF: seg045:0272j
		xor	ax, ax

loc_1DE5B:				; CODE XREF: seg045:0277j
		or	al, al
		jnz	short loc_1DE62
		jmp	loc_1DF17
; ���������������������������������������������������������������������������

loc_1DE62:				; CODE XREF: seg045:027Dj
		mov	eax, dword_49366
		mov	[bp-1Eh], eax
		mov	eax, [bp-1Eh]
		shl	eax, 8
		cmp	eax, [bp-80h]
		jl	short loc_1DE7D
		mov	ax, 1
		jmp	short loc_1DE7F
; ���������������������������������������������������������������������������

loc_1DE7D:				; CODE XREF: seg045:0296j
		xor	ax, ax

loc_1DE7F:				; CODE XREF: seg045:029Bj
		or	al, al
		jnz	short loc_1DE86
		jmp	loc_1DF17
; ���������������������������������������������������������������������������

loc_1DE86:				; CODE XREF: seg045:02A1j
		push	large dword ptr	[bp-80h]
		push	large [dword_49092]
		push	large dword ptr	[bp-84h]
		call	Math_FixedMulDiv_26BB4
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 0Ch
		mov	[bp-22h], eax
		mov	eax, [bp-22h]
		mov	[bp-26h], eax
		mov	ax, word_4908E
		add	ax, [bp-25h]
		les	bx, [bp+6]
		les	bx, es:[bx+0Ah]
		mov	es:[bx+1], ax
		push	large dword ptr	[bp-80h]
		push	large [dword_49096]
		push	large dword ptr	[bp-7Ch]
		call	Math_FixedMulDiv_26BB4
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 0Ch
		mov	[bp-2Ah], eax
		mov	eax, [bp-2Ah]
		mov	[bp-2Eh], eax
		mov	ax, word_49090
		sub	ax, [bp-2Dh]
		les	bx, [bp+6]
		les	bx, es:[bx+0Ah]
		mov	es:[bx+3], ax
		les	bx, [bp+6]
		les	bx, es:[bx+0Ah]
		or	byte ptr es:[bx+11h], 4
		les	bx, [bp+6]
		les	bx, es:[bx+0Ah]
		and	byte ptr es:[bx+11h], 0F7h
		jmp	short loc_1DF23
; ���������������������������������������������������������������������������

loc_1DF17:				; CODE XREF: seg045:027Fj seg045:02A3j
		les	bx, [bp+6]
		les	bx, es:[bx+0Ah]
		or	byte ptr es:[bx+11h], 8

loc_1DF23:				; CODE XREF: seg045:0266j seg045:0335j
		jmp	short $+2

loc_1DF25:				; CODE XREF: seg045:01CAj
		jmp	short $+2

loc_1DF27:				; CODE XREF: seg045:0145j
		les	bx, [bp+6]
		mov	ax, es:[bx+0Ch]
		mov	dx, es:[bx+0Ah]
		add	dx, 5
		mov	[bp-34h], ax
		mov	[bp-36h], dx
		les	di, [bp-36h]
		mov	eax, es:[di]
		mov	[bp-90h], eax
		mov	eax, es:[di+4]
		mov	[bp-8Ch], eax
		mov	eax, es:[di+8]
		mov	[bp-88h], eax
		lea	ax, [bp-90h]
		add	ax, 4
		mov	[bp-38h], ax
		mov	bx, [bp-38h]
		mov	eax, [bx]
		mov	[bp-32h], eax
		mov	ax, [bp-2]
		mov	dx, [bp-4]
		add	dx, 5
		mov	[bp-3Eh], ax
		mov	[bp-40h], dx
		les	bx, [bp-40h]
		mov	eax, es:[bx]
		mov	[bp-3Ch], eax
		cmp	dword ptr [bp-32h], 0
		jz	short loc_1DF95
		mov	ax, 1
		jmp	short loc_1DF97
; ���������������������������������������������������������������������������

loc_1DF95:				; CODE XREF: seg045:03AEj
		xor	ax, ax

loc_1DF97:				; CODE XREF: seg045:03B3j
		or	al, al
		jz	short loc_1DFE5
		mov	eax, dword_49092
		mov	edx, [bp-3Ch]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-44h], eax
		mov	eax, [bp-44h]
		mov	[bp-48h], eax
		mov	eax, [bp-48h]
		mov	edx, eax
		mov	ecx, [bp-32h]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp-4Ch], eax
		mov	eax, [bp-4Ch]
		mov	[bp-50h], eax
		mov	ax, [bp-4Fh]
		les	bx, [bp+6]
		mov	es:[bx+0Eh], ax
		jmp	short loc_1E02E
; ���������������������������������������������������������������������������

loc_1DFE5:				; CODE XREF: seg045:03B9j
		mov	eax, dword_49092
		mov	edx, [bp-3Ch]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-54h], eax
		mov	eax, [bp-54h]
		mov	[bp-58h], eax
		mov	eax, [bp-58h]
		mov	edx, eax
		mov	ecx, dword_46254
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp-5Ch], eax
		mov	eax, [bp-5Ch]
		mov	[bp-60h], eax
		mov	ax, [bp-5Fh]
		les	bx, [bp+6]
		mov	es:[bx+0Eh], ax

loc_1E02E:				; CODE XREF: seg045:0403j
		cmp	byte_46014, 0
		jz	short loc_1E09E
		les	bx, [bp+6]
		mov	ax, es:[bx+0Ch]
		mov	dx, es:[bx+0Ah]
		add	dx, 5
		mov	[bp-62h], ax
		mov	[bp-64h], dx
		les	ax, [bp-64h]
		mov	[bp-66h], ax
		mov	bx, [bp-66h]
		mov	eax, es:[bx]
		mov	[bp-9Ch], eax
		mov	bx, [bp-66h]
		mov	eax, es:[bx+4]
		mov	[bp-98h], eax
		mov	bx, [bp-66h]
		mov	eax, es:[bx+8]
		mov	[bp-94h], eax
		lea	ax, [bp-9Ch]
		add	ax, 4
		mov	[bp-68h], ax
		mov	bx, [bp-68h]
		mov	eax, [bx]
		mov	[bp-6Ch], eax
		mov	eax, [bp-6Ch]
		les	bx, [bp+6]
		mov	es:[bx+2], eax
		mov	al, 1
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		jmp	loc_1E12B
; ���������������������������������������������������������������������������

loc_1E09E:				; CODE XREF: seg045:0453j
		les	bx, [bp+6]
		les	bx, es:[bx+0Ah]
		mov	al, es:[bx+11h]
		shr	ax, 3
		and	ax, 1
		or	al, al
		jz	short loc_1E0B7
		mov	al, 1
		jmp	short loc_1E0B9
; ���������������������������������������������������������������������������

loc_1E0B7:				; CODE XREF: seg045:04D1j
		mov	al, 0

loc_1E0B9:				; CODE XREF: seg045:04D5j
		or	al, al
		jz	short loc_1E0C5
		mov	al, 0
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		jmp	short loc_1E12B
; ���������������������������������������������������������������������������

loc_1E0C5:				; CODE XREF: seg045:04DBj
		les	bx, [bp+6]
		mov	ax, es:[bx+0Ch]
		mov	dx, es:[bx+0Ah]
		add	dx, 5
		mov	[bp-6Eh], ax
		mov	[bp-70h], dx
		les	ax, [bp-70h]
		mov	[bp-72h], ax
		mov	bx, [bp-72h]
		mov	eax, es:[bx]
		mov	[bp-0A8h], eax
		mov	bx, [bp-72h]
		mov	eax, es:[bx+4]
		mov	[bp-0A4h], eax
		mov	bx, [bp-72h]
		mov	eax, es:[bx+8]
		mov	[bp-0A0h], eax
		lea	ax, [bp-0A8h]
		add	ax, 4
		mov	[bp-74h], ax
		mov	bx, [bp-74h]
		mov	eax, [bx]
		mov	[bp-78h], eax
		mov	eax, [bp-78h]
		les	bx, [bp+6]
		mov	es:[bx+2], eax
		mov	al, 1
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_1E12B:				; CODE XREF: seg045:04BBj seg045:04E3j
		pop	di
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_1E12F	proc far		; CODE XREF: sub_C4DB0+1B0P
					; sub_C4DB0+20DP

arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= dword	ptr  0Eh

		push	bp
		mov	bp, sp
		push	word ptr [bp+arg_8+2]
		push	word ptr [bp+arg_8]
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		push	cs
		call	near ptr Render_EdgeSetup
		add	sp, 0Ch
		les	bx, [bp+arg_8]
		mov	al, es:[bx+6]
		les	bx, [bp+arg_0]
		mov	es:[bx+9], al
		pop	bp
		retf
sub_1E12F	endp

; ���������������������������������������������������������������������������

loc_1E15B:				; DATA XREF: dseg:31C4o dseg:31E8o
		push	bp
		mov	bp, sp
		sub	sp, 4
		les	bx, [bp+6]
		mov	eax, es:[bx+6]
		mov	[bp-4],	eax
		les	bx, [bp-4]
		mov	al, es:[bx+9]
		push	ax
		push	word ptr [bp+8]
		push	word ptr [bp+6]
		call	sub_1B4C0
		add	sp, 6
		les	bx, [bp+6]
		mov	es:[bx+10h], al
		leave
		retf
; ���������������������������������������������������������������������������

loc_1E18C:				; DATA XREF: dseg:31C8o
		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		les	bx, [bp+6]
		mov	al, es:[bx+10h]
		push	ax
		les	bx, [bp+6]
		mov	ax, es:[bx+0Eh]
		mov	[bp-2],	ax
		movsx	eax, word ptr [bp-2]
		mov	edx, dword_46258
		imul	edx, eax
		mov	[bp-6],	edx
		mov	eax, [bp-6]
		mov	[bp-0Ah], eax
		push	word ptr [bp-9]
		les	bx, [bp+6]
		push	word ptr es:[bx+0Eh]
		les	bx, [bp+6]
		les	bx, es:[bx+0Ah]
		push	word ptr es:[bx+3]
		les	bx, [bp+6]
		les	bx, es:[bx+0Ah]
		push	word ptr es:[bx+1]
		push	word_46F44
		call	Render_DrawEllipseOutline_32398
		add	sp, 0Ch
		leave
		retf
; ���������������������������������������������������������������������������

loc_1E1EC:				; DATA XREF: dseg:31DCo
		push	bp
		mov	bp, sp
		mov	al, 0
		pop	bp
		retf
; ���������������������������������������������������������������������������
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_1E1F5:				; DATA XREF: dseg:31A4o
		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		les	bx, [bp+6]
		mov	al, es:[bx+10h]
		push	ax
		les	bx, [bp+6]
		mov	ax, es:[bx+0Eh]
		mov	[bp-2],	ax
		movsx	eax, word ptr [bp-2]
		mov	edx, dword_46258
		imul	edx, eax
		mov	[bp-6],	edx
		mov	eax, [bp-6]
		mov	[bp-0Ah], eax
		push	word ptr [bp-9]
		les	bx, [bp+6]
		push	word ptr es:[bx+0Eh]
		les	bx, [bp+6]
		les	bx, es:[bx+0Ah]
		push	word ptr es:[bx+3]
		les	bx, [bp+6]
		les	bx, es:[bx+0Ah]
		push	word ptr es:[bx+1]
		push	word_46F44
		call	Render_DrawFilledEllipse_32056
		add	sp, 0Ch
		leave
		retf
; ���������������������������������������������������������������������������

loc_1E255:				; DATA XREF: dseg:31B8o
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

sub_1E25E	proc far		; CODE XREF: sub_C4DB0+269P

arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= dword	ptr  0Eh

		push	bp
		mov	bp, sp
		push	si
		push	word ptr [bp+arg_8+2]
		push	word ptr [bp+arg_8]
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		push	cs
		call	near ptr Render_EdgeSetup
		add	sp, 0Ch
		les	bx, [bp+arg_8]
		mov	al, es:[bx+6]
		cbw
		mov	si, ax
		or	si, si
		jge	short loc_1E28F
		xor	dx, dx
		xor	ax, ax
		jmp	short loc_1E2AF
; ���������������������������������������������������������������������������

loc_1E28F:				; CODE XREF: sub_1E25E+29j
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

loc_1E2AF:				; CODE XREF: sub_1E25E+2Fj
		les	bx, [bp+arg_0]
		mov	es:[bx+0Bh], dx
		mov	es:[bx+9], ax
		pop	si
		pop	bp
		retf
sub_1E25E	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_1E2BD	proc far		; CODE XREF: sub_C4DB0+29DP

var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= dword	ptr  0Ah
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	[bp+arg_A]
		push	[bp+arg_8]
		push	word ptr [bp+arg_4+2]
		push	word ptr [bp+arg_4]
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		push	cs
		call	near ptr sub_1DC01
		add	sp, 0Ch
		mov	eax, [bp+arg_4]
		mov	[bp+var_4], eax
		les	bx, [bp+var_4]
		mov	eax, es:[bx+9]
		les	bx, [bp+arg_0]
		mov	es:[bx+10h], eax
		leave
		retf
sub_1E2BD	endp

; ���������������������������������������������������������������������������

loc_1E2F6:				; DATA XREF: dseg:3210o
		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		les	bx, [bp+6]
		push	word ptr es:[bx+12h]
		push	word ptr es:[bx+10h]
		les	bx, [bp+6]
		mov	ax, es:[bx+0Eh]
		mov	[bp-2],	ax
		movsx	eax, word ptr [bp-2]
		mov	edx, dword_46258
		imul	edx, eax
		mov	[bp-6],	edx
		mov	eax, [bp-6]
		mov	[bp-0Ah], eax
		push	word ptr [bp-9]
		les	bx, [bp+6]
		push	word ptr es:[bx+0Eh]
		les	bx, [bp+6]
		les	bx, es:[bx+0Ah]
		push	word ptr es:[bx+3]
		les	bx, [bp+6]
		les	bx, es:[bx+0Ah]
		push	word ptr es:[bx+1]
		push	word_46F44
		call	sub_16C7A
		add	sp, 0Eh
		leave
		retf
; ���������������������������������������������������������������������������

loc_1E359:				; DATA XREF: dseg:3224o
		push	bp
		mov	bp, sp
		mov	al, 2
		pop	bp
		retf
; ���������������������������������������������������������������������������
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_1E362:				; DATA XREF: dseg:58FEo
		push	bp
		mov	bp, sp
		mov	word_49290, 2E1Ch
		mov	word_49290, 2E20h
		mov	word_49290, 31ECh
		mov	word_49290, 3210h
		mov	word_492A4, 2E1Ch
		mov	word_492A4, 2E20h
		mov	word_492A4, 31ECh
		mov	word_492A4, 31C8h
		mov	word_492B5, 2E1Ch
		mov	word_492B5, 2E20h
		mov	word_492B5, 31ECh
		mov	word_492B5, 31C8h
		mov	word_492B5, 31A4h
		pop	bp
		retf
seg045		ends
