seg011		segment	byte public 'CODE' use16
		assume cs:seg011
		;org 0Dh
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE 2026-10-17. Lecteur de voix numérisée : +2 = pilote numérique (word_4684B dans
; mid1).
; ==============================================================================================
VoicePlayer_SetDriver_7A3D	proc far		; CODE XREF: seg011:01A9p seg014:0946P ...

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[si+2],	ax
		pop	si
		pop	bp
		retf
VoicePlayer_SetDriver_7A3D	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_7A4D	proc far		; CODE XREF: seg011:01BAp

var_6E		= word ptr -6Eh
var_11		= dword	ptr -11h
var_D		= dword	ptr -0Dh
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 6Eh
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+2], 0
		jnz	short loc_7A60
		jmp	loc_7B57
; ���������������������������������������������������������������������������

loc_7A60:				; CODE XREF: sub_7A4D+Ej
		lea	ax, [bp+var_6E]
		push	ax
		call	StreamReader_ConstructVariantA_3B2A9
		add	sp, 2
		mov	[bp+var_6E], 556h
		mov	[bp+var_D], 100h
		mov	[bp+var_11], 0
		mov	[bp+var_6E], 693h
		push	1
		push	[bp+arg_2]
		lea	ax, [bp+var_6E]
		push	ax
		mov	bx, [bp+var_6E]
		call	dword ptr [bx+14h]
		add	sp, 6
		or	al, al
		jnz	short loc_7A9F
		jmp	loc_7B49
; ���������������������������������������������������������������������������

loc_7A9F:				; CODE XREF: sub_7A4D+4Dj
		lea	ax, [bp+var_6E]
		push	ax
		call	StreamReader_GetCapacity_3B8D2
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 2
		mov	[si+0Ch], eax
		mov	eax, [si+0Ch]
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
		lea	ax, [bp+var_6E]
		push	ax
		call	Handle_ReadAndOffsetField_3ADF0
		add	sp, 6
		push	0
		mov	al, [si+14h]
		push	ax
		push	word ptr [si+12h]
		push	word ptr [si+10h]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		mov	[si+0Ah], dx
		mov	[si+8],	ax
		mov	ax, [bp+arg_4]
		mov	[si+4],	ax
		mov	ax, [bp+arg_6]
		mov	[si+6],	ax

loc_7B49:				; CODE XREF: sub_7A4D+4Fj
		push	0
		lea	ax, [bp+var_6E]
		push	ax
		call	StreamReader_ReleaseBuffer_3CEB3
		add	sp, 4

loc_7B57:				; CODE XREF: sub_7A4D+10j
		pop	si
		leave
		retf
sub_7A4D	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE 2026-10-17. Si un pilote est attaché : si la méthode virtuelle +4 renvoie vrai,
; arrête la lecture (sub_30BDC) ; libère le bloc VOC possédé (+16) et remet son descripteur à
; zéro.
; ==============================================================================================
VoicePlayer_Stop_7B5A	proc far		; CODE XREF: sub_A100+36P
					; Midgame1_PlayPart1_5FCF0+1266P ...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+2], 0
		jz	short loc_7BC4
		push	si
		mov	bx, [si]
		call	dword ptr [bx+4]
		add	sp, 2
		or	al, al
		jz	short loc_7B8A
		cmp	word ptr [si+2], 0
		jz	short loc_7B8A
		mov	bx, [si+2]
		push	word ptr [bx+4]
		call	sub_30BDC
		add	sp, 2
		jmp	short $+2

loc_7B8A:				; CODE XREF: VoicePlayer_Stop_7B5A+18j VoicePlayer_Stop_7B5A+1Ej
		cmp	byte ptr [si+15h], 0
		jz	short loc_7BB0
		cmp	dword ptr [si+10h], 0
		jz	short loc_7BB0
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

loc_7BB0:				; CODE XREF: VoicePlayer_Stop_7B5A+34j VoicePlayer_Stop_7B5A+3Bj
		mov	dword ptr [si+10h], 0
		mov	byte ptr [si+15h], 0
		mov	dword ptr [si+16h], 0

loc_7BC4:				; CODE XREF: VoicePlayer_Stop_7B5A+Bj
		pop	si
		pop	bp
		retf
VoicePlayer_Stop_7B5A	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		cmp	word ptr [si+2], 0
		jz	short loc_7BF0
		push	word ptr [bp+8]
		push	si
		push	cs
		call	near ptr VoicePlayer_SetDriver_7A3D
		add	sp, 4
		push	word ptr [bp+0Eh]
		push	word ptr [bp+0Ch]
		push	word ptr [bp+0Ah]
		push	si
		push	cs
		call	near ptr sub_7A4D
		add	sp, 8

loc_7BF0:				; CODE XREF: seg011:01A2j
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		cmp	word ptr [si+2], 0
		jz	short loc_7C37
		cmp	dword ptr [si+10h], 0
		jz	short loc_7C0C
		mov	ax, 1
		jmp	short loc_7C0E
; ���������������������������������������������������������������������������

loc_7C0C:				; CODE XREF: seg011:01D5j
		xor	ax, ax

loc_7C0E:				; CODE XREF: seg011:01DAj
		or	ax, ax
		jz	short loc_7C37
		push	ds
		mov	ax, si
		add	ax, 4
		push	ax
		push	0
		mov	bx, [si+2]
		push	word ptr [bx+4]
		call	sub_30BB2
		add	sp, 8
		mov	bx, [si+2]
		push	word ptr [bx+4]
		call	sub_30BD6
		add	sp, 2

loc_7C37:				; CODE XREF: seg011:01CEj seg011:01E0j
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_7C3A:				; DATA XREF: dseg:185Fo
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		cmp	word ptr [si+2], 0
		jz	short loc_7C68
		push	0
		mov	bx, [si+2]
		push	word ptr [bx+4]
		call	sub_30BBE
		add	sp, 4
		cmp	ax, 3
		jnz	short loc_7C61
		mov	ax, 1
		jmp	short loc_7C63
; ���������������������������������������������������������������������������

loc_7C61:				; CODE XREF: seg011:022Aj
		xor	ax, ax

loc_7C63:				; CODE XREF: seg011:022Fj
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		jmp	short loc_7C6D
; ���������������������������������������������������������������������������

loc_7C68:				; CODE XREF: seg011:0215j
		mov	al, 1
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_7C6D:				; CODE XREF: seg011:0236j
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_7C70:				; DATA XREF: dseg:1863o
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		cmp	word ptr [si+2], 0
		jz	short loc_7C9E
		push	0
		mov	bx, [si+2]
		push	word ptr [bx+4]
		call	sub_30BBE
		add	sp, 4
		cmp	ax, 2
		jnz	short loc_7C97
		mov	ax, 1
		jmp	short loc_7C99
; ���������������������������������������������������������������������������

loc_7C97:				; CODE XREF: seg011:0260j
		xor	ax, ax

loc_7C99:				; CODE XREF: seg011:0265j
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		jmp	short loc_7CA3
; ���������������������������������������������������������������������������

loc_7C9E:				; CODE XREF: seg011:024Bj
		mov	al, 0
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_7CA3:				; CODE XREF: seg011:026Cj
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_7CA6:				; DATA XREF: dseg:1867o
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		cmp	word ptr [si+2], 0
		jz	short loc_7CD4
		push	0
		mov	bx, [si+2]
		push	word ptr [bx+4]
		call	sub_30BBE
		add	sp, 4
		cmp	ax, 1
		jnz	short loc_7CCD
		mov	ax, 1
		jmp	short loc_7CCF
; ���������������������������������������������������������������������������

loc_7CCD:				; CODE XREF: seg011:0296j
		xor	ax, ax

loc_7CCF:				; CODE XREF: seg011:029Bj
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		jmp	short loc_7CD9
; ���������������������������������������������������������������������������

loc_7CD4:				; CODE XREF: seg011:0281j
		mov	al, 1
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_7CD9:				; CODE XREF: seg011:02A2j
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_7CDC:				; DATA XREF: dseg:186Bo
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		cmp	word ptr [si+2], 0
		jz	short loc_7D09
		push	0
		mov	bx, [si+2]
		push	word ptr [bx+4]
		call	sub_30BBE
		add	sp, 4
		or	ax, ax
		jnz	short loc_7D02
		mov	ax, 1
		jmp	short loc_7D04
; ���������������������������������������������������������������������������

loc_7D02:				; CODE XREF: seg011:02CBj
		xor	ax, ax

loc_7D04:				; CODE XREF: seg011:02D0j
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		jmp	short loc_7D0E
; ���������������������������������������������������������������������������

loc_7D09:				; CODE XREF: seg011:02B7j
		mov	al, 1
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_7D0E:				; CODE XREF: seg011:02D7j
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_7D11	proc far		; CODE XREF: Midgame1_PlayPart1_5FCF0+1134P
					; Midgame1_PlayPart1_5FCF0+2CF8P ...

var_5		= byte ptr -5
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	eax, [di]
		mov	[bp+var_4], eax
		mov	al, [di+4]
		mov	[bp+var_5], al
		mov	eax, [bp+var_4]
		mov	[si+10h], eax
		mov	al, [bp+var_5]
		mov	[si+14h], al
		mov	byte ptr [si+15h], 0
		mov	dword ptr [si+16h], 0
		mov	eax, [di+6]
		mov	[si+16h], eax
		pop	di
		pop	si
		leave
		retf
sub_7D11	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE 2026-10-21. Charge une réplique (arg_2 = ressource VOC) dans le lecteur de voix et
; calcule sa table de bouches pour une cadence arg_4 (rangée en +1Ah) : fréquence = 1 000 000
; / (256 − octet 1Eh du VOC) (mov eax, 0F4240h / idiv), échantillons par image = fréquence /
; cadence, nombre d'échantillons = (dword 1Ah du VOC >> 8) − 2 (taille du premier bloc),
; données à partir de l'octet 20h. Pour chaque image k (0 à n, la dernière partielle) :
; échantillons de k × fréquence / cadence + 20h sur (échantillons par image + 1), valeur =
; somme × 1000 / nombre − 128 000 (imul eax, 3E8h / div / sub eax, 1F400h), table en +1Ch, 512
; mots de 4 octets au plus, remplie d'abord de −2. Puis référence = la plus grande des valeurs
; absolues du maximum et du minimum calculés sans l'entrée maximale et l'entrée minimale
; (CRT_NormalizeSign32 = valeur absolue 32 bits) ; chaque entrée devient p = (référence −
; |entrée sur 16 bits|) × 100 / référence (sub_2CD = valeur absolue 16 bits) puis une bouche :
; p ≥ 95 → −1 (pas de bouche), ≥ 78 → 8, ≥ 65 → 3, ≥ 42 → 2, ≥ 25 → 10, sinon 11.
; ==============================================================================================
VoicePlayer_LoadWithLipSync_7D52	proc far		; CODE XREF: TalkingHead_AttachVoice_9CF7+25P

var_49		= byte ptr -49h
var_48		= dword	ptr -48h
var_44		= word ptr -44h
var_42		= dword	ptr -42h
var_3E		= word ptr -3Eh
var_3C		= word ptr -3Ch
var_3A		= word ptr -3Ah
var_38		= dword	ptr -38h
var_34		= dword	ptr -34h
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
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4Ah
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_4]
		mov	[si+1Ah], ax
		cmp	word ptr [si+2], 0
		jnz	short loc_7D6C
		jmp	loc_8252
; ���������������������������������������������������������������������������

loc_7D6C:				; CODE XREF: VoicePlayer_LoadWithLipSync_7D52+15j
		mov	ax, [bp+arg_2]
		mov	[bp+var_44], ax
		mov	bx, [bp+var_44]
		mov	eax, [bx]
		mov	[bp+var_48], eax
		mov	bx, [bp+var_44]
		mov	al, [bx+4]
		mov	[bp+var_49], al
		mov	eax, [bp+var_48]
		mov	[si+10h], eax
		mov	al, [bp+var_49]
		mov	[si+14h], al
		mov	byte ptr [si+15h], 0
		mov	dword ptr [si+16h], 0
		mov	bx, [bp+var_44]
		mov	eax, [bx+6]
		mov	[si+16h], eax
		push	0
		mov	bx, [bp+arg_2]
		mov	al, [bx+4]
		push	ax
		mov	bx, [bp+arg_2]
		push	word ptr [bx+2]
		push	word ptr [bx]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		les	bx, [bp+var_4]
		mov	al, es:[bx+1Eh]
		mov	ah, 0
		mov	dx, 100h
		sub	dx, ax
		movsx	ebx, dx
		mov	eax, 0F4240h
		cdq
		idiv	ebx
		mov	[bp+var_14], eax
		movsx	ebx, word ptr [si+1Ah]
		mov	eax, [bp+var_14]
		cdq
		idiv	ebx
		mov	[bp+var_10], eax
		xor	di, di
		mov	[bp+var_1C], 0
		jmp	short loc_7E1D
; ���������������������������������������������������������������������������

loc_7E0B:				; CODE XREF: VoicePlayer_LoadWithLipSync_7D52+D3j
		mov	bx, word ptr [bp+var_1C]
		shl	bx, 2
		mov	dword ptr [bx+si+1Ch], 0FFFFFFFEh
		inc	[bp+var_1C]

loc_7E1D:				; CODE XREF: VoicePlayer_LoadWithLipSync_7D52+B7j
		cmp	[bp+var_1C], 200h
		jl	short loc_7E0B
		les	bx, [bp+var_4]
		mov	eax, es:[bx+1Ah]
		sar	eax, 8
		add	eax, 0FFFFFFFEh
		mov	[bp+var_C], eax
		mov	eax, [bp+var_C]
		cdq
		idiv	[bp+var_10]
		mov	[bp+var_2C], eax
		mov	eax, [bp+var_10]
		imul	eax, [bp+var_2C]
		mov	edx, [bp+var_C]
		sub	edx, eax
		mov	[bp+var_30], edx
		mov	[bp+var_34], 0
		jmp	loc_8027
; ���������������������������������������������������������������������������

loc_7E68:				; CODE XREF: VoicePlayer_LoadWithLipSync_7D52+2DFj
		mov	[bp+var_24], 0F423Fh
		mov	[bp+var_28], 0
		mov	[bp+var_20], 0
		mov	[bp+var_8], 0
		mov	eax, [bp+var_34]
		imul	eax, [bp+var_14]
		movsx	ebx, word ptr [si+1Ah]
		cdq
		idiv	ebx
		add	eax, 20h ; ' '
		mov	[bp+var_38], eax
		mov	eax, [bp+var_34]
		cmp	eax, [bp+var_2C]
		jl	short loc_7EB0
		jmp	loc_7F69
; ���������������������������������������������������������������������������

loc_7EB0:				; CODE XREF: VoicePlayer_LoadWithLipSync_7D52+159j
		mov	eax, [bp+var_38]
		mov	[bp+var_1C], eax
		jmp	short loc_7F11
; ���������������������������������������������������������������������������

loc_7EBA:				; CODE XREF: VoicePlayer_LoadWithLipSync_7D52+1CBj
		les	bx, [bp+var_4]
		add	bx, word ptr [bp+var_1C]
		movzx	eax, byte ptr es:[bx]
		cmp	eax, [bp+var_28]
		jle	short loc_7EDA
		les	bx, [bp+var_4]
		add	bx, word ptr [bp+var_1C]
		movzx	eax, byte ptr es:[bx]
		mov	[bp+var_28], eax

loc_7EDA:				; CODE XREF: VoicePlayer_LoadWithLipSync_7D52+177j
		les	bx, [bp+var_4]
		add	bx, word ptr [bp+var_1C]
		movzx	eax, byte ptr es:[bx]
		cmp	eax, [bp+var_24]
		jge	short loc_7EFA
		les	bx, [bp+var_4]
		add	bx, word ptr [bp+var_1C]
		movzx	eax, byte ptr es:[bx]
		mov	[bp+var_24], eax

loc_7EFA:				; CODE XREF: VoicePlayer_LoadWithLipSync_7D52+197j
		les	bx, [bp+var_4]
		add	bx, word ptr [bp+var_1C]
		movzx	eax, byte ptr es:[bx]
		add	[bp+var_8], eax
		inc	[bp+var_20]
		inc	[bp+var_1C]

loc_7F11:				; CODE XREF: VoicePlayer_LoadWithLipSync_7D52+166j
		mov	eax, [bp+var_38]
		add	eax, [bp+var_10]
		cmp	eax, [bp+var_1C]
		jge	short loc_7EBA
		cmp	[bp+var_20], 0
		jz	short loc_7F49
		mov	eax, [bp+var_8]
		imul	eax, 3E8h
		xor	edx, edx
		div	[bp+var_20]
		sub	eax, 1F400h
		mov	bx, di
		shl	bx, 2
		mov	[bx+si+1Ch], eax
		jmp	short loc_7F56
; ���������������������������������������������������������������������������

loc_7F49:				; CODE XREF: VoicePlayer_LoadWithLipSync_7D52+1D2j
		mov	bx, di
		shl	bx, 2
		mov	dword ptr [bx+si+1Ch], 0

loc_7F56:				; CODE XREF: VoicePlayer_LoadWithLipSync_7D52+1F5j
		mov	ax, word ptr [bp+var_28]
		sub	ax, word ptr [bp+var_24]
		mov	[bp+var_3E], ax
		cmp	di, 200h
		jge	short loc_7F66
		inc	di

loc_7F66:				; CODE XREF: VoicePlayer_LoadWithLipSync_7D52+211j
		jmp	loc_8023
; ���������������������������������������������������������������������������

loc_7F69:				; CODE XREF: VoicePlayer_LoadWithLipSync_7D52+15Bj
		cmp	[bp+var_30], 0
		jg	short loc_7F73
		jmp	loc_8023
; ���������������������������������������������������������������������������

loc_7F73:				; CODE XREF: VoicePlayer_LoadWithLipSync_7D52+21Cj
		mov	eax, [bp+var_38]
		mov	[bp+var_1C], eax
		jmp	short loc_7FD4
; ���������������������������������������������������������������������������

loc_7F7D:				; CODE XREF: VoicePlayer_LoadWithLipSync_7D52+28Ej
		les	bx, [bp+var_4]
		add	bx, word ptr [bp+var_1C]
		movzx	eax, byte ptr es:[bx]
		cmp	eax, [bp+var_28]
		jle	short loc_7F9D
		les	bx, [bp+var_4]
		add	bx, word ptr [bp+var_1C]
		movzx	eax, byte ptr es:[bx]
		mov	[bp+var_28], eax

loc_7F9D:				; CODE XREF: VoicePlayer_LoadWithLipSync_7D52+23Aj
		les	bx, [bp+var_4]
		add	bx, word ptr [bp+var_1C]
		movzx	eax, byte ptr es:[bx]
		cmp	eax, [bp+var_24]
		jge	short loc_7FBD
		les	bx, [bp+var_4]
		add	bx, word ptr [bp+var_1C]
		movzx	eax, byte ptr es:[bx]
		mov	[bp+var_24], eax

loc_7FBD:				; CODE XREF: VoicePlayer_LoadWithLipSync_7D52+25Aj
		les	bx, [bp+var_4]
		add	bx, word ptr [bp+var_1C]
		movzx	eax, byte ptr es:[bx]
		add	[bp+var_8], eax
		inc	[bp+var_20]
		inc	[bp+var_1C]

loc_7FD4:				; CODE XREF: VoicePlayer_LoadWithLipSync_7D52+229j
		mov	eax, [bp+var_C]
		add	eax, 20h ; ' '
		cmp	eax, [bp+var_1C]
		jg	short loc_7F7D
		cmp	[bp+var_20], 0
		jz	short loc_800C
		mov	eax, [bp+var_8]
		imul	eax, 3E8h
		xor	edx, edx
		div	[bp+var_20]
		sub	eax, 1F400h
		mov	bx, di
		shl	bx, 2
		mov	[bx+si+1Ch], eax
		jmp	short loc_8019
; ���������������������������������������������������������������������������

loc_800C:				; CODE XREF: VoicePlayer_LoadWithLipSync_7D52+295j
		mov	bx, di
		shl	bx, 2
		mov	dword ptr [bx+si+1Ch], 0

loc_8019:				; CODE XREF: VoicePlayer_LoadWithLipSync_7D52+2B8j
		mov	ax, word ptr [bp+var_28]
		sub	ax, word ptr [bp+var_24]
		mov	[bp+var_3E], ax
		inc	di

loc_8023:				; CODE XREF: VoicePlayer_LoadWithLipSync_7D52:loc_7F66j
					; VoicePlayer_LoadWithLipSync_7D52+21Ej
		inc	[bp+var_34]

loc_8027:				; CODE XREF: VoicePlayer_LoadWithLipSync_7D52+113j
		mov	eax, [bp+var_34]
		cmp	eax, [bp+var_2C]
		jg	short loc_8034
		jmp	loc_7E68
; ���������������������������������������������������������������������������

loc_8034:				; CODE XREF: VoicePlayer_LoadWithLipSync_7D52+2DDj
		mov	[bp+var_24], 270Fh
		mov	[bp+var_28], 0FFFFD8F1h
		mov	[bp+var_1C], 0
		jmp	short loc_809A
; ���������������������������������������������������������������������������

loc_804E:				; CODE XREF: VoicePlayer_LoadWithLipSync_7D52+350j
		mov	bx, word ptr [bp+var_1C]
		shl	bx, 2
		mov	eax, [bx+si+1Ch]
		cmp	eax, [bp+var_28]
		jle	short loc_8072
		mov	bx, word ptr [bp+var_1C]
		shl	bx, 2
		mov	eax, [bx+si+1Ch]
		mov	[bp+var_28], eax
		mov	ax, word ptr [bp+var_1C]
		mov	[bp+var_3C], ax

loc_8072:				; CODE XREF: VoicePlayer_LoadWithLipSync_7D52+30Aj
		mov	bx, word ptr [bp+var_1C]
		shl	bx, 2
		mov	eax, [bx+si+1Ch]
		cmp	eax, [bp+var_24]
		jge	short loc_8096
		mov	bx, word ptr [bp+var_1C]
		shl	bx, 2
		mov	eax, [bx+si+1Ch]
		mov	[bp+var_24], eax
		mov	ax, word ptr [bp+var_1C]
		mov	[bp+var_3A], ax

loc_8096:				; CODE XREF: VoicePlayer_LoadWithLipSync_7D52+32Ej
		inc	[bp+var_1C]

loc_809A:				; CODE XREF: VoicePlayer_LoadWithLipSync_7D52+2FAj
		movsx	eax, di
		cmp	eax, [bp+var_1C]
		jg	short loc_804E
		mov	[bp+var_24], 270Fh
		mov	[bp+var_28], 0FFFFD8F1h
		mov	[bp+var_1C], 0
		jmp	short loc_8114
; ���������������������������������������������������������������������������

loc_80BE:				; CODE XREF: VoicePlayer_LoadWithLipSync_7D52+3CAj
		movsx	eax, [bp+var_3A]
		cmp	eax, [bp+var_1C]
		jz	short loc_8110
		movsx	eax, [bp+var_3C]
		cmp	eax, [bp+var_1C]
		jz	short loc_8110
		mov	bx, word ptr [bp+var_1C]
		shl	bx, 2
		mov	eax, [bx+si+1Ch]
		cmp	eax, [bp+var_28]
		jle	short loc_80F2
		mov	bx, word ptr [bp+var_1C]
		shl	bx, 2
		mov	eax, [bx+si+1Ch]
		mov	[bp+var_28], eax

loc_80F2:				; CODE XREF: VoicePlayer_LoadWithLipSync_7D52+390j
		mov	bx, word ptr [bp+var_1C]
		shl	bx, 2
		mov	eax, [bx+si+1Ch]
		cmp	eax, [bp+var_24]
		jge	short loc_8110
		mov	bx, word ptr [bp+var_1C]
		shl	bx, 2
		mov	eax, [bx+si+1Ch]
		mov	[bp+var_24], eax

loc_8110:				; CODE XREF: VoicePlayer_LoadWithLipSync_7D52+375j
					; VoicePlayer_LoadWithLipSync_7D52+380j ...
		inc	[bp+var_1C]

loc_8114:				; CODE XREF: VoicePlayer_LoadWithLipSync_7D52+36Aj
		movsx	eax, di
		cmp	eax, [bp+var_1C]
		jg	short loc_80BE
		push	large [bp+var_28]
		call	CRT_NormalizeSign32
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 4
		push	eax
		push	large [bp+var_24]
		call	CRT_NormalizeSign32
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 4
		pop	edx
		cmp	edx, eax
		jle	short loc_816C
		push	large [bp+var_28]
		call	CRT_NormalizeSign32
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 4
		mov	[bp+var_42], eax
		jmp	short loc_8185
; ���������������������������������������������������������������������������

loc_816C:				; CODE XREF: VoicePlayer_LoadWithLipSync_7D52+3FDj
		push	large [bp+var_24]
		call	CRT_NormalizeSign32
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 4
		mov	[bp+var_42], eax

loc_8185:				; CODE XREF: VoicePlayer_LoadWithLipSync_7D52+418j
		mov	[bp+var_1C], 0
		jmp	loc_8243
; ���������������������������������������������������������������������������

loc_8190:				; CODE XREF: VoicePlayer_LoadWithLipSync_7D52+4FBj
		mov	bx, word ptr [bp+var_1C]
		shl	bx, 2
		push	word ptr [bx+si+1Ch]
		call	CRT_Abs16_2CD
		add	sp, 2
		movsx	eax, ax
		push	eax
		mov	eax, [bp+var_42]
		pop	edx
		sub	eax, edx
		imul	eax, 64h
		cdq
		idiv	[bp+var_42]
		mov	[bp+var_18], eax
		cmp	[bp+var_18], 5Fh ; '_'
		jl	short loc_81D5
		mov	bx, word ptr [bp+var_1C]
		shl	bx, 2
		mov	dword ptr [bx+si+1Ch], 0FFFFFFFFh
		jmp	short loc_823F
; ���������������������������������������������������������������������������

loc_81D5:				; CODE XREF: VoicePlayer_LoadWithLipSync_7D52+471j
		cmp	[bp+var_18], 4Eh ; 'N'
		jl	short loc_81EC
		mov	bx, word ptr [bp+var_1C]
		shl	bx, 2
		mov	dword ptr [bx+si+1Ch], 8
		jmp	short loc_823F
; ���������������������������������������������������������������������������

loc_81EC:				; CODE XREF: VoicePlayer_LoadWithLipSync_7D52+488j
		cmp	[bp+var_18], 41h ; 'A'
		jl	short loc_8203
		mov	bx, word ptr [bp+var_1C]
		shl	bx, 2
		mov	dword ptr [bx+si+1Ch], 3
		jmp	short loc_823F
; ���������������������������������������������������������������������������

loc_8203:				; CODE XREF: VoicePlayer_LoadWithLipSync_7D52+49Fj
		cmp	[bp+var_18], 2Ah ; '*'
		jl	short loc_821A
		mov	bx, word ptr [bp+var_1C]
		shl	bx, 2
		mov	dword ptr [bx+si+1Ch], 2
		jmp	short loc_823F
; ���������������������������������������������������������������������������

loc_821A:				; CODE XREF: VoicePlayer_LoadWithLipSync_7D52+4B6j
		cmp	[bp+var_18], 19h
		jl	short loc_8231
		mov	bx, word ptr [bp+var_1C]
		shl	bx, 2
		mov	dword ptr [bx+si+1Ch], 0Ah
		jmp	short loc_823F
; ���������������������������������������������������������������������������

loc_8231:				; CODE XREF: VoicePlayer_LoadWithLipSync_7D52+4CDj
		mov	bx, word ptr [bp+var_1C]
		shl	bx, 2
		mov	dword ptr [bx+si+1Ch], 0Bh

loc_823F:				; CODE XREF: VoicePlayer_LoadWithLipSync_7D52+481j
					; VoicePlayer_LoadWithLipSync_7D52+498j ...
		inc	[bp+var_1C]

loc_8243:				; CODE XREF: VoicePlayer_LoadWithLipSync_7D52+43Bj
		movsx	eax, di
		cmp	eax, [bp+var_1C]
		jle	short loc_8250
		jmp	loc_8190
; ���������������������������������������������������������������������������

loc_8250:				; CODE XREF: VoicePlayer_LoadWithLipSync_7D52+4F9j
		xor	di, di

loc_8252:				; CODE XREF: VoicePlayer_LoadWithLipSync_7D52+17j
		pop	di
		pop	si
		leave
		retf
VoicePlayer_LoadWithLipSync_7D52	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_8256	proc far		; CODE XREF: seg014:0957P

var_6E		= word ptr -6Eh
var_11		= dword	ptr -11h
var_D		= dword	ptr -0Dh
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 6Eh
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+2], 0
		jnz	short loc_8269
		jmp	loc_832C
; ���������������������������������������������������������������������������

loc_8269:				; CODE XREF: sub_8256+Ej
		lea	ax, [bp+var_6E]
		push	ax
		call	StreamReader_ConstructVariantA_3B2A9
		add	sp, 2
		mov	[bp+var_6E], 556h
		mov	[bp+var_D], 100h
		mov	[bp+var_11], 0
		mov	[bp+var_6E], 693h
		push	1
		push	[bp+arg_2]
		lea	ax, [bp+var_6E]
		push	ax
		mov	bx, [bp+var_6E]
		call	dword ptr [bx+14h]
		add	sp, 6
		or	al, al
		jz	short loc_831E
		lea	ax, [bp+var_6E]
		push	ax
		call	StreamReader_GetCapacity_3B8D2
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 2
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
		lea	ax, [bp+var_6E]
		push	ax
		call	Handle_ReadAndOffsetField_3ADF0
		add	sp, 6

loc_831E:				; CODE XREF: sub_8256+4Dj
		push	0
		lea	ax, [bp+var_6E]
		push	ax
		call	StreamReader_ReleaseBuffer_3CEB3
		add	sp, 4

loc_832C:				; CODE XREF: sub_8256+10j
		pop	si
		leave
		retf
sub_8256	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 80h
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+0Ah]
		cmp	word ptr [si+2], 0
		jnz	short loc_8347
		jmp	loc_83FA
; ���������������������������������������������������������������������������

loc_8347:				; CODE XREF: seg011:0912j
		lea	ax, [bp-80h]
		push	ax
		call	IndexedRecordReader_ConstructVariantA_3D28A
		add	sp, 2
		push	1
		push	word ptr [bp+8]
		lea	ax, [bp-80h]
		push	ax
		mov	bx, [bp-80h]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	di
		lea	ax, [bp-80h]
		push	ax
		call	IndexedRecordReader_AdvanceIndex_3D69C
		add	sp, 4
		mov	ax, [bp-13h]
		and	ax, 0C0h
		cmp	ax, 0C0h ; '�'
		jnz	short loc_8383
		mov	eax, [bp-1Fh]
		jmp	short loc_8387
; ���������������������������������������������������������������������������

loc_8383:				; CODE XREF: seg011:094Bj
		mov	eax, [bp-0Fh]

loc_8387:				; CODE XREF: seg011:0951j
		mov	[bp-4],	eax
		push	1
		push	0
		push	2
		push	large dword ptr	[bp-4]
		push	661Ah
		call	Memory_TypedFreeWrapper_2B7E1
		add	sp, 0Ch
		mov	[bp-6],	dx
		mov	[bp-8],	ax
		mov	eax, [bp-8]
		mov	[si+10h], eax
		mov	byte ptr [si+14h], 2
		mov	byte ptr [si+15h], 1
		mov	dword ptr [si+16h], 0
		mov	eax, [bp-4]
		mov	[si+16h], eax
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
		lea	ax, [bp-80h]
		push	ax
		call	IndexedRecordReader_SeekToIndex_3D4DD
		add	sp, 8
		push	2
		lea	ax, [bp-80h]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4

loc_83FA:				; CODE XREF: seg011:0914j
		pop	di
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_83FE	proc far		; CODE XREF: Midgame1_PlayPart1_5FCF0+11B3P
					; Midgame1_PlayPart1_5FCF0+11F5P ...

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+2], 0
		jz	short loc_8463
		cmp	dword ptr [si+10h], 0
		jz	short loc_8417
		mov	ax, 1
		jmp	short loc_8419
; ���������������������������������������������������������������������������

loc_8417:				; CODE XREF: sub_83FE+12j
		xor	ax, ax

loc_8419:				; CODE XREF: sub_83FE+17j
		or	ax, ax
		jz	short loc_8463
		push	[bp+arg_2]
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
		mov	bx, [si+2]
		push	word ptr [bx+4]
		call	sub_30BC4
		add	sp, 8
		mov	bx, [si+2]
		push	word ptr [bx+4]
		call	sub_30BD6
		add	sp, 2
		mov	eax, dword_47ABB
		mov	[si+81Dh], eax
		mov	byte ptr [si+81Ch], 1

loc_8463:				; CODE XREF: sub_83FE+Bj sub_83FE+1Dj
		pop	si
		pop	bp
		retf
sub_83FE	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE 2026-10-17. Image de bouche de la voix en cours : -1 sans pilote ; sinon indice =
; temps écoulé du chronomètre +2076 (sub_3EFDF) × +26 / 60 ; indice < 512 : mot de la table en
; +28 + indice × 4 ; sinon -2 (fin). Le remplissage de cette table n'est pas lu.
; ==============================================================================================
VoicePlayer_GetLipFrame_8466	proc far		; CODE XREF: TalkingHead_StartVoiceAndIsSpeaking_9C64+25P seg014:0C49P

var_4		= dword	ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, 0FFFFh
		cmp	word ptr [si+2], 0
		jz	short loc_84C2
		mov	ax, si
		add	ax, 81Ch
		push	ax
		call	Stopwatch_Elapsed_3EFDF
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 2
		movsx	edx, word ptr [si+1Ah]
		imul	eax, edx
		mov	ebx, 3Ch ; '<'
		xor	edx, edx
		div	ebx
		mov	[bp+var_4], eax
		cmp	[bp+var_4], 200h
		jge	short loc_84BF
		mov	bx, word ptr [bp+var_4]
		shl	bx, 2
		mov	di, [bx+si+1Ch]
		jmp	short loc_84C2
; ���������������������������������������������������������������������������

loc_84BF:				; CODE XREF: VoicePlayer_GetLipFrame_8466+4Cj
		mov	di, 0FFFEh

loc_84C2:				; CODE XREF: VoicePlayer_GetLipFrame_8466+12j VoicePlayer_GetLipFrame_8466+57j
		mov	ax, di
		pop	di
		pop	si
		leave
		retf
VoicePlayer_GetLipFrame_8466	endp

; ���������������������������������������������������������������������������
		pop	di
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE 2026-10-21. Vrai quand la réplique du lecteur de voix est finie : sans pilote
; ([si+2] = 0) renvoie 1 ; sinon appelle sub_30BD0 (fonction 124 du pilote son,
; AIL_VOC_playback_status, mov ax, 7Ch / jmp AIL_call_driver_3041C) et renvoie 1 si l'état
; vaut 3 (DAC_DONE d'AIL.INC), 0 sinon (cmp ax, 3).
; ==============================================================================================
VoicePlayer_IsDone_84CC	proc far		; CODE XREF: Midgame1_PlayPart1_5FCF0+642EP
					; DATA XREF: dseg:186Fo

arg_0		= word ptr  6

; FUNCTION CHUNK AT 0ACD SIZE 00000003 BYTES

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+2], 0
		jz	short loc_84F8
		mov	bx, [si+2]
		push	word ptr [bx+4]
		call	AIL_VOC_playback_status_30BD0
		add	sp, 2
		cmp	ax, 3
		jnz	short loc_84F1
		mov	ax, 1
		jmp	short loc_84F3
; ���������������������������������������������������������������������������

loc_84F1:				; CODE XREF: VoicePlayer_IsDone_84CC+1Ej
		xor	ax, ax

loc_84F3:				; CODE XREF: VoicePlayer_IsDone_84CC+23j
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		jmp	short loc_84FD
; ���������������������������������������������������������������������������

loc_84F8:				; CODE XREF: VoicePlayer_IsDone_84CC+Bj
		mov	al, 1
		pop	si
		pop	bp
		retf
VoicePlayer_IsDone_84CC	endp

; ���������������������������������������������������������������������������
; START	OF FUNCTION CHUNK FOR VoicePlayer_IsDone_84CC

loc_84FD:				; CODE XREF: VoicePlayer_IsDone_84CC+2Aj
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK	FOR VoicePlayer_IsDone_84CC

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE 2026-10-21. Vrai pendant la lecture de la réplique : sans pilote ([si+2] = 0)
; renvoie 0 ; sinon appelle sub_30BD0 (AIL_VOC_playback_status, fonction 124 du pilote son) et
; renvoie 1 si l'état vaut 2 (DAC_PLAYING d'AIL.INC), 0 sinon (cmp ax, 2). Utilisée par la
; cinématique mid2 (sub_6B9C0) pour attendre la fin d'une réplique (tant que en cours).
; ==============================================================================================
VoicePlayer_IsPlaying_8500	proc far		; CODE XREF: sub_6B9C0+1308P
					; sub_6B9C0+15C0P ...

arg_0		= word ptr  6

; FUNCTION CHUNK AT 0B01 SIZE 00000003 BYTES

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+2], 0
		jz	short loc_852C
		mov	bx, [si+2]
		push	word ptr [bx+4]
		call	AIL_VOC_playback_status_30BD0
		add	sp, 2
		cmp	ax, 2
		jnz	short loc_8525
		mov	ax, 1
		jmp	short loc_8527
; ���������������������������������������������������������������������������

loc_8525:				; CODE XREF: VoicePlayer_IsPlaying_8500+1Ej
		xor	ax, ax

loc_8527:				; CODE XREF: VoicePlayer_IsPlaying_8500+23j
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		jmp	short loc_8531
; ���������������������������������������������������������������������������

loc_852C:				; CODE XREF: VoicePlayer_IsPlaying_8500+Bj
		mov	al, 0
		pop	si
		pop	bp
		retf
VoicePlayer_IsPlaying_8500	endp

; ���������������������������������������������������������������������������
; START	OF FUNCTION CHUNK FOR VoicePlayer_IsPlaying_8500

loc_8531:				; CODE XREF: VoicePlayer_IsPlaying_8500+2Aj
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK	FOR VoicePlayer_IsPlaying_8500
; ���������������������������������������������������������������������������

loc_8534:				; DATA XREF: dseg:1877o
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		cmp	word ptr [si+2], 0
		jz	short loc_8560
		mov	bx, [si+2]
		push	word ptr [bx+4]
		call	AIL_VOC_playback_status_30BD0
		add	sp, 2
		cmp	ax, 1
		jnz	short loc_8559
		mov	ax, 1
		jmp	short loc_855B
; ���������������������������������������������������������������������������

loc_8559:				; CODE XREF: seg011:0B22j
		xor	ax, ax

loc_855B:				; CODE XREF: seg011:0B27j
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		jmp	short loc_8565
; ���������������������������������������������������������������������������

loc_8560:				; CODE XREF: seg011:0B0Fj
		mov	al, 1
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_8565:				; CODE XREF: seg011:0B2Ej
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_8568:				; DATA XREF: dseg:187Bo
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		cmp	word ptr [si+2], 0
		jz	short loc_8593
		mov	bx, [si+2]
		push	word ptr [bx+4]
		call	AIL_VOC_playback_status_30BD0
		add	sp, 2
		or	ax, ax
		jnz	short loc_858C
		mov	ax, 1
		jmp	short loc_858E
; ���������������������������������������������������������������������������

loc_858C:				; CODE XREF: seg011:0B55j
		xor	ax, ax

loc_858E:				; CODE XREF: seg011:0B5Aj
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		jmp	short loc_8598
; ���������������������������������������������������������������������������

loc_8593:				; CODE XREF: seg011:0B43j
		mov	al, 1
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_8598:				; CODE XREF: seg011:0B61j
		pop	si
		pop	bp
		retf
seg011		ends
