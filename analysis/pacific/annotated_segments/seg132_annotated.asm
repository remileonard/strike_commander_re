seg132		segment	para public 'CODE' use16
		assume cs:seg132
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0A5h

loc_5AE81:
		db 1Fh, 5Fh, 5Eh, 0C9h, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5AE86		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_5AEA3
		push	0CBh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jnz	short loc_5AEA3
		jmp	loc_5B020

loc_5AEA3:
		push	seg seg132
		push	offset sub_5B682
		push	large 10032h
		push	4
		push	si
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		mov	word ptr [si+0C8h], 0FFFFh
		mov	byte ptr [si+0CAh], 0
		mov	byte ptr [si+8], 0
		mov	byte ptr [si+0Ch], 1
		mov	byte ptr [si+34h], 2
		mov	byte ptr [si+38h], 3
		mov	byte ptr [si+3Ch], 4
		mov	byte ptr [si+40h], 2
		mov	byte ptr [si+44h], 3
		mov	byte ptr [si+48h], 4
		mov	byte ptr [si+14h], 5
		mov	byte ptr [si+18h], 6
		mov	byte ptr [si+1Ch], 7
		mov	byte ptr [si+4], 8
		mov	byte ptr [si], 9
		mov	byte ptr [si+68h], 0Ah
		mov	byte ptr [si+20h], 0Bh
		mov	byte ptr [si+4Ch], 13h
		mov	byte ptr [si+2Ch], 14h
		mov	byte ptr [si+30h], 15h
		mov	byte ptr [si+0C4h], 16h
		mov	byte ptr [si+5Ch], 17h
		mov	byte ptr [si+60h], 18h
		mov	byte ptr [si+6Ch], 0Ch
		mov	byte ptr [si+70h], 0Ch
		mov	byte ptr [si+74h], 0Ch
		mov	byte ptr [si+78h], 0Ch
		mov	byte ptr [si+7Ch], 0Ch
		mov	byte ptr [si+80h], 0Ch
		mov	byte ptr [si+84h], 0Ch
		mov	byte ptr [si+88h], 0Ch
		mov	byte ptr [si+8Ch], 0Ch
		mov	byte ptr [si+90h], 0Ch
		mov	byte ptr [si+94h], 0Ch
		or	byte ptr [si+6Fh], 1
		or	byte ptr [si+73h], 1
		or	byte ptr [si+77h], 1
		or	byte ptr [si+7Bh], 1
		or	byte ptr [si+7Fh], 1
		or	byte ptr [si+83h], 1
		or	byte ptr [si+87h], 1
		or	byte ptr [si+8Bh], 1
		or	byte ptr [si+8Fh], 1
		or	byte ptr [si+93h], 1
		or	byte ptr [si+97h], 1
		mov	byte ptr [si+98h], 0Dh
		mov	byte ptr [si+9Ch], 0Dh
		mov	byte ptr [si+0A0h], 0Dh
		mov	byte ptr [si+0A4h], 0Dh
		mov	byte ptr [si+0A8h], 0Dh
		mov	byte ptr [si+0ACh], 0Dh
		mov	byte ptr [si+0B0h], 0Dh
		mov	byte ptr [si+0B4h], 0Dh
		mov	byte ptr [si+0B8h], 0Dh
		mov	byte ptr [si+0BCh], 0Dh
		or	byte ptr [si+9Bh], 1
		or	byte ptr [si+9Fh], 1
		or	byte ptr [si+0A3h], 1
		or	byte ptr [si+0A7h], 1
		or	byte ptr [si+0ABh], 1
		or	byte ptr [si+0AFh], 1
		or	byte ptr [si+0B3h], 1
		or	byte ptr [si+0B7h], 1
		or	byte ptr [si+0BBh], 1
		or	byte ptr [si+0BFh], 1
		or	byte ptr [si+0C3h], 1
		or	byte ptr [si+0C7h], 1
		or	byte ptr [si+67h], 1
		or	byte ptr [si+37h], 4
		or	byte ptr [si+3Bh], 4
		or	byte ptr [si+3Fh], 4
		or	byte ptr [si+43h], 4
		or	byte ptr [si+47h], 4
		or	byte ptr [si+4Bh], 4
		mov	byte ptr [si+94h], 0Ch
		mov	byte ptr [si+50h], 0Fh
		mov	byte ptr [si+54h], 10h
		mov	byte ptr [si+24h], 12h
		mov	byte ptr [si+64h], 19h
		mov	byte ptr [si+10h], 1Ah

loc_5B020:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_5AE86		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à StreamReader_ReportError_3B8BE (sub_3B8BE de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : code identique instruction par instruction à StreamReader_ReportError_6404E
; (sub_6404E de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far, enveloppe Runtime_FatalErrorHandlerWithTag (sub_5F4A9, tag 1911h) — signale une
; erreur du flux tamponné.
; ==============================================================================================
StreamReader_ReportError_5B025		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		push	1
		push	360Eh
		call	sub_5EEE9
		add	sp, 4
		pop	bp
		retf
StreamReader_ReportError_5B025		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à StreamReader_ReportError_3B8BE (sub_3B8BE de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : code identique instruction par instruction à StreamReader_ReportError_6404E
; (sub_6404E de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far, enveloppe Runtime_FatalErrorHandlerWithTag (sub_5F4A9, tag 1911h) — signale une
; erreur du flux tamponné.
; ==============================================================================================
StreamReader_ReportError_5B03A		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		push	0
		push	360Eh
		call	sub_5EEE9
		add	sp, 4
		pop	bp
		retf
StreamReader_ReportError_5B03A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5B04F		proc far

var_4		= word ptr -4
var_2		= byte ptr -2
var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= byte ptr  8
arg_4		= dword ptr  0Ah
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_1], 0
		cmp	[bp+arg_4], 3E8h
		jle	short loc_5B06D
		mov	ax, 1
		jmp	short loc_5B06F

loc_5B06D:
		xor	ax, ax

loc_5B06F:
		mov	[bp+var_2], al
		cmp	word ptr [si+0C8h], 0
		jl	short loc_5B07E
		mov	ax, 1
		jmp	short loc_5B080

loc_5B07E:
		xor	ax, ax

loc_5B080:
		or	al, al
		jz	short loc_5B08B
		mov	cx, [si+0C8h]
		inc	cx
		jmp	short loc_5B08E

loc_5B08B:
		mov	cx, 32h

loc_5B08E:
		xor	dx, dx
		mov	di, dx
		jmp	loc_5B11D

loc_5B095:
		mov	bx, di
		shl	bx, 2
		mov	al, [bx+si]
		cmp	al, [bp+arg_2]
		jnz	short loc_5B11C
		mov	bx, di
		shl	bx, 2
		mov	al, [bx+si+3]
		shr	ax, 2
		and	ax, 1
		cmp	al, [bp+var_2]
		jnz	short loc_5B11C

loc_5B0B4:
		inc	dx
		mov	bx, di
		add	bx, dx
		shl	bx, 2
		mov	al, [bx+si]
		cmp	al, [bp+arg_2]
		jnz	short loc_5B0E0
		mov	bx, di
		add	bx, dx
		shl	bx, 2
		mov	al, [bx+si+3]
		shr	ax, 2
		and	ax, 1
		cmp	al, [bp+var_2]
		jnz	short loc_5B0E0
		mov	ax, di
		add	ax, dx
		cmp	ax, cx
		jl	short loc_5B0B4

loc_5B0E0:
		or	dx, dx
		jz	short loc_5B106
		mov	[bp+var_4], dx
		call	CRT_Rand
		movsx	eax, ax
		movsx	edx, [bp+var_4]
		imul	eax, edx
		mov	ebx, 8000h
		cdq
		idiv	ebx
		mov	dx, ax

loc_5B106:
		push	[bp+arg_8]
		mov	ax, di
		add	ax, dx
		push	ax
		push	si
		nop
		push	cs
		call	near ptr sub_5B12B
		add	sp, 6
		mov	[bp+var_1], al
		jmp	short loc_5B124

loc_5B11C:
		inc	di

loc_5B11D:
		cmp	di, cx
		jge	short loc_5B124
		jmp	loc_5B095

loc_5B124:
		mov	al, [bp+var_1]
		pop	di
		pop	si
		leave
		retf
sub_5B04F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5B12B		proc far

var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	[bp+var_1], 0
		cmp	byte ptr word_7974E, 0
		jz	short loc_5B14E
		cmp	di, 4
		jl	short loc_5B14E
		mov	al, 0
		jmp	loc_5B202

loc_5B14E:
		push	2
		call	sub_5EFBF
		pop	cx
		mov	ah, 0
		or	ax, ax
		jz	short loc_5B15F
		jmp	loc_5B1FF

loc_5B15F:
		cmp	word ptr [si+0C8h], 0
		jl	short loc_5B16B
		mov	ax, 1
		jmp	short loc_5B16D

loc_5B16B:
		xor	ax, ax

loc_5B16D:
		or	al, al
		jz	short loc_5B189
		mov	bx, di
		shl	bx, 2
		mov	al, [bx+si]
		mov	bx, [si+0C8h]
		shl	bx, 2
		cmp	al, [bx+si]
		jnz	short loc_5B189
		mov	[bp+var_1], 1
		jmp	short loc_5B1FF

loc_5B189:
		cmp	word ptr [si+0C8h], 0
		jl	short loc_5B195
		mov	ax, 1
		jmp	short loc_5B197

loc_5B195:
		xor	ax, ax

loc_5B197:
		mov	ah, 0
		or	ax, ax
		jz	short loc_5B1A3
		cmp	[si+0C8h], di
		jle	short loc_5B1FF

loc_5B1A3:
		cmp	di, 32h
		jge	short loc_5B1FF
		cmp	word ptr [si+0C8h], 0
		jl	short loc_5B1B4
		mov	ax, 1
		jmp	short loc_5B1B6

loc_5B1B4:
		xor	ax, ax

loc_5B1B6:
		or	al, al
		jz	short loc_5B1DA
		mov	bx, [si+0C8h]
		shl	bx, 2
		mov	al, [bx+si+3]
		and	ax, 1
		and	ax, 1
		mov	bx, [si+0C8h]
		shl	bx, 2
		and	byte ptr [bx+si+3], 0FDh
		shl	al, 1
		or	[bx+si+3], al

loc_5B1DA:
		mov	al, 1
		mov	[bp+var_1], al
		mov	[si+0CAh], al
		mov	[si+0C8h], di
		mov	bx, [si+0C8h]
		shl	bx, 2
		or	byte ptr [bx+si+3], 2
		mov	bx, [si+0C8h]
		shl	bx, 2
		mov	ax, [bp+arg_4]
		mov	[bx+si+1], ax

loc_5B1FF:
		mov	al, [bp+var_1]

loc_5B202:
		pop	di
		pop	si
		leave
		retf
sub_5B12B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5B206		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	byte ptr [si+0CAh], 0
		jz	short loc_5B277
		cmp	word ptr [si+0C8h], 0
		jl	short loc_5B277
		mov	byte ptr [si+0CAh], 0
		push	2
		call	sub_5EFBF
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_5B277
		call	sub_5EFE1
		cmp	word ptr [si+0C8h], 4
		jge	short loc_5B252
		mov	bx, [si+0C8h]
		shl	bx, 2
		mov	al, [bx+si+3]
		and	ax, 1
		push	ax
		push	1
		push	word ptr [si+0C8h]
		push	0
		jmp	short loc_5B26C

loc_5B252:
		mov	bx, [si+0C8h]
		shl	bx, 2
		mov	al, [bx+si+3]
		and	ax, 1
		push	ax
		push	1
		mov	ax, [si+0C8h]
		add	ax, 0FFFCh
		push	ax
		push	1

loc_5B26C:
		push	360Eh
		call	sub_5EF6D
		add	sp, 0Ah

loc_5B277:
		push	0
		call	sub_5EFBF
		pop	cx
		mov	ah, 0
		or	ax, ax
		jz	short loc_5B288
		jmp	loc_5B325

loc_5B288:
		cmp	word ptr [si+0C8h], 0
		jl	short loc_5B294
		mov	ax, 1
		jmp	short loc_5B296

loc_5B294:
		xor	ax, ax

loc_5B296:
		or	al, al
		jz	short loc_5B2C0
		mov	bx, [si+0C8h]
		shl	bx, 2
		mov	al, [bx+si+3]
		and	ax, 1
		and	ax, 1
		mov	bx, [si+0C8h]
		shl	bx, 2
		and	byte ptr [bx+si+3], 0FDh
		shl	al, 1
		or	[bx+si+3], al
		mov	word ptr [si+0C8h], 0FFFFh

loc_5B2C0:
		xor	dx, dx
		jmp	short loc_5B320

loc_5B2C4:
		mov	bx, dx
		shl	bx, 2
		mov	al, [bx+si+3]
		shr	ax, 1
		and	ax, 1
		or	al, al
		jz	short loc_5B31F
		mov	[si+0C8h], dx
		cmp	word ptr [si+0C8h], 4
		jge	short loc_5B303
		mov	bx, [si+0C8h]
		shl	bx, 2
		mov	al, [bx+si+3]
		and	ax, 1
		push	ax
		push	1
		push	word ptr [si+0C8h]
		push	0

loc_5B2F6:
		push	360Eh
		call	sub_5EF6D
		add	sp, 0Ah
		jmp	short loc_5B325

loc_5B303:
		mov	bx, [si+0C8h]
		shl	bx, 2
		mov	al, [bx+si+3]
		and	ax, 1
		push	ax
		push	1
		mov	ax, [si+0C8h]
		add	ax, 0FFFCh
		push	ax
		push	1
		jmp	short loc_5B2F6

loc_5B31F:
		inc	dx

loc_5B320:
		cmp	dx, 32h
		jl	short loc_5B2C4

loc_5B325:
		pop	si
		pop	bp
		retf
sub_5B206		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5B328		proc far

var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= byte ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_1], 0
		xor	di, di
		jmp	short loc_5B358

loc_5B33B:
		mov	bx, di
		shl	bx, 2
		mov	al, [bx+si]
		cmp	al, [bp+arg_2]
		jnz	short loc_5B357
		push	[bp+arg_4]
		push	di
		push	si
		nop
		push	cs
		call	near ptr sub_5B364
		add	sp, 6
		or	[bp+var_1], al

loc_5B357:
		inc	di

loc_5B358:
		cmp	di, 32h
		jl	short loc_5B33B
		mov	al, [bp+var_1]
		pop	di
		pop	si
		leave
		retf
sub_5B328		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5B364		proc far

var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	dx, [bp+arg_2]
		mov	cx, [bp+arg_4]
		cmp	dx, 32h
		jge	short loc_5B3A6
		or	dx, dx
		jl	short loc_5B3A6
		or	cx, cx
		jz	short loc_5B38B
		mov	bx, dx
		shl	bx, 2
		cmp	[bx+si+1], cx
		jnz	short loc_5B3A6

loc_5B38B:
		mov	bx, dx
		shl	bx, 2
		mov	al, [bx+si+3]
		shr	ax, 1
		and	ax, 1
		mov	[bp+var_1], al
		mov	bx, dx
		shl	bx, 2
		and	byte ptr [bx+si+3], 0FDh
		jmp	short loc_5B3AA

loc_5B3A6:
		mov	[bp+var_1], 0

loc_5B3AA:
		cmp	[bp+var_1], 0
		jz	short loc_5B3ED
		cmp	[si+0C8h], dx
		jnz	short loc_5B3ED
		cmp	word ptr [si+0C8h], 0
		jl	short loc_5B3C2
		mov	ax, 1
		jmp	short loc_5B3C4

loc_5B3C2:
		xor	ax, ax

loc_5B3C4:
		or	al, al
		jz	short loc_5B3ED
		push	2
		call	sub_5EFBF
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_5B3E7
		push	1
		call	sub_5EFBF
		pop	cx
		or	al, al
		jz	short loc_5B3E7
		call	sub_5EFE1

loc_5B3E7:
		mov	word ptr [si+0C8h], 0FFFFh

loc_5B3ED:
		mov	al, [bp+var_1]
		pop	si
		leave
		retf
sub_5B364		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5B3F3		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	word ptr [si+0C8h], 0
		jl	short loc_5B407
		mov	ax, 1
		jmp	short loc_5B409

loc_5B407:
		xor	ax, ax

loc_5B409:
		or	al, al
		jz	short loc_5B41B
		push	0
		push	word ptr [si+0C8h]
		push	si
		push	cs
		call	near ptr sub_5B364
		add	sp, 6

loc_5B41B:
		xor	di, di
		jmp	short loc_5B42B

loc_5B41F:
		push	0
		push	di
		push	si
		push	cs
		call	near ptr sub_5B364
		add	sp, 6
		inc	di

loc_5B42B:
		cmp	di, 32h
		jl	short loc_5B41F
		pop	di
		pop	si
		pop	bp
		retf
sub_5B3F3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5B434		proc far

var_16		= word ptr -16h
var_14		= word ptr -14h
var_12		= byte ptr -12h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 16h
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	byte_79D5F, 0
		jnz	short loc_5B44A
		inc	byte_79D5F

loc_5B44A:
		mov	ax, word_7CEF9
		mov	[bp+var_4], ax
		push	ax
		mov	bx, [bp+var_4]
		mov	bx, [bx+50h]
		call	dword ptr [bx+1Ch]
		pop	cx
		mov	di, ax
		cmp	byte_7769B, 0
		jz	short loc_5B468
		mov	di, word_7CADA

loc_5B468:
		mov	ax, [bp+var_4]
		cmp	ax, word_79D60
		jz	short loc_5B474
		mov	word_79D60, ax

loc_5B474:
		mov	word_79D5C, 0
		mov	[bp+var_2], 1
		or	di, di
		jnz	short loc_5B486
		jmp	loc_5B5E6

loc_5B486:
		push	di
		mov	bx, [di]
		call	dword ptr [bx]
		pop	cx
		or	ax, dx
		jnz	short loc_5B493
		jmp	loc_5B5E6

loc_5B493:
		push	di
		mov	bx, [di]
		call	dword ptr [bx]
		pop	cx
		mov	[bp+var_6], dx
		mov	[bp+var_8], ax
		push	dx
		push	ax
		les	bx, [bp+var_8]
		mov	bx, es:[bx]
		call	dword ptr [bx+8]
		add	sp, 4
		cmp	al, 6
		jz	short loc_5B4B4
		jmp	loc_5B5E6

loc_5B4B4:
		cmp	dword ptr [di+5Ah], 0
		jz	short loc_5B4CD
		push	large [di+5Ah]
		les	bx, [di+5Ah]
		mov	bx, es:[bx]
		call	dword ptr [bx+8]
		add	sp, 4
		jmp	short loc_5B4D1

loc_5B4CD:
		xor	dx, dx
		xor	ax, ax

loc_5B4D1:
		mov	[bp+var_14], dx
		mov	[bp+var_16], ax
		les	bx, [bp+var_16]
		mov	al, es:[bx+1Eh]
		mov	[bp+var_12], al
		cmp	[bp+var_2], 0
		jnz	short loc_5B4F0
		mov	al, byte_76D44
		mov	ah, 0
		or	ax, ax
		jnz	short loc_5B4F6

loc_5B4F0:
		mov	al, [bp+var_12]
		mov	byte_79D5E, al

loc_5B4F6:
		mov	al, [bp+var_12]
		cmp	al, byte_79D5E
		jnz	short loc_5B505
		cmp	[bp+var_2], 1
		jnz	short loc_5B558

loc_5B505:
		cmp	byte_76D44, 0
		jz	short loc_5B558
		mov	eax, dword_7976E
		sub	dword_7D066, eax
		cmp	dword_7D066, 0
		jge	short loc_5B552
		cmp	[bp+var_2], 1
		jz	short loc_5B547
		mov	al, [bp+var_12]
		cmp	al, byte_79D5E
		jge	short loc_5B533
		mov	al, byte_79D5E
		dec	al
		jmp	short loc_5B541

loc_5B533:
		mov	al, [bp+var_12]
		cmp	al, byte_79D5E
		jle	short loc_5B547
		mov	al, byte_79D5E
		inc	al

loc_5B541:
		mov	byte_79D5E, al
		mov	[bp+var_12], al

loc_5B547:
		mov	dword_7D066, 28h
		jmp	short loc_5B558

loc_5B552:
		mov	al, byte_79D5E
		mov	[bp+var_12], al

loc_5B558:
		cmp	[bp+var_12], 0
		jz	short loc_5B5BE
		mov	al, [bp+var_12]
		cbw
		add	ax, 1Bh
		mov	di, ax
		push	[bp+var_4]
		mov	bx, [bp+var_4]
		mov	bx, [bx+50h]
		call	dword ptr [bx+14h]
		pop	cx
		cmp	al, 4
		jz	short loc_5B57B
		add	di, 0Bh

loc_5B57B:
		cmp	[si+0C8h], di
		jz	short loc_5B5AA
		cmp	word ptr [si+0C8h], 0
		jl	short loc_5B58D
		mov	ax, 1
		jmp	short loc_5B58F

loc_5B58D:
		xor	ax, ax

loc_5B58F:
		mov	ah, 0
		or	ax, ax
		jz	short loc_5B59C
		cmp	word ptr [si+0C8h], 1Bh
		jl	short loc_5B5AA

loc_5B59C:
		push	0
		push	word ptr [si+0C8h]
		push	si
		push	cs
		call	near ptr sub_5B364
		add	sp, 6

loc_5B5AA:
		mov	word_79D5C, 0
		push	0
		push	di
		push	si
		push	cs
		call	near ptr sub_5B12B
		add	sp, 6
		jmp	loc_5B67E

loc_5B5BE:
		mov	di, 33h
		cmp	[si+0C8h], di
		jz	short loc_5B5AA
		cmp	word ptr [si+0C8h], 0
		jl	short loc_5B5D3
		mov	ax, 1
		jmp	short loc_5B5D5

loc_5B5D3:
		xor	ax, ax

loc_5B5D5:
		mov	ah, 0
		or	ax, ax
		jz	short loc_5B59C
		cmp	word ptr [si+0C8h], 1Bh
		jl	short loc_5B5AA
		jmp	short loc_5B59C
		jmp	short loc_5B5AA

loc_5B5E6:
		or	di, di
		jz	short loc_5B663
		push	di
		mov	bx, [di]
		call	dword ptr [bx]
		pop	cx
		or	ax, dx
		jz	short loc_5B663
		push	di
		mov	bx, [di]
		call	dword ptr [bx]
		pop	cx
		mov	[bp+var_A], dx
		mov	[bp+var_C], ax
		push	dx
		push	ax
		les	bx, [bp+var_C]
		mov	bx, es:[bx]
		call	dword ptr [bx+8]
		add	sp, 4
		cmp	al, 18h
		jz	short loc_5B630
		push	di
		mov	bx, [di]
		call	dword ptr [bx]
		pop	cx
		mov	[bp+var_E], dx
		mov	[bp+var_10], ax
		push	dx
		push	ax
		les	bx, [bp+var_10]
		mov	bx, es:[bx]
		call	dword ptr [bx+8]
		add	sp, 4
		cmp	al, 17h
		jnz	short loc_5B663

loc_5B630:
		mov	di, 31h
		cmp	[si+0C8h], di
		jnz	short loc_5B63C
		jmp	loc_5B5AA

loc_5B63C:
		cmp	word ptr [si+0C8h], 0
		jl	short loc_5B648
		mov	ax, 1
		jmp	short loc_5B64A

loc_5B648:
		xor	ax, ax

loc_5B64A:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_5B653
		jmp	loc_5B59C

loc_5B653:
		cmp	word ptr [si+0C8h], 1Bh
		jge	short loc_5B65D
		jmp	loc_5B5AA

loc_5B65D:
		jmp	loc_5B59C
		jmp	loc_5B5AA

loc_5B663:
		cmp	word_79D5C, 0
		jnz	short loc_5B67E
		push	0
		push	word ptr [si+0C8h]
		push	si
		push	cs
		call	near ptr sub_5B364
		add	sp, 6
		mov	word_79D5C, 1

loc_5B67E:
		pop	di
		pop	si
		leave
		retf
sub_5B434		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5B682		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_5B69B
		push	4
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_5B6BE

loc_5B69B:
		and	byte ptr [si+3], 0FBh
		mov	al, 0
		and	byte ptr [si+3], 0FDh
		mov	dx, ax
		shl	al, 1
		or	[si+3], al
		and	dx, 1
		and	byte ptr [si+3], 0FEh
		or	[si+3], dl
		mov	byte ptr [si], 0FFh
		mov	word ptr [si+1], 0

loc_5B6BE:
		mov	ax, si
sub_5B682		endp
seg132		ends
