seg080		segment	para public 'CODE' use16
		assume cs:seg080
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 1, 0, 74h, 7, 56h, 9Ah, 0B2h, 3, 0, 0, 59h

loc_315AB:
		db 5Fh, 5Eh, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_315AF		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	byte ptr [si+9], 0
		jz	short loc_315DC
		cmp	dword ptr [si+4], 0
		jz	short loc_315DC
		push	0
		mov	al, [si+8]
		push	ax
		mov	ax, si
		add	ax, 4
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_315DC

loc_315DC:
		mov	dword ptr [si+4], 0
		mov	byte ptr [si+9], 0
		mov	dword ptr [si+0Ah], 0
		pop	si
		pop	bp
		retf
sub_315AF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_315F3		proc far

var_2C		= word ptr -2Ch
var_2A		= word ptr -2Ah
var_28		= word ptr -28h
var_26		= dword ptr -26h
var_22		= dword ptr -22h
var_1E		= dword ptr -1Eh
var_1A		= word ptr -1Ah
var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 2Ch
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_4]
		mov	ax, [di]
		cwd
		idiv	word ptr [si+86h]
		mov	[bp+var_2], ax
		mov	ax, [di+2]
		cwd
		idiv	word ptr [si+86h]
		mov	[bp+var_4], ax
		mov	ax, [di]
		cwd
		idiv	word ptr [si+86h]
		mov	cx, dx
		mov	ax, [di+2]
		cwd
		idiv	word ptr [si+86h]
		mov	di, dx
		or	cx, cx
		jge	short loc_31630
		dec	[bp+var_2]

loc_31630:
		or	di, di
		jge	short loc_31637
		dec	[bp+var_4]

loc_31637:
		mov	ax, [bp+var_2]
		mov	[bp+var_6], ax
		mov	ax, [bp+var_4]
		mov	[bp+var_8], ax
		cmp	[bp+var_6], 0
		jge	short loc_31650
		mov	[bp+var_6], 0
		jmp	short loc_3165C

loc_31650:
		mov	ax, [si+7]
		cmp	ax, [bp+var_6]
		jg	short loc_3165C
		dec	ax
		mov	[bp+var_6], ax

loc_3165C:
		cmp	[bp+var_8], 0
		jge	short loc_31669
		mov	[bp+var_8], 0
		jmp	short loc_31675

loc_31669:
		mov	ax, [si+7]
		cmp	ax, [bp+var_8]
		jg	short loc_31675
		dec	ax
		mov	[bp+var_8], ax

loc_31675:
		mov	[bp+var_A], cx
		mov	[bp+var_C], di
		cmp	[bp+var_A], 0
		jge	short loc_31688
		mov	ax, [si+86h]
		add	[bp+var_A], ax

loc_31688:
		cmp	[bp+var_C], 0
		jge	short loc_31695
		mov	ax, [si+86h]
		add	[bp+var_C], ax

loc_31695:
		mov	eax, [si+3]
		mov	[bp+var_10], eax
		mov	ax, [bp+var_8]
		imul	word ptr [si+7]
		add	ax, [bp+var_6]
		shl	ax, 1
		add	word ptr [bp+var_10], ax
		mov	bx, [bp+arg_2]
		mov	ax, [bx+17h]
		mov	[bp+var_18], ax
		push	0
		les	bx, word ptr [bp+var_10]
		mov	bx, es:[bx]
		mov	al, [bx+8]
		push	ax
		mov	bx, word ptr [bp+var_10]
		mov	bx, es:[bx]
		push	large [bx+4]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		mov	word ptr [bp+var_22+2], dx
		mov	word ptr [bp+var_22], ax
		mov	ax, [bp+var_C]
		imul	word ptr [si+86h]
		add	ax, [bp+var_A]
		imul	ax, ax, 6
		add	word ptr [bp+var_22], ax
		les	bx, word ptr [bp+var_10]
		mov	bx, es:[bx]
		movsx	eax, word ptr [bx+12h]
		mov	[bp+var_26], eax
		mov	[bp+var_28], 1
		mov	[bp+var_2C], 0
		jmp	loc_31877

loc_31707:
		mov	ax, [si+86h]
		cmp	ax, [bp+var_C]
		jle	short loc_31713
		jmp	loc_31794

loc_31713:
		mov	[bp+var_C], 0
		inc	[bp+var_4]
		mov	ax, [si+7]
		cmp	ax, [bp+var_4]
		jg	short loc_31726
		dec	ax
		jmp	short loc_31736

loc_31726:
		cmp	[bp+var_4], 0
		jge	short loc_31733
		mov	[bp+var_8], 0
		jmp	short loc_31739

loc_31733:
		mov	ax, [bp+var_4]

loc_31736:
		mov	[bp+var_8], ax

loc_31739:
		mov	eax, [si+3]
		mov	[bp+var_10], eax
		mov	ax, [bp+var_8]
		imul	word ptr [si+7]
		add	ax, [bp+var_6]
		shl	ax, 1
		add	word ptr [bp+var_10], ax
		les	bx, word ptr [bp+var_10]
		mov	di, es:[bx]
		or	di, di
		jz	short loc_3178B
		push	0
		mov	al, [di+8]
		push	ax
		push	large [di+4]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		mov	word ptr [bp+var_22+2], dx
		mov	word ptr [bp+var_22], ax
		mov	ax, [bp+var_A]
		imul	ax, ax, 6
		add	word ptr [bp+var_22], ax
		movsx	eax, word ptr [di+12h]
		add	[bp+var_26], eax
		inc	[bp+var_28]
		jmp	short loc_31794

loc_3178B:
		push	0E00Dh
		call	sub_1DDFE
		pop	cx

loc_31794:
		mov	ax, [bp+var_A]
		mov	[bp+var_1A], ax
		mov	eax, [bp+var_22]
		mov	[bp+var_1E], eax
		mov	ax, [bp+var_2]
		mov	[bp+var_16], ax
		mov	[bp+var_2A], 0
		jmp	loc_31859

loc_317B0:
		mov	ax, [si+86h]
		cmp	ax, [bp+var_1A]
		jle	short loc_317BC
		jmp	loc_3183D

loc_317BC:
		mov	[bp+var_1A], 0
		inc	[bp+var_16]
		mov	ax, [si+7]
		cmp	ax, [bp+var_16]
		jg	short loc_317D2
		mov	cx, [si+7]
		dec	cx
		jmp	short loc_317DF

loc_317D2:
		cmp	[bp+var_16], 0
		jge	short loc_317DC
		xor	cx, cx
		jmp	short loc_317DF

loc_317DC:
		mov	cx, [bp+var_16]

loc_317DF:
		mov	eax, [si+3]
		mov	[bp+var_14], eax
		mov	ax, [bp+var_8]
		imul	word ptr [si+7]
		add	ax, cx
		shl	ax, 1
		add	word ptr [bp+var_14], ax
		les	bx, word ptr [bp+var_14]
		mov	di, es:[bx]
		or	di, di
		jz	short loc_31834
		push	0
		mov	al, [di+8]
		push	ax
		push	large [di+4]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		mov	word ptr [bp+var_1E+2], dx
		mov	word ptr [bp+var_1E], ax
		mov	ax, [bp+var_C]
		imul	word ptr [si+86h]
		imul	ax, ax, 6
		add	word ptr [bp+var_1E], ax
		movsx	eax, word ptr [di+12h]
		add	[bp+var_26], eax
		inc	[bp+var_28]
		jmp	short loc_3183D

loc_31834:
		push	0E00Dh
		call	sub_1DDFE
		pop	cx

loc_3183D:
		mov	bx, [bp+var_18]
		mov	ax, word ptr [bp+var_1E+2]
		mov	dx, word ptr [bp+var_1E]
		mov	[bx+2], ax
		mov	[bx], dx
		add	word ptr [bp+var_1E], 6
		add	[bp+var_18], 4
		inc	[bp+var_1A]
		inc	[bp+var_2A]

loc_31859:
		mov	bx, [bp+arg_2]
		mov	ax, [bx+11h]
		cmp	ax, [bp+var_2A]
		jle	short loc_31867
		jmp	loc_317B0

loc_31867:
		mov	ax, [si+86h]
		imul	ax, ax, 6
		add	word ptr [bp+var_22], ax
		inc	[bp+var_C]
		inc	[bp+var_2C]

loc_31877:
		mov	bx, [bp+arg_2]
		mov	ax, [bx+11h]
		cmp	ax, [bp+var_2C]
		jle	short loc_31885
		jmp	loc_31707

loc_31885:
		movsx	ebx, [bp+var_28]
		mov	eax, [bp+var_26]
		cdq
		idiv	ebx
		mov	[bp+var_26], eax
		mov	bx, [bp+arg_2]
		mov	[bx+0Dh], eax
		pop	di
		pop	si
		leave
		retf
sub_315F3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à Terrain_HeightSample
; (sub_32901 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far,184L — division fixed-point par la taille de tuile (+0x86), boucle sur une grille
; de hauteur de terrain (buffer local important) : échantillonnage/interpolation d'une grille
; de hauteur de terrain (heightfield). | LUE 2026-10-12 (fin) : renvoie le uint16 de la grille
; [lod+0x8A] de la case (x, z) = le fichier .OBJ (sous-ressource 6 du PAK, lu par
; Terrain_LoadHeightmapFromIFFB_99CEF) = ALTITUDE PLAFOND DE LA CELLULE (mètres entiers).
; ==============================================================================================
Terrain_HeightSample		proc far

var_4C		= word ptr -4Ch
var_4A		= dword ptr -4Ah
var_46		= dword ptr -46h
var_42		= word ptr -42h
var_40		= dword ptr -40h
var_3C		= dword ptr -3Ch
var_38		= word ptr -38h
var_36		= word ptr -36h
var_34		= dword ptr -34h
var_30		= dword ptr -30h
var_2C		= word ptr -2Ch
var_2A		= dword ptr -2Ah
var_26		= dword ptr -26h
var_22		= word ptr -22h
var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= word ptr -14h
var_12		= dword ptr -12h
var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_6		= dword ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4Ch
		push	si
		push	di
		mov	di, [bp+arg_0]
		movsx	ebx, word ptr [di+86h]
		mov	eax, [di+82h]
		cdq
		idiv	ebx
		mov	[bp+var_2], ax
		mov	si, [bp+arg_2]
		mov	eax, [si]
		mov	[bp+var_12], eax
		mov	eax, [si+4]
		mov	[bp+var_E], eax
		mov	eax, [bp+var_12]
		mov	[bp+var_A], eax
		mov	eax, [bp+var_E]
		mov	[bp+var_6], eax
		mov	ax, [bp+var_2]
		mov	[bp+var_14], ax
		movsx	eax, [bp+var_14]
		shl	eax, 8
		mov	[bp+var_18], eax
		mov	eax, [bp+var_A]
		mov	edx, eax
		mov	ecx, [bp+var_18]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_A], eax
		mov	eax, [bp+var_6]
		mov	edx, eax
		mov	ecx, [bp+var_18]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_6], eax
		mov	eax, [bp+var_A]
		mov	[bp+var_20], eax
		mov	eax, [bp+var_6]
		mov	[bp+var_1C], eax
		mov	ax, [di+88h]
		sar	ax, 1
		mov	[bp+var_22], ax
		movsx	eax, [bp+var_22]
		shl	eax, 8
		sub	eax, [bp+var_6]
		mov	[bp+var_26], eax
		mov	[bp+var_2A], eax
		mov	ax, [di+86h]
		mov	[bp+var_2C], ax
		movsx	ebx, [bp+var_2C]
		mov	eax, [bp+var_2A]
		cdq
		idiv	ebx
		mov	[bp+var_30], eax
		mov	[bp+var_34], eax
		mov	si, word ptr [bp+var_34+1]
		mov	ax, [di+88h]
		sar	ax, 1
		mov	[bp+var_38], ax
		movsx	eax, [bp+var_38]
		shl	eax, 8
		mov	edx, [bp+var_A]
		add	edx, eax
		mov	[bp+var_3C], edx
		mov	eax, [bp+var_3C]
		mov	[bp+var_40], eax
		mov	ax, [di+86h]
		mov	[bp+var_42], ax
		movsx	ebx, [bp+var_42]
		mov	eax, [bp+var_40]
		cdq
		idiv	ebx
		mov	[bp+var_46], eax
		mov	[bp+var_4A], eax
		mov	ax, word ptr [bp+var_4A+1]
		mov	[bp+var_36], ax
		cmp	[bp+var_36], 0
		jge	short loc_319CC
		mov	[bp+var_36], 0
		jmp	short loc_319D8

loc_319CC:
		mov	ax, [di+7]
		cmp	ax, [bp+var_36]
		jg	short loc_319D8
		dec	ax
		mov	[bp+var_36], ax

loc_319D8:
		or	si, si
		jge	short loc_319E0
		xor	si, si
		jmp	short loc_319E9

loc_319E0:
		cmp	[di+7], si
		jg	short loc_319E9
		mov	si, [di+7]
		dec	si

loc_319E9:
		mov	ax, [di+7]
		imul	si
		mov	dx, [bp+var_36]
		add	dx, ax
		mov	[bp+var_4C], dx
		les	bx, [di+8Ah]
		mov	ax, [bp+var_4C]
		shl	ax, 1
		add	bx, ax
		movzx	eax, word ptr es:[bx]
		shld	edx, eax, 10h
		pop	di
		pop	si
		leave
		retf
Terrain_HeightSample		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_31A0F		proc far

var_86		= word ptr -86h
var_84		= word ptr -84h
var_82		= word ptr -82h
var_80		= word ptr -80h
var_7E		= word ptr -7Eh
var_7C		= word ptr -7Ch
var_7A		= word ptr -7Ah
var_78		= word ptr -78h
var_76		= word ptr -76h
var_74		= word ptr -74h
var_72		= word ptr -72h
var_70		= dword ptr -70h
var_6C		= dword ptr -6Ch
var_68		= dword ptr -68h
var_64		= dword ptr -64h
var_60		= dword ptr -60h
var_5C		= dword ptr -5Ch
var_58		= dword ptr -58h
var_54		= dword ptr -54h
var_50		= dword ptr -50h
var_4C		= dword ptr -4Ch
var_48		= word ptr -48h
var_46		= word ptr -46h
var_44		= dword ptr -44h
var_40		= word ptr -40h
var_3E		= dword ptr -3Eh
var_3A		= dword ptr -3Ah
var_36		= dword ptr -36h
var_32		= word ptr -32h
var_30		= word ptr -30h
var_2E		= word ptr -2Eh
var_2C		= dword ptr -2Ch
var_28		= dword ptr -28h
var_24		= dword ptr -24h
var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= word ptr -10h
var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= byte ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 86h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	ax, [si+11h]
		dec	ax
		mov	[bp+var_6], ax
		mov	[bp+var_10], di
		mov	bx, [bp+var_10]
		mov	eax, [bx]
		mov	[bp+var_18], eax
		mov	eax, [bx+4]
		mov	[bp+var_14], eax
		mov	eax, [bp+var_18]
		mov	[bp+var_E], eax
		mov	eax, [bp+var_14]
		mov	[bp+var_A], eax
		mov	eax, [si+9]
		mov	[bp+var_1C], eax
		shl	eax, 8
		mov	[bp+var_20], eax
		mov	eax, [bp+var_E]
		mov	edx, eax
		mov	ecx, [bp+var_20]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_E], eax
		mov	eax, [bp+var_A]
		mov	edx, eax
		mov	ecx, [bp+var_20]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_A], eax
		mov	eax, [bp+var_E]
		mov	[bp+var_28], eax
		mov	eax, [bp+var_A]
		mov	[bp+var_24], eax
		cmp	dword ptr [di], 0
		jge	short loc_31AA9
		mov	ax, 1
		jmp	short loc_31AAB

loc_31AA9:
		xor	ax, ax

loc_31AAB:
		or	al, al
		jz	short loc_31AB7
		sub	[bp+var_E], 100h

loc_31AB7:
		cmp	dword ptr [di+4], 0
		jle	short loc_31AC3
		mov	ax, 1
		jmp	short loc_31AC5

loc_31AC3:
		xor	ax, ax

loc_31AC5:
		or	al, al
		jz	short loc_31AD1
		add	[bp+var_A], 100h

loc_31AD1:
		mov	ax, word ptr [bp+var_E+1]
		mov	[bp+var_2E], ax
		mov	ax, word ptr [bp+var_A+1]
		mov	[bp+var_30], ax
		mov	ax, [bp+var_2E]
		mov	word ptr [bp+var_2C], ax
		mov	ax, [bp+var_30]
		mov	word ptr [bp+var_2C+2], ax
		mov	ax, [si+13h]
		sub	word ptr [bp+var_2C], ax
		add	word ptr [bp+var_2C+2], ax
		mov	eax, [bp+var_2C]
		mov	[si+3Fh], eax
		mov	ax, word ptr [bp+var_2C]
		mov	[bp+var_32], ax
		movsx	eax, [bp+var_32]
		shl	eax, 8
		mov	[bp+var_36], eax
		mov	eax, [bp+var_36]
		mov	[bp+var_3E], eax
		mov	ax, word ptr [bp+var_2C+2]
		mov	[bp+var_40], ax
		movsx	eax, [bp+var_40]
		shl	eax, 8
		mov	[bp+var_44], eax
		mov	eax, [bp+var_44]
		mov	[bp+var_3A], eax
		mov	eax, [bp+var_3E]
		mov	[si+57h], eax
		mov	eax, [bp+var_3A]
		mov	[si+5Bh], eax
		mov	di, si
		add	di, 57h
		mov	eax, [di]
		mov	[si+5Fh], eax
		mov	eax, [di+4]
		mov	[si+63h], eax
		mov	ax, [bp+var_6]
		mov	[bp+var_46], ax
		movsx	eax, [bp+var_46]
		shl	eax, 8
		add	[si+5Fh], eax
		mov	ax, [bp+var_6]
		mov	[bp+var_48], ax
		movsx	eax, [bp+var_48]
		shl	eax, 8
		sub	[si+63h], eax
		mov	di, si
		add	di, 57h
		mov	eax, [si+9]
		mov	[bp+var_4C], eax
		shl	eax, 8
		mov	[bp+var_50], eax
		mov	eax, [di]
		mov	edx, [bp+var_50]
		imul	edx
		shrd	eax, edx, 8
		mov	[di], eax
		mov	eax, [di+4]
		mov	edx, [bp+var_50]
		imul	edx
		shrd	eax, edx, 8
		mov	[di+4], eax
		mov	ax, di
		add	ax, 4
		mov	eax, [di]
		mov	[bp+var_58], eax
		add	di, 4
		mov	eax, [di]
		mov	[bp+var_54], eax
		mov	di, si
		add	di, 5Fh
		mov	eax, [si+9]
		mov	[bp+var_5C], eax
		shl	eax, 8
		mov	[bp+var_60], eax
		mov	eax, [di]
		mov	edx, [bp+var_60]
		imul	edx
		shrd	eax, edx, 8
		mov	[di], eax
		mov	eax, [di+4]
		mov	edx, [bp+var_60]
		imul	edx
		shrd	eax, edx, 8
		mov	[di+4], eax
		mov	ax, di
		add	ax, 4
		mov	eax, [di]
		mov	[bp+var_68], eax
		add	di, 4
		mov	eax, [di]
		mov	[bp+var_64], eax
		mov	bx, [si+45h]
		mov	bx, [bx+88h]
		sar	bx, 1
		add	word ptr [bp+var_2C], bx
		mov	ax, bx
		sub	ax, word ptr [bp+var_2C+2]
		mov	word ptr [bp+var_2C+2], ax
		mov	ax, word_7977C
		mov	[bp+var_78], ax
		mov	ax, [si+53h]
		cmp	ax, word ptr [bp+var_2C]
		jnz	short loc_31C4F
		mov	ax, [si+55h]
		cmp	ax, word ptr [bp+var_2C+2]
		jnz	short loc_31C4F
		cmp	[bp+arg_4], 0
		jnz	short loc_31C4F
		jmp	loc_31DD9

loc_31C4F:
		mov	eax, [bp+var_2C]
		mov	[bp+var_6C], eax
		mov	ax, [bp+var_6]
		mov	[bp+var_7A], ax
		mov	[bp+var_7C], ax
		mov	word ptr [bp+var_70], ax
		mov	word ptr [bp+var_70+2], ax
		mov	ax, word ptr [bp+var_2C]
		add	word ptr [bp+var_70], ax
		mov	ax, word ptr [bp+var_2C+2]
		add	word ptr [bp+var_70+2], ax
		mov	bx, [si+49h]
		mov	ax, word ptr [bp+var_6C]
		cwd
		idiv	bx
		mov	word ptr [bp+var_6C], ax
		mov	ax, word ptr [bp+var_6C+2]
		cwd
		idiv	bx
		mov	word ptr [bp+var_6C+2], ax
		mov	bx, [si+49h]
		mov	ax, word ptr [bp+var_70]
		cwd
		idiv	bx
		mov	word ptr [bp+var_70], ax
		mov	ax, word ptr [bp+var_70+2]
		cwd
		idiv	bx
		mov	word ptr [bp+var_70+2], ax
		mov	ax, word ptr [bp+var_6C+2]
		mov	[bp+var_74], ax
		jmp	loc_31DA4

loc_31CA5:
		mov	ax, word ptr [bp+var_6C]
		mov	[bp+var_72], ax
		jmp	loc_31D96

loc_31CAE:
		cmp	[bp+var_72], 0
		jge	short loc_31CB8
		xor	di, di
		jmp	short loc_31CC9

loc_31CB8:
		mov	ax, [si+47h]
		cmp	ax, [bp+var_72]
		jg	short loc_31CC6
		mov	di, [si+47h]
		dec	di
		jmp	short loc_31CC9

loc_31CC6:
		mov	di, [bp+var_72]

loc_31CC9:
		cmp	[bp+var_74], 0
		jge	short loc_31CD6
		mov	[bp+var_76], 0
		jmp	short loc_31CE7

loc_31CD6:
		mov	ax, [si+47h]
		cmp	ax, [bp+var_74]
		jg	short loc_31CE1
		dec	ax
		jmp	short loc_31CE4

loc_31CE1:
		mov	ax, [bp+var_74]

loc_31CE4:
		mov	[bp+var_76], ax

loc_31CE7:
		mov	bx, [si+45h]
		mov	ax, [bx+5]
		mov	dx, [bx+3]
		mov	[bp+var_2], ax
		mov	[bp+var_4], dx
		mov	ax, [bp+var_76]
		imul	word ptr [si+47h]
		add	ax, di
		shl	ax, 1
		add	[bp+var_4], ax
		les	bx, [bp+var_4]
		cmp	word ptr es:[bx], 0
		jz	short loc_31D1A
		mov	ax, [bp+var_78]
		mov	[bp+var_7E], ax
		mov	bx, es:[bx]
		mov	[bx+2], ax
		jmp	short loc_31D93

loc_31D1A:
		mov	ax, [si+45h]
		add	ax, 0Bh
		mov	[bp+var_80], ax
		mov	ax, [bp+var_76]
		imul	word ptr [si+47h]
		add	ax, di
		mov	[bp+var_82], ax
		mov	ax, [bp+var_78]
		mov	[bp+var_84], ax
		push	14h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_31D7C
		mov	word ptr [di], 145Ch
		mov	word ptr [di], 148Eh
		mov	dword ptr [di+4], 0
		mov	byte ptr [di+8], 2
		mov	byte ptr [di+9], 0
		mov	dword ptr [di+0Ah], 0
		push	[bp+var_84]
		push	[bp+var_82]
		push	[bp+var_80]
		push	ax
		call	sub_73F90
		add	sp, 8
		mov	ax, di
		jmp	short loc_31D7E

loc_31D7C:
		mov	ax, di

loc_31D7E:
		les	bx, [bp+var_4]
		mov	es:[bx], ax
		push	[bp+var_2]
		push	bx
		push	658Ch
		call	sub_321AD
		add	sp, 6

loc_31D93:
		inc	[bp+var_72]

loc_31D96:
		mov	ax, [bp+var_72]
		cmp	ax, word ptr [bp+var_70]
		jg	short loc_31DA1
		jmp	loc_31CAE

loc_31DA1:
		inc	[bp+var_74]

loc_31DA4:
		mov	ax, [bp+var_74]
		cmp	ax, word ptr [bp+var_70+2]
		jg	short loc_31DAF
		jmp	loc_31CA5

loc_31DAF:
		mov	eax, [bp+var_6C]
		mov	[si+4Bh], eax
		mov	eax, [bp+var_70]
		mov	[si+4Fh], eax
		lea	ax, word ptr [bp+var_2C]
		push	ax
		push	si
		push	word ptr [si+45h]
		push	cs
		call	near ptr sub_315F3
		add	sp, 6
		mov	eax, [bp+var_2C]
		mov	[si+53h], eax
		jmp	loc_31E6E

loc_31DD9:
		mov	ax, [si+4Dh]
		mov	[bp+var_74], ax
		jmp	loc_31E63

loc_31DE2:
		mov	ax, [si+4Bh]
		mov	[bp+var_72], ax
		jmp	short loc_31E58

loc_31DEA:
		cmp	[bp+var_72], 0
		jge	short loc_31DF4
		xor	di, di
		jmp	short loc_31E05

loc_31DF4:
		mov	ax, [si+47h]
		cmp	ax, [bp+var_72]
		jg	short loc_31E02
		mov	di, [si+47h]
		dec	di
		jmp	short loc_31E05

loc_31E02:
		mov	di, [bp+var_72]

loc_31E05:
		cmp	[bp+var_74], 0
		jge	short loc_31E12
		mov	[bp+var_76], 0
		jmp	short loc_31E23

loc_31E12:
		mov	ax, [si+47h]
		cmp	ax, [bp+var_74]
		jg	short loc_31E1D
		dec	ax
		jmp	short loc_31E20

loc_31E1D:
		mov	ax, [bp+var_74]

loc_31E20:
		mov	[bp+var_76], ax

loc_31E23:
		mov	bx, [si+45h]
		mov	ax, [bx+5]
		mov	dx, [bx+3]
		mov	[bp+var_2], ax
		mov	[bp+var_4], dx
		mov	ax, [bp+var_76]
		imul	word ptr [si+47h]
		add	ax, di
		shl	ax, 1
		add	[bp+var_4], ax
		les	bx, [bp+var_4]
		cmp	word ptr es:[bx], 0
		jz	short loc_31E55
		mov	ax, [bp+var_78]
		mov	[bp+var_86], ax
		mov	bx, es:[bx]
		mov	[bx+2], ax

loc_31E55:
		inc	[bp+var_72]

loc_31E58:
		mov	ax, [si+4Fh]
		cmp	ax, [bp+var_72]
		jge	short loc_31DEA
		inc	[bp+var_74]

loc_31E63:
		mov	ax, [si+51h]
		cmp	ax, [bp+var_74]
		jl	short loc_31E6E
		jmp	loc_31DE2

loc_31E6E:
		pop	di
		pop	si
		leave
		retf
sub_31A0F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Terrain_TileBoundaryTest (sub_32ED1 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants
; et contexte à revérifier ici. — far,65L — compare une position à la limite du terrain
; courant (+0x92 d'un objet référencé +0x45) : test de limite de la tuile de terrain courante
; (déclenche un rechargement si dépassée).
; ==============================================================================================
Terrain_TileBoundaryTest		proc far

var_16		= dword ptr -16h
var_12		= dword ptr -12h
var_E		= word ptr -0Eh
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 16h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	eax, dword_7CC84
		mov	[bp+var_4], eax
		shl	eax, 8
		mov	[bp+var_8], eax
		mov	eax, [bp+var_8]
		mov	[si+1], eax
		mov	bx, [si+45h]
		mov	eax, [bx+92h]
		mov	[bp+var_C], eax
		mov	ax, si
		inc	ax
		mov	[bp+var_E], ax
		mov	eax, [bp+var_C]
		shl	eax, 8
		mov	bx, [bp+var_E]
		cmp	eax, [bx]
		jge	short loc_31EBF
		mov	ax, 1
		jmp	short loc_31EC1

loc_31EBF:
		xor	ax, ax

loc_31EC1:
		or	al, al
		jz	short loc_31EE1
		mov	bx, [si+45h]
		mov	eax, [bx+92h]
		mov	[bp+var_12], eax
		shl	eax, 8
		mov	[bp+var_16], eax
		mov	eax, [bp+var_16]
		mov	[si+1], eax

loc_31EE1:
		mov	eax, [di]
		mov	[si+5], eax
		push	di
		push	si
		call	sub_3362C
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
Terrain_TileBoundaryTest		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Camera_FrustumBoundsTest (sub_32F55 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants
; et contexte à revérifier ici. — far,84L — teste si une position (di) est dans la bounding
; box du champ de vue caméra (+0x57/+0x5B) : test d'inclusion dans le frustum/zone de rendu
; caméra.
; ==============================================================================================
Camera_FrustumBoundsTest		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	eax, [si+57h]
		cmp	eax, [di]
		jge	short loc_31F0F
		mov	ax, 1
		jmp	short loc_31F11

loc_31F0F:
		xor	ax, ax

loc_31F11:
		or	al, al
		jz	short loc_31F57
		mov	eax, [si+5Bh]
		cmp	eax, [di+4]
		jle	short loc_31F24
		mov	ax, 1
		jmp	short loc_31F26

loc_31F24:
		xor	ax, ax

loc_31F26:
		or	al, al
		jz	short loc_31F57
		mov	eax, [si+5Fh]
		cmp	eax, [di]
		jle	short loc_31F38
		mov	ax, 1
		jmp	short loc_31F3A

loc_31F38:
		xor	ax, ax

loc_31F3A:
		or	al, al
		jz	short loc_31F57
		mov	eax, [si+63h]
		cmp	eax, [di+4]
		jge	short loc_31F4D
		mov	ax, 1
		jmp	short loc_31F4F

loc_31F4D:
		xor	ax, ax

loc_31F4F:
		or	al, al
		jz	short loc_31F57
		mov	al, 1
		jmp	short loc_31F59

loc_31F57:
		mov	al, 0

loc_31F59:
		pop	di
		pop	si
		pop	bp
		retf
Camera_FrustumBoundsTest		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Camera_DistanceLimitTest (sub_32FBC de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants
; et contexte à revérifier ici. — far,138L — calcule le delta de position par rapport à une
; origine puis teste la limite (+0x57) : test de distance à la limite de zone de rendu.
; ==============================================================================================
Camera_DistanceLimitTest		proc far

var_28		= dword ptr -28h
var_24		= dword ptr -24h
var_20		= word ptr -20h
var_1E		= dword ptr -1Eh
var_1A		= dword ptr -1Ah
var_16		= word ptr -16h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= word ptr -0Ch
var_A		= dword ptr -0Ah
var_6		= dword ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 28h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	dx, [bp+arg_4]
		mov	[bp+var_2], dx
		mov	eax, [di]
		mov	bx, [bp+var_2]
		sub	eax, [bx]
		mov	[bp+var_6], eax
		mov	[bp+var_A], eax
		mov	eax, [si+57h]
		cmp	eax, [bp+var_A]
		jge	short loc_31F91
		mov	ax, 1
		jmp	short loc_31F93

loc_31F91:
		xor	ax, ax

loc_31F93:
		or	al, al
		jnz	short loc_31F9A
		jmp	loc_3201B

loc_31F9A:
		mov	[bp+var_C], dx
		mov	eax, [di+4]
		mov	bx, [bp+var_C]
		add	eax, [bx]
		mov	[bp+var_10], eax
		mov	[bp+var_14], eax
		mov	eax, [si+5Bh]
		cmp	eax, [bp+var_14]
		jle	short loc_31FBE
		mov	ax, 1
		jmp	short loc_31FC0

loc_31FBE:
		xor	ax, ax

loc_31FC0:
		or	al, al
		jz	short loc_3201B
		mov	[bp+var_16], dx
		mov	eax, [di]
		mov	bx, [bp+var_16]
		add	eax, [bx]
		mov	[bp+var_1A], eax
		mov	[bp+var_1E], eax
		mov	eax, [si+5Fh]
		cmp	eax, [bp+var_1E]
		jle	short loc_31FE7
		mov	ax, 1
		jmp	short loc_31FE9

loc_31FE7:
		xor	ax, ax

loc_31FE9:
		or	al, al
		jz	short loc_3201B
		mov	[bp+var_20], dx
		mov	eax, [di+4]
		mov	bx, [bp+var_20]
		sub	eax, [bx]
		mov	[bp+var_24], eax
		mov	[bp+var_28], eax
		mov	eax, [si+63h]
		cmp	eax, [bp+var_28]
		jge	short loc_32011
		mov	ax, 1
		jmp	short loc_32013

loc_32011:
		xor	ax, ax

loc_32013:
		or	al, al
		jz	short loc_3201B
		mov	al, 1
		jmp	short loc_3201D

loc_3201B:
		mov	al, 0

loc_3201D:
		pop	di
		pop	si
		leave
		retf
Camera_DistanceLimitTest		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_32021		proc far

var_16		= dword ptr -16h
var_12		= dword ptr -12h
var_E		= dword ptr -0Eh
var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah
arg_6		= dword ptr  0Ch
arg_A		= dword ptr  10h
arg_E		= dword ptr  14h
arg_12		= word ptr  18h

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_4]
		lea	ax, word ptr [bp+arg_6]
		push	ax
		push	si
		push	cs
		call	near ptr Camera_FrustumBoundsTest
		add	sp, 4
		or	al, al
		jz	short loc_3206F
		push	[bp+arg_12]
		sub	sp, 0Ch
		mov	eax, [bp+arg_6]
		mov	[bp+var_16], eax
		mov	eax, [bp+arg_A]
		mov	[bp+var_12], eax
		mov	eax, [bp+arg_E]
		mov	[bp+var_E], eax
		push	si
		push	large [bp+arg_0]
		call	sub_32DE5
		add	sp, 14h
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		jmp	short loc_320B5

loc_3206F:
		mov	di, word ptr [bp+arg_0]
		lea	ax, word ptr [bp+arg_6]
		push	ax
		push	word ptr [si+45h]
		push	cs
		call	near ptr Terrain_HeightSample
		push	dx
		push	ax
		pop	eax
		add	sp, 4
		mov	[bp+var_4], eax
		or	di, di
		jz	short loc_32090
		mov	ax, di
		jmp	short loc_3209A

loc_32090:
		push	4
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax

loc_3209A:
		or	ax, ax
		jz	short loc_320AD
		mov	eax, [bp+var_4]
		shl	eax, 8
		mov	[di], eax
		mov	ax, di
		jmp	short loc_320AF

loc_320AD:
		mov	ax, di
sub_32021		endp

; START OF FUNCTION CHUNK FOR sub_32021

loc_320AF:
		db 8Bh
; END OF FUNCTION CHUNK FOR sub_32021
seg080		ends
