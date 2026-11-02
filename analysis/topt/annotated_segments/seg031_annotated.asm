seg031		segment	para public 'CODE' use16
		assume cs:seg031
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Input_Flush_CDDC (sub_CDDC de OPTEST.EXE). Résumé
; repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — far, LUE 2026-10-17. Vide
; les événements en attente : boucle sur sub_3EA28, sub_6DBF et sub_6BFB jusqu'à ce qu'aucun
; événement ne soit renvoyé.
; ==============================================================================================
Input_Flush_116D1		proc far

var_C		= word ptr -0Ch
var_4		= word ptr -4

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		mov	byte ptr [bp+var_C], 0

loc_116DB:
		lea	ax, [bp+var_C]
		push	ax
		call	TextScroll_FormatAndApply_44826
		add	sp, 2
		cmp	byte ptr [bp+var_C], 0
		jnz	short loc_11713
		lea	ax, [bp+var_C]
		push	ax
		call	sub_AB45
		add	sp, 2
		mov	ah, 0
		or	ax, ax
		jnz	short loc_11711
		lea	ax, [bp+var_4]
		push	ax
		lea	ax, [bp+var_C]
		push	ax
		call	sub_A981
		add	sp, 4
		jmp	short loc_11711

loc_11711:
		jmp	short loc_11713

loc_11713:
		cmp	byte ptr [bp+var_C], 0
		jnz	short loc_116DB
		cmp	byte ptr [bp+var_4], 0
		jnz	short loc_116DB
		leave
		retf
Input_Flush_116D1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_11721		proc far

var_28		= word ptr -28h
var_18		= word ptr -18h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_8		= word ptr -8

		push	bp
		mov	bp, sp
		sub	sp, 28h
		cmp	byte_4F776, 0
		jz	short loc_1175D
		call	sub_4493E
		mov	[bp+var_12], 40Fh
		mov	[bp+var_8], seg seg179
		mov	[bp+var_18], 14h
		mov	[bp+var_14], 3Fh
		lea	ax, [bp+var_8]
		push	ax
		lea	ax, [bp+var_28]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		push	33h
		call	sub_1E67
		add	sp, 8

loc_1175D:
		leave
		retf
sub_11721		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1175F		proc far

var_6C		= word ptr -6Ch
var_44		= word ptr -44h
var_42		= word ptr -42h
var_3F		= word ptr -3Fh
var_3C		= word ptr -3Ch
var_38		= word ptr -38h
var_36		= dword ptr -36h
var_32		= dword ptr -32h
var_2E		= dword ptr -2Eh
var_2A		= word ptr -2Ah
var_28		= word ptr -28h
var_26		= word ptr -26h
var_24		= word ptr -24h
var_22		= word ptr -22h
var_20		= word ptr -20h
var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_1A		= word ptr -1Ah
var_18		= word ptr -18h
var_16		= dword ptr -16h
var_12		= byte ptr -12h
var_11		= byte ptr -11h
var_10		= dword ptr -10h
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_3		= byte ptr -3
var_2		= word ptr -2
arg_0		= byte ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 6Ch
		push	si
		push	di
		push	100h
		push	0
		lea	ax, [bp+var_42]
		push	ax
		call	Palette_Alloc_34A1A
		add	sp, 6
		lea	ax, [bp+var_42]
		push	ax
		call	sub_34B67
		add	sp, 2
		mov	ax, [bp+var_3F]
		mov	[bp+var_44], ax
		push	32h
		push	32h
		push	32h
		push	ds
		push	[bp+var_44]
		call	sub_145E3
		add	sp, 0Ah
		mov	[bp+var_2], ax
		lea	ax, [bp+var_42]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		mov	bx, word_49DF8
		mov	al, [bx+16h]
		mov	ah, 0
		mov	[bp+var_3], al
		mov	al, byte ptr [bp+var_2]
		push	ax
		push	word_49DF8
		mov	bx, word_49DF8
		mov	bx, [bx]
		call	dword ptr [bx+8]
		add	sp, 4
		mov	[bp+var_16], 0
		mov	[bp+var_12], 2
		mov	[bp+var_11], 0
		mov	[bp+var_10], 0
		mov	ax, word_4D36E
		mov	[bp+var_18], ax
		push	[bp+var_18]
		mov	ax, word_49DFA
		add	ax, 2
		push	ax
		call	TextFormat_ApplyStyleAttribute_357D1
		add	sp, 4
		mov	byte ptr [bp+var_6C], 0
		cmp	[bp+arg_0], 56h
		jnz	short loc_1181A
		push	1C6h
		push	2F14h
		lea	ax, [bp+var_6C]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 6
		jmp	loc_118B4

loc_1181A:
		cmp	[bp+arg_0], 50h
		jnz	short loc_11832
		push	2F1Fh
		lea	ax, [bp+var_6C]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 4
		jmp	loc_118B4

loc_11832:
		cmp	[bp+arg_0], 49h
		jnz	short loc_1185E
		mov	al, byte_4EBBD
		mov	ah, 0
		push	ax
		mov	al, byte_4EAAA
		mov	ah, 0
		push	ax
		mov	al, byte_4EAAB
		mov	ah, 0
		push	ax
		push	2F2Bh
		lea	ax, [bp+var_6C]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 0Ah
		mov	si, 78h
		jmp	short loc_118B4

loc_1185E:
		cmp	[bp+arg_0], 4Dh
		jnz	short loc_11883
		add	dword_4ED3F, 1388h
		push	large dword_4ED3F
		push	2F3Dh
		lea	ax, [bp+var_6C]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 8
		jmp	short loc_118B4

loc_11883:
		cmp	[bp+arg_0], 58h
		jnz	short loc_1189A
		push	2F43h
		lea	ax, [bp+var_6C]
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		jmp	short loc_118B4

loc_1189A:
		cmp	[bp+arg_0], 53h
		jnz	short loc_118B4
		push	large dword_4EEA0
		push	2F56h
		lea	ax, [bp+var_6C]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 8

loc_118B4:
		lea	ax, [bp+var_6C]
		push	ax
		push	word_49DFA
		call	sub_375EF
		add	sp, 4
		mov	[bp+var_1A], ax
		mov	ax, [bp+var_1A]
		add	ax, 14h
		mov	si, ax
		mov	[bp+var_6], 14h
		mov	ax, si
		sar	ax, 1
		mov	dx, 0A0h
		sub	dx, ax
		mov	[bp+var_8], dx
		mov	ax, [bp+var_6]
		sar	ax, 1
		mov	dx, 64h
		sub	dx, ax
		mov	di, dx
		mov	ax, [bp+var_8]
		add	ax, si
		dec	ax
		mov	[bp+var_A], ax
		mov	ax, di
		add	ax, [bp+var_6]
		dec	ax
		mov	[bp+var_C], ax
		mov	ax, [bp+var_8]
		mov	[bp+var_24], ax
		mov	[bp+var_26], di
		mov	ax, [bp+var_A]
		mov	[bp+var_28], ax
		mov	ax, [bp+var_C]
		mov	[bp+var_2A], ax
		mov	ax, [bp+var_24]
		mov	[bp+var_22], ax
		mov	ax, [bp+var_26]
		mov	[bp+var_20], ax
		mov	ax, [bp+var_28]
		mov	[bp+var_1E], ax
		mov	ax, [bp+var_2A]
		mov	[bp+var_1C], ax
		mov	ax, si
		imul	[bp+var_6]
		movsx	eax, ax
		mov	[bp+var_2E], eax
		mov	eax, [bp+var_2E]
		mov	[bp+var_32], eax
		push	1
		push	0
		push	2
		push	large [bp+var_32]
		push	6C14h
		call	Memory_TypedFreeWrapper_32871
		add	sp, 0Ch
		mov	word ptr [bp+var_36+2], dx
		mov	word ptr [bp+var_36], ax
		mov	eax, [bp+var_36]
		mov	[bp+var_16], eax
		mov	[bp+var_12], 2
		mov	[bp+var_11], 1
		mov	[bp+var_10], 0
		mov	eax, [bp+var_32]
		mov	[bp+var_10], eax
		lea	ax, [bp+var_22]
		push	ax
		push	0
		mov	al, [bp+var_12]
		push	ax
		push	word ptr [bp+var_16+2]
		push	word ptr [bp+var_16]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	word_4D36E
		call	Surface_SaveRect_392F6
		add	sp, 8
		push	0
		push	[bp+var_C]
		push	[bp+var_A]
		push	di
		push	[bp+var_8]
		push	word_4D36E
		call	sub_37A76
		add	sp, 0Ch
		mov	ax, [bp+var_1A]
		sar	ax, 1
		mov	dx, 0A0h
		sub	dx, ax
		mov	[bp+var_38], dx
		lea	ax, [bp+var_6C]
		push	ax
		mov	ax, di
		add	ax, 5
		push	ax
		push	[bp+var_38]
		push	large 2F66h
		push	word_49DFA
		call	Widget_RenderComplexLayoutWrapper_375C2
		add	sp, 0Ah
		push	cs
		call	near ptr Input_Flush_116D1

loc_119E9:
		push	0FFh
		lea	ax, [bp+var_3C]
		push	ax
		call	Keyboard_QueryAndDispatch_443C0
		add	sp, 4
		cmp	byte ptr [bp+var_3C], 1
		jnz	short loc_119E9
		cmp	[bp+arg_0], 58h
		jnz	short loc_11A0F
		cmp	byte ptr [bp+var_3C+1], 15h
		jnz	short loc_11A0F
		nop
		push	cs
		call	near ptr sub_11B62

loc_11A0F:
		lea	ax, [bp+var_22]
		push	ax
		push	0
		mov	al, [bp+var_12]
		push	ax
		push	word ptr [bp+var_16+2]
		push	word ptr [bp+var_16]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	word_4D36E
		call	Surface_RestoreRect_38CDA
		add	sp, 8
		mov	al, [bp+var_3]
		push	ax
		push	word_49DF8
		mov	bx, word_49DF8
		mov	bx, [bx]
		call	dword ptr [bx+8]
		add	sp, 4
		cmp	[bp+var_11], 0
		jz	short loc_11A70
		cmp	[bp+var_16], 0
		jz	short loc_11A70
		push	0
		mov	al, [bp+var_12]
		push	ax
		lea	ax, word ptr [bp+var_16]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_11A70

loc_11A70:
		mov	[bp+var_16], 0
		mov	[bp+var_11], 0
		mov	[bp+var_10], 0
		pop	di
		pop	si
		leave
		retf
sub_1175F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_11A88		proc far

var_2		= byte ptr -2
var_1		= byte ptr -1

		push	bp
		mov	bp, sp
		sub	sp, 2
		cmp	byte_4F70A, 1
		jz	short loc_11A9C
		cmp	byte_4F72B, 1
		jnz	short loc_11AA1

loc_11A9C:
		mov	ax, 1
		jmp	short loc_11AA3

loc_11AA1:
		xor	ax, ax

loc_11AA3:
		mov	[bp+var_1], al
		cmp	[bp+var_1], 0
		jnz	short loc_11AAF
		jmp	loc_11B60

loc_11AAF:
		mov	[bp+var_2], 0
		cmp	byte_4F6F6, 1
		jnz	short loc_11AE4
		call	sub_A051
		mov	ah, 0
		or	ax, ax
		jnz	short loc_11AE2
		push	0
		call	sub_45168
		add	sp, 2
		or	al, al
		jz	short loc_11AE2
		push	1
		push	0
		push	64CBh
		call	sub_47BF5
		add	sp, 6

loc_11AE2:
		jmp	short loc_11B60

loc_11AE4:
		cmp	byte_4F6FE, 1
		jnz	short loc_11AFC
		call	sub_A051
		mov	ah, 0
		or	ax, ax
		jnz	short loc_11AFA
		push	cs
		call	near ptr sub_11721

loc_11AFA:
		jmp	short loc_11B60

loc_11AFC:
		cmp	byte_4F701, 1
		jnz	short loc_11B09
		mov	[bp+var_2], 56h
		jmp	short loc_11B4F

loc_11B09:
		cmp	byte_4F6EB, 1
		jnz	short loc_11B16
		mov	[bp+var_2], 50h
		jmp	short loc_11B4F

loc_11B16:
		cmp	byte_4F6FF, 1
		jnz	short loc_11B23
		mov	[bp+var_2], 58h
		jmp	short loc_11B4F

loc_11B23:
		cmp	byte_4F6F1, 1
		jnz	short loc_11B30
		mov	[bp+var_2], 53h
		jmp	short loc_11B4F

loc_11B30:
		cmp	byte_49DF1, 0
		jz	short loc_11B4F
		cmp	byte_4F6E9, 1
		jnz	short loc_11B44
		mov	[bp+var_2], 49h
		jmp	short loc_11B4F

loc_11B44:
		cmp	byte_4F704, 1
		jnz	short loc_11B4F
		mov	[bp+var_2], 4Dh

loc_11B4F:
		cmp	[bp+var_2], 0
		jz	short loc_11B60
		mov	al, [bp+var_2]
		push	ax
		push	cs
		call	near ptr sub_1175F
		add	sp, 2

loc_11B60:
		leave
		retf
sub_11A88		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_11B62		proc far
		push	bp
		mov	bp, sp
		call	sub_A07C
		mov	byte_4CA67, 1
		call	sub_AD7F
		call	sub_35DEB
		push	2F6Dh
		call	CRT_Msg_NullPtrAssign
		add	sp, 2
		push	1
		call	CRT_Exit
		add	sp, 2
		pop	bp
		retf
sub_11B62		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Input_CheckSkip_D24A (sub_D24A de OPTEST.EXE). Résumé
; repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — far, LUE 2026-10-17.
; Renvoie 1 si la séquence en cours doit être passée : byte_495FC déjà posé ; touche Échap
; (code 1, pose byte_495FC = 1) ; touche Espace (code 57) ; ou clic (événement de type 2
; renvoyé par sub_3EA28). Appelle d'abord sub_D157 (pas lue).
; ==============================================================================================
Input_CheckSkip_11B90		proc far

var_C		= word ptr -0Ch
var_4		= word ptr -4

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	cs
		call	near ptr sub_11A88
		cmp	byte_4F55C, 0
		jz	short loc_11BA5
		mov	al, 1
		leave
		retf

loc_11BA5:
		mov	byte ptr [bp+var_C], 0
		lea	ax, [bp+var_C]
		push	ax
		call	TextScroll_FormatAndApply_44826
		add	sp, 2
		cmp	byte ptr [bp+var_C], 0
		jnz	short loc_11BE1
		lea	ax, [bp+var_C]
		push	ax
		call	sub_AB45
		add	sp, 2
		mov	ah, 0
		or	ax, ax
		jnz	short loc_11BDF
		lea	ax, [bp+var_4]
		push	ax
		lea	ax, [bp+var_C]
		push	ax
		call	sub_A981
		add	sp, 4
		jmp	short loc_11BDF

loc_11BDF:
		jmp	short loc_11BE1

loc_11BE1:
		cmp	byte ptr [bp+var_4], 2
		jnz	short loc_11C02
		cmp	byte ptr [bp+var_4+1], 1
		jnz	short loc_11BF8
		mov	byte_4F55C, 1
		mov	al, 1
		leave
		retf
		jmp	short loc_11C02

loc_11BF8:
		cmp	byte ptr [bp+var_4+1], 39h
		jnz	short loc_11C02
		mov	al, 1
		leave
		retf

loc_11C02:
		cmp	byte ptr [bp+var_C], 2
		jnz	short loc_11C0C
		mov	al, 1
		leave
		retf

loc_11C0C:
		mov	al, 0
		leave
		retf
Input_CheckSkip_11B90		endp
seg031		ends
