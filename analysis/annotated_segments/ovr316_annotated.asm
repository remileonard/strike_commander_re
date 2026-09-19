ovr316		segment	para public 'OVERLAY' use16
		assume cs:ovr316
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⭐⚠️ far, 577 lignes, NON DÉTAILLÉE — dernière fonction du fichier (avant les tables de stubs
; suivantes) : combine Terrain_QueryAltitudeAt, Gauge_ComputeNeedlePosition,
; Expr_VM_Execute_51E7E (seg114), TextObject_AllocateVariantA_5A984 (seg125) — calcul et rendu
; d'une aiguille de jauge liée à l'altitude terrain via la VM d'expression. Candidat pour
; session dédiée.
; ==============================================================================================
Gauge_ComputeAndRenderNeedle_9D910	proc far		; CODE XREF: VROOMM_StubThunk_6C2F0J

var_62		= dword	ptr -62h
var_58		= dword	ptr -58h
var_54		= dword	ptr -54h
var_50		= dword	ptr -50h
var_4C		= dword	ptr -4Ch
var_48		= dword	ptr -48h
var_44		= dword	ptr -44h
var_40		= dword	ptr -40h
var_3C		= word ptr -3Ch
var_3A		= dword	ptr -3Ah
var_36		= dword	ptr -36h
var_32		= dword	ptr -32h
var_2E		= dword	ptr -2Eh
var_2A		= dword	ptr -2Ah
var_26		= dword	ptr -26h
var_22		= dword	ptr -22h
var_1D		= byte ptr -1Dh
var_1C		= dword	ptr -1Ch
var_18		= dword	ptr -18h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_7		= byte ptr -7
var_6		= dword	ptr -6
var_1		= byte ptr -1
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= dword	ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 58h
		push	si
		push	di
		mov	si, [bp+arg_6]
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+36h]
		mov	bx, es:[bx+36h]
		mov	bx, [bx]
		call	dword ptr [bx+48h]
		pop	cx
		mov	bx, ax
		mov	al, [bx+75h]

loc_9D931:
		shr	ax, 5

loc_9D934:
		and	ax, 1
		mov	[bp+var_1], al
		mov	di, [bp+arg_4]
		mov	eax, [di+55h]
		mov	[bp+var_6], eax
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		pop	cx
		or	ax, dx
		jz	short loc_9D956
		push	si
		mov	bx, [si]
		call	dword ptr [bx+34h]
		pop	cx

loc_9D956:				; CODE XREF: Gauge_ComputeAndRenderNeedle_9D910+3Dj
		push	8
		push	ds
		push	offset aTerrain	; "TERRAIN"
		push	large dword ptr	[si+6]

loc_9D960:
		call	CRT_MemFamily_Extra7
		add	sp, 0Ah
		or	ax, ax
		jnz	short loc_9D971
		mov	ax, 1
		jmp	short loc_9D973
; ���������������������������������������������������������������������������

loc_9D971:				; CODE XREF: Gauge_ComputeAndRenderNeedle_9D910+5Aj
		xor	ax, ax

loc_9D973:				; CODE XREF: Gauge_ComputeAndRenderNeedle_9D910+5Fj
		or	al, al
		jnz	short loc_9D97A
		jmp	loc_9DBCA
; ���������������������������������������������������������������������������

loc_9D97A:				; CODE XREF: Gauge_ComputeAndRenderNeedle_9D910+65j
		mov	bx, [di+51h]
		mov	al, [bx+20h]
		mov	[bp+var_7], al
		mov	ax, word_722E6
		cmp	ax, [bp+arg_4]
		jnz	short loc_9D9A2
		cmp	[bp+var_7], 0
		jz	short loc_9D99D

loc_9D991:
		cmp	byte_6E4D0, 0
		jz	short loc_9D99D
		mov	ax, 1

loc_9D99B:
		jmp	short loc_9D99F
; ���������������������������������������������������������������������������

loc_9D99D:				; CODE XREF: Gauge_ComputeAndRenderNeedle_9D910+7Fj
					; Gauge_ComputeAndRenderNeedle_9D910+86j
		xor	ax, ax

loc_9D99F:				; CODE XREF: Gauge_ComputeAndRenderNeedle_9D910:loc_9D99Bj
		mov	[bp+var_7], al

loc_9D9A2:				; CODE XREF: Gauge_ComputeAndRenderNeedle_9D910+79j
		mov	al, [bp+var_7]
		mov	ah, 0
		or	ax, ax
		jz	short loc_9D9AE

loc_9D9AB:
		jmp	loc_9DAC5
; ���������������������������������������������������������������������������

loc_9D9AE:				; CODE XREF: Gauge_ComputeAndRenderNeedle_9D910+99j
		push	word ptr [di+51h]
		mov	bx, [di+51h]

loc_9D9B4:
		mov	bx, [bx]
		call	dword ptr [bx+14h]
		pop	cx
		mov	bx, [di+51h]
		mov	al, [bx+20h]
		mov	[bp+var_7], al
		mov	ax, word_722E6
		cmp	ax, [bp+arg_4]
		jnz	short loc_9D9E2
		cmp	[bp+var_7], 0
		jz	short loc_9D9DD
		cmp	byte_6E4D0, 0
		jz	short loc_9D9DD
		mov	ax, 1
		jmp	short loc_9D9DF
; ���������������������������������������������������������������������������

loc_9D9DD:				; CODE XREF: Gauge_ComputeAndRenderNeedle_9D910+BFj
					; Gauge_ComputeAndRenderNeedle_9D910+C6j
		xor	ax, ax

loc_9D9DF:				; CODE XREF: Gauge_ComputeAndRenderNeedle_9D910+CBj
		mov	[bp+var_7], al

loc_9D9E2:				; CODE XREF: Gauge_ComputeAndRenderNeedle_9D910+B9j
		cmp	[bp+var_7], 0
		jnz	short loc_9D9EB
		jmp	loc_9DAC5
; ���������������������������������������������������������������������������

loc_9D9EB:				; CODE XREF: Gauge_ComputeAndRenderNeedle_9D910+D6j
		mov	si, [bp+arg_4]
		add	si, 1Ah
		push	0
		mov	[bp+var_C], 0
		mov	eax, [bp+var_C]
		mov	[bp+var_4C], eax
		mov	[bp+var_10], 0
		mov	eax, [bp+var_10]
		mov	[bp+var_48], eax
		mov	[bp+var_14], 100h
		mov	eax, [bp+var_14]
		mov	[bp+var_44], eax
		lea	ax, [bp+var_4C]
		push	ax
		mov	ax, [bp+arg_4]
		add	ax, 12h
		push	ax
		push	word_70474
		push	ss
		lea	ax, [bp+var_18]
		push	ax
		call	Terrain_QueryAltitudeAt
		add	sp, 0Ch

loc_9DA3F:
		push	[bp+arg_4]
		push	ss

loc_9DA43:
		lea	ax, [bp+var_1C]
		push	ax

loc_9DA47:
		call	Gauge_ComputeNeedlePosition
		add	sp, 6
		mov	eax, [bp+var_18]
		add	eax, [bp+var_1C]
		mov	[si], eax
		mov	ax, [bp+arg_4]
		cmp	ax, word_722E6
		jnz	short loc_9DAC5

loc_9DA63:
		mov	bx, word_706A0

loc_9DA67:
		cmp	word ptr [bx+4Eh], 0
		jz	short loc_9DA8F

loc_9DA6D:
		push	large 0
		mov	bx, [bx+4Eh]
		push	large dword ptr	[bx+10h]
		mov	bx, word_706A0
		mov	bx, [bx+4Eh]
		mov	ax, [bx+2]
		add	ax, 40h	; '@'
		push	ax
		call	Expr_VM_ExecuteSingleInstruction_51E7E
		add	sp, 0Ah
		jmp	short $+2

loc_9DA8F:				; CODE XREF: Gauge_ComputeAndRenderNeedle_9D910+15Bj
		mov	bx, word_706A0
		mov	al, [bx+0A1h]
		mov	[bp+var_1D], al

loc_9DA9A:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_9DAAF
		cmp	word_70466, 64h	; 'd'
		jbe	short loc_9DAAF
		push	14h
		call	TextObject_AllocateVariantA_5A984
		pop	cx

loc_9DAAF:				; CODE XREF: Gauge_ComputeAndRenderNeedle_9D910+18Ej
					; Gauge_ComputeAndRenderNeedle_9D910+195j
		cmp	byte_72A8E, 4
		jnz	short loc_9DAC5
		push	0
		push	large 0
		push	0Ch
		call	Weapon_HUDBox_TimerCaseH_5A8DC
		add	sp, 8

loc_9DAC5:				; CODE XREF: Gauge_ComputeAndRenderNeedle_9D910:loc_9D9ABj
					; Gauge_ComputeAndRenderNeedle_9D910+D8j ...
		mov	al, [bp+var_7]
		mov	ah, 0
		or	ax, ax
		jz	short loc_9DAD7
		cmp	[bp+var_1], 0
		jnz	short loc_9DAD7
		jmp	loc_9DBC5
; ���������������������������������������������������������������������������

loc_9DAD7:				; CODE XREF: Gauge_ComputeAndRenderNeedle_9D910+1BCj
					; Gauge_ComputeAndRenderNeedle_9D910+1C2j
		or	byte ptr [di+73h], 1
		push	0
		mov	[bp+var_26], 0
		mov	eax, [bp+var_26]
		mov	[bp+var_58], eax
		mov	[bp+var_2A], 0
		mov	eax, [bp+var_2A]
		mov	[bp+var_54], eax
		mov	[bp+var_2E], 100h
		mov	eax, [bp+var_2E]
		mov	[bp+var_50], eax
		lea	ax, [bp+var_58]
		push	ax
		mov	ax, [bp+arg_4]
		add	ax, 12h
		push	ax
		push	word_70474
		push	ss
		lea	ax, [bp+var_22]
		push	ax
		call	Terrain_QueryAltitudeAt
		add	sp, 0Ch
		mov	eax, [di+20h]
		sar	eax, 1

loc_9DB30:
		mov	[bp+var_32], eax

loc_9DB34:
		mov	[bp+var_36], eax

loc_9DB38:
		add	[bp+var_22], eax

loc_9DB3C:
		mov	bx, [bp+arg_4]

loc_9DB3F:
		mov	eax, [bx+1Ah]

loc_9DB43:
		cmp	eax, [bp+var_22]

loc_9DB47:
		jge	short loc_9DB4E
		mov	ax, 1
		jmp	short loc_9DB50
; ���������������������������������������������������������������������������

loc_9DB4E:				; CODE XREF: Gauge_ComputeAndRenderNeedle_9D910:loc_9DB47j
		xor	ax, ax

loc_9DB50:				; CODE XREF: Gauge_ComputeAndRenderNeedle_9D910+23Cj
		or	al, al
		jz	short loc_9DB5F
		mov	bx, [bp+arg_4]
		mov	eax, [bp+var_22]
		mov	[bx+1Ah], eax

loc_9DB5F:				; CODE XREF: Gauge_ComputeAndRenderNeedle_9D910+242j
		mov	ax, [bp+arg_4]
		cmp	ax, word_722E6
		jnz	short loc_9DB6D
		mov	byte_6E4B7, 0

loc_9DB6D:				; CODE XREF: Gauge_ComputeAndRenderNeedle_9D910+256j
		mov	[bp+var_3A], 1400h
		les	bx, [bp+arg_0]
		cmp	dword ptr es:[bx+19h], 0
		jz	short loc_9DBA0
		les	bx, es:[bx+19h]
		mov	ax, es:[bx+8]
		mov	[bp+var_3C], ax
		movsx	eax, [bp+var_3C]
		shl	eax, 8

loc_9DB94:
		mov	[bp+var_40], eax

loc_9DB98:
		mov	eax, [bp+var_40]
		mov	[bp+var_3A], eax

loc_9DBA0:				; CODE XREF: Gauge_ComputeAndRenderNeedle_9D910+26Ej
		push	20h ; ' '

loc_9DBA2:
		sub	sp, 4

loc_9DBA5:
		mov	eax, [bp+var_3A]
		mov	[bp+var_62], eax
		mov	ax, [bp+arg_4]
		add	ax, 12h
		push	ax
		push	word_70474
		call	Terrain_CheckAdjacentDistance
		add	sp, 0Ah
		mov	al, 1
		jmp	loc_9DD1A
; ���������������������������������������������������������������������������

loc_9DBC5:				; CODE XREF: Gauge_ComputeAndRenderNeedle_9D910+1C4j
		mov	al, 0
		jmp	loc_9DD1A
; ���������������������������������������������������������������������������

loc_9DBCA:				; CODE XREF: Gauge_ComputeAndRenderNeedle_9D910+67j
		mov	[bp+var_7], 0
		mov	ax, [bp+arg_4]
		cmp	ax, word_722E6
		jnz	short loc_9DC08
		mov	al, byte_6E4B4
		mov	ah, 0
		or	ax, ax
		jnz	short loc_9DC08

loc_9DBE0:
		mov	byte_6E4CF, 1

loc_9DBE5:
		cmp	byte_7236A, 0
		jz	short loc_9DBF9

loc_9DBEC:
		push	4

loc_9DBEE:
		push	59CDh

loc_9DBF1:
		call	EntityTracker_SelectByStateCode

loc_9DBF6:
		add	sp, 4

loc_9DBF9:				; CODE XREF: Gauge_ComputeAndRenderNeedle_9D910+2DAj
		mov	al, [si+4]
		and	al, 4
		mov	ah, 0
		or	ax, ax
		jnz	short loc_9DC08
		mov	[bp+var_7], 1

loc_9DC08:				; CODE XREF: Gauge_ComputeAndRenderNeedle_9D910+2C5j
					; Gauge_ComputeAndRenderNeedle_9D910+2CEj ...
		push	si
		push	large dword ptr	[di+55h]
		les	bx, [di+55h]
		mov	bx, es:[bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	si
		mov	bx, [si]
		call	dword ptr [bx+38h]
		pop	cx
		mov	word ptr [bp+var_C+2], ax
		push	ax
		mov	ax, di
		add	ax, 6Fh	; 'o'
		push	ax
		call	SetReference16
		add	sp, 4

loc_9DC32:
		les	bx, [bp+var_6]

loc_9DC35:
		cmp	byte ptr es:[bx+0B9h], 3
		jnz	short loc_9DC40

loc_9DC3D:
		jmp	loc_9DCF4
; ���������������������������������������������������������������������������

loc_9DC40:				; CODE XREF: Gauge_ComputeAndRenderNeedle_9D910+32Bj
		push	si
		mov	bx, [si]

loc_9DC43:
		call	dword ptr [bx]
		pop	cx
		or	ax, dx
		jz	short loc_9DC53
		push	si
		mov	bx, [si]
		call	dword ptr [bx+34h]
		pop	cx
		jmp	short loc_9DC55
; ���������������������������������������������������������������������������

loc_9DC53:				; CODE XREF: Gauge_ComputeAndRenderNeedle_9D910+338j
		mov	al, 17h

loc_9DC55:				; CODE XREF: Gauge_ComputeAndRenderNeedle_9D910+341j
		cmp	al, 8
		jnz	short loc_9DC61
		mov	word ptr [bp+arg_8+2], ds
		mov	word ptr [bp+arg_8], 2B43h

loc_9DC61:				; CODE XREF: Gauge_ComputeAndRenderNeedle_9D910+347j
		push	large [bp+arg_8]
		push	si
		push	large dword ptr	[di+5Eh]
		call	VROOMM_StubThunk_6C0E0
		add	sp, 0Ah
		push	large dword ptr	[di+5Ah]
		call	VROOMM_StubThunk_6C41B
		add	sp, 4
		push	large dword ptr	[di+5Eh]
		call	VROOMM_StubThunk_6C0E5
		add	sp, 4
		mov	cx, ax
		les	bx, [bp+arg_0]

loc_9DC8F:
		mov	ax, es:[bx+68h]
		shl	ax, 3

loc_9DC96:
		mov	bx, 0Ah
		cwd
		idiv	bx
		mov	word ptr [bp+var_C], ax

loc_9DC9F:
		mov	bx, word ptr [bp+arg_0]

loc_9DCA2:
		cmp	es:[bx+68h], cx

loc_9DCA6:
		jle	short loc_9DCAE

loc_9DCA8:
		cmp	[bp+var_7], 0
		jz	short loc_9DCE8

loc_9DCAE:				; CODE XREF: Gauge_ComputeAndRenderNeedle_9D910:loc_9DCA6j
		mov	ax, [bp+arg_4]

loc_9DCB1:
		cmp	ax, word_722E6
		jnz	short loc_9DCE4
		push	si
		mov	bx, [si]
		call	dword ptr [bx+34h]
		pop	cx
		mov	ah, 0
		sub	ax, 8
		mov	bx, ax
		cmp	bx, 7		; switch 8 cases
		ja	short loc_9DCDF	; default
		shl	bx, 1
		jmp	cs:off_9DD1E[bx] ; switch jump

loc_9DCD1:				; DATA XREF: ovr316:off_9DD1Eo
		mov	byte_6E4B7, 2	; case 0x0
		jmp	short loc_9DCE4
; ���������������������������������������������������������������������������

loc_9DCD8:				; CODE XREF: Gauge_ComputeAndRenderNeedle_9D910+3BCj
					; DATA XREF: ovr316:off_9DD1Eo
		mov	byte_6E4B7, 3	; case 0x5
		jmp	short loc_9DCE4
; ���������������������������������������������������������������������������

loc_9DCDF:				; CODE XREF: Gauge_ComputeAndRenderNeedle_9D910+3B8j
					; Gauge_ComputeAndRenderNeedle_9D910+3BCj
					; DATA XREF: ...
		mov	byte_6E4B7, 1	; default

loc_9DCE4:				; CODE XREF: Gauge_ComputeAndRenderNeedle_9D910+3A5j
					; Gauge_ComputeAndRenderNeedle_9D910+3C6j ...
		mov	al, 1

loc_9DCE6:
		jmp	short loc_9DD1A
; ���������������������������������������������������������������������������

loc_9DCE8:				; CODE XREF: Gauge_ComputeAndRenderNeedle_9D910+39Cj
		cmp	cx, word ptr [bp+var_C]
		jl	short loc_9DCF4
		push	di

loc_9DCEE:
		call	Camera_EnableFollowIfActive
		pop	cx

loc_9DCF4:				; CODE XREF: Gauge_ComputeAndRenderNeedle_9D910:loc_9DC3Dj
					; Gauge_ComputeAndRenderNeedle_9D910+3DBj
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+1Dh]
		sar	ax, 1
		call	Math_RandomScale_54DF4
		mov	dx, ax
		or	dx, dx
		jz	short loc_9DD18
		push	ax
		push	[bp+arg_4]
		push	large [bp+arg_0]
		call	Debris_SpawnAtAttachPoint
		add	sp, 8

loc_9DD18:				; CODE XREF: Gauge_ComputeAndRenderNeedle_9D910+3F6j
		mov	al, 0

loc_9DD1A:				; CODE XREF: Gauge_ComputeAndRenderNeedle_9D910+2B2j
					; Gauge_ComputeAndRenderNeedle_9D910+2B7j ...
		pop	di
		pop	si
		leave
		retf
Gauge_ComputeAndRenderNeedle_9D910	endp

; ���������������������������������������������������������������������������
off_9DD1E	dw offset loc_9DCD1	; DATA XREF: Gauge_ComputeAndRenderNeedle_9D910+3BCr
		dw offset loc_9DCD1	; jump table for switch	statement
		dw offset loc_9DCDF
		dw offset loc_9DCDF
		dw offset loc_9DCDF
		dw offset loc_9DCD8
		dw offset loc_9DCDF
		dw offset loc_9DCD1
ovr316		ends
