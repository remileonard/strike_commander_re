seg002		segment	byte public 'CODE' use16
		assume cs:seg002
		;org 6
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_34F6	proc far		; CODE XREF: Gameflow_BuildScene_4A60B+330P
					; Gameflow_BuildScene_4A60B+356P

var_3		= byte ptr -3
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	al, [bp+arg_2]
		mov	[bp+var_3], al
		push	8
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	di, ax
		or	ax, ax
		jz	short loc_3533
		mov	word ptr [di], 5CEh
		mov	word ptr [di+2], 0
		mov	word ptr [di], 5D2h
		mov	al, [bp+var_3]
		mov	[di+4],	al
		mov	word ptr [di+5], 0
		mov	ax, di
		jmp	short loc_3535
; ���������������������������������������������������������������������������

loc_3533:				; CODE XREF: sub_34F6+1Fj
		mov	ax, di

loc_3535:				; CODE XREF: sub_34F6+3Bj
		mov	[bp+var_2], ax
		push	[bp+var_2]
		push	si
		call	LinkedListB_InsertAtTail_2FDF4
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_34F6	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+6]
		mov	word ptr [bp-2], 0
		jmp	short $+2

loc_3559:				; CODE XREF: seg002:0083j
		lea	ax, [bp-2]
		push	ax
		push	si
		call	sub_2FF1E
		add	sp, 4
		or	ax, ax
		jz	short loc_3575
		mov	bx, [bp-2]
		mov	al, [bx+4]
		cmp	al, [bp+8]
		jnz	short loc_3559

loc_3575:				; CODE XREF: seg002:0078j
		cmp	word ptr [bp-2], 0
		jz	short loc_3589
		push	0
		push	word ptr [bp-2]
		push	si
		call	LinkedListB_FindAndDispatch_2FE19
		add	sp, 6

loc_3589:				; CODE XREF: seg002:0089j
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_358C	proc far		; CODE XREF: seg001:0346P seg001:03FEP ...

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	short loc_35B0
; ���������������������������������������������������������������������������

loc_359D:				; CODE XREF: sub_358C+33j
		push	0
		push	[bp+var_2]
		push	si
		call	LinkedListB_FindAndDispatch_2FE19
		add	sp, 6
		mov	[bp+var_2], 0

loc_35B0:				; CODE XREF: sub_358C+Fj
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	sub_2FF1E
		add	sp, 4
		or	ax, ax
		jnz	short loc_359D
		mov	word ptr [si+4], 0
		pop	si
		leave
		retf
sub_358C	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE 2026-10-22. Cherche dans la liste des sprites de la scène celui dont l'octet +4
; vaut arg_2 ; renvoie son enregistrement (+5 = script EFCT, +7 = longueur) ou 0.
; ==============================================================================================
Gameflow_FindSprite_35C9	proc far		; CODE XREF: Gameflow_PlayScene_3B0B+1E5p
					; Gameflow_PlayScene_3B0B+1F6p ...

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	short loc_35EB
; ���������������������������������������������������������������������������

loc_35DA:				; CODE XREF: Gameflow_FindSprite_35C9+31j
		mov	bx, [bp+var_2]
		mov	al, [bx+4]
		cmp	al, [bp+arg_2]
		jnz	short loc_35EB
		mov	ax, [bp+var_2]
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_35EB:				; CODE XREF: Gameflow_FindSprite_35C9+Fj Gameflow_FindSprite_35C9+1Aj
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	sub_2FF1E
		add	sp, 4
		or	ax, ax
		jnz	short loc_35DA
		xor	ax, ax
		pop	si
		leave
		retf
Gameflow_FindSprite_35C9	endp

; ���������������������������������������������������������������������������
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE 2026-10-22. Évalue un chunk REQU (paires condition, drapeau [partie+0FDh+n]) :
; visible au départ ; 0 n → caché si le drapeau n est posé ; 1 n → caché s'il ne l'est pas ; 2
; n → si le drapeau n n'est pas posé, la condition suivante est ignorée ; 3 n → si le drapeau
; n est posé, la condition suivante est ignorée ; autre valeur ignorée. Appelée par
; Gameflow_BuildScene_4A60B. GAMEFLOW_SYSTEM.md § 4.
; ==============================================================================================
Gameflow_CheckSpriteRequirements_3604	proc far		; CODE XREF: Gameflow_BuildScene_4A60B+31FP

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
		mov	dx, [bp+arg_0]
		mov	di, [bp+arg_4]
		mov	[bp+var_1], 1
		mov	cl, 0
		xor	si, si
		jmp	loc_36B0
; ���������������������������������������������������������������������������

loc_361D:				; CODE XREF: Gameflow_CheckSpriteRequirements_3604+B5j
		mov	bx, si
		mov	al, [bx+di]
		mov	[bp+var_2], al
		mov	bx, di
		mov	al, [bx+si+1]
		mov	[bp+var_3], al
		mov	al, [bp+var_2]
		mov	ah, 0
		mov	bx, ax
		cmp	bx, 3		; switch 4 cases
		ja	short loc_36AD	; default
		shl	bx, 1
		jmp	cs:off_36C7[bx]	; switch jump

loc_363F:				; DATA XREF: seg002:off_36C7o
		mov	al, [bp+var_3]	; case 0x0
		mov	ah, 0
		mov	bx, dx
		add	bx, ax
		cmp	byte ptr [bx+0FDh], 0
		jz	short loc_365B
		mov	al, cl
		mov	ah, 0
		or	ax, ax
		jnz	short loc_365B
		mov	[bp+var_1], 0

loc_365B:				; CODE XREF: Gameflow_CheckSpriteRequirements_3604+49j Gameflow_CheckSpriteRequirements_3604+51j
		mov	cl, 0
		jmp	short loc_36AD	; default
; ���������������������������������������������������������������������������

loc_365F:				; CODE XREF: Gameflow_CheckSpriteRequirements_3604+36j
					; DATA XREF: seg002:off_36C7o
		mov	al, [bp+var_3]	; case 0x1
		mov	ah, 0
		mov	bx, dx
		add	bx, ax
		mov	al, [bx+0FDh]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_367E
		mov	al, cl
		mov	ah, 0
		or	ax, ax
		jnz	short loc_367E
		mov	[bp+var_1], 0

loc_367E:				; CODE XREF: Gameflow_CheckSpriteRequirements_3604+6Cj Gameflow_CheckSpriteRequirements_3604+74j
		mov	cl, 0
		jmp	short loc_36AD	; default
; ���������������������������������������������������������������������������

loc_3682:				; CODE XREF: Gameflow_CheckSpriteRequirements_3604+36j
					; DATA XREF: seg002:off_36C7o
		mov	al, [bp+var_3]	; case 0x2
		mov	ah, 0
		mov	bx, dx
		add	bx, ax
		mov	al, [bx+0FDh]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_3697
		mov	cl, 1

loc_3697:				; CODE XREF: Gameflow_CheckSpriteRequirements_3604+8Fj
		jmp	short loc_36AD	; default
; ���������������������������������������������������������������������������

loc_3699:				; CODE XREF: Gameflow_CheckSpriteRequirements_3604+36j
					; DATA XREF: seg002:off_36C7o
		mov	al, [bp+var_3]	; case 0x3
		mov	ah, 0
		mov	bx, dx
		add	bx, ax
		cmp	byte ptr [bx+0FDh], 0
		jz	short loc_36AB
		mov	cl, 1

loc_36AB:				; CODE XREF: Gameflow_CheckSpriteRequirements_3604+A3j
		jmp	short $+2

loc_36AD:				; CODE XREF: Gameflow_CheckSpriteRequirements_3604+32j Gameflow_CheckSpriteRequirements_3604+59j ...
		add	si, 2		; default

loc_36B0:				; CODE XREF: Gameflow_CheckSpriteRequirements_3604+16j
		mov	al, [bp+arg_2]
		mov	ah, 0
		cmp	ax, si
		jle	short loc_36BC
		jmp	loc_361D
; ���������������������������������������������������������������������������

loc_36BC:				; CODE XREF: Gameflow_CheckSpriteRequirements_3604+B3j
		mov	al, [bp+var_1]
		pop	di
		pop	si
		leave
		retf
Gameflow_CheckSpriteRequirements_3604	endp

; ���������������������������������������������������������������������������
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
off_36C7	dw offset loc_363F	; DATA XREF: Gameflow_CheckSpriteRequirements_3604+36r
		dw offset loc_365F	; jump table for switch	statement
		dw offset loc_3682
		dw offset loc_3699

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE 2026-10-22. Interpréteur des scripts EFCT de GAMEFLOW.IFF : suite de paires
; d'octets (commande, argument), 39 commandes (table off_3ABD, 00h à 26h). Blocs conditionnels
; : un test qui échoue pose var_1 ; les commandes suivantes sont sautées jusqu'à 1Eh (« sinon
; », bascule) ou 1Fh (fin), les tests rencontrés pendant le saut (09h, 0Ah, 14h, 15h, 16h,
; 1Ch, 20h, 23h, 25h) étant comptés dans var_4. 21h n : les tests suivants sont évalués même
; pendant un saut (erreur « Faulty OR structure in gameflow file » si une autre commande s'y
; trouve). 1Dh peut arrêter le script (var_3). Détail de chaque commande : GAMEFLOW_SYSTEM.md
; § 5.
; ==============================================================================================
Gameflow_RunScriptPairs_36CF	proc far		; CODE XREF: Gameflow_PlayScene_3B0B+204p
					; Gameflow_MainLoop_3D2E+299p

var_A8		= word ptr -0A8h
var_58		= word ptr -58h
var_8		= byte ptr -8
var_7		= byte ptr -7
var_6		= byte ptr -6
var_5		= byte ptr -5
var_4		= byte ptr -4
var_3		= byte ptr -3
var_2		= byte ptr -2
var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= byte ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 0A8h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_1], 0
		mov	[bp+var_2], 0
		mov	[bp+var_3], 0
		mov	[bp+var_4], 0
		mov	[bp+var_5], 0
		xor	di, di
		jmp	loc_3AAD
; ���������������������������������������������������������������������������

loc_36F4:				; CODE XREF: Gameflow_RunScriptPairs_36CF+3E7j
		cmp	[bp+var_3], 0
		jz	short loc_36FD
		jmp	loc_3AB9
; ���������������������������������������������������������������������������

loc_36FD:				; CODE XREF: Gameflow_RunScriptPairs_36CF+29j
		mov	bx, [bp+arg_4]
		add	bx, di
		mov	al, [bx]
		mov	[bp+var_6], al
		mov	bx, [bp+arg_4]
		mov	al, [bx+di+1]
		mov	[bp+var_7], al
		cmp	[bp+var_2], 0
		jz	short loc_3766
		cmp	[bp+var_6], 9
		jz	short loc_3757
		cmp	[bp+var_6], 0Ah
		jz	short loc_3757
		cmp	[bp+var_6], 14h
		jz	short loc_3757
		cmp	[bp+var_6], 15h
		jz	short loc_3757
		cmp	[bp+var_6], 16h
		jz	short loc_3757
		cmp	[bp+var_6], 1Ch
		jz	short loc_3757
		cmp	[bp+var_6], 20h	; ' '
		jz	short loc_3757
		cmp	[bp+var_6], 23h	; '#'
		jz	short loc_3757
		cmp	[bp+var_6], 25h	; '%'
		jz	short loc_3757
		push	4F7h
		call	Fatal_Error_310B
		add	sp, 2

loc_3757:				; CODE XREF: Gameflow_RunScriptPairs_36CF+4Bj Gameflow_RunScriptPairs_36CF+51j ...
		cmp	[bp+var_5], 0
		jnz	short loc_3763
		mov	[bp+var_2], 0
		jmp	short loc_3766
; ���������������������������������������������������������������������������

loc_3763:				; CODE XREF: Gameflow_RunScriptPairs_36CF+8Cj
		dec	[bp+var_5]

loc_3766:				; CODE XREF: Gameflow_RunScriptPairs_36CF+45j Gameflow_RunScriptPairs_36CF+92j
		cmp	[bp+var_6], 1Eh
		jnz	short loc_3782
		cmp	[bp+var_4], 0
		jnz	short loc_377F
		mov	al, [bp+var_1]
		mov	ah, 0
		neg	ax
		sbb	ax, ax
		inc	ax
		mov	[bp+var_1], al

loc_377F:				; CODE XREF: Gameflow_RunScriptPairs_36CF+A1j
		jmp	loc_3AAA
; ���������������������������������������������������������������������������

loc_3782:				; CODE XREF: Gameflow_RunScriptPairs_36CF+9Bj
		cmp	[bp+var_6], 1Fh
		jnz	short loc_379A
		cmp	[bp+var_4], 0
		jnz	short loc_3794
		mov	[bp+var_1], 0
		jmp	short loc_3797
; ���������������������������������������������������������������������������

loc_3794:				; CODE XREF: Gameflow_RunScriptPairs_36CF+BDj
		dec	[bp+var_4]

loc_3797:				; CODE XREF: Gameflow_RunScriptPairs_36CF+C3j
		jmp	loc_3AAA
; ���������������������������������������������������������������������������

loc_379A:				; CODE XREF: Gameflow_RunScriptPairs_36CF+B7j
		cmp	[bp+var_6], 21h	; '!'
		jnz	short loc_37AD
		mov	[bp+var_2], 1
		mov	al, [bp+var_7]
		mov	[bp+var_5], al
		jmp	loc_3AAA
; ���������������������������������������������������������������������������

loc_37AD:				; CODE XREF: Gameflow_RunScriptPairs_36CF+CFj
		cmp	[bp+var_1], 0
		jz	short loc_37F8
		mov	al, [bp+var_2]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_37F8
		cmp	[bp+var_6], 9
		jz	short loc_37F2
		cmp	[bp+var_6], 0Ah
		jz	short loc_37F2
		cmp	[bp+var_6], 14h
		jz	short loc_37F2
		cmp	[bp+var_6], 15h
		jz	short loc_37F2
		cmp	[bp+var_6], 16h
		jz	short loc_37F2
		cmp	[bp+var_6], 1Ch
		jz	short loc_37F2
		cmp	[bp+var_6], 20h	; ' '
		jz	short loc_37F2
		cmp	[bp+var_6], 23h	; '#'
		jz	short loc_37F2
		cmp	[bp+var_6], 25h	; '%'
		jnz	short loc_37F5

loc_37F2:				; CODE XREF: Gameflow_RunScriptPairs_36CF+F1j Gameflow_RunScriptPairs_36CF+F7j ...
		inc	[bp+var_4]

loc_37F5:				; CODE XREF: Gameflow_RunScriptPairs_36CF+121j
		jmp	loc_3AAA
; ���������������������������������������������������������������������������

loc_37F8:				; CODE XREF: Gameflow_RunScriptPairs_36CF+E2j Gameflow_RunScriptPairs_36CF+EBj
		mov	al, [bp+var_6]
		mov	ah, 0
		mov	bx, ax
		cmp	bx, 26h	; '&'   ; switch 39 cases
		jbe	short loc_3807
		jmp	loc_3AA8	; default
; ���������������������������������������������������������������������������

loc_3807:				; CODE XREF: Gameflow_RunScriptPairs_36CF+133j
		shl	bx, 1
		jmp	cs:off_3ABD[bx]	; switch jump

loc_380E:				; DATA XREF: seg002:off_3ABDo
		mov	al, [bp+var_7]	; case 0x0
		push	ax
		push	si
		call	sub_41F33
		add	sp, 4
		jmp	loc_3AAA
; ���������������������������������������������������������������������������

loc_381E:				; CODE XREF: Gameflow_RunScriptPairs_36CF+13Aj
					; DATA XREF: seg002:off_3ABDo
		mov	al, [bp+var_7]	; case 0x1
		mov	[si+0FCh], al
		mov	byte ptr [si+0E3h], 1
		jmp	loc_3AAA
; ���������������������������������������������������������������������������

loc_382D:				; CODE XREF: Gameflow_RunScriptPairs_36CF+13Aj
					; DATA XREF: seg002:off_3ABDo
		mov	al, [bp+var_7]	; case 0x2
		push	ax
		push	si
		call	sub_41F38
		add	sp, 4
		jmp	loc_3AAA
; ���������������������������������������������������������������������������

loc_383D:				; CODE XREF: Gameflow_RunScriptPairs_36CF+13Aj
					; DATA XREF: seg002:off_3ABDo
		mov	al, [bp+var_7]	; case 0x3
		mov	[si+0F9h], al
		mov	byte ptr [si+0E8h], 1
		jmp	loc_3AAA
; ���������������������������������������������������������������������������

loc_384C:				; CODE XREF: Gameflow_RunScriptPairs_36CF+13Aj
					; DATA XREF: seg002:off_3ABDo
		jmp	loc_3AAA	; case 0x4
; ���������������������������������������������������������������������������

loc_384F:				; CODE XREF: Gameflow_RunScriptPairs_36CF+13Aj
					; DATA XREF: seg002:off_3ABDo
		mov	al, [bp+var_7]	; case 0x5
		mov	[si+0F9h], al
		jmp	loc_3AAA
; ���������������������������������������������������������������������������

loc_3859:				; CODE XREF: Gameflow_RunScriptPairs_36CF+13Aj
					; DATA XREF: seg002:off_3ABDo
		mov	al, [bp+var_7]	; case 0x6
		mov	ah, 0
		mov	bx, ax
		mov	byte ptr [bx+si+0FDh], 1
		jmp	loc_3AAA
; ���������������������������������������������������������������������������

loc_3868:				; CODE XREF: Gameflow_RunScriptPairs_36CF+13Aj
					; DATA XREF: seg002:off_3ABDo
		mov	al, [bp+var_7]	; case 0x7
		mov	ah, 0
		mov	bx, ax
		mov	byte ptr [bx+si+0FDh], 0
		jmp	loc_3AAA
; ���������������������������������������������������������������������������

loc_3877:				; CODE XREF: Gameflow_RunScriptPairs_36CF+13Aj
					; DATA XREF: seg002:off_3ABDo
		mov	al, [bp+var_7]	; case 0x8
		push	ax
		push	si
		call	sub_41F47
		add	sp, 4
		jmp	loc_3AAA
; ���������������������������������������������������������������������������

loc_3887:				; CODE XREF: Gameflow_RunScriptPairs_36CF+13Aj
					; DATA XREF: seg002:off_3ABDo
		mov	al, [bp+var_7]	; case 0x9
		mov	ah, 0
		mov	bx, ax
		cmp	byte ptr [bx+si+0FDh], 0
		jz	short loc_3899
		mov	[bp+var_1], 1

loc_3899:				; CODE XREF: Gameflow_RunScriptPairs_36CF+1C4j
		jmp	loc_3AAA
; ���������������������������������������������������������������������������

loc_389C:				; CODE XREF: Gameflow_RunScriptPairs_36CF+13Aj
					; DATA XREF: seg002:off_3ABDo
		mov	al, [bp+var_7]	; case 0xA
		mov	ah, 0
		mov	bx, ax
		mov	al, [bx+si+0FDh]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_38B1
		mov	[bp+var_1], 1

loc_38B1:				; CODE XREF: Gameflow_RunScriptPairs_36CF+1DCj
		jmp	loc_3AAA
; ���������������������������������������������������������������������������

loc_38B4:				; CODE XREF: Gameflow_RunScriptPairs_36CF+13Aj
					; DATA XREF: seg002:off_3ABDo
		jmp	loc_3AAA	; case 0xB
; ���������������������������������������������������������������������������

loc_38B7:				; CODE XREF: Gameflow_RunScriptPairs_36CF+13Aj
					; DATA XREF: seg002:off_3ABDo
		mov	al, [bp+var_7]	; case 0xC
		mov	[si+0F9h], al
		jmp	loc_3AAA
; ���������������������������������������������������������������������������

loc_38C1:				; CODE XREF: Gameflow_RunScriptPairs_36CF+13Aj
					; DATA XREF: seg002:off_3ABDo
		mov	al, [bp+var_7]	; case 0xD
		mov	[si+0FBh], al
		jmp	loc_3AAA
; ���������������������������������������������������������������������������

loc_38CB:				; CODE XREF: Gameflow_RunScriptPairs_36CF+13Aj
					; DATA XREF: seg002:off_3ABDo
		mov	byte ptr [si+0E8h], 1 ;	case 0xE
		jmp	loc_3AAA
; ���������������������������������������������������������������������������

loc_38D3:				; CODE XREF: Gameflow_RunScriptPairs_36CF+13Aj
					; DATA XREF: seg002:off_3ABDo
		mov	byte ptr [si+0E8h], 2 ;	case 0xF
		jmp	loc_3AAA
; ���������������������������������������������������������������������������

loc_38DB:				; CODE XREF: Gameflow_RunScriptPairs_36CF+13Aj
					; DATA XREF: seg002:off_3ABDo
		lea	ax, [bp+var_A8]	; case 0x10
		push	ax
		push	si
		call	sub_41FC1
		add	sp, 4
		cmp	byte ptr [bp+var_A8], 0
		jz	short loc_3923
		lea	ax, [bp+var_A8]
		push	ax
		push	si
		call	sub_41FB7
		add	sp, 4
		push	ds
		push	offset a_tmp	; ".tmp"
		push	ds
		push	offset aGensave	; "gensave"
		push	ds
		push	offset unk_468CC
		lea	ax, [bp+var_58]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		lea	ax, [bp+var_58]
		push	ax
		push	si
		call	sub_41FB7
		add	sp, 4

loc_3923:				; CODE XREF: Gameflow_RunScriptPairs_36CF+21Fj
		jmp	loc_3AAA
; ���������������������������������������������������������������������������

loc_3926:				; CODE XREF: Gameflow_RunScriptPairs_36CF+13Aj
					; DATA XREF: seg002:off_3ABDo
		push	0		; case 0x11
		push	si
		call	sub_41FC6
		add	sp, 4
		cmp	byte ptr [si+93h], 0
		jz	short loc_393D
		mov	byte ptr [si+0E8h], 3

loc_393D:				; CODE XREF: Gameflow_RunScriptPairs_36CF+267j
		jmp	loc_3AAA
; ���������������������������������������������������������������������������

loc_3940:				; CODE XREF: Gameflow_RunScriptPairs_36CF+13Aj
					; DATA XREF: seg002:off_3ABDo
		mov	al, [bp+var_7]	; case 0x12
		push	ax
		push	si
		call	sub_420EA
		add	sp, 4
		jmp	loc_3AAA
; ���������������������������������������������������������������������������

loc_3950:				; CODE XREF: Gameflow_RunScriptPairs_36CF+13Aj
					; DATA XREF: seg002:off_3ABDo
		push	si		; case 0x13
		call	sub_42064
		add	sp, 2
		jmp	loc_3AAA
; ���������������������������������������������������������������������������

loc_395C:				; CODE XREF: Gameflow_RunScriptPairs_36CF+13Aj
					; DATA XREF: seg002:off_3ABDo
		mov	al, [si+35Bh]	; case 0x14
		mov	ah, 0
		or	ax, ax
		jnz	short loc_396A
		mov	[bp+var_1], 1

loc_396A:				; CODE XREF: Gameflow_RunScriptPairs_36CF+295j
		jmp	loc_3AAA
; ���������������������������������������������������������������������������

loc_396D:				; CODE XREF: Gameflow_RunScriptPairs_36CF+13Aj
					; DATA XREF: seg002:off_3ABDo
		cmp	byte ptr [si+35Bh], 0 ;	case 0x15
		jz	short loc_3978
		mov	[bp+var_1], 1

loc_3978:				; CODE XREF: Gameflow_RunScriptPairs_36CF+2A3j
		jmp	loc_3AAA
; ���������������������������������������������������������������������������

loc_397B:				; CODE XREF: Gameflow_RunScriptPairs_36CF+13Aj
					; DATA XREF: seg002:off_3ABDo
		mov	al, [bp+var_7]	; case 0x16
		push	ax
		push	si
		call	sub_420A4
		add	sp, 4
		mov	ah, 0
		or	ax, ax
		jnz	short loc_3992
		mov	[bp+var_1], 1

loc_3992:				; CODE XREF: Gameflow_RunScriptPairs_36CF+2BDj
		jmp	loc_3AAA
; ���������������������������������������������������������������������������

loc_3995:				; CODE XREF: Gameflow_RunScriptPairs_36CF+13Aj
					; DATA XREF: seg002:off_3ABDo
		mov	al, [bp+var_7]	; case 0x17
		push	ax
		push	si
		call	sub_420AE
		add	sp, 4
		jmp	loc_3AAA
; ���������������������������������������������������������������������������

loc_39A5:				; CODE XREF: Gameflow_RunScriptPairs_36CF+13Aj
					; DATA XREF: seg002:off_3ABDo
		mov	al, [bp+var_7]	; case 0x18
		mov	[si+0E9h], al
		mov	al, [si+0E9h]
		mov	ah, 0
		push	ax
		call	Music_SetGameflowMood_28C73
		add	sp, 2
		jmp	loc_3AAA
; ���������������������������������������������������������������������������

loc_39BE:				; CODE XREF: Gameflow_RunScriptPairs_36CF+13Aj
					; DATA XREF: seg002:off_3ABDo
		push	si		; case 0x19
		call	sub_420B3
		add	sp, 2
		jmp	loc_3AAA
; ���������������������������������������������������������������������������

loc_39CA:				; CODE XREF: Gameflow_RunScriptPairs_36CF+13Aj
					; DATA XREF: seg002:off_3ABDo
		cmp	byte ptr [si+0EDh], 0 ;	case 0x1A
		jz	short loc_39E1
		cmp	byte ptr [si+0F8h], 2
		jz	short loc_39E1
		push	si
		call	sub_4205F
		add	sp, 2

loc_39E1:				; CODE XREF: Gameflow_RunScriptPairs_36CF+300j
					; Gameflow_RunScriptPairs_36CF+307j
		jmp	loc_3AAA
; ���������������������������������������������������������������������������

loc_39E4:				; CODE XREF: Gameflow_RunScriptPairs_36CF+13Aj
					; DATA XREF: seg002:off_3ABDo
		cmp	[bp+var_7], 8	; case 0x1B
		jnb	short loc_39FC
		mov	al, [bp+var_7]
		mov	ah, 0
		mov	dx, 1Ah
		imul	dx
		mov	bx, ax
		mov	word ptr [bx+si+2A3h], 0

loc_39FC:				; CODE XREF: Gameflow_RunScriptPairs_36CF+319j
		jmp	loc_3AAA
; ���������������������������������������������������������������������������

loc_39FF:				; CODE XREF: Gameflow_RunScriptPairs_36CF+13Aj
					; DATA XREF: seg002:off_3ABDo
		push	si		; case 0x1D
		call	sub_4205A
		add	sp, 2
		or	al, al
		jz	short loc_3A10
		mov	[bp+var_3], 1

loc_3A10:				; CODE XREF: Gameflow_RunScriptPairs_36CF+33Bj
		jmp	loc_3AAA
; ���������������������������������������������������������������������������

loc_3A13:				; CODE XREF: Gameflow_RunScriptPairs_36CF+13Aj
					; DATA XREF: seg002:off_3ABDo
		jmp	loc_3AAA	; case 0x1E
; ���������������������������������������������������������������������������

loc_3A16:				; CODE XREF: Gameflow_RunScriptPairs_36CF+13Aj
					; DATA XREF: seg002:off_3ABDo
		jmp	loc_3AAA	; case 0x1F
; ���������������������������������������������������������������������������

loc_3A19:				; CODE XREF: Gameflow_RunScriptPairs_36CF+13Aj
					; DATA XREF: seg002:off_3ABDo
		mov	al, [bp+var_7]	; case 0x20
		mov	ah, 0
		mov	bx, ax
		cmp	byte ptr [bx+si+1FDh], 1
		jz	short loc_3A2B
		mov	[bp+var_1], 1

loc_3A2B:				; CODE XREF: Gameflow_RunScriptPairs_36CF+356j
		jmp	short loc_3AAA
; ���������������������������������������������������������������������������

loc_3A2D:				; CODE XREF: Gameflow_RunScriptPairs_36CF+13Aj
					; DATA XREF: seg002:off_3ABDo
		mov	al, [bp+var_7]	; case 0x22
		push	ax
		push	si
		call	sub_42055
		add	sp, 4
		jmp	short loc_3AAA
; ���������������������������������������������������������������������������

loc_3A3C:				; CODE XREF: Gameflow_RunScriptPairs_36CF+13Aj
					; DATA XREF: seg002:off_3ABDo
		cmp	word ptr [si+0EAh], 0 ;	case 0x23
		jnz	short $+2
		mov	[bp+var_1], 1
		jmp	short loc_3AAA
; ���������������������������������������������������������������������������

loc_3A49:				; CODE XREF: Gameflow_RunScriptPairs_36CF+13Aj
					; DATA XREF: seg002:off_3ABDo
		cmp	word ptr [si+0EAh], 0 ;	case 0x24
		jz	short loc_3A80
		mov	byte ptr [si+0E9h], 8
		mov	al, [si+0E9h]
		mov	ah, 0
		push	ax
		call	Music_SetGameflowMood_28C73
		add	sp, 2
		mov	[bp+var_8], 0FDh ; '�'
		cmp	byte ptr [si+0F8h], 2
		jz	short loc_3A73
		mov	[bp+var_8], 0FCh ; '�'

loc_3A73:				; CODE XREF: Gameflow_RunScriptPairs_36CF+39Ej
		mov	al, [bp+var_8]
		push	ax
		push	si
		call	sub_41F33
		add	sp, 4

loc_3A80:				; CODE XREF: Gameflow_RunScriptPairs_36CF+37Fj
		jmp	short loc_3AAA
; ���������������������������������������������������������������������������

loc_3A82:				; CODE XREF: Gameflow_RunScriptPairs_36CF+13Aj
					; DATA XREF: seg002:off_3ABDo
		mov	al, [si+3D6h]	; case 0x25
		mov	ah, 0
		or	ax, ax
		jnz	short loc_3A90
		mov	[bp+var_1], 1

loc_3A90:				; CODE XREF: Gameflow_RunScriptPairs_36CF+3BBj
		jmp	short loc_3AAA
; ���������������������������������������������������������������������������

loc_3A92:				; CODE XREF: Gameflow_RunScriptPairs_36CF+13Aj
					; DATA XREF: seg002:off_3ABDo
		mov	al, [bp+var_7]	; case 0x26
		mov	[si+3D7h], al
		mov	al, [si+3D7h]
		push	ax
		call	Music_PlayGameflowTune_28CFC
		add	sp, 2
		jmp	short loc_3AAA
; ���������������������������������������������������������������������������

loc_3AA8:				; CODE XREF: Gameflow_RunScriptPairs_36CF+135j
					; Gameflow_RunScriptPairs_36CF+13Aj
					; DATA XREF: ...
		jmp	short $+2	; default

loc_3AAA:				; CODE XREF: Gameflow_RunScriptPairs_36CF:loc_377Fj
					; Gameflow_RunScriptPairs_36CF:loc_3797j ...
		add	di, 2

loc_3AAD:				; CODE XREF: Gameflow_RunScriptPairs_36CF+22j
		mov	al, [bp+arg_2]
		mov	ah, 0
		cmp	ax, di
		jle	short loc_3AB9
		jmp	loc_36F4
; ���������������������������������������������������������������������������

loc_3AB9:				; CODE XREF: Gameflow_RunScriptPairs_36CF+2Bj
					; Gameflow_RunScriptPairs_36CF+3E5j
		pop	di
		pop	si
		leave
		retf
Gameflow_RunScriptPairs_36CF	endp

; ���������������������������������������������������������������������������
off_3ABD	dw offset loc_380E	; DATA XREF: Gameflow_RunScriptPairs_36CF+13Ar
		dw offset loc_381E	; jump table for switch	statement
		dw offset loc_382D
		dw offset loc_383D
		dw offset loc_384C
		dw offset loc_384F
		dw offset loc_3859
		dw offset loc_3868
		dw offset loc_3877
		dw offset loc_3887
		dw offset loc_389C
		dw offset loc_38B4
		dw offset loc_38B7
		dw offset loc_38C1
		dw offset loc_38CB
		dw offset loc_38D3
		dw offset loc_38DB
		dw offset loc_3926
		dw offset loc_3940
		dw offset loc_3950
		dw offset loc_395C
		dw offset loc_396D
		dw offset loc_397B
		dw offset loc_3995
		dw offset loc_39A5
		dw offset loc_39BE
		dw offset loc_39CA
		dw offset loc_39E4
		dw offset loc_3AA8
		dw offset loc_39FF
		dw offset loc_3A13
		dw offset loc_3A16
		dw offset loc_3A19
		dw offset loc_3AA8
		dw offset loc_3A2D
		dw offset loc_3A3C
		dw offset loc_3A49
		dw offset loc_3A82
		dw offset loc_3A92

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE 2026-10-22. Une scène : si [partie+0E3h], la reconstruit (sub_358C,
; Gameflow_BuildScene_4A60B) ; affiche la scène [partie+0FCh] avec ses sprites visibles,
; musique [partie+0E9h] (Music_SetGameflowMood_28C73), attend le choix (sub_6162 → numéro de
; sprite), puis exécute le script EFCT de ce sprite (Gameflow_FindSprite_35C9 : +5 = paires,
; +7 = longueur) par Gameflow_RunScriptPairs_36CF.
; ==============================================================================================
Gameflow_PlayScene_3B0B	proc far		; CODE XREF: Gameflow_MainLoop_3D2E+2D6p

var_11A		= word ptr -11Ah
var_BD		= dword	ptr -0BDh
var_B9		= dword	ptr -0B9h
var_B5		= dword	ptr -0B5h
var_A0		= word ptr -0A0h
var_9E		= word ptr -9Eh
var_72		= word ptr -72h
var_68		= word ptr -68h
var_53		= word ptr -53h
var_45		= word ptr -45h
var_39		= word ptr -39h
var_33		= byte ptr -33h
var_1E		= byte ptr -1Eh
var_13		= byte ptr -13h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_5		= byte ptr -5
var_4		= word ptr -4
var_2		= byte ptr -2
var_1		= byte ptr -1
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 11Ah
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	al, [si+0FAh]
		mov	byte_48A29, al
		mov	byte_495FC, 0
		cmp	byte ptr [si+0E3h], 0
		jz	short loc_3B40
		mov	byte ptr [si+0E3h], 0
		push	si
		push	cs
		call	near ptr sub_358C
		add	sp, 2
		push	si
		call	sub_41F2E
		add	sp, 2

loc_3B40:				; CODE XREF: Gameflow_PlayScene_3B0B+1Dj
		mov	al, [si+0FCh]
		mov	[bp+var_2], al
		mov	di, [si+0E4h]
		lea	ax, [bp+var_11A]
		push	ax
		call	StreamReader_ConstructVariantA_3B2A9
		add	sp, 2
		mov	[bp+var_11A], 556h
		mov	[bp+var_B9], 100h
		mov	[bp+var_BD], 0
		mov	[bp+var_11A], 56Eh
		mov	[bp+var_9E], 0
		xor	ax, ax
		mov	[bp+var_A0], ax
		movsx	eax, ax
		mov	[bp+var_B5], eax
		push	di
		push	word_46F46
		push	0FFh
		push	0Ah
		lea	ax, [bp+var_72]
		push	ax
		call	sub_4C1F
		add	sp, 0Ah
		mov	[bp+var_11A], 586h
		mov	[bp+var_72], 59Eh
		mov	[bp+var_68], 5BEh
		mov	[bp+var_10], 2BDh
		xor	ax, ax
		mov	[bp+var_C], ax
		mov	[bp+var_E], ax
		mov	[bp+var_10], 552h
		push	100h
		push	0
		lea	ax, [bp+var_A]
		push	ax
		call	Palette_Alloc_2CC76
		add	sp, 6
		mov	[bp+var_1E], 0
		mov	[bp+var_13], 0
		mov	al, [bp+var_2]
		mov	[bp+var_33], al
		mov	[bp+var_5], 0FFh
		mov	[bp+var_12], di
		mov	[bp+var_4], 0
		jmp	short loc_3C04
; ���������������������������������������������������������������������������

loc_3BF0:				; CODE XREF: Gameflow_PlayScene_3B0B+108j
		mov	bx, [bp+var_4]
		mov	al, [bx+4]
		push	ax
		lea	ax, [bp+var_11A]
		push	ax
		call	sub_563B
		add	sp, 4

loc_3C04:				; CODE XREF: Gameflow_PlayScene_3B0B+E3j
		lea	ax, [bp+var_4]
		push	ax
		push	si
		call	sub_2FF1E
		add	sp, 4
		or	ax, ax
		jnz	short loc_3BF0
		lea	ax, [bp+var_11A]
		push	ax
		call	sub_5803
		add	sp, 2
		cmp	[bp+var_5], 0FFh
		jz	short loc_3C2F
		mov	al, [bp+var_5]
		mov	[si+0E9h], al

loc_3C2F:				; CODE XREF: Gameflow_PlayScene_3B0B+11Bj
		mov	al, [si+0E9h]
		mov	ah, 0
		push	ax
		call	Music_SetGameflowMood_28C73
		add	sp, 2
		lea	ax, [bp+var_11A]
		push	ax
		call	sub_6162
		add	sp, 2
		mov	[bp+var_1], al
		push	0
		lea	ax, [bp+var_A]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_10]
		push	ax
		nop
		push	cs
		call	near ptr sub_40F3
		add	sp, 4
		mov	[bp+var_72], 522h
		mov	[bp+var_68], 542h
		call	TextScrollDisplayB_ApplyHelperD_3F784
		mov	byte_497C0, 0
		cmp	[bp+var_45], 0
		jz	short loc_3CA0
		mov	ax, [bp+var_45]
		add	ax, 2
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	[bp+var_45]
		call	sub_308
		add	sp, 2
		jmp	short $+2

loc_3CA0:				; CODE XREF: Gameflow_PlayScene_3B0B+177j
		push	2
		lea	ax, [bp+var_39]
		push	ax
		call	sub_49BC
		add	sp, 4
		lea	ax, [bp+var_53]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	0
		lea	ax, [bp+var_72]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		mov	[bp+var_11A], 56Eh
		lea	ax, [bp+var_11A]
		push	ax
		call	ResourceRecord_Helper_3BE15
		add	sp, 2
		push	0
		lea	ax, [bp+var_11A]
		push	ax
		call	StreamReader_ReleaseBuffer_3CEB3
		add	sp, 4
		mov	al, [bp+var_1]
		push	ax
		push	si
		push	cs
		call	near ptr Gameflow_FindSprite_35C9
		add	sp, 4
		mov	bx, ax
		push	word ptr [bx+5]
		mov	al, [bp+var_1]
		push	ax
		push	si
		push	cs
		call	near ptr Gameflow_FindSprite_35C9
		add	sp, 4
		mov	bx, ax
		mov	al, [bx+7]
		push	ax
		push	si
		push	cs
		call	near ptr Gameflow_RunScriptPairs_36CF
		add	sp, 6
		cmp	byte ptr [si+0E3h], 0
		jz	short loc_3D2A
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4

loc_3D2A:				; CODE XREF: Gameflow_PlayScene_3B0B+20Fj
		pop	di
		pop	si
		leave
		retf
Gameflow_PlayScene_3B0B	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE 2026-10-22. Boucle principale du déroulement (machine à états sur [partie+0E8h]) :
; 1 = retour de vol (Gameflow_ReadMissionResult_4B544 → code de sortie [partie+0F8h] : 2 →
; cinématique 33, 3 → recharge gensave.tmp, 4 → menu) ; 0 = menu d'accueil
; (Gameflow_MainMenu_4F1A7) ; 2 = mission suivante ([+0FAh] = [+0FBh], [+0FBh] = FFh) ; 3 =
; chargement de [partie+93h]. Puis [+0E8h] = 4, [+0E3h] = 1, script de la mission
; (Gameflow_LoadMissionScript_4A440, Gameflow_RunScriptPairs_36CF sur partie+7, longueur
; [partie+6]), sauvegarde gensave.tmp si [+0E8h] = 4 ou 2, scènes (Gameflow_PlayScene_3B0B)
; tant que [+0E8h] = 4. [+0E8h] = 1 : si [+0F9h] ≠ FEh Gameflow_SaveTmpState_4BBA0, puis
; Gameflow_WriteMissionOrder_4BBF7 et retour (vol dans STRIKE.EXE). GAMEFLOW_SYSTEM.md § 3.
; ==============================================================================================
Gameflow_MainLoop_3D2E	proc far		; CODE XREF: sub_3166+19DP

var_5A		= word ptr -5Ah
var_A		= word ptr -0Ah
var_8		= byte ptr -8
var_6		= word ptr -6
var_4		= byte ptr -4
var_3		= byte ptr -3
var_2		= byte ptr -2
var_1		= byte ptr -1
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 5Ah
		push	si
		mov	si, [bp+arg_0]
		mov	byte ptr [si+0F8h], 1
		mov	byte ptr [si+3D7h], 0FFh
		push	100h
		push	0
		lea	ax, [bp+var_6]
		push	ax
		call	Palette_Alloc_2CC76
		add	sp, 6
		mov	byte ptr [bp+var_A], 0
		mov	byte ptr [bp+var_A+1], 0
		mov	[bp+var_8], 0
		push	[bp+var_6]
		mov	al, [bp+var_4]
		push	ax
		lea	ax, [bp+var_A]
		push	ax
		lea	ax, [bp+var_6]
		push	ax
		call	Palette_FillRange_2CF08
		add	sp, 8
		push	0
		push	[bp+var_6]
		mov	al, [bp+var_4]
		push	ax
		lea	ax, [bp+var_6]
		push	ax
		call	Palette_Upload_2CDE1
		add	sp, 8
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		push	0
		lea	ax, [bp+var_6]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4

loc_3DA7:				; CODE XREF: Gameflow_MainLoop_3D2E+2EAj
		mov	[bp+var_1], 1
		mov	[bp+var_2], 0
		mov	[bp+var_3], 0
		mov	al, [si+0E8h]
		mov	ah, 0
		mov	bx, ax
		cmp	bx, 3		; switch 4 cases
		jbe	short loc_3DC3
		jmp	loc_3E9D	; default
; ���������������������������������������������������������������������������

loc_3DC3:				; CODE XREF: Gameflow_MainLoop_3D2E+90j
		shl	bx, 1
		jmp	cs:off_404D[bx]	; switch jump

loc_3DCA:				; DATA XREF: seg002:off_404Do
		push	si		; case 0x1
		call	sub_41F4C
		add	sp, 2
		mov	[si+0F8h], al
		mov	al, [si+0F8h]
		mov	ah, 0
		dec	ax
		mov	bx, ax
		cmp	bx, 4		; switch 5 cases
		ja	short loc_3E33	; default
		shl	bx, 1
		jmp	cs:off_4043[bx]	; switch jump

loc_3DEC:				; DATA XREF: seg002:off_4043o
		jmp	short loc_3E33	; case 0x0
; ���������������������������������������������������������������������������

loc_3DEE:				; CODE XREF: Gameflow_MainLoop_3D2E+B9j
					; DATA XREF: seg002:off_4043o
		push	21h ; '!'       ; case 0x2
		push	si
		call	sub_41F38
		add	sp, 4
		mov	[bp+var_2], 1
		jmp	short loc_3E33	; default
; ���������������������������������������������������������������������������

loc_3DFF:				; CODE XREF: Gameflow_MainLoop_3D2E+B9j
					; DATA XREF: seg002:off_4043o
		push	ds		; case 0x3
		push	offset a_tmp	; ".tmp"
		push	ds
		push	offset aGensave	; "gensave"
		push	ds
		push	offset unk_468CC
		lea	ax, [bp+var_5A]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		lea	ax, [bp+var_5A]
		push	ax
		push	si
		call	sub_41FB2
		add	sp, 4
		mov	[bp+var_1], 0
		jmp	short loc_3E33	; default
; ���������������������������������������������������������������������������

loc_3E2A:				; CODE XREF: Gameflow_MainLoop_3D2E+B9j
					; DATA XREF: seg002:off_4043o
		mov	byte ptr [si+0E7h], 2 ;	case 0x4
		mov	[bp+var_2], 1

loc_3E33:				; CODE XREF: Gameflow_MainLoop_3D2E+B5j
					; Gameflow_MainLoop_3D2E:loc_3DECj ...
		jmp	short loc_3EAD	; default
; ���������������������������������������������������������������������������

loc_3E35:				; CODE XREF: Gameflow_MainLoop_3D2E+97j
					; DATA XREF: seg002:off_404Do
		cmp	byte ptr [si+0E7h], 0 ;	case 0x0
		jnz	short loc_3E4E
		call	sub_423B5
		mov	al, byte_495FC
		mov	ah, 0
		neg	ax
		sbb	ax, ax
		inc	ax
		mov	[bp+var_3], al

loc_3E4E:				; CODE XREF: Gameflow_MainLoop_3D2E+10Cj
		mov	[bp+var_2], 1
		jmp	short loc_3EAD
; ���������������������������������������������������������������������������

loc_3E54:				; CODE XREF: Gameflow_MainLoop_3D2E+97j
					; DATA XREF: seg002:off_404Do
		mov	al, [si+0FBh]	; case 0x2
		mov	[si+0FAh], al
		mov	byte ptr [si+0FBh], 0FFh
		jmp	short loc_3EAD
; ���������������������������������������������������������������������������

loc_3E63:				; CODE XREF: Gameflow_MainLoop_3D2E+97j
					; DATA XREF: seg002:off_404Do
		mov	ax, si		; case 0x3
		add	ax, 93h	; '�'
		push	ax
		push	si
		call	sub_41FB2
		add	sp, 4
		push	ds
		push	offset a_tmp	; ".tmp"
		push	ds
		push	offset aGensave	; "gensave"
		push	ds
		push	offset unk_468CC
		lea	ax, [bp+var_5A]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		lea	ax, [bp+var_5A]
		push	ax
		push	si
		call	sub_41FB7
		add	sp, 4
		mov	[bp+var_1], 0
		jmp	short loc_3EAD
; ���������������������������������������������������������������������������

loc_3E9D:				; CODE XREF: Gameflow_MainLoop_3D2E+92j
		push	25h ; '%'       ; default
		push	word_432E6
		call	Fatal_Error_310B
		add	sp, 4
		jmp	short $+2

loc_3EAD:				; CODE XREF: Gameflow_MainLoop_3D2E:loc_3E33j
					; Gameflow_MainLoop_3D2E+124j ...
		mov	byte ptr [si+0E8h], 4
		cmp	[bp+var_2], 0
		jnz	short loc_3EBB
		jmp	loc_3FA7
; ���������������������������������������������������������������������������

loc_3EBB:				; CODE XREF: Gameflow_MainLoop_3D2E+188j
					; Gameflow_MainLoop_3D2E+276j
		mov	[bp+var_4], 1
		cmp	byte ptr [si+0E7h], 1
		jnz	short loc_3ECC
		mov	byte ptr [bp+var_6], 0
		jmp	short loc_3EDC
; ���������������������������������������������������������������������������

loc_3ECC:				; CODE XREF: Gameflow_MainLoop_3D2E+196j
		mov	al, [bp+var_3]
		push	ax
		push	si
		call	sub_42025
		add	sp, 4
		mov	byte ptr [bp+var_6], al

loc_3EDC:				; CODE XREF: Gameflow_MainLoop_3D2E+19Cj
		mov	al, byte ptr [bp+var_6]
		mov	ah, 0
		mov	bx, ax
		cmp	bx, 5		; switch 6 cases
		jbe	short loc_3EEB
		jmp	loc_3F9B	; default
; ���������������������������������������������������������������������������

loc_3EEB:				; CODE XREF: Gameflow_MainLoop_3D2E+1B8j
		shl	bx, 1
		jmp	cs:off_4037[bx]	; switch jump

loc_3EF2:				; DATA XREF: seg002:off_4037o
		push	si		; case 0x0
		call	sub_41F1F
		add	sp, 2
		cmp	byte ptr [si+0E7h], 1
		jz	short loc_3F0B
		push	si
		call	sub_42020
		add	sp, 2

loc_3F0B:				; CODE XREF: Gameflow_MainLoop_3D2E+1D2j
		jmp	loc_3F9B	; default
; ���������������������������������������������������������������������������

loc_3F0E:				; CODE XREF: Gameflow_MainLoop_3D2E+1BFj
					; DATA XREF: seg002:off_4037o
		push	ds		; case 0x1
		push	offset a_tmp	; ".tmp"
		push	ds
		push	offset aGensave	; "gensave"
		push	ds
		push	offset unk_468CC
		lea	ax, [bp+var_5A]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		lea	ax, [bp+var_5A]
		push	ax
		push	si
		call	sub_41FB2
		add	sp, 4
		mov	[bp+var_1], 0
		jmp	short loc_3F9B	; default
; ���������������������������������������������������������������������������

loc_3F39:				; CODE XREF: Gameflow_MainLoop_3D2E+1BFj
					; DATA XREF: seg002:off_4037o
		cmp	byte ptr [si+93h], 0 ; case 0x2
		jz	short loc_3F4B
		mov	[bp+var_1], 0
		mov	byte ptr [si+0E8h], 3
		jmp	short loc_3F4F
; ���������������������������������������������������������������������������

loc_3F4B:				; CODE XREF: Gameflow_MainLoop_3D2E+210j
		mov	[bp+var_4], 0

loc_3F4F:				; CODE XREF: Gameflow_MainLoop_3D2E+21Bj
		jmp	short loc_3F9B	; default
; ���������������������������������������������������������������������������

loc_3F51:				; CODE XREF: Gameflow_MainLoop_3D2E+1BFj
					; DATA XREF: seg002:off_4037o
		push	si		; case 0x3
		call	sub_4211F
		add	sp, 2
		or	al, al
		jz	short loc_3F6E
		mov	byte ptr [si+0F9h], 0FEh ; '�'
		mov	byte ptr [si+0E8h], 1
		mov	[bp+var_1], 0
		jmp	short loc_3F72
; ���������������������������������������������������������������������������

loc_3F6E:				; CODE XREF: Gameflow_MainLoop_3D2E+22Ej
		mov	[bp+var_4], 0

loc_3F72:				; CODE XREF: Gameflow_MainLoop_3D2E+23Ej
		jmp	short loc_3F9B	; default
; ���������������������������������������������������������������������������

loc_3F74:				; CODE XREF: Gameflow_MainLoop_3D2E+1BFj
					; DATA XREF: seg002:off_4037o
		push	si		; case 0x4
		call	sub_137FA
		add	sp, 2
		mov	[bp+var_4], 0
		jmp	short loc_3F9B	; default
; ���������������������������������������������������������������������������

loc_3F83:				; CODE XREF: Gameflow_MainLoop_3D2E+1BFj
					; DATA XREF: seg002:off_4037o
		call	sub_423B5	; case 0x5
		mov	al, byte_495FC
		mov	ah, 0
		neg	ax
		sbb	ax, ax
		inc	ax
		mov	[bp+var_3], al
		mov	[bp+var_4], 0
		jmp	short $+2

loc_3F9B:				; CODE XREF: Gameflow_MainLoop_3D2E+1BAj
					; Gameflow_MainLoop_3D2E:loc_3F0Bj ...
		mov	al, [bp+var_4]	; default
		mov	ah, 0
		or	ax, ax
		jnz	short loc_3FA7
		jmp	loc_3EBB
; ���������������������������������������������������������������������������

loc_3FA7:				; CODE XREF: Gameflow_MainLoop_3D2E+18Aj
					; Gameflow_MainLoop_3D2E+274j
		mov	byte ptr [si+0E3h], 1
		cmp	[bp+var_1], 0
		jz	short loc_4000
		push	si
		call	sub_41F29
		add	sp, 2
		mov	ax, si
		add	ax, 7
		push	ax
		mov	al, [si+6]
		push	ax
		push	si
		push	cs
		call	near ptr Gameflow_RunScriptPairs_36CF
		add	sp, 6
		cmp	byte ptr [si+0E8h], 4
		jz	short loc_3FDB
		cmp	byte ptr [si+0E8h], 2
		jnz	short loc_4000

loc_3FDB:				; CODE XREF: Gameflow_MainLoop_3D2E+2A4j
		push	ds
		push	offset a_tmp	; ".tmp"
		push	ds
		push	offset aGensave	; "gensave"
		push	ds
		push	offset unk_468CC
		lea	ax, [bp+var_5A]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		lea	ax, [bp+var_5A]
		push	ax
		push	si
		call	sub_41FB7
		add	sp, 4

loc_4000:				; CODE XREF: Gameflow_MainLoop_3D2E+282j
					; Gameflow_MainLoop_3D2E+2ABj
		jmp	short loc_400A
; ���������������������������������������������������������������������������

loc_4002:				; CODE XREF: Gameflow_MainLoop_3D2E+2E1j
		push	si
		push	cs
		call	near ptr Gameflow_PlayScene_3B0B
		add	sp, 2

loc_400A:				; CODE XREF: Gameflow_MainLoop_3D2E:loc_4000j
		cmp	byte ptr [si+0E8h], 4
		jz	short loc_4002
		cmp	byte ptr [si+0E8h], 1
		jz	short loc_401B
		jmp	loc_3DA7
; ���������������������������������������������������������������������������

loc_401B:				; CODE XREF: Gameflow_MainLoop_3D2E+2E8j
		cmp	byte ptr [si+0F9h], 0FEh ; '�'
		jz	short loc_402B
		push	si
		call	sub_41F51
		add	sp, 2

loc_402B:				; CODE XREF: Gameflow_MainLoop_3D2E+2F2j
		push	si
		call	sub_41F56
		add	sp, 2
		pop	si
		leave
		retf
Gameflow_MainLoop_3D2E	endp

; ���������������������������������������������������������������������������
off_4037	dw offset loc_3EF2	; DATA XREF: Gameflow_MainLoop_3D2E+1BFr
		dw offset loc_3F0E	; jump table for switch	statement
		dw offset loc_3F39
		dw offset loc_3F51
		dw offset loc_3F74
		dw offset loc_3F83
off_4043	dw offset loc_3DEC	; DATA XREF: Gameflow_MainLoop_3D2E+B9r
		dw offset loc_3DEC	; jump table for switch	statement
		dw offset loc_3DEE
		dw offset loc_3DFF
		dw offset loc_3E2A
off_404D	dw offset loc_3E35	; DATA XREF: Gameflow_MainLoop_3D2E+97r
		dw offset loc_3DCA	; jump table for switch	statement
		dw offset loc_3E54
		dw offset loc_3E63

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_4055	proc far		; CODE XREF: sub_6162+68P sub_6162+DAP

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	short loc_4073
; ���������������������������������������������������������������������������

loc_4066:				; CODE XREF: sub_4055+2Dj
		mov	bx, [bp+var_2]
		mov	al, [bx+4]
		cmp	al, [bp+arg_2]
		jnz	short loc_4073
		jmp	short loc_4084
; ���������������������������������������������������������������������������

loc_4073:				; CODE XREF: sub_4055+Fj sub_4055+1Aj
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	sub_2FF1E
		add	sp, 4
		or	ax, ax
		jnz	short loc_4066

loc_4084:				; CODE XREF: sub_4055+1Cj
		cmp	[bp+var_2], 0
		jz	short loc_4092
		mov	bx, [bp+var_2]
		mov	ax, [bx+5]
		jmp	short loc_4094
; ���������������������������������������������������������������������������

loc_4092:				; CODE XREF: sub_4055+33j
		xor	ax, ax

loc_4094:				; CODE XREF: sub_4055+3Bj
		pop	si
		leave
		retf
sub_4055	endp

; ���������������������������������������������������������������������������
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_409A	proc far		; CODE XREF: sub_5803+83FP

var_6		= word ptr -6
var_3		= byte ptr -3
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= byte ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	al, [bp+arg_2]
		mov	[bp+var_3], al
		mov	ax, [bp+arg_4]
		mov	[bp+var_6], ax
		push	7
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	di, ax
		or	ax, ax
		jz	short loc_40DE
		mov	word ptr [di], 5CEh
		mov	word ptr [di+2], 0
		mov	word ptr [di], 51Eh
		mov	al, [bp+var_3]
		mov	[di+4],	al
		mov	ax, [bp+var_6]
		mov	[di+5],	ax
		mov	ax, di
		jmp	short loc_40E0
; ���������������������������������������������������������������������������

loc_40DE:				; CODE XREF: sub_409A+25j
		mov	ax, di

loc_40E0:				; CODE XREF: sub_409A+42j
		mov	[bp+var_2], ax
		push	[bp+var_2]
		push	si
		call	LinkedListB_InsertAtTail_2FDF4
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_409A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_40F3	proc far		; CODE XREF: Gameflow_PlayScene_3B0B+159p
					; seg002:0DC0p	...

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_4164
		mov	word ptr [si], 552h
		mov	[bp+var_2], 0
		jmp	short loc_4137
; ���������������������������������������������������������������������������

loc_4110:				; CODE XREF: sub_40F3+53j
		mov	bx, [bp+var_2]
		push	word ptr [bx+5]
		mov	bx, [bp+var_2]
		mov	bx, [bx+5]
		mov	bx, [bx]
		call	dword ptr [bx+14h]
		add	sp, 2
		push	0
		push	[bp+var_2]
		push	si
		call	LinkedListB_FindAndDispatch_2FE19
		add	sp, 6
		mov	[bp+var_2], 0

loc_4137:				; CODE XREF: sub_40F3+1Bj
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	sub_2FF1E
		add	sp, 4
		or	ax, ax
		jnz	short loc_4110
		mov	word ptr [si], 2BDh
		push	si
		call	sub_2FEE0
		add	sp, 2
		test	di, 1
		jz	short loc_4164
		push	si
		call	sub_308
		add	sp, 2

loc_4164:				; CODE XREF: sub_40F3+10j sub_40F3+66j
		pop	di
		pop	si
		leave
		retf
sub_40F3	endp

; ���������������������������������������������������������������������������

loc_4168:				; DATA XREF: dseg:051Eo
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		or	si, si
		jz	short loc_418A
		mov	word ptr [si], 51Eh
		test	di, 1
		jz	short loc_418A
		push	si
		call	sub_308
		add	sp, 2

loc_418A:				; CODE XREF: seg002:0C85j seg002:0C8Fj
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_418E:				; DATA XREF: dseg:0522o
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		or	si, si
		jz	short loc_420A
		mov	word ptr [si], 522h
		mov	word ptr [si+0Ah], 542h
		call	TextScrollDisplayB_ApplyHelperD_3F784
		mov	byte_497C0, 0
		cmp	word ptr [si+2Dh], 0
		jz	short loc_41D2
		mov	ax, [si+2Dh]
		add	ax, 2
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	word ptr [si+2Dh]
		call	sub_308
		add	sp, 2
		jmp	short $+2

loc_41D2:				; CODE XREF: seg002:0CC4j
		push	2
		mov	ax, si
		add	ax, 39h	; '9'
		push	ax
		call	sub_49BC
		add	sp, 4
		mov	ax, si
		add	ax, 1Fh
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	0
		push	si
		call	Scene_Destruct_2DCFC
		add	sp, 4
		test	di, 1
		jz	short loc_420A
		push	si
		call	sub_308
		add	sp, 2

loc_420A:				; CODE XREF: seg002:0CABj seg002:0D0Fj
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_420E:				; DATA XREF: dseg:0546o dseg:05C2o ...
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_4216:				; DATA XREF: dseg:054Eo
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	far ptr	loc_2DD3F
; ���������������������������������������������������������������������������

loc_4222:				; DATA XREF: dseg:054Ao
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	far ptr	loc_2DD61
; ���������������������������������������������������������������������������

loc_422E:				; DATA XREF: dseg:0542o
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	far ptr	loc_2DD37
; ���������������������������������������������������������������������������

loc_423A:				; DATA XREF: dseg:0572o
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		or	si, si
		jz	short loc_4270
		mov	word ptr [si], 56Eh
		push	si
		call	ResourceRecord_Helper_3BE15
		add	sp, 2
		push	0
		push	si
		call	StreamReader_ReleaseBuffer_3CEB3
		add	sp, 4
		test	di, 1
		jz	short loc_4270
		push	si
		call	sub_308
		add	sp, 2

loc_4270:				; CODE XREF: seg002:0D57j seg002:0D75j
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_4274:				; CODE XREF: seg002:0E88j
					; DATA XREF: dseg:058Ao
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		or	si, si
		jnz	short loc_4286
		jmp	loc_4346
; ���������������������������������������������������������������������������

loc_4286:				; CODE XREF: seg002:0D91j
		mov	word ptr [si], 586h
		mov	word ptr [si+0A8h], 59Eh
		mov	word ptr [si+0B2h], 5BEh
		push	0
		mov	ax, si
		add	ax, 110h
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		mov	ax, si
		add	ax, 10Ah
		push	ax
		nop
		push	cs
		call	near ptr sub_40F3
		add	sp, 4
		mov	word ptr [si+0A8h], 522h
		mov	word ptr [si+0B2h], 542h
		call	TextScrollDisplayB_ApplyHelperD_3F784
		mov	byte_497C0, 0
		cmp	word ptr [si+0D5h], 0
		jz	short loc_42F1
		mov	ax, [si+0D5h]
		add	ax, 2
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	word ptr [si+0D5h]
		call	sub_308
		add	sp, 2
		jmp	short $+2

loc_42F1:				; CODE XREF: seg002:0DE1j
		push	2
		mov	ax, si
		add	ax, 0E1h ; '�'
		push	ax
		call	sub_49BC
		add	sp, 4
		mov	ax, si
		add	ax, 0C7h ; '�'
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	0
		mov	ax, si
		add	ax, 0A8h ; '�'
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		mov	word ptr [si], 56Eh
		push	si
		call	ResourceRecord_Helper_3BE15
		add	sp, 2
		push	0
		push	si
		call	StreamReader_ReleaseBuffer_3CEB3
		add	sp, 4
		test	di, 1
		jz	short loc_4346
		push	si
		call	sub_308
		add	sp, 2

loc_4346:				; CODE XREF: seg002:0D93j seg002:0E4Bj
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_434A:				; DATA XREF: dseg:05CAo
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	far ptr	loc_2DD3F
; ���������������������������������������������������������������������������

loc_4356:				; DATA XREF: dseg:05C6o
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	far ptr	loc_2DD61
; ���������������������������������������������������������������������������

loc_4362:				; DATA XREF: dseg:05BEo
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	far ptr	loc_2DD37
; ���������������������������������������������������������������������������

loc_436E:				; DATA XREF: dseg:059Eo
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FF58h
		nop
		nop
		jmp	loc_4274
; ���������������������������������������������������������������������������

loc_437B:				; DATA XREF: dseg:05CEo
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		or	si, si
		jz	short loc_439D
		mov	word ptr [si], 5CEh
		test	di, 1
		jz	short loc_439D
		push	si
		call	sub_308
		add	sp, 2

loc_439D:				; CODE XREF: seg002:0E98j seg002:0EA2j
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_43A1:				; DATA XREF: dseg:05D2o
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		or	si, si
		jz	short loc_43D4
		mov	word ptr [si], 5D2h
		cmp	word ptr [si+5], 0
		jz	short loc_43C5
		push	word ptr [si+5]
		call	sub_308
		add	sp, 2

loc_43C5:				; CODE XREF: seg002:0EC8j
		test	di, 1
		jz	short loc_43D4
		push	si
		call	sub_308
		add	sp, 2

loc_43D4:				; CODE XREF: seg002:0EBEj seg002:0ED9j
		pop	di
		pop	si
		pop	bp
		retf
seg002		ends
