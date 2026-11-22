ovr365		segment	para public 'OVERLAY' use16
		assume cs:ovr365
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_CA630		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_CA64A
		push	299h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_CA670

loc_CA64A:
		push	si
		call	sub_75CA0
		pop	cx
		mov	ax, si
		add	ax, 0D2h
		push	ax
		call	sub_75C20
		pop	cx
		mov	ax, si
		add	ax, 1A4h
		push	ax
		call	sub_75C60
		pop	cx
		push	si
		nop
		push	cs
		call	near ptr sub_CA675
		pop	cx

loc_CA670:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_CA630		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_CA675		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		xor	dx, dx
		jmp	short loc_CA6CE

loc_CA680:
		mov	bx, dx
		shl	bx, 1
		mov	word ptr [bx+si+24Ch], 0
		mov	bx, dx
		shl	bx, 1
		mov	word ptr [bx+si+27Fh], 0
		mov	bx, dx
		shl	bx, 1
		mov	word ptr [bx+si+285h], 0
		xor	cx, cx
		jmp	short loc_CA6C8

loc_CA6A2:
		mov	ax, dx
		imul	ax, ax, 0Ah
		mov	bx, si
		add	bx, ax
		mov	ax, cx
		shl	ax, 1
		add	bx, ax
		mov	word ptr [bx+252h], 1
		mov	ax, dx
		imul	ax, ax, 5
		mov	bx, si
		add	bx, ax
		add	bx, cx
		mov	byte ptr [bx+270h], 0
		inc	cx

loc_CA6C8:
		cmp	cx, 5
		jl	short loc_CA6A2
		inc	dx

loc_CA6CE:
		cmp	dx, 3
		jl	short loc_CA680
		mov	word ptr [si+28Bh], 0
		mov	byte ptr [si+28Dh], 0
		push	si
		call	sub_75CA5
		pop	cx
		mov	al, 0
		mov	[si+298h], al
		mov	[si+290h], al
		pop	si
		pop	bp
		retf
sub_CA675		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_CA6F2		proc far

arg_0		= word ptr  6
arg_2		= dword ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		xor	di, di
		jmp	short loc_CA724

loc_CA6FE:
		push	ds
		mov	ax, di
		add	ax, 2
		imul	ax, ax, 14h
		mov	dx, si
		add	dx, ax
		push	dx
		push	large [bp+arg_2]
		call	sub_3949
		add	sp, 8
		or	ax, ax
		jnz	short loc_CA723
		mov	ax, di
		add	ax, 2
		jmp	short loc_CA72C

loc_CA723:
		inc	di

loc_CA724:
		cmp	di, 8
		jl	short loc_CA6FE
		mov	ax, 1

loc_CA72C:
		pop	di
		pop	si
		pop	bp
		retf
sub_CA6F2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_CA730		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		xor	di, di
		push	[bp+arg_4]
		mov	ax, si
		add	ax, 1A4h
		push	ax
		call	sub_75C6F
		add	sp, 4
		mov	ax, [bp+arg_2]
		cmp	ax, 1
		jz	short loc_CA763
		cmp	ax, 2
		jz	short loc_CA790
		cmp	ax, 3
		jnz	short loc_CA760
		jmp	loc_CA805

loc_CA760:
		jmp	loc_CA842

loc_CA763:
		push	846h
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jz	short loc_CA77A
		cmp	byte ptr [si+248h], 0
		jz	short loc_CA77A
		mov	di, 4

loc_CA77A:
		or	di, di
		jz	short loc_CA781
		jmp	loc_CA842

loc_CA781:
		cmp	byte ptr [si+244h], 0
		jnz	short loc_CA78B
		jmp	loc_CA842

loc_CA78B:
		xor	di, di
		jmp	loc_CA842

loc_CA790:
		push	1B3Fh
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jz	short loc_CA7CE
		cmp	byte ptr [si+247h], 0
		jz	short loc_CA7CE
		push	846h
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jz	short loc_CA7BB
		cmp	byte ptr [si+24Bh], 0
		jz	short loc_CA7BB
		mov	di, 7

loc_CA7BB:
		or	di, di
		jz	short loc_CA7C2
		jmp	loc_CA842

loc_CA7C2:
		cmp	byte ptr [si+247h], 0
		jz	short loc_CA842
		mov	di, 3
		jmp	short loc_CA842

loc_CA7CE:
		push	846h
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jz	short loc_CA7F1
		cmp	byte ptr [si+24Ah], 0
		jz	short loc_CA7E7
		mov	di, 6
		jmp	short loc_CA7F1

loc_CA7E7:
		cmp	byte ptr [si+249h], 0
		jz	short loc_CA7F1
		mov	di, 5

loc_CA7F1:
		or	di, di
		jnz	short loc_CA842
		cmp	byte ptr [si+246h], 0
		jnz	short loc_CA833
		cmp	byte ptr [si+245h], 0
		jz	short loc_CA842
		jmp	short loc_CA83F

loc_CA805:
		push	846h
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jz	short loc_CA828
		cmp	byte ptr [si+24Ah], 0
		jz	short loc_CA81E
		mov	di, 6
		jmp	short loc_CA828

loc_CA81E:
		cmp	byte ptr [si+249h], 0
		jz	short loc_CA828
		mov	di, 5

loc_CA828:
		or	di, di
		jnz	short loc_CA842
		cmp	byte ptr [si+246h], 0
		jz	short loc_CA838

loc_CA833:
		mov	di, 2
		jmp	short loc_CA842

loc_CA838:
		cmp	byte ptr [si+245h], 0
		jz	short loc_CA842

loc_CA83F:
		mov	di, 1

loc_CA842:
		mov	ax, di
		pop	di
		pop	si
		pop	bp
		retf
sub_CA730		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_CA848		proc far

var_C		= dword ptr -0Ch
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_4], 47h
		mov	[bp+var_6], 0
		mov	[bp+var_8], 2
		mov	di, 0A0h
		jmp	short loc_CA87E

loc_CA867:
		push	di
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jge	short loc_CA87D
		push	0
		push	di
		call	GameVar_Set_564BB
		add	sp, 4

loc_CA87D:
		inc	di

loc_CA87E:
		cmp	di, 0A8h
		jle	short loc_CA867
		push	96h
		call	GameVar_Get_56414
		pop	cx
		dec	ax
		mov	[si+24Ch], ax
		push	97h
		call	GameVar_Get_56414
		pop	cx
		dec	ax
		mov	[si+24Eh], ax
		push	98h
		call	GameVar_Get_56414
		pop	cx
		dec	ax
		mov	[si+250h], ax
		mov	word ptr [si+27Fh], 1
		mov	word ptr [si+254h], 0
		push	0
		push	si
		call	sub_75CB9
		add	sp, 4
		mov	byte ptr [si+28Dh], 1
		mov	word ptr [si+28Eh], 0
		mov	bx, [bp+arg_2]
		mov	ax, [bx+2Eh]
		add	ax, 0FFF5h
		mov	[bp+var_2], ax
		mov	bx, [bp+var_6]
		shl	bx, 1
		push	word ptr [bx+si+24Ch]
		push	3Ch
		call	GameVar_Get_56414
		pop	cx
		push	ax
		push	si
		push	cs
		call	near ptr sub_CA730
		add	sp, 6
		mov	[si+285h], ax
		mov	di, 3Ch
		jmp	loc_CA9B1

loc_CA900:
		push	di
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jz	short loc_CA96E
		mov	bx, [bp+var_6]
		shl	bx, 1
		inc	word ptr [bx+si+27Fh]
		mov	dx, [bp+var_2]
		mov	[bp+var_C], 0
		mov	bx, [bp+arg_2]
		cmp	[bx+2Eh], dx
		jbe	short loc_CA93C
		mov	ax, dx
		imul	ax, ax, 9
		mov	dx, [bx+32h]
		mov	bx, [bx+30h]
		add	bx, ax
		mov	word ptr [bp+var_C+2], dx
		mov	word ptr [bp+var_C], bx
		jmp	short loc_CA93C

loc_CA93C:
		push	large [bp+var_C]
		push	si
		push	cs
		call	near ptr sub_CA6F2
		add	sp, 6
		mov	dx, [bp+var_6]
		imul	dx, dx, 0Ah
		mov	bx, si
		add	bx, dx
		mov	dx, [bp+var_8]
		shl	dx, 1
		add	bx, dx
		mov	[bx+252h], ax
		mov	dx, ax
		cmp	dx, 1
		jz	short loc_CA96E
		push	dx
		push	si
		call	sub_75CB9
		add	sp, 4

loc_CA96E:
		inc	[bp+var_8]
		inc	[bp+var_2]
		cmp	[bp+var_8], 5
		jnz	short loc_CA9B0
		mov	[bp+var_8], 1
		inc	[bp+var_6]
		cmp	[bp+var_6], 3
		jge	short loc_CA9B0
		mov	ax, di
		inc	ax
		push	ax
		call	GameVar_Get_56414
		pop	cx
		mov	word ptr [bp+var_C+2], ax
		mov	bx, [bp+var_6]
		shl	bx, 1
		push	word ptr [bx+si+24Ch]
		push	ax
		push	si
		push	cs
		call	near ptr sub_CA730
		add	sp, 6
		mov	bx, [bp+var_6]
		shl	bx, 1
		mov	[bx+si+285h], ax

loc_CA9B0:
		inc	di

loc_CA9B1:
		cmp	di, [bp+var_4]
		jge	short loc_CA9B9
		jmp	loc_CA900

loc_CA9B9:
		pop	di
		pop	si
		leave
		retf
sub_CA848		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_CA9BD		proc far

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	si
		call	sub_75CC3
		pop	cx
		mov	bx, [si+28Bh]
		shl	bx, 1
		mov	dx, [bx+si+27Fh]
		sub	dx, ax
		mov	di, dx
		mov	bx, [si+28Bh]
		shl	bx, 1
		mov	ax, 4
		sub	ax, [bx+si+27Fh]
		mov	[bp+var_2], ax
		add	di, [bp+var_2]
		push	si
		nop
		push	cs
		call	near ptr sub_CC7DA
		pop	cx
		cmp	byte ptr [si+28Dh], 0
		jz	short loc_CAA14
		mov	ax, [si+28Eh]
		cmp	ax, [si+28Bh]
		jnz	short loc_CAA14
		mov	bx, [si+28Bh]
		imul	bx, bx, 5
		mov	byte ptr [bx+si+271h], 1

loc_CAA14:
		mov	bx, [si+28Bh]
		shl	bx, 1
		mov	bx, [bx+si+27Fh]
		dec	bx
		cmp	bx, 3
		ja	short loc_CAA67
		shl	bx, 1
		jmp	cs:off_CAAEA[bx]	; switch jump

loc_CAA2B:
		mov	bx, [si+28Bh]
		imul	bx, bx, 0Ah
		cmp	word ptr [bx+si+25Ah], 1
		jz	short loc_CAA3A
		dec	di

loc_CAA3A:
		mov	bx, [si+28Bh]
		imul	bx, bx, 0Ah
		cmp	word ptr [bx+si+258h], 1
		jz	short loc_CAA49
		dec	di

loc_CAA49:
		mov	bx, [si+28Bh]
		imul	bx, bx, 0Ah
		cmp	word ptr [bx+si+256h], 1
		jz	short loc_CAA58
		dec	di

loc_CAA58:
		mov	bx, [si+28Bh]
		imul	bx, bx, 0Ah
		cmp	word ptr [bx+si+254h], 1
		jz	short loc_CAA67
		dec	di

loc_CAA67:
		mov	bx, di
		dec	bx
		cmp	bx, 3
		ja	short loc_CAADE
		shl	bx, 1
		jmp	cs:off_CAAE2[bx]	; switch jump

loc_CAA76:
		mov	bx, [si+28Bh]
		imul	bx, bx, 0Ah
		cmp	word ptr [bx+si+254h], 1
		jnz	short loc_CAA90
		mov	bx, [si+28Bh]
		imul	bx, bx, 5
		mov	byte ptr [bx+si+271h], 1

loc_CAA90:
		mov	bx, [si+28Bh]
		imul	bx, bx, 0Ah
		cmp	word ptr [bx+si+256h], 1
		jnz	short loc_CAAAA
		mov	bx, [si+28Bh]
		imul	bx, bx, 5
		mov	byte ptr [bx+si+272h], 1

loc_CAAAA:
		mov	bx, [si+28Bh]
		imul	bx, bx, 0Ah
		cmp	word ptr [bx+si+258h], 1
		jnz	short loc_CAAC4
		mov	bx, [si+28Bh]
		imul	bx, bx, 5
		mov	byte ptr [bx+si+273h], 1

loc_CAAC4:
		mov	bx, [si+28Bh]
		imul	bx, bx, 0Ah
		cmp	word ptr [bx+si+25Ah], 1
		jnz	short loc_CAADE
		mov	bx, [si+28Bh]
		imul	bx, bx, 5
		mov	byte ptr [bx+si+274h], 1

loc_CAADE:
		pop	di
		pop	si
		leave
		retf
sub_CA9BD		endp

; START OF FUNCTION CHUNK FOR sub_CA9BD
off_CAAE2	dw offset loc_CAAC4
		dw offset loc_CAAAA
		dw offset loc_CAA90
		dw offset loc_CAA76
off_CAAEA	dw offset loc_CAA58
		dw offset loc_CAA49
		dw offset loc_CAA3A
		dw offset loc_CAA2B
; END OF FUNCTION CHUNK FOR sub_CA9BD

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far. LUE 2026-11-05 (fichiers, chunks et appels ; pas ligne par ligne). Rend le rang de
; l'avion du joueur d'après les drapeaux 2100 à 2106, 2200, 2201 (le dernier posé l'emporte)
; et range deux valeurs par avion en [partie+1378] (octet) et [partie+1379] (mot) ; remplit
; ensuite 4 entrées de 3 octets en [partie+1366] d'après d'autres drapeaux (2111…).
; ==============================================================================================
Gameflow_ChooseAircraft_CAAF2		proc far

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		xor	di, di
		push	834h
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jz	short loc_CAB36
		push	898h
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jz	short loc_CAB29
		mov	di, 1
		mov	byte ptr [si+562h], 8
		mov	word ptr [si+563h], 0F0h
		jmp	short loc_CAB36

loc_CAB29:
		xor	di, di
		mov	byte ptr [si+562h], 8
		mov	word ptr [si+563h], 1C2h

loc_CAB36:
		push	835h
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jz	short loc_CAB51
		mov	di, 6
		mov	byte ptr [si+562h], 8
		mov	word ptr [si+563h], 0D2h

loc_CAB51:
		push	83Ah
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jz	short loc_CAB6C
		mov	di, 5
		mov	byte ptr [si+562h], 7
		mov	word ptr [si+563h], 12Ch

loc_CAB6C:
		push	837h
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jz	short loc_CAB99
		push	899h
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jz	short loc_CAB8B
		mov	di, 3
		jmp	short loc_CAB8E

loc_CAB8B:
		mov	di, 2

loc_CAB8E:
		mov	byte ptr [si+562h], 8
		mov	word ptr [si+563h], 190h

loc_CAB99:
		push	838h
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jz	short loc_CABB4
		mov	di, 4
		mov	byte ptr [si+562h], 8
		mov	word ptr [si+563h], 184h

loc_CABB4:
		push	836h
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jz	short loc_CABCF
		mov	di, 7
		mov	byte ptr [si+562h], 8
		mov	word ptr [si+563h], 19Ah

loc_CABCF:
		push	839h
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jz	short loc_CABEA
		mov	di, 8
		mov	byte ptr [si+562h], 6
		mov	word ptr [si+563h], 258h

loc_CABEA:
		xor	dx, dx
		jmp	short loc_CAC0C

loc_CABEE:
		mov	al, dl
		mov	ah, 0
		imul	ax, ax, 3
		mov	bx, ax
		mov	byte ptr [bx+si+556h], 0FFh
		mov	al, dl
		mov	ah, 0
		imul	ax, ax, 3
		mov	bx, ax
		mov	word ptr [bx+si+557h], 0
		inc	dx

loc_CAC0C:
		cmp	dx, 4
		jl	short loc_CABEE
		mov	[bp+var_2], 0
		push	83Fh
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jz	short loc_CAC64
		mov	al, byte ptr [bp+var_2]
		mov	ah, 0
		imul	ax, ax, 3
		mov	bx, ax
		mov	byte ptr [bx+si+556h], 0
		push	83Ah
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jz	short loc_CAC51
		mov	al, byte ptr [bp+var_2]
		mov	ah, 0
		imul	ax, ax, 3
		mov	bx, ax
		mov	word ptr [bx+si+557h], 3
		jmp	short loc_CAC61

loc_CAC51:
		mov	al, byte ptr [bp+var_2]
		mov	ah, 0
		imul	ax, ax, 3
		mov	bx, ax
		mov	word ptr [bx+si+557h], 2

loc_CAC61:
		inc	[bp+var_2]

loc_CAC64:
		push	842h
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jz	short loc_CACB2
		mov	al, byte ptr [bp+var_2]
		mov	ah, 0
		imul	ax, ax, 3
		mov	bx, ax
		mov	byte ptr [bx+si+556h], 1
		push	836h
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jz	short loc_CAC9F
		mov	al, byte ptr [bp+var_2]
		mov	ah, 0
		imul	ax, ax, 3
		mov	bx, ax
		mov	word ptr [bx+si+557h], 1
		jmp	short loc_CACAF

loc_CAC9F:
		mov	al, byte ptr [bp+var_2]
		mov	ah, 0
		imul	ax, ax, 3
		mov	bx, ax
		mov	word ptr [bx+si+557h], 2

loc_CACAF:
		inc	[bp+var_2]

loc_CACB2:
		push	840h
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jz	short loc_CAD0D
		mov	al, byte ptr [bp+var_2]
		mov	ah, 0
		imul	ax, ax, 3
		mov	bx, ax
		mov	byte ptr [bx+si+556h], 5
		push	838h
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jnz	short loc_CACE8
		push	836h
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jz	short loc_CACFA

loc_CACE8:
		mov	al, byte ptr [bp+var_2]
		mov	ah, 0
		imul	ax, ax, 3
		mov	bx, ax
		mov	word ptr [bx+si+557h], 8
		jmp	short loc_CAD0A

loc_CACFA:
		mov	al, byte ptr [bp+var_2]
		mov	ah, 0
		imul	ax, ax, 3
		mov	bx, ax
		mov	word ptr [bx+si+557h], 6

loc_CAD0A:
		inc	[bp+var_2]

loc_CAD0D:
		push	841h
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jz	short loc_CAD3C
		mov	al, byte ptr [bp+var_2]
		mov	ah, 0
		imul	ax, ax, 3
		mov	bx, ax
		mov	byte ptr [bx+si+556h], 2
		mov	al, byte ptr [bp+var_2]
		mov	ah, 0
		imul	ax, ax, 3
		mov	bx, ax
		mov	word ptr [bx+si+557h], 2
		inc	[bp+var_2]

loc_CAD3C:
		push	83Eh
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jz	short loc_CAD6B
		mov	al, byte ptr [bp+var_2]
		mov	ah, 0
		imul	ax, ax, 3
		mov	bx, ax
		mov	byte ptr [bx+si+556h], 4
		mov	al, byte ptr [bp+var_2]
		mov	ah, 0
		imul	ax, ax, 3
		mov	bx, ax
		mov	word ptr [bx+si+557h], 2
		inc	[bp+var_2]

loc_CAD6B:
		push	843h
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jz	short loc_CAD97
		mov	al, byte ptr [bp+var_2]
		mov	ah, 0
		imul	ax, ax, 3
		mov	bx, ax
		mov	byte ptr [bx+si+556h], 3
		mov	al, byte ptr [bp+var_2]
		mov	ah, 0
		imul	ax, ax, 3
		mov	bx, ax
		mov	word ptr [bx+si+557h], 1

loc_CAD97:
		mov	ax, di
		pop	di
		pop	si
		leave
		retf
Gameflow_ChooseAircraft_CAAF2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far. LUE 2026-11-05. Commande 22 (LAUNCH_MISSION*) : chaîne FPLN de STRING.IFF
; (Strings_Get_CA536), avion choisi par Gameflow_ChooseAircraft_CAAF2, mission réécrite par
; Gameflow_WriteInstantMission_CAEBB (word_7D190 ou word_7D18E), [partie+1254] = 1,
; [partie+1260] = 1, puis sub_D9A80 (cinématique du pont avec l'avion). Argument non lu.
; ==============================================================================================
Gameflow_LaunchMission_CAD9D		proc far

var_50		= word ptr -50h
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 50h
		push	si
		push	di
		mov	si, [bp+arg_0]
		lea	ax, [bp+var_50]
		push	ax
		push	large 4E4C5046h
		call	sub_75910
		add	sp, 6
		push	si
		push	cs
		call	near ptr Gameflow_ChooseAircraft_CAAF2
		pop	cx
		mov	di, ax
		push	si
		call	sub_75915
		pop	cx
		cmp	word_7D190, 0
		jz	short loc_CADE5
		push	0
		push	1
		mov	ax, di
		shl	ax, 3
		lea	dx, [bp+var_50]
		add	ax, dx
		push	ax
		push	word_7D190
		jmp	short loc_CAE12

loc_CADE5:
		cmp	word_7D18E, 0
		jnz	short loc_CADFF
		push	0F9Fh
		call	GameVar_ClearFlag_56520
		pop	cx
		push	0
		push	cs
		call	near ptr sub_CA630
		pop	cx
		mov	word_7D18E, ax

loc_CADFF:
		push	0
		push	0
		mov	ax, di
		shl	ax, 3
		lea	dx, [bp+var_50]
		add	ax, dx
		push	ax
		push	word_7D18E

loc_CAE12:
		nop
		push	cs
		call	near ptr Gameflow_WriteInstantMission_CAEBB
		add	sp, 8
		mov	byte ptr [si+4E6h], 1
		mov	byte ptr [si+4ECh], 1
		push	di
		call	sub_75FE0
		pop	cx
		pop	di
		pop	si
		leave
		retf
Gameflow_LaunchMission_CAD9D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_CAE2F		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	bx, [bp+arg_2]
		inc	bx
		dec	bx
		cmp	bx, 7
		ja	short loc_CAE77
		shl	bx, 1
		jmp	cs:off_CAE7A[bx]	; switch jump

loc_CAE47:
		push	3AFCh
		jmp	short loc_CAE6D

loc_CAE4C:
		push	3AFEh
		jmp	short loc_CAE6D

loc_CAE51:
		push	3B00h
		jmp	short loc_CAE6D

loc_CAE56:
		push	3B02h
		jmp	short loc_CAE6D

loc_CAE5B:
		push	3B04h
		jmp	short loc_CAE6D

loc_CAE60:
		push	3B07h
		jmp	short loc_CAE6D

loc_CAE65:
		push	3B0Ah
		jmp	short loc_CAE6D

loc_CAE6A:
		push	3B0Dh

loc_CAE6D:
		push	word ptr [si]
		call	CRT_Strcat
		add	sp, 4

loc_CAE77:
		pop	si
		pop	bp
		retf
sub_CAE2F		endp

; START OF FUNCTION CHUNK FOR sub_CAE2F
off_CAE7A	dw offset loc_CAE47
		dw offset loc_CAE4C
		dw offset loc_CAE51
		dw offset loc_CAE56
		dw offset loc_CAE5B
		dw offset loc_CAE60
		dw offset loc_CAE65
		dw offset loc_CAE6A
; END OF FUNCTION CHUNK FOR sub_CAE2F

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_CAE8A		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		mov	ax, [bp+arg_2]
		or	ax, ax
		jz	short loc_CAEA3
		cmp	ax, 1
		jz	short loc_CAEA8
		cmp	ax, 2
		jz	short loc_CAEAD
		jmp	short loc_CAEB9

loc_CAEA3:
		push	3B10h
		jmp	short loc_CAEB0

loc_CAEA8:
		push	3B12h
		jmp	short loc_CAEB0

loc_CAEAD:
		push	3B14h

loc_CAEB0:
		push	dx
		call	CRT_Strcat
		add	sp, 4

loc_CAEB9:
		pop	bp
		retf
sub_CAE8A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far. LUE 2026-11-05 (fichiers, chunks et appels ; pas ligne par ligne). Lit un fichier de
; mission et en écrit une copie modifiée « instant » (ou « test ») : MISN, CAST, CAMP, PROG,
; PART, FPLN, WEAP, TEAM, PLAY, LOAD ; noms tirés au hasard (CRT_Rand, CRT_Itoa).
; ==============================================================================================
Gameflow_WriteInstantMission_CAEBB		proc far

var_312		= word ptr -312h
var_2C2		= word ptr -2C2h
var_27F		= word ptr -27Fh
var_27E		= word ptr -27Eh
var_272		= word ptr -272h
var_270		= word ptr -270h
var_260		= word ptr -260h
var_234		= word ptr -234h
var_1D7		= dword ptr -1D7h
var_1D3		= dword ptr -1D3h
var_1CF		= dword ptr -1CFh
var_1C7		= byte ptr -1C7h
var_1BE		= dword ptr -1BEh
var_18C		= word ptr -18Ch
var_13C		= word ptr -13Ch
var_DF		= dword ptr -0DFh
var_DB		= dword ptr -0DBh
var_D7		= dword ptr -0D7h
var_C2		= word ptr -0C2h
var_C0		= word ptr -0C0h
var_94		= word ptr -94h
var_44		= word ptr -44h
var_39		= byte ptr -39h
var_38		= word ptr -38h
var_36		= word ptr -36h
var_2C		= dword ptr -2Ch
var_28		= dword ptr -28h
var_24		= word ptr -24h
var_20		= word ptr -20h
var_1E		= word ptr -1Eh
var_1A		= word ptr -1Ah
var_18		= dword ptr -18h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_6		= word ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= byte ptr  0Ah
arg_6		= byte ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 312h
		push	si
		push	di
		mov	si, [bp+arg_0]
		xor	di, di
		jmp	short loc_CAED0

loc_CAECB:
		mov	byte ptr [bp+di+var_6], 0
		inc	di

loc_CAED0:
		cmp	di, 3
		jl	short loc_CAECB
		cmp	[bp+arg_6], 0
		jz	short loc_CAEF4
		push	51h
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	ds
		push	offset aInstant
		push	ds
		push	offset a__5
		jmp	short loc_CAF0B

loc_CAEF4:
		push	51h
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	ds
		push	offset aTest
		push	ds
		push	offset a__6

loc_CAF0B:
		lea	ax, [bp+var_94]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		lea	ax, [bp+var_13C]
		push	ax
		call	StreamReader_ConstructVariantA_6BF3A
		pop	cx
		mov	[bp+var_13C], 508h
		mov	[bp+var_DB], 100h
		mov	[bp+var_DF], 0
		mov	[bp+var_13C], 520h
		mov	[bp+var_C0], 0
		xor	ax, ax
		mov	[bp+var_C2], ax
		movsx	eax, ax
		mov	[bp+var_D7], eax
		mov	[bp+var_13C], 15AEh
		push	0
		lea	ax, [bp+var_94]
		push	ax
		lea	ax, [bp+var_13C]
		push	ax
		call	StreamReader_ReadDispatch_6C244
		add	sp, 6
		mov	al, 0
		cmp	byte ptr [si+290h], 0
		jz	short loc_CAF8E
		mov	ax, si
		add	ax, 290h
		push	ax
		mov	ax, word_7D14D
		add	ax, 7BAh
		push	ax
		call	CRT_Strcpy
		add	sp, 4

loc_CAF8E:
		push	5
		push	6996h
		call	sub_7562F
		add	sp, 4
		mov	word ptr [bp+var_A+2], dx
		mov	word ptr [bp+var_A], ax
		mov	ax, word_7D14D
		add	ax, 7BAh
		mov	word ptr [bp+var_E+2], ds
		mov	word ptr [bp+var_E], ax
		push	51h
		push	6996h
		call	sub_7562F
		add	sp, 4
		mov	[bp+var_10], dx
		mov	[bp+var_12], ax
		push	dx
		push	ax
		push	large [bp+var_E]
		push	large [bp+var_A]
		lea	ax, [bp+var_18C]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		lea	ax, [bp+var_234]
		push	ax
		call	StreamReader_ConstructVariantA_6BF3A
		pop	cx
		mov	[bp+var_234], 508h
		mov	[bp+var_1D3], 100h
		mov	[bp+var_1D7], 0
		mov	[bp+var_234], 520h
		push	1
		lea	ax, [bp+var_18C]
		push	ax
		lea	ax, [bp+var_234]
		push	ax
		mov	bx, [bp+var_234]
		call	dword ptr [bx+14h]
		add	sp, 6
		lea	ax, [bp+var_234]
		push	ax
		call	sub_6DC9A
		pop	cx
		push	large 0
		push	large 4E53494Dh
		lea	ax, [bp+var_13C]
		push	ax
		call	sub_766BA
		add	sp, 0Ah
		lea	ax, [bp+var_13C]
		push	ax
		call	sub_766BF
		pop	cx
		cmp	[bp+arg_4], 0
		jz	short loc_CB04B
		jmp	loc_CB429

loc_CB04B:
		lea	ax, [bp+var_234]
		push	ax
		push	large 54534143h
		lea	ax, [bp+var_13C]
		push	ax
		call	sub_7670A
		add	sp, 8
		push	0
		push	large 504D4143h
		lea	ax, [bp+var_234]
		push	ax
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		mov	eax, [bp+var_1CF]
		add	eax, 13h
		mov	[bp+var_18], eax
		mov	[bp+var_1CF], eax
		push	large 0Bh
		push	ss
		lea	ax, [bp+var_27E]
		push	ax
		lea	ax, [bp+var_234]
		push	ax
		call	ResourceRecord_ReadFieldGroupA_6DA92
		add	sp, 0Ah
		mov	eax, [bp+var_1BE]
		mov	[bp+var_1CF], eax
		mov	[bp+var_1C7], 0
		push	large 0
		push	large 54534143h
		lea	ax, [bp+var_13C]
		push	ax
		call	sub_766B5
		add	sp, 0Ah
		push	0
		push	large 54534143h
		lea	ax, [bp+var_234]
		push	ax
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		push	large 9
		lea	ax, [bp+var_234]
		push	ax
		call	ResourceRecord_RecordCount_6DDDF
		add	sp, 6
		mov	[bp+var_1A], ax
		sub	[bp+var_1A], 0Ch
		xor	di, di
		jmp	short loc_CB12B

loc_CB0F5:
		push	large 9
		push	ss
		lea	ax, [bp+var_24]
		push	ax
		lea	ax, [bp+var_234]
		push	ax
		call	ResourceRecord_ReadFieldGroupA_6DA92
		add	sp, 0Ah
		push	large [bp+var_D7]
		push	large 9
		push	ss
		lea	ax, [bp+var_24]
		push	ax
		lea	ax, [bp+var_13C]
		push	ax
		call	StreamReader_WriteTyped_6DFF7
		add	sp, 0Eh
		add	[bp+var_D7], 9
		inc	di

loc_CB12B:
		cmp	di, [bp+var_1A]
		jl	short loc_CB0F5
		mov	eax, [bp+var_1CF]
		mov	[bp+var_28], eax
		xor	di, di
		jmp	loc_CB222

loc_CB13E:
		push	large 9
		push	ss
		lea	ax, [bp+var_24]
		push	ax
		lea	ax, [bp+var_234]
		push	ax
		call	ResourceRecord_ReadFieldGroupA_6DA92
		add	sp, 0Ah
		push	4
		push	3B29h
		lea	ax, [bp+var_24]
		push	ax
		call	sub_2FAD
		add	sp, 6
		or	ax, ax
		jnz	short loc_CB16B
		jmp	loc_CB221

loc_CB16B:
		push	3B2Eh
		lea	ax, [bp+var_24]
		push	ax
		call	CRT_Strncmp_Like
		add	sp, 4
		or	ax, ax
		jnz	short loc_CB186
		mov	byte ptr [si+0CEh], 0
		jmp	loc_CB221

loc_CB186:
		push	3B32h
		lea	ax, [bp+var_24]
		push	ax
		call	CRT_Strncmp_Like
		add	sp, 4
		or	ax, ax
		jnz	short loc_CB1A1
		mov	byte ptr [si+0CAh], 0
		jmp	loc_CB221

loc_CB1A1:
		push	3B38h
		lea	ax, [bp+var_24]
		push	ax
		call	CRT_Strncmp_Like
		add	sp, 4
		or	ax, ax
		jnz	short loc_CB1BB
		mov	byte ptr [si+0CBh], 0
		jmp	short loc_CB221

loc_CB1BB:
		push	3B40h
		lea	ax, [bp+var_24]
		push	ax
		call	CRT_Strncmp_Like
		add	sp, 4
		or	ax, ax
		jnz	short loc_CB1D5
		mov	byte ptr [si+0CCh], 0
		jmp	short loc_CB221

loc_CB1D5:
		push	3B48h
		lea	ax, [bp+var_24]
		push	ax
		call	CRT_Strncmp_Like
		add	sp, 4
		or	ax, ax
		jnz	short loc_CB1EF
		mov	byte ptr [si+0CDh], 0
		jmp	short loc_CB221

loc_CB1EF:
		push	3B50h
		lea	ax, [bp+var_24]
		push	ax
		call	CRT_Strncmp_Like
		add	sp, 4
		or	ax, ax
		jnz	short loc_CB209
		mov	byte ptr [si+0CFh], 0
		jmp	short loc_CB221

loc_CB209:
		push	3B56h
		lea	ax, [bp+var_24]
		push	ax
		call	CRT_Strncmp_Like
		add	sp, 4
		or	ax, ax
		jnz	short loc_CB221
		mov	byte ptr [si+0D0h], 0

loc_CB221:
		inc	di

loc_CB222:
		cmp	di, 0Ch
		jge	short loc_CB22A
		jmp	loc_CB13E

loc_CB22A:
		mov	eax, [bp+var_28]
		mov	[bp+var_2C], eax
		mov	[bp+var_1CF], eax
		mov	byte ptr [si+0C8h], 0
		mov	byte ptr [si+0C9h], 0
		lea	ax, [bp+var_36]
		push	ss
		push	ax
		push	ds
		push	offset unk_7A218
		mov	cx, 0Ah
		call	CRT_Fmemcpy
		mov	[bp+var_38], 0
		jmp	loc_CB3AC

loc_CB25A:
		push	large 9
		push	ss
		lea	ax, [bp+var_24]
		push	ax
		lea	ax, [bp+var_234]
		push	ax
		call	ResourceRecord_ReadFieldGroupA_6DA92
		add	sp, 0Ah
		cmp	[bp+var_38], 0
		jg	short loc_CB278
		jmp	loc_CB389

loc_CB278:
		lea	ax, [bp+var_27F]
		mov	bx, [bp+var_38]
		add	bx, ax
		cmp	byte ptr [bx], 0
		jnz	short loc_CB289
		jmp	loc_CB389

loc_CB289:
		push	4
		push	3B5Ch
		lea	ax, [bp+var_24]
		push	ax
		call	sub_2FAD
		add	sp, 6
		or	ax, ax
		jz	short loc_CB2A1
		jmp	loc_CB350

loc_CB2A1:
		mov	[bp+var_39], 0
		push	si
		call	sub_75CC3
		pop	cx
		or	ax, ax
		jle	short loc_CB2D8
		push	si
		call	sub_75CC8
		pop	cx
		mov	dx, ax
		mov	bx, dx
		mov	byte ptr [bx+si+0C8h], 0
		imul	ax, ax, 14h
		mov	dx, si
		add	dx, ax
		push	dx
		lea	ax, [bp+var_24]
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		mov	[bp+var_39], 1

loc_CB2D8:
		mov	al, [bp+var_39]
		mov	ah, 0
		or	ax, ax
		jz	short loc_CB2E4
		jmp	loc_CB389

loc_CB2E4:
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, eax, 0Ah
		mov	ebx, 8000h
		cdq
		idiv	ebx
		mov	di, ax
		cmp	byte ptr [bp+di+var_36], 1
		jnz	short loc_CB31E
		xor	dx, dx
		jmp	short loc_CB319

loc_CB308:
		lea	ax, [bp+var_36]
		mov	bx, dx
		add	bx, ax
		cmp	byte ptr [bx], 0
		jnz	short loc_CB318
		mov	di, dx
		jmp	short loc_CB31E

loc_CB318:
		inc	dx

loc_CB319:
		cmp	dx, 0Ah
		jl	short loc_CB308

loc_CB31E:
		mov	byte ptr [bp+di+var_36], 1
		inc	di
		push	3B61h
		lea	ax, [bp+var_24]
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		push	0Ah
		lea	ax, [bp+var_44]
		push	ax
		push	di
		call	CRT_Itoa_Signed10
		add	sp, 6
		push	ax
		lea	ax, [bp+var_24]
		push	ax
		call	CRT_Strcat
		add	sp, 4
		jmp	short loc_CB389

loc_CB350:
		push	6
		push	large 3B66h
		lea	ax, [bp+var_24]
		push	ax
		call	sub_2FAD
		add	sp, 6
		or	ax, ax
		jnz	short loc_CB389
		push	si
		call	sub_75CC8
		pop	cx
		mov	di, ax
		imul	ax, ax, 14h
		mov	dx, si
		add	dx, ax
		push	dx
		lea	ax, [bp+var_24]
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		mov	bx, di
		mov	byte ptr [bx+si+0C8h], 0

loc_CB389:
		push	large [bp+var_D7]
		push	large 9
		push	ss
		lea	ax, [bp+var_24]
		push	ax
		lea	ax, [bp+var_13C]
		push	ax
		call	StreamReader_WriteTyped_6DFF7
		add	sp, 0Eh
		add	[bp+var_D7], 9
		inc	[bp+var_38]

loc_CB3AC:
		cmp	[bp+var_38], 0Ch
		jge	short loc_CB3B5
		jmp	loc_CB25A

loc_CB3B5:
		lea	ax, [bp+var_13C]
		push	ax
		call	sub_766D3
		pop	cx
		mov	eax, [bp+var_1BE]
		mov	[bp+var_1CF], eax
		mov	[bp+var_1C7], 0
		push	large 0
		push	large 474F5250h
		lea	ax, [bp+var_13C]
		push	ax
		call	sub_766B5
		add	sp, 0Ah
		push	0
		push	large 474F5250h
		lea	ax, [bp+var_234]
		push	ax
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		lea	ax, [bp+var_234]
		push	ax
		lea	ax, [bp+var_13C]
		push	ax
		call	sub_766E7
		add	sp, 4
		lea	ax, [bp+var_13C]
		push	ax
		call	sub_766D3
		pop	cx
		mov	eax, [bp+var_1BE]
		mov	[bp+var_1CF], eax
		mov	[bp+var_1C7], 0
		jmp	loc_CB7A9

loc_CB429:
		push	large 47h
		call	GameVar_Set_564BB
		add	sp, 4
		lea	ax, [bp+var_234]
		push	ax
		push	large 54534143h
		lea	ax, [bp+var_13C]
		push	ax
		call	sub_7670A
		add	sp, 8
		push	large 0
		push	large 54534143h
		lea	ax, [bp+var_13C]
		push	ax
		call	sub_766B5
		add	sp, 0Ah
		push	0
		push	large 54534143h
		lea	ax, [bp+var_234]
		push	ax
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		push	large 9
		lea	ax, [bp+var_234]
		push	ax
		call	ResourceRecord_RecordCount_6DDDF
		add	sp, 6
		mov	di, ax
		sub	di, 0Ch
		mov	[bp+var_20], 0
		jmp	short loc_CB4CB

loc_CB493:
		push	large 9
		push	ss
		lea	ax, [bp+var_1E]
		push	ax
		lea	ax, [bp+var_234]
		push	ax
		call	ResourceRecord_ReadFieldGroupA_6DA92
		add	sp, 0Ah
		push	large [bp+var_D7]
		push	large 9
		push	ss
		lea	ax, [bp+var_1E]
		push	ax
		lea	ax, [bp+var_13C]
		push	ax
		call	StreamReader_WriteTyped_6DFF7
		add	sp, 0Eh
		add	[bp+var_D7], 9
		inc	[bp+var_20]

loc_CB4CB:
		cmp	[bp+var_20], di
		jl	short loc_CB493
		mov	di, 3Ch
		jmp	short loc_CB4E1

loc_CB4D5:
		push	0
		push	di
		call	GameVar_Set_564BB
		add	sp, 4
		inc	di

loc_CB4E1:
		cmp	di, 47h
		jle	short loc_CB4D5
		lea	ax, word ptr [bp+var_2C+2]
		push	ss
		push	ax
		push	ds
		push	offset unk_7A222
		mov	cx, 0Ah
		call	CRT_Fmemcpy
		mov	[bp+var_2], 0
		jmp	loc_CB721

loc_CB4FF:
		cmp	[bp+var_2], 0
		jnz	short loc_CB52D
		cmp	byte ptr [si+28Dh], 0
		jz	short loc_CB52D
		mov	dx, [si+28Eh]
		or	dx, dx
		jl	short loc_CB51F
		cmp	dx, 3
		jge	short loc_CB51F
		mov	[si+28Bh], dx
		jmp	short loc_CB51F

loc_CB51F:
		mov	bx, [si+28Eh]
		lea	ax, [bp+var_6]
		add	bx, ax
		mov	byte ptr [bx], 1
		jmp	short loc_CB560

loc_CB52D:
		xor	di, di
		jmp	short loc_CB532

loc_CB531:
		inc	di

loc_CB532:
		cmp	byte ptr [bp+di+var_6], 0
		jz	short loc_CB53D
		cmp	di, 3
		jl	short loc_CB531

loc_CB53D:
		cmp	di, 3
		jl	short loc_CB54B
		push	0B0B0h
		call	sub_1DDFE
		pop	cx

loc_CB54B:
		mov	dx, di
		or	dx, dx
		jl	short loc_CB55C
		cmp	dx, 3
		jge	short loc_CB55C
		mov	[si+28Bh], dx
		jmp	short loc_CB55C

loc_CB55C:
		mov	byte ptr [bp+di+var_6], 1

loc_CB560:
		mov	di, 1
		jmp	loc_CB6E3

loc_CB566:
		push	large 9
		push	ss
		lea	ax, [bp+var_1E]
		push	ax
		lea	ax, [bp+var_234]
		push	ax
		call	ResourceRecord_ReadFieldGroupA_6DA92
		add	sp, 0Ah
		mov	bx, [si+28Bh]
		shl	bx, 1
		cmp	[bx+si+27Fh], di
		jge	short loc_CB58A
		jmp	loc_CB6C2

loc_CB58A:
		cmp	[bp+var_2], 0
		jnz	short loc_CB598
		cmp	di, 1
		jnz	short loc_CB598
		jmp	loc_CB6B6

loc_CB598:
		or	di, di
		jle	short loc_CB5B8
		cmp	di, 5
		jge	short loc_CB5B8
		mov	ax, [si+28Bh]
		imul	ax, ax, 0Ah
		mov	bx, si
		add	bx, ax
		mov	ax, di
		shl	ax, 1
		add	bx, ax
		mov	ax, [bx+252h]
		jmp	short loc_CB5BB

loc_CB5B8:
		mov	ax, 1

loc_CB5BB:
		cmp	ax, 1
		jz	short loc_CB5C3
		jmp	loc_CB643

loc_CB5C3:
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, eax, 0Ah
		mov	ebx, 8000h
		cdq
		idiv	ebx
		mov	word ptr [bp+var_2C], ax
		lea	ax, word ptr [bp+var_2C+2]
		mov	bx, word ptr [bp+var_2C]
		add	bx, ax
		cmp	byte ptr [bx], 1
		jnz	short loc_CB606
		xor	dx, dx
		jmp	short loc_CB601

loc_CB5EF:
		lea	ax, word ptr [bp+var_2C+2]
		mov	bx, dx
		add	bx, ax
		cmp	byte ptr [bx], 0
		jnz	short loc_CB600
		mov	word ptr [bp+var_2C], dx
		jmp	short loc_CB606

loc_CB600:
		inc	dx

loc_CB601:
		cmp	dx, 0Ah
		jl	short loc_CB5EF

loc_CB606:
		lea	ax, word ptr [bp+var_2C+2]
		mov	bx, word ptr [bp+var_2C]
		add	bx, ax
		mov	byte ptr [bx], 1
		inc	word ptr [bp+var_2C]
		push	3B6Dh
		lea	ax, [bp+var_1E]
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		push	0Ah
		lea	ax, [bp+var_36]
		push	ax
		push	word ptr [bp+var_2C]
		call	CRT_Itoa_Signed10
		add	sp, 6
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	CRT_Strcat
		add	sp, 4
		jmp	short loc_CB66E

loc_CB643:
		push	8
		mov	ax, [si+28Bh]
		imul	ax, ax, 0Ah
		mov	bx, si
		add	bx, ax
		mov	ax, di
		shl	ax, 1
		add	bx, ax
		mov	ax, [bx+252h]
		imul	ax, ax, 14h
		mov	dx, si
		add	dx, ax
		push	dx
		lea	ax, [bp+var_1E]
		push	ax
		call	CRT_Strncpy_Pad
		add	sp, 6

loc_CB66E:
		xor	dx, dx
		mov	bx, [si+28Bh]
		shl	bx, 1
		mov	bx, [bx+si+285h]
		inc	bx
		dec	bx
		cmp	bx, 7
		ja	short loc_CB695
		shl	bx, 1
		jmp	cs:off_CBBD2[bx]	; switch jump

loc_CB688:
		mov	dx, 1
		jmp	short loc_CB695

loc_CB68D:
		mov	dx, 3
		jmp	short loc_CB695

loc_CB692:
		mov	dx, 2

loc_CB695:
		push	dx
		mov	ax, [bp+var_2]
		shl	ax, 2
		add	ax, di
		add	ax, 3Ah
		push	ax
		call	GameVar_Set_564BB
		add	sp, 4
		push	47h
		call	GameVar_Get_56414
		pop	cx
		inc	ax
		push	ax
		jmp	short loc_CB6B8

loc_CB6B6:
		push	1

loc_CB6B8:
		push	47h
		call	GameVar_Set_564BB
		add	sp, 4

loc_CB6C2:
		push	large [bp+var_D7]
		push	large 9
		push	ss
		lea	ax, [bp+var_1E]
		push	ax
		lea	ax, [bp+var_13C]
		push	ax
		call	StreamReader_WriteTyped_6DFF7
		add	sp, 0Eh
		add	[bp+var_D7], 9
		inc	di

loc_CB6E3:
		cmp	di, 4
		jg	short loc_CB6EB
		jmp	loc_CB566

loc_CB6EB:
		mov	ax, [si+24Ch]
		inc	ax
		push	ax
		push	96h
		call	GameVar_Set_564BB
		add	sp, 4
		mov	ax, [si+24Eh]
		inc	ax
		push	ax
		push	97h
		call	GameVar_Set_564BB
		add	sp, 4
		mov	ax, [si+250h]
		inc	ax
		push	ax
		push	98h
		call	GameVar_Set_564BB
		add	sp, 4
		inc	[bp+var_2]

loc_CB721:
		cmp	[bp+var_2], 3
		jge	short loc_CB72A
		jmp	loc_CB4FF

loc_CB72A:
		lea	ax, [bp+var_13C]
		push	ax
		call	sub_766D3
		pop	cx
		mov	eax, [bp+var_1BE]
		mov	[bp+var_1CF], eax
		mov	[bp+var_1C7], 0
		push	large 0
		push	large 474F5250h
		lea	ax, [bp+var_13C]
		push	ax
		call	sub_766B5
		add	sp, 0Ah
		push	0
		push	large 474F5250h
		lea	ax, [bp+var_234]
		push	ax
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		lea	ax, [bp+var_234]
		push	ax
		lea	ax, [bp+var_13C]
		push	ax
		call	sub_766E7
		add	sp, 4
		lea	ax, [bp+var_13C]
		push	ax
		call	sub_766D3
		pop	cx
		mov	eax, [bp+var_1BE]
		mov	[bp+var_1CF], eax
		mov	[bp+var_1C7], 0
		xor	di, di
		jmp	short loc_CB7A4

loc_CB79F:
		mov	byte ptr [bp+di+var_6], 0
		inc	di

loc_CB7A4:
		cmp	di, 3
		jl	short loc_CB79F

loc_CB7A9:
		push	large 0
		push	large 54524150h
		lea	ax, [bp+var_13C]
		push	ax
		call	sub_766B5
		add	sp, 0Ah
		push	0
		push	large 54524150h
		lea	ax, [bp+var_234]
		push	ax
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		push	large 3Eh
		lea	ax, [bp+var_234]
		push	ax
		call	ResourceRecord_RecordCount_6DDDF
		add	sp, 6
		mov	di, ax
		sub	di, 0Ch
		mov	[bp+var_14], 1
		jmp	short loc_CB82A

loc_CB7F0:
		push	large 3Eh
		push	ss
		lea	ax, [bp+var_272]
		push	ax
		lea	ax, [bp+var_234]
		push	ax
		call	ResourceRecord_ReadFieldGroupA_6DA92
		add	sp, 0Ah
		push	large [bp+var_D7]
		push	large 3Eh
		push	ss
		lea	ax, [bp+var_272]
		push	ax
		lea	ax, [bp+var_13C]
		push	ax
		call	StreamReader_WriteTyped_6DFF7
		add	sp, 0Eh
		add	[bp+var_D7], 3Eh
		inc	[bp+var_14]

loc_CB82A:
		cmp	[bp+var_14], di
		jle	short loc_CB7F0
		cmp	[bp+arg_4], 0
		jz	short loc_CB838
		jmp	loc_CB8C3

loc_CB838:
		push	large 3Eh
		push	ss
		lea	ax, [bp+var_272]
		push	ax
		lea	ax, [bp+var_234]
		push	ax
		call	ResourceRecord_ReadFieldGroupA_6DA92
		add	sp, 0Ah
		push	[bp+arg_2]
		lea	ax, [bp+var_270]
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		push	large [bp+var_D7]
		push	large 3Eh
		push	ss
		lea	ax, [bp+var_272]
		push	ax
		lea	ax, [bp+var_13C]
		push	ax
		call	StreamReader_WriteTyped_6DFF7
		add	sp, 0Eh
		add	[bp+var_D7], 3Eh
		xor	si, si
		jmp	short loc_CB8BB

loc_CB883:
		push	large 3Eh
		push	ss
		lea	ax, [bp+var_272]
		push	ax
		lea	ax, [bp+var_234]
		push	ax
		call	ResourceRecord_ReadFieldGroupA_6DA92
		add	sp, 0Ah
		push	large [bp+var_D7]
		push	large 3Eh
		push	ss
		lea	ax, [bp+var_272]
		push	ax
		lea	ax, [bp+var_13C]
		push	ax
		call	StreamReader_WriteTyped_6DFF7
		add	sp, 0Eh
		add	[bp+var_D7], 3Eh
		inc	si

loc_CB8BB:
		cmp	si, 0Bh
		jl	short loc_CB883
		jmp	loc_CBA36

loc_CB8C3:
		lea	ax, [bp+var_312]
		push	ax
		push	large 4E4C5046h
		call	sub_75910
		add	sp, 6
		lea	ax, [bp+var_2C2]
		push	ax
		push	large 50414557h
		call	sub_75910
		add	sp, 6
		mov	word ptr [bp+var_18+2], 0
		jmp	loc_CBA2D

loc_CB8F1:
		cmp	word ptr [bp+var_18+2], 0
		jnz	short loc_CB91F
		cmp	byte ptr [si+28Dh], 0
		jz	short loc_CB91F
		mov	dx, [si+28Eh]
		or	dx, dx
		jl	short loc_CB911
		cmp	dx, 3
		jge	short loc_CB911
		mov	[si+28Bh], dx
		jmp	short loc_CB911

loc_CB911:
		mov	bx, [si+28Eh]
		lea	ax, [bp+var_6]
		add	bx, ax
		mov	byte ptr [bx], 1
		jmp	short loc_CB952

loc_CB91F:
		xor	di, di
		jmp	short loc_CB924

loc_CB923:
		inc	di

loc_CB924:
		cmp	byte ptr [bp+di+var_6], 0
		jz	short loc_CB92F
		cmp	di, 3
		jl	short loc_CB923

loc_CB92F:
		cmp	di, 3
		jl	short loc_CB93D
		push	0B0B0h
		call	sub_1DDFE
		pop	cx

loc_CB93D:
		mov	dx, di
		or	dx, dx
		jl	short loc_CB94E
		cmp	dx, 3
		jge	short loc_CB94E
		mov	[si+28Bh], dx
		jmp	short loc_CB94E

loc_CB94E:
		mov	byte ptr [bp+di+var_6], 1

loc_CB952:
		xor	di, di
		jmp	loc_CBA22

loc_CB957:
		push	large 3Eh
		push	ss
		lea	ax, [bp+var_272]
		push	ax
		lea	ax, [bp+var_234]
		push	ax
		call	ResourceRecord_ReadFieldGroupA_6DA92
		add	sp, 0Ah
		mov	bx, [si+28Bh]
		shl	bx, 1
		cmp	[bx+si+27Fh], di
		jg	short loc_CB97C
		jmp	loc_CBA00

loc_CB97C:
		cmp	word ptr [bp+var_18+2], 0
		jnz	short loc_CB98D
		or	di, di
		jnz	short loc_CB98D
		push	8
		push	[bp+arg_2]
		jmp	short loc_CB9A3

loc_CB98D:
		push	8
		mov	bx, [si+28Bh]
		shl	bx, 1
		mov	ax, [bx+si+24Ch]
		shl	ax, 3
		lea	dx, [bp+var_312]
		add	ax, dx
		push	ax

loc_CB9A3:
		lea	ax, [bp+var_270]
		push	ax
		call	CRT_Strncpy_Pad
		add	sp, 6
		push	8
		mov	bx, [si+28Bh]
		shl	bx, 1
		mov	ax, [bx+si+24Ch]
		shl	ax, 3
		lea	dx, [bp+var_2C2]
		add	ax, dx
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	CRT_Strncpy_Pad
		add	sp, 6
		mov	bx, [si+28Bh]
		shl	bx, 1
		push	word ptr [bx+si+285h]
		lea	ax, [bp+var_1E]
		mov	[bp+var_20], ax
		lea	ax, [bp+var_20]
		push	ax
		push	cs
		call	near ptr sub_CAE2F
		add	sp, 4
		push	8
		lea	ax, [bp+var_1E]
		push	ax
		lea	ax, [bp+var_260]
		push	ax
		call	CRT_Strncpy_Pad
		add	sp, 6

loc_CBA00:
		push	large [bp+var_D7]
		push	large 3Eh
		push	ss
		lea	ax, [bp+var_272]
		push	ax
		lea	ax, [bp+var_13C]
		push	ax
		call	StreamReader_WriteTyped_6DFF7
		add	sp, 0Eh
		add	[bp+var_D7], 3Eh
		inc	di

loc_CBA22:
		cmp	di, 4
		jge	short loc_CBA2A
		jmp	loc_CB957

loc_CBA2A:
		inc	word ptr [bp+var_18+2]

loc_CBA2D:
		cmp	word ptr [bp+var_18+2], 3
		jge	short loc_CBA36
		jmp	loc_CB8F1

loc_CBA36:
		lea	ax, [bp+var_13C]
		push	ax
		call	sub_766D3
		pop	cx
		mov	eax, [bp+var_1BE]
		mov	[bp+var_1CF], eax
		mov	[bp+var_1C7], 0
		push	large 0
		push	large 4D414554h
		lea	ax, [bp+var_13C]
		push	ax
		call	sub_766B5
		add	sp, 0Ah
		push	0
		push	large 4D414554h
		lea	ax, [bp+var_234]
		push	ax
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		lea	ax, [bp+var_234]
		push	ax
		lea	ax, [bp+var_13C]
		push	ax
		call	sub_766E7
		add	sp, 4
		lea	ax, [bp+var_13C]
		push	ax
		call	sub_766D3
		pop	cx
		mov	eax, [bp+var_1BE]
		mov	[bp+var_1CF], eax
		mov	[bp+var_1C7], 0
		push	large 0
		push	large 59414C50h
		lea	ax, [bp+var_13C]
		push	ax
		call	sub_766BA
		add	sp, 0Ah
		lea	ax, [bp+var_13C]
		push	ax
		call	sub_766BF
		pop	cx
		push	0
		push	large 59414C50h
		lea	ax, [bp+var_234]
		push	ax
		call	ResourceRecord_SeekAndReadB_6D82B
		add	sp, 8
		lea	ax, [bp+var_234]
		push	ax
		push	large 44414F4Ch
		lea	ax, [bp+var_13C]
		push	ax
		call	sub_7670A
		add	sp, 8
		lea	ax, [bp+var_13C]
		push	ax
		call	sub_766C9
		pop	cx
		lea	ax, [bp+var_234]
		push	ax
		call	ResourceRecord_ReleaseAndClear_6DD9E
		pop	cx
		push	large 0
		push	large 44414F4Ch
		lea	ax, [bp+var_13C]
		push	ax
		call	sub_766B5
		add	sp, 0Ah
		push	0
		push	large 44414F4Ch
		lea	ax, [bp+var_234]
		push	ax
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		lea	ax, [bp+var_234]
		push	ax
		lea	ax, [bp+var_13C]
		push	ax
		call	sub_766E7
		add	sp, 4
		lea	ax, [bp+var_13C]
		push	ax
		call	sub_766D3
		pop	cx
		mov	eax, [bp+var_1BE]
		mov	[bp+var_1CF], eax
		mov	[bp+var_1C7], 0
		lea	ax, [bp+var_13C]
		push	ax
		call	sub_766C9
		pop	cx
		lea	ax, [bp+var_234]
		push	ax
		call	ResourceRecord_ReleaseAndClear_6DD9E
		pop	cx
		lea	ax, [bp+var_13C]
		push	ax
		call	sub_766D8
		pop	cx
		lea	ax, [bp+var_234]
		push	ax
		call	ResourceRecord_Helper_6D61E
		pop	cx
		mov	[bp+var_234], 520h
		lea	ax, [bp+var_234]
		push	ax
		call	ResourceRecord_Helper_6D61E
		pop	cx
		push	0
		lea	ax, [bp+var_234]
		push	ax
		call	StreamReader_ReleaseBuffer_6DFAB
		add	sp, 4
		mov	[bp+var_13C], 520h
		lea	ax, [bp+var_13C]
		push	ax
		call	ResourceRecord_Helper_6D61E
		pop	cx
		push	0
		lea	ax, [bp+var_13C]
		push	ax
		call	StreamReader_ReleaseBuffer_6DFAB
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
Gameflow_WriteInstantMission_CAEBB		endp

; START OF FUNCTION CHUNK FOR Gameflow_WriteInstantMission_CAEBB
off_CBBD2	dw offset loc_CB688
		dw offset loc_CB68D
		dw offset loc_CB68D
		dw offset loc_CB692
		dw offset loc_CB688
		dw offset loc_CB68D
		dw offset loc_CB68D
		dw offset loc_CB692
; END OF FUNCTION CHUNK FOR Gameflow_WriteInstantMission_CAEBB

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_CBBE2		proc far

var_50		= word ptr -50h
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 50h
		push	si
		push	di
		mov	di, [bp+arg_0]
		mov	si, [bp+arg_2]
		push	seg seg008
		push	offset loc_5E05
		lea	ax, [bp+var_50]
		push	ax
		call	sub_54BE
		add	sp, 6
		push	large 0A00F6h
		lea	ax, [bp+var_50]
		push	ax
		push	di
		call	sub_75D4A
		add	sp, 8
		push	seg seg008
		push	offset loc_5E40
		lea	ax, [bp+var_50]
		push	ax
		call	sub_54BE
		add	sp, 6
		mov	ax, [si+28Bh]
		inc	ax
		push	ax
		push	large 1200D7h
		lea	ax, [bp+var_50]
		push	ax
		push	di
		call	sub_75D4A
		add	sp, 0Ah
		push	seg seg008
		push	offset loc_5E10
		lea	ax, [bp+var_50]
		push	ax
		call	sub_54BE
		add	sp, 6
		push	large 1A00F6h
		lea	ax, [bp+var_50]
		push	ax
		push	di
		call	sub_75D4A
		add	sp, 8
		push	seg seg008
		push	offset loc_5E47
		lea	ax, [bp+var_50]
		push	ax
		call	sub_54BE
		add	sp, 6
		mov	bx, [si+28Bh]
		shl	bx, 1
		mov	ax, [bx+si+24Ch]
		imul	ax, ax, 14h
		mov	dx, si
		add	dx, ax
		add	dx, 0D2h
		push	dx
		push	large 2200D7h
		lea	ax, [bp+var_50]
		push	ax
		push	di
		call	sub_75D4A
		add	sp, 0Ah
		push	seg seg008
		push	offset loc_5E1A
		lea	ax, [bp+var_50]
		push	ax
		call	sub_54BE
		add	sp, 6
		push	large 2A00F1h
		lea	ax, [bp+var_50]
		push	ax
		push	di
		call	sub_75D4A
		add	sp, 8
		push	seg seg008
		push	offset loc_5E40
		lea	ax, [bp+var_50]
		push	ax
		call	sub_54BE
		add	sp, 6
		mov	bx, [si+28Bh]
		shl	bx, 1
		push	word ptr [bx+si+27Fh]
		push	large 3200D7h
		lea	ax, [bp+var_50]
		push	ax
		push	di
		call	sub_75D4A
		add	sp, 0Ah
		mov	bx, [si+28Bh]
		shl	bx, 1
		mov	ax, [bx+si+24Ch]
		add	ax, 0A0h
		push	ax
		call	GameVar_Get_56414
		pop	cx
		push	ax
		push	large 4D00D7h
		push	3B72h
		push	di
		call	sub_75D4A
		add	sp, 0Ah
		mov	ax, [si+27Fh]
		add	ax, [si+281h]
		add	ax, [si+283h]
		mov	dx, 6
		sub	dx, ax
		push	dx
		push	large 5700D7h
		push	3B8Ch
		push	di
		call	sub_75D4A
		add	sp, 0Ah
		mov	bx, [si+28Bh]
		shl	bx, 1
		cmp	word ptr [bx+si+27Fh], 0
		jg	short loc_CBD4F
		jmp	loc_CBF42

loc_CBD4F:
		push	seg seg008
		push	offset loc_5E28
		lea	ax, [bp+var_50]
		push	ax
		call	sub_54BE
		add	sp, 6
		push	large 3A00F5h
		lea	ax, [bp+var_50]
		push	ax
		push	di
		call	sub_75D4A
		add	sp, 8
		push	seg seg008
		push	offset loc_5E47
		lea	ax, [bp+var_50]
		push	ax
		call	sub_54BE
		add	sp, 6
		mov	bx, [si+28Bh]
		shl	bx, 1
		mov	ax, [bx+si+285h]
		imul	ax, ax, 14h
		mov	dx, si
		add	dx, ax
		add	dx, 1A4h
		push	dx
		push	large 4200D7h
		lea	ax, [bp+var_50]
		push	ax
		push	di
		call	sub_75D4A
		add	sp, 0Ah
		push	seg seg008
		push	offset loc_5E36
		lea	ax, [bp+var_50]
		push	ax
		call	sub_54BE
		add	sp, 6
		push	large 6400F6h
		lea	ax, [bp+var_50]
		push	ax
		push	di
		call	sub_75D4A
		add	sp, 8
		push	seg seg008
		push	offset loc_5E47
		lea	ax, [bp+var_50]
		push	ax
		call	sub_54BE
		add	sp, 6
		mov	bx, [si+28Bh]
		imul	bx, bx, 0Ah
		mov	ax, [bx+si+254h]
		imul	ax, ax, 14h
		mov	dx, si
		add	dx, ax
		push	dx
		push	large 6E00D7h
		lea	ax, [bp+var_50]
		push	ax
		push	di
		call	sub_75D4A
		add	sp, 0Ah
		mov	bx, [si+28Bh]
		shl	bx, 1
		mov	ax, [bx+si+27Fh]
		cmp	ax, 2
		jnz	short loc_CBE1E
		jmp	loc_CBEE5

loc_CBE1E:
		cmp	ax, 3
		jz	short loc_CBE88
		cmp	ax, 4
		jz	short loc_CBE2B
		jmp	loc_CBF42

loc_CBE2B:
		push	seg seg008
		push	offset loc_5E36
		lea	ax, [bp+var_50]
		push	ax
		call	sub_54BE
		add	sp, 6
		push	large 0AF00F6h
		lea	ax, [bp+var_50]
		push	ax
		push	di
		call	sub_75D4A
		add	sp, 8
		push	seg seg008
		push	offset loc_5E47
		lea	ax, [bp+var_50]
		push	ax
		call	sub_54BE
		add	sp, 6
		mov	bx, [si+28Bh]
		imul	bx, bx, 0Ah
		mov	ax, [bx+si+25Ah]
		imul	ax, ax, 14h
		mov	dx, si
		add	dx, ax
		push	dx
		push	large 0B900D7h
		lea	ax, [bp+var_50]
		push	ax
		push	di
		call	sub_75D4A
		add	sp, 0Ah

loc_CBE88:
		push	seg seg008
		push	offset loc_5E36
		lea	ax, [bp+var_50]
		push	ax
		call	sub_54BE
		add	sp, 6
		push	large 9600F6h
		lea	ax, [bp+var_50]
		push	ax
		push	di
		call	sub_75D4A
		add	sp, 8
		push	seg seg008
		push	offset loc_5E47
		lea	ax, [bp+var_50]
		push	ax
		call	sub_54BE
		add	sp, 6
		mov	bx, [si+28Bh]
		imul	bx, bx, 0Ah
		mov	ax, [bx+si+258h]
		imul	ax, ax, 14h
		mov	dx, si
		add	dx, ax
		push	dx
		push	large 0A000D7h
		lea	ax, [bp+var_50]
		push	ax
		push	di
		call	sub_75D4A
		add	sp, 0Ah

loc_CBEE5:
		push	seg seg008
		push	offset loc_5E36
		lea	ax, [bp+var_50]
		push	ax
		call	sub_54BE
		add	sp, 6
		push	large 7D00F6h
		lea	ax, [bp+var_50]
		push	ax
		push	di
		call	sub_75D4A
		add	sp, 8
		push	seg seg008
		push	offset loc_5E47
		lea	ax, [bp+var_50]
		push	ax
		call	sub_54BE
		add	sp, 6
		mov	bx, [si+28Bh]
		imul	bx, bx, 0Ah
		mov	ax, [bx+si+256h]
		imul	ax, ax, 14h
		mov	dx, si
		add	dx, ax
		push	dx
		push	large 8700D7h
		lea	ax, [bp+var_50]
		push	ax
		push	di
		call	sub_75D4A
		add	sp, 0Ah

loc_CBF42:
		pop	di
		pop	si
		leave
		retf
sub_CBBE2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_CBF46		proc far

var_50		= word ptr -50h
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 50h
		push	si
		push	di
		mov	di, [bp+arg_0]
		mov	si, [bp+arg_2]
		push	seg seg008
		push	offset loc_5E05
		lea	ax, [bp+var_50]
		push	ax
		call	sub_54BE
		add	sp, 6
		push	large 0A00F6h
		lea	ax, [bp+var_50]
		push	ax
		push	di
		call	sub_75D4A
		add	sp, 8
		push	seg seg008
		push	offset loc_5E40
		lea	ax, [bp+var_50]
		push	ax
		call	sub_54BE
		add	sp, 6
		mov	ax, [si+470h]
		inc	ax
		push	ax
		push	large 1200D7h
		lea	ax, [bp+var_50]
		push	ax
		push	di
		call	sub_75D4A
		add	sp, 0Ah
		push	seg seg008
		push	offset loc_5E10
		lea	ax, [bp+var_50]
		push	ax
		call	sub_54BE
		add	sp, 6
		push	large 1A00F6h
		lea	ax, [bp+var_50]
		push	ax
		push	di
		call	sub_75D4A
		add	sp, 8
		push	seg seg008
		push	offset loc_5E47
		lea	ax, [bp+var_50]
		push	ax
		call	sub_54BE
		add	sp, 6
		mov	bx, [si+470h]
		shl	bx, 1
		cmp	word ptr [bx+si+440h], 0Ah
		jl	short loc_CC003
		mov	bx, [si+470h]
		shl	bx, 1
		mov	ax, [bx+si+440h]
		add	ax, 0FFF6h
		imul	ax, ax, 14h
		push	ax
		mov	ax, si
		pop	dx
		add	ax, dx
		add	ax, 299h
		jmp	short loc_CC019

loc_CC003:
		mov	bx, [si+470h]
		shl	bx, 1
		mov	ax, [bx+si+440h]
		imul	ax, ax, 14h
		push	ax
		mov	ax, si
		pop	dx
		add	ax, dx
		add	ax, 0D2h

loc_CC019:
		push	ax
		push	large 2200D7h
		lea	ax, [bp+var_50]
		push	ax
		push	di
		call	sub_75D4A
		add	sp, 0Ah
		push	seg seg008
		push	offset loc_5E1A
		lea	ax, [bp+var_50]
		push	ax
		call	sub_54BE
		add	sp, 6
		push	large 2A00F1h
		lea	ax, [bp+var_50]
		push	ax
		push	di
		call	sub_75D4A
		add	sp, 8
		push	seg seg008
		push	offset loc_5E40
		lea	ax, [bp+var_50]
		push	ax
		call	sub_54BE
		add	sp, 6
		mov	bx, [si+470h]
		shl	bx, 1
		push	word ptr [bx+si+446h]
		push	large 3200D7h
		lea	ax, [bp+var_50]
		push	ax
		push	di
		call	sub_75D4A
		add	sp, 0Ah
		mov	bx, [si+470h]
		shl	bx, 1
		cmp	word ptr [bx+si+446h], 0
		jg	short loc_CC091
		jmp	loc_CC294

loc_CC091:
		push	seg seg008
		push	offset loc_5E28
		lea	ax, [bp+var_50]
		push	ax
		call	sub_54BE
		add	sp, 6
		push	large 3A00F5h
		lea	ax, [bp+var_50]
		push	ax
		push	di
		call	sub_75D4A
		add	sp, 8
		push	seg seg008
		push	offset loc_5E47
		lea	ax, [bp+var_50]
		push	ax
		call	sub_54BE
		add	sp, 6
		mov	bx, [si+470h]
		shl	bx, 1
		mov	ax, [bx+si+46Ah]
		imul	ax, ax, 14h
		mov	dx, si
		add	dx, ax
		add	dx, 401h
		push	dx
		push	large 4200D7h
		lea	ax, [bp+var_50]
		push	ax
		push	di
		call	sub_75D4A
		add	sp, 0Ah
		push	seg seg008
		push	offset loc_5E36
		lea	ax, [bp+var_50]
		push	ax
		call	sub_54BE
		add	sp, 6
		push	large 6400F6h
		lea	ax, [bp+var_50]
		push	ax
		push	di
		call	sub_75D4A
		add	sp, 8
		push	seg seg008
		push	offset loc_5E47
		lea	ax, [bp+var_50]
		push	ax
		call	sub_54BE
		add	sp, 6
		mov	bx, [si+470h]
		imul	bx, bx, 0Ah
		mov	ax, [bx+si+44Eh]
		imul	ax, ax, 14h
		mov	dx, si
		add	dx, ax
		add	dx, 3C5h
		push	dx
		push	large 6E00D7h
		lea	ax, [bp+var_50]
		push	ax
		push	di
		call	sub_75D4A
		add	sp, 0Ah
		mov	bx, [si+470h]
		shl	bx, 1
		mov	ax, [bx+si+446h]
		cmp	ax, 2
		jnz	short loc_CC164
		jmp	loc_CC233

loc_CC164:
		cmp	ax, 3
		jz	short loc_CC1D2
		cmp	ax, 4
		jz	short loc_CC171
		jmp	loc_CC294

loc_CC171:
		push	seg seg008
		push	offset loc_5E36
		lea	ax, [bp+var_50]
		push	ax
		call	sub_54BE
		add	sp, 6
		push	large 0AF00F6h
		lea	ax, [bp+var_50]
		push	ax
		push	di
		call	sub_75D4A
		add	sp, 8
		push	seg seg008
		push	offset loc_5E47
		lea	ax, [bp+var_50]
		push	ax
		call	sub_54BE
		add	sp, 6
		mov	bx, [si+470h]
		imul	bx, bx, 0Ah
		mov	ax, [bx+si+454h]
		imul	ax, ax, 14h
		mov	dx, si
		add	dx, ax
		add	dx, 3C5h
		push	dx
		push	large 0B900D7h
		lea	ax, [bp+var_50]
		push	ax
		push	di
		call	sub_75D4A
		add	sp, 0Ah

loc_CC1D2:
		push	seg seg008
		push	offset loc_5E36
		lea	ax, [bp+var_50]
		push	ax
		call	sub_54BE
		add	sp, 6
		push	large 9600F6h
		lea	ax, [bp+var_50]
		push	ax
		push	di
		call	sub_75D4A
		add	sp, 8
		push	seg seg008
		push	offset loc_5E47
		lea	ax, [bp+var_50]
		push	ax
		call	sub_54BE
		add	sp, 6
		mov	bx, [si+470h]
		imul	bx, bx, 0Ah
		mov	ax, [bx+si+452h]
		imul	ax, ax, 14h
		mov	dx, si
		add	dx, ax
		add	dx, 3C5h
		push	dx
		push	large 0A000D7h
		lea	ax, [bp+var_50]
		push	ax
		push	di
		call	sub_75D4A
		add	sp, 0Ah

loc_CC233:
		push	seg seg008
		push	offset loc_5E36
		lea	ax, [bp+var_50]
		push	ax
		call	sub_54BE
		add	sp, 6
		push	large 7D00F6h
		lea	ax, [bp+var_50]
		push	ax
		push	di
		call	sub_75D4A
		add	sp, 8
		push	seg seg008
		push	offset loc_5E47
		lea	ax, [bp+var_50]
		push	ax
		call	sub_54BE
		add	sp, 6
		mov	bx, [si+470h]
		imul	bx, bx, 0Ah
		mov	ax, [bx+si+450h]
		imul	ax, ax, 14h
		mov	dx, si
		add	dx, ax
		add	dx, 3C5h
		push	dx
		push	large 8700D7h
		lea	ax, [bp+var_50]
		push	ax
		push	di
		call	sub_75D4A
		add	sp, 0Ah

loc_CC294:
		pop	di
		pop	si
		leave
		retf
sub_CBF46		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_CC298		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= byte ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	di
		call	sub_75F29
		pop	cx
		push	di
		call	sub_75F3D
		pop	cx
		push	di
		call	sub_75F47
		pop	cx
		push	di
		call	sub_75F51
		pop	cx
		push	di
		call	sub_75F5B
		pop	cx
		mov	al, [bp+arg_4]
		mov	ah, 0
		or	ax, ax
		jz	short loc_CC2D2
		jmp	loc_CC379

loc_CC2D2:
		push	di
		call	sub_75ED4
		pop	cx
		mov	bx, [si+28Bh]
		shl	bx, 1
		cmp	word ptr [bx+si+27Fh], 0
		jg	short loc_CC2E9
		jmp	loc_CC371

loc_CC2E9:
		push	di
		call	sub_75F15
		pop	cx
		push	di
		call	sub_75F24
		pop	cx
		mov	bx, [si+28Bh]
		imul	bx, bx, 5
		mov	al, [bx+si+271h]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_CC30F
		push	di
		call	sub_75F38
		pop	cx

loc_CC30F:
		mov	bx, [si+28Bh]
		shl	bx, 1
		mov	ax, [bx+si+27Fh]
		cmp	ax, 2
		jz	short loc_CC358
		cmp	ax, 3
		jz	short loc_CC340
		cmp	ax, 4
		jnz	short loc_CC387
		mov	bx, [si+28Bh]
		imul	bx, bx, 5
		mov	al, [bx+si+274h]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_CC340
		push	di
		call	sub_75F56
		pop	cx

loc_CC340:
		mov	bx, [si+28Bh]
		imul	bx, bx, 5
		mov	al, [bx+si+273h]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_CC358
		push	di
		call	sub_75F4C
		pop	cx

loc_CC358:
		mov	bx, [si+28Bh]
		imul	bx, bx, 5
		mov	al, [bx+si+272h]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_CC387
		push	di
		call	sub_75F42
		jmp	short loc_CC386

loc_CC371:
		push	di
		call	sub_75F10
		jmp	short loc_CC386

loc_CC379:
		push	di
		call	sub_75ED9
		pop	cx
		push	di
		call	sub_75F15

loc_CC386:
		pop	cx

loc_CC387:
		pop	di
		pop	si
		pop	bp
		retf
sub_CC298		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_CC38B		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= byte ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	di, [bp+arg_0]
		mov	si, [bp+arg_2]
		push	si
		call	sub_75F33
		pop	cx
		push	si
		call	sub_75F65
		pop	cx
		push	si
		call	sub_75F6F
		pop	cx
		push	si
		call	sub_75F79
		pop	cx
		push	si
		call	sub_75F83
		pop	cx
		cmp	[bp+arg_4], 0
		jz	short loc_CC41D
		push	si
		call	sub_75EDE
		pop	cx
		mov	bx, [di+470h]
		shl	bx, 1
		cmp	word ptr [bx+di+446h], 0
		jle	short loc_CC415
		push	si
		call	sub_75F2E
		pop	cx
		push	si
		call	sub_75F1F
		pop	cx
		mov	bx, [di+470h]
		shl	bx, 1
		mov	bx, [bx+di+446h]
		dec	bx
		cmp	bx, 3
		ja	short loc_CC42B
		shl	bx, 1
		jmp	cs:off_CC42F[bx]	; switch jump

loc_CC3F8:
		push	si
		call	sub_75F7E
		pop	cx

loc_CC3FF:
		push	si
		call	sub_75F74
		pop	cx

loc_CC406:
		push	si
		call	sub_75F6A
		pop	cx

loc_CC40D:
		push	si
		call	sub_75F60
		jmp	short loc_CC42A

loc_CC415:
		push	si
		call	sub_75F1A
		jmp	short loc_CC42A

loc_CC41D:
		push	si
		call	sub_75EE3
		pop	cx
		push	si
		call	sub_75F1F

loc_CC42A:
		pop	cx

loc_CC42B:
		pop	di
		pop	si
		pop	bp
		retf
sub_CC38B		endp

; START OF FUNCTION CHUNK FOR sub_CC38B
off_CC42F	dw offset loc_CC40D
		dw offset loc_CC406
		dw offset loc_CC3FF
		dw offset loc_CC3F8
; END OF FUNCTION CHUNK FOR sub_CC38B

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_CC437		proc far

var_174		= word ptr -174h
var_172		= word ptr -172h
var_15A		= word ptr -15Ah
var_14A		= word ptr -14Ah
var_148		= word ptr -148h
var_146		= word ptr -146h
var_142		= word ptr -142h
var_F2		= word ptr -0F2h
var_A2		= word ptr -0A2h
var_A0		= word ptr -0A0h
var_9E		= word ptr -9Eh
var_9C		= word ptr -9Ch
var_9A		= word ptr -9Ah
var_98		= word ptr -98h
var_94		= word ptr -94h
var_90		= word ptr -90h
var_8E		= word ptr -8Eh
var_2D		= word ptr -2Dh
var_2B		= word ptr -2Bh
var_29		= dword ptr -29h
var_20		= word ptr -20h
var_1E		= dword ptr -1Eh
var_1A		= dword ptr -1Ah
var_16		= byte ptr -16h
var_15		= byte ptr -15h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= byte ptr -8
var_7		= byte ptr -7
var_6		= dword ptr -6
var_2		= word ptr -2

		push	bp
		mov	bp, sp
		sub	sp, 174h
		push	si
		call	TextScrollDisplayB_ApplyHelperD_6FAF5
		push	word_7D14D
		call	sub_60DA5
		pop	cx
		push	large 9400F8h
		push	large 460046h
		lea	ax, [bp+var_94]
		push	ax
		call	sub_74C99
		add	sp, 0Ah
		mov	[bp+var_A2], 0
		mov	[bp+var_A0], 0
		mov	[bp+var_9E], 0
		mov	[bp+var_9C], 0
		mov	[bp+var_9A], 0B2h
		mov	[bp+var_98], 4Eh
		push	0
		lea	ax, [bp+var_A2]
		push	ax
		call	TextRenderer_ApplyFormatChange_67CBE
		add	sp, 4
		mov	[bp+var_2], 2
		push	seg seg008
		push	offset loc_5E81
		lea	ax, [bp+var_142]
		push	ax
		call	sub_54BE
		add	sp, 6
		push	53h
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	ss
		lea	ax, [bp+var_142]
		push	ax
		push	3
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		lea	ax, [bp+var_F2]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		push	2
		lea	ax, [bp+var_F2]
		push	ax
		call	TextRenderer_LoadResourceFile_6E338
		add	sp, 4
		mov	word ptr [bp+var_10+2], dx
		mov	word ptr [bp+var_10], ax
		mov	eax, [bp+var_10]
		mov	[bp+var_C], eax
		mov	[bp+var_8], 2
		mov	[bp+var_7], 1
		mov	[bp+var_6], 0
		lea	ax, word ptr [bp+var_C]
		push	ax
		lea	ax, [bp+var_15A]
		push	ax
		call	GlyphObject_ConstructWithBuffer_69161
		add	sp, 4
		mov	[bp+var_14A], 1
		mov	[bp+var_148], 0
		push	2Dh
		lea	ax, [bp+var_15A]
		push	ax
		mov	bx, [bp+var_15A]
		call	dword ptr [bx+18h]
		add	sp, 4
		mov	[bp+var_146], ax
		push	seg seg008
		push	offset loc_5E8F
		lea	ax, [bp+var_142]
		push	ax
		call	sub_54BE
		add	sp, 6
		push	53h
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	ss
		lea	ax, [bp+var_142]
		push	ax
		push	3
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		lea	ax, [bp+var_F2]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		push	3
		lea	ax, [bp+var_F2]
		push	ax
		call	TextRenderer_LoadResourceFile_6E338
		add	sp, 4
		mov	word ptr [bp+var_1E+2], dx
		mov	word ptr [bp+var_1E], ax
		mov	eax, [bp+var_1E]
		mov	[bp+var_1A], eax
		mov	[bp+var_16], 3
		mov	[bp+var_15], 1
		mov	[bp+var_14], 0
		lea	ax, [bp+var_15A]
		push	ax
		lea	ax, [bp+var_A2]
		push	ax
		lea	ax, [bp+var_174]
		push	ax
		call	sub_75D04
		add	sp, 6
		push	large 0
		mov	al, [bp+var_16]
		push	ax
		push	large [bp+var_1A]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	large 0
		lea	ax, [bp+var_A2]
		push	ax
		call	sub_6A514
		add	sp, 0Ch
		push	seg seg008
		push	offset loc_5E4E
		lea	ax, [bp+var_142]
		push	ax
		call	sub_54BE
		add	sp, 6
		push	large 14000Ah
		lea	ax, [bp+var_142]
		push	ax
		lea	ax, [bp+var_174]
		push	ax
		call	sub_75D4A
		add	sp, 8
		push	large 10024h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_CC65B
		push	large 140028h
		push	large 2D003Ch
		push	ax
		call	sub_74A8C
		add	sp, 0Ah
		mov	word ptr [si+0Eh], 3A4Bh
		lea	ax, [bp+var_2]
		mov	[si+20h], ds
		mov	[si+1Eh], ax
		mov	word ptr [si+22h], 1
		mov	ax, si
		jmp	short loc_CC65D

loc_CC65B:
		mov	ax, si

loc_CC65D:
		push	ax
		lea	ax, [bp+var_94]
		push	ax
		call	sub_74C8A
		add	sp, 6
		push	seg seg008
		push	offset loc_5F38
		lea	ax, [bp+var_142]
		push	ax
		call	sub_54BE
		add	sp, 6
		push	large 4002Dh
		push	37h
		lea	ax, [bp+var_142]
		push	ax
		lea	ax, [bp+var_174]
		push	ax
		call	sub_75D4A
		add	sp, 0Ah
		lea	ax, [bp+var_94]
		push	ax
		call	sub_74CC6
		pop	cx
		lea	ax, [bp+var_94]
		push	ax
		call	sub_74AD7
		pop	cx
		lea	ax, [bp+var_A2]
		push	ax
		lea	ax, [bp+var_94]
		push	ax
		call	UI_ApplyEncodingHelper_67F02
		add	sp, 4
		lea	ax, [bp+var_94]
		push	ax
		call	sub_74CD5
		pop	cx
		lea	ax, [bp+var_94]
		push	ax
		call	sub_74ADC
		pop	cx
		jmp	short loc_CC71E

loc_CC6D8:
		push	large 1
		lea	ax, [bp+var_94]
		push	ax
		call	sub_74CE9
		add	sp, 6
		mov	[bp+var_20], ax
		cmp	[bp+var_20], 0
		jz	short loc_CC71E
		cmp	word ptr [bp+var_29], 0
		jnz	short loc_CC6FD
		cmp	word ptr [bp+var_29+2], 0
		jz	short loc_CC71E

loc_CC6FD:
		push	large [bp+var_29]
		mov	ax, [bp+var_2B]
		sub	ax, [bp+var_8E]
		push	ax
		mov	ax, [bp+var_2D]
		sub	ax, [bp+var_90]
		push	ax
		lea	ax, [bp+var_94]
		push	ax
		call	sub_74CDA
		add	sp, 0Ah

loc_CC71E:
		cmp	[bp+var_2], 2
		jz	short loc_CC6D8
		call	TextScrollDisplayB_ApplyHelperD_6FAF5
		push	word_7D14D
		call	sub_60ED7
		pop	cx
		lea	ax, [bp+var_172]
		push	ax
		call	TextFormat_ReleaseStyleList_67E97
		pop	cx
		cmp	[bp+var_15], 0
		jz	short loc_CC762
		cmp	[bp+var_1A], 0
		jz	short loc_CC762
		push	0
		mov	al, [bp+var_16]
		push	ax
		lea	ax, word ptr [bp+var_1A]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_CC762

loc_CC762:
		mov	[bp+var_1A], 0
		mov	[bp+var_15], 0
		mov	[bp+var_14], 0
		push	2
		lea	ax, [bp+var_15A]
		push	ax
		call	sub_69368
		add	sp, 4
		cmp	[bp+var_7], 0
		jz	short loc_CC7A9
		cmp	[bp+var_C], 0
		jz	short loc_CC7A9
		push	0
		mov	al, [bp+var_8]
		push	ax
		lea	ax, word ptr [bp+var_C]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_CC7A9

loc_CC7A9:
		mov	[bp+var_C], 0
		mov	[bp+var_7], 0
		mov	[bp+var_6], 0
		lea	ax, [bp+var_A2]
		push	ax
		call	TextFormat_ReleaseStyleList_67E97
		pop	cx
		push	2
		lea	ax, [bp+var_94]
		push	ax
		call	sub_74CA8
		add	sp, 4
		pop	si
		leave
		retf
sub_CC437		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_CC7DA		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	dx, 1
		jmp	short loc_CC7F9

loc_CC7E6:
		mov	ax, [si+28Bh]
		imul	ax, ax, 5
		mov	bx, si
		add	bx, ax
		add	bx, dx
		mov	byte ptr [bx+270h], 0
		inc	dx

loc_CC7F9:
		cmp	dx, 5
		jl	short loc_CC7E6
		pop	si
		pop	bp
		retf
sub_CC7DA		endp
ovr365		ends
