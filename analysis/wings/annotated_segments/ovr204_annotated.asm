ovr204		segment	para public 'OVERLAY' use16
		assume cs:ovr204
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_72760		proc far

var_18		= dword ptr -18h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= byte ptr  10h

		push	bp
		mov	bp, sp
		sub	sp, 18h
		push	si
		push	di
		mov	di, [bp+arg_6]
		mov	si, [bp+arg_8]
		movzx	eax, di
		movzx	edx, si
		imul	eax, edx
		mov	[bp+var_4], eax
		cmp	byte_5B3D9, 0
		jz	short loc_72789
		mov	[bp+arg_A], 3

loc_72789:
		push	1
		push	0
		mov	al, [bp+arg_A]
		push	ax
		push	large [bp+var_4]
		push	67B0h
		call	Memory_TypedFreeWrapper_447E1
		add	sp, 0Ch
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		cmp	[bp+var_8], 0
		jnz	short loc_727B6
		push	9030h
		call	sub_9D47
		pop	cx

loc_727B6:
		les	bx, [bp+arg_0]
		mov	al, [bp+arg_A]
		mov	es:[bx], al
		mov	es:[bx+5], di
		mov	es:[bx+7], si
		mov	al, es:[bx]
		push	ax
		push	large [bp+var_8]
		call	sub_42A76
		push	dx
		push	ax
		pop	eax
		add	sp, 6
		mov	[bp+var_C], eax
		push	1
		push	0
		les	bx, [bp+arg_0]
		mov	al, es:[bx]
		push	ax
		mov	ax, si
		shl	ax, 2
		movzx	eax, ax
		push	eax
		push	67B0h
		call	Memory_TypedFreeWrapper_447E1
		add	sp, 0Ch
		mov	word ptr [bp+var_10+2], dx
		mov	word ptr [bp+var_10], ax
		les	bx, [bp+arg_0]
		mov	al, es:[bx]
		push	ax
		push	dx
		push	word ptr [bp+var_10]
		call	sub_42A76
		push	dx
		push	ax
		pop	eax
		add	sp, 6
		les	bx, [bp+arg_0]
		mov	es:[bx+1], eax
		cmp	[bp+var_10], 0
		jnz	short loc_72835
		push	9030h
		call	sub_9D47
		pop	cx

loc_72835:
		push	0
		les	bx, [bp+arg_0]
		mov	al, es:[bx]
		push	ax
		push	large [bp+var_10]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		mov	[bp+var_12], dx
		mov	[bp+var_14], ax
		mov	[bp+var_18], 0
		jmp	short loc_72883

loc_7285D:
		movzx	eax, di
		mov	edx, [bp+var_18]
		imul	edx, eax
		mov	eax, [bp+var_C]
		add	eax, edx
		mov	dx, word ptr [bp+var_18]
		shl	dx, 2
		les	bx, [bp+var_14]
		add	bx, dx
		mov	es:[bx], eax
		inc	[bp+var_18]

loc_72883:
		movzx	eax, si
		cmp	eax, [bp+var_18]
		jg	short loc_7285D
		les	bx, [bp+arg_0]
		mov	al, es:[bx]
		push	ax
		push	large [bp+var_10]
		call	sub_42A76
		push	dx
		push	ax
		pop	eax
		add	sp, 6
		les	bx, [bp+arg_0]
		mov	es:[bx+1], eax
		push	2
		mov	ax, [bp+arg_0]
		inc	ax
		push	[bp+arg_2]
		push	ax
		call	sub_42A76
		push	dx
		push	ax
		pop	eax
		add	sp, 6
		les	bx, [bp+arg_0]
		mov	es:[bx+9], eax
		push	[bp+arg_2]
		push	bx
		nop
		push	cs
		call	near ptr sub_728E3
		add	sp, 4
		mov	eax, [bp+var_4]
		shld	edx, eax, 10h
		pop	di
		pop	si
		leave
		retf
sub_72760		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_728E3		proc far

var_1C		= word ptr -1Ch
var_1A		= word ptr -1Ah
var_18		= dword ptr -18h
var_14		= byte ptr -14h
var_13		= byte ptr -13h
var_12		= dword ptr -12h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= dword ptr -0Ah
var_6		= byte ptr -6
var_5		= byte ptr -5
var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 1Ch
		push	si
		les	bx, [bp+arg_0]
		cmp	dword ptr es:[bx+1], 0
		jnz	short loc_728F8
		jmp	loc_729EE

loc_728F8:
		push	large es:[bx+1]
		call	sub_42AE4
		add	sp, 4
		mov	si, ax
		mov	eax, [si]
		mov	[bp+var_A], eax
		mov	al, [si+4]
		mov	[bp+var_6], al
		mov	al, [si+5]
		mov	[bp+var_5], al
		mov	eax, [si+6]
		mov	[bp+var_4], eax
		push	0
		les	bx, [bp+arg_0]
		mov	al, es:[bx]
		push	ax
		push	large [bp+var_A]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		mov	[bp+var_C], dx
		mov	[bp+var_E], ax
		les	bx, [bp+var_E]
		push	large es:[bx]
		call	sub_42AE4
		add	sp, 4
		mov	si, ax
		mov	eax, [si]
		mov	[bp+var_18], eax
		mov	al, [si+4]
		mov	[bp+var_14], al
		mov	al, [si+5]
		mov	[bp+var_13], al
		mov	eax, [si+6]
		mov	[bp+var_12], eax
		push	0
		les	bx, [bp+arg_0]
		mov	al, es:[bx]
		push	ax
		push	large [bp+var_18]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		mov	[bp+var_1A], dx
		mov	[bp+var_1C], ax
		cmp	[bp+var_13], 0
		jz	short loc_729AE
		cmp	[bp+var_18], 0
		jz	short loc_729AE
		push	0
		mov	al, [bp+var_14]
		push	ax
		lea	ax, word ptr [bp+var_18]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_729AE

loc_729AE:
		mov	[bp+var_18], 0
		mov	[bp+var_13], 0
		mov	[bp+var_12], 0
		cmp	[bp+var_5], 0
		jz	short loc_729E6
		cmp	[bp+var_A], 0
		jz	short loc_729E6
		push	0
		mov	al, [bp+var_6]
		push	ax
		lea	ax, word ptr [bp+var_A]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_729E6

loc_729E6:
		mov	dx, [bp+var_1A]
		mov	ax, [bp+var_1C]
		jmp	short loc_729F2

loc_729EE:
		xor	dx, dx
		xor	ax, ax

loc_729F2:
		pop	si
		leave
		retf
sub_728E3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_729F5		proc far

var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	si, [bp+arg_6]
		push	large 0FFFFFFFFh
		push	large 4
		push	ss
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	si
		call	StreamReader_ReadTyped_529F9
		add	sp, 0Eh
		push	2
		push	large [bp+var_4]
		push	[bp+arg_4]
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_72760
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_8], eax
		cmp	eax, 0
		jz	short loc_72A50
		push	large 0FFFFFFFFh
		push	eax
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_728E3
		add	sp, 4
		push	dx
		push	ax
		push	si
		call	StreamReader_ReadTyped_529F9
		add	sp, 0Eh

loc_72A50:
		cmp	[bp+var_8], 0
		jz	short loc_72A5C
		mov	ax, 1
		jmp	short loc_72A5E

loc_72A5C:
		xor	ax, ax

loc_72A5E:
		pop	si
		leave
		retf
sub_729F5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_72A61		proc far

var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah
arg_6		= dword ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 8
		mov	eax, [bp+arg_6]
		mov	[bp+var_4], eax
		push	2
		les	bx, word ptr [bp+var_4]
		push	word ptr es:[bx+2]
		push	word ptr es:[bx]
		push	[bp+arg_4]
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_72760
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_8], eax
		cmp	eax, 0
		jz	short loc_72AB9
		push	word ptr [bp+var_8]
		mov	ax, word ptr [bp+arg_6]
		add	ax, 4
		push	word ptr [bp+arg_6+2]
		push	ax
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_728E3
		add	sp, 4
		push	dx
		push	ax
		call	sub_3609
		add	sp, 0Ah

loc_72AB9:
		cmp	[bp+var_8], 0
		jz	short loc_72AC5
		mov	ax, 1
		jmp	short loc_72AC7

loc_72AC5:
		xor	ax, ax

loc_72AC7:
		leave
		retf
sub_72A61		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_72AC9		proc far

arg_0		= dword ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h

		push	bp
		mov	bp, sp
		push	si
		push	2
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_72760
		add	sp, 0Ch
		mov	si, ax
		or	si, si
		jz	short loc_72B0A
		push	large 0FFFFFFFFh
		movsx	eax, si
		push	eax
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_728E3
		add	sp, 4
		push	dx
		push	ax
		push	[bp+arg_A]
		call	StreamReader_ReadTyped_529F9
		add	sp, 0Eh

loc_72B0A:
		or	si, si
		jz	short loc_72B13
		mov	ax, 1
		jmp	short loc_72B15

loc_72B13:
		xor	ax, ax

loc_72B15:
		pop	si
		pop	bp
		retf
sub_72AC9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_72B18		proc far

arg_0		= dword ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_A]
		push	2
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_72760
		add	sp, 0Ch
		mov	di, ax
		or	di, di
		jz	short loc_72B56
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_728E3
		add	sp, 4
		push	dx
		push	ax
		push	large [si+4Dh]
		push	si
		call	sub_549D4
		add	sp, 0Ah

loc_72B56:
		or	di, di
		jz	short loc_72B5F
		mov	ax, 1
		jmp	short loc_72B61

loc_72B5F:
		xor	ax, ax

loc_72B61:
		pop	di
		pop	si
		pop	bp
		retf
sub_72B18		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; TextureRecord_LoadFromPakOrFile_BAE1C (sub_BAE1C de PACIFIC.EXE). Résumé repris de
; PACIFIC.EXE ; appelants et contexte à revérifier ici. — far. LUE 2026-11-05. Avec un PAK :
; se place sur l'entrée demandée (sub_7844) puis TextureRecord_ReadImage_BAD4F. Sans PAK :
; ouvre TXM\<nom> (extension aTXM_1) et lit l'image de ce fichier.
; ==============================================================================================
TextureRecord_LoadFromPakOrFile_72B65		proc far

var_B0		= word ptr -0B0h
var_52		= word ptr -52h
var_1		= byte ptr -1
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 0B0h
		push	si
		push	di
		mov	si, [bp+arg_4]
		mov	di, [bp+arg_6]
		mov	[bp+var_1], 0
		or	di, di
		jz	short loc_72B9A
		push	[bp+arg_8]
		push	di
		call	IndexedRecordReader_AdvanceIndex_54C22
		add	sp, 4
		push	di
		push	si
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_729F5
		add	sp, 8
		mov	[bp+var_1], al
		jmp	short loc_72BF5

loc_72B9A:
		push	ds
		push	offset aTXM
		push	ds
		push	si
		push	ds
		push	offset aTXM_1
		lea	ax, [bp+var_52]
		push	ax
		call	sub_1F0C4
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_52]
		push	ax
		lea	ax, [bp+var_B0]
		push	ax
		call	StreamReader_ConstructVariantC_524DA
		add	sp, 6
		lea	ax, [bp+var_B0]
		push	ax
		call	StreamReader_ValidateState_5280D
		pop	cx
		or	al, al
		jz	short loc_72BE6
		lea	ax, [bp+var_B0]
		push	ax
		push	si
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_729F5
		add	sp, 8
		mov	[bp+var_1], al

loc_72BE6:
		push	2
		lea	ax, [bp+var_B0]
		push	ax
		call	StreamReader_Close_52616
		add	sp, 4

loc_72BF5:
		mov	al, [bp+var_1]
		pop	di
		pop	si
		leave
		retf
TextureRecord_LoadFromPakOrFile_72B65		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_72BFC		proc far

var_18		= dword ptr -18h
var_14		= byte ptr -14h
var_13		= byte ptr -13h
var_12		= dword ptr -12h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= dword ptr -0Ah
var_6		= byte ptr -6
var_5		= byte ptr -5
var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 18h
		push	si
		les	bx, [bp+arg_0]
		cmp	byte ptr es:[bx], 0FFh
		jnz	short loc_72C11
		mov	ax, 1
		jmp	short loc_72C13

loc_72C11:
		xor	ax, ax

loc_72C13:
		or	al, al
		jz	short loc_72C33
		les	bx, [bp+arg_0]
		mov	dword ptr es:[bx+1], 0
		mov	dword ptr es:[bx+9], 0
		mov	byte ptr es:[bx], 2
		jmp	loc_72D56

loc_72C33:
		les	bx, [bp+arg_0]
		cmp	dword ptr es:[bx+1], 0
		jnz	short loc_72C41
		jmp	loc_72D56

loc_72C41:
		push	large es:[bx+1]
		call	sub_42AE4
		add	sp, 4
		mov	si, ax
		mov	eax, [si]
		mov	[bp+var_A], eax
		mov	al, [si+4]
		mov	[bp+var_6], al
		mov	al, [si+5]
		mov	[bp+var_5], al
		mov	eax, [si+6]
		mov	[bp+var_4], eax
		push	0
		les	bx, [bp+arg_0]
		mov	al, es:[bx]
		push	ax
		push	large [bp+var_A]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		mov	[bp+var_C], dx
		mov	[bp+var_E], ax
		les	bx, [bp+var_E]
		push	large es:[bx]
		call	sub_42AE4
		add	sp, 4
		mov	si, ax
		mov	eax, [si]
		mov	[bp+var_18], eax
		mov	al, [si+4]
		mov	[bp+var_14], al
		mov	al, [si+5]
		mov	[bp+var_13], al
		mov	eax, [si+6]
		mov	[bp+var_12], eax
		push	0
		les	bx, [bp+arg_0]
		mov	al, es:[bx]
		push	ax
		lea	ax, word ptr [bp+var_18]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		push	0
		les	bx, [bp+arg_0]
		mov	al, es:[bx]
		push	ax
		lea	ax, word ptr [bp+var_A]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		les	bx, [bp+arg_0]
		mov	dword ptr es:[bx+1], 0
		mov	dword ptr es:[bx+9], 0
		cmp	[bp+var_13], 0
		jz	short loc_72D1E
		cmp	[bp+var_18], 0
		jz	short loc_72D1E
		push	0
		mov	al, [bp+var_14]
		push	ax
		lea	ax, word ptr [bp+var_18]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_72D1E

loc_72D1E:
		mov	[bp+var_18], 0
		mov	[bp+var_13], 0
		mov	[bp+var_12], 0
		cmp	[bp+var_5], 0
		jz	short loc_72D56
		cmp	[bp+var_A], 0
		jz	short loc_72D56
		push	0
		mov	al, [bp+var_6]
		push	ax
		lea	ax, word ptr [bp+var_A]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_72D56

loc_72D56:
		pop	si
		leave
		retf
sub_72BFC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; TextCycler_ReleaseResource_BB01A (sub_BB01A de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à TextCycler_ReleaseResource_A7538 (sub_A7538 de STRIKE.EXE). Résumé repris
; de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, combine
; TextCycler_Helper2_A74E3 et sub_346 (désallocation runtime).
; ==============================================================================================
TextCycler_ReleaseResource_72D59		proc far

arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jz	short loc_72D84
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_72BFC
		add	sp, 4
		test	si, 1
		jz	short loc_72D84
		push	large [bp+arg_0]
		call	sub_349
		add	sp, 4

loc_72D84:
		pop	si
		pop	bp
		retf
TextCycler_ReleaseResource_72D59		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_72D87		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	di, [bp+arg_6]
		mov	ax, di
		imul	[bp+arg_8]
		les	bx, [bp+arg_0]
		mov	es:[bx+16h], ax
		mov	ax, [bp+arg_A]
		mov	es:[bx+0Eh], ax
		push	seg stub204
		push	offset sub_590C5
		push	15h
		movsx	eax, word ptr es:[bx+0Eh]
		push	eax
		push	large 0E0000h
		push	0
		call	sub_3846
		add	sp, 10h
		les	bx, [bp+arg_0]
		mov	es:[bx+12h], dx
		mov	es:[bx+10h], ax
		cmp	dword ptr es:[bx+10h], 0
		jnz	short loc_72DE1
		push	9029h
		call	sub_9D47
		pop	cx

loc_72DE1:
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+10h]
		mov	[bp+var_4], eax
		xor	si, si
		jmp	short loc_72E0A

loc_72DF1:
		push	2
		push	[bp+arg_8]
		push	di
		push	[bp+arg_4]
		push	large [bp+var_4]
		push	cs
		call	near ptr sub_72760
		add	sp, 0Ch
		inc	si
		add	word ptr [bp+var_4], 0Eh

loc_72E0A:
		les	bx, [bp+arg_0]
		cmp	es:[bx+0Eh], si
		jg	short loc_72DF1
		mov	word ptr es:[bx+14h], 0
		push	[bp+arg_2]
		push	bx
		call	sub_385D2
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_72D87		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_72E29		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 4
		mov	cx, [bp+arg_6]
		les	bx, [bp+arg_0]
		cmp	es:[bx+0Eh], cx
		jle	short loc_72E81
		mov	ax, es:[bx+12h]
		mov	dx, es:[bx+10h]
		mov	bx, cx
		imul	bx, bx, 0Eh
		add	dx, bx
		mov	[bp+var_2], ax
		mov	[bp+var_4], dx
		les	bx, [bp+var_4]
		cmp	dword ptr es:[bx+1], 0
		jz	short loc_72E81
		push	large 0FFFFFFFFh
		les	bx, [bp+arg_0]
		movsx	eax, word ptr es:[bx+16h]
		push	eax
		push	[bp+var_2]
		push	dx
		push	cs
		call	near ptr sub_728E3
		add	sp, 4
		push	dx
		push	ax
		push	[bp+arg_4]
		call	StreamReader_ReadTyped_529F9
		add	sp, 0Eh

loc_72E81:
		leave
		retf
sub_72E29		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_72E83		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_4]
		mov	cx, [bp+arg_6]
		les	bx, [bp+arg_0]
		cmp	es:[bx+0Eh], cx
		jle	short loc_72ED1
		mov	ax, es:[bx+12h]
		mov	dx, es:[bx+10h]
		mov	bx, cx
		imul	bx, bx, 0Eh
		add	dx, bx
		mov	[bp+var_2], ax
		mov	[bp+var_4], dx
		les	bx, [bp+var_4]
		cmp	dword ptr es:[bx+1], 0
		jz	short loc_72ED1
		push	ax
		push	dx
		push	cs
		call	near ptr sub_728E3
		add	sp, 4
		push	dx
		push	ax
		push	large [si+4Dh]
		push	si
		call	sub_549D4
		add	sp, 0Ah

loc_72ED1:
		pop	si
		leave
		retf
sub_72E83		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_72ED4		proc far

var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h
arg_C		= word ptr  12h

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		push	di
		mov	di, [bp+arg_8]
		mov	ax, di
		imul	[bp+arg_A]
		movsx	eax, ax
		mov	[bp+var_4], eax
		les	bx, [bp+arg_0]
		mov	ax, [bp+arg_C]
		mov	es:[bx+0Eh], ax
		push	seg stub204
		push	offset sub_590C5
		push	15h
		movsx	eax, word ptr es:[bx+0Eh]
		push	eax
		push	large 0E0000h
		push	0
		call	sub_3846
		add	sp, 10h
		les	bx, [bp+arg_0]
		mov	es:[bx+12h], dx
		mov	es:[bx+10h], ax
		cmp	dword ptr es:[bx+10h], 0
		jnz	short loc_72F32
		push	9029h
		call	sub_9D47
		pop	cx

loc_72F32:
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+10h]
		mov	[bp+var_8], eax
		xor	si, si
		jmp	short loc_72F77

loc_72F42:
		push	2
		push	[bp+arg_A]
		push	di
		push	[bp+arg_6]
		push	large [bp+var_8]
		push	cs
		call	near ptr sub_72760
		add	sp, 0Ch
		push	large [bp+var_4]
		push	large [bp+var_8]
		push	cs
		call	near ptr sub_728E3
		add	sp, 4
		push	dx
		push	ax
		push	[bp+arg_4]
		call	ResourceRecord_ReadFieldGroupA_53F98
		add	sp, 0Ah
		inc	si
		add	word ptr [bp+var_8], 0Eh

loc_72F77:
		les	bx, [bp+arg_0]
		cmp	es:[bx+0Eh], si
		jg	short loc_72F42
		mov	word ptr es:[bx+14h], 0
		push	[bp+arg_2]
		push	bx
		call	sub_385D2
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_72ED4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_72F96		proc far

var_14		= word ptr -14h
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h

		push	bp
		mov	bp, sp
		sub	sp, 14h
		push	si
		les	bx, [bp+arg_0]
		mov	ax, [bp+arg_6]
		mov	es:[bx+0Eh], ax
		push	seg stub204
		push	offset sub_590C5
		push	15h
		movsx	eax, word ptr es:[bx+0Eh]
		push	eax
		push	large 0E0000h
		push	0
		call	sub_3846
		add	sp, 10h
		les	bx, [bp+arg_0]
		mov	es:[bx+12h], dx
		mov	es:[bx+10h], ax
		cmp	dword ptr es:[bx+10h], 0
		jnz	short loc_72FE3
		push	902Ah
		call	sub_9D47
		pop	cx

loc_72FE3:
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+10h]
		mov	[bp+var_4], eax
		xor	si, si
		jmp	short loc_73023

loc_72FF3:
		push	si
		push	[bp+arg_4]
		push	large 2866h
		lea	ax, [bp+var_14]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 8
		mov	ax, [bp+arg_A]
		add	ax, si
		push	ax
		push	[bp+arg_8]
		lea	ax, [bp+var_14]
		push	ax
		push	large [bp+var_4]
		push	cs
		call	near ptr TextureRecord_LoadFromPakOrFile_72B65
		add	sp, 0Ah
		add	word ptr [bp+var_4], 0Eh
		inc	si

loc_73023:
		les	bx, [bp+arg_0]
		cmp	es:[bx+0Eh], si
		jg	short loc_72FF3
		mov	word ptr es:[bx+14h], 0
		push	[bp+arg_2]
		push	bx
		call	sub_385D2
		add	sp, 4
		pop	si
		leave
		retf
sub_72F96		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_73041		proc far

arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jz	short loc_730A1
		les	bx, word ptr [bp+arg_0]
		mov	dword ptr es:[bx+1], 0
		mov	dword ptr es:[bx+9], 0
		mov	byte ptr es:[bx], 2
		push	seg stub204
		push	offset sub_590F2
		push	1Dh
		push	large 0
		push	0Eh
		push	large es:[bx+10h]
		call	sub_B05
		add	sp, 10h
		push	0
		push	large [bp+arg_0]
		push	cs
		call	near ptr TextCycler_ReleaseResource_72D59
		add	sp, 6
		test	si, 1
		jz	short loc_730A1
		push	large [bp+arg_0]
		call	sub_349
		add	sp, 4

loc_730A1:
		pop	si
		pop	bp
		retf
sub_73041		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; TextureTable_Allocate_BB46A (sub_BB46A de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — far. LUE 2026-11-05. Range les deux nombres
; (images simples +0, animées +2) et alloue les deux tables : simples à pas de 14 octets (+4),
; animées à pas de 24 (+8) ; erreur 902Bh / 902Ch si l'allocation échoue.
; ==============================================================================================
TextureTable_Allocate_730A4		proc far

arg_0		= word ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		mov	ax, [bp+arg_4]
		mov	es:[bx], ax
		mov	ax, [bp+arg_6]
		mov	es:[bx+2], ax
		cmp	word ptr es:[bx], 0
		jz	short loc_730F8
		push	seg stub204
		push	offset sub_590C5
		push	15h
		movzx	eax, word ptr es:[bx]
		push	eax
		push	large 0E0000h
		push	0
		call	sub_3846
		add	sp, 10h
		les	bx, [bp+arg_0]
		mov	es:[bx+6], dx
		mov	es:[bx+4], ax
		cmp	dword ptr es:[bx+4], 0
		jnz	short loc_730F8
		push	902Bh
		call	sub_9D47
		pop	cx

loc_730F8:
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+2], 0
		jz	short loc_7313E
		push	seg stub204
		push	offset sub_590C0
		push	15h
		movzx	eax, word ptr es:[bx+2]
		push	eax
		push	large 180000h
		push	0
		call	sub_3846
		add	sp, 10h
		les	bx, [bp+arg_0]
		mov	es:[bx+0Ah], dx
		mov	es:[bx+8], ax
		cmp	dword ptr es:[bx+8], 0
		jnz	short loc_7313E
		push	902Ch
		call	sub_9D47
		pop	cx

loc_7313E:
		pop	bp
		retf
TextureTable_Allocate_730A4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_73140		proc far

var_B2		= word ptr -0B2h
var_54		= word ptr -54h
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= dword ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 0B2h
		push	si
		mov	cx, [bp+arg_4]
		mov	si, [bp+arg_6]
		les	bx, [bp+arg_0]
		cmp	es:[bx], cx
		ja	short loc_73159
		jmp	loc_731E1

loc_73159:
		mov	ax, es:[bx+6]
		mov	dx, es:[bx+4]
		mov	bx, cx
		imul	bx, bx, 0Eh
		add	dx, bx
		mov	word ptr [bp+var_4+2], ax
		mov	word ptr [bp+var_4], dx
		cmp	[bp+arg_8], 0
		jnz	short loc_731CF
		push	ds
		push	offset aTXM
		push	ds
		push	si
		push	ds
		push	offset aTXM_1
		lea	ax, [bp+var_54]
		push	ax
		call	sub_1F0C4
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_54]
		push	ax
		lea	ax, [bp+var_B2]
		push	ax
		call	StreamReader_ConstructVariantC_524DA
		add	sp, 6
		lea	ax, [bp+var_B2]
		push	ax
		call	StreamReader_ValidateState_5280D
		pop	cx
		or	al, al
		jz	short loc_731BE
		lea	ax, [bp+var_B2]
		push	ax
		push	si
		push	large [bp+var_4]
		push	cs
		call	near ptr sub_729F5
		add	sp, 8

loc_731BE:
		push	2
		lea	ax, [bp+var_B2]
		push	ax
		call	StreamReader_Close_52616
		add	sp, 4
		jmp	short loc_731EA

loc_731CF:
		push	large [bp+arg_8]
		push	si
		push	large [bp+var_4]
		push	cs
		call	near ptr sub_72A61
		add	sp, 0Ah
		jmp	short loc_731EA

loc_731E1:
		push	902Dh
		call	sub_9D47
		pop	cx

loc_731EA:
		pop	si
		leave
		retf
sub_73140		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; TextureTable_LoadAnimated_BB541 (sub_BB541 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — far. LUE 2026-11-05 (en-tête seulement). Image
; animée : place − nombre d'images simples = rang dans la table des animées (pas de 24) ;
; erreur 902Eh au-delà ; sub_BB331 (pas lue) remplit l'enregistrement.
; ==============================================================================================
TextureTable_LoadAnimated_731ED		proc far

arg_0		= word ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h
arg_C		= word ptr  12h

		push	bp
		mov	bp, sp
		mov	cx, [bp+arg_4]
		les	bx, [bp+arg_0]
		sub	cx, es:[bx]
		cmp	es:[bx+2], cx
		jbe	short loc_73224
		push	[bp+arg_C]
		push	[bp+arg_A]
		push	[bp+arg_8]
		push	[bp+arg_6]
		mov	ax, es:[bx+8]
		mov	dx, cx
		imul	dx, dx, 18h
		add	ax, dx
		push	word ptr es:[bx+0Ah]
		push	ax
		push	cs
		call	near ptr sub_72F96
		add	sp, 0Ch
		jmp	short loc_7322D

loc_73224:
		push	902Eh
		call	sub_9D47
		pop	cx

loc_7322D:
		pop	bp
		retf
TextureTable_LoadAnimated_731ED		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_7322F		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	seg stub204
		push	offset sub_590F2
		push	1Dh
		push	large 0
		push	0Eh
		les	bx, [bp+arg_0]
		push	large es:[bx+4]
		call	sub_B05
		add	sp, 10h
		push	seg stub204
		push	offset sub_59110
		push	1Dh
		push	large 0
		push	18h
		les	bx, [bp+arg_0]
		push	large es:[bx+8]
		call	sub_B05
		add	sp, 10h
		les	bx, [bp+arg_0]
		xor	eax, eax
		mov	es:[bx+8], eax
		mov	es:[bx+4], eax
		xor	ax, ax
		mov	es:[bx+2], ax
		mov	es:[bx], ax
		pop	bp
		retf
sub_7322F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; TextCycler_ReleaseResource_BB01A (sub_BB01A de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à TextCycler_ReleaseResource_A7538 (sub_A7538 de STRIKE.EXE). Résumé repris
; de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, combine
; TextCycler_Helper2_A74E3 et sub_346 (désallocation runtime).
; ==============================================================================================
TextCycler_ReleaseResource_73287		proc far

arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jz	short loc_732B2
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_7322F
		add	sp, 4
		test	si, 1
		jz	short loc_732B2
		push	large [bp+arg_0]
		call	sub_349
		add	sp, 4

loc_732B2:
		pop	si
		pop	bp
		retf
TextCycler_ReleaseResource_73287		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_732B5		proc far

arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		cmp	[bp+arg_0], 0
		jnz	short loc_732D4
		push	large 0Eh
		call	CRT_Malloc32_Retry
		add	sp, 4
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, dx
		jz	short loc_732ED

loc_732D4:
		les	bx, word ptr [bp+arg_0]
		mov	dword ptr es:[bx+1], 0
		mov	dword ptr es:[bx+9], 0
		mov	byte ptr es:[bx], 2

loc_732ED:
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	bp
		retf
sub_732B5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_732F5		proc far

arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		cmp	[bp+arg_0], 0
		jnz	short loc_73314
		push	large 18h
		call	CRT_Malloc32_Retry
		add	sp, 4
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, dx
		jz	short loc_73340

loc_73314:
		les	bx, word ptr [bp+arg_0]
		mov	dword ptr es:[bx+1], 0
		mov	dword ptr es:[bx+9], 0
		mov	byte ptr es:[bx], 2
		mov	dword ptr es:[bx+10h], 0
		xor	ax, ax
		mov	es:[bx+14h], ax
		mov	es:[bx+0Eh], ax

loc_73340:
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	bp
		retf
sub_732F5		endp
ovr204		ends
