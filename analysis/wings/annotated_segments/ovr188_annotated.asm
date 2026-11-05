ovr188		segment	para public 'OVERLAY' use16
		assume cs:ovr188
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_69E10		proc far

var_8		= dword ptr -8
var_4		= dword ptr -4

		push	bp
		mov	bp, sp
		sub	sp, 8
		cmp	byte_5B470, 0
		jnz	short loc_69E3D
		inc	byte_5B470
		mov	dword_5FDD2, 0
		mov	byte_5FDD6, 2
		mov	byte_5FDD7, 0
		mov	dword_5FDD8, 0

loc_69E3D:
		cmp	byte_5FDD7, 0
		jz	short loc_69E62
		cmp	dword_5FDD2, 0
		jz	short loc_69E62
		push	0
		mov	al, byte_5FDD6
		push	ax
		push	60B2h
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_69E62

loc_69E62:
		mov	dword_5FDD2, 0
		mov	byte_5FDD7, 0
		mov	dword_5FDD8, 0
		call	sub_85C5
		push	dx
		push	ax
		pop	eax
		mov	[bp+var_4], eax
		push	1
		push	0
		push	3
		push	eax
		push	67B0h
		call	Memory_TypedFreeWrapper_447E1
		add	sp, 0Ch
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		mov	eax, [bp+var_8]
		mov	dword_5FDD2, eax
		mov	byte_5FDD6, 3
		mov	byte_5FDD7, 1
		mov	dword_5FDD8, 0
		mov	eax, [bp+var_4]
		mov	dword_5FDD8, eax
		cmp	byte_5FDD6, 3
		jnz	short loc_69EE1
		push	0
		mov	al, byte_5FDD6
		push	ax
		push	large dword_5FDD2
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_69EE9

loc_69EE1:
		mov	edx, dword_5FDD4
		mov	ax, word ptr dword_5FDD2

loc_69EE9:
		push	dx
		push	ax
		call	sub_85ED
		add	sp, 4
		mov	al, byte_5FDD6
		push	ax
		push	large dword_5FDD2
		call	sub_42A76
		push	dx
		push	ax
		pop	eax
		add	sp, 6
		mov	dx, ds
		movzx	edx, dx
		shl	edx, 4
		add	eax, edx
		mov	dword_5B464, eax
		push	25h
		call	sub_859F
		pop	cx
		movzx	eax, ax
		mov	dword_5B468, eax
		push	20h
		call	sub_859F
		pop	cx
		movzx	eax, ax
		mov	dword_5B46C, eax
		leave
		retf
sub_69E10		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_69F3D		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_6]
		or	si, si
		jnz	short loc_69F5B
		push	107h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_69FC3

loc_69F5B:
		mov	ax, si
		add	ax, 6
		push	ax
		call	StreamReader_ConstructVariantA_52440
		pop	cx
		mov	ax, [bp+arg_2]
		mov	[si], ax
		mov	ax, [bp+arg_4]
		mov	[si+2], ax
		mov	word ptr [si+4], 1
		cmp	word ptr [si], 2
		jle	short loc_69F93
		mov	bx, [si+2]
		mov	bx, [bx+2]
		cmp	dword ptr [bx], 69677546h
		jnz	short loc_69F93
		mov	bx, [si+2]
		mov	di, [bx+4]
		jmp	short loc_69F96

loc_69F93:
		mov	di, 16E8h

loc_69F96:
		or	di, di
		jz	short loc_69FBA
		push	ds
		push	di
		call	Config_LoadOrCreate
		add	sp, 4
		or	al, al
		jz	short loc_69FBA
		push	1
		push	di
		mov	ax, si
		add	ax, 6
		push	ax
		mov	bx, [si+6]
		call	dword ptr [bx+14h]
		add	sp, 6

loc_69FBA:
		mov	dword ptr [si+103h], 0

loc_69FC3:
		mov	ax, si
		pop	di
		pop	si
		pop	bp
		retf
sub_69F3D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à TextObj_CommandInterp
; (sub_998FD de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à
; revérifier ici. — Reprise de STRIKE.EXE : code identique instruction par instruction à
; TextObj_CommandInterp (sub_27355 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et
; contexte à revérifier ici. — far,192L — boucle d'interprétation d'un flux de commandes
; (table de pointeurs à +2, cache à +4/+0), lit la commande suivante via sub_63DB5/sub_64062 :
; interpréteur de flux de commandes de rendu (moteur SM-FONT, contrôle de mise en forme du
; texte).
; ==============================================================================================
TextObj_CommandInterp		proc far

var_A		= word ptr -0Ah
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		push	si
		push	di
		mov	si, [bp+arg_0]
		xor	di, di
		mov	ax, [si+4]
		cmp	ax, [si]
		jge	short loc_69FEF
		mov	ax, [si+4]
		inc	word ptr [si+4]
		shl	ax, 1
		mov	bx, [si+2]
		add	bx, ax
		mov	di, [bx]
		jmp	loc_6A0E5

loc_69FEF:
		mov	ax, si
		add	ax, 6
		push	ax
		call	StreamReader_ValidateState_5280D
		pop	cx
		or	al, al
		jnz	short loc_6A002
		jmp	loc_6A0E5

loc_6A002:
		mov	ax, si
		add	ax, 6
		push	ax
		call	StreamReader_GetCapacity_52ABA
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_4], eax
		mov	eax, [si+103h]
		cmp	eax, [bp+var_4]
		jl	short loc_6A024
		jmp	loc_6A0E5

loc_6A024:
		push	eax
		push	large 0A0h
		push	ds
		mov	ax, si
		add	ax, 63h
		push	ax
		mov	ax, si
		add	ax, 6
		push	ax
		call	StreamReader_ReadTyped_529F9
		push	dx
		push	ax
		pop	eax
		add	sp, 0Eh
		mov	[bp+var_8], eax
		mov	di, si
		add	di, 63h
		xor	cx, cx
		mov	[bp+var_A], 0
		xor	dx, dx

loc_6A057:
		mov	bx, si
		add	bx, dx
		mov	al, [bx+63h]
		cbw
		mov	bx, ax
		or	bx, bx
		jz	short loc_6A06A
		cmp	bx, 1Bh
		jnz	short loc_6A086

loc_6A06A:
		mov	bx, si
		add	bx, dx
		mov	byte ptr [bx+63h], 0
		or	dx, dx
		jnz	short loc_6A078
		xor	di, di

loc_6A078:
		mov	eax, [bp+var_4]
		mov	[si+103h], eax

loc_6A081:
		mov	cx, 1
		jmp	short loc_6A0CB

loc_6A086:
		cmp	bx, 0Dh
		jz	short loc_6A090
		cmp	bx, 0Ah
		jnz	short loc_6A0A5

loc_6A090:
		cmp	byte ptr [di], 0
		jz	short loc_6A09A
		mov	[bp+var_A], 1

loc_6A09A:
		mov	bx, si
		add	bx, dx
		mov	byte ptr [bx+63h], 0
		inc	dx
		jmp	short loc_6A0CB

loc_6A0A5:
		cmp	[bp+var_A], 0
		jnz	short loc_6A081
		or	di, di
		jnz	short loc_6A0B6
		mov	di, si
		add	di, dx
		add	di, 63h

loc_6A0B6:
		inc	dx
		mov	ax, dx
		movsx	eax, ax
		cmp	eax, [bp+var_8]
		jnz	short loc_6A0CB
		mov	bx, si
		add	bx, dx
		mov	byte ptr [bx+63h], 0

loc_6A0CB:
		or	cx, cx
		jnz	short loc_6A0DC
		movsx	eax, dx
		cmp	eax, [bp+var_8]
		jge	short loc_6A0DC
		jmp	loc_6A057

loc_6A0DC:
		movsx	eax, dx
		add	[si+103h], eax

loc_6A0E5:
		mov	ax, di
		pop	di
		pop	si
		leave
		retf
TextObj_CommandInterp		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6A0EB		proc far

var_142		= word ptr -142h
var_13C		= word ptr -13Ch
var_3A		= word ptr -3Ah
var_38		= word ptr -38h
var_36		= dword ptr -36h
var_32		= byte ptr -32h
var_31		= byte ptr -31h
var_30		= dword ptr -30h
var_2C		= dword ptr -2Ch
var_28		= word ptr -28h
var_26		= word ptr -26h
var_24		= word ptr -24h
var_22		= word ptr -22h
var_20		= word ptr -20h
var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_1A		= word ptr -1Ah
var_18		= word ptr -18h
var_16		= word ptr -16h
var_13		= byte ptr -13h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_B		= byte ptr -0Bh
var_A		= word ptr -0Ah
var_7		= byte ptr -7
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 142h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	al, byte_5B3D8
		mov	ah, 0
		or	ax, ax
		jz	short loc_6A103
		jmp	loc_6AA9E

loc_6A103:
		mov	byte ptr [si+2Fh], 1
		mov	byte ptr [si+27h], 3
		mov	byte ptr [bp+var_6], 3
		lea	ax, [bp+var_6]
		push	ax
		call	sub_59A70
		pop	cx
		cmp	byte ptr [bp+var_6], 13h
		jz	short loc_6A12F
		mov	byte ptr [bp+var_6], 13h
		lea	ax, [bp+var_6]
		push	ax
		call	sub_59A75
		pop	cx
		jmp	short loc_6A13B

loc_6A12F:
		cmp	word_5B406, 0
		jnz	short loc_6A13B
		call	sub_47D3C

loc_6A13B:
		cmp	word_5B406, 0
		jnz	short loc_6A14A
		push	0
		call	sub_469E1
		pop	cx

loc_6A14A:
		mov	[bp+var_7], 0
		mov	[bp+var_A], 0FFFFh
		mov	[bp+var_B], 0
		mov	[bp+var_E], 220h
		mov	[bp+var_10], 7
		mov	[bp+var_12], 1
		mov	[bp+var_13], 0
		push	1752h
		push	[bp+arg_4]
		push	[bp+arg_2]
		lea	ax, [bp+var_142]
		push	ax
		push	cs
		call	near ptr sub_69F3D
		add	sp, 8

loc_6A17F:
		mov	[bp+var_16], 3
		jmp	loc_6A400

loc_6A187:
		mov	al, [di]
		cbw
		push	ax
		call	CRT_CtypeLookup
		pop	cx
		cmp	ax, 2Bh
		jnz	short loc_6A199
		jmp	loc_6A341

loc_6A199:
		cmp	ax, 2Dh
		jz	short loc_6A1A9
		cmp	ax, 3Dh
		jnz	short loc_6A1A6
		jmp	loc_6A391

loc_6A1A6:
		jmp	loc_6A400

loc_6A1A9:
		mov	al, [di+1]
		cbw
		push	ax
		call	CRT_CtypeLookup
		pop	cx
		sub	ax, 31h
		mov	bx, ax
		cmp	bx, 26h
		jbe	short loc_6A1C1
		jmp	loc_6A400

loc_6A1C1:
		shl	bx, 1
		jmp	cs:off_6AAC6[bx]	; switch jump

loc_6A1C8:
		mov	[bp+var_16], 1
		jmp	loc_6A400

loc_6A1D0:
		mov	[bp+var_16], 2
		jmp	loc_6A400

loc_6A1D8:
		jmp	short loc_6A17F

loc_6A1DA:
		mov	byte_5CFA5, 1
		jmp	loc_6A400

loc_6A1E2:
		mov	al, [di+2]
		cbw
		push	ax
		call	CRT_CtypeLookup
		pop	cx
		cmp	ax, 41h
		jz	short loc_6A1F4
		jmp	short loc_6A20A

loc_6A1F4:
		mov	[bp+var_13], 1
		mov	al, [bp+var_7]
		cbw
		or	ax, ax
		jz	short loc_6A203
		jmp	loc_6A400

loc_6A203:
		mov	[bp+var_7], 41h
		jmp	loc_6A400

loc_6A20A:
		mov	al, [di+2]
		cbw
		push	ax
		call	CRT_CtypeLookup
		pop	cx
		mov	[bp+var_7], al
		cmp	byte ptr [di+3], 0
		jnz	short loc_6A221
		jmp	loc_6A400

loc_6A221:
		push	10h
		lea	ax, [bp+var_3A]
		push	ax
		mov	ax, di
		add	ax, 3
		push	ax
		call	sub_2E60
		add	sp, 6
		mov	[bp+var_A], ax
		jmp	loc_6A400

loc_6A23B:
		mov	al, [di+2]
		cbw
		push	ax
		call	CRT_CtypeLookup
		pop	cx
		mov	[bp+var_B], al
		cmp	byte ptr [di+3], 0
		jnz	short loc_6A252
		jmp	loc_6A400

loc_6A252:
		mov	al, [di+3]
		cbw
		add	ax, 0FFD0h
		mov	[bp+var_3A], ax
		shl	ax, 4
		add	ax, 200h
		mov	[bp+var_E], ax
		cmp	byte ptr [di+4], 0
		jnz	short loc_6A26E
		jmp	loc_6A400

loc_6A26E:
		mov	al, [di+4]
		cbw
		add	ax, 0FFD0h
		mov	[bp+var_10], ax
		cmp	[bp+var_10], 0
		jz	short loc_6A28A
		cmp	byte ptr [di+4], 61h
		jz	short loc_6A28A
		cmp	byte ptr [di+4], 41h
		jnz	short loc_6A28F

loc_6A28A:
		mov	[bp+var_10], 0Ah

loc_6A28F:
		cmp	byte ptr [di+5], 0
		jnz	short loc_6A298
		jmp	loc_6A400

loc_6A298:
		mov	al, [di+5]
		cbw
		add	ax, 0FFD0h
		mov	[bp+var_12], ax
		cmp	byte ptr [di+6], 0
		jnz	short loc_6A2AB
		jmp	loc_6A400

loc_6A2AB:
		jmp	loc_6A400

loc_6A2AE:
		mov	byte_5B3D9, 0
		jmp	loc_6A400

loc_6A2B6:
		mov	byte_5B3DA, 0
		jmp	loc_6A400

loc_6A2BE:
		mov	byte ptr [si+2Fh], 0
		jmp	loc_6A400

loc_6A2C5:
		or	byte_60550, 2
		jmp	loc_6A386

loc_6A2CD:
		mov	byte_5DD6A, 0
		jmp	loc_6A400

loc_6A2D5:
		mov	al, [di+2]
		cbw
		push	ax
		call	CRT_CtypeLookup
		pop	cx
		cmp	ax, 56h
		jz	short loc_6A2E8
		jmp	loc_6A400

loc_6A2E8:
		mov	al, [di+3]
		cbw
		add	ax, 0FFD0h
		mov	dx, ax
		cmp	dx, 1
		jnz	short loc_6A2FA
		xor	dx, dx
		jmp	short loc_6A2FD

loc_6A2FA:
		mov	dx, 1

loc_6A2FD:
		push	4B00h
		push	dx
		push	52AAh
		call	sub_50C4
		add	sp, 6
		or	ax, ax
		jz	short loc_6A327
		push	1E8h
		call	sub_4FFA
		pop	cx
		mov	byte_5CFCC, 1
		push	52AAh
		call	sub_5118
		pop	cx

loc_6A327:
		cmp	byte ptr [di+4], 50h
		jz	short loc_6A330
		jmp	loc_6A400

loc_6A330:
		mov	word_59F2A, 1
		jmp	loc_6A400

loc_6A339:
		mov	byte_5B471, 1
		jmp	loc_6A400

loc_6A341:
		mov	al, [di+1]
		cbw
		push	ax
		call	CRT_CtypeLookup
		pop	cx
		mov	[bp+var_2], ax
		mov	cx, 4
		mov	bx, offset word_6AAB6

loc_6A355:
		mov	ax, cs:[bx]
		cmp	ax, [bp+var_2]
		jz	short loc_6A365
		add	bx, 2
		loop	short loc_6A355
		jmp	loc_6A400

loc_6A365:
		jmp	word ptr cs:[bx+8] ; switch jump

loc_6A369:
		mov	byte_5B3D9, 1
		jmp	loc_6A400

loc_6A371:
		mov	byte_5B3DA, 1
		jmp	loc_6A400

loc_6A379:
		mov	byte_5DD6A, 1
		jmp	loc_6A400

loc_6A381:
		and	byte_60550, 0FDh

loc_6A386:
		push	67CCh
		call	sub_47F8C
		pop	cx
		jmp	short loc_6A400

loc_6A391:
		mov	ax, di
		inc	ax
		mov	[bp+var_3A], ax
		push	ds
		push	ax
		call	Config_LoadOrCreate
		add	sp, 4
		or	al, al
		jz	short loc_6A400
		push	0B3h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_6A3DB
		push	ax
		call	StreamReader_ConstructVariantA_52440
		pop	cx
		mov	word ptr [di], 179Fh
		mov	dword ptr [di+61h], 0
		mov	dword ptr [di+65h], 0
		mov	dword ptr [di+5Dh], 0
		mov	ax, di
		jmp	short loc_6A3DD

loc_6A3DB:
		mov	ax, di

loc_6A3DD:
		mov	di, ax
		push	[bp+var_3A]
		push	ax
		call	sub_4BB2
		add	sp, 4
		or	al, al
		jnz	short loc_6A400
		or	di, di
		jz	short loc_6A400
		push	3
		push	di
		mov	bx, [di]
		call	dword ptr [bx+4]
		add	sp, 4
		jmp	short loc_6A400

loc_6A400:
		lea	ax, [bp+var_142]
		push	ax
		push	cs
		call	near ptr TextObj_CommandInterp
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_6A413
		jmp	loc_6A187

loc_6A413:
		cmp	word_5B406, 0
		jz	short loc_6A41D
		jmp	loc_6A515

loc_6A41D:
		mov	word_5F553, 0
		mov	word_5F555, 0FFFFh
		mov	byte_5F552, 0FFh
		mov	ax, word_5DD44
		mov	word_5F542, ax
		mov	byte_5F552, 0
		mov	word_5F557, 0
		cmp	[bp+var_16], 1
		jnz	short loc_6A44D
		mov	byte_5F552, 0
		jmp	loc_6A515

loc_6A44D:
		cmp	[bp+var_16], 2
		jnz	short loc_6A4AD
		cmp	byte_5F552, 0
		jz	short loc_6A465
		push	0EEE0h
		call	sub_9D47
		pop	cx
		jmp	short loc_6A465

loc_6A465:
		mov	byte_5F552, 1
		mov	bx, word_5F542
		mov	ax, [bx+4]
		mov	[bp+var_18], ax
		mov	ax, [bx+6]
		mov	[bp+var_1A], ax
		mov	ax, [bx+8]
		mov	[bp+var_1C], ax
		mov	ax, [bx+0Ah]
		mov	[bp+var_1E], ax
		mov	ax, [bp+var_18]
		mov	word_5F548, ax
		mov	ax, [bp+var_1A]
		mov	word_5F54A, ax
		mov	ax, [bp+var_1C]
		mov	word_5F54C, ax
		mov	ax, [bp+var_1E]
		mov	word_5F54E, ax
		push	0
		push	5824h
		call	TextRenderer_ApplyFormatChange_478F4
		add	sp, 4
		jmp	short loc_6A515

loc_6A4AD:
		cmp	[bp+var_16], 3
		jnz	short loc_6A515
		cmp	byte_5F552, 0
		jz	short loc_6A4C5
		push	0EEE0h
		call	sub_9D47
		pop	cx
		jmp	short loc_6A4C5

loc_6A4C5:
		mov	byte_5F552, 2
		push	5822h
		call	sub_58C6
		pop	cx
		cmp	byte_5F552, 2
		jnz	short loc_6A515
		push	5822h
		call	sub_5830
		pop	cx
		mov	[bp+var_20], ax
		push	1
		push	5822h
		call	sub_595C
		add	sp, 4
		push	large 20000h
		push	5822h
		call	sub_5856
		add	sp, 6
		cmp	[bp+var_20], 0
		jnz	short loc_6A515
		push	5822h
		call	sub_5844
		pop	cx
		jmp	short loc_6A515

loc_6A515:
		cmp	word_5B406, 0
		jz	short loc_6A524
		push	0
		push	word_5B406
		jmp	short loc_6A535

loc_6A524:
		cmp	byte_5B3D9, 0
		jz	short loc_6A540
		push	large 0
		call	PagedMemory_ReadTextResource_875F
		pop	cx
		push	ax

loc_6A535:
		push	67B0h
		call	Memory_TypedFreeVariant_44733
		add	sp, 6

loc_6A540:
		mov	ax, si
		add	ax, 5
		push	ax
		call	sub_58BC9
		pop	cx
		push	67B0h
		call	sub_59960
		pop	cx
		call	sub_440E0
		push	dx
		push	ax
		pop	eax
		push	eax
		call	sub_536ED
		push	dx
		push	ax
		pop	eax
		pop	edx
		add	edx, eax
		mov	dword_60352, edx
		push	14h
		call	sub_5351A
		pop	cx
		push	large 7A120h
		call	sub_536D5
		add	sp, 4
		mov	al, [bp+var_7]
		cbw
		mov	[bp+var_4], ax
		mov	cx, 4
		mov	bx, offset word_6AAA6

loc_6A596:
		mov	ax, cs:[bx]
		cmp	ax, [bp+var_4]
		jz	short loc_6A5A6
		add	bx, 2
		loop	short loc_6A596
		jmp	loc_6A811

loc_6A5A6:
		jmp	word ptr cs:[bx+8] ; switch jump

loc_6A5AA:
		mov	byte_5CF9C, 3
		push	7Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_6A639
		mov	word ptr [di], 96Dh
		mov	ax, word_5DD68
		mov	[di+2], ax
		mov	word_5DD68, di
		mov	word ptr [di], 1797h
		mov	word ptr [di+8], 96Dh
		mov	ax, word_5DD68
		mov	[di+0Ah], ax
		mov	ax, di
		add	ax, 8
		mov	word_5DD68, ax
		mov	word ptr [di+8], 975h
		mov	dword ptr [di+0Ch], 0
		mov	byte ptr [di+10h], 0
		mov	word ptr [di+12h], 96Dh
		mov	[di+14h], ax
		mov	ax, di
		add	ax, 12h
		mov	word_5DD68, ax
		mov	word ptr [di+12h], 975h
		mov	dword ptr [di+16h], 0
		mov	byte ptr [di+1Ah], 0
		mov	ax, di
		add	ax, 1Ch
		push	ax
		call	StreamReader_ConstructVariantA_52440
		pop	cx
		push	large 0
		push	large 0FFFFFFFFh
		push	large 0FFFFFFFFh
		push	1759h
		push	di
		call	sub_19DD9
		add	sp, 10h
		mov	ax, di
		jmp	short loc_6A63B

loc_6A639:
		mov	ax, di

loc_6A63B:
		mov	word_5CF9D, ax
		mov	word_5CFA1, ax
		jmp	loc_6A811

loc_6A644:
		mov	byte_5CF9C, 2
		mov	ax, [bp+var_A]
		mov	[bp+var_22], ax
		push	7Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_6A660
		jmp	loc_6A80C

loc_6A660:
		mov	word ptr [di], 96Dh
		mov	ax, word_5DD68
		mov	[di+2], ax
		mov	word_5DD68, di
		mov	word ptr [di], 1797h
		mov	word ptr [di+8], 96Dh
		mov	ax, word_5DD68
		mov	[di+0Ah], ax
		mov	ax, di
		add	ax, 8
		mov	word_5DD68, ax
		mov	word ptr [di+8], 975h
		mov	dword ptr [di+0Ch], 0
		mov	byte ptr [di+10h], 0
		mov	word ptr [di+12h], 96Dh
		mov	[di+14h], ax
		mov	ax, di
		add	ax, 12h
		mov	word_5DD68, ax
		mov	word ptr [di+12h], 975h
		mov	dword ptr [di+16h], 0
		mov	byte ptr [di+1Ah], 0
		mov	ax, di
		add	ax, 1Ch
		push	ax
		call	StreamReader_ConstructVariantA_52440
		pop	cx
		push	large 0
		push	large 0FFFFFFFFh
		push	0FFFFh
		push	[bp+var_22]
		push	175Fh

loc_6A6D1:
		push	di
		call	sub_19DD9
		add	sp, 10h
		mov	ax, di
		jmp	loc_6A80E
		jmp	loc_6A80C

loc_6A6E2:
		mov	byte_5CF9C, 4
		mov	ax, [bp+var_A]
		mov	[bp+var_24], ax
		mov	ax, [bp+var_E]
		mov	[bp+var_26], ax
		push	7Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_6A704
		jmp	loc_6A80C

loc_6A704:
		mov	word ptr [di], 96Dh
		mov	ax, word_5DD68
		mov	[di+2], ax
		mov	word_5DD68, di
		mov	word ptr [di], 1797h
		mov	word ptr [di+8], 96Dh
		mov	ax, word_5DD68
		mov	[di+0Ah], ax
		mov	ax, di
		add	ax, 8
		mov	word_5DD68, ax
		mov	word ptr [di+8], 975h
		mov	dword ptr [di+0Ch], 0
		mov	byte ptr [di+10h], 0
		mov	word ptr [di+12h], 96Dh
		mov	[di+14h], ax
		mov	ax, di
		add	ax, 12h
		mov	word_5DD68, ax
		mov	word ptr [di+12h], 975h
		mov	dword ptr [di+16h], 0
		mov	byte ptr [di+1Ah], 0
		mov	ax, di
		add	ax, 1Ch
		push	ax
		call	StreamReader_ConstructVariantA_52440
		pop	cx
		push	[bp+var_26]
		push	large 0FFFFh
		push	large 0FFFFFFFFh
		push	[bp+var_24]
		push	1764h
		jmp	loc_6A6D1
		jmp	loc_6A80C

loc_6A77F:
		mov	byte_5CF9C, 5
		mov	ax, [bp+var_A]
		mov	[bp+var_28], ax
		push	7Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_6A80C
		mov	word ptr [di], 96Dh
		mov	ax, word_5DD68
		mov	[di+2], ax
		mov	word_5DD68, di
		mov	word ptr [di], 1797h
		mov	word ptr [di+8], 96Dh
		mov	ax, word_5DD68
		mov	[di+0Ah], ax
		mov	ax, di
		add	ax, 8
		mov	word_5DD68, ax
		mov	word ptr [di+8], 975h
		mov	dword ptr [di+0Ch], 0
		mov	byte ptr [di+10h], 0
		mov	word ptr [di+12h], 96Dh
		mov	[di+14h], ax
		mov	ax, di
		add	ax, 12h
		mov	word_5DD68, ax
		mov	word ptr [di+12h], 975h
		mov	dword ptr [di+16h], 0
		mov	byte ptr [di+1Ah], 0
		mov	ax, di
		add	ax, 1Ch
		push	ax
		call	StreamReader_ConstructVariantA_52440
		pop	cx
		push	large 0
		push	large 0FFFFFFFFh
		push	0FFFFh
		push	[bp+var_28]
		push	1769h
		jmp	loc_6A6D1

loc_6A80C:
		mov	ax, di

loc_6A80E:
		mov	word_5CF9D, ax

loc_6A811:
		cmp	word_5CF9D, 0
		jz	short loc_6A81F
		mov	byte_603B1, 1
		jmp	short loc_6A824

loc_6A81F:
		mov	byte_603B1, 0

loc_6A824:
		cmp	[bp+var_B], 0
		jz	short loc_6A831
		mov	byte_603B2, 1
		jmp	short loc_6A836

loc_6A831:
		mov	byte_603B2, 0

loc_6A836:
		cmp	byte_603B2, 0
		jz	short loc_6A88D
		push	large 10019h
		push	0
		call	sub_40CF3
		add	sp, 6
		mov	word_5CF9F, ax
		push	[bp+var_12]
		push	[bp+var_E]
		push	[bp+var_10]
		push	ax
		call	sub_40F73
		add	sp, 8
		mov	ah, 0
		or	ax, ax
		jnz	short loc_6A88D
		mov	byte_603B2, 0
		cmp	word_5CF9F, 0
		jz	short loc_6A887
		push	3
		push	word_5CF9F
		mov	bx, word_5CF9F
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_6A887

loc_6A887:
		mov	word_5CF9F, 0

loc_6A88D:
		cmp	word_5CFA1, 0
		jz	short loc_6A897
		jmp	loc_6A92F

loc_6A897:
		cmp	[bp+var_13], 0
		jnz	short loc_6A8A0
		jmp	loc_6A92F

loc_6A8A0:
		push	7Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_6A92A
		mov	word ptr [di], 96Dh
		mov	ax, word_5DD68
		mov	[di+2], ax
		mov	word_5DD68, di
		mov	word ptr [di], 1797h
		mov	word ptr [di+8], 96Dh
		mov	ax, word_5DD68
		mov	[di+0Ah], ax
		mov	ax, di
		add	ax, 8
		mov	word_5DD68, ax
		mov	word ptr [di+8], 975h
		mov	dword ptr [di+0Ch], 0
		mov	byte ptr [di+10h], 0
		mov	word ptr [di+12h], 96Dh
		mov	[di+14h], ax
		mov	ax, di
		add	ax, 12h
		mov	word_5DD68, ax
		mov	word ptr [di+12h], 975h
		mov	dword ptr [di+16h], 0
		mov	byte ptr [di+1Ah], 0
		mov	ax, di
		add	ax, 1Ch
		push	ax
		call	StreamReader_ConstructVariantA_52440
		pop	cx
		push	large 0
		push	large 0FFFFFFFFh
		push	large 0FFFFFFFFh
		push	176Fh
		push	di
		call	sub_19DD9
		add	sp, 10h
		mov	ax, di
		jmp	short loc_6A92C

loc_6A92A:
		mov	ax, di

loc_6A92C:
		mov	word_5CFA1, ax

loc_6A92F:
		cmp	[bp+arg_6], 0
		jnz	short loc_6A938
		jmp	loc_6A9EF

loc_6A938:
		push	2
		push	[bp+arg_6]
		call	TextRenderer_LoadResourceFile_54D15
		add	sp, 4
		mov	word ptr [bp+var_2C+2], dx
		mov	word ptr [bp+var_2C], ax
		mov	eax, [bp+var_2C]
		mov	[bp+var_36], eax
		mov	[bp+var_32], 2
		mov	[bp+var_31], 1
		mov	[bp+var_30], 0
		lea	ax, word ptr [bp+var_36]
		push	ax
		push	0
		call	GlyphObject_ConstructWithBuffer_48911
		add	sp, 4
		mov	word_5B3E1, ax
		cmp	[bp+var_31], 0
		jz	short loc_6A998
		cmp	[bp+var_36], 0
		jz	short loc_6A998
		push	0
		mov	al, [bp+var_32]
		push	ax
		lea	ax, word ptr [bp+var_36]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_6A998

loc_6A998:
		mov	[bp+var_36], 0
		mov	[bp+var_31], 0
		mov	[bp+var_30], 0
		mov	bx, word_5B3E1
		mov	word ptr [bx+10h], 1
		mov	word ptr [bx+12h], 0
		push	2Dh
		push	bx
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 4
		mov	bx, word_5B3E1
		mov	[bx+14h], ax
		push	bx
		push	word_5DD44
		push	0
		call	Widget_ApplyStyleAndAllocate_48C4D
		add	sp, 6
		mov	word_5B3E3, ax
		push	0Fh
		push	ax
		call	Widget_Method_Dispatch8_48CAB
		add	sp, 4
		mov	ax, word_5B3E3
		mov	word_5BF74, ax

loc_6A9EF:
		cmp	byte_603B1, 0
		jz	short loc_6AA58
		mov	ax, word_5CF9D
		mov	[bp+var_38], ax
		push	6
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_6AA53
		mov	word ptr [di], 96Dh
		mov	ax, word_5DD68
		mov	[di+2], ax
		mov	word_5DD68, di
		mov	word ptr [di], 178Fh
		mov	byte_5B775, 1
		mov	word_5B776, 0
		mov	ax, [bp+var_38]
		mov	word_5B77C, ax
		push	ax
		push	60F7h
		call	sub_1A714
		add	sp, 4
		push	word_5B77C
		push	6109h
		call	sub_1A714
		add	sp, 4
		push	di
		call	sub_58C59
		pop	cx
		mov	ax, di
		jmp	short loc_6AA55

loc_6AA53:
		mov	ax, di

loc_6AA55:
		mov	word_5CFA3, ax

loc_6AA58:
		cmp	byte_5B3DA, 0
		jz	short loc_6AA76
		push	large 78h
		push	seg seg033
		push	offset sub_193FF
		push	693Ch
		call	Stopwatch_RegisterTickModuleVariant_561DD
		add	sp, 0Ah
		mov	[si+30h], ax

loc_6AA76:
		push	ds
		push	offset aCracktheNut
		call	Config_LoadOrCreate
		add	sp, 4
		mov	byte_5B3DC, al
		call	sub_A342
		mov	byte_5B3D8, 1
		push	2
		lea	ax, [bp+var_13C]
		push	ax
		call	StreamReader_Close_52616
		add	sp, 4

loc_6AA9E:
		push	cs
		call	near ptr sub_69E10
		pop	di
		pop	si
		leave
		retf
sub_6A0EB		endp

; START OF FUNCTION CHUNK FOR sub_6A0EB
word_6AAA6	dw 41h
		dw 47h
		dw 55h
		dw 57h
off_6AAAE	dw offset loc_6A5AA
		dw offset loc_6A644
		dw offset loc_6A77F
		dw offset loc_6A6E2
word_6AAB6	dw 45h
		dw 4Fh
		dw 54h
		dw 57h
off_6AABE	dw offset loc_6A369
		dw offset loc_6A379
		dw offset loc_6A371
		dw offset loc_6A381
off_6AAC6	dw offset loc_6A1C8
		dw offset loc_6A1D0
		dw offset loc_6A1D8
		dw offset loc_6A400
		dw offset loc_6A400
		dw offset loc_6A400
		dw offset loc_6A400
		dw offset loc_6A400
		dw offset loc_6A400
		dw offset loc_6A400
		dw offset loc_6A400
		dw offset loc_6A400
		dw offset loc_6A400
		dw offset loc_6A400
		dw offset loc_6A400
		dw offset loc_6A400
		dw offset loc_6A400
		dw offset loc_6A400
		dw offset loc_6A400
		dw offset loc_6A23B
		dw offset loc_6A2AE
		dw offset loc_6A400
		dw offset loc_6A400
		dw offset loc_6A2D5
		dw offset loc_6A339
		dw offset loc_6A400
		dw offset loc_6A400
		dw offset loc_6A400
		dw offset loc_6A1E2
		dw offset loc_6A400
		dw offset loc_6A2CD
		dw offset loc_6A400
		dw offset loc_6A400
		dw offset loc_6A1DA
		dw offset loc_6A400
		dw offset loc_6A2B6
		dw offset loc_6A400
		dw offset loc_6A2BE
		dw offset loc_6A2C5
; END OF FUNCTION CHUNK FOR sub_6A0EB

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6AB14		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	byte ptr [si+2Fh], 1
		mov	al, [si+2Fh]
		mov	[si+2Eh], al
		pop	si
		pop	bp
		retf
sub_6AB14		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à CPU_SpeedCalibration
; (sub_9A9E2 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à
; revérifier ici. — Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s)
; différent(s) (adresses de données ou constantes) — à vérifier à CPU_SpeedCalibration
; (sub_27E61 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far,97L — calibration de vitesse CPU : vérifie le support SMARTDRV/detect (INT15
; AH=12h BX=736Dh), exécute 5 boucles de multiplications chronométrées via sub_27144 (le
; lecteur PIT haute précision) : routine de calibration de la vitesse du processeur au
; démarrage — pertinente pour le problème de difficulté IA dépendante du matériel déjà noté
; dans le projet.
; ==============================================================================================
CPU_SpeedCalibration		proc far

var_10		= byte ptr -10h
var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_6		= dword ptr -6
var_1		= byte ptr -1

		push	bp
		mov	bp, sp
		sub	sp, 10h
		push	si
		push	di
		mov	ax, 1209h
		mov	bx, 736Dh
		pushf
		push	ds
		int	15h
		sti
		mov	[bp+var_1], bl
		call	PIT_ReadHighPrecision
		push	dx
		push	ax
		pop	eax
		mov	[bp+var_6], eax
		xor	di, di
		jmp	short loc_6AB6E

loc_6AB4F:
		xor	ax, ax
		xor	bx, bx
		xor	dx, dx
		xor	si, si
		mov	ax, 0A000h
		mov	ds, ax
		xor	si, si
		mov	cx, 4000h

loc_6AB61:
		lodsd
		imul	ecx
		shrd	eax, edx, 10h
		loop	short loc_6AB61
		inc	di

loc_6AB6E:
		cmp	di, 5
		jl	short loc_6AB4F
		cmp	[bp+var_1], 0
		jz	short loc_6AB81
		mov	ax, 1209h
		mov	bx, 534Dh
		int	15h

loc_6AB81:
		pop	ds
		popf
		call	PIT_ReadHighPrecision
		push	dx
		push	ax
		pop	eax
		mov	[bp+var_A], eax
		sub	eax, [bp+var_6]
		imul	eax, eax, 3E8h
		mov	ebx, 1770h
		cdq
		idiv	ebx
		mov	[bp+var_E], eax
		cmp	[bp+var_E], 0D7h
		jg	short loc_6ABBA
		mov	[bp+var_10], 0
		jmp	short loc_6ABCE

loc_6ABBA:
		cmp	[bp+var_E], 0FAh
		jg	short loc_6ABCA
		mov	[bp+var_10], 1
		jmp	short loc_6ABCE

loc_6ABCA:
		mov	[bp+var_10], 2

loc_6ABCE:
		mov	al, [bp+var_10]
		pop	di
		pop	si
		leave
		retf
CPU_SpeedCalibration		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 4 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Dialog_Close (sub_27F0E de STRIKE.EXE). Résumé repris
; de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,59L — ferme un dialogue/écran
; : libère les chaînes associées (word_6E343/341 via sub_338/vtable[0]), désactive les
; indicateurs de son (sub_6769F) : fermeture/nettoyage d'une boîte de dialogue.
; ==============================================================================================
Dialog_Close		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	byte_5B3D8, 0
		jz	short loc_6AC54
		cmp	word_5B3E3, 0
		jz	short loc_6AC03
		mov	ax, word_5B3E3
		add	ax, 2
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		push	word_5B3E3
		call	sub_33B
		pop	cx
		jmp	short loc_6AC03

loc_6AC03:
		mov	word_5B3E3, 0
		cmp	word_5B3E1, 0
		jz	short loc_6AC23
		push	3
		push	word_5B3E1
		mov	bx, word_5B3E1
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_6AC23

loc_6AC23:
		mov	word_5B3E1, 0
		cmp	byte_5B3DA, 0
		jz	short loc_6AC3E
		push	word ptr [si+30h]
		push	693Ch
		call	Stopwatch_UnregisterTickModule_5621A
		add	sp, 4

loc_6AC3E:
		mov	ax, si
		add	ax, 5
		push	ax
		call	sub_58BCE
		pop	cx
		call	StreamReader_DispatchWrite_495B
		mov	byte_5B3D8, 0

loc_6AC54:
		pop	si
		pop	bp
		retf
Dialog_Close		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6AC57		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		push	ax
		push	cs
		call	near ptr Dialog_Close
		pop	cx
		pop	bp
		retf
sub_6AC57		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6AC65		proc far

var_154		= word ptr -154h
var_F7		= dword ptr -0F7h
var_F3		= dword ptr -0F3h
var_EE		= word ptr -0EEh
var_9E		= word ptr -9Eh
var_78		= word ptr -78h
var_69		= word ptr -69h
var_4F		= byte ptr -4Fh
var_2C		= dword ptr -2Ch
var_28		= dword ptr -28h
var_24		= dword ptr -24h
var_1F		= byte ptr -1Fh
var_1E		= word ptr -1Eh
var_1B		= byte ptr -1Bh
var_1A		= dword ptr -1Ah
var_15		= byte ptr -15h
var_14		= dword ptr -14h
var_10		= word ptr -10h
var_E		= dword ptr -0Eh
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4

		push	bp
		mov	bp, sp
		sub	sp, 154h
		push	si
		mov	[bp+var_4], 100h
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	63DEh
		call	Cockpit_PanAzimuthUpdate_35863
		add	sp, 4
		mov	[bp+var_E], 0
		mov	byte ptr [bp+var_C+2], 2
		mov	byte ptr [bp+var_C+3], 0
		mov	[bp+var_8], 0
		cmp	byte_5F552, 2
		jnz	short loc_6ACA8
		mov	ax, 1
		jmp	short loc_6ACAA

loc_6ACA8:
		xor	ax, ax

loc_6ACAA:
		or	ax, ax
		jz	short loc_6ACD7
		cmp	byte_5F552, 2
		jnz	short loc_6ACC4
		push	0
		push	5822h
		call	sub_595C
		add	sp, 4
		jmp	short loc_6ACC4

loc_6ACC4:
		push	large 20000h
		push	5822h
		call	sub_5856
		add	sp, 6
		jmp	short loc_6ACE6

loc_6ACD7:
		push	6286h
		push	word_5DD44
		call	UI_ApplyEncodingHelper_47B1D
		add	sp, 4

loc_6ACE6:
		push	ds
		push	offset aShp_4
		push	ds
		push	offset aChkexit
		push	ds
		push	offset aFONTS
		lea	ax, [bp+var_EE]
		push	ax
		call	sub_1F0C4
		add	sp, 0Eh
		lea	ax, [bp+var_154]
		push	ax
		call	StreamReader_ConstructVariantA_52440
		pop	cx
		mov	[bp+var_154], 9B5h
		mov	[bp+var_F3], 100h
		mov	[bp+var_F7], 0
		mov	[bp+var_154], 0B2Ch
		push	1
		lea	ax, [bp+var_EE]
		push	ax
		lea	ax, [bp+var_154]
		push	ax
		mov	bx, [bp+var_154]
		call	dword ptr [bx+14h]
		add	sp, 6
		lea	ax, [bp+var_154]
		push	ax
		call	StreamReader_GetCapacity_52ABA
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_24], eax
		mov	[bp+var_28], eax
		push	1
		push	0
		push	3
		push	eax
		push	67B0h
		call	Memory_TypedFreeWrapper_447E1
		add	sp, 0Ch
		mov	word ptr [bp+var_2C+2], dx
		mov	word ptr [bp+var_2C], ax
		mov	eax, [bp+var_2C]
		mov	[bp+var_E], eax
		mov	byte ptr [bp+var_C+2], 3
		mov	byte ptr [bp+var_C+3], 1
		mov	[bp+var_8], 0
		mov	eax, [bp+var_28]
		mov	[bp+var_8], eax
		push	large 0FFFFFFFFh
		push	large [bp+var_24]
		cmp	byte ptr [bp+var_C+2], 3
		jnz	short loc_6ADB2
		push	0
		mov	al, byte ptr [bp+var_C+2]
		push	ax
		push	large [bp+var_E]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_6ADB9

loc_6ADB2:
		mov	edx, [bp+var_C]
		mov	ax, word ptr [bp+var_E]

loc_6ADB9:
		push	dx
		push	ax
		lea	ax, [bp+var_154]
		push	ax
		call	StreamReader_ReadTyped_529F9
		add	sp, 0Eh
		lea	ax, [bp+var_154]
		push	ax
		call	sub_527AA
		pop	cx
		push	0
		lea	ax, [bp+var_154]
		push	ax
		call	StreamReader_ReleaseBuffer_544B1
		add	sp, 4
		mov	byte_603AD, 1
		push	large dword_60101
		push	0
		call	sub_21CC8
		add	sp, 6
		mov	[bp+var_10], 0FFFFh
		push	large 0C7013Fh
		push	large 0
		lea	ax, [bp+var_9E]
		push	ax
		call	GaugeWidgetVariantB_ConstructAndInit_20248
		add	sp, 0Ah
		cmp	[bp+var_69], 0
		jnz	short loc_6AE1D
		mov	[bp+var_4F], 0
		jmp	short loc_6AE1D

loc_6AE1D:
		push	large 30h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jnz	short loc_6AE2F
		jmp	loc_6AEB4

loc_6AE2F:
		push	large 0D003Ah
		push	large 6A0053h
		push	ax
		call	PaletteScreen_FormatValueDisplay_21F9C
		add	sp, 0Ah
		mov	word ptr [si+0Eh], 3F6h
		mov	dword ptr [si+1Eh], 0
		mov	byte ptr [si+22h], 2
		mov	byte ptr [si+23h], 0
		mov	dword ptr [si+24h], 0
		mov	eax, [bp+var_E]
		mov	[bp+var_14], eax
		mov	al, byte ptr [bp+var_C+2]
		mov	[bp+var_15], al
		mov	eax, [bp+var_14]
		mov	[si+1Eh], eax
		mov	al, [bp+var_15]
		mov	[si+22h], al
		mov	byte ptr [si+23h], 0
		mov	dword ptr [si+24h], 0
		mov	eax, [bp+var_8]
		mov	[si+24h], eax
		mov	word ptr [si+28h], 1
		mov	word ptr [si+0Eh], 42Ah
		lea	ax, [bp+var_10]
		mov	[si+2Ah], ax
		mov	word ptr [si+2Ch], 1
		mov	word ptr [si+0Eh], 45Eh
		mov	word ptr [si+2Eh], 3
		mov	ax, si
		jmp	short loc_6AEB6

loc_6AEB4:
		mov	ax, si

loc_6AEB6:
		push	ax
		lea	ax, [bp+var_9E]
		push	ax
		call	sub_208FD
		add	sp, 6
		push	[bp+var_78]
		push	15h
		lea	ax, [bp+var_9E]
		push	ax
		call	GaugeWidget_AllocateExtra_207F4
		add	sp, 6
		push	large 30h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jnz	short loc_6AEE8
		jmp	loc_6AF6D

loc_6AEE8:
		push	large 0D003Ah
		push	large 6A009Ah
		push	ax
		call	PaletteScreen_FormatValueDisplay_21F9C
		add	sp, 0Ah
		mov	word ptr [si+0Eh], 3F6h
		mov	dword ptr [si+1Eh], 0
		mov	byte ptr [si+22h], 2
		mov	byte ptr [si+23h], 0
		mov	dword ptr [si+24h], 0
		mov	eax, [bp+var_E]
		mov	[bp+var_1A], eax
		mov	al, byte ptr [bp+var_C+2]
		mov	[bp+var_1B], al
		mov	eax, [bp+var_1A]
		mov	[si+1Eh], eax
		mov	al, [bp+var_1B]
		mov	[si+22h], al
		mov	byte ptr [si+23h], 0
		mov	dword ptr [si+24h], 0
		mov	eax, [bp+var_8]
		mov	[si+24h], eax
		mov	word ptr [si+28h], 2
		mov	word ptr [si+0Eh], 42Ah
		lea	ax, [bp+var_10]
		mov	[si+2Ah], ax
		mov	word ptr [si+2Ch], 0
		mov	word ptr [si+0Eh], 45Eh
		mov	word ptr [si+2Eh], 4
		mov	ax, si
		jmp	short loc_6AF6F

loc_6AF6D:
		mov	ax, si

loc_6AF6F:
		push	ax
		lea	ax, [bp+var_9E]
		push	ax
		call	sub_208FD
		add	sp, 6
		push	[bp+var_78]
		push	31h
		lea	ax, [bp+var_9E]
		push	ax
		call	GaugeWidget_AllocateExtra_207F4
		add	sp, 6
		push	[bp+var_78]
		push	1
		lea	ax, [bp+var_9E]
		push	ax
		call	GaugeWidget_AllocateExtra_207F4
		add	sp, 6
		lea	ax, [bp+var_9E]
		push	ax
		call	GaugeWidget_QueryRenderState_206CE
		pop	cx
		lea	ax, [bp+var_9E]
		push	ax
		call	PaletteScreen_AcquireOwnership_2197B
		pop	cx
		push	0
		cmp	byte ptr [bp+var_C+2], 3
		jnz	short loc_6AFD6
		push	0
		mov	al, byte ptr [bp+var_C+2]
		push	ax
		push	large [bp+var_E]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_6AFDD

loc_6AFD6:
		mov	edx, [bp+var_C]
		mov	ax, word ptr [bp+var_E]

loc_6AFDD:
		push	dx
		push	ax
		push	large 400049h
		push	word_5DD44
		call	sub_4A194
		add	sp, 0Ch
		lea	ax, [bp+var_9E]
		push	ax
		call	PaletteScreen_ReleaseOwnership_21998
		pop	cx
		jmp	short loc_6B00D

loc_6AFFE:
		push	0
		lea	ax, [bp+var_9E]
		push	ax
		call	GaugeWidget_QueryAndFormat_2094E
		add	sp, 4

loc_6B00D:
		cmp	[bp+var_10], 0FFFFh
		jz	short loc_6AFFE
		lea	ax, [bp+var_9E]
		push	ax
		call	GaugeWidget_DrawByMode_206F3
		pop	cx
		call	TextScrollDisplayB_ApplyHelperD_571DE
		cmp	byte_5F552, 2
		jnz	short loc_6B02F
		mov	ax, 1
		jmp	short loc_6B031

loc_6B02F:
		xor	ax, ax

loc_6B031:
		or	ax, ax
		jz	short loc_6B056
		push	large 10002h
		push	5822h
		call	sub_5856
		add	sp, 6
		push	large 2
		push	5822h
		call	sub_5856
		add	sp, 6
		jmp	short loc_6B065

loc_6B056:
		push	word_5DD44
		push	6286h
		call	UI_ApplyEncodingHelper_47B1D
		add	sp, 4

loc_6B065:
		cmp	byte_5F552, 2
		jnz	short loc_6B071
		mov	ax, 1
		jmp	short loc_6B073

loc_6B071:
		xor	ax, ax

loc_6B073:
		or	ax, ax
		jz	short loc_6B0B9
		cmp	byte_5F552, 2
		jnz	short loc_6B0B9
		push	5822h
		call	sub_5830
		pop	cx
		mov	[bp+var_1E], ax
		push	1
		push	5822h
		call	sub_595C
		add	sp, 4
		push	large 20000h
		push	5822h
		call	sub_5856
		add	sp, 6
		cmp	[bp+var_1E], 0
		jnz	short loc_6B0B9
		push	5822h
		call	sub_5844
		pop	cx
		jmp	short loc_6B0B9

loc_6B0B9:
		mov	al, byte ptr [bp+var_10]
		mov	[bp+var_1F], al
		push	2
		lea	ax, [bp+var_9E]
		push	ax
		call	GaugeWidget_RebuildAndRelease_203C6
		add	sp, 4
		cmp	byte ptr [bp+var_C+3], 0
		jz	short loc_6B0F2
		cmp	[bp+var_E], 0
		jz	short loc_6B0F2
		push	0
		mov	al, byte ptr [bp+var_C+2]
		push	ax
		lea	ax, word ptr [bp+var_E]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_6B0F2

loc_6B0F2:
		mov	al, [bp+var_1F]
		pop	si
		leave
		retf
sub_6AC65		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6B0F8		proc far
		push	bp
		mov	bp, sp
		cmp	byte_5B470, 0
		jz	short loc_6B13E
		cmp	byte_5FDD7, 0
		jz	short loc_6B127
		cmp	dword_5FDD2, 0
		jz	short loc_6B127
		push	0
		mov	al, byte_5FDD6
		push	ax
		push	60B2h
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_6B127

loc_6B127:
		mov	dword_5FDD2, 0
		mov	byte_5FDD7, 0
		mov	dword_5FDD8, 0

loc_6B13E:
		pop	bp
		retf
sub_6B0F8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à AircraftDamageModel_ReleaseStreamAndDestruct_85499
; (sub_85499 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à
; revérifier ici. — Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s)
; différent(s) (adresses de données ou constantes) — à vérifier à
; AircraftDamageModel_ReleaseStreamAndDestruct_7556A (sub_7556A de STRIKE.EXE). Résumé repris
; de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, combine
; ResourceRecord_Helper_645A5 (seg193), StreamReader_ReleaseBuffer_65643 (seg195), libère
; l'objet (sub_338).
; ==============================================================================================
AircraftDamageModel_ReleaseStreamAndDestruct_6B140		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_6B172
		mov	word ptr [si], 178Fh
		push	si
		call	sub_58C6D
		pop	cx
		push	0
		push	si
		call	sub_47DAD
		add	sp, 4
		test	di, 1
		jz	short loc_6B172
		push	si
		call	sub_33B
		pop	cx

loc_6B172:
		pop	di
		pop	si
		pop	bp
		retf
AircraftDamageModel_ReleaseStreamAndDestruct_6B140		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; StreamReader_DestructWrapper_2CA33 (sub_2CA33 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE
; ; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : code identique
; instruction par instruction à StreamReader_DestructWrapper_3D231 (sub_3D231 de OPTEST.EXE).
; Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de
; STRIKE.EXE : code identique instruction par instruction à StreamReader_DestructWrapper_659C1
; (sub_659C1 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far, référencée via vtable (DATA XREF seg339) — enveloppe appelant
; StreamReader_Destruct_638FF. Référencée directement par TextRenderer_Main (sub_27477,
; seg048).
; ==============================================================================================
StreamReader_DestructWrapper_6B176		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		push	ax
		call	sub_58C6D
		pop	cx
		pop	bp
		retf
StreamReader_DestructWrapper_6B176		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6B185		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_6B1E7
		mov	word ptr [si], 1797h
		push	si
		call	sub_1A612
		pop	cx
		push	2
		mov	ax, si
		add	ax, 1Ch
		push	ax
		call	StreamReader_Close_52616
		add	sp, 4
		push	2
		mov	ax, si
		add	ax, 12h
		push	ax
		call	sub_19116
		add	sp, 4
		push	2
		mov	ax, si
		add	ax, 8
		push	ax
		call	sub_19116
		add	sp, 4
		push	0
		push	si
		call	sub_47DAD
		add	sp, 4
		test	di, 1
		jz	short loc_6B1E7
		push	si
		call	sub_33B
		pop	cx

loc_6B1E7:
		pop	di
		pop	si
		pop	bp
		retf
sub_6B185		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; StreamReader_DestructWrapper_2CA33 (sub_2CA33 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE
; ; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : code identique
; instruction par instruction à StreamReader_DestructWrapper_3D231 (sub_3D231 de OPTEST.EXE).
; Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de
; STRIKE.EXE : code identique instruction par instruction à StreamReader_DestructWrapper_659C1
; (sub_659C1 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far, référencée via vtable (DATA XREF seg339) — enveloppe appelant
; StreamReader_Destruct_638FF. Référencée directement par TextRenderer_Main (sub_27477,
; seg048).
; ==============================================================================================
StreamReader_DestructWrapper_6B1EB		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		push	ax
		call	sub_1A612
		pop	cx
		pop	bp
		retf
StreamReader_DestructWrapper_6B1EB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6B1FA		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_6B22C
		mov	word ptr [si], 179Fh
		push	si
		call	sub_4AD8
		pop	cx
		push	0
		push	si
		call	StreamReader_Close_52616
		add	sp, 4
		test	di, 1
		jz	short loc_6B22C
		push	si
		call	sub_33B
		pop	cx

loc_6B22C:
		pop	di
		pop	si
		pop	bp
		retf
sub_6B1FA		endp
ovr188		ends
