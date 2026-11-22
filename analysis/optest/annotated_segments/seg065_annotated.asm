seg065		segment	byte public 'CODE' use16
		assume cs:seg065
		;org 0Dh
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Registry_ResolveOrInsertNode_5AE5F (sub_5AE5F de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — ⚠️ far, 116 lignes, NON DÉTAILLÉE — résout/insère
; un nœud dans un registre global (dword_709BF, via sub_5BBCC ×7). Référencée par sub_5B421 et
; sub_5B987.
; ==============================================================================================
Registry_ResolveOrInsertNode_29F4D	proc far		; CODE XREF: Registry_MainOperationVariant_2A50F+F4p
					; PagedMemory_ReadByte_2AA75+32P
					; DATA XREF: ...

var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 10h
		cmp	dword_46AA1, 0
		jnz	short loc_29F84
		mov	eax, [bp+arg_0]
		mov	dword_46AA1, eax
		push	1
		push	eax
		call	PagedMemory_ResolveAddress_2ACBA
		add	sp, 6
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, [bp+arg_0]
		mov	es:[bx+0Ch], eax
		jmp	loc_2A082
; ���������������������������������������������������������������������������

loc_29F84:				; CODE XREF: Registry_ResolveOrInsertNode_29F4D+Cj
		mov	eax, dword_46AA1
		mov	[bp+var_8], eax
		push	1
		push	large [bp+arg_0]
		call	PagedMemory_ResolveAddress_2ACBA
		add	sp, 6
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, es:[bx]
		mov	[bp+var_10], eax
		push	1
		push	large [dword_46AA1]
		call	PagedMemory_ResolveAddress_2ACBA
		add	sp, 6
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, es:[bx]
		cmp	eax, [bp+var_10]
		jbe	short loc_29FD7
		mov	eax, [bp+arg_0]
		mov	dword_46AA1, eax
		jmp	short loc_2A00D
; ���������������������������������������������������������������������������

loc_29FD7:				; CODE XREF: Registry_ResolveOrInsertNode_29F4D+7Ej
					; Registry_ResolveOrInsertNode_29F4D+BEj
		les	bx, [bp+var_4]
		mov	eax, es:[bx+0Ch]
		mov	[bp+var_8], eax
		push	1
		push	eax
		call	PagedMemory_ResolveAddress_2ACBA
		add	sp, 6
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		mov	eax, [bp+var_8]
		cmp	eax, dword_46AA1
		jz	short loc_2A00D
		les	bx, [bp+var_4]
		mov	eax, es:[bx]
		cmp	eax, [bp+var_10]
		jb	short loc_29FD7

loc_2A00D:				; CODE XREF: Registry_ResolveOrInsertNode_29F4D+88j
					; Registry_ResolveOrInsertNode_29F4D+B1j
		les	bx, [bp+var_4]
		mov	eax, es:[bx+8]
		mov	[bp+var_8], eax
		push	1
		push	eax
		call	PagedMemory_ResolveAddress_2ACBA
		add	sp, 6
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, es:[bx+0Ch]
		mov	[bp+var_C], eax
		mov	eax, [bp+arg_0]
		mov	es:[bx+0Ch], eax
		push	1
		push	large [bp+var_C]
		call	PagedMemory_ResolveAddress_2ACBA
		add	sp, 6
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, [bp+arg_0]
		mov	es:[bx+8], eax
		push	1
		push	eax
		call	PagedMemory_ResolveAddress_2ACBA
		add	sp, 6
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, [bp+var_C]
		mov	es:[bx+0Ch], eax
		mov	eax, [bp+var_8]

loc_2A082:				; CODE XREF: Registry_ResolveOrInsertNode_29F4D+34j
		mov	es:[bx+8], eax
		leave
		retf
Registry_ResolveOrInsertNode_29F4D	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Registry_ResolveNodeVariant_5AF9B (sub_5AF9B de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, variante de Registry_ResolveOrInsertNode
; (sub_5BBCC ×3). Référencée par sub_5B036.
; ==============================================================================================
Registry_ResolveNodeVariant_2A089	proc far		; CODE XREF: Registry_BuildOrUpdateEntry_2A124+F5p
					; Registry_MainOperation_2A359+B0p ...

var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	1
		push	large [bp+arg_0]
		call	PagedMemory_ResolveAddress_2ACBA
		add	sp, 6
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, es:[bx+8]
		cmp	eax, [bp+arg_0]
		jnz	short loc_2A0BC
		mov	dword_46AA1, 0
		jmp	short locret_2A122
; ���������������������������������������������������������������������������

loc_2A0BC:				; CODE XREF: Registry_ResolveNodeVariant_2A089+26j
		les	bx, [bp+var_4]
		mov	eax, es:[bx+8]
		mov	[bp+var_8], eax
		mov	eax, es:[bx+0Ch]
		mov	[bp+var_C], eax
		mov	eax, [bp+arg_0]
		cmp	eax, dword_46AA1
		jnz	short loc_2A0E4
		mov	eax, [bp+var_C]
		mov	dword_46AA1, eax

loc_2A0E4:				; CODE XREF: Registry_ResolveNodeVariant_2A089+51j
		push	1
		push	large [bp+var_8]
		call	PagedMemory_ResolveAddress_2ACBA
		add	sp, 6
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, [bp+var_C]
		mov	es:[bx+0Ch], eax
		push	1
		push	eax
		call	PagedMemory_ResolveAddress_2ACBA
		add	sp, 6
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, [bp+var_8]
		mov	es:[bx+8], eax

locret_2A122:				; CODE XREF: Registry_ResolveNodeVariant_2A089+31j
		leave
		retf
Registry_ResolveNodeVariant_2A089	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Registry_BuildOrUpdateEntry_5B036 (sub_5B036 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — ⚠️ far, 219 lignes, NON DÉTAILLÉE — combine
; Registry_ResolveNodeVariant_5AF9B et de nombreux appels sub_5BBCC (×11). Référencée par
; sub_5B26B. Candidat pour session dédiée.
; ==============================================================================================
Registry_BuildOrUpdateEntry_2A124	proc far		; CODE XREF: Registry_MainOperation_2A359+139p
					; Registry_MainOperationVariant_2A50F+EAp

var_1E		= dword	ptr -1Eh
var_1A		= dword	ptr -1Ah
var_16		= dword	ptr -16h
var_12		= byte ptr -12h
var_11		= byte ptr -11h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 1Eh
		push	1
		push	large [bp+arg_0]
		call	PagedMemory_ResolveAddress_2ACBA
		add	sp, 6
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, es:[bx]
		mov	[bp+var_8], eax
		mov	eax, es:[bx+8]
		mov	[bp+var_C], eax
		mov	eax, es:[bx+0Ch]
		mov	[bp+var_10], eax
		mov	eax, [bp+var_C]
		cmp	eax, [bp+var_10]
		jnz	short loc_2A1A1
		mov	eax, [bp+arg_0]
		cmp	eax, [bp+var_10]
		jnz	short loc_2A172
		jmp	locret_2A357
; ���������������������������������������������������������������������������

loc_2A172:				; CODE XREF: Registry_BuildOrUpdateEntry_2A124+49j
		mov	dword_46AA1, eax
		push	1
		push	large [bp+var_10]
		call	PagedMemory_ResolveAddress_2ACBA
		add	sp, 6
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, es:[bx]
		cmp	eax, [bp+var_8]
		jb	short loc_2A19A
		jmp	locret_2A357
; ���������������������������������������������������������������������������

loc_2A19A:				; CODE XREF: Registry_BuildOrUpdateEntry_2A124+71j
		mov	eax, [bp+var_10]
		jmp	loc_2A353
; ���������������������������������������������������������������������������

loc_2A1A1:				; CODE XREF: Registry_BuildOrUpdateEntry_2A124+3Fj
		mov	al, 1
		mov	[bp+var_12], al
		mov	[bp+var_11], al
		push	1
		push	large [bp+var_10]
		call	PagedMemory_ResolveAddress_2ACBA
		add	sp, 6
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, es:[bx]
		cmp	eax, [bp+var_8]
		jnb	short loc_2A1D5
		mov	eax, [bp+var_10]
		cmp	eax, dword_46AA1
		jnz	short loc_2A20B

loc_2A1D5:				; CODE XREF: Registry_BuildOrUpdateEntry_2A124+A4j
		push	1
		push	large [bp+var_C]
		call	PagedMemory_ResolveAddress_2ACBA
		add	sp, 6
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, es:[bx]
		cmp	eax, [bp+var_8]
		jbe	short loc_2A201
		mov	eax, [bp+arg_0]
		cmp	eax, dword_46AA1
		jnz	short loc_2A207

loc_2A201:				; CODE XREF: Registry_BuildOrUpdateEntry_2A124+D0j
		mov	[bp+var_12], 0
		jmp	short loc_2A20B
; ���������������������������������������������������������������������������

loc_2A207:				; CODE XREF: Registry_BuildOrUpdateEntry_2A124+DBj
		mov	[bp+var_11], 0

loc_2A20B:				; CODE XREF: Registry_BuildOrUpdateEntry_2A124+AFj
					; Registry_BuildOrUpdateEntry_2A124+E1j
		cmp	[bp+var_12], 0
		jnz	short loc_2A214
		jmp	locret_2A357
; ���������������������������������������������������������������������������

loc_2A214:				; CODE XREF: Registry_BuildOrUpdateEntry_2A124+EBj
		push	large [bp+arg_0]
		push	cs
		call	near ptr Registry_ResolveNodeVariant_2A089
		add	sp, 4
		cmp	[bp+var_11], 0
		jz	short loc_2A27A
		push	1
		push	large [bp+var_10]
		call	PagedMemory_ResolveAddress_2ACBA
		add	sp, 6
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax

loc_2A239:				; CODE XREF: Registry_BuildOrUpdateEntry_2A124+152j
		les	bx, [bp+var_4]
		mov	eax, es:[bx+0Ch]
		mov	[bp+var_1A], eax
		push	1
		push	eax
		call	PagedMemory_ResolveAddress_2ACBA
		add	sp, 6
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, es:[bx+8]
		mov	[bp+var_16], eax
		mov	eax, [bp+var_1A]
		cmp	eax, dword_46AA1
		jz	short loc_2A2C9
		mov	eax, es:[bx]
		cmp	eax, [bp+var_8]
		jb	short loc_2A239
		jmp	short loc_2A2C9
; ���������������������������������������������������������������������������

loc_2A27A:				; CODE XREF: Registry_BuildOrUpdateEntry_2A124+FFj
		push	1
		push	large [bp+var_C]
		call	PagedMemory_ResolveAddress_2ACBA
		add	sp, 6
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax

loc_2A28E:				; CODE XREF: Registry_BuildOrUpdateEntry_2A124+1A3j
		les	bx, [bp+var_4]
		mov	eax, es:[bx+8]
		mov	[bp+var_16], eax
		push	1
		push	eax
		call	PagedMemory_ResolveAddress_2ACBA
		add	sp, 6
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, es:[bx+0Ch]
		mov	[bp+var_1A], eax
		cmp	eax, dword_46AA1
		jz	short loc_2A2C9
		mov	eax, es:[bx]
		cmp	eax, [bp+var_8]
		ja	short loc_2A28E

loc_2A2C9:				; CODE XREF: Registry_BuildOrUpdateEntry_2A124+148j
					; Registry_BuildOrUpdateEntry_2A124+154j ...
		push	1
		push	large [bp+var_16]
		call	PagedMemory_ResolveAddress_2ACBA
		add	sp, 6
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, [bp+arg_0]
		mov	es:[bx+0Ch], eax
		push	1
		push	large [bp+var_1A]
		call	PagedMemory_ResolveAddress_2ACBA
		add	sp, 6
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, [bp+arg_0]
		mov	es:[bx+8], eax
		mov	eax, es:[bx]
		mov	[bp+var_1E], eax
		push	1
		push	large [bp+arg_0]
		call	PagedMemory_ResolveAddress_2ACBA
		add	sp, 6
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, [bp+var_1A]
		mov	es:[bx+0Ch], eax
		mov	eax, [bp+var_16]
		mov	es:[bx+8], eax
		mov	eax, [bp+var_1A]
		cmp	eax, dword_46AA1
		jnz	short locret_2A357
		mov	eax, [bp+var_8]
		cmp	eax, [bp+var_1E]
		jnb	short locret_2A357
		mov	eax, [bp+arg_0]

loc_2A353:				; CODE XREF: Registry_BuildOrUpdateEntry_2A124+7Aj
		mov	dword_46AA1, eax

locret_2A357:				; CODE XREF: Registry_BuildOrUpdateEntry_2A124+4Bj
					; Registry_BuildOrUpdateEntry_2A124+73j ...
		leave
		retf
Registry_BuildOrUpdateEntry_2A124	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Registry_MainOperation_5B26B (sub_5B26B de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — ⚠️ far, 175 lignes, NON DÉTAILLÉE — orchestre
; Registry_ResolveNodeVariant_5AF9B et Registry_BuildOrUpdateEntry_5B036, avec gestion
; d'erreur (sub_6B70F ×3). Référencée depuis seg128.
; ==============================================================================================
Registry_MainOperation_2A359	proc far		; CODE XREF: seg067:001BP

var_1A		= dword	ptr -1Ah
var_16		= dword	ptr -16h
var_12		= dword	ptr -12h
var_D		= byte ptr -0Dh
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= dword	ptr  0Ah
arg_8		= byte ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 1Ah
		push	si
		mov	[bp+var_4], 0
		cmp	byte_46AA0, 0
		jz	short loc_2A372
		jmp	loc_2A4FB
; ���������������������������������������������������������������������������

loc_2A372:				; CODE XREF: Registry_MainOperation_2A359+14j
		cmp	[bp+arg_4], 0
		jnz	short loc_2A382
		push	1504h
		call	sub_30D3
		pop	cx

loc_2A382:				; CODE XREF: Registry_MainOperation_2A359+1Ej
		mov	byte_46AA5, 0
		add	[bp+arg_4], 1Fh
		and	[bp+arg_4], 0FFFFFFF0h
		mov	eax, dword_46AA1
		mov	[bp+var_C], eax
		mov	[bp+var_D], 0
		cmp	dword_46AA1, 0
		jz	short loc_2A3E9

loc_2A3A5:				; CODE XREF: Registry_MainOperation_2A359+8Ej
		push	1
		push	large [bp+var_C]
		call	PagedMemory_ResolveAddress_2ACBA
		add	sp, 6
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		les	bx, [bp+var_8]
		mov	eax, es:[bx]
		cmp	eax, [bp+arg_4]
		jnb	short loc_2A3D1
		mov	eax, es:[bx+0Ch]
		mov	[bp+var_C], eax
		jmp	short loc_2A3D5
; ���������������������������������������������������������������������������

loc_2A3D1:				; CODE XREF: Registry_MainOperation_2A359+6Bj
		mov	[bp+var_D], 1

loc_2A3D5:				; CODE XREF: Registry_MainOperation_2A359+76j
		mov	eax, [bp+var_C]
		cmp	eax, dword_46AA1
		jz	short loc_2A3E9
		mov	al, [bp+var_D]
		mov	ah, 0
		or	ax, ax
		jz	short loc_2A3A5

loc_2A3E9:				; CODE XREF: Registry_MainOperation_2A359+4Aj
					; Registry_MainOperation_2A359+85j
		cmp	[bp+var_D], 0
		jnz	short loc_2A3F2
		jmp	loc_2A4EC
; ���������������������������������������������������������������������������

loc_2A3F2:				; CODE XREF: Registry_MainOperation_2A359+94j
		les	bx, [bp+var_8]
		mov	eax, es:[bx]
		cmp	eax, [bp+arg_4]
		jnz	short loc_2A412
		or	dword ptr es:[bx], 1
		push	large [bp+var_C]
		push	cs
		call	near ptr Registry_ResolveNodeVariant_2A089
		add	sp, 4
		jmp	loc_2A4A0
; ���������������������������������������������������������������������������

loc_2A412:				; CODE XREF: Registry_MainOperation_2A359+A4j
		les	bx, [bp+var_8]
		mov	eax, es:[bx]
		sub	eax, [bp+arg_4]
		mov	[bp+var_1A], eax
		mov	eax, es:[bx]
		add	eax, [bp+var_C]
		mov	[bp+var_16], eax
		mov	eax, [bp+var_1A]
		add	eax, [bp+var_C]
		mov	[bp+var_12], eax
		mov	eax, [bp+var_1A]
		mov	es:[bx], eax
		push	1
		push	large [bp+var_12]
		call	PagedMemory_ResolveAddress_2ACBA
		add	sp, 6
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		mov	eax, [bp+arg_4]
		or	eax, 1
		les	bx, [bp+var_8]
		mov	es:[bx], eax
		mov	eax, [bp+var_C]
		mov	es:[bx+4], eax
		push	1
		push	large [bp+var_16]
		call	PagedMemory_ResolveAddress_2ACBA
		add	sp, 6
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		les	bx, [bp+var_8]
		mov	eax, [bp+var_12]
		mov	es:[bx+4], eax
		push	large [bp+var_C]
		push	cs
		call	near ptr Registry_BuildOrUpdateEntry_2A124
		add	sp, 4
		mov	eax, [bp+var_12]
		mov	[bp+var_C], eax

loc_2A4A0:				; CODE XREF: Registry_MainOperation_2A359+B6j
		mov	eax, [bp+var_C]
		add	eax, [bp+arg_4]
		dec	eax
		shr	eax, 0Eh
		inc	ax
		mov	edx, [bp+var_C]
		add	edx, 10h
		shr	edx, 0Eh
		sub	ax, dx
		mov	si, ax
		cmp	si, 4
		jbe	short loc_2A4CD
		push	1513h
		call	sub_30D3
		pop	cx

loc_2A4CD:				; CODE XREF: Registry_MainOperation_2A359+169j
		movzx	eax, si
		shl	eax, 18h
		mov	edx, 1
		or	edx, eax
		or	[bp+var_C], edx
		mov	eax, [bp+var_C]
		mov	[bp+var_4], eax
		jmp	short loc_2A4FB
; ���������������������������������������������������������������������������

loc_2A4EC:				; CODE XREF: Registry_MainOperation_2A359+96j
		cmp	[bp+arg_8], 0
		jz	short loc_2A4FB
		push	1503h
		call	sub_30D3
		pop	cx

loc_2A4FB:				; CODE XREF: Registry_MainOperation_2A359+16j
					; Registry_MainOperation_2A359+191j ...
		les	bx, [bp+arg_0]
		mov	eax, [bp+var_4]
		mov	es:[bx], eax
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	si
		leave
		retf
Registry_MainOperation_2A359	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Registry_MainOperationVariant_5B421 (sub_5B421 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — ⚠️ far, 109 lignes, NON DÉTAILLÉE — orchestre
; Registry_BuildOrUpdateEntry_5B036 et Registry_ResolveOrInsertNode_5AE5F, avec gestion
; d'erreur (sub_6B70F). Référencée depuis seg128.
; ==============================================================================================
Registry_MainOperationVariant_2A50F	proc far		; CODE XREF: seg067:0059P

var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 14h
		les	bx, [bp+arg_0]
		mov	eax, es:[bx]
		and	eax, 0FFFFFEh
		cmp	eax, 0
		jnz	short loc_2A52B
		jmp	locret_2A61C
; ���������������������������������������������������������������������������

loc_2A52B:				; CODE XREF: Registry_MainOperationVariant_2A50F+17j
		cmp	byte_46AA0, 0
		jz	short loc_2A535
		jmp	locret_2A61C
; ���������������������������������������������������������������������������

loc_2A535:				; CODE XREF: Registry_MainOperationVariant_2A50F+21j
		push	large [bp+arg_0]
		call	PagedMemory_ReleaseRange_2AE6E
		add	sp, 4
		mov	ah, 0
		or	ax, ax
		jnz	short loc_2A555
		mov	byte_46AA0, 1
		push	1509h
		call	sub_30D3
		pop	cx

loc_2A555:				; CODE XREF: Registry_MainOperationVariant_2A50F+36j
		mov	byte_46AA5, 0
		les	bx, [bp+arg_0]
		mov	eax, es:[bx]
		and	eax, 0FFFFFEh
		mov	[bp+var_8], eax
		push	eax
		nop
		push	cs
		call	near ptr Registry_ResolveNodeVariantB_2A61E
		add	sp, 4
		push	1
		push	large [bp+var_8]
		call	PagedMemory_ResolveAddress_2ACBA
		add	sp, 6
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		les	bx, [bp+var_4]
		and	dword ptr es:[bx], 0FFFFFFFEh
		mov	eax, es:[bx]
		mov	[bp+var_C], eax
		mov	eax, es:[bx+4]
		mov	[bp+var_10], eax
		cmp	[bp+var_10], 0
		jz	short loc_2A5FE
		push	1
		push	eax
		call	PagedMemory_ResolveAddress_2ACBA
		add	sp, 6
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		les	bx, [bp+var_4]
		test	dword ptr es:[bx], 1
		jnz	short loc_2A5FE
		mov	eax, [bp+var_C]
		add	es:[bx], eax
		push	1
		mov	eax, [bp+var_8]
		add	eax, [bp+var_C]
		push	eax
		call	PagedMemory_ResolveAddress_2ACBA
		add	sp, 6
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, [bp+var_10]
		mov	es:[bx+4], eax
		push	eax
		push	cs
		call	near ptr Registry_BuildOrUpdateEntry_2A124
		jmp	short loc_2A606
; ���������������������������������������������������������������������������

loc_2A5FE:				; CODE XREF: Registry_MainOperationVariant_2A50F+98j
					; Registry_MainOperationVariant_2A50F+B7j
		push	large [bp+var_8]
		push	cs
		call	near ptr Registry_ResolveOrInsertNode_29F4D

loc_2A606:				; CODE XREF: Registry_MainOperationVariant_2A50F+EDj
		add	sp, 4
		mov	[bp+var_14], 0
		les	bx, [bp+arg_0]
		mov	eax, [bp+var_14]
		mov	es:[bx], eax

locret_2A61C:				; CODE XREF: Registry_MainOperationVariant_2A50F+19j
					; Registry_MainOperationVariant_2A50F+23j
		leave
		retf
Registry_MainOperationVariant_2A50F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Registry_ResolveNodeVariantB_5B530 (sub_5B530 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, combine Registry_ResolveNodeVariant_5AF9B et
; sub_5BBCC ×4. Référencée par Registry_MainOperationVariant_5B421.
; ==============================================================================================
Registry_ResolveNodeVariantB_2A61E	proc far		; CODE XREF: Registry_MainOperationVariant_2A50F+60p

var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	1
		push	large [bp+arg_0]
		call	PagedMemory_ResolveAddress_2ACBA
		add	sp, 6
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, es:[bx]
		and	eax, 0FFFFFFFEh
		mov	edx, [bp+arg_0]
		add	edx, eax
		mov	[bp+var_8], edx
		push	1
		push	edx
		call	PagedMemory_ResolveAddress_2ACBA
		add	sp, 6
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, es:[bx]
		mov	[bp+var_C], eax
		test	[bp+var_C], 1
		jnz	short locret_2A6C5
		push	1
		mov	eax, [bp+var_8]
		add	eax, [bp+var_C]
		push	eax
		call	PagedMemory_ResolveAddress_2ACBA
		add	sp, 6
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, [bp+arg_0]
		mov	es:[bx+4], eax
		push	large [bp+var_8]
		push	cs
		call	near ptr Registry_ResolveNodeVariant_2A089
		add	sp, 4
		push	1
		push	large [bp+arg_0]
		call	PagedMemory_ResolveAddress_2ACBA
		add	sp, 6
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, [bp+var_C]
		add	es:[bx], eax

locret_2A6C5:				; CODE XREF: Registry_ResolveNodeVariantB_2A61E+55j
		leave
		retf
Registry_ResolveNodeVariantB_2A61E	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Registry_LookupForTextRenderer_5B5D9 (sub_5B5D9 de STRIKE.EXE). Résumé repris de STRIKE.EXE
; ; appelants et contexte à revérifier ici. — far, appelle sub_5BBCC — référencée directement
; par TextRenderer_Main (sub_27477, seg048).
; ==============================================================================================
Registry_LookupForTextRenderer_2A6C7	proc far		; CODE XREF: TextRenderer_ReleaseCachedGlyph_2BB8C+78P
					; sub_5D287+31FP ...

var_8		= dword	ptr -8
var_4		= dword	ptr -4

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	al, byte_46AA5
		mov	ah, 0
		or	ax, ax
		jz	short loc_2A6DA
		jmp	loc_2A76C
; ���������������������������������������������������������������������������

loc_2A6DA:				; CODE XREF: Registry_LookupForTextRenderer_2A6C7+Ej
		mov	al, byte_46AA0
		mov	ah, 0
		or	ax, ax
		jz	short loc_2A6E6
		jmp	loc_2A76C
; ���������������������������������������������������������������������������

loc_2A6E6:				; CODE XREF: Registry_LookupForTextRenderer_2A6C7+1Aj
		mov	eax, dword_46AA1
		mov	[bp+var_8], eax
		mov	si, 4E20h
		mov	byte_46AA5, 1
		xor	eax, eax
		mov	dword_46AAA, eax
		mov	dword_46AA6, eax
		cmp	dword_46AA1, 0
		jz	short loc_2A76C

loc_2A709:				; CODE XREF: Registry_LookupForTextRenderer_2A6C7+89j
		push	1
		push	large [bp+var_8]
		call	PagedMemory_ResolveAddress_2ACBA
		add	sp, 6
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, es:[bx]
		cmp	eax, dword_46AAA
		jbe	short loc_2A72F
		mov	dword_46AAA, eax

loc_2A72F:				; CODE XREF: Registry_LookupForTextRenderer_2A6C7+62j
		les	bx, [bp+var_4]
		mov	eax, es:[bx]
		add	dword_46AA6, eax
		mov	eax, es:[bx+0Ch]
		mov	[bp+var_8], eax
		cmp	eax, dword_46AA1
		jz	short loc_2A752
		mov	ax, si
		dec	si
		or	ax, ax
		jg	short loc_2A709

loc_2A752:				; CODE XREF: Registry_LookupForTextRenderer_2A6C7+82j
		sub	dword_46AAA, 10h
		or	si, si
		jg	short loc_2A76C
		mov	byte_46AA0, 1
		xor	eax, eax
		mov	dword_46AA6, eax
		mov	dword_46AAA, eax

loc_2A76C:				; CODE XREF: Registry_LookupForTextRenderer_2A6C7+10j
					; Registry_LookupForTextRenderer_2A6C7+1Cj ...
		mov	eax, dword_46AA6
		shld	edx, eax, 10h
		pop	si
		leave
		retf
Registry_LookupForTextRenderer_2A6C7	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Registry_LookupVariant_5B68A (sub_5B68A de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, appelle sub_5BBCC ×2. Référencée depuis
; seg128.
; ==============================================================================================
Registry_LookupVariant_2A778	proc far		; CODE XREF: seg067:009DP

var_4		= dword	ptr -4

		push	bp
		mov	bp, sp
		sub	sp, 4
		mov	al, byte_46AA5
		mov	ah, 0
		or	ax, ax
		jnz	short loc_2A7DF
		mov	al, byte_46AA0
		mov	ah, 0
		or	ax, ax
		jnz	short loc_2A7DF
		cmp	dword_46AA1, 0
		jz	short loc_2A7D6
		push	1
		push	large [dword_46AA1]
		call	PagedMemory_ResolveAddress_2ACBA
		add	sp, 6
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		push	1
		les	bx, [bp+var_4]
		push	large dword ptr	es:[bx+8]
		call	PagedMemory_ResolveAddress_2ACBA
		add	sp, 6
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, es:[bx]
		sub	eax, 10h
		mov	dword_46AAA, eax
		jmp	short loc_2A7DF
; ���������������������������������������������������������������������������

loc_2A7D6:				; CODE XREF: Registry_LookupVariant_2A778+1Ej
		mov	dword_46AAA, 0

loc_2A7DF:				; CODE XREF: Registry_LookupVariant_2A778+Dj
					; Registry_LookupVariant_2A778+16j ...
		mov	eax, dword_46AAA
		shld	edx, eax, 10h
		leave
		retf
Registry_LookupVariant_2A778	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 1Ch
		push	si
		mov	bl, [bp+6]
		mov	eax, dword_46AA1
		mov	[bp-14h], eax
		movzx	eax, bl
		shl	eax, 8
		movzx	edx, bl
		or	eax, edx
		shl	edx, 8
		movzx	ebx, bl
		or	edx, ebx
		shl	edx, 10h
		or	eax, edx
		mov	[bp-10h], eax
		cmp	dword_46AA1, 0
		jnz	short loc_2A82C
		jmp	loc_2A8DC
; ���������������������������������������������������������������������������

loc_2A82C:				; CODE XREF: seg065:08E7j
		mov	al, byte_46AA0
		mov	ah, 0
		or	ax, ax
		jz	short loc_2A838
		jmp	loc_2A8DC
; ���������������������������������������������������������������������������

loc_2A838:				; CODE XREF: seg065:08F3j seg065:0999j
		push	1
		push	large dword ptr	[bp-14h]
		call	PagedMemory_ResolveAddress_2ACBA
		add	sp, 6
		mov	[bp-2],	dx
		mov	[bp-4],	ax
		les	bx, [bp-4]
		mov	eax, es:[bx+0Ch]
		mov	[bp-8],	eax
		mov	eax, es:[bx]
		mov	[bp-0Ch], eax
		sub	eax, 10h
		mov	[bp-1Ch], eax
		jmp	short loc_2A8C3
; ���������������������������������������������������������������������������

loc_2A86A:				; CODE XREF: seg065:0988j
		cmp	dword ptr [bp-1Ch], 0FFF0h
		jnb	short loc_2A87E
		mov	eax, [bp-1Ch]
		shr	eax, 2
		jmp	short loc_2A881
; ���������������������������������������������������������������������������

loc_2A87E:				; CODE XREF: seg065:0932j
		mov	ax, 3FFCh

loc_2A881:				; CODE XREF: seg065:093Cj
		mov	si, ax
		push	4
		mov	eax, [bp-14h]
		add	eax, [bp-0Ch]
		sub	eax, [bp-1Ch]
		push	eax
		call	PagedMemory_ResolveAddress_2ACBA
		add	sp, 6
		mov	[bp-16h], dx
		mov	[bp-18h], ax
		movzx	eax, si
		shl	eax, 2
		sub	[bp-1Ch], eax
		jmp	short loc_2A8BF
; ���������������������������������������������������������������������������

loc_2A8AF:				; CODE XREF: seg065:0981j
		les	bx, [bp-18h]
		mov	eax, [bp-10h]
		mov	es:[bx], eax
		dec	si
		add	word ptr [bp-18h], 4

loc_2A8BF:				; CODE XREF: seg065:096Dj
		or	si, si
		ja	short loc_2A8AF

loc_2A8C3:				; CODE XREF: seg065:0928j
		cmp	dword ptr [bp-1Ch], 0
		ja	short loc_2A86A
		mov	eax, [bp-8]
		mov	[bp-14h], eax
		cmp	eax, dword_46AA1
		jz	short loc_2A8DC
		jmp	loc_2A838
; ���������������������������������������������������������������������������

loc_2A8DC:				; CODE XREF: seg065:08E9j seg065:08F5j ...
		pop	si
		leave
		retf
seg065		ends
