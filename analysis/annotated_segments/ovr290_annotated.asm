ovr290		segment	para public 'OVERLAY' use16
		assume cs:ovr290
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⭐⚠️ far, 438 lignes, NON DÉTAILLÉE — combine Terrain_TestAdjacentVisibility et
; Terrain_QueryAltitudeAt (répété) — calcul de visibilité et d'altitude du terrain, lié au
; pipeline Render_TerrainPipelineMain (seg074). Candidat pour session dédiée.
; ==============================================================================================
Terrain_ComputeVisibilityAndAltitude_98CF0	proc far		; CODE XREF: VROOMM_StubThunk_6BD00J

var_64		= dword	ptr -64h
var_60		= dword	ptr -60h
var_5C		= dword	ptr -5Ch
var_58		= word ptr -58h
var_4C		= word ptr -4Ch
var_4A		= dword	ptr -4Ah
var_46		= word ptr -46h
var_44		= word ptr -44h
var_42		= dword	ptr -42h
var_3E		= dword	ptr -3Eh
var_3A		= dword	ptr -3Ah
var_36		= dword	ptr -36h
var_32		= dword	ptr -32h
var_2E		= dword	ptr -2Eh
var_2A		= dword	ptr -2Ah
var_26		= dword	ptr -26h
var_22		= dword	ptr -22h
var_1E		= dword	ptr -1Eh
var_1A		= dword	ptr -1Ah
var_16		= dword	ptr -16h
var_12		= dword	ptr -12h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= dword	ptr -0Ah
var_6		= dword	ptr -6
var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= dword	ptr  0Ah
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 64h
		push	si
		push	di
		mov	bx, [bp+arg_0]
		mov	si, [bp+arg_2]
		push	si
		push	word_70474
		call	Terrain_TestAdjacentVisibility
		add	sp, 4
		mov	[bp+var_1], al
		cmp	[bp+var_1], 0
		jnz	short loc_98D17
		jmp	loc_990E1	; default
; ���������������������������������������������������������������������������

loc_98D17:				; CODE XREF: Terrain_ComputeVisibilityAndAltitude_98CF0+22j
		mov	al, byte_7234B
		mov	ah, 0
		or	ax, ax
		jnz	short loc_98D23
		jmp	loc_990E1	; default
; ���������������������������������������������������������������������������

loc_98D23:				; CODE XREF: Terrain_ComputeVisibilityAndAltitude_98CF0+2Ej
		mov	ax, [bp+arg_8]
		mov	[bp+var_4C], ax
		mov	cx, 0Bh		; switch 11 cases
		mov	bx, offset word_990F1

loc_98D2F:				; CODE XREF: Terrain_ComputeVisibilityAndAltitude_98CF0+4Aj
		mov	ax, cs:[bx]

loc_98D32:
		cmp	ax, [bp+var_4C]

loc_98D35:
		jz	short loc_98D3F
		add	bx, 2
		loop	loc_98D2F

loc_98D3C:				; default
		jmp	loc_990E1
; ���������������������������������������������������������������������������

loc_98D3F:				; CODE XREF: Terrain_ComputeVisibilityAndAltitude_98CF0:loc_98D35j
		jmp	word ptr cs:[bx+16h] ; switch jump

loc_98D43:				; DATA XREF: ovr290:0417o
		xor	di, di		; case 0x1
		jmp	short loc_98D4F
; ���������������������������������������������������������������������������

loc_98D47:				; CODE XREF: Terrain_ComputeVisibilityAndAltitude_98CF0:loc_98D3Fj
					; DATA XREF: ovr290:0417o
		mov	di, 3		; case 0x10
		jmp	short loc_98D4F
; ���������������������������������������������������������������������������

loc_98D4C:				; CODE XREF: Terrain_ComputeVisibilityAndAltitude_98CF0:loc_98D3Fj
					; DATA XREF: ovr290:0417o
		mov	di, 6		; case 0x40

loc_98D4F:				; CODE XREF: Terrain_ComputeVisibilityAndAltitude_98CF0+55j
					; Terrain_ComputeVisibilityAndAltitude_98CF0+5Aj
		mov	[bp+var_6], 1DCh

loc_98D57:
		mov	eax, [bp+var_6]
		mov	edx, [bp+arg_4]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_6], eax
		mov	[bp+var_5C], 0
		push	0
		mov	al, byte_725A6
		push	ax
		push	large [dword_725A2]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		mov	word ptr dword_6EA68+2,	dx
		mov	word ptr dword_6EA68, ax
		mov	ax, word ptr dword_6EA68+2
		mov	dx, word_725A0
		mov	[bp+var_C], ax
		mov	[bp+var_E], dx
		mov	al, byte_6EA15
		mov	ah, 0
		imul	ax, 5Ah
		mov	dx, [bp+var_C]
		mov	bx, [bp+var_E]
		add	bx, ax
		mov	word ptr [bp+var_12+2],	dx
		mov	word ptr [bp+var_12], bx
		mov	eax, [si]
		add	eax, [bp+arg_4]
		mov	[bp+var_64], eax
		mov	eax, [si+4]
		add	eax, [bp+var_6]
		mov	[bp+var_60], eax
		mov	eax, [bp+var_64]
		mov	[bp+var_16], eax
		mov	eax, [bp+var_16]
		mov	es, word ptr [bp+var_12+2]
		mov	es:[bx+11h], eax
		mov	eax, [bp+var_60]
		mov	[bp+var_1A], eax
		mov	eax, [bp+var_1A]
		mov	es:[bx+15h], eax
		push	1
		lea	ax, [bp+var_58]
		push	ax
		lea	ax, [bp+var_64]
		push	ax
		push	word_70474
		push	ss
		lea	ax, [bp+var_1E]
		push	ax
		call	Terrain_QueryAltitudeAt
		add	sp, 0Ch
		mov	eax, [bp+var_1E]
		mov	[bp+var_A], eax
		push	0
		mov	al, byte_725A6
		push	ax
		push	large [dword_725A2]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		mov	word ptr dword_6EA68+2,	dx
		mov	word ptr dword_6EA68, ax
		mov	eax, [bp+var_A]
		mov	[bp+var_22], eax

loc_98E37:
		mov	eax, [bp+var_22]
		les	bx, [bp+var_12]

loc_98E3E:
		mov	es:[bx+19h], eax
		mov	eax, es:[bx+11h]
		mov	es:[bx], eax
		mov	eax, es:[bx+15h]

loc_98E51:
		mov	es:[bx+4], eax
		mov	eax, es:[bx+19h]
		mov	es:[bx+8], eax
		mov	byte ptr es:[bx+1Dh], 0FFh
		add	word ptr [bp+var_12], 1Eh
		mov	eax, [si]
		add	eax, [bp+arg_4]
		mov	[bp+var_64], eax
		mov	eax, [si+4]
		sub	eax, [bp+arg_4]
		mov	[bp+var_60], eax

loc_98E80:
		mov	eax, [bp+var_64]

loc_98E84:
		mov	[bp+var_26], eax
		mov	eax, [bp+var_26]

loc_98E8C:
		les	bx, [bp+var_12]

loc_98E8F:
		mov	es:[bx+11h], eax

loc_98E94:
		mov	eax, [bp+var_60]
		mov	[bp+var_2A], eax
		mov	eax, [bp+var_2A]
		mov	es:[bx+15h], eax
		push	1
		lea	ax, [bp+var_58]
		push	ax
		lea	ax, [bp+var_64]
		push	ax
		push	word_70474
		push	ss
		lea	ax, [bp+var_2E]
		push	ax
		call	Terrain_QueryAltitudeAt
		add	sp, 0Ch
		mov	eax, [bp+var_2E]
		mov	[bp+var_A], eax
		push	0
		mov	al, byte_725A6
		push	ax
		push	large [dword_725A2]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		mov	word ptr dword_6EA68+2,	dx
		mov	word ptr dword_6EA68, ax
		mov	eax, [bp+var_A]
		mov	[bp+var_32], eax
		mov	eax, [bp+var_32]
		les	bx, [bp+var_12]
		mov	es:[bx+19h], eax
		mov	eax, es:[bx+11h]
		mov	es:[bx], eax
		mov	eax, es:[bx+15h]
		mov	es:[bx+4], eax
		mov	eax, es:[bx+19h]
		mov	es:[bx+8], eax
		mov	byte ptr es:[bx+1Dh], 0FFh
		add	word ptr [bp+var_12], 1Eh
		mov	eax, [si]
		sub	eax, [bp+var_6]
		mov	[bp+var_64], eax
		mov	eax, [si+4]
		sub	eax, [bp+arg_4]

loc_98F32:
		mov	[bp+var_60], eax
		mov	eax, [bp+var_64]

loc_98F3A:
		mov	[bp+var_36], eax
		mov	eax, [bp+var_36]
		les	bx, [bp+var_12]
		mov	es:[bx+11h], eax
		mov	eax, [bp+var_60]
		mov	[bp+var_3A], eax

loc_98F52:
		mov	eax, [bp+var_3A]
		mov	es:[bx+15h], eax
		push	1
		lea	ax, [bp+var_58]
		push	ax
		lea	ax, [bp+var_64]

loc_98F64:
		push	ax
		push	word_70474
		push	ss
		lea	ax, [bp+var_3E]
		push	ax
		call	Terrain_QueryAltitudeAt
		add	sp, 0Ch
		mov	eax, [bp+var_3E]
		mov	[bp+var_A], eax
		push	0
		mov	al, byte_725A6
		push	ax

loc_98F84:
		push	large [dword_725A2]
		push	5C44h

loc_98F8C:
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		mov	word ptr dword_6EA68+2,	dx
		mov	word ptr dword_6EA68, ax
		mov	eax, [bp+var_A]
		mov	[bp+var_42], eax
		mov	eax, [bp+var_42]
		les	bx, [bp+var_12]
		mov	es:[bx+19h], eax
		mov	eax, es:[bx+11h]
		mov	es:[bx], eax
		mov	eax, es:[bx+15h]
		mov	es:[bx+4], eax
		mov	eax, es:[bx+19h]
		mov	es:[bx+8], eax
		mov	byte ptr es:[bx+1Dh], 0FFh
		mov	al, byte_6EA15
		mov	ah, 0
		mov	bx, ax
		mov	byte ptr [bx+54FCh], 5
		mov	ax, word ptr dword_6EA68+2
		mov	dx, word_7259E
		mov	[bp+var_44], ax
		mov	[bp+var_46], dx
		mov	al, byte_6EA15
		mov	ah, 0
		imul	ax, 1Eh
		mov	dx, [bp+var_44]
		mov	bx, [bp+var_46]
		add	bx, ax
		mov	word ptr [bp+var_4A+2],	dx
		mov	word ptr [bp+var_4A], bx
		push	0
		mov	al, byte_725A6
		push	ax
		push	large [dword_725A2]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		mov	word ptr dword_6EA68+2,	dx
		mov	word ptr dword_6EA68, ax
		cmp	[bp+var_1], 3
		ja	short loc_99041
		les	bx, [bp+var_4A]
		mov	byte ptr es:[bx+16h], 2
		mov	byte ptr es:[bx+17h], 1
		mov	byte ptr es:[bx+18h], 3Fh ; '?'
		mov	byte ptr es:[bx+19h], 1

loc_9903A:
		mov	byte ptr es:[bx+1Ah], 3Fh ; '?'
		jmp	short loc_9905D
; ���������������������������������������������������������������������������

loc_99041:				; CODE XREF: Terrain_ComputeVisibilityAndAltitude_98CF0+331j
		les	bx, [bp+var_4A]
		mov	byte ptr es:[bx+16h], 0
		mov	byte ptr es:[bx+17h], 1
		mov	byte ptr es:[bx+18h], 0

loc_99053:
		mov	byte ptr es:[bx+19h], 3Eh ; '>'

loc_99058:
		mov	byte ptr es:[bx+1Ah], 3Dh ; '='

loc_9905D:				; CODE XREF: Terrain_ComputeVisibilityAndAltitude_98CF0+34Fj
		les	bx, [bp+var_4A]
		mov	byte ptr es:[bx+1Bh], 3Eh ; '>'
		mov	al, [bp+var_1]
		mov	ah, 0
		dec	ax
		mov	bx, ax
		cmp	bx, 5		; switch 6 cases
		ja	short loc_99086	; default
		shl	bx, 1
		jmp	cs:off_990E5[bx] ; switch jump

loc_99079:				; DATA XREF: ovr290:off_990E5o
		add	di, 14h		; case 0x0
		jmp	short loc_99086	; default
; ���������������������������������������������������������������������������

loc_9907E:				; CODE XREF: Terrain_ComputeVisibilityAndAltitude_98CF0+384j
					; DATA XREF: ovr290:off_990E5o
		add	di, 15h		; case 0x1
		jmp	short loc_99086	; default
; ���������������������������������������������������������������������������

loc_99083:				; CODE XREF: Terrain_ComputeVisibilityAndAltitude_98CF0+384j
					; DATA XREF: ovr290:off_990E5o
		add	di, 13h		; case 0x2

loc_99086:				; CODE XREF: Terrain_ComputeVisibilityAndAltitude_98CF0+380j
					; Terrain_ComputeVisibilityAndAltitude_98CF0+38Cj ...
		mov	bx, di		; default
		cmp	bx, word_7254A

loc_9908C:
		jnb	short loc_9909C
		mov	ax, bx
		imul	ax, 6
		push	ax
		mov	ax, word_7254E
		pop	dx
		add	ax, dx
		jmp	short loc_990B6
; ���������������������������������������������������������������������������

loc_9909C:				; CODE XREF: Terrain_ComputeVisibilityAndAltitude_98CF0:loc_9908Cj
		sub	bx, word_7254A
		cmp	bx, word_7254C
		jnb	short loc_990B4
		mov	ax, bx
		imul	ax, 0Ch
		push	ax
		mov	ax, word_72550
		pop	dx
		add	ax, dx
		jmp	short loc_990B6
; ���������������������������������������������������������������������������

loc_990B4:				; CODE XREF: Terrain_ComputeVisibilityAndAltitude_98CF0+3B4j
		xor	ax, ax

loc_990B6:				; CODE XREF: Terrain_ComputeVisibilityAndAltitude_98CF0+3AAj
					; Terrain_ComputeVisibilityAndAltitude_98CF0+3C2j
		les	bx, [bp+var_4A]
		mov	es:[bx+14h], ax
		mov	byte ptr es:[bx+1Ch], 0
		mov	byte ptr es:[bx+1Dh], 2
		mov	al, byte_6EA15
		inc	al
		mov	byte_6EA15, al
		cmp	al, 13h
		jbe	short loc_990D8
		mov	byte_6EA15, 0

loc_990D8:				; CODE XREF: Terrain_ComputeVisibilityAndAltitude_98CF0+3E1j
		mov	dword_6EA68, 0

loc_990E1:				; CODE XREF: Terrain_ComputeVisibilityAndAltitude_98CF0+24j
					; Terrain_ComputeVisibilityAndAltitude_98CF0+30j ...
		pop	di		; default
		pop	si
		leave
		retf
Terrain_ComputeVisibilityAndAltitude_98CF0	endp

; ���������������������������������������������������������������������������
off_990E5	dw offset loc_99079	; DATA XREF: Terrain_ComputeVisibilityAndAltitude_98CF0+384r
		dw offset loc_9907E	; jump table for switch	statement
		dw offset loc_99083
		dw offset loc_99083
		dw offset loc_9907E
		dw offset loc_99079
word_990F1	dw	1,     2,     4,     8 ; DATA XREF: Terrain_ComputeVisibilityAndAltitude_98CF0+3Co
		dw    10h,   20h,   40h,   80h ; value table for switch	statement
		dw   100h,  200h,  400h
		dw offset loc_98D43	; jump table for switch	statement
		dw offset loc_98D43
		dw offset loc_98D43
		dw offset loc_98D43
		dw offset loc_98D47
		dw offset loc_98D43
		dw offset loc_98D4C
		dw offset loc_98D43
		dw offset loc_98D43
		dw offset loc_98D43
		dw offset loc_98D43
ovr290		ends
