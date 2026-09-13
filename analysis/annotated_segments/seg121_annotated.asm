seg121		segment	byte public 'CODE' use16
		assume cs:seg121
		;org 5
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, dispatch vtable (2 appels), référencée par sub_59302 — élément de dessin pour un
; réticule/boîte de ciblage HUD.
; ==============================================================================================
Weapon_HUDBox_DrawElementA_58ED5	proc far		; CODE XREF: Weapon_HUDBox_Main_59302+68p

var_C		= word ptr -0Ch
var_A		= dword	ptr -0Ah
var_6		= word ptr -6
var_4		= word ptr -4
var_1		= byte ptr -1
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si

loc_58EDC:				; DATA XREF: seg216:off_6A26Eo
		mov	ax, [bp+arg_0]
		mov	[bp+var_1], 0
		mov	ax, word_722E6
		mov	[bp+var_4], ax
		mov	[bp+var_6], 0
		jmp	short loc_58F29
; ���������������������������������������������������������������������������

loc_58EF0:				; CODE XREF: Weapon_HUDBox_DrawElementA_58ED5+65j
		mov	si, [bp+var_6]
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		pop	cx
		mov	word ptr [bp+var_A+2], dx
		mov	word ptr [bp+var_A], ax
		cmp	[bp+var_A], 0
		jz	short loc_58F29
		push	dx
		push	ax
		les	bx, [bp+var_A]
		mov	bx, es:[bx]
		call	dword ptr [bx+8]
		add	sp, 4
		cmp	al, 8
		jnz	short loc_58F29
		mov	ax, [si+55h]
		mov	[bp+var_C], ax
		cmp	ax, [bp+var_4]

loc_58F21:
		jnz	short loc_58F29
		mov	[bp+var_1], 1
		jmp	short loc_58F3C
; ���������������������������������������������������������������������������

loc_58F29:				; CODE XREF: Weapon_HUDBox_DrawElementA_58ED5+19j
					; Weapon_HUDBox_DrawElementA_58ED5+2Fj ...
		lea	ax, [bp+var_6]
		push	ax
		push	59C3h
		call	World_IterateObjects
		add	sp, 4
		or	ax, ax
		jnz	short loc_58EF0

loc_58F3C:				; CODE XREF: Weapon_HUDBox_DrawElementA_58ED5+52j
		mov	al, [bp+var_1]
		pop	si
		leave
		retf
Weapon_HUDBox_DrawElementA_58ED5	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 143 lignes, NON DÉTAILLÉE — combine UI_ApplyVectorLength_55B04,
; Targeting_ComputeBearingElevation_55B1A (seg116), dispatch vtable et
; Math_ApplyRotationHelperA_58768 — calcul géométrique pour l'affichage d'une boîte de ciblage
; HUD. Référencée par sub_59061.
; ==============================================================================================
Weapon_HUDBox_ComputeGeometry_58F42	proc far		; CODE XREF: Weapon_HUDBox_DrawElementB_59061+55p

var_3A		= dword	ptr -3Ah
var_36		= dword	ptr -36h
var_32		= dword	ptr -32h
var_2E		= dword	ptr -2Eh
var_2A		= dword	ptr -2Ah
var_26		= dword	ptr -26h
var_22		= dword	ptr -22h
var_1E		= dword	ptr -1Eh
var_1A		= dword	ptr -1Ah
var_16		= word ptr -16h
var_12		= dword	ptr -12h
var_E		= dword	ptr -0Eh
var_A		= dword	ptr -0Ah
var_6		= dword	ptr -6
var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 3Ah
		push	si
		push	di
		mov	bx, [bp+arg_0]
		mov	[bp+var_1], 0
		mov	si, [bp+arg_4]
		add	si, 12h
		mov	di, [bp+arg_2]
		add	di, 12h
		mov	eax, [si]
		sub	eax, [di]
		mov	[bp+var_2E], eax
		mov	eax, [si+4]
		sub	eax, [di+4]
		mov	[bp+var_2A], eax
		mov	eax, [si+8]
		sub	eax, [di+8]
		mov	[bp+var_26], eax
		mov	eax, [bp+var_2E]
		mov	[bp+var_22], eax
		mov	eax, [bp+var_2A]
		mov	[bp+var_1E], eax
		mov	eax, [bp+var_26]
		mov	[bp+var_1A], eax
		push	eax
		push	large [bp+var_1E]
		push	large [bp+var_22]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_A], eax
		mov	[bp+var_E], eax
		mov	eax, [bp+var_E]
		mov	edx, dword_7044C
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_12], eax
		mov	eax, [bp+var_12]
		mov	[bp+var_6], eax
		sar	eax, 8
		cmp	eax, 0DACh
		jg	short loc_5905A
		lea	ax, [bp+var_22]
		push	ax
		call	UI_ApplyVectorLength_55B04
		pop	cx
		push	[bp+arg_2]
		mov	bx, [bp+arg_2]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch
		mov	si, ax
		mov	eax, [si]
		mov	[bp+var_3A], eax

loc_59000:
		mov	eax, [si+4]

loc_59004:
		mov	[bp+var_36], eax
		mov	eax, [si+8]

loc_5900C:
		mov	[bp+var_32], eax

loc_59010:
		lea	ax, [bp+var_22]
		push	ax

loc_59014:
		lea	ax, [bp+var_3A]

loc_59017:
		push	ax
		push	ss
		lea	ax, [bp+var_16]
		push	ax
		call	Targeting_ComputeBearingElevation_55B1A

loc_59022:
		add	sp, 8
		cmp	[bp+var_16+1], 2Dh ; '-'
		jge	short loc_5905A
		push	[bp+arg_4]
		mov	bx, [bp+arg_4]
		mov	bx, [bx]

loc_59033:
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax
		lea	ax, [bp+var_22]
		push	ax
		call	Math_ApplyRotationHelperA_58768
		add	sp, 4
		cmp	[bp+var_1E], 0
		jge	short loc_59050
		mov	ax, 1
		jmp	short loc_59052
; ���������������������������������������������������������������������������

loc_59050:				; CODE XREF: Weapon_HUDBox_ComputeGeometry_58F42+107j
		xor	ax, ax

loc_59052:				; CODE XREF: Weapon_HUDBox_ComputeGeometry_58F42+10Cj
		or	al, al
		jz	short loc_5905A
		mov	[bp+var_1], 1

loc_5905A:				; CODE XREF: Weapon_HUDBox_ComputeGeometry_58F42+9Aj
					; Weapon_HUDBox_ComputeGeometry_58F42+E7j ...
		mov	al, [bp+var_1]
		pop	di
		pop	si
		leave
		retf
Weapon_HUDBox_ComputeGeometry_58F42	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, dispatch vtable + appel à Weapon_HUDBox_ComputeGeometry_58F42. Référencée par
; sub_59302.
; ==============================================================================================
Weapon_HUDBox_DrawElementB_59061	proc far		; CODE XREF: Weapon_HUDBox_Main_59302+89p

var_A		= dword	ptr -0Ah
var_6		= word ptr -6
var_4		= word ptr -4
var_1		= byte ptr -1
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_1], 0
		mov	ax, word_722E6
		mov	[bp+var_4], ax
		mov	[bp+var_6], 0
		jmp	short loc_590C6
; ���������������������������������������������������������������������������

loc_5907D:				; CODE XREF: Weapon_HUDBox_DrawElementB_59061+76j
		mov	di, [bp+var_6]
		push	di
		mov	bx, [di]
		call	dword ptr [bx]
		pop	cx
		mov	word ptr [bp+var_A+2], dx
		mov	word ptr [bp+var_A], ax
		cmp	[bp+var_A], 0
		jz	short loc_590C6
		push	dx
		push	ax
		les	bx, [bp+var_A]
		mov	bx, es:[bx]
		call	dword ptr [bx+8]
		add	sp, 4
		cmp	al, 6
		jnz	short loc_590C6
		cmp	di, [bp+var_4]
		jz	short loc_590C6
		cmp	byte ptr [di+50h], 0FFh
		jnz	short loc_590C6
		push	di
		push	[bp+var_4]
		push	si
		push	cs
		call	near ptr Weapon_HUDBox_ComputeGeometry_58F42
		add	sp, 6
		or	al, al
		jz	short loc_590C6
		mov	[bp+var_1], 1
		jmp	short loc_590D9
; ���������������������������������������������������������������������������

loc_590C6:				; CODE XREF: Weapon_HUDBox_DrawElementB_59061+1Aj
					; Weapon_HUDBox_DrawElementB_59061+30j ...
		lea	ax, [bp+var_6]
		push	ax
		push	59C3h
		call	World_IterateObjects
		add	sp, 4
		or	ax, ax
		jnz	short loc_5907D

loc_590D9:				; CODE XREF: Weapon_HUDBox_DrawElementB_59061+63j
		mov	al, [bp+var_1]
		pop	di
		pop	si
		leave
		retf
Weapon_HUDBox_DrawElementB_59061	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 190 lignes, NON DÉTAILLÉE — dispatch vtable multiple, longueur vectorielle
; (sub_5828E). Référencée par sub_5923A.
; ==============================================================================================
Weapon_HUDBox_DrawElementC_590E0	proc far		; CODE XREF: Weapon_HUDBox_UpdateAndRender_5923A+21p
					; Weapon_HUDBox_Main_59302+4Ep ...

var_24		= dword	ptr -24h
var_20		= dword	ptr -20h
var_1C		= dword	ptr -1Ch
var_18		= dword	ptr -18h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= byte ptr -0Ch
var_A		= dword	ptr -0Ah
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= byte ptr -2
var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 24h
		push	si
		push	di
		mov	ax, [bp+arg_0]
		mov	[bp+var_1], 0
		mov	[bp+var_2], 0
		mov	[bp+var_4], 0
		jmp	loc_59204
; ���������������������������������������������������������������������������

loc_590FB:				; CODE XREF: Weapon_HUDBox_DrawElementC_590E0+140j
		mov	si, [bp+var_4]
		cmp	si, [bp+arg_2]
		jnz	short loc_59106
		jmp	loc_59204
; ���������������������������������������������������������������������������

loc_59106:				; CODE XREF: Weapon_HUDBox_DrawElementC_590E0+21j
		push	si

loc_59107:
		mov	bx, [si]
		call	dword ptr [bx]
		pop	cx
		mov	word ptr [bp+var_A+2], dx

loc_5910F:
		mov	word ptr [bp+var_A], ax
		cmp	[bp+var_A], 0
		jnz	short loc_5911C
		jmp	loc_591FB	; default
; ���������������������������������������������������������������������������

loc_5911C:				; CODE XREF: Weapon_HUDBox_DrawElementC_590E0+37j
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		pop	cx

loc_59122:
		or	ax, dx
		jz	short loc_5912F
		push	si

loc_59127:
		mov	bx, [si]
		call	dword ptr [bx+34h]
		pop	cx

loc_5912D:
		jmp	short loc_59131
; ���������������������������������������������������������������������������

loc_5912F:				; CODE XREF: Weapon_HUDBox_DrawElementC_590E0+44j
		mov	al, 17h

loc_59131:				; CODE XREF: Weapon_HUDBox_DrawElementC_590E0:loc_5912Dj
		mov	[bp+var_C], al
		mov	ah, 0
		mov	[bp+var_6], ax
		mov	cx, 4		; switch 4 cases
		mov	bx, offset word_5922A

loc_5913F:				; CODE XREF: Weapon_HUDBox_DrawElementC_590E0+6Aj
		mov	ax, cs:[bx]
		cmp	ax, [bp+var_6]
		jz	short loc_5914F
		add	bx, 2
		loop	loc_5913F
		jmp	loc_591FB	; default
; ���������������������������������������������������������������������������

loc_5914F:				; CODE XREF: Weapon_HUDBox_DrawElementC_590E0+65j
		jmp	word ptr cs:[bx+8] ; switch jump

loc_59153:				; DATA XREF: seg121:0362o
		cmp	[bp+var_C], 6	; case 0x6
		jnz	short loc_59177
		push	word ptr [si+51h]
		mov	bx, [si+51h]
		mov	bx, [bx]
		call	dword ptr [bx+48h]
		pop	cx
		mov	bx, ax
		mov	al, [bx+75h]
		shr	ax, 5
		and	ax, 1
		or	al, al
		jz	short loc_59177
		jmp	loc_591FB	; default
; ���������������������������������������������������������������������������

loc_59177:				; CODE XREF: Weapon_HUDBox_DrawElementC_590E0+77j
					; Weapon_HUDBox_DrawElementC_590E0+92j
		mov	di, si
		cmp	byte ptr [di+50h], 0FFh
		jnz	short loc_591FB	; default
		mov	si, word_722E6
		add	si, 12h
		mov	eax, [si]
		mov	[bp+var_24], eax
		mov	eax, [si+4]
		mov	[bp+var_20], eax
		mov	eax, [si+8]
		mov	[bp+var_1C], eax
		mov	si, di
		add	si, 12h
		mov	eax, [si]
		sub	[bp+var_24], eax
		mov	eax, [si+4]
		sub	[bp+var_20], eax
		mov	eax, [si+8]
		sub	[bp+var_1C], eax
		push	large [bp+var_1C]
		push	large [bp+var_20]
		push	large [bp+var_24]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_14], eax
		mov	[bp+var_18], eax
		sar	eax, 8
		mov	[bp+var_10], eax
		cmp	[bp+var_10], 4858h
		jge	short loc_591FB	; default
		cmp	[bp+var_C], 6
		jnz	short loc_591F7
		or	[bp+var_1], 1
		jmp	short loc_591FB	; default
; ���������������������������������������������������������������������������

loc_591F7:				; CODE XREF: Weapon_HUDBox_DrawElementC_590E0+10Fj
		or	[bp+var_1], 2

loc_591FB:				; CODE XREF: Weapon_HUDBox_DrawElementC_590E0+39j
					; Weapon_HUDBox_DrawElementC_590E0+6Cj ...
		cmp	[bp+var_1], 3	; default
		jnz	short loc_59204

loc_59201:
		inc	[bp+var_2]

loc_59204:				; CODE XREF: Weapon_HUDBox_DrawElementC_590E0+18j
					; Weapon_HUDBox_DrawElementC_590E0+23j ...
		lea	ax, [bp+var_4]
		push	ax
		push	59C3h

loc_5920B:
		call	World_IterateObjects
		add	sp, 4
		or	ax, ax
		jz	short loc_59223
		mov	al, [bp+var_2]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_59223
		jmp	loc_590FB
; ���������������������������������������������������������������������������

loc_59223:				; CODE XREF: Weapon_HUDBox_DrawElementC_590E0+135j
					; Weapon_HUDBox_DrawElementC_590E0+13Ej
		mov	al, [bp+var_1]
		pop	di
		pop	si
		leave
		retf
Weapon_HUDBox_DrawElementC_590E0	endp

; ���������������������������������������������������������������������������
word_5922A	dw	6,   13h,   14h,   15h ; DATA XREF: Weapon_HUDBox_DrawElementC_590E0+5Co
					; value	table for switch statement
		dw offset loc_59153	; jump table for switch	statement
		dw offset loc_59153
		dw offset loc_59153
		dw offset loc_59153

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, orchestre Weapon_HUDBox_DrawElementC_590E0, exécute une expression via
; Expr_VM_Execute_51E7E (seg114) — confirme le lien entre le cluster HUD armement et la VM
; d'expression. Référencée par sub_59302.
; ==============================================================================================
Weapon_HUDBox_UpdateAndRender_5923A	proc far		; CODE XREF: Weapon_HUDBox_Main_59302+FDp
					; Weapon_HUDBox_UpdateAndRenderVariant_5AA49+1CP

var_4		= byte ptr -4
var_3		= byte ptr -3
var_2		= byte ptr -2
var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= byte ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	ax, [bp+arg_0]
		mov	[bp+var_1], 0
		mov	di, 0FFFFh
		mov	[bp+var_2], 0
		cmp	[bp+arg_2], 0
		jz	short loc_5928E
		push	[bp+arg_4]
		push	ax
		push	cs
		call	near ptr Weapon_HUDBox_DrawElementC_590E0
		add	sp, 4
		mov	dl, al
		or	dl, dl
		jz	short loc_59287
		mov	al, byte_7086A
		and	al, 1
		mov	[bp+var_3], al
		mov	al, dl
		and	al, 1
		mov	[bp+var_4], al
		cmp	[bp+var_3], 0
		jz	short loc_59292
		mov	ah, 0
		or	ax, ax
		jnz	short loc_59292
		mov	di, 13h
		jmp	short loc_59292
; ���������������������������������������������������������������������������

loc_59287:				; CODE XREF: Weapon_HUDBox_UpdateAndRender_5923A+2Bj
		cmp	byte_7086A, 0
		jz	short loc_59292

loc_5928E:				; CODE XREF: Weapon_HUDBox_UpdateAndRender_5923A+1Aj
		mov	[bp+var_2], 1

loc_59292:				; CODE XREF: Weapon_HUDBox_UpdateAndRender_5923A+40j
					; Weapon_HUDBox_UpdateAndRender_5923A+46j ...
		cmp	[bp+var_2], 0
		jz	short loc_592EE
		mov	si, word_706A0
		cmp	word ptr [si+4Eh], 0
		jz	short loc_592BD
		push	large 0
		mov	bx, [si+4Eh]
		push	large dword ptr	[bx+10h]
		mov	ax, [bx+2]
		add	ax, 40h	; '@'
		push	ax
		call	Expr_VM_Execute_51E7E
		add	sp, 0Ah
		jmp	short $+2

loc_592BD:				; CODE XREF: Weapon_HUDBox_UpdateAndRender_5923A+66j
		mov	al, [si+0A1h]
		mov	[bp+var_3], al
		cmp	[bp+var_3], 0
		jz	short loc_592DF
		mov	ax, si
		add	ax, 68h	; 'h'
		push	ax
		call	Parser_LookaheadPattern
		pop	cx
		or	al, al
		jz	short loc_592DF
		mov	di, 0Ch
		jmp	short loc_592EE
; ���������������������������������������������������������������������������

loc_592DF:				; CODE XREF: Weapon_HUDBox_UpdateAndRender_5923A+8Ej
					; Weapon_HUDBox_UpdateAndRender_5923A+9Ej
		cmp	byte_70869, 0
		jz	short loc_592EE
		mov	di, 0Dh
		mov	byte_70869, 0

loc_592EE:				; CODE XREF: Weapon_HUDBox_UpdateAndRender_5923A+5Cj
					; Weapon_HUDBox_UpdateAndRender_5923A+A3j ...
		cmp	di, 0FFFFh
		jz	short loc_592FB
		mov	word_70859, di
		mov	[bp+var_1], 1

loc_592FB:				; CODE XREF: Weapon_HUDBox_UpdateAndRender_5923A+B7j
		mov	al, [bp+var_1]
		pop	di
		pop	si
		leave
		retf
Weapon_HUDBox_UpdateAndRender_5923A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, point d'entrée orchestrant tout le cluster Weapon_HUDBox (58ED5/590E0/59061/5923A) +
; sub_43CDC/sub_43D0F (zone armement/ciblage, proche de WeaponStation_ResolveStateA_40A33 et
; Targeting_SelectAndPrioritize_43107). Référencée par sub_5AA02.
; ==============================================================================================
Weapon_HUDBox_Main_59302	proc far		; CODE XREF: Weapon_HUDBox_InstantiateInstance_5AA02+EP
					; Weapon_HUDBox_FullUpdateCycle_5AB79+50P

var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= dword	ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		push	si
		push	di

loc_5930A:
		mov	si, [bp+arg_0]
		mov	di, 0FFFFh
		cmp	byte_6E4B8, 0
		jz	short loc_5931A
		jmp	loc_59405
; ���������������������������������������������������������������������������

loc_5931A:				; CODE XREF: Weapon_HUDBox_Main_59302+13j
		cmp	byte_6E4B4, 0
		jz	short loc_59324
		jmp	loc_59405
; ���������������������������������������������������������������������������

loc_59324:				; CODE XREF: Weapon_HUDBox_Main_59302+1Dj
		cmp	byte_72A8E, 0Bh
		jnz	short loc_5932E
		jmp	loc_59405
; ���������������������������������������������������������������������������

loc_5932E:				; CODE XREF: Weapon_HUDBox_Main_59302+27j
		cmp	byte_72C90, 14h
		jnz	short loc_59338
		jmp	loc_59405
; ���������������������������������������������������������������������������

loc_59338:				; CODE XREF: Weapon_HUDBox_Main_59302+31j
		mov	ax, word_722E6
		mov	[bp+var_2], ax
		mov	al, byte_72C90
		mov	ah, 0
		cmp	ax, word_70859
		jz	short loc_5934C
		jmp	loc_59405
; ���������������������������������������������������������������������������

loc_5934C:				; CODE XREF: Weapon_HUDBox_Main_59302+45j
		push	0
		push	si
		push	cs
		call	near ptr Weapon_HUDBox_DrawElementC_590E0
		add	sp, 4
		mov	byte_7086A, al
		cmp	byte_7086A, 0
		jnz	short loc_59363
		jmp	loc_593F9
; ���������������������������������������������������������������������������

loc_59363:				; CODE XREF: Weapon_HUDBox_Main_59302+5Cj
		mov	byte_70869, 1
		push	si
		push	cs
		call	near ptr Weapon_HUDBox_DrawElementA_58ED5
		pop	cx
		or	al, al
		jz	short loc_59377

loc_59372:				; CODE XREF: Weapon_HUDBox_Main_59302+85j
		mov	di, 9
		jmp	short loc_593EE
; ���������������������������������������������������������������������������

loc_59377:				; CODE XREF: Weapon_HUDBox_Main_59302+6Ej
		cmp	word_722EE, 0
		jz	short loc_59383
		mov	ax, 1
		jmp	short loc_59385
; ���������������������������������������������������������������������������

loc_59383:				; CODE XREF: Weapon_HUDBox_Main_59302+7Aj
		xor	ax, ax

loc_59385:				; CODE XREF: Weapon_HUDBox_Main_59302+7Fj
		or	al, al
		jnz	short loc_59372
		push	si
		push	cs
		call	near ptr Weapon_HUDBox_DrawElementB_59061
		pop	cx
		or	al, al
		jz	short loc_59398
		mov	di, 5
		jmp	short loc_593EE
; ���������������������������������������������������������������������������

loc_59398:				; CODE XREF: Weapon_HUDBox_Main_59302+8Fj
		mov	bx, [bp+var_2]
		mov	eax, [bx+5Eh]
		mov	[bp+var_6], eax
		push	large [bp+var_6]
		call	Roster_SumAttributeA
		add	sp, 4
		mov	[bp+var_8], ax
		push	large [bp+var_6]
		call	Roster_SumAttributeB
		add	sp, 4
		mov	[bp+var_A], ax
		imul	ax, 64h
		xor	dx, dx
		div	[bp+var_8]
		mov	dx, ax
		cmp	dx, 4Bh	; 'K'
		jb	short loc_593D5
		mov	di, 7
		jmp	short loc_593EE
; ���������������������������������������������������������������������������

loc_593D5:				; CODE XREF: Weapon_HUDBox_Main_59302+CCj
		cmp	dx, 23h	; '#'
		jb	short loc_593DF
		mov	di, 6
		jmp	short loc_593EE
; ���������������������������������������������������������������������������

loc_593DF:				; CODE XREF: Weapon_HUDBox_Main_59302+D6j
		test	byte_7086A, 1
		jz	short loc_593EB
		mov	di, 4
		jmp	short loc_593EE
; ���������������������������������������������������������������������������

loc_593EB:				; CODE XREF: Weapon_HUDBox_Main_59302+E2j
		mov	di, 13h

loc_593EE:				; CODE XREF: Weapon_HUDBox_Main_59302+73j
					; Weapon_HUDBox_Main_59302+94j ...
		cmp	di, 0FFFFh
		jz	short loc_59405
		mov	word_70859, di
		jmp	short loc_59405
; ���������������������������������������������������������������������������

loc_593F9:				; CODE XREF: Weapon_HUDBox_Main_59302+5Ej
		push	0
		push	0
		push	si
		push	cs
		call	near ptr Weapon_HUDBox_UpdateAndRender_5923A

loc_59402:
		add	sp, 6

loc_59405:				; CODE XREF: Weapon_HUDBox_Main_59302+15j
					; Weapon_HUDBox_Main_59302+1Fj ...
		mov	ax, di
		pop	di

loc_59408:
		pop	si
		leave

locret_5940A:
		retf
Weapon_HUDBox_Main_59302	endp

; ���������������������������������������������������������������������������

; ==============================================================================================
; ⭐ far, référencée comme donnée (table d'ISR) depuis sub_AA810 — gestionnaire d'interruption
; matérielle : envoie l'EOI au contrôleur 8259A (out 20h,al) puis dispatche sur 4 cas
; (byte_70858) vers Interrupt_TimerDispatch_59436. Probable minuteur matériel pilotant
; l'animation/séquencement (musique ou effets de transition).
; ==============================================================================================
Interrupt_TimerISR_5940B:				; DATA XREF: AudioQueue_RegisterTickModule_AA810+Do
		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si

loc_59412:
		mov	al, 20h	; ' '
		out	20h, al		; Interrupt controller,	8259A.

loc_59416:
		cmp	word_70859, 0FFFFh
		jnz	short loc_59420
		jmp	loc_595B7
; ���������������������������������������������������������������������������

loc_59420:				; CODE XREF: seg121:054Bj
		mov	al, byte_70858

loc_59423:
		mov	ah, 0

loc_59425:
		mov	bx, ax
		cmp	bx, 3		; switch 4 cases
		jbe	short loc_5942F
		jmp	loc_595B2	; default
; ���������������������������������������������������������������������������

loc_5942F:				; CODE XREF: seg121:055Aj
		shl	bx, 1
		jmp	cs:off_595BA[bx] ; switch jump

; ==============================================================================================
; ⚠️ far, 234 lignes, NON DÉTAILLÉE — table de saut à plusieurs cas (off_595BA) appelée depuis
; Interrupt_TimerISR_5940B ; appelle des fonctions non encore documentées
; (sub_59FF5/603CC/60402/603DE, probablement définies dans un segment suivant). Candidat pour
; session dédiée en lien avec le minuteur matériel.
; ==============================================================================================
Interrupt_TimerDispatch_59436:				; DATA XREF: seg121:off_595BAo
		mov	ax, 4700h	; case 0x0
		mov	dx, word_709D0
		int	67h		;  - LIM EMS - SAVE MAPPING CONTEXT
					; DX = handle
					; Return: AH = status
		mov	al, byte ptr word_70859
		mov	byte_72C90, al
		mov	ah, 0
		mov	[bp-2],	ax
		mov	si, 5BE3h
		push	0
		imul	ax, 0Ch
		mov	dx, word_70854
		add	dx, ax
		push	dx
		push	si
		call	Sequencer_ProcessQueue_59FF5
		add	sp, 6
		cmp	word ptr [si], 0
		jz	short loc_59479
		push	word ptr [si+2]
		mov	bx, [si]
		push	word ptr [bx+4]
		call	ModuleRegistry_Opcode_AA_603CC
		add	sp, 4
		jmp	short $+2

loc_59479:				; CODE XREF: seg121:0595j
		mov	byte_72CA1, 1

loc_5947E:				; CODE XREF: seg121:06DFj
		mov	byte_70858, 1

loc_59483:				; CODE XREF: seg121:06A0j
		mov	ax, 4800h
		mov	dx, word_709D0
		int	67h		;  - LIM EMS - RESTORE MAPPING CONTEXT
					; DX = handle
					; Return: AH = status
		jmp	loc_595B7
; ���������������������������������������������������������������������������

loc_5948F:				; CODE XREF: seg121:0561j
					; DATA XREF: seg121:off_595BAo
		mov	al, byte_72C90	; case 0x1
		mov	ah, 0
		cmp	ax, word_70859
		jz	short loc_594C3
		cmp	word_72C93, 0
		jz	short loc_594B6
		push	word_72C95
		mov	bx, word_72C93
		push	word ptr [bx+4]
		call	ModuleRegistry_Opcode_UNKNOWN_60402
		add	sp, 4
		jmp	short loc_594B8
; ���������������������������������������������������������������������������

loc_594B6:				; CODE XREF: seg121:05CFj
		xor	ax, ax

loc_594B8:				; CODE XREF: seg121:05E4j
		mov	word_72C91, ax
		mov	byte_70858, 2
		jmp	loc_595B7
; ���������������������������������������������������������������������������

loc_594C3:				; CODE XREF: seg121:05C8j
		cmp	word_72C93, 0
		jz	short loc_594EB
		push	word_72C95
		mov	bx, word_72C93
		push	word ptr [bx+4]
		call	ModuleRegistry_Opcode_AE_603DE
		add	sp, 4
		cmp	ax, 2
		jnz	short loc_594E7
		mov	ax, 1
		jmp	short loc_594E9
; ���������������������������������������������������������������������������

loc_594E7:				; CODE XREF: seg121:0610j
		xor	ax, ax

loc_594E9:				; CODE XREF: seg121:0615j
		jmp	short loc_594ED
; ���������������������������������������������������������������������������

loc_594EB:				; CODE XREF: seg121:05F8j
		mov	al, 1

loc_594ED:				; CODE XREF: seg121:loc_594E9j
		or	al, al
		jnz	short loc_594F4
		jmp	loc_595B7
; ���������������������������������������������������������������������������

loc_594F4:				; CODE XREF: seg121:061Fj
		mov	ax, word_7085B
		mov	word_70859, ax
		jmp	loc_595B7
; ���������������������������������������������������������������������������

loc_594FD:				; CODE XREF: seg121:0561j
					; DATA XREF: seg121:off_595BAo
		mov	al, byte_72C90	; case 0x2

loc_59500:
		mov	ah, 0
		cmp	ax, word_70859

loc_59506:
		jnz	short loc_59510
		mov	byte_70858, 1
		jmp	loc_595B7
; ���������������������������������������������������������������������������

loc_59510:				; CODE XREF: seg121:loc_59506j
		cmp	word_72C93, 0
		jz	short loc_5952C
		push	word_72C95
		mov	bx, word_72C93
		push	word ptr [bx+4]
		call	ModuleRegistry_Opcode_UNKNOWN_60402
		add	sp, 4
		jmp	short loc_5952E
; ���������������������������������������������������������������������������

loc_5952C:				; CODE XREF: seg121:0645j
		xor	ax, ax

loc_5952E:				; CODE XREF: seg121:065Aj
		cmp	ax, word_72C91

loc_59532:
		jnz	short loc_59562

loc_59534:
		cmp	word_72C93, 0
		jz	short loc_5955C
		push	word_72C95
		mov	bx, word_72C93
		push	word ptr [bx+4]
		call	ModuleRegistry_Opcode_AE_603DE
		add	sp, 4
		cmp	ax, 2
		jnz	short loc_59558
		mov	ax, 1
		jmp	short loc_5955A
; ���������������������������������������������������������������������������

loc_59558:				; CODE XREF: seg121:0681j
		xor	ax, ax

loc_5955A:				; CODE XREF: seg121:0686j
		jmp	short loc_5955E
; ���������������������������������������������������������������������������

loc_5955C:				; CODE XREF: seg121:0669j
		mov	al, 1

loc_5955E:				; CODE XREF: seg121:loc_5955Aj
		or	al, al
		jz	short loc_595B7

loc_59562:				; CODE XREF: seg121:loc_59532j
		mov	ax, 4700h
		mov	dx, word_709D0
		int	67h		;  - LIM EMS - SAVE MAPPING CONTEXT
					; DX = handle
					; Return: AH = status
		nop
		push	cs
		call	near ptr Interrupt_TimerCase_595C2
		jmp	loc_59483
; ���������������������������������������������������������������������������

loc_59573:				; CODE XREF: seg121:0561j
					; DATA XREF: seg121:off_595BAo
		cmp	word_72CA5, 0	; case 0x3
		jz	short loc_5959B
		push	word_72CA7
		mov	bx, word_72CA5
		push	word ptr [bx+4]
		call	ModuleRegistry_Opcode_AE_603DE
		add	sp, 4
		cmp	ax, 2
		jnz	short loc_59597
		mov	ax, 1
		jmp	short loc_59599
; ���������������������������������������������������������������������������

loc_59597:				; CODE XREF: seg121:06C0j
		xor	ax, ax

loc_59599:				; CODE XREF: seg121:06C5j
		jmp	short loc_5959D
; ���������������������������������������������������������������������������

loc_5959B:				; CODE XREF: seg121:06A8j
		mov	al, 1

loc_5959D:				; CODE XREF: seg121:loc_59599j
		or	al, al
		jz	short loc_595B7
		mov	ax, 4700h
		mov	dx, word_709D0
		int	67h		;  - LIM EMS - SAVE MAPPING CONTEXT
					; DX = handle
					; Return: AH = status
		nop
		push	cs
		call	near ptr Interrupt_TimerCaseB_5974D
		jmp	loc_5947E
; ���������������������������������������������������������������������������

loc_595B2:				; CODE XREF: seg121:055Cj
		mov	byte_7084A, 1	; default

loc_595B7:				; CODE XREF: seg121:054Dj seg121:05BCj ...
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
off_595BA	dw offset Interrupt_TimerDispatch_59436	; DATA XREF: seg121:0561r
		dw offset loc_5948F	; jump table for switch	statement
		dw offset loc_594FD
		dw offset loc_59573

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 208 lignes, NON DÉTAILLÉE — un des cas de Interrupt_TimerDispatch_59436
; (sub_59F1D/59FF5/603CC répétés deux fois).
; ==============================================================================================
Interrupt_TimerCase_595C2	proc far		; CODE XREF: seg121:069Dp

var_4		= word ptr -4
var_1		= byte ptr -1

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		cmp	word_70859, 10h
		jl	short loc_5960E
		cmp	word_70859, 12h
		jg	short loc_5960E
		mov	al, byte_72C90
		mov	ah, 0
		cmp	ax, 5
		jz	short loc_595ED
		cmp	ax, 8
		jz	short loc_595F5
		cmp	ax, 15h
		jz	short loc_595FE
		jmp	short loc_59606
; ���������������������������������������������������������������������������

loc_595ED:				; CODE XREF: Interrupt_TimerCase_595C2+1Dj
					; Interrupt_TimerCase_595C2+3Aj
		mov	word_7085B, 4
		jmp	short loc_5960E
; ���������������������������������������������������������������������������

loc_595F5:				; CODE XREF: Interrupt_TimerCase_595C2+22j
		test	byte_7086A, 1
		jz	short loc_595FE
		jmp	short loc_595ED
; ���������������������������������������������������������������������������

loc_595FE:				; CODE XREF: Interrupt_TimerCase_595C2+27j
					; Interrupt_TimerCase_595C2+38j
		mov	word_7085B, 13h
		jmp	short loc_5960E
; ���������������������������������������������������������������������������

loc_59606:				; CODE XREF: Interrupt_TimerCase_595C2+29j
		mov	al, byte_72C90
		mov	ah, 0
		mov	word_7085B, ax

loc_5960E:				; CODE XREF: Interrupt_TimerCase_595C2+Cj
					; Interrupt_TimerCase_595C2+13j ...
		mov	al, byte_72C90
		mov	ah, 0
		imul	ax, 0Ch
		mov	si, word_70854
		add	si, ax
		mov	al, [si+0Ah]
		mov	ah, 0
		push	ax
		mov	ax, word_72C91
		cwd
		pop	bx
		idiv	bx

loc_59629:
		mov	word_72C91, dx
		cmp	word_72C91, 0

loc_59632:
		jz	short loc_5963A
		inc	word_72C91
		jmp	short loc_59642
; ���������������������������������������������������������������������������

loc_5963A:				; CODE XREF: Interrupt_TimerCase_595C2:loc_59632j
		mov	al, [si+0Bh]
		mov	ah, 0
		mov	word_72C91, ax

loc_59642:				; CODE XREF: Interrupt_TimerCase_595C2+76j
		mov	al, byte_72C90
		mov	ah, 0
		shl	ax, 2
		les	bx, dword_70861
		add	bx, ax
		les	bx, es:[bx]
		add	bx, word_70859
		mov	dl, es:[bx]
		cmp	dl, 0FFh
		jnz	short loc_59665
		mov	[bp+var_1], 0
		jmp	short loc_5967F
; ���������������������������������������������������������������������������

loc_59665:				; CODE XREF: Interrupt_TimerCase_595C2+9Bj
		mov	al, dl
		mov	ah, 0
		shl	ax, 2
		les	bx, dword_7085D
		add	bx, ax
		les	bx, es:[bx]
		add	bx, word_72C91
		mov	al, es:[bx]
		mov	[bp+var_1], al

loc_5967F:				; CODE XREF: Interrupt_TimerCase_595C2+A1j
		mov	al, [bp+var_1]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_596D7
		push	5BE3h
		call	Sequencer_AdvanceActiveSlot_59F1D
		pop	cx
		mov	al, byte ptr word_70859
		mov	byte_72C90, al
		mov	ah, 0
		mov	[bp+var_4], ax
		mov	si, 5BE3h
		push	0
		imul	ax, 0Ch
		mov	dx, word_70854
		add	dx, ax
		push	dx
		push	si
		call	Sequencer_ProcessQueue_59FF5
		add	sp, 6
		cmp	word ptr [si], 0
		jz	short loc_596CB
		push	word ptr [si+2]
		mov	bx, [si]
		push	word ptr [bx+4]
		call	ModuleRegistry_Opcode_AA_603CC
		add	sp, 4
		jmp	short $+2

loc_596CB:				; CODE XREF: Interrupt_TimerCase_595C2+F5j
		mov	byte_72CA1, 1
		mov	byte_70858, 1
		jmp	short loc_5974A
; ���������������������������������������������������������������������������

loc_596D7:				; CODE XREF: Interrupt_TimerCase_595C2+C4j
		test	[bp+var_1], 80h
		jz	short loc_596E3
		and	[bp+var_1], 7Fh
		jmp	short loc_596F1
; ���������������������������������������������������������������������������

loc_596E3:				; CODE XREF: Interrupt_TimerCase_595C2+119j
		push	5BE3h
		call	Sequencer_AdvanceActiveSlot_59F1D
		pop	cx
		mov	byte_72CA1, 0

loc_596F1:				; CODE XREF: Interrupt_TimerCase_595C2+11Fj
		mov	al, [bp+var_1]
		mov	ah, 0
		cmp	ax, word_7084E
		jle	short loc_59710
		mov	byte_7084A, 2

loc_59701:
		mov	byte_70858, 1
		mov	al, byte_72C90
		mov	ah, 0
		mov	word_70859, ax
		jmp	short loc_5974A
; ���������������������������������������������������������������������������

loc_59710:				; CODE XREF: Interrupt_TimerCase_595C2+138j
		mov	si, 5BF5h

loc_59713:
		push	0
		mov	al, [bp+var_1]
		mov	ah, 0
		dec	ax
		imul	ax, 0Ah
		mov	dx, word_70856

loc_59722:
		add	dx, ax
		push	dx
		push	si
		call	Sequencer_ProcessQueue_59FF5

loc_5972B:
		add	sp, 6

loc_5972E:
		cmp	word ptr [si], 0
		jz	short loc_59745

loc_59733:
		push	word ptr [si+2]
		mov	bx, [si]
		push	word ptr [bx+4]
		call	ModuleRegistry_Opcode_AA_603CC
		add	sp, 4
		jmp	short $+2

loc_59745:				; CODE XREF: Interrupt_TimerCase_595C2+16Fj
		mov	byte_70858, 3

loc_5974A:				; CODE XREF: Interrupt_TimerCase_595C2+113j
					; Interrupt_TimerCase_595C2+14Cj
		pop	si
		leave
		retf
Interrupt_TimerCase_595C2	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, autre cas de Interrupt_TimerDispatch_59436 (sub_59F1D/59FF5/603CC).
; ==============================================================================================
Interrupt_TimerCaseB_5974D	proc far		; CODE XREF: seg121:06DCp
		push	bp
		mov	bp, sp
		push	si
		push	di
		push	5BF5h
		call	Sequencer_AdvanceActiveSlot_59F1D
		pop	cx
		mov	byte_72CB3, 0
		cmp	byte_72CA1, 1
		jnz	short loc_59770
		push	5BE3h
		call	Sequencer_AdvanceActiveSlot_59F1D
		pop	cx

loc_59770:				; CODE XREF: Interrupt_TimerCaseB_5974D+18j
		mov	al, byte ptr word_70859
		mov	byte_72C90, al
		mov	ah, 0
		mov	di, ax
		mov	si, 5BE3h
		push	0
		imul	ax, 0Ch
		mov	dx, word_70854
		add	dx, ax
		push	dx
		push	si
		call	Sequencer_ProcessQueue_59FF5
		add	sp, 6
		cmp	word ptr [si], 0
		jz	short loc_597A9
		push	word ptr [si+2]
		mov	bx, [si]
		push	word ptr [bx+4]
		call	ModuleRegistry_Opcode_AA_603CC
		add	sp, 4
		jmp	short $+2

loc_597A9:				; CODE XREF: Interrupt_TimerCaseB_5974D+48j
		mov	byte_72CA1, 1
		cmp	di, 10h
		jl	short loc_597BE
		cmp	di, 12h
		jg	short loc_597BE
		mov	ax, word_7085B
		mov	word_70859, ax

loc_597BE:				; CODE XREF: Interrupt_TimerCaseB_5974D+64j
					; Interrupt_TimerCaseB_5974D+69j
		pop	di
		pop	si
		pop	bp
		retf
Interrupt_TimerCaseB_5974D	endp

; ���������������������������������������������������������������������������

; ==============================================================================================
; far, référencée via vtable (DATA XREF seg339), initialise ~10 globales d'état du sous-
; système minuteur (dword_72C97 et suivantes).
; ==============================================================================================
Interrupt_TimerInitState_597C2:				; DATA XREF: seg339:off_71F20o
		push	bp
		mov	bp, sp
		mov	dword_72C97, 0
		mov	byte_72C9B, 2
		mov	byte_72C9C, 0
		mov	dword_72C9D, 0
		mov	word_72C93, 0
		mov	word_72C95, 0FFFFh
		mov	dword_72CA9, 0
		mov	byte_72CAD, 2
		mov	byte_72CAE, 0

loc_59800:
		mov	dword_72CAF, 0

loc_59809:
		mov	word_72CA5, 0
		mov	word_72CA7, 0FFFFh
		pop	bp
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, référencée via vtable (DATA XREF seg339), libère des ressources (sub_5C7B6, motif de
; "free" déjà vu) associées au sous-système minuteur.
; ==============================================================================================
Interrupt_TimerCleanup_59817:				; DATA XREF: seg339:4F2Ao
		push	bp
		mov	bp, sp
		push	5BF5h
		call	Sequencer_AdvanceActiveSlot_59F1D
		pop	cx
		cmp	byte_72CAE, 0
		jz	short loc_59848
		cmp	dword_72CA9, 0
		jz	short loc_59848

loc_59832:
		push	0
		mov	al, byte_72CAD
		push	ax
		push	5BF9h
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_59848:				; CODE XREF: seg121:0958j seg121:0960j
		mov	dword_72CA9, 0
		mov	byte_72CAE, 0
		mov	dword_72CAF, 0
		push	5BE3h
		call	Sequencer_AdvanceActiveSlot_59F1D
		pop	cx
		cmp	byte_72C9C, 0
		jz	short loc_5988D
		cmp	dword_72C97, 0
		jz	short loc_5988D
		push	0
		mov	al, byte_72C9B
		push	ax
		push	5BE7h
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_5988D:				; CODE XREF: seg121:099Dj seg121:09A5j
		mov	dword_72C97, 0
		mov	byte_72C9C, 0

loc_5989B:
		mov	dword_72C9D, 0
		pop	bp
		retf
seg121		ends
