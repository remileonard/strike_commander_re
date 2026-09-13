seg122		segment	byte public 'CODE' use16
		assume cs:seg122
		;org 6
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle sub_603DE (sous-fonction du sous-système minuteur, seg121) — référencée par
; sub_59902.
; ==============================================================================================
Weapon_HUDBox_TimerCaseC_598A6	proc far		; CODE XREF: Weapon_HUDBox_TimerCaseD_59902+Dp

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		xor	di, di
		jmp	short loc_598F6
; ���������������������������������������������������������������������������

loc_598B2:				; CODE XREF: Weapon_HUDBox_TimerCaseC_598A6+53j
		mov	bx, di
		imul	bx, 11h
		cmp	word ptr [bx+si+92h], 0
		jz	short loc_598E9
		mov	bx, di
		imul	bx, 11h
		push	word ptr [bx+si+94h]
		mov	bx, di
		imul	bx, 11h
		mov	bx, [bx+si+92h]
		push	word ptr [bx+4]
		call	ModuleRegistry_Opcode_AE_603DE
		add	sp, 4
		cmp	ax, 1
		jnz	short loc_598E5
		mov	ax, 1
		jmp	short loc_598E7
; ���������������������������������������������������������������������������

loc_598E5:				; CODE XREF: Weapon_HUDBox_TimerCaseC_598A6+38j
		xor	ax, ax

loc_598E7:				; CODE XREF: Weapon_HUDBox_TimerCaseC_598A6+3Dj
		jmp	short loc_598EB
; ���������������������������������������������������������������������������

loc_598E9:				; CODE XREF: Weapon_HUDBox_TimerCaseC_598A6+16j
		mov	al, 0

loc_598EB:				; CODE XREF: Weapon_HUDBox_TimerCaseC_598A6:loc_598E7j
		mov	ah, 0
		or	ax, ax
		jnz	short loc_598F5
		mov	ax, di
		jmp	short loc_598FE
; ���������������������������������������������������������������������������

loc_598F5:				; CODE XREF: Weapon_HUDBox_TimerCaseC_598A6+49j
		inc	di

loc_598F6:				; CODE XREF: Weapon_HUDBox_TimerCaseC_598A6+Aj
		cmp	di, 5
		jl	short loc_598B2
		mov	ax, 0FFFFh

loc_598FE:				; CODE XREF: Weapon_HUDBox_TimerCaseC_598A6+4Dj
		pop	di
		pop	si
		pop	bp
		retf
Weapon_HUDBox_TimerCaseC_598A6	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 113 lignes, NON DÉTAILLÉE — combine Weapon_HUDBox_TimerCaseC_598A6 et les fonctions
; du sous-système minuteur (59FF5/603F0/603CC). Référencée par sub_59B10 et sub_59CFA.
; ==============================================================================================
Weapon_HUDBox_TimerCaseD_59902	proc far		; CODE XREF: Weapon_HUDBox_UpdateGeometryAndTimer_59B10+1CAp
					; Weapon_HUDBox_MasterUpdate_59CFA+1AFp ...

var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= byte ptr  8
arg_4		= dword	ptr  0Ah
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	si
		push	cs
		call	near ptr Weapon_HUDBox_TimerCaseC_598A6
		pop	cx
		mov	dx, ax
		cmp	dx, 0FFFFh
		jnz	short loc_5991D
		jmp	loc_599CF
; ���������������������������������������������������������������������������

loc_5991D:				; CODE XREF: Weapon_HUDBox_TimerCaseD_59902+16j
		imul	ax, 11h
		mov	dx, si
		add	dx, ax
		add	dx, 92h	; '�'
		mov	[bp+var_2], dx
		cmp	[bp+arg_4], 3E8h
		jge	short loc_5994B
		mov	eax, [bp+arg_4]
		mov	ebx, 0Ah
		cdq
		idiv	ebx
		mov	di, 64h	; 'd'
		sub	di, ax
		jmp	short loc_59958
; ���������������������������������������������������������������������������

loc_5994B:				; CODE XREF: Weapon_HUDBox_TimerCaseD_59902+31j
		cmp	[bp+arg_4], 1388h
		jge	short loc_59958
		mov	di, 5

loc_59958:				; CODE XREF: Weapon_HUDBox_TimerCaseD_59902+47j
					; Weapon_HUDBox_TimerCaseD_59902+51j
		or	di, di
		jge	short loc_59960
		xor	ax, ax
		jmp	short loc_59962
; ���������������������������������������������������������������������������

loc_59960:				; CODE XREF: Weapon_HUDBox_TimerCaseD_59902+58j
		mov	ax, di

loc_59962:				; CODE XREF: Weapon_HUDBox_TimerCaseD_59902+5Cj
		mov	[bp+var_4], ax
		cmp	[bp+var_4], 0
		jz	short loc_599CF
		mov	di, [bp+var_2]
		push	0
		mov	al, [bp+arg_2]
		mov	ah, 0
		imul	ax, 0Ah
		mov	dx, si
		add	dx, ax
		add	dx, 6
		push	dx
		push	di
		call	Sequencer_ProcessQueue_59FF5
		add	sp, 6
		mov	ax, [bp+var_4]
		mov	[bp+var_6], ax
		cmp	word ptr [di], 0
		jz	short loc_599A9
		push	0
		push	ax
		push	word ptr [di+2]
		mov	bx, [di]
		push	word ptr [bx+4]
		call	ModuleRegistry_Opcode_B1_603F0
		add	sp, 8
		jmp	short $+2

loc_599A9:				; CODE XREF: Weapon_HUDBox_TimerCaseD_59902+90j
		cmp	word ptr [di], 0
		jz	short loc_599C0
		push	word ptr [di+2]
		mov	bx, [di]
		push	word ptr [bx+4]
		call	ModuleRegistry_Opcode_AA_603CC
		add	sp, 4
		jmp	short $+2

loc_599C0:				; CODE XREF: Weapon_HUDBox_TimerCaseD_59902+AAj
		mov	bx, [bp+var_2]
		mov	al, [bp+arg_2]
		mov	[bx+0Eh], al
		mov	ax, [bp+arg_8]
		mov	[bx+0Fh], ax

loc_599CF:				; CODE XREF: Weapon_HUDBox_TimerCaseD_59902+18j
					; Weapon_HUDBox_TimerCaseD_59902+67j
		pop	di
		pop	si
		leave
		retf
Weapon_HUDBox_TimerCaseD_59902	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 113 lignes, NON DÉTAILLÉE — utilise sub_603F0/sub_59F1D. Référencée par sub_59CFA.
; ==============================================================================================
Weapon_HUDBox_TimerCaseE_599D3	proc far		; CODE XREF: Weapon_HUDBox_MasterUpdate_59CFA+1A0p
					; Weapon_HUDBox_TimerCaseI_5A906+4DP

var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= byte ptr  8
arg_4		= dword	ptr  0Ah
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	loc_59A7D
; ���������������������������������������������������������������������������

loc_599E6:				; CODE XREF: Weapon_HUDBox_TimerCaseE_599D3+B0j
		mov	ax, [bp+var_2]
		imul	ax, 11h
		mov	di, si
		add	di, ax
		add	di, 92h	; '�'
		mov	al, [di+0Eh]
		cmp	al, [bp+arg_2]
		jnz	short loc_59A7A
		mov	ax, [di+0Fh]
		cmp	ax, [bp+arg_8]
		jnz	short loc_59A7A
		cmp	[bp+arg_4], 3E8h
		jge	short loc_59A27
		mov	eax, [bp+arg_4]
		mov	ebx, 0Ah
		cdq
		idiv	ebx
		mov	dx, 64h	; 'd'

loc_59A20:
		sub	dx, ax

loc_59A22:
		mov	[bp+var_4], dx
		jmp	short loc_59A36
; ���������������������������������������������������������������������������

loc_59A27:				; CODE XREF: Weapon_HUDBox_TimerCaseE_599D3+39j
		cmp	[bp+arg_4], 1388h

loc_59A2F:
		jge	short loc_59A36

loc_59A31:
		mov	[bp+var_4], 5

loc_59A36:				; CODE XREF: Weapon_HUDBox_TimerCaseE_599D3+52j
					; Weapon_HUDBox_TimerCaseE_599D3:loc_59A2Fj
		cmp	[bp+var_4], 0
		jge	short loc_59A40
		xor	ax, ax
		jmp	short loc_59A43
; ���������������������������������������������������������������������������

loc_59A40:				; CODE XREF: Weapon_HUDBox_TimerCaseE_599D3+67j
		mov	ax, [bp+var_4]

loc_59A43:				; CODE XREF: Weapon_HUDBox_TimerCaseE_599D3+6Bj
		mov	dx, ax
		or	dx, dx
		jz	short loc_59A6A
		mov	[bp+var_6], dx
		cmp	word ptr [di], 0
		jz	short loc_59A68
		push	0
		push	[bp+var_6]
		push	word ptr [di+2]
		mov	bx, [di]
		push	word ptr [bx+4]
		call	ModuleRegistry_Opcode_B1_603F0
		add	sp, 8
		jmp	short loc_59A7A
; ���������������������������������������������������������������������������

loc_59A68:				; CODE XREF: Weapon_HUDBox_TimerCaseE_599D3+7Cj
		jmp	short loc_59A7A
; ���������������������������������������������������������������������������

loc_59A6A:				; CODE XREF: Weapon_HUDBox_TimerCaseE_599D3+74j
		push	di
		call	Sequencer_AdvanceActiveSlot_59F1D
		pop	cx
		mov	byte ptr [di+0Eh], 0Fh
		mov	word ptr [di+0Fh], 0

loc_59A7A:				; CODE XREF: Weapon_HUDBox_TimerCaseE_599D3+27j
					; Weapon_HUDBox_TimerCaseE_599D3+2Fj ...
		inc	[bp+var_2]

loc_59A7D:				; CODE XREF: Weapon_HUDBox_TimerCaseE_599D3+10j
		cmp	[bp+var_2], 5
		jge	short loc_59A86
		jmp	loc_599E6
; ���������������������������������������������������������������������������

loc_59A86:				; CODE XREF: Weapon_HUDBox_TimerCaseE_599D3+AEj
		pop	di
		pop	si
		leave
		retf
Weapon_HUDBox_TimerCaseE_599D3	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, utilise sub_59F1D. Référencée par sub_59CFA.
; ==============================================================================================
Weapon_HUDBox_TimerCaseF_59A8A	proc far		; CODE XREF: Weapon_HUDBox_MasterUpdate_59CFA:loc_59F13p
					; Weapon_HUDBox_TimerCaseJ_5A95E+1CP

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= byte ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	short loc_59ACD
; ���������������������������������������������������������������������������

loc_59A9C:				; CODE XREF: Weapon_HUDBox_TimerCaseF_59A8A+47j
		mov	ax, [bp+var_2]
		imul	ax, 11h
		mov	di, si
		add	di, ax
		add	di, 92h	; '�'
		mov	al, [di+0Eh]
		cmp	al, [bp+arg_2]
		jnz	short loc_59ACA
		mov	ax, [di+0Fh]
		cmp	ax, [bp+arg_4]
		jnz	short loc_59ACA
		push	di
		call	Sequencer_AdvanceActiveSlot_59F1D
		pop	cx
		mov	byte ptr [di+0Eh], 0Fh
		mov	word ptr [di+0Fh], 0

loc_59ACA:				; CODE XREF: Weapon_HUDBox_TimerCaseF_59A8A+26j
					; Weapon_HUDBox_TimerCaseF_59A8A+2Ej
		inc	[bp+var_2]

loc_59ACD:				; CODE XREF: Weapon_HUDBox_TimerCaseF_59A8A+10j
		cmp	[bp+var_2], 5
		jl	short loc_59A9C
		pop	di
		pop	si
		leave
		retf
Weapon_HUDBox_TimerCaseF_59A8A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, aucun appel externe visible (calcul autonome). Référencée par sub_59B10 et sub_59CFA.
; ==============================================================================================
Weapon_HUDBox_TimerCaseG_59AD7	proc far		; CODE XREF: Weapon_HUDBox_UpdateGeometryAndTimer_59B10+1B4p
					; Weapon_HUDBox_MasterUpdate_59CFA+18Cp ...

arg_0		= word ptr  6
arg_2		= byte ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	cx, [bp+arg_0]
		xor	di, di
		jmp	short loc_59B05
; ���������������������������������������������������������������������������

loc_59AE3:				; CODE XREF: Weapon_HUDBox_TimerCaseG_59AD7+31j
		mov	ax, di
		imul	ax, 11h
		mov	si, cx
		add	si, ax
		add	si, 92h	; '�'
		mov	al, [si+0Eh]
		cmp	al, [bp+arg_2]
		jnz	short loc_59B04
		mov	ax, [si+0Fh]
		cmp	ax, [bp+arg_4]
		jnz	short loc_59B04

loc_59B00:
		mov	al, 1

loc_59B02:
		jmp	short loc_59B0C
; ���������������������������������������������������������������������������

loc_59B04:				; CODE XREF: Weapon_HUDBox_TimerCaseG_59AD7+1Fj
					; Weapon_HUDBox_TimerCaseG_59AD7+27j
		inc	di

loc_59B05:				; CODE XREF: Weapon_HUDBox_TimerCaseG_59AD7+Aj
		cmp	di, 5
		jl	short loc_59AE3
		mov	al, 0

loc_59B0C:				; CODE XREF: Weapon_HUDBox_TimerCaseG_59AD7:loc_59B02j
		pop	di
		pop	si
		pop	bp
		retf
Weapon_HUDBox_TimerCaseG_59AD7	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 239 lignes, NON DÉTAILLÉE — combine dispatch vtable,
; Targeting_ComputeBearingElevation_55B1A (seg116), Weapon_HUDBox_TimerCaseG_59AD7 et
; Weapon_HUDBox_TimerCaseD_59902. Référencée par sub_59CFA. Candidat pour session dédiée
; (probable indicateur clignotant de contre-mesure/alerte sur le HUD).
; ==============================================================================================
Weapon_HUDBox_UpdateGeometryAndTimer_59B10	proc far		; CODE XREF: Weapon_HUDBox_MasterUpdate_59CFA+7Ap

var_62		= dword	ptr -62h
var_5E		= dword	ptr -5Eh
var_5A		= dword	ptr -5Ah
var_56		= dword	ptr -56h
var_52		= dword	ptr -52h
var_4E		= dword	ptr -4Eh
var_4A		= dword	ptr -4Ah
var_46		= dword	ptr -46h
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
var_1A		= word ptr -1Ah
var_16		= word ptr -16h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 62h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	ax, word_72A8F
		mov	[bp+var_2], ax

loc_59B21:
		cmp	ax, word_7087D
		jz	short loc_59B2D
		mov	word_7087D, ax
		jmp	loc_59CF6
; ���������������������������������������������������������������������������

loc_59B2D:				; CODE XREF: Weapon_HUDBox_UpdateGeometryAndTimer_59B10+15j
		cmp	[bp+var_2], 0
		jnz	short loc_59B36
		jmp	loc_59CF6
; ���������������������������������������������������������������������������

loc_59B36:				; CODE XREF: Weapon_HUDBox_UpdateGeometryAndTimer_59B10+21j
		mov	[bp+var_4], 0
		jmp	loc_59CE0
; ���������������������������������������������������������������������������

loc_59B3E:				; CODE XREF: Weapon_HUDBox_UpdateGeometryAndTimer_59B10+1E3j
		mov	di, [bp+var_4]
		push	di
		mov	bx, [di]
		call	dword ptr [bx]
		pop	cx
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		cmp	[bp+var_8], 0
		jnz	short loc_59B57
		jmp	loc_59CE0
; ���������������������������������������������������������������������������

loc_59B57:				; CODE XREF: Weapon_HUDBox_UpdateGeometryAndTimer_59B10+42j
		push	dx
		push	ax
		les	bx, [bp+var_8]
		mov	bx, es:[bx]
		call	dword ptr [bx+8]
		add	sp, 4
		cmp	al, 6
		jz	short loc_59B6C
		jmp	loc_59CE0
; ���������������������������������������������������������������������������

loc_59B6C:				; CODE XREF: Weapon_HUDBox_UpdateGeometryAndTimer_59B10+57j
		push	[bp+var_2]
		mov	bx, [bp+var_2]
		mov	bx, [bx+50h]
		call	dword ptr [bx+1Ch]
		pop	cx
		cmp	ax, di
		jnz	short loc_59B80
		jmp	loc_59CE0
; ���������������������������������������������������������������������������

loc_59B80:				; CODE XREF: Weapon_HUDBox_UpdateGeometryAndTimer_59B10+6Bj
		les	bx, [di+0Ah]
		cmp	byte ptr es:[bx+8], 0
		jnz	short loc_59B8D
		jmp	loc_59CE0
; ���������������������������������������������������������������������������

loc_59B8D:				; CODE XREF: Weapon_HUDBox_UpdateGeometryAndTimer_59B10+78j
		mov	dx, di
		add	dx, 12h
		mov	bx, dx
		mov	eax, [bx]
		mov	[bp+var_26], eax
		mov	eax, [bx+4]
		mov	[bp+var_22], eax
		mov	eax, [bx+8]
		mov	[bp+var_1E], eax
		mov	dx, [bp+var_2]
		add	dx, 14h
		mov	bx, dx
		mov	eax, [bx]
		mov	[bp+var_32], eax
		mov	eax, [bx+4]
		mov	[bp+var_2E], eax
		mov	eax, [bx+8]
		mov	[bp+var_2A], eax
		mov	eax, [bp+var_26]
		mov	[bp+var_3E], eax
		mov	eax, [bp+var_22]
		mov	[bp+var_3A], eax
		mov	eax, [bp+var_1E]
		mov	[bp+var_36], eax
		mov	eax, [bp+var_32]
		sub	[bp+var_3E], eax
		mov	eax, [bp+var_2E]
		sub	[bp+var_3A], eax
		mov	eax, [bp+var_2A]
		sub	[bp+var_36], eax
		push	large [bp+var_36]
		push	large [bp+var_3A]
		push	large [bp+var_3E]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax

loc_59C0F:
		add	sp, 0Ch

loc_59C12:
		mov	[bp+var_10], eax

loc_59C16:
		mov	[bp+var_14], eax
		sar	eax, 8

loc_59C1E:
		mov	[bp+var_C], eax
		cmp	[bp+var_C], 0C8h ; '�'
		jl	short loc_59C2F
		jmp	loc_59CE0
; ���������������������������������������������������������������������������

loc_59C2F:				; CODE XREF: Weapon_HUDBox_UpdateGeometryAndTimer_59B10+11Aj
		mov	eax, [bp+var_26]

loc_59C33:
		mov	[bp+var_4A], eax
		mov	eax, [bp+var_22]
		mov	[bp+var_46], eax
		mov	eax, [bp+var_1E]
		mov	[bp+var_42], eax
		push	di
		push	ss
		lea	ax, [bp+var_56]
		push	ax
		mov	bx, [di]
		call	dword ptr [bx+4Ch]
		add	sp, 6
		mov	eax, [bp+var_56]
		add	[bp+var_4A], eax
		mov	eax, [bp+var_52]
		add	[bp+var_46], eax
		mov	eax, [bp+var_4E]
		add	[bp+var_42], eax
		mov	eax, [bp+var_4A]
		mov	[bp+var_62], eax
		mov	eax, [bp+var_46]
		mov	[bp+var_5E], eax
		mov	eax, [bp+var_42]
		mov	[bp+var_5A], eax
		mov	eax, [bp+var_32]
		sub	[bp+var_62], eax
		mov	eax, [bp+var_2E]
		sub	[bp+var_5E], eax
		mov	eax, [bp+var_2A]
		sub	[bp+var_5A], eax
		lea	ax, [bp+var_3E]
		push	ax
		lea	ax, [bp+var_62]
		push	ax
		push	ss
		lea	ax, [bp+var_1A]
		push	ax
		call	Targeting_ComputeBearingElevation_55B1A
		add	sp, 8
		mov	ax, [bp+var_1A+1]
		mov	[bp+var_16], ax
		cmp	[bp+var_16], 1Eh
		jle	short loc_59CE0
		push	0
		push	0Bh
		push	si
		push	cs
		call	near ptr Weapon_HUDBox_TimerCaseG_59AD7
		add	sp, 6
		mov	ah, 0
		or	ax, ax
		jnz	short loc_59CE0
		push	0
		push	large [bp+var_C]
		push	0Bh
		push	si
		push	cs
		call	near ptr Weapon_HUDBox_TimerCaseD_59902
		add	sp, 0Ah

loc_59CE0:				; CODE XREF: Weapon_HUDBox_UpdateGeometryAndTimer_59B10+2Bj
					; Weapon_HUDBox_UpdateGeometryAndTimer_59B10+44j ...
		lea	ax, [bp+var_4]
		push	ax
		push	59C3h
		call	World_IterateObjects
		add	sp, 4
		or	ax, ax
		jz	short loc_59CF6
		jmp	loc_59B3E
; ���������������������������������������������������������������������������

loc_59CF6:				; CODE XREF: Weapon_HUDBox_UpdateGeometryAndTimer_59B10+1Aj
					; Weapon_HUDBox_UpdateGeometryAndTimer_59B10+23j ...
		pop	di
		pop	si
		leave
		retf
Weapon_HUDBox_UpdateGeometryAndTimer_59B10	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 311 lignes, NON DÉTAILLÉE — la plus grosse fonction du cluster
; Weapon_HUDBox/minuteur : orchestre sub_59B10, sub_599D3, sub_59902, sub_59A8A, sub_59AD7.
; Candidat prioritaire pour session dédiée (probable pilote principal de l'indicateur HUD à
; clignotement synchronisé au minuteur matériel).
; ==============================================================================================
Weapon_HUDBox_MasterUpdate_59CFA	proc far		; CODE XREF: Weapon_HUDBox_FullUpdateCycle_5AB79+18P

var_32		= dword	ptr -32h
var_2E		= dword	ptr -2Eh
var_2A		= dword	ptr -2Ah
var_26		= byte ptr -26h
var_25		= byte ptr -25h
var_24		= word ptr -24h
var_22		= word ptr -22h
var_20		= dword	ptr -20h
var_1C		= dword	ptr -1Ch
var_18		= dword	ptr -18h
var_14		= dword	ptr -14h
var_10		= byte ptr -10h
var_E		= word ptr -0Eh
var_C		= dword	ptr -0Ch
var_8		= word ptr -8
var_5		= byte ptr -5
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 32h
		push	si
		push	di
		mov	si, [bp+arg_0]

loc_59D05:
		mov	[bp+var_4], 0
		jmp	short loc_59D65
; ���������������������������������������������������������������������������

loc_59D0C:				; CODE XREF: Weapon_HUDBox_MasterUpdate_59CFA+6Fj
		mov	ax, [bp+var_4]
		imul	ax, 11h

loc_59D12:
		mov	dx, si
		add	dx, ax
		add	dx, 92h	; '�'
		mov	[bp+var_2], dx
		mov	bx, [bp+var_2]
		cmp	byte ptr [bx+0Eh], 0Fh

loc_59D24:
		jz	short loc_59D62

loc_59D26:
		mov	di, [bp+var_2]
		cmp	word ptr [di], 0
		jz	short loc_59D4C

loc_59D2E:
		push	word ptr [di+2]
		mov	bx, [di]

loc_59D33:
		push	word ptr [bx+4]
		call	ModuleRegistry_Opcode_AE_603DE
		add	sp, 4
		cmp	ax, 2
		jnz	short loc_59D48
		mov	ax, 1
		jmp	short loc_59D4A
; ���������������������������������������������������������������������������

loc_59D48:				; CODE XREF: Weapon_HUDBox_MasterUpdate_59CFA+47j
		xor	ax, ax

loc_59D4A:				; CODE XREF: Weapon_HUDBox_MasterUpdate_59CFA+4Cj
		jmp	short loc_59D4E
; ���������������������������������������������������������������������������

loc_59D4C:				; CODE XREF: Weapon_HUDBox_MasterUpdate_59CFA+32j
		mov	al, 1

loc_59D4E:				; CODE XREF: Weapon_HUDBox_MasterUpdate_59CFA:loc_59D4Aj
		or	al, al
		jz	short loc_59D62
		push	[bp+var_2]
		call	Sequencer_AdvanceActiveSlot_59F1D
		pop	cx
		mov	bx, [bp+var_2]
		mov	byte ptr [bx+0Eh], 0Fh

loc_59D62:				; CODE XREF: Weapon_HUDBox_MasterUpdate_59CFA:loc_59D24j
					; Weapon_HUDBox_MasterUpdate_59CFA+56j
		inc	[bp+var_4]

loc_59D65:				; CODE XREF: Weapon_HUDBox_MasterUpdate_59CFA+10j
		cmp	[bp+var_4], 5
		jl	short loc_59D0C
		cmp	byte_7236C, 0
		jz	short loc_59D78
		push	si
		push	cs
		call	near ptr Weapon_HUDBox_UpdateGeometryAndTimer_59B10
		pop	cx

loc_59D78:				; CODE XREF: Weapon_HUDBox_MasterUpdate_59CFA+76j
		mov	[bp+var_5], 0
		mov	al, byte_7236B
		mov	ah, 0
		or	ax, ax
		jz	short loc_59D88
		jmp	loc_59F03
; ���������������������������������������������������������������������������

loc_59D88:				; CODE XREF: Weapon_HUDBox_MasterUpdate_59CFA+89j
		cmp	byte_7236C, 0
		jnz	short loc_59D92
		jmp	loc_59F03
; ���������������������������������������������������������������������������

loc_59D92:				; CODE XREF: Weapon_HUDBox_MasterUpdate_59CFA+93j
		mov	ax, word_72A8F
		mov	[bp+var_8], ax
		cmp	[bp+var_8], 0
		jnz	short loc_59DA1
		jmp	loc_59F07
; ���������������������������������������������������������������������������

loc_59DA1:				; CODE XREF: Weapon_HUDBox_MasterUpdate_59CFA+A2j
		push	ax
		mov	bx, [bp+var_8]
		mov	bx, [bx+50h]
		call	dword ptr [bx+1Ch]
		pop	cx
		mov	di, ax
		or	di, di
		jnz	short loc_59DB5
		jmp	loc_59F03
; ���������������������������������������������������������������������������

loc_59DB5:				; CODE XREF: Weapon_HUDBox_MasterUpdate_59CFA+B6j
		push	ax
		mov	bx, [di]
		call	dword ptr [bx]
		pop	cx
		or	ax, dx
		jnz	short loc_59DC2
		jmp	loc_59F03
; ���������������������������������������������������������������������������

loc_59DC2:				; CODE XREF: Weapon_HUDBox_MasterUpdate_59CFA+C3j
		push	di
		mov	bx, [di]
		call	dword ptr [bx]
		pop	cx
		mov	word ptr [bp+var_C+2], dx
		mov	word ptr [bp+var_C], ax
		push	dx
		push	ax
		les	bx, [bp+var_C]
		mov	bx, es:[bx]
		call	dword ptr [bx+8]
		add	sp, 4
		cmp	al, 6
		jz	short loc_59DE3
		jmp	loc_59F03
; ���������������������������������������������������������������������������

loc_59DE3:				; CODE XREF: Weapon_HUDBox_MasterUpdate_59CFA+E4j
		mov	[bp+var_E], di
		mov	bx, [bp+var_E]
		cmp	dword ptr [bx+55h], 0
		jz	short loc_59E02
		push	large dword ptr	[bx+55h]
		les	bx, [bx+55h]
		mov	bx, es:[bx]
		call	dword ptr [bx+8]
		add	sp, 4
		jmp	short loc_59E06
; ���������������������������������������������������������������������������

loc_59E02:				; CODE XREF: Weapon_HUDBox_MasterUpdate_59CFA+F4j
		xor	dx, dx
		xor	ax, ax

loc_59E06:				; CODE XREF: Weapon_HUDBox_MasterUpdate_59CFA+106j
		mov	word ptr [bp+var_14+2],	dx
		mov	word ptr [bp+var_14], ax

loc_59E0C:
		les	bx, [bp+var_14]

loc_59E0F:
		mov	al, es:[bx+1Eh]

loc_59E13:
		mov	[bp+var_10], al
		cmp	[bp+var_10], 1
		jge	short loc_59E1F
		jmp	loc_59F03
; ���������������������������������������������������������������������������

loc_59E1F:				; CODE XREF: Weapon_HUDBox_MasterUpdate_59CFA+120j
		mov	dx, [bp+var_8]
		add	dx, 14h
		mov	bx, dx
		mov	eax, [bx]
		mov	[bp+var_32], eax
		mov	eax, [bx+4]
		mov	[bp+var_2E], eax
		mov	eax, [bx+8]
		mov	[bp+var_2A], eax
		add	di, 12h
		mov	eax, [di]
		sub	[bp+var_32], eax
		mov	eax, [di+4]
		sub	[bp+var_2E], eax
		mov	eax, [di+8]
		sub	[bp+var_2A], eax
		push	large [bp+var_2A]
		push	large [bp+var_2E]
		push	large [bp+var_32]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_1C], eax
		mov	[bp+var_20], eax
		sar	eax, 8
		mov	[bp+var_18], eax
		push	0
		push	0Dh
		push	si
		push	cs
		call	near ptr Weapon_HUDBox_TimerCaseG_59AD7
		add	sp, 6
		or	al, al
		jz	short loc_59E9F
		push	0
		push	large [bp+var_18]
		push	0Dh
		push	si
		push	cs
		call	near ptr Weapon_HUDBox_TimerCaseE_599D3
		jmp	short loc_59EAC
; ���������������������������������������������������������������������������

loc_59E9F:				; CODE XREF: Weapon_HUDBox_MasterUpdate_59CFA+194j
		push	0
		push	large [bp+var_18]
		push	0Dh
		push	si
		push	cs
		call	near ptr Weapon_HUDBox_TimerCaseD_59902

loc_59EAC:				; CODE XREF: Weapon_HUDBox_MasterUpdate_59CFA+1A3j
		add	sp, 0Ah
		mov	[bp+var_22], 4000h
		mov	al, [bp+var_10]
		cbw
		add	ax, 0FFFBh
		mov	[bp+var_24], ax
		imul	ax, 600h
		add	[bp+var_22], ax
		mov	ax, [bp+var_22]
		cmp	ax, word_7087F
		jz	short loc_59F07
		mov	al, byte ptr [bp+var_22]
		and	al, 0FFh
		mov	[bp+var_25], al
		mov	ax, [bp+var_22]
		shr	ax, 8
		mov	[bp+var_26], al
		mov	ah, 0
		push	ax
		mov	al, [bp+var_25]
		mov	ah, 0
		push	ax
		push	0E1h ; '�'
		mov	bx, [si+4]
		push	word ptr [bx+4]
		call	ModuleRegistry_Opcode_UNKNOWN_60420
		add	sp, 8
		mov	ax, [bp+var_22]
		mov	word_7087F, ax
		jmp	short loc_59F07
; ���������������������������������������������������������������������������
		jmp	short $+2

loc_59F03:				; CODE XREF: Weapon_HUDBox_MasterUpdate_59CFA+8Bj
					; Weapon_HUDBox_MasterUpdate_59CFA+95j ...
		mov	[bp+var_5], 1

loc_59F07:				; CODE XREF: Weapon_HUDBox_MasterUpdate_59CFA+A4j
					; Weapon_HUDBox_MasterUpdate_59CFA+1D2j ...
		cmp	[bp+var_5], 0
		jz	short loc_59F19
		push	0

loc_59F0F:
		push	0Dh
		push	si
		push	cs

loc_59F13:
		call	near ptr Weapon_HUDBox_TimerCaseF_59A8A
		add	sp, 6

loc_59F19:				; CODE XREF: Weapon_HUDBox_MasterUpdate_59CFA+211j
		pop	di
		pop	si
		leave
		retf
Weapon_HUDBox_MasterUpdate_59CFA	endp

seg122		ends
