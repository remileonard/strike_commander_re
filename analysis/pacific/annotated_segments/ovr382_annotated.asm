ovr382		segment	para public 'OVERLAY' use16
		assume cs:ovr382
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Memory_AllocatorSlotArray_Construct_2BC51 (sub_2BC51
; de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. —
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Memory_AllocatorSlotArray_Construct_5CB63 (sub_5CB63 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, alloue (sub_658, 0x18 octets) ou
; réutilise un pointeur existant, initialise un tableau de 6 emplacements pointeurs à zéro.
; Référencée par Memory_AllocatorTableConstructor_5C9D3 (seg131) et sub_5CB99.
; ==============================================================================================
Memory_AllocatorSlotArray_Construct_D7220		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		or	dx, dx
		jnz	short loc_D7238
		push	52h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	dx, ax
		or	ax, ax
		jz	short loc_D724E

loc_D7238:
		xor	cx, cx
		jmp	short loc_D7249

loc_D723C:
		mov	ax, cx
		shl	ax, 1
		mov	bx, dx
		add	bx, ax
		mov	word ptr [bx], 0
		inc	cx

loc_D7249:
		cmp	cx, 29h
		jl	short loc_D723C

loc_D724E:
		mov	ax, dx
		pop	bp
		retf
Memory_AllocatorSlotArray_Construct_D7220		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D7252		proc far

var_C7		= byte ptr -0C7h
var_C6		= dword ptr -0C6h
var_C2		= word ptr -0C2h
var_C0		= word ptr -0C0h
var_BD		= byte ptr -0BDh
var_BC		= dword ptr -0BCh
var_B8		= word ptr -0B8h
var_B6		= word ptr -0B6h
var_B3		= byte ptr -0B3h
var_B2		= dword ptr -0B2h
var_AE		= word ptr -0AEh
var_AC		= word ptr -0ACh
var_A9		= byte ptr -0A9h
var_A8		= dword ptr -0A8h
var_A4		= word ptr -0A4h
var_A2		= word ptr -0A2h
var_9F		= byte ptr -9Fh
var_9E		= dword ptr -9Eh
var_9A		= word ptr -9Ah
var_98		= word ptr -98h
var_95		= byte ptr -95h
var_94		= dword ptr -94h
var_90		= word ptr -90h
var_8E		= word ptr -8Eh
var_8B		= byte ptr -8Bh
var_8A		= dword ptr -8Ah
var_86		= word ptr -86h
var_84		= word ptr -84h
var_81		= byte ptr -81h
var_80		= dword ptr -80h
var_7C		= word ptr -7Ch
var_7A		= word ptr -7Ah
var_77		= byte ptr -77h
var_76		= dword ptr -76h
var_72		= word ptr -72h
var_70		= word ptr -70h
var_6D		= byte ptr -6Dh
var_6C		= dword ptr -6Ch
var_68		= word ptr -68h
var_66		= word ptr -66h
var_63		= byte ptr -63h
var_62		= dword ptr -62h
var_5E		= word ptr -5Eh
var_5C		= word ptr -5Ch
var_59		= byte ptr -59h
var_58		= dword ptr -58h
var_54		= word ptr -54h
var_52		= word ptr -52h
var_4F		= byte ptr -4Fh
var_4E		= dword ptr -4Eh
var_4A		= word ptr -4Ah
var_48		= word ptr -48h
var_45		= byte ptr -45h
var_44		= dword ptr -44h
var_40		= word ptr -40h
var_3E		= word ptr -3Eh
var_3B		= byte ptr -3Bh
var_3A		= dword ptr -3Ah
var_36		= word ptr -36h
var_34		= word ptr -34h
var_31		= byte ptr -31h
var_30		= dword ptr -30h
var_2C		= word ptr -2Ch
var_2A		= word ptr -2Ah
var_27		= byte ptr -27h
var_26		= dword ptr -26h
var_22		= word ptr -22h
var_20		= word ptr -20h
var_1D		= byte ptr -1Dh
var_1C		= dword ptr -1Ch
var_18		= word ptr -18h
var_16		= word ptr -16h
var_13		= byte ptr -13h
var_12		= dword ptr -12h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_9		= byte ptr -9
var_8		= dword ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 0C8h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_6]
		mov	[bp+var_2], ax
		mov	ax, [bp+arg_8]
		mov	[bp+var_4], ax
		push	36h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_D727B
		jmp	loc_D730B

loc_D727B:
		push	large 140020h
		push	large 0AF0026h
		push	ax
		call	sub_74A8C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 3CF1h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	bx, [bp+var_2]
		mov	eax, [bx]
		mov	[bp+var_8], eax
		mov	al, [bx+4]
		mov	[bp+var_9], al
		mov	eax, [bp+var_8]
		mov	[di+1Eh], eax
		mov	al, [bp+var_9]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bx+6]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 0
		mov	word ptr [di+0Eh], 41B8h
		mov	bx, [bp+var_4]
		mov	eax, [bx]
		mov	[di+2Ah], eax
		mov	word ptr [di+2Eh], 0
		mov	word ptr [di+30h], 1
		mov	word ptr [di+32h], 26h
		mov	word ptr [di+34h], 0AFh
		mov	ax, di
		jmp	short loc_D730D

loc_D730B:
		mov	ax, di

loc_D730D:
		mov	[si], ax
		mov	ax, [bp+arg_4]
		mov	[bp+var_C], ax
		mov	ax, [bp+arg_8]
		mov	[bp+var_E], ax
		push	36h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_D732C
		jmp	loc_D73BC

loc_D732C:
		push	large 0A000Ah
		push	large 120133h
		push	ax
		call	sub_74A8C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 3CF1h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	bx, [bp+var_C]
		mov	eax, [bx]
		mov	[bp+var_12], eax
		mov	al, [bx+4]
		mov	[bp+var_13], al
		mov	eax, [bp+var_12]
		mov	[di+1Eh], eax
		mov	al, [bp+var_13]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bx+6]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 2
		mov	word ptr [di+0Eh], 41B8h
		mov	bx, [bp+var_E]
		mov	eax, [bx]
		mov	[di+2Ah], eax
		mov	word ptr [di+2Eh], 0Fh
		mov	word ptr [di+30h], 3
		mov	word ptr [di+32h], 133h
		mov	word ptr [di+34h], 12h
		mov	ax, di
		jmp	short loc_D73BE

loc_D73BC:
		mov	ax, di

loc_D73BE:
		mov	[si+1Eh], ax
		mov	ax, [bp+arg_4]
		mov	[bp+var_16], ax
		mov	ax, [bp+arg_8]
		mov	[bp+var_18], ax
		push	36h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_D73DE
		jmp	loc_D746E

loc_D73DE:
		push	large 0A000Ah
		push	large 1200C8h
		push	ax
		call	sub_74A8C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 3CF1h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	bx, [bp+var_16]
		mov	eax, [bx]
		mov	[bp+var_1C], eax
		mov	al, [bx+4]
		mov	[bp+var_1D], al
		mov	eax, [bp+var_1C]
		mov	[di+1Eh], eax
		mov	al, [bp+var_1D]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bx+6]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 0
		mov	word ptr [di+0Eh], 41B8h
		mov	bx, [bp+var_18]
		mov	eax, [bx]
		mov	[di+2Ah], eax
		mov	word ptr [di+2Eh], 10h
		mov	word ptr [di+30h], 1
		mov	word ptr [di+32h], 0C8h
		mov	word ptr [di+34h], 12h
		mov	ax, di
		jmp	short loc_D7470

loc_D746E:
		mov	ax, di

loc_D7470:
		mov	[si+20h], ax
		mov	ax, [bp+arg_4]
		mov	[bp+var_20], ax
		mov	ax, [bp+arg_8]
		mov	[bp+var_22], ax
		push	36h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_D7490
		jmp	loc_D7520

loc_D7490:
		push	large 0A000Ah
		push	large 220133h
		push	ax
		call	sub_74A8C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 3CF1h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	bx, [bp+var_20]
		mov	eax, [bx]
		mov	[bp+var_26], eax
		mov	al, [bx+4]
		mov	[bp+var_27], al
		mov	eax, [bp+var_26]
		mov	[di+1Eh], eax
		mov	al, [bp+var_27]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bx+6]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 2
		mov	word ptr [di+0Eh], 41B8h
		mov	bx, [bp+var_22]
		mov	eax, [bx]
		mov	[di+2Ah], eax
		mov	word ptr [di+2Eh], 1
		mov	word ptr [di+30h], 3
		mov	word ptr [di+32h], 133h
		mov	word ptr [di+34h], 22h
		mov	ax, di
		jmp	short loc_D7522

loc_D7520:
		mov	ax, di

loc_D7522:
		mov	[si+2], ax
		mov	ax, [bp+arg_4]
		mov	[bp+var_2A], ax
		mov	ax, [bp+arg_8]
		mov	[bp+var_2C], ax
		push	36h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_D7542
		jmp	loc_D75D2

loc_D7542:
		push	large 0A000Ah
		push	large 2200C8h
		push	ax
		call	sub_74A8C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 3CF1h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	bx, [bp+var_2A]
		mov	eax, [bx]
		mov	[bp+var_30], eax
		mov	al, [bx+4]
		mov	[bp+var_31], al
		mov	eax, [bp+var_30]
		mov	[di+1Eh], eax
		mov	al, [bp+var_31]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bx+6]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 0
		mov	word ptr [di+0Eh], 41B8h
		mov	bx, [bp+var_2C]
		mov	eax, [bx]
		mov	[di+2Ah], eax
		mov	word ptr [di+2Eh], 2
		mov	word ptr [di+30h], 1
		mov	word ptr [di+32h], 0C8h
		mov	word ptr [di+34h], 22h
		mov	ax, di
		jmp	short loc_D75D4

loc_D75D2:
		mov	ax, di

loc_D75D4:
		mov	[si+4], ax
		mov	ax, [bp+arg_4]
		mov	[bp+var_34], ax
		mov	ax, [bp+arg_8]
		mov	[bp+var_36], ax
		push	36h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_D75F4
		jmp	loc_D7684

loc_D75F4:
		push	large 0A000Ah
		push	large 320133h
		push	ax
		call	sub_74A8C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 3CF1h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	bx, [bp+var_34]
		mov	eax, [bx]
		mov	[bp+var_3A], eax
		mov	al, [bx+4]
		mov	[bp+var_3B], al
		mov	eax, [bp+var_3A]
		mov	[di+1Eh], eax
		mov	al, [bp+var_3B]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bx+6]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 2
		mov	word ptr [di+0Eh], 41B8h
		mov	bx, [bp+var_36]
		mov	eax, [bx]
		mov	[di+2Ah], eax
		mov	word ptr [di+2Eh], 3
		mov	word ptr [di+30h], 3
		mov	word ptr [di+32h], 133h
		mov	word ptr [di+34h], 32h
		mov	ax, di
		jmp	short loc_D7686

loc_D7684:
		mov	ax, di

loc_D7686:
		mov	[si+6], ax
		mov	ax, [bp+arg_4]
		mov	[bp+var_3E], ax
		mov	ax, [bp+arg_8]
		mov	[bp+var_40], ax
		push	36h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_D76A6
		jmp	loc_D7736

loc_D76A6:
		push	large 0A000Ah
		push	large 3200C8h
		push	ax
		call	sub_74A8C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 3CF1h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	bx, [bp+var_3E]
		mov	eax, [bx]
		mov	[bp+var_44], eax
		mov	al, [bx+4]
		mov	[bp+var_45], al
		mov	eax, [bp+var_44]
		mov	[di+1Eh], eax
		mov	al, [bp+var_45]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bx+6]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 0
		mov	word ptr [di+0Eh], 41B8h
		mov	bx, [bp+var_40]
		mov	eax, [bx]
		mov	[di+2Ah], eax
		mov	word ptr [di+2Eh], 4
		mov	word ptr [di+30h], 1
		mov	word ptr [di+32h], 0C8h
		mov	word ptr [di+34h], 32h
		mov	ax, di
		jmp	short loc_D7738

loc_D7736:
		mov	ax, di

loc_D7738:
		mov	[si+8], ax
		mov	ax, [bp+arg_4]
		mov	[bp+var_48], ax
		mov	ax, [bp+arg_8]
		mov	[bp+var_4A], ax
		push	36h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_D7758
		jmp	loc_D77E8

loc_D7758:
		push	large 0A000Ah
		push	large 420133h
		push	ax
		call	sub_74A8C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 3CF1h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	bx, [bp+var_48]
		mov	eax, [bx]
		mov	[bp+var_4E], eax
		mov	al, [bx+4]
		mov	[bp+var_4F], al
		mov	eax, [bp+var_4E]
		mov	[di+1Eh], eax
		mov	al, [bp+var_4F]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bx+6]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 2
		mov	word ptr [di+0Eh], 41B8h
		mov	bx, [bp+var_4A]
		mov	eax, [bx]
		mov	[di+2Ah], eax
		mov	word ptr [di+2Eh], 5
		mov	word ptr [di+30h], 3
		mov	word ptr [di+32h], 133h
		mov	word ptr [di+34h], 42h
		mov	ax, di
		jmp	short loc_D77EA

loc_D77E8:
		mov	ax, di

loc_D77EA:
		mov	[si+0Ah], ax
		mov	ax, [bp+arg_4]
		mov	[bp+var_52], ax
		mov	ax, [bp+arg_8]
		mov	[bp+var_54], ax
		push	36h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_D780A
		jmp	loc_D789A

loc_D780A:
		push	large 0A000Ah
		push	large 4200C8h
		push	ax
		call	sub_74A8C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 3CF1h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	bx, [bp+var_52]
		mov	eax, [bx]
		mov	[bp+var_58], eax
		mov	al, [bx+4]
		mov	[bp+var_59], al
		mov	eax, [bp+var_58]
		mov	[di+1Eh], eax
		mov	al, [bp+var_59]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bx+6]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 0
		mov	word ptr [di+0Eh], 41B8h
		mov	bx, [bp+var_54]
		mov	eax, [bx]
		mov	[di+2Ah], eax
		mov	word ptr [di+2Eh], 6
		mov	word ptr [di+30h], 1
		mov	word ptr [di+32h], 0C8h
		mov	word ptr [di+34h], 42h
		mov	ax, di
		jmp	short loc_D789C

loc_D789A:
		mov	ax, di

loc_D789C:
		mov	[si+0Ch], ax
		mov	ax, [bp+arg_4]
		mov	[bp+var_5C], ax
		mov	ax, [bp+arg_8]
		mov	[bp+var_5E], ax
		push	36h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_D78BC
		jmp	loc_D794C

loc_D78BC:
		push	large 0A000Ah
		push	large 6E0133h
		push	ax
		call	sub_74A8C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 3CF1h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	bx, [bp+var_5C]
		mov	eax, [bx]
		mov	[bp+var_62], eax
		mov	al, [bx+4]
		mov	[bp+var_63], al
		mov	eax, [bp+var_62]
		mov	[di+1Eh], eax
		mov	al, [bp+var_63]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bx+6]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 2
		mov	word ptr [di+0Eh], 41B8h
		mov	bx, [bp+var_5E]
		mov	eax, [bx]
		mov	[di+2Ah], eax
		mov	word ptr [di+2Eh], 7
		mov	word ptr [di+30h], 3
		mov	word ptr [di+32h], 133h
		mov	word ptr [di+34h], 6Eh
		mov	ax, di
		jmp	short loc_D794E

loc_D794C:
		mov	ax, di

loc_D794E:
		mov	[si+0Eh], ax
		mov	ax, [bp+arg_4]
		mov	[bp+var_66], ax
		mov	ax, [bp+arg_8]
		mov	[bp+var_68], ax
		push	36h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_D796E
		jmp	loc_D79FE

loc_D796E:
		push	large 0A000Ah
		push	large 6E00C8h
		push	ax
		call	sub_74A8C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 3CF1h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	bx, [bp+var_66]
		mov	eax, [bx]
		mov	[bp+var_6C], eax
		mov	al, [bx+4]
		mov	[bp+var_6D], al
		mov	eax, [bp+var_6C]
		mov	[di+1Eh], eax
		mov	al, [bp+var_6D]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bx+6]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 0
		mov	word ptr [di+0Eh], 41B8h
		mov	bx, [bp+var_68]
		mov	eax, [bx]
		mov	[di+2Ah], eax
		mov	word ptr [di+2Eh], 0Bh
		mov	word ptr [di+30h], 1
		mov	word ptr [di+32h], 0C8h
		mov	word ptr [di+34h], 6Eh
		mov	ax, di
		jmp	short loc_D7A00

loc_D79FE:
		mov	ax, di

loc_D7A00:
		mov	[si+16h], ax
		mov	ax, [bp+arg_4]
		mov	[bp+var_70], ax
		mov	ax, [bp+arg_8]
		mov	[bp+var_72], ax
		push	36h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_D7A20
		jmp	loc_D7AB0

loc_D7A20:
		push	large 0A000Ah
		push	large 870133h
		push	ax
		call	sub_74A8C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 3CF1h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	bx, [bp+var_70]
		mov	eax, [bx]
		mov	[bp+var_76], eax
		mov	al, [bx+4]
		mov	[bp+var_77], al
		mov	eax, [bp+var_76]
		mov	[di+1Eh], eax
		mov	al, [bp+var_77]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bx+6]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 2
		mov	word ptr [di+0Eh], 41B8h
		mov	bx, [bp+var_72]
		mov	eax, [bx]
		mov	[di+2Ah], eax
		mov	word ptr [di+2Eh], 8
		mov	word ptr [di+30h], 3
		mov	word ptr [di+32h], 133h
		mov	word ptr [di+34h], 87h
		mov	ax, di
		jmp	short loc_D7AB2

loc_D7AB0:
		mov	ax, di

loc_D7AB2:
		mov	[si+10h], ax
		mov	ax, [bp+arg_4]
		mov	[bp+var_7A], ax
		mov	ax, [bp+arg_8]
		mov	[bp+var_7C], ax
		push	36h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_D7AD2
		jmp	loc_D7B64

loc_D7AD2:
		push	large 0A000Ah
		push	large 8700C8h
		push	ax
		call	sub_74A8C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 3CF1h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	bx, [bp+var_7A]
		mov	eax, [bx]
		mov	[bp+var_80], eax
		mov	al, [bx+4]
		mov	[bp+var_81], al
		mov	eax, [bp+var_80]
		mov	[di+1Eh], eax
		mov	al, [bp+var_81]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bx+6]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 0
		mov	word ptr [di+0Eh], 41B8h
		mov	bx, [bp+var_7C]
		mov	eax, [bx]
		mov	[di+2Ah], eax
		mov	word ptr [di+2Eh], 0Ch
		mov	word ptr [di+30h], 1
		mov	word ptr [di+32h], 0C8h
		mov	word ptr [di+34h], 87h
		mov	ax, di
		jmp	short loc_D7B66

loc_D7B64:
		mov	ax, di

loc_D7B66:
		mov	[si+18h], ax
		mov	ax, [bp+arg_4]
		mov	[bp+var_84], ax
		mov	ax, [bp+arg_8]
		mov	[bp+var_86], ax
		push	36h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_D7B88
		jmp	loc_D7C1E

loc_D7B88:
		push	large 0A000Ah
		push	large 0A00133h
		push	ax
		call	sub_74A8C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 3CF1h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	bx, [bp+var_84]
		mov	eax, [bx]
		mov	[bp+var_8A], eax
		mov	al, [bx+4]
		mov	[bp+var_8B], al
		mov	eax, [bp+var_8A]
		mov	[di+1Eh], eax
		mov	al, [bp+var_8B]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bx+6]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 2
		mov	word ptr [di+0Eh], 41B8h
		mov	bx, [bp+var_86]
		mov	eax, [bx]
		mov	[di+2Ah], eax
		mov	word ptr [di+2Eh], 9
		mov	word ptr [di+30h], 3
		mov	word ptr [di+32h], 133h
		mov	word ptr [di+34h], 0A0h
		mov	ax, di
		jmp	short loc_D7C20

loc_D7C1E:
		mov	ax, di

loc_D7C20:
		mov	[si+12h], ax
		mov	ax, [bp+arg_4]
		mov	[bp+var_8E], ax
		mov	ax, [bp+arg_8]
		mov	[bp+var_90], ax
		push	36h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_D7C42
		jmp	loc_D7CD8

loc_D7C42:
		push	large 0A000Ah
		push	large 0A000C8h
		push	ax
		call	sub_74A8C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 3CF1h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	bx, [bp+var_8E]
		mov	eax, [bx]
		mov	[bp+var_94], eax
		mov	al, [bx+4]
		mov	[bp+var_95], al
		mov	eax, [bp+var_94]
		mov	[di+1Eh], eax
		mov	al, [bp+var_95]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bx+6]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 0
		mov	word ptr [di+0Eh], 41B8h
		mov	bx, [bp+var_90]
		mov	eax, [bx]
		mov	[di+2Ah], eax
		mov	word ptr [di+2Eh], 0Dh
		mov	word ptr [di+30h], 1
		mov	word ptr [di+32h], 0C8h
		mov	word ptr [di+34h], 0A0h
		mov	ax, di
		jmp	short loc_D7CDA

loc_D7CD8:
		mov	ax, di

loc_D7CDA:
		mov	[si+1Ah], ax
		mov	ax, [bp+arg_4]
		mov	[bp+var_98], ax
		mov	ax, [bp+arg_8]
		mov	[bp+var_9A], ax
		push	36h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_D7CFC
		jmp	loc_D7D92

loc_D7CFC:
		push	large 0A000Ah
		push	large 0B90133h
		push	ax
		call	sub_74A8C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 3CF1h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	bx, [bp+var_98]
		mov	eax, [bx]
		mov	[bp+var_9E], eax
		mov	al, [bx+4]
		mov	[bp+var_9F], al
		mov	eax, [bp+var_9E]
		mov	[di+1Eh], eax
		mov	al, [bp+var_9F]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bx+6]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 2
		mov	word ptr [di+0Eh], 41B8h
		mov	bx, [bp+var_9A]
		mov	eax, [bx]
		mov	[di+2Ah], eax
		mov	word ptr [di+2Eh], 0Ah
		mov	word ptr [di+30h], 3
		mov	word ptr [di+32h], 133h
		mov	word ptr [di+34h], 0B9h
		mov	ax, di
		jmp	short loc_D7D94

loc_D7D92:
		mov	ax, di

loc_D7D94:
		mov	[si+14h], ax
		mov	ax, [bp+arg_4]
		mov	[bp+var_A2], ax
		mov	ax, [bp+arg_8]
		mov	[bp+var_A4], ax
		push	36h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_D7DB6
		jmp	loc_D7E4C

loc_D7DB6:
		push	large 0A000Ah
		push	large 0B900C8h
		push	ax
		call	sub_74A8C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 3CF1h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	bx, [bp+var_A2]
		mov	eax, [bx]
		mov	[bp+var_A8], eax
		mov	al, [bx+4]
		mov	[bp+var_A9], al
		mov	eax, [bp+var_A8]
		mov	[di+1Eh], eax
		mov	al, [bp+var_A9]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bx+6]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 0
		mov	word ptr [di+0Eh], 41B8h
		mov	bx, [bp+var_A4]
		mov	eax, [bx]
		mov	[di+2Ah], eax
		mov	word ptr [di+2Eh], 0Eh
		mov	word ptr [di+30h], 1
		mov	word ptr [di+32h], 0C8h
		mov	word ptr [di+34h], 0B9h
		mov	ax, di
		jmp	short loc_D7E4E

loc_D7E4C:
		mov	ax, di

loc_D7E4E:
		mov	[si+1Ch], ax
		mov	ax, [bp+arg_6]
		mov	[bp+var_AC], ax
		mov	ax, [bp+arg_8]
		mov	[bp+var_AE], ax
		push	36h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_D7E70
		jmp	loc_D7F06

loc_D7E70:
		push	large 140020h
		push	large 0AF0044h
		push	ax
		call	sub_74A8C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 3CF1h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	bx, [bp+var_AC]
		mov	eax, [bx]
		mov	[bp+var_B2], eax
		mov	al, [bx+4]
		mov	[bp+var_B3], al
		mov	eax, [bp+var_B2]
		mov	[di+1Eh], eax
		mov	al, [bp+var_B3]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bx+6]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 2
		mov	word ptr [di+0Eh], 41B8h
		mov	bx, [bp+var_AE]
		mov	eax, [bx]
		mov	[di+2Ah], eax
		mov	word ptr [di+2Eh], 11h
		mov	word ptr [di+30h], 3
		mov	word ptr [di+32h], 44h
		mov	word ptr [di+34h], 0AFh
		mov	ax, di
		jmp	short loc_D7F08

loc_D7F06:
		mov	ax, di

loc_D7F08:
		mov	[si+22h], ax
		mov	ax, [bp+arg_6]
		mov	[bp+var_B6], ax
		mov	ax, [bp+arg_8]
		mov	[bp+var_B8], ax
		push	36h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_D7F2A
		jmp	loc_D7FC0

loc_D7F2A:
		push	large 140020h
		push	large 0AF0080h
		push	ax
		call	sub_74A8C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 3CF1h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	bx, [bp+var_B6]
		mov	eax, [bx]
		mov	[bp+var_BC], eax
		mov	al, [bx+4]
		mov	[bp+var_BD], al
		mov	eax, [bp+var_BC]
		mov	[di+1Eh], eax
		mov	al, [bp+var_BD]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bx+6]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 4
		mov	word ptr [di+0Eh], 41B8h
		mov	bx, [bp+var_B8]
		mov	eax, [bx]
		mov	[di+2Ah], eax
		mov	word ptr [di+2Eh], 12h
		mov	word ptr [di+30h], 5
		mov	word ptr [di+32h], 80h
		mov	word ptr [di+34h], 0AFh
		mov	ax, di
		jmp	short loc_D7FC2

loc_D7FC0:
		mov	ax, di

loc_D7FC2:
		mov	[si+24h], ax
		mov	ax, [bp+arg_6]
		mov	[bp+var_C0], ax
		mov	ax, [bp+arg_8]
		mov	[bp+var_C2], ax
		push	36h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_D7FE4
		jmp	loc_D807A

loc_D7FE4:
		push	large 140020h
		push	large 0AF0063h
		push	ax
		call	sub_74A8C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 3CF1h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	bx, [bp+var_C0]
		mov	eax, [bx]
		mov	[bp+var_C6], eax
		mov	al, [bx+4]
		mov	[bp+var_C7], al
		mov	eax, [bp+var_C6]
		mov	[di+1Eh], eax
		mov	al, [bp+var_C7]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bx+6]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 6
		mov	word ptr [di+0Eh], 41B8h
		mov	bx, [bp+var_C2]
		mov	eax, [bx]
		mov	[di+2Ah], eax
		mov	word ptr [di+2Eh], 13h
		mov	word ptr [di+30h], 7
		mov	word ptr [di+32h], 63h
		mov	word ptr [di+34h], 0AFh
		mov	ax, di
		jmp	short loc_D807C

loc_D807A:
		mov	ax, di

loc_D807C:
		mov	[si+26h], ax
		push	10h
		push	word ptr [si]
		push	[bp+arg_2]
		call	sub_74C8A
		add	sp, 6
		mov	di, 1
		jmp	short loc_D80C3

loc_D8093:
		mov	bx, di
		shl	bx, 1
		cmp	word ptr [bx+si], 0
		jz	short loc_D80AF
		mov	bx, di
		shl	bx, 1
		push	word ptr [bx+si]
		mov	bx, di
		shl	bx, 1
		mov	bx, [bx+si]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx+4]
		pop	cx

loc_D80AF:
		push	0
		mov	bx, di
		shl	bx, 1
		push	word ptr [bx+si]
		push	[bp+arg_2]
		call	sub_74C8A
		add	sp, 6
		inc	di

loc_D80C3:
		cmp	di, 14h
		jl	short loc_D8093
		pop	di
		pop	si
		leave
		retf
sub_D7252		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D80CC		proc far

var_D1		= byte ptr -0D1h
var_D0		= dword ptr -0D0h
var_CC		= word ptr -0CCh
var_CA		= word ptr -0CAh
var_C7		= byte ptr -0C7h
var_C6		= dword ptr -0C6h
var_C2		= word ptr -0C2h
var_C0		= word ptr -0C0h
var_BD		= byte ptr -0BDh
var_BC		= dword ptr -0BCh
var_B8		= word ptr -0B8h
var_B6		= word ptr -0B6h
var_B3		= byte ptr -0B3h
var_B2		= dword ptr -0B2h
var_AE		= word ptr -0AEh
var_AC		= word ptr -0ACh
var_A9		= byte ptr -0A9h
var_A8		= dword ptr -0A8h
var_A4		= word ptr -0A4h
var_A2		= word ptr -0A2h
var_9F		= byte ptr -9Fh
var_9E		= dword ptr -9Eh
var_9A		= word ptr -9Ah
var_98		= word ptr -98h
var_95		= byte ptr -95h
var_94		= dword ptr -94h
var_90		= word ptr -90h
var_8E		= word ptr -8Eh
var_8B		= byte ptr -8Bh
var_8A		= dword ptr -8Ah
var_86		= word ptr -86h
var_84		= word ptr -84h
var_81		= byte ptr -81h
var_80		= dword ptr -80h
var_7C		= word ptr -7Ch
var_7A		= word ptr -7Ah
var_77		= byte ptr -77h
var_76		= dword ptr -76h
var_72		= word ptr -72h
var_70		= word ptr -70h
var_6D		= byte ptr -6Dh
var_6C		= dword ptr -6Ch
var_68		= word ptr -68h
var_66		= word ptr -66h
var_63		= byte ptr -63h
var_62		= dword ptr -62h
var_5E		= word ptr -5Eh
var_5C		= word ptr -5Ch
var_59		= byte ptr -59h
var_58		= dword ptr -58h
var_54		= word ptr -54h
var_52		= word ptr -52h
var_4F		= byte ptr -4Fh
var_4E		= dword ptr -4Eh
var_4A		= word ptr -4Ah
var_48		= word ptr -48h
var_45		= byte ptr -45h
var_44		= dword ptr -44h
var_40		= word ptr -40h
var_3E		= word ptr -3Eh
var_3B		= byte ptr -3Bh
var_3A		= dword ptr -3Ah
var_36		= word ptr -36h
var_34		= word ptr -34h
var_31		= byte ptr -31h
var_30		= dword ptr -30h
var_2C		= word ptr -2Ch
var_2A		= word ptr -2Ah
var_27		= byte ptr -27h
var_26		= dword ptr -26h
var_22		= word ptr -22h
var_20		= word ptr -20h
var_1D		= byte ptr -1Dh
var_1C		= dword ptr -1Ch
var_18		= word ptr -18h
var_16		= word ptr -16h
var_13		= byte ptr -13h
var_12		= dword ptr -12h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_9		= byte ptr -9
var_8		= dword ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 0D2h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_4]
		mov	[bp+var_2], ax
		mov	ax, [bp+arg_8]
		mov	[bp+var_4], ax
		push	36h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_D80F5
		jmp	loc_D8185

loc_D80F5:
		push	large 0A000Ah
		push	large 1200C8h
		push	ax
		call	sub_74A8C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 3CF1h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	bx, [bp+var_2]
		mov	eax, [bx]
		mov	[bp+var_8], eax
		mov	al, [bx+4]
		mov	[bp+var_9], al
		mov	eax, [bp+var_8]
		mov	[di+1Eh], eax
		mov	al, [bp+var_9]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bx+6]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 0
		mov	word ptr [di+0Eh], 41B8h
		mov	bx, [bp+var_4]
		mov	eax, [bx]
		mov	[di+2Ah], eax
		mov	word ptr [di+2Eh], 22h
		mov	word ptr [di+30h], 1
		mov	word ptr [di+32h], 0C8h
		mov	word ptr [di+34h], 12h
		mov	ax, di
		jmp	short loc_D8187

loc_D8185:
		mov	ax, di

loc_D8187:
		mov	[si+44h], ax
		mov	ax, [bp+arg_4]
		mov	[bp+var_C], ax
		mov	ax, [bp+arg_8]
		mov	[bp+var_E], ax
		push	36h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_D81A7
		jmp	loc_D8237

loc_D81A7:
		push	large 0A000Ah
		push	large 120133h
		push	ax
		call	sub_74A8C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 3CF1h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	bx, [bp+var_C]
		mov	eax, [bx]
		mov	[bp+var_12], eax
		mov	al, [bx+4]
		mov	[bp+var_13], al
		mov	eax, [bp+var_12]
		mov	[di+1Eh], eax
		mov	al, [bp+var_13]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bx+6]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 2
		mov	word ptr [di+0Eh], 41B8h
		mov	bx, [bp+var_E]
		mov	eax, [bx]
		mov	[di+2Ah], eax
		mov	word ptr [di+2Eh], 21h
		mov	word ptr [di+30h], 3
		mov	word ptr [di+32h], 133h
		mov	word ptr [di+34h], 12h
		mov	ax, di
		jmp	short loc_D8239

loc_D8237:
		mov	ax, di

loc_D8239:
		mov	[si+42h], ax
		mov	ax, [bp+arg_4]
		mov	[bp+var_16], ax
		mov	ax, [bp+arg_8]
		mov	[bp+var_18], ax
		push	36h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_D8259
		jmp	loc_D82E9

loc_D8259:
		push	large 0A000Ah
		push	large 2200C8h
		push	ax
		call	sub_74A8C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 3CF1h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	bx, [bp+var_16]
		mov	eax, [bx]
		mov	[bp+var_1C], eax
		mov	al, [bx+4]
		mov	[bp+var_1D], al
		mov	eax, [bp+var_1C]
		mov	[di+1Eh], eax
		mov	al, [bp+var_1D]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bx+6]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 0
		mov	word ptr [di+0Eh], 41B8h
		mov	bx, [bp+var_18]
		mov	eax, [bx]
		mov	[di+2Ah], eax
		mov	word ptr [di+2Eh], 16h
		mov	word ptr [di+30h], 1
		mov	word ptr [di+32h], 0C8h
		mov	word ptr [di+34h], 22h
		mov	ax, di
		jmp	short loc_D82EB

loc_D82E9:
		mov	ax, di

loc_D82EB:
		mov	[si+2Ch], ax
		mov	ax, [bp+arg_4]
		mov	[bp+var_20], ax
		mov	ax, [bp+arg_8]
		mov	[bp+var_22], ax
		push	36h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_D830B
		jmp	loc_D839B

loc_D830B:
		push	large 0A000Ah
		push	large 220133h
		push	ax
		call	sub_74A8C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 3CF1h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	bx, [bp+var_20]
		mov	eax, [bx]
		mov	[bp+var_26], eax
		mov	al, [bx+4]
		mov	[bp+var_27], al
		mov	eax, [bp+var_26]
		mov	[di+1Eh], eax
		mov	al, [bp+var_27]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bx+6]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 2
		mov	word ptr [di+0Eh], 41B8h
		mov	bx, [bp+var_22]
		mov	eax, [bx]
		mov	[di+2Ah], eax
		mov	word ptr [di+2Eh], 15h
		mov	word ptr [di+30h], 3
		mov	word ptr [di+32h], 133h
		mov	word ptr [di+34h], 22h
		mov	ax, di
		jmp	short loc_D839D

loc_D839B:
		mov	ax, di

loc_D839D:
		mov	[si+2Ah], ax
		mov	ax, [bp+arg_4]
		mov	[bp+var_2A], ax
		mov	ax, [bp+arg_8]
		mov	[bp+var_2C], ax
		push	36h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_D83BD
		jmp	loc_D844D

loc_D83BD:
		push	large 0A000Ah
		push	large 3200C8h
		push	ax
		call	sub_74A8C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 3CF1h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	bx, [bp+var_2A]
		mov	eax, [bx]
		mov	[bp+var_30], eax
		mov	al, [bx+4]
		mov	[bp+var_31], al
		mov	eax, [bp+var_30]
		mov	[di+1Eh], eax
		mov	al, [bp+var_31]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bx+6]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 0
		mov	word ptr [di+0Eh], 41B8h
		mov	bx, [bp+var_2C]
		mov	eax, [bx]
		mov	[di+2Ah], eax
		mov	word ptr [di+2Eh], 18h
		mov	word ptr [di+30h], 1
		mov	word ptr [di+32h], 0C8h
		mov	word ptr [di+34h], 32h
		mov	ax, di
		jmp	short loc_D844F

loc_D844D:
		mov	ax, di

loc_D844F:
		mov	[si+30h], ax
		mov	ax, [bp+arg_4]
		mov	[bp+var_34], ax
		mov	ax, [bp+arg_8]
		mov	[bp+var_36], ax
		push	36h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_D846F
		jmp	loc_D84FF

loc_D846F:
		push	large 0A000Ah
		push	large 320133h
		push	ax
		call	sub_74A8C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 3CF1h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	bx, [bp+var_34]
		mov	eax, [bx]
		mov	[bp+var_3A], eax
		mov	al, [bx+4]
		mov	[bp+var_3B], al
		mov	eax, [bp+var_3A]
		mov	[di+1Eh], eax
		mov	al, [bp+var_3B]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bx+6]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 2
		mov	word ptr [di+0Eh], 41B8h
		mov	bx, [bp+var_36]
		mov	eax, [bx]
		mov	[di+2Ah], eax
		mov	word ptr [di+2Eh], 17h
		mov	word ptr [di+30h], 3
		mov	word ptr [di+32h], 133h
		mov	word ptr [di+34h], 32h
		mov	ax, di
		jmp	short loc_D8501

loc_D84FF:
		mov	ax, di

loc_D8501:
		mov	[si+2Eh], ax
		mov	ax, [bp+arg_4]
		mov	[bp+var_3E], ax
		mov	ax, [bp+arg_8]
		mov	[bp+var_40], ax
		push	36h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_D8521
		jmp	loc_D85B1

loc_D8521:
		push	large 0A000Ah
		push	large 4200C8h
		push	ax
		call	sub_74A8C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 3CF1h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	bx, [bp+var_3E]
		mov	eax, [bx]
		mov	[bp+var_44], eax
		mov	al, [bx+4]
		mov	[bp+var_45], al
		mov	eax, [bp+var_44]
		mov	[di+1Eh], eax
		mov	al, [bp+var_45]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bx+6]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 0
		mov	word ptr [di+0Eh], 41B8h
		mov	bx, [bp+var_40]
		mov	eax, [bx]
		mov	[di+2Ah], eax
		mov	word ptr [di+2Eh], 24h
		mov	word ptr [di+30h], 1
		mov	word ptr [di+32h], 0C8h
		mov	word ptr [di+34h], 42h
		mov	ax, di
		jmp	short loc_D85B3

loc_D85B1:
		mov	ax, di

loc_D85B3:
		mov	[si+48h], ax
		mov	ax, [bp+arg_4]
		mov	[bp+var_48], ax
		mov	ax, [bp+arg_8]
		mov	[bp+var_4A], ax
		push	36h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_D85D3
		jmp	loc_D8663

loc_D85D3:
		push	large 0A000Ah
		push	large 420133h
		push	ax
		call	sub_74A8C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 3CF1h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	bx, [bp+var_48]
		mov	eax, [bx]
		mov	[bp+var_4E], eax
		mov	al, [bx+4]
		mov	[bp+var_4F], al
		mov	eax, [bp+var_4E]
		mov	[di+1Eh], eax
		mov	al, [bp+var_4F]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bx+6]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 2
		mov	word ptr [di+0Eh], 41B8h
		mov	bx, [bp+var_4A]
		mov	eax, [bx]
		mov	[di+2Ah], eax
		mov	word ptr [di+2Eh], 23h
		mov	word ptr [di+30h], 3
		mov	word ptr [di+32h], 133h
		mov	word ptr [di+34h], 42h
		mov	ax, di
		jmp	short loc_D8665

loc_D8663:
		mov	ax, di

loc_D8665:
		mov	[si+46h], ax
		mov	ax, [bp+arg_4]
		mov	[bp+var_52], ax
		mov	ax, [bp+arg_8]
		mov	[bp+var_54], ax
		push	36h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_D8685
		jmp	loc_D8715

loc_D8685:
		push	large 0A000Ah
		push	large 6E00C8h
		push	ax
		call	sub_74A8C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 3CF1h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	bx, [bp+var_52]
		mov	eax, [bx]
		mov	[bp+var_58], eax
		mov	al, [bx+4]
		mov	[bp+var_59], al
		mov	eax, [bp+var_58]
		mov	[di+1Eh], eax
		mov	al, [bp+var_59]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bx+6]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 0
		mov	word ptr [di+0Eh], 41B8h
		mov	bx, [bp+var_54]
		mov	eax, [bx]
		mov	[di+2Ah], eax
		mov	word ptr [di+2Eh], 1Dh
		mov	word ptr [di+30h], 1
		mov	word ptr [di+32h], 0C8h
		mov	word ptr [di+34h], 6Eh
		mov	ax, di
		jmp	short loc_D8717

loc_D8715:
		mov	ax, di

loc_D8717:
		mov	[si+3Ah], ax
		mov	ax, [bp+arg_4]
		mov	[bp+var_5C], ax
		mov	ax, [bp+arg_8]
		mov	[bp+var_5E], ax
		push	36h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_D8737
		jmp	loc_D87C7

loc_D8737:
		push	large 0A000Ah
		push	large 6E0133h
		push	ax
		call	sub_74A8C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 3CF1h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	bx, [bp+var_5C]
		mov	eax, [bx]
		mov	[bp+var_62], eax
		mov	al, [bx+4]
		mov	[bp+var_63], al
		mov	eax, [bp+var_62]
		mov	[di+1Eh], eax
		mov	al, [bp+var_63]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bx+6]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 2
		mov	word ptr [di+0Eh], 41B8h
		mov	bx, [bp+var_5E]
		mov	eax, [bx]
		mov	[di+2Ah], eax
		mov	word ptr [di+2Eh], 19h
		mov	word ptr [di+30h], 3
		mov	word ptr [di+32h], 133h
		mov	word ptr [di+34h], 6Eh
		mov	ax, di
		jmp	short loc_D87C9

loc_D87C7:
		mov	ax, di

loc_D87C9:
		mov	[si+32h], ax
		mov	ax, [bp+arg_4]
		mov	[bp+var_66], ax
		mov	ax, [bp+arg_8]
		mov	[bp+var_68], ax
		push	36h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_D87E9
		jmp	loc_D8879

loc_D87E9:
		push	large 0A000Ah
		push	large 8700C8h
		push	ax
		call	sub_74A8C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 3CF1h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	bx, [bp+var_66]
		mov	eax, [bx]
		mov	[bp+var_6C], eax
		mov	al, [bx+4]
		mov	[bp+var_6D], al
		mov	eax, [bp+var_6C]
		mov	[di+1Eh], eax
		mov	al, [bp+var_6D]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bx+6]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 0
		mov	word ptr [di+0Eh], 41B8h
		mov	bx, [bp+var_68]
		mov	eax, [bx]
		mov	[di+2Ah], eax
		mov	word ptr [di+2Eh], 1Eh
		mov	word ptr [di+30h], 1
		mov	word ptr [di+32h], 0C8h
		mov	word ptr [di+34h], 87h
		mov	ax, di
		jmp	short loc_D887B

loc_D8879:
		mov	ax, di

loc_D887B:
		mov	[si+3Ch], ax
		mov	ax, [bp+arg_4]
		mov	[bp+var_70], ax
		mov	ax, [bp+arg_8]
		mov	[bp+var_72], ax
		push	36h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_D889B
		jmp	loc_D892B

loc_D889B:
		push	large 0A000Ah
		push	large 870133h
		push	ax
		call	sub_74A8C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 3CF1h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	bx, [bp+var_70]
		mov	eax, [bx]
		mov	[bp+var_76], eax
		mov	al, [bx+4]
		mov	[bp+var_77], al
		mov	eax, [bp+var_76]
		mov	[di+1Eh], eax
		mov	al, [bp+var_77]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bx+6]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 2
		mov	word ptr [di+0Eh], 41B8h
		mov	bx, [bp+var_72]
		mov	eax, [bx]
		mov	[di+2Ah], eax
		mov	word ptr [di+2Eh], 1Ah
		mov	word ptr [di+30h], 3
		mov	word ptr [di+32h], 133h
		mov	word ptr [di+34h], 87h
		mov	ax, di
		jmp	short loc_D892D

loc_D892B:
		mov	ax, di

loc_D892D:
		mov	[si+34h], ax
		mov	ax, [bp+arg_4]
		mov	[bp+var_7A], ax
		mov	ax, [bp+arg_8]
		mov	[bp+var_7C], ax
		push	36h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_D894D
		jmp	loc_D89DF

loc_D894D:
		push	large 0A000Ah
		push	large 0A000C8h
		push	ax
		call	sub_74A8C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 3CF1h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	bx, [bp+var_7A]
		mov	eax, [bx]
		mov	[bp+var_80], eax
		mov	al, [bx+4]
		mov	[bp+var_81], al
		mov	eax, [bp+var_80]
		mov	[di+1Eh], eax
		mov	al, [bp+var_81]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bx+6]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 0
		mov	word ptr [di+0Eh], 41B8h
		mov	bx, [bp+var_7C]
		mov	eax, [bx]
		mov	[di+2Ah], eax
		mov	word ptr [di+2Eh], 1Fh
		mov	word ptr [di+30h], 1
		mov	word ptr [di+32h], 0C8h
		mov	word ptr [di+34h], 0A0h
		mov	ax, di
		jmp	short loc_D89E1

loc_D89DF:
		mov	ax, di

loc_D89E1:
		mov	[si+3Eh], ax
		mov	ax, [bp+arg_4]
		mov	[bp+var_84], ax
		mov	ax, [bp+arg_8]
		mov	[bp+var_86], ax
		push	36h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_D8A03
		jmp	loc_D8A99

loc_D8A03:
		push	large 0A000Ah
		push	large 0A00133h
		push	ax
		call	sub_74A8C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 3CF1h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	bx, [bp+var_84]
		mov	eax, [bx]
		mov	[bp+var_8A], eax
		mov	al, [bx+4]
		mov	[bp+var_8B], al
		mov	eax, [bp+var_8A]
		mov	[di+1Eh], eax
		mov	al, [bp+var_8B]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bx+6]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 2
		mov	word ptr [di+0Eh], 41B8h
		mov	bx, [bp+var_86]
		mov	eax, [bx]
		mov	[di+2Ah], eax
		mov	word ptr [di+2Eh], 1Bh
		mov	word ptr [di+30h], 3
		mov	word ptr [di+32h], 133h
		mov	word ptr [di+34h], 0A0h
		mov	ax, di
		jmp	short loc_D8A9B

loc_D8A99:
		mov	ax, di

loc_D8A9B:
		mov	[si+36h], ax
		mov	ax, [bp+arg_4]
		mov	[bp+var_8E], ax
		mov	ax, [bp+arg_8]
		mov	[bp+var_90], ax
		push	36h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_D8ABD
		jmp	loc_D8B53

loc_D8ABD:
		push	large 0A000Ah
		push	large 0B900C8h
		push	ax
		call	sub_74A8C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 3CF1h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	bx, [bp+var_8E]
		mov	eax, [bx]
		mov	[bp+var_94], eax
		mov	al, [bx+4]
		mov	[bp+var_95], al
		mov	eax, [bp+var_94]
		mov	[di+1Eh], eax
		mov	al, [bp+var_95]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bx+6]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 0
		mov	word ptr [di+0Eh], 41B8h
		mov	bx, [bp+var_90]
		mov	eax, [bx]
		mov	[di+2Ah], eax
		mov	word ptr [di+2Eh], 20h
		mov	word ptr [di+30h], 1
		mov	word ptr [di+32h], 0C8h
		mov	word ptr [di+34h], 0B9h
		mov	ax, di
		jmp	short loc_D8B55

loc_D8B53:
		mov	ax, di

loc_D8B55:
		mov	[si+40h], ax
		mov	ax, [bp+arg_4]
		mov	[bp+var_98], ax
		mov	ax, [bp+arg_8]
		mov	[bp+var_9A], ax
		push	36h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_D8B77
		jmp	loc_D8C0D

loc_D8B77:
		push	large 0A000Ah
		push	large 0B90133h
		push	ax
		call	sub_74A8C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 3CF1h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	bx, [bp+var_98]
		mov	eax, [bx]
		mov	[bp+var_9E], eax
		mov	al, [bx+4]
		mov	[bp+var_9F], al
		mov	eax, [bp+var_9E]
		mov	[di+1Eh], eax
		mov	al, [bp+var_9F]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bx+6]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 2
		mov	word ptr [di+0Eh], 41B8h
		mov	bx, [bp+var_9A]
		mov	eax, [bx]
		mov	[di+2Ah], eax
		mov	word ptr [di+2Eh], 1Ch
		mov	word ptr [di+30h], 3
		mov	word ptr [di+32h], 133h
		mov	word ptr [di+34h], 0B9h
		mov	ax, di
		jmp	short loc_D8C0F

loc_D8C0D:
		mov	ax, di

loc_D8C0F:
		mov	[si+38h], ax
		push	word ptr [si]
		push	[bp+arg_2]
		call	sub_74CF3
		add	sp, 4
		cmp	word ptr [si], 0
		jz	short loc_D8C35
		push	3
		push	word ptr [si]
		mov	bx, [si]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx+30h]
		add	sp, 4
		jmp	short loc_D8C35

loc_D8C35:
		push	word ptr [si+22h]
		push	[bp+arg_2]
		call	sub_74CF3
		add	sp, 4
		push	word ptr [si+24h]
		push	[bp+arg_2]
		call	sub_74CF3
		add	sp, 4
		push	word ptr [si+26h]
		push	[bp+arg_2]
		call	sub_74CF3
		add	sp, 4
		mov	ax, [bp+arg_6]
		mov	[bp+var_A2], ax
		mov	ax, [bp+arg_8]
		mov	[bp+var_A4], ax
		push	36h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_D8C7E
		jmp	loc_D8D14

loc_D8C7E:
		push	large 140020h
		push	large 0AF0017h
		push	ax
		call	sub_74A8C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 3CF1h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	bx, [bp+var_A2]
		mov	eax, [bx]
		mov	[bp+var_A8], eax
		mov	al, [bx+4]
		mov	[bp+var_A9], al
		mov	eax, [bp+var_A8]
		mov	[di+1Eh], eax
		mov	al, [bp+var_A9]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bx+6]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 0
		mov	word ptr [di+0Eh], 41B8h
		mov	bx, [bp+var_A4]
		mov	eax, [bx]
		mov	[di+2Ah], eax
		mov	word ptr [di+2Eh], 0
		mov	word ptr [di+30h], 1
		mov	word ptr [di+32h], 17h
		mov	word ptr [di+34h], 0AFh
		mov	ax, di
		jmp	short loc_D8D16

loc_D8D14:
		mov	ax, di

loc_D8D16:
		mov	[si], ax
		push	10h
		push	word ptr [si]
		push	[bp+arg_2]
		call	sub_74C8A
		add	sp, 6
		mov	ax, [bp+arg_6]
		mov	[bp+var_AC], ax
		mov	ax, [bp+arg_8]
		mov	[bp+var_AE], ax
		push	36h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_D8D46
		jmp	loc_D8DDC

loc_D8D46:
		push	large 140020h
		push	large 0AF0035h
		push	ax
		call	sub_74A8C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 3CF1h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	bx, [bp+var_AC]
		mov	eax, [bx]
		mov	[bp+var_B2], eax
		mov	al, [bx+4]
		mov	[bp+var_B3], al
		mov	eax, [bp+var_B2]
		mov	[di+1Eh], eax
		mov	al, [bp+var_B3]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bx+6]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 4
		mov	word ptr [di+0Eh], 41B8h
		mov	bx, [bp+var_AE]
		mov	eax, [bx]
		mov	[di+2Ah], eax
		mov	word ptr [di+2Eh], 25h
		mov	word ptr [di+30h], 5
		mov	word ptr [di+32h], 35h
		mov	word ptr [di+34h], 0AFh
		mov	ax, di
		jmp	short loc_D8DDE

loc_D8DDC:
		mov	ax, di

loc_D8DDE:
		mov	[si+4Ah], ax
		mov	ax, [bp+arg_6]
		mov	[bp+var_B6], ax
		mov	ax, [bp+arg_8]
		mov	[bp+var_B8], ax
		push	36h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_D8E00
		jmp	loc_D8E96

loc_D8E00:
		push	large 140020h
		push	large 0AF0071h
		push	ax
		call	sub_74A8C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 3CF1h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	bx, [bp+var_B6]
		mov	eax, [bx]
		mov	[bp+var_BC], eax
		mov	al, [bx+4]
		mov	[bp+var_BD], al
		mov	eax, [bp+var_BC]
		mov	[di+1Eh], eax
		mov	al, [bp+var_BD]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bx+6]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 8
		mov	word ptr [di+0Eh], 41B8h
		mov	bx, [bp+var_B8]
		mov	eax, [bx]
		mov	[di+2Ah], eax
		mov	word ptr [di+2Eh], 26h
		mov	word ptr [di+30h], 9
		mov	word ptr [di+32h], 71h
		mov	word ptr [di+34h], 0AFh
		mov	ax, di
		jmp	short loc_D8E98

loc_D8E96:
		mov	ax, di

loc_D8E98:
		mov	[si+4Ch], ax
		mov	ax, [bp+arg_6]
		mov	[bp+var_C0], ax
		mov	ax, [bp+arg_8]
		mov	[bp+var_C2], ax
		push	36h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_D8EBA
		jmp	loc_D8F50

loc_D8EBA:
		push	large 140020h
		push	large 0AF0054h
		push	ax
		call	sub_74A8C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 3CF1h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	bx, [bp+var_C0]
		mov	eax, [bx]
		mov	[bp+var_C6], eax
		mov	al, [bx+4]
		mov	[bp+var_C7], al
		mov	eax, [bp+var_C6]
		mov	[di+1Eh], eax
		mov	al, [bp+var_C7]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bx+6]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 0Ah
		mov	word ptr [di+0Eh], 41B8h
		mov	bx, [bp+var_C2]
		mov	eax, [bx]
		mov	[di+2Ah], eax
		mov	word ptr [di+2Eh], 27h
		mov	word ptr [di+30h], 0Bh
		mov	word ptr [di+32h], 54h
		mov	word ptr [di+34h], 0AFh
		mov	ax, di
		jmp	short loc_D8F52

loc_D8F50:
		mov	ax, di

loc_D8F52:
		mov	[si+4Eh], ax
		mov	ax, [bp+arg_6]
		mov	[bp+var_CA], ax
		mov	ax, [bp+arg_8]
		mov	[bp+var_CC], ax
		push	36h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_D8F74
		jmp	loc_D900A

loc_D8F74:
		push	large 140020h
		push	large 0AF009Eh
		push	ax
		call	sub_74A8C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 3CF1h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	bx, [bp+var_CA]
		mov	eax, [bx]
		mov	[bp+var_D0], eax
		mov	al, [bx+4]
		mov	[bp+var_D1], al
		mov	eax, [bp+var_D0]
		mov	[di+1Eh], eax
		mov	al, [bp+var_D1]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bx+6]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 0Ch
		mov	word ptr [di+0Eh], 41B8h
		mov	bx, [bp+var_CC]
		mov	eax, [bx]
		mov	[di+2Ah], eax
		mov	word ptr [di+2Eh], 28h
		mov	word ptr [di+30h], 0Dh
		mov	word ptr [di+32h], 8Fh
		mov	word ptr [di+34h], 0AFh
		mov	ax, di
		jmp	short loc_D900C

loc_D900A:
		mov	ax, di

loc_D900C:
		mov	[si+50h], ax
		mov	di, 28h
		jmp	short loc_D9044

loc_D9014:
		mov	bx, di
		shl	bx, 1
		cmp	word ptr [bx+si], 0
		jz	short loc_D9030
		mov	bx, di
		shl	bx, 1
		push	word ptr [bx+si]
		mov	bx, di
		shl	bx, 1
		mov	bx, [bx+si]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx+4]
		pop	cx

loc_D9030:
		push	0
		mov	bx, di
		shl	bx, 1
		push	word ptr [bx+si]
		push	[bp+arg_2]
		call	sub_74C8A
		add	sp, 6
		dec	di

loc_D9044:
		cmp	di, 14h
		jg	short loc_D9014
		push	word ptr [si+4Ah]
		mov	bx, [si+4Ah]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx]
		pop	cx
		push	word ptr [si+4Ch]
		mov	bx, [si+4Ch]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx]
		pop	cx
		push	word ptr [si+4Eh]
		mov	bx, [si+4Eh]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx]
		pop	cx
		push	word ptr [si+50h]
		mov	bx, [si+50h]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx]
		pop	cx
		pop	di
		pop	si
		leave
		retf
sub_D80CC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D907D		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	word ptr [si+4]
		mov	bx, [si+4]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx]
		pop	cx
		push	word ptr [si+2]
		mov	bx, [si+2]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx]
		pop	cx
		pop	si
		pop	bp
		retf
sub_D907D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D909F		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	word ptr [si+8]
		mov	bx, [si+8]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx]
		pop	cx
		push	word ptr [si+6]
		mov	bx, [si+6]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx]
		pop	cx
		pop	si
		pop	bp
		retf
sub_D909F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D90C1		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	word ptr [si+20h]
		mov	bx, [si+20h]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx]
		pop	cx
		push	word ptr [si+1Eh]
		mov	bx, [si+1Eh]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx]
		pop	cx
		pop	si
		pop	bp
		retf
sub_D90C1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D90E3		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	word ptr [si+8]
		mov	bx, [si+8]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx+4]
		pop	cx
		push	word ptr [si+6]
		mov	bx, [si+6]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx+4]
		pop	cx
		pop	si
		pop	bp
		retf
sub_D90E3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D9107		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	word ptr [si+20h]
		mov	bx, [si+20h]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx+4]
		pop	cx
		push	word ptr [si+1Eh]
		mov	bx, [si+1Eh]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx+4]
		pop	cx
		pop	si
		pop	bp
		retf
sub_D9107		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D912B		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		push	cs
		call	near ptr sub_D90C1
		pop	cx
		push	si
		push	cs
		call	near ptr sub_D909F
		pop	cx
		pop	si
		pop	bp
		retf
sub_D912B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D9141		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		push	cs
		call	near ptr sub_D9107
		pop	cx
		push	si
		push	cs
		call	near ptr sub_D90E3
		pop	cx
		pop	si
		pop	bp
		retf
sub_D9141		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D9157		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	word ptr [si+2Ch]
		mov	bx, [si+2Ch]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx]
		pop	cx
		push	word ptr [si+2Ah]
		mov	bx, [si+2Ah]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx]
		pop	cx
		pop	si
		pop	bp
		retf
sub_D9157		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D9179		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	word ptr [si+0Ch]
		mov	bx, [si+0Ch]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx]
		pop	cx
		push	word ptr [si+0Ah]
		mov	bx, [si+0Ah]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx]
		pop	cx
		pop	si
		pop	bp
		retf
sub_D9179		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D919B		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	word ptr [si+48h]
		mov	bx, [si+48h]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx]
		pop	cx
		push	word ptr [si+46h]
		mov	bx, [si+46h]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx]
		pop	cx
		pop	si
		pop	bp
		retf
sub_D919B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D91BD		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	word ptr [si+0Eh]
		mov	bx, [si+0Eh]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx]
		pop	cx
		push	word ptr [si+16h]
		mov	bx, [si+16h]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx]
		pop	cx
		pop	si
		pop	bp
		retf
sub_D91BD		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D91DF		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	word ptr [si+10h]
		mov	bx, [si+10h]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx]
		pop	cx
		push	word ptr [si+18h]
		mov	bx, [si+18h]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx]
		pop	cx
		pop	si
		pop	bp
		retf
sub_D91DF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D9201		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	word ptr [si+12h]
		mov	bx, [si+12h]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx]
		pop	cx
		push	word ptr [si+1Ah]
		mov	bx, [si+1Ah]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx]
		pop	cx
		pop	si
		pop	bp
		retf
sub_D9201		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D9223		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	word ptr [si+14h]
		mov	bx, [si+14h]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx]
		pop	cx
		push	word ptr [si+1Ch]
		mov	bx, [si+1Ch]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx]
		pop	cx
		pop	si
		pop	bp
		retf
sub_D9223		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D9245		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	word ptr [si+32h]
		mov	bx, [si+32h]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx]
		pop	cx
		push	word ptr [si+3Ah]
		mov	bx, [si+3Ah]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx]
		pop	cx
		pop	si
		pop	bp
		retf
sub_D9245		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D9267		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	word ptr [si+34h]
		mov	bx, [si+34h]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx]
		pop	cx
		push	word ptr [si+3Ch]
		mov	bx, [si+3Ch]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx]
		pop	cx
		pop	si
		pop	bp
		retf
sub_D9267		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D9289		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	word ptr [si+36h]
		mov	bx, [si+36h]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx]
		pop	cx
		push	word ptr [si+3Eh]
		mov	bx, [si+3Eh]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx]
		pop	cx
		pop	si
		pop	bp
		retf
sub_D9289		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D92AB		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	word ptr [si+38h]
		mov	bx, [si+38h]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx]
		pop	cx
		push	word ptr [si+40h]
		mov	bx, [si+40h]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx]
		pop	cx
		pop	si
		pop	bp
		retf
sub_D92AB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D92CD		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	word ptr [si+4]
		mov	bx, [si+4]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx+4]
		pop	cx
		push	word ptr [si+2]
		mov	bx, [si+2]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx+4]
		pop	cx
		pop	si
		pop	bp
		retf
sub_D92CD		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D92F1		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	word ptr [si+2Ch]
		mov	bx, [si+2Ch]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx+4]
		pop	cx
		push	word ptr [si+2Ah]
		mov	bx, [si+2Ah]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx+4]
		pop	cx
		pop	si
		pop	bp
		retf
sub_D92F1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D9315		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	word ptr [si+0Ch]
		mov	bx, [si+0Ch]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx+4]
		pop	cx
		push	word ptr [si+0Ah]
		mov	bx, [si+0Ah]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx+4]
		pop	cx
		pop	si
		pop	bp
		retf
sub_D9315		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D9339		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	word ptr [si+48h]
		mov	bx, [si+48h]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx+4]
		pop	cx
		push	word ptr [si+46h]
		mov	bx, [si+46h]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx+4]
		pop	cx
		pop	si
		pop	bp
		retf
sub_D9339		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D935D		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	word ptr [si+0Eh]
		mov	bx, [si+0Eh]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx+4]
		pop	cx
		push	word ptr [si+16h]
		mov	bx, [si+16h]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx+4]
		pop	cx
		pop	si
		pop	bp
		retf
sub_D935D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D9381		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	word ptr [si+10h]
		mov	bx, [si+10h]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx+4]
		pop	cx
		push	word ptr [si+18h]
		mov	bx, [si+18h]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx+4]
		pop	cx
		pop	si
		pop	bp
		retf
sub_D9381		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D93A5		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	word ptr [si+12h]
		mov	bx, [si+12h]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx+4]
		pop	cx
		push	word ptr [si+1Ah]
		mov	bx, [si+1Ah]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx+4]
		pop	cx
		pop	si
		pop	bp
		retf
sub_D93A5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D93C9		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	word ptr [si+14h]
		mov	bx, [si+14h]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx+4]
		pop	cx
		push	word ptr [si+1Ch]
		mov	bx, [si+1Ch]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx+4]
		pop	cx
		pop	si
		pop	bp
		retf
sub_D93C9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D93ED		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	word ptr [si+32h]
		mov	bx, [si+32h]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx+4]
		pop	cx
		push	word ptr [si+3Ah]
		mov	bx, [si+3Ah]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx+4]
		pop	cx
		pop	si
		pop	bp
		retf
sub_D93ED		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D9411		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	word ptr [si+34h]
		mov	bx, [si+34h]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx+4]
		pop	cx
		push	word ptr [si+3Ch]
		mov	bx, [si+3Ch]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx+4]
		pop	cx
		pop	si
		pop	bp
		retf
sub_D9411		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D9435		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	word ptr [si+36h]
		mov	bx, [si+36h]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx+4]
		pop	cx
		push	word ptr [si+3Eh]
		mov	bx, [si+3Eh]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx+4]
		pop	cx
		pop	si
		pop	bp
		retf
sub_D9435		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D9459		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	word ptr [si+38h]
		mov	bx, [si+38h]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx+4]
		pop	cx
		push	word ptr [si+40h]
		mov	bx, [si+40h]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx+4]
		pop	cx
		pop	si
		pop	bp
		retf
sub_D9459		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D947D		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	word ptr [si+44h]
		mov	bx, [si+44h]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx]
		pop	cx
		push	word ptr [si+42h]
		mov	bx, [si+42h]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx]
		pop	cx
		pop	si
		pop	bp
		retf
sub_D947D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D949F		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	word ptr [si+30h]
		mov	bx, [si+30h]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx]
		pop	cx
		push	word ptr [si+2Eh]
		mov	bx, [si+2Eh]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx]
		pop	cx
		pop	si
		pop	bp
		retf
sub_D949F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D94C1		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	word ptr [si+30h]
		mov	bx, [si+30h]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx+4]
		pop	cx
		push	word ptr [si+2Eh]
		mov	bx, [si+2Eh]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx+4]
		pop	cx
		pop	si
		pop	bp
		retf
sub_D94C1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D94E5		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	word ptr [si+44h]
		mov	bx, [si+44h]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx+4]
		pop	cx
		push	word ptr [si+42h]
		mov	bx, [si+42h]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx+4]
		pop	cx
		pop	si
		pop	bp
		retf
sub_D94E5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D9509		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		push	cs
		call	near ptr sub_D947D
		pop	cx
		push	si
		push	cs
		call	near ptr sub_D949F
		pop	cx
		pop	si
		pop	bp
		retf
sub_D9509		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D951F		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		push	cs
		call	near ptr sub_D94E5
		pop	cx
		push	si
		push	cs
		call	near ptr sub_D94C1
		pop	cx
		pop	si
		pop	bp
		retf
sub_D951F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 10 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à ResourceFile_ReleaseAndStyle_90CBB (sub_90CBB de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; combine Memory_TypedFree_5C7B6, TextFormat_ReleaseStyleList_5E526 (seg143).
; ==============================================================================================
ResourceFile_ReleaseAndStyle_D9535		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_D9594
		cmp	byte ptr [si+23h], 0
		jz	short loc_D956A
		cmp	dword ptr [si+1Eh], 0
		jz	short loc_D956A
		push	0
		mov	al, [si+22h]
		push	ax
		mov	ax, si
		add	ax, 1Eh
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_D956A

loc_D956A:
		mov	dword ptr [si+1Eh], 0
		mov	byte ptr [si+23h], 0
		mov	dword ptr [si+24h], 0
		push	si
		call	TextFormat_ReleaseStyleList_67E97
		pop	cx
		test	di, 1
		jz	short loc_D9594
		push	si
		call	sub_3B2
		pop	cx
		jmp	short loc_D9594

loc_D9594:
		pop	di
		pop	si
		pop	bp
		retf
ResourceFile_ReleaseAndStyle_D9535		endp
ovr382		ends
