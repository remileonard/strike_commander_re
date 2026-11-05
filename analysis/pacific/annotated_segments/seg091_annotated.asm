seg091		segment	para public 'CODE' use16
		assume cs:seg091
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 83h, 0C4h, 6

loc_39543:
		db 5Eh, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_39546		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[si], ax
		cmp	word ptr [si], 0
		jz	short loc_39564
		push	[bp+arg_4]
		push	word ptr [si]
		call	sub_74EBF
		add	sp, 4

loc_39564:
		pop	si
		pop	bp
		retf
sub_39546		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_39567		proc far

var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		push	si
		push	di
		mov	di, [bp+arg_4]
		push	0
		push	large 4D4E5944h
		push	di
		call	ResourceRecord_SeekAndReadB_6D82B
		add	sp, 8
		or	ax, ax
		jnz	short loc_3958A
		jmp	loc_399CD

loc_3958A:
		push	0
		push	large 4E59444Ah
		push	di
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jnz	short loc_395A2
		jmp	loc_3973C

loc_395A2:
		mov	[bp+var_2], di
		push	0E9h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jnz	short loc_395B7
		jmp	loc_39726

loc_395B7:
		add	ax, 0ABh
		mov	[si], ax
		mov	ax, si
		add	ax, 0D1h
		mov	[si+10h], ax
		mov	ax, si
		add	ax, 0ABh
		mov	[si+0D1h], ax
		mov	ax, si
		add	ax, 0ABh
		mov	[si+1Eh], ax
		mov	ax, si
		add	ax, 0D1h
		mov	[si+22h], ax
		mov	ax, si
		add	ax, 0ABh
		mov	[si+24h], ax
		mov	word ptr [si+0A9h], 0
		mov	word ptr [si+0CFh], 0
		mov	word ptr [si+0ABh], 1BAEh
		mov	ax, si
		add	ax, 0ABh
		push	ax
		call	sub_74EBA
		pop	cx
		mov	bx, [si]
		sub	word ptr [bx-2], 0FFC0h
		mov	word ptr [si+0D3h], 1B42h
		mov	bx, [si+0D1h]
		mov	word ptr [bx], 1B5Eh
		xor	eax, eax
		mov	[si+0DDh], eax
		mov	[si+0D9h], eax
		mov	[si+0D5h], eax
		mov	ax, si
		add	ax, 0D5h
		mov	dword ptr [si+0E5h], 100h
		mov	bx, [si]
		add	word ptr [bx-2], 0FFC0h
		sub	word ptr [bx-2], 8Bh
		mov	bx, [si+10h]
		sub	word ptr [bx-2], 8Bh
		mov	bx, [si]
		sub	word ptr [bx-2], 0Eh
		mov	word ptr [si+2], 1A22h
		mov	word ptr [bx], 1A52h
		push	si
		call	sub_74EFA
		pop	cx
		mov	bx, [si]
		add	word ptr [bx-2], 0Eh
		mov	word ptr [si+2], 1AA2h
		mov	word ptr [bx], 1AD6h
		mov	bx, [si+10h]
		mov	word ptr [bx+2], 1B26h
		push	si
		call	sub_74F63
		pop	cx
		mov	bx, [si+10h]
		mov	dword ptr [bx+14h], 100h
		mov	bx, [si]
		add	word ptr [bx-2], 8Bh
		mov	bx, [si+10h]
		add	word ptr [bx-2], 8Bh
		mov	bx, [si]
		sub	word ptr [bx-2], 87h
		mov	word ptr [si+20h], 19B6h
		mov	bx, [si+1Eh]
		mov	word ptr [bx], 19D2h
		mov	bx, [si]
		add	word ptr [bx-2], 87h
		sub	word ptr [bx-2], 65h
		mov	bx, [si+10h]
		sub	word ptr [bx-2], 65h
		mov	word ptr [si+26h], 192Ah
		mov	bx, [si+24h]
		mov	word ptr [bx], 194Ah
		mov	bx, [si+22h]
		mov	word ptr [bx+2], 199Ah
		mov	dword ptr [bx+14h], 100h
		mov	byte ptr [si+37h], 0FFh
		mov	bx, [si]
		add	word ptr [bx-2], 65h
		mov	bx, [si+10h]
		add	word ptr [bx-2], 65h
		mov	word ptr [si+2], 1BFEh
		mov	word ptr [si+20h], 1C4Ah
		mov	word ptr [si+26h], 1C66h
		mov	bx, [si]
		mov	word ptr [bx], 1C86h
		mov	bx, [si+10h]
		mov	word ptr [bx+2], 1CD6h
		push	[bp+var_2]
		push	si
		call	sub_74FBE
		add	sp, 4
		mov	bx, [si+10h]
		mov	dword ptr [bx+14h], 100h
		mov	byte ptr [si+37h], 0FFh
		mov	ax, si
		jmp	short loc_39728

loc_39726:
		mov	ax, si

loc_39728:
		mov	si, ax
		or	si, si
		jz	short loc_39731
		jmp	loc_399B4

loc_39731:
		mov	ax, si

loc_39733:
		les	bx, [bp+arg_0]
		mov	es:[bx], ax
		jmp	loc_399C5

loc_3973C:
		push	0
		push	large 5353494Dh
		push	di
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_3978E
		mov	[bp+var_4], di
		push	3Fh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_39731
		mov	word ptr [si], 1BAEh
		push	ax
		call	sub_74EBA
		pop	cx
		mov	word ptr [si], 18DAh
		mov	word ptr [si+38h], 0
		mov	word ptr [si+3Ah], 0
		push	[bp+var_4]
		push	si
		call	sub_74613

loc_39784:
		add	sp, 4
		mov	ax, si
		jmp	loc_399B6
		jmp	short loc_39731

loc_3978E:
		push	0
		push	large 56524741h
		push	di
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jnz	short loc_397A6
		jmp	loc_39846

loc_397A6:
		mov	[bp+var_6], di
		push	42h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_39835
		add	ax, 1Eh
		mov	[si], ax
		mov	ax, si
		add	ax, 1Eh
		mov	[si+4], ax
		mov	word ptr [si+1Ch], 0
		mov	word ptr [si+1Eh], 1BAEh
		mov	ax, si
		add	ax, 1Eh
		push	ax
		call	sub_74EBA
		pop	cx
		mov	bx, [si]
		sub	word ptr [bx-2], 18h
		mov	word ptr [si+2], 19B6h
		mov	word ptr [bx], 19D2h
		add	word ptr [bx-2], 18h
		mov	word ptr [si+6], 1B42h
		mov	bx, [si+4]
		mov	word ptr [bx], 1B5Eh
		xor	eax, eax
		mov	[si+10h], eax
		mov	[si+0Ch], eax
		mov	[si+8], eax
		mov	ax, si
		add	ax, 8
		mov	dword ptr [si+18h], 100h
		mov	word ptr [si+2], 1852h
		mov	word ptr [si+6], 186Eh
		mov	bx, [si]
		mov	word ptr [bx], 188Ah
		push	[bp+var_6]
		push	si
		call	sub_74F1D
		add	sp, 4
		mov	ax, si
		jmp	short loc_39837

loc_39835:
		mov	ax, si

loc_39837:
		mov	si, ax
		or	si, si
		jnz	short loc_39840
		jmp	loc_39731

loc_39840:
		jmp	loc_399B4
		jmp	loc_39731

loc_39846:
		push	0
		push	large 44465253h
		push	di
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_3988D
		mov	[bp+var_8], di
		push	30h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jnz	short loc_3986F
		jmp	loc_39731

loc_3986F:
		mov	word ptr [si], 1BAEh
		push	ax
		call	sub_74EBA
		pop	cx
		mov	word ptr [si], 1802h
		push	[bp+var_8]
		push	si
		call	sub_74755
		jmp	loc_39784
		jmp	loc_39731

loc_3988D:
		push	0
		push	large 41524150h
		push	di
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jnz	short loc_398A5
		jmp	loc_399BC

loc_398A5:
		mov	[bp+var_A], di
		push	62h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jnz	short loc_398B9
		jmp	loc_399A9

loc_398B9:
		add	ax, 24h
		mov	[si], ax
		mov	ax, si
		add	ax, 24h
		mov	[si+4], ax
		mov	ax, si
		add	ax, 4Ah
		mov	[si+14h], ax
		mov	ax, si
		add	ax, 24h
		mov	[si+4Ah], ax
		mov	word ptr [si+22h], 0
		mov	word ptr [si+48h], 0
		mov	word ptr [si+24h], 1BAEh
		mov	ax, si
		add	ax, 24h
		push	ax
		call	sub_74EBA
		pop	cx
		mov	bx, [si]
		sub	word ptr [bx-2], 0FFC0h
		mov	word ptr [si+4Ch], 1B42h
		mov	bx, [si+4Ah]
		mov	word ptr [bx], 1B5Eh
		xor	eax, eax
		mov	[si+56h], eax
		mov	[si+52h], eax
		mov	[si+4Eh], eax
		mov	ax, si
		add	ax, 4Eh
		mov	dword ptr [si+5Eh], 100h
		mov	bx, [si]
		add	word ptr [bx-2], 0FFC0h
		sub	word ptr [bx-2], 1Eh
		mov	word ptr [si+2], 19B6h
		mov	word ptr [bx], 19D2h
		add	word ptr [bx-2], 1Eh
		mov	bx, [si+4]
		sub	word ptr [bx-2], 0Eh
		mov	word ptr [si+6], 1A22h
		mov	word ptr [bx], 1A52h
		mov	ax, si
		add	ax, 4
		push	ax
		call	sub_74EFA
		pop	cx
		mov	bx, [si+4]
		add	word ptr [bx-2], 0Eh
		mov	word ptr [si+6], 1AA2h
		mov	word ptr [bx], 1AD6h
		mov	bx, [si+14h]
		mov	word ptr [bx+2], 1B26h
		mov	ax, si
		add	ax, 4
		push	ax
		call	sub_74F63
		pop	cx
		mov	bx, [si+14h]
		mov	dword ptr [bx+14h], 100h
		mov	word ptr [si+2], 1746h
		mov	word ptr [si+6], 1762h
		mov	bx, [si]
		mov	word ptr [bx], 1796h
		mov	bx, [si+14h]
		mov	word ptr [bx+2], 17E6h
		push	[bp+var_A]
		push	si
		call	sub_750D4
		add	sp, 4
		mov	ax, si
		jmp	short loc_399AB

loc_399A9:
		mov	ax, si

loc_399AB:
		mov	si, ax
		or	si, si
		jnz	short loc_399B4
		jmp	loc_39731

loc_399B4:
		mov	ax, [si]

loc_399B6:
		jmp	loc_39733
		jmp	loc_39731

loc_399BC:
		push	0C010h
		call	sub_1DDFE
		pop	cx

loc_399C5:
		push	di
		call	ResourceRecord_ReleaseAndClear_6DD9E
		jmp	short loc_399D5

loc_399CD:
		push	0C011h
		call	sub_1DDFE

loc_399D5:
		pop	cx
		pop	di
		pop	si
		leave
		retf
sub_39567		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Widget_Method_Dispatch18_A12CD (sub_A12CD de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; dispatch vtable [bx+0x18] (champ +0x0E).
; ==============================================================================================
Widget_Method_Dispatch18_399DA		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		mov	bx, [si+2]
		call	dword ptr [bx+0Ch]
		pop	cx
		pop	si
		pop	bp
		retf
Widget_Method_Dispatch18_399DA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_399EC		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_39A3F
		mov	bx, [si+4]
		sub	word ptr [bx-2], 0Eh
		add	word ptr [bx-2], 0Eh
		mov	bx, [si]
		sub	word ptr [bx-2], 1Eh
		add	word ptr [bx-2], 1Eh
		test	di, 2
		jz	short loc_39A30
		sub	word ptr [bx-2], 0FFC0h
		add	word ptr [bx-2], 0FFC0h
		push	0
		mov	ax, si
		add	ax, 24h
		push	ax
		call	sub_74EC9
		add	sp, 4
		jmp	short loc_39A30

loc_39A30:
		test	di, 1
		jz	short loc_39A3F
		push	si
		call	sub_3B2
		pop	cx
		jmp	short loc_39A3F

loc_39A3F:
		pop	di
		pop	si
		pop	bp
		retf
sub_399EC		endp

; ----------------------------------------------------------------------

sub_39A43		proc far
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FFB6h
		mov	bx, sp
		add	ss:[bx+4], ax
		nop
		nop
		jmp	sub_399EC
sub_39A43		endp

; ----------------------------------------------------------------------

sub_39A5A		proc far
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FFBAh
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	sub_47B3D
sub_39A5A		endp

; ----------------------------------------------------------------------

sub_39A71		proc far
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FFB6h
		mov	bx, sp
		add	ss:[bx+4], ax
		nop
		nop
		jmp	Widget_Method_Dispatch18_399DA
sub_39A71		endp

; ----------------------------------------------------------------------

sub_39A88		proc far
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FFB6h
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	sub_75132
sub_39A88		endp

; ----------------------------------------------------------------------

sub_39A9F		proc far
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FFB6h
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	sub_7512D
sub_39A9F		endp

; ----------------------------------------------------------------------

sub_39AB6		proc far
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FFB6h
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	sub_75128
sub_39AB6		endp

; ----------------------------------------------------------------------

sub_39ACD		proc far
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FFB6h
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	sub_75123
sub_39ACD		endp

; ----------------------------------------------------------------------

sub_39AE4		proc far
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FFE0h
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	sub_47B45
sub_39AE4		endp

; ----------------------------------------------------------------------

sub_39AFB		proc far
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FFE0h
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	sub_47B3D
sub_39AFB		endp

; ----------------------------------------------------------------------

sub_39B12		proc far
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FFDCh
		mov	bx, sp
		add	ss:[bx+4], ax
		nop
		nop
		jmp	Widget_Method_Dispatch18_399DA
sub_39B12		endp

; ----------------------------------------------------------------------

sub_39B29		proc far
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FFDCh
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	sub_75132
sub_39B29		endp

; ----------------------------------------------------------------------

sub_39B40		proc far
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FFE0h
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	sub_46AE9
sub_39B40		endp

; ----------------------------------------------------------------------

sub_39B57		proc far
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FFE0h
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	sub_46AC3
sub_39B57		endp

; ----------------------------------------------------------------------

sub_39B6E		proc far
		mov	bx, sp
		mov	bx, ss:[bx+8]
		mov	ax, [bx-2]
		add	ax, 0FFE0h
		mov	bx, sp
		add	ss:[bx+8], ax
		jmp	sub_46A77
sub_39B6E		endp

; ----------------------------------------------------------------------

sub_39B85		proc far
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FFE0h
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	sub_46BA2
sub_39B85		endp

; ----------------------------------------------------------------------

sub_39B9C		proc far
		mov	bx, sp
		mov	bx, ss:[bx+8]
		mov	ax, [bx-2]
		add	ax, 0FFE0h
		mov	bx, sp
		add	ss:[bx+8], ax
		jmp	sub_46AF6
sub_39B9C		endp

; ----------------------------------------------------------------------

sub_39BB3		proc far
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FFDCh
		mov	bx, sp
		add	ss:[bx+4], ax
		nop
		nop
		jmp	sub_399EC
sub_39BB3		endp

; ----------------------------------------------------------------------

sub_39BCA		proc far
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FFDCh
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	sub_7512D
sub_39BCA		endp

; ----------------------------------------------------------------------

sub_39BE1		proc far
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FFDCh
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	sub_75128
sub_39BE1		endp

; ----------------------------------------------------------------------

sub_39BF8		proc far
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FFDCh
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	sub_75123
sub_39BF8		endp

; ----------------------------------------------------------------------

sub_39C0F		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFFCh
		nop
		nop
		jmp	sub_399EC
sub_39C0F		endp

; ----------------------------------------------------------------------

sub_39C1B		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFFCh
		nop
		nop
		jmp	Widget_Method_Dispatch18_399DA
sub_39C1B		endp

; ----------------------------------------------------------------------

sub_39C27		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFFCh
		jmp	sub_75132
sub_39C27		endp

; ----------------------------------------------------------------------

sub_39C33		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFFCh
		jmp	sub_7512D
sub_39C33		endp

; ----------------------------------------------------------------------

sub_39C3F		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFFCh
		jmp	sub_75128
sub_39C3F		endp

; ----------------------------------------------------------------------

sub_39C4B		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFFCh
		jmp	sub_75123
sub_39C4B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_39C57		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_39C82
		mov	word ptr [si], 1802h
		push	0
		push	si
		call	sub_74EC9
		add	sp, 4
		test	di, 1
		jz	short loc_39C82
		push	si
		call	sub_3B2
		pop	cx

loc_39C82:
		pop	di
		pop	si
		pop	bp
		retf
sub_39C57		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_39C86		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_39CC6
		mov	bx, [si]
		sub	word ptr [bx-2], 18h
		add	word ptr [bx-2], 18h
		test	di, 2
		jz	short loc_39CB7
		push	0
		mov	ax, si
		add	ax, 1Eh
		push	ax
		call	sub_74EC9
		add	sp, 4
		jmp	short loc_39CB7

loc_39CB7:
		test	di, 1
		jz	short loc_39CC6
		push	si
		call	sub_3B2
		pop	cx
		jmp	short loc_39CC6

loc_39CC6:
		pop	di
		pop	si
		pop	bp
		retf
sub_39C86		endp

; ----------------------------------------------------------------------

sub_39CCA		proc far
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FFE2h
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	sub_470CB
sub_39CCA		endp

; ----------------------------------------------------------------------

sub_39CE1		proc far
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FFE2h
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	Widget_Method_Dispatch18_470B9
sub_39CE1		endp

; ----------------------------------------------------------------------

sub_39CF8		proc far
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FFE2h
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	sub_47034
sub_39CF8		endp

; ----------------------------------------------------------------------

sub_39D0F		proc far
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FFE2h
		mov	bx, sp
		add	ss:[bx+4], ax
		nop
		nop
		jmp	sub_39C86
sub_39D0F		endp

; ----------------------------------------------------------------------

sub_39D26		proc far
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FFE2h
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	sub_74F2C
sub_39D26		endp

; ----------------------------------------------------------------------

sub_39D3D		proc far
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FFE2h
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	sub_74F27
sub_39D3D		endp

; ----------------------------------------------------------------------

sub_39D54		proc far
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FFE2h
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	sub_74F22
sub_39D54		endp

; ----------------------------------------------------------------------

sub_39D6B		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFFCh
		nop
		nop
		jmp	sub_39C86
sub_39D6B		endp

; ----------------------------------------------------------------------

sub_39D77		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFFCh
		jmp	sub_470CB
sub_39D77		endp

; ----------------------------------------------------------------------

sub_39D83		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFFCh
		jmp	Widget_Method_Dispatch18_470B9
sub_39D83		endp

; ----------------------------------------------------------------------

sub_39D8F		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFFCh
		jmp	sub_47034
sub_39D8F		endp

; ----------------------------------------------------------------------

sub_39D9B		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFFCh
		jmp	sub_74F2C
sub_39D9B		endp

; ----------------------------------------------------------------------

sub_39DA7		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFFCh
		jmp	sub_74F27
sub_39DA7		endp

; ----------------------------------------------------------------------

sub_39DB3		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFFCh
		jmp	sub_74F22
sub_39DB3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_39DBF		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_39E00
		mov	ax, si
		add	ax, 3Ah
		push	ax
		call	WeakRef_InvalidateIfSet
		pop	cx
		mov	ax, si
		add	ax, 38h
		push	ax
		call	WeakRef_InvalidateIfSet
		pop	cx
		push	0
		push	si
		call	sub_74EC9
		add	sp, 4
		test	di, 1
		jz	short loc_39E00
		push	si
		call	sub_3B2
		pop	cx
		jmp	short loc_39E00

loc_39E00:
		pop	di
		pop	si
		pop	bp
		retf
sub_39DBF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_39E04		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_39E45
		test	di, 2
		jz	short loc_39E36
		mov	bx, [si+2]
		sub	word ptr [bx-2], 0FFC0h
		add	word ptr [bx-2], 0FFC0h
		push	0
		mov	ax, si
		add	ax, 24h
		push	ax
		call	sub_74EC9
		add	sp, 4
		jmp	short loc_39E36

loc_39E36:
		test	di, 1
		jz	short loc_39E45
		push	si
		call	sub_3B2
		pop	cx
		jmp	short loc_39E45

loc_39E45:
		pop	di
		pop	si
		pop	bp
		retf
sub_39E04		endp

; ----------------------------------------------------------------------

sub_39E49		proc far
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FFB6h
		mov	bx, sp
		add	ss:[bx+4], ax
		nop
		nop
		jmp	sub_39E04
sub_39E49		endp

; ----------------------------------------------------------------------

sub_39E60		proc far
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FFB6h
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	sub_4756C
sub_39E60		endp

; ----------------------------------------------------------------------

sub_39E77		proc far
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FFB6h
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	Widget_Method_Dispatch18_470F9
sub_39E77		endp

; ----------------------------------------------------------------------

sub_39E8E		proc far
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FFB6h
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	sub_470D3
sub_39E8E		endp

; ----------------------------------------------------------------------

sub_39EA5		proc far
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FFB6h
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	sub_74F4F
sub_39EA5		endp

; ----------------------------------------------------------------------

sub_39EBC		proc far
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FFB6h
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	sub_74F4A
sub_39EBC		endp

; ----------------------------------------------------------------------

sub_39ED3		proc far
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FFB6h
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	sub_74F45
sub_39ED3		endp

; ----------------------------------------------------------------------

sub_39EEA		proc far
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FFDCh
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	sub_47574
sub_39EEA		endp

; ----------------------------------------------------------------------

sub_39F01		proc far
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FFDCh
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	sub_4756C
sub_39F01		endp

; ----------------------------------------------------------------------

sub_39F18		proc far
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FFDCh
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	Widget_Method_Dispatch18_470F9
sub_39F18		endp

; ----------------------------------------------------------------------

sub_39F2F		proc far
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FFDCh
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	sub_470D3
sub_39F2F		endp

; ----------------------------------------------------------------------

sub_39F46		proc far
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FFDCh
		mov	bx, sp
		add	ss:[bx+4], ax
		nop
		nop
		jmp	sub_39E04
sub_39F46		endp

; ----------------------------------------------------------------------

sub_39F5D		proc far
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FFDCh
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	sub_74F4F
sub_39F5D		endp

; ----------------------------------------------------------------------

sub_39F74		proc far
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FFDCh
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	sub_74F4A
sub_39F74		endp

; ----------------------------------------------------------------------

sub_39F8B		proc far
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FFDCh
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	sub_74F45
sub_39F8B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_39FA2		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_39FD8
		test	di, 2
		jz	short loc_39FC9
		push	0
		mov	ax, si
		add	ax, 6
		push	ax
		call	sub_74EC9
		add	sp, 4
		jmp	short loc_39FC9

loc_39FC9:
		test	di, 1
		jz	short loc_39FD8
		push	si
		call	sub_3B2
		pop	cx
		jmp	short loc_39FD8

loc_39FD8:
		pop	di
		pop	si
		pop	bp
		retf
sub_39FA2		endp

; ----------------------------------------------------------------------

sub_39FDC		proc far
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FFFAh
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	sub_4702C
sub_39FDC		endp

; ----------------------------------------------------------------------

sub_39FF3		proc far
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FFFAh
		mov	bx, sp
		add	ss:[bx+4], ax
		nop
		nop
		jmp	sub_39FA2
sub_39FF3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3A00A		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_3A040
		test	di, 2
		jz	short loc_3A031
		push	0
		mov	ax, si
		add	ax, 12h
		push	ax
		call	sub_74EC9
		add	sp, 4
		jmp	short loc_3A031

loc_3A031:
		test	di, 1
		jz	short loc_3A040
		push	si
		call	sub_3B2
		pop	cx
		jmp	short loc_3A040

loc_3A040:
		pop	di
		pop	si
		pop	bp
		retf
sub_3A00A		endp

; ----------------------------------------------------------------------

sub_3A044		proc far
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FFEEh
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	sub_46A6F
sub_3A044		endp

; ----------------------------------------------------------------------

sub_3A05B		proc far
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FFEEh
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	sub_46AE9
sub_3A05B		endp

; ----------------------------------------------------------------------

sub_3A072		proc far
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FFEEh
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	sub_46AC3
sub_3A072		endp

; ----------------------------------------------------------------------

sub_3A089		proc far
		mov	bx, sp
		mov	bx, ss:[bx+8]
		mov	ax, [bx-2]
		add	ax, 0FFEEh
		mov	bx, sp
		add	ss:[bx+8], ax
		jmp	sub_46A77
sub_3A089		endp

; ----------------------------------------------------------------------

sub_3A0A0		proc far
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FFEEh
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	sub_46BA2
sub_3A0A0		endp

; ----------------------------------------------------------------------

sub_3A0B7		proc far
		mov	bx, sp
		mov	bx, ss:[bx+8]
		mov	ax, [bx-2]
		add	ax, 0FFEEh
		mov	bx, sp
		add	ss:[bx+8], ax
		jmp	sub_46AF6
sub_3A0B7		endp

; ----------------------------------------------------------------------

sub_3A0CE		proc far
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FFEEh
		mov	bx, sp
		add	ss:[bx+4], ax
		nop
		nop
		jmp	sub_3A00A
sub_3A0CE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3A0E5		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_3A12D
		mov	bx, [si]
		sub	word ptr [bx-2], 0Eh
		add	word ptr [bx-2], 0Eh
		test	di, 2
		jz	short loc_3A11E
		sub	word ptr [bx-2], 0FFC0h
		add	word ptr [bx-2], 0FFC0h
		push	0
		mov	ax, si
		add	ax, 20h
		push	ax
		call	sub_74EC9
		add	sp, 4
		jmp	short loc_3A11E

loc_3A11E:
		test	di, 1
		jz	short loc_3A12D
		push	si
		call	sub_3B2
		pop	cx
		jmp	short loc_3A12D

loc_3A12D:
		pop	di
		pop	si
		pop	bp
		retf
sub_3A0E5		endp

; ----------------------------------------------------------------------

sub_3A131		proc far
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FFBAh
		mov	bx, sp
		add	ss:[bx+4], ax
		nop
		nop
		jmp	sub_3A0E5
sub_3A131		endp

; ----------------------------------------------------------------------

sub_3A148		proc far
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FFBAh
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	sub_47B3D
sub_3A148		endp

; ----------------------------------------------------------------------

sub_3A15F		proc far
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FFBAh
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	Widget_Method_Dispatch18_475B1
sub_3A15F		endp

; ----------------------------------------------------------------------

sub_3A176		proc far
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FFBAh
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	sub_4757C
sub_3A176		endp

; ----------------------------------------------------------------------

sub_3A18D		proc far
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FFBAh
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	sub_74F77
sub_3A18D		endp

; ----------------------------------------------------------------------

sub_3A1A4		proc far
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FFBAh
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	sub_74F72
sub_3A1A4		endp

; ----------------------------------------------------------------------

sub_3A1BB		proc far
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FFBAh
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	sub_74F6D
sub_3A1BB		endp

; ----------------------------------------------------------------------

sub_3A1D2		proc far
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FFE0h
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	sub_47B45
sub_3A1D2		endp

; ----------------------------------------------------------------------

sub_3A1E9		proc far
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FFE0h
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	sub_47B3D
sub_3A1E9		endp

; ----------------------------------------------------------------------

sub_3A200		proc far
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FFE0h
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	Widget_Method_Dispatch18_475B1
sub_3A200		endp

; ----------------------------------------------------------------------

sub_3A217		proc far
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FFE0h
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	sub_4757C
sub_3A217		endp

; ----------------------------------------------------------------------

sub_3A22E		proc far
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FFE0h
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	sub_46AE9
sub_3A22E		endp

; ----------------------------------------------------------------------

sub_3A245		proc far
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FFE0h
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	sub_46AC3
sub_3A245		endp

; ----------------------------------------------------------------------

sub_3A25C		proc far
		mov	bx, sp
		mov	bx, ss:[bx+8]
		mov	ax, [bx-2]
		add	ax, 0FFE0h
		mov	bx, sp
		add	ss:[bx+8], ax
		jmp	sub_46A77
sub_3A25C		endp

; ----------------------------------------------------------------------

sub_3A273		proc far
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FFE0h
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	sub_46BA2
sub_3A273		endp

; ----------------------------------------------------------------------

sub_3A28A		proc far
		mov	bx, sp
		mov	bx, ss:[bx+8]
		mov	ax, [bx-2]
		add	ax, 0FFE0h
		mov	bx, sp
		add	ss:[bx+8], ax
		jmp	sub_46AF6
sub_3A28A		endp

; ----------------------------------------------------------------------

sub_3A2A1		proc far
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FFE0h
		mov	bx, sp
		add	ss:[bx+4], ax
		nop
		nop
		jmp	sub_3A0E5
sub_3A2A1		endp

; ----------------------------------------------------------------------

sub_3A2B8		proc far
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FFE0h
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	sub_74F77
sub_3A2B8		endp

; ----------------------------------------------------------------------

sub_3A2CF		proc far
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FFE0h
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	sub_74F72
sub_3A2CF		endp

; ----------------------------------------------------------------------

sub_3A2E6		proc far
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FFE0h
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	sub_74F6D
sub_3A2E6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3A2FD		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_3A333
		test	di, 2
		jz	short loc_3A324
		push	0
		mov	ax, si
		add	ax, 1Ah
		push	ax
		call	sub_74EC9
		add	sp, 4
		jmp	short loc_3A324

loc_3A324:
		test	di, 1
		jz	short loc_3A333
		push	si
		call	sub_3B2
		pop	cx
		jmp	short loc_3A333

loc_3A333:
		pop	di
		pop	si
		pop	bp
		retf
sub_3A2FD		endp

; ----------------------------------------------------------------------

sub_3A337		proc far
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FFE6h
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	sub_46F4E
sub_3A337		endp

; ----------------------------------------------------------------------

sub_3A34E		proc far
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FFE6h
		mov	bx, sp
		add	ss:[bx+4], ax
		nop
		nop
		jmp	sub_3A2FD
sub_3A34E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3A365		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_3A3EF
		mov	bx, [si]
		sub	word ptr [bx-2], 65h
		mov	bx, [si+10h]
		sub	word ptr [bx-2], 65h
		mov	bx, [si]
		add	word ptr [bx-2], 65h
		mov	bx, [si+10h]
		add	word ptr [bx-2], 65h
		mov	bx, [si]
		sub	word ptr [bx-2], 87h
		add	word ptr [bx-2], 87h
		sub	word ptr [bx-2], 8Bh
		mov	bx, [si+10h]
		sub	word ptr [bx-2], 8Bh
		mov	bx, [si]
		sub	word ptr [bx-2], 0Eh
		add	word ptr [bx-2], 0Eh
		add	word ptr [bx-2], 8Bh
		mov	bx, [si+10h]
		add	word ptr [bx-2], 8Bh
		test	di, 2
		jz	short loc_3A3E0
		mov	bx, [si]
		sub	word ptr [bx-2], 0FFC0h
		add	word ptr [bx-2], 0FFC0h
		push	0
		mov	ax, si
		add	ax, 0ABh
		push	ax
		call	sub_74EC9
		add	sp, 4
		jmp	short loc_3A3E0

loc_3A3E0:
		test	di, 1
		jz	short loc_3A3EF
		push	si
		call	sub_3B2
		pop	cx
		jmp	short loc_3A3EF

loc_3A3EF:
		pop	di
		pop	si
		pop	bp
		retf
sub_3A365		endp

; ----------------------------------------------------------------------

sub_3A3F3		proc far
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FF2Fh
		mov	bx, sp
		add	ss:[bx+4], ax
		nop
		nop
		jmp	sub_3A365
sub_3A3F3		endp

; ----------------------------------------------------------------------

sub_3A40A		proc far
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FF2Fh
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	sub_4991D
sub_3A40A		endp

; ----------------------------------------------------------------------

sub_3A421		proc far
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FF2Fh
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	sub_4A8F4
sub_3A421		endp

; ----------------------------------------------------------------------

sub_3A438		proc far
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FF2Fh
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	sub_4A8D7
sub_3A438		endp

; ----------------------------------------------------------------------

sub_3A44F		proc far
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FF2Fh
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	sub_74FCD
sub_3A44F		endp

; ----------------------------------------------------------------------

sub_3A466		proc far
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FF2Fh
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	sub_74FC8
sub_3A466		endp

; ----------------------------------------------------------------------

sub_3A47D		proc far
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FF2Fh
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	sub_74FC3
sub_3A47D		endp

; ----------------------------------------------------------------------

sub_3A494		proc far
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FF55h
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	sub_74FD2
sub_3A494		endp

; ----------------------------------------------------------------------

sub_3A4AB		proc far
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FF55h
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	sub_4B6E2
sub_3A4AB		endp

; ----------------------------------------------------------------------

sub_3A4C2		proc far
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FF55h
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	sub_4991D
sub_3A4C2		endp

; ----------------------------------------------------------------------

sub_3A4D9		proc far
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FF55h
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	sub_4A8F4
sub_3A4D9		endp

; ----------------------------------------------------------------------

sub_3A4F0		proc far
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FF55h
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	sub_4A8D7
sub_3A4F0		endp

; ----------------------------------------------------------------------

sub_3A507		proc far
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FF55h
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	sub_492E3
sub_3A507		endp

; ----------------------------------------------------------------------

sub_3A51E		proc far
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FF55h
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	sub_46AE9
sub_3A51E		endp

; ----------------------------------------------------------------------

sub_3A535		proc far
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FF55h
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	sub_46AC3
sub_3A535		endp

; ----------------------------------------------------------------------

sub_3A54C		proc far
		mov	bx, sp
		mov	bx, ss:[bx+8]
		mov	ax, [bx-2]
		add	ax, 0FF55h
		mov	bx, sp
		add	ss:[bx+8], ax
		jmp	sub_46A77
sub_3A54C		endp

; ----------------------------------------------------------------------

sub_3A563		proc far
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FF55h
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	sub_46BA2
sub_3A563		endp

; ----------------------------------------------------------------------

sub_3A57A		proc far
		mov	bx, sp
		mov	bx, ss:[bx+8]
		mov	ax, [bx-2]
		add	ax, 0FF55h
		mov	bx, sp
		add	ss:[bx+8], ax
		jmp	sub_46AF6
sub_3A57A		endp

; ----------------------------------------------------------------------

sub_3A591		proc far
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FF55h
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	sub_4B575
sub_3A591		endp

; ----------------------------------------------------------------------

sub_3A5A8		proc far
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FF55h
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	sub_4908A
sub_3A5A8		endp

; ----------------------------------------------------------------------

sub_3A5BF		proc far
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FF55h
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	sub_47CD1
sub_3A5BF		endp

; ----------------------------------------------------------------------

sub_3A5D6		proc far
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FF55h
		mov	bx, sp
		add	ss:[bx+4], ax
		nop
		nop
		jmp	sub_3A365
sub_3A5D6		endp

; ----------------------------------------------------------------------

sub_3A5ED		proc far
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FF55h
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	sub_74FCD
sub_3A5ED		endp

; ----------------------------------------------------------------------

sub_3A604		proc far
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FF55h
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	sub_74FC8
sub_3A604		endp

; ----------------------------------------------------------------------

sub_3A61B		proc far
		mov	bx, sp
		mov	bx, ss:[bx+4]
		mov	ax, [bx-2]
		add	ax, 0FF55h
		mov	bx, sp
		add	ss:[bx+4], ax
		jmp	sub_74FC3
sub_3A61B		endp

; ----------------------------------------------------------------------

sub_3A632		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFDEh
		nop
		nop
		jmp	sub_3A365
sub_3A632		endp

; ----------------------------------------------------------------------

sub_3A63E		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFDEh
		jmp	sub_74FD2
sub_3A63E		endp

; ----------------------------------------------------------------------

sub_3A64A		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFDEh
		jmp	sub_4991D
sub_3A64A		endp

; ----------------------------------------------------------------------

sub_3A656		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFDEh
		jmp	sub_4A8F4
sub_3A656		endp

; ----------------------------------------------------------------------

sub_3A662		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFDEh
		jmp	sub_4A8D7
sub_3A662		endp

; ----------------------------------------------------------------------

sub_3A66E		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFDEh
		jmp	sub_74FCD
sub_3A66E		endp

; ----------------------------------------------------------------------

sub_3A67A		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFDEh
		jmp	sub_74FC8
sub_3A67A		endp

; ----------------------------------------------------------------------

sub_3A686		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFDEh
		jmp	sub_74FC3
sub_3A686		endp

; ----------------------------------------------------------------------

sub_3A692		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFE2h
		nop
		nop
		jmp	sub_3A365
sub_3A692		endp

; ----------------------------------------------------------------------

sub_3A69E		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFE2h
		jmp	sub_4991D
sub_3A69E		endp

; ----------------------------------------------------------------------

sub_3A6AA		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFE2h
		jmp	sub_4A8F4
sub_3A6AA		endp

; ----------------------------------------------------------------------

sub_3A6B6		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFE2h
		jmp	sub_4A8D7
sub_3A6B6		endp

; ----------------------------------------------------------------------

sub_3A6C2		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFE2h
		jmp	sub_74FCD
sub_3A6C2		endp

; ----------------------------------------------------------------------

sub_3A6CE		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFE2h
		jmp	sub_74FC8
sub_3A6CE		endp

; ----------------------------------------------------------------------

sub_3A6DA		proc far
		mov	bx, sp
sub_3A6DA		endp

; START OF FUNCTION CHUNK FOR sub_3A6DA
		db 36h, 83h, 47h, 4
; END OF FUNCTION CHUNK FOR sub_3A6DA
seg091		ends
