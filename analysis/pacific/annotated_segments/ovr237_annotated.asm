ovr237		segment	para public 'OVERLAY' use16
		assume cs:ovr237
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_854D0		proc far

var_118		= dword ptr -118h
var_110		= word ptr -110h
var_C0		= word ptr -0C0h
var_63		= dword ptr -63h
var_5F		= dword ptr -5Fh
var_5B		= dword ptr -5Bh
var_46		= word ptr -46h
var_44		= word ptr -44h
var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_8		= byte ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_1		= byte ptr -1
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 110h
		push	si
		push	di
		mov	si, [bp+arg_4]
		push	si
		push	large [bp+arg_0]
		call	sub_10409
		add	sp, 6
		cmp	word ptr [si+2], 0
		jz	short loc_85511
		mov	di, [si+2]
		mov	eax, [di]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+0Fh], eax
		mov	eax, [di+4]
		mov	es:[bx+13h], eax
		mov	eax, [di+8]
		mov	es:[bx+17h], eax
		jmp	short loc_85526

loc_85511:
		les	bx, word ptr [bp+arg_0]
		xor	eax, eax
		mov	es:[bx+17h], eax
		mov	es:[bx+13h], eax
		mov	es:[bx+0Fh], eax

loc_85526:
		cmp	word ptr [si+4], 0
		jz	short loc_8554E
		mov	si, [si+4]
		mov	eax, [si]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+73h], eax
		mov	eax, [si+4]
		mov	es:[bx+77h], eax
		mov	eax, [si+8]
		mov	es:[bx+7Bh], eax
		jmp	short loc_85563

loc_8554E:
		les	bx, word ptr [bp+arg_0]
		xor	eax, eax
		mov	es:[bx+7Bh], eax
		mov	es:[bx+77h], eax
		mov	es:[bx+73h], eax

loc_85563:
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx+0Dh], 1
		mov	[bp+var_1], 0
		mov	cl, 1
		mov	ax, es:[bx+0Ah]
		cmp	ax, word_7CADA
		jz	short loc_855BF
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 73h
		mov	[bp+var_4], ax
		mov	[bp+var_6], dx
		les	si, [bp+var_6]
		mov	eax, es:[si]
		mov	es, word ptr [bp+arg_0+2]
		mov	bx, es:[bx+0Ah]
		mov	[bx+12h], eax
		mov	eax, es:[si+4]
		mov	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+0Ah]
		mov	[bx+16h], eax
		mov	eax, es:[si+8]
		mov	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+0Ah]
		mov	[bx+1Ah], eax
		jmp	short loc_85613

loc_855BF:
		les	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+0Ah]
		les	bx, [bx+63h]
		cmp	byte ptr es:[bx+42h], 0
		jz	short loc_855D5
		mov	ax, 1
		jmp	short loc_855D7

loc_855D5:
		xor	ax, ax

loc_855D7:
		or	al, al
		jz	short loc_855FE
		les	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+0Ah]
		les	bx, [bx+63h]
		mov	al, es:[bx+42h]
		les	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+0Ah]
		les	bx, [bx+63h]
		cmp	al, es:[bx+7]
		jb	short loc_855FE
		mov	ax, 1
		jmp	short loc_85600

loc_855FE:
		xor	ax, ax

loc_85600:
		mov	[bp+var_1], al
		push	1
		push	word_79B8C
		call	sub_55F03
		add	sp, 4
		mov	cl, al

loc_85613:
		cmp	[bp+var_1], 0
		jz	short loc_85644
		sub	sp, 4
		mov	[bp+var_118], 500h
		push	ds
		push	offset aLandingGearDamaged
		push	ds
		push	offset unk_7CEFE
		call	GlyphObject_Helper9_15CE5
		add	sp, 0Ch
		push	large [bp+arg_0]
		call	sub_10381
		add	sp, 4
		jmp	loc_85805

loc_85644:
		mov	al, cl
		mov	ah, 0
		or	ax, ax
		jnz	short loc_8565B
		push	large [bp+arg_0]
		call	sub_10381
		add	sp, 4
		jmp	loc_85805

loc_8565B:
		les	bx, word ptr [bp+arg_0]
		push	word ptr es:[bx+0Ah]
		mov	bx, es:[bx+0Ah]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx
		mov	[bp+var_12], dx
		mov	[bp+var_14], ax
		mov	ax, [bp+var_12]
		mov	dx, [bp+var_14]
		add	dx, 36h
		mov	[bp+var_16], ax
		mov	[bp+var_18], dx
		push	8
		push	ax
		push	dx
		push	ss
		lea	ax, [bp+var_10]
		push	ax
		call	sub_39E1
		add	sp, 0Ah
		mov	[bp+var_8], 0
		lea	ax, [bp+var_C0]
		push	ax
		call	StreamReader_ConstructVariantA_6BF3A
		pop	cx
		mov	[bp+var_C0], 508h
		mov	[bp+var_5F], 100h
		mov	[bp+var_63], 0
		mov	[bp+var_C0], 520h
		mov	[bp+var_44], 0
		xor	ax, ax
		mov	[bp+var_46], ax
		movsx	eax, ax
		mov	[bp+var_5B], eax
		push	seg seg225
		push	0
		push	ss
		lea	ax, [bp+var_10]
		push	ax
		push	ds
		push	offset aOBJECTS
		lea	ax, [bp+var_110]
		push	ax
		call	sub_29540
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_110]
		push	ax
		lea	ax, [bp+var_C0]
		push	ax
		mov	bx, [bp+var_C0]
		call	dword ptr [bx+14h]
		add	sp, 6
		or	al, al
		jnz	short loc_85707
		jmp	loc_857CD

loc_85707:
		push	0
		push	large 4C414552h
		lea	ax, [bp+var_C0]
		push	ax
		call	ResourceRecord_SeekAndReadB_6D82B
		add	sp, 8
		or	ax, ax
		jnz	short loc_85723
		jmp	loc_857CD

loc_85723:
		push	0
		push	large 544A424Fh
		lea	ax, [bp+var_C0]
		push	ax
		call	ResourceRecord_SeekAndReadB_6D82B
		add	sp, 8
		or	ax, ax
		jnz	short loc_8573F
		jmp	loc_857CD

loc_8573F:
		push	0
		push	large 5054454Ah
		lea	ax, [bp+var_C0]
		push	ax
		call	ResourceRecord_SeekAndReadB_6D82B
		add	sp, 8
		or	ax, ax
		jz	short loc_857CD
		push	0
		push	large 444E414Ch
		lea	ax, [bp+var_C0]
		push	ax
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_857C4
		lea	ax, [bp+var_C0]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+8Ch], ax
		lea	ax, [bp+var_C0]
		push	ax
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+8Eh], eax
		lea	ax, [bp+var_C0]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+92h], ax
		lea	ax, [bp+var_C0]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+94h], ax
		jmp	short loc_857CD

loc_857C4:
		push	8014h
		call	sub_1DDFE
		pop	cx

loc_857CD:
		push	0Bh
		call	Music_SetPendingTune_5ED30
		pop	cx
		push	large [bp+arg_0]
		les	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx]
		call	dword ptr [bx+0Ch]
		add	sp, 4
		mov	[bp+var_C0], 520h
		lea	ax, [bp+var_C0]
		push	ax
		call	ResourceRecord_Helper_6D61E
		pop	cx
		push	0
		lea	ax, [bp+var_C0]
		push	ax
		call	StreamReader_ReleaseBuffer_6DFAB
		add	sp, 4

loc_85805:
		pop	di
		pop	si
		leave
		retf
sub_854D0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_85809		proc far

var_38		= dword ptr -38h
var_34		= dword ptr -34h
var_30		= dword ptr -30h
var_2C		= dword ptr -2Ch
var_28		= dword ptr -28h
var_24		= dword ptr -24h
var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= dword ptr -0Ch
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 38h
		push	si
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 0Fh
		mov	[bp+var_2], ax
		mov	[bp+var_4], dx
		les	si, [bp+var_4]
		mov	eax, es:[si]
		mov	[bp+var_20], eax
		mov	eax, es:[si+4]
		mov	[bp+var_1C], eax
		mov	eax, es:[si+8]
		mov	[bp+var_18], eax
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 73h
		mov	[bp+var_6], ax
		mov	[bp+var_8], dx
		les	si, [bp+var_8]
		mov	eax, es:[si]
		mov	[bp+var_2C], eax
		mov	eax, es:[si+4]
		mov	[bp+var_28], eax
		mov	eax, es:[si+8]
		mov	[bp+var_24], eax
		mov	eax, [bp+var_2C]
		sub	[bp+var_20], eax
		mov	eax, [bp+var_28]
		sub	[bp+var_1C], eax
		mov	eax, [bp+var_24]
		sub	[bp+var_18], eax
		lea	ax, word ptr [bp+var_20]
		push	ax
		call	Vector_Normalize3D_57796
		pop	cx
		mov	[bp+var_C], 1F400h
		mov	eax, [bp+var_20]
		mov	edx, [bp+var_C]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_20], eax
		mov	eax, [bp+var_1C]
		mov	edx, [bp+var_C]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_1C], eax
		mov	eax, [bp+var_18]
		mov	edx, [bp+var_C]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_18], eax
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 0Fh
		mov	[bp+var_E], ax
		mov	[bp+var_10], dx
		les	si, [bp+var_10]
		mov	eax, es:[si]
		les	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+0Ah]
		mov	[bx+12h], eax
		mov	eax, es:[si+4]
		mov	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+0Ah]
		mov	[bx+16h], eax
		mov	eax, es:[si+8]
		mov	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+0Ah]
		mov	[bx+1Ah], eax
		mov	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+0Ah]
		mov	eax, [bp+var_20]
		sub	[bx+12h], eax
		mov	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+0Ah]
		mov	eax, [bp+var_1C]
		sub	[bx+16h], eax
		mov	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+0Ah]
		mov	eax, [bp+var_18]
		sub	[bx+1Ah], eax
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 0Fh
		mov	[bp+var_12], ax
		mov	[bp+var_14], dx
		les	si, [bp+var_14]
		mov	eax, es:[si]
		mov	[bp+var_38], eax
		mov	eax, es:[si+4]
		mov	[bp+var_34], eax
		mov	eax, es:[si+8]
		mov	[bp+var_30], eax
		lea	ax, word ptr [bp+var_38]
		push	ax
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_85AAC
		add	sp, 6
		pop	si
		leave
		retf
sub_85809		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_8597B		proc far

var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 10h
		push	si
		les	bx, word ptr [bp+arg_0]
		mov	ax, es:[bx+0Ah]
		cmp	ax, word_7CADA
		jnz	short loc_859B5
		mov	al, byte_7CAC3
		mov	ah, 0
		cmp	ax, 1
		jz	short loc_8599B
		jmp	short loc_859B5

loc_8599B:
		push	1
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_86B4A
		add	sp, 6
		push	large [bp+arg_0]
		call	sub_10381
		add	sp, 4

loc_859B5:
		les	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+6]
		push	word ptr es:[bx+0Bh]
		mov	bx, es:[bx+0Bh]
		mov	bx, [bx+2]
		call	dword ptr [bx+48h]
		pop	cx
		mov	bx, ax
		and	byte ptr [bx+92h], 0DFh
		les	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+0Dh]
		dec	bx
		cmp	bx, 5
		ja	short loc_859E6
		shl	bx, 1
		jmp	cs:off_85AA0[bx]	; switch jump

loc_859E6:
		push	8012h
		call	sub_1DDFE
		pop	cx

loc_859EF:
		les	bx, word ptr [bp+arg_0]
		mov	ax, es:[bx+0Ah]
		cmp	ax, word_7CADA
		jnz	short loc_85A19
		push	word ptr [bp+arg_0+2]
		push	bx
		push	cs
		call	near ptr sub_85809
		add	sp, 4
		push	ds
		push	offset aLANDING
		push	67B7h
		call	sub_737C8
		add	sp, 6
		jmp	loc_85A9D

loc_85A19:
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 0Fh
		mov	[bp+var_2], ax
		mov	[bp+var_4], dx
		les	si, [bp+var_4]
		mov	eax, es:[si]
		mov	[bp+var_10], eax
		mov	eax, es:[si+4]
		mov	[bp+var_C], eax
		mov	eax, es:[si+8]
		mov	[bp+var_8], eax
		lea	ax, word ptr [bp+var_10]
		push	ax
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_85AAC
		add	sp, 6
		jmp	short loc_85A9D

loc_85A57:
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_86080
		add	sp, 4
		jmp	short loc_85A9D

loc_85A65:
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_862E7
		add	sp, 4
		jmp	short loc_85A9D

loc_85A73:
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_868EC
		add	sp, 4
		jmp	short loc_85A9D

loc_85A81:
		push	0
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_86B4A
		add	sp, 6
		jmp	short loc_85A9D

loc_85A91:
		push	large [bp+arg_0]
		call	sub_10381
		add	sp, 4

loc_85A9D:
		pop	si
		leave
		retf
sub_8597B		endp

; START OF FUNCTION CHUNK FOR sub_8597B
off_85AA0	dw offset loc_859EF
		dw offset loc_85A57
		dw offset loc_85A65
		dw offset loc_85A73
		dw offset loc_85A81
		dw offset loc_85A91
; END OF FUNCTION CHUNK FOR sub_8597B

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_85AAC		proc far

var_96		= dword ptr -96h
var_92		= dword ptr -92h
var_8E		= dword ptr -8Eh
var_8A		= dword ptr -8Ah
var_86		= dword ptr -86h
var_82		= dword ptr -82h
var_72		= dword ptr -72h
var_6E		= dword ptr -6Eh
var_6A		= dword ptr -6Ah
var_66		= dword ptr -66h
var_62		= dword ptr -62h
var_5E		= dword ptr -5Eh
var_5A		= dword ptr -5Ah
var_56		= dword ptr -56h
var_52		= dword ptr -52h
var_4E		= dword ptr -4Eh
var_4A		= dword ptr -4Ah
var_46		= dword ptr -46h
var_42		= dword ptr -42h
var_3E		= dword ptr -3Eh
var_3A		= dword ptr -3Ah
var_36		= word ptr -36h
var_34		= word ptr -34h
var_32		= dword ptr -32h
var_2E		= word ptr -2Eh
var_2C		= word ptr -2Ch
var_2A		= dword ptr -2Ah
var_26		= dword ptr -26h
var_22		= dword ptr -22h
var_1E		= dword ptr -1Eh
var_1A		= dword ptr -1Ah
var_16		= word ptr -16h
var_14		= dword ptr -14h
var_10		= word ptr -10h
var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 96h
		push	si
		les	bx, [bp+arg_0]
		mov	si, es:[bx+0Ah]
		add	si, 12h
		mov	eax, [si]
		mov	es:[bx+5Bh], eax
		mov	eax, [si+4]
		mov	es:[bx+5Fh], eax
		mov	eax, [si+8]
		mov	es:[bx+63h], eax
		mov	si, [bp+arg_4]
		mov	eax, [si]
		mov	[bp+var_42], eax
		mov	eax, [si+4]
		mov	[bp+var_3E], eax
		mov	eax, [si+8]
		mov	[bp+var_3A], eax
		mov	ax, es:[bx+92h]
		mov	[bp+var_2], ax
		movsx	eax, [bp+var_2]
		shl	eax, 8
		add	[bp+var_3A], eax
		mov	eax, [bp+var_42]
		mov	es:[bx+67h], eax
		mov	eax, [bp+var_3E]
		mov	es:[bx+6Bh], eax
		mov	eax, [bp+var_3A]
		mov	es:[bx+6Fh], eax
		mov	ax, [bp+arg_2]
		mov	dx, [bp+arg_0]
		add	dx, 5Bh
		mov	[bp+var_4], ax
		mov	[bp+var_6], dx
		les	si, [bp+var_6]
		mov	eax, es:[si]
		mov	[bp+var_5A], eax
		mov	eax, es:[si+4]
		mov	[bp+var_56], eax
		mov	eax, es:[si+8]
		mov	[bp+var_52], eax
		mov	eax, [bp+var_42]
		sub	eax, [bp+var_5A]
		mov	[bp+var_4E], eax
		mov	eax, [bp+var_3E]
		sub	eax, [bp+var_56]
		mov	[bp+var_4A], eax
		mov	eax, [bp+var_3A]
		sub	eax, [bp+var_52]
		mov	[bp+var_46], eax
		cmp	[bp+var_4E], 0
		jnz	short loc_85B7E
		mov	ax, 1
		jmp	short loc_85B80

loc_85B7E:
		xor	ax, ax

loc_85B80:
		or	al, al
		jz	short loc_85BA3
		cmp	[bp+var_4A], 0
		jle	short loc_85B90
		mov	ax, 1
		jmp	short loc_85B92

loc_85B90:
		xor	ax, ax

loc_85B92:
		or	al, al
		jz	short loc_85BA3
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx+96h], 0
		jmp	loc_85C31

loc_85BA3:
		cmp	[bp+var_4E], 0
		jnz	short loc_85BAF
		mov	ax, 1
		jmp	short loc_85BB1

loc_85BAF:
		xor	ax, ax

loc_85BB1:
		or	al, al
		jz	short loc_85BD3
		cmp	[bp+var_4A], 0
		jge	short loc_85BC1
		mov	ax, 1
		jmp	short loc_85BC3

loc_85BC1:
		xor	ax, ax

loc_85BC3:
		or	al, al
		jz	short loc_85BD3
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx+96h], 0B4h
		jmp	short loc_85C31

loc_85BD3:
		cmp	[bp+var_4A], 0
		jnz	short loc_85BDF
		mov	ax, 1
		jmp	short loc_85BE1

loc_85BDF:
		xor	ax, ax

loc_85BE1:
		or	al, al
		jz	short loc_85C03
		cmp	[bp+var_4E], 0
		jle	short loc_85BF1
		mov	ax, 1
		jmp	short loc_85BF3

loc_85BF1:
		xor	ax, ax

loc_85BF3:
		or	al, al
		jz	short loc_85C03
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx+96h], 10Eh
		jmp	short loc_85C31

loc_85C03:
		cmp	[bp+var_4A], 0
		jnz	short loc_85C0F
		mov	ax, 1
		jmp	short loc_85C11

loc_85C0F:
		xor	ax, ax

loc_85C11:
		or	al, al
		jz	short loc_85C31
		cmp	[bp+var_4E], 0
		jge	short loc_85C21
		mov	ax, 1
		jmp	short loc_85C23

loc_85C21:
		xor	ax, ax

loc_85C23:
		or	al, al
		jz	short loc_85C31
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx+96h], 5Ah

loc_85C31:
		push	large [bp+var_46]
		push	large [bp+var_4A]
		push	large [bp+var_4E]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_E], eax
		mov	[bp+var_A], eax
		lea	ax, word ptr [bp+var_4E]
		push	ax
		call	Vector_NormalizeInPlace_57715
		pop	cx
		les	bx, [bp+arg_0]
		mov	eax, [bp+var_4E]
		mov	es:[bx+7Fh], eax
		mov	eax, [bp+var_4A]
		mov	es:[bx+83h], eax
		mov	eax, [bp+var_46]
		mov	es:[bx+87h], eax
		mov	ax, es:[bx+8Ch]
		mov	[bp+var_10], ax
		movsx	eax, [bp+var_10]
		shl	eax, 8
		mov	[bp+var_14], eax
		mov	eax, [bp+var_14]
		mov	es:[bx+3Fh], eax
		mov	ax, es:[bx+8Ch]
		mov	[bp+var_16], ax
		movsx	eax, [bp+var_16]
		shl	eax, 8
		mov	[bp+var_1A], eax
		mov	eax, [bp+var_1A]
		mov	es:[bx+43h], eax
		push	large 0
		push	0
		lea	ax, word ptr [bp+var_66]
		push	ax
		call	Utility_Helper_57B7D
		add	sp, 8
		les	bx, [bp+arg_0]
		les	bx, es:[bx+6]
		mov	bx, es:[bx+0Bh]
		mov	bx, [bx]
		mov	eax, [bp+var_66]
		mov	[bx+2], eax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+6]
		mov	bx, es:[bx+0Bh]
		mov	bx, [bx]
		mov	eax, [bp+var_62]
		mov	[bx+6], eax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+6]
		mov	bx, es:[bx+0Bh]
		mov	bx, [bx]
		mov	eax, [bp+var_5E]
		mov	[bx+0Ah], eax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+6]
		mov	bx, es:[bx+0Bh]
		mov	ax, [bx]
		add	ax, 2
		lea	ax, word ptr [bp+var_66]
		push	ax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+6]
		push	word ptr es:[bx+0Bh]
		mov	bx, es:[bx+0Bh]
		mov	bx, [bx+2]
		call	dword ptr [bx+10h]
		add	sp, 4
		mov	[bp+var_1E], 0
		mov	eax, [bp+var_1E]
		les	bx, [bp+arg_0]
		mov	es:[bx+4Bh], eax
		mov	[bp+var_22], 0
		mov	eax, [bp+var_22]
		mov	es:[bx+53h], eax
		mov	byte ptr es:[bx+8Bh], 0
		mov	ax, [bp+arg_2]
		mov	dx, [bp+arg_0]
		add	dx, 3Fh
		mov	[bp+var_2C], ax
		mov	[bp+var_2E], dx
		les	bx, [bp+var_2E]
		mov	eax, es:[bx]
		mov	[bp+var_2A], eax
		mov	eax, [bp+var_A]
		mov	edx, eax
		mov	ecx, [bp+var_2A]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_26], eax
		mov	eax, [bp+var_26]
		mov	[bp+var_32], eax
		mov	eax, [bp+var_32]
		les	bx, [bp+arg_0]
		mov	es:[bx+4Fh], eax
		mov	bx, es:[bx+0Ah]
		mov	byte ptr [bx+5Eh], 1
		mov	bx, [bp+arg_0]
		les	bx, es:[bx+6]
		mov	bx, es:[bx+0Bh]
		or	byte ptr [bx+92h], 4
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+96h]
		mov	[bp+var_34], ax
		mov	cx, 4
		mov	bx, offset word_86070

loc_85DCF:
		mov	ax, cs:[bx]
		cmp	ax, [bp+var_34]
		jz	short loc_85DDF
		add	bx, 2
		loop	short loc_85DCF
		jmp	loc_86066

loc_85DDF:
		jmp	word ptr cs:[bx+8] ; switch jump

loc_85DE3:
		push	large 1
		push	0
		lea	ax, word ptr [bp+var_72]
		push	ax
		call	Utility_Helper_57B7D
		add	sp, 8
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+0Ah]
		mov	bx, es:[bx+0Ah]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		mov	[bp+var_36], ax
		push	ax
		lea	ax, word ptr [bp+var_96]
		push	ax
		call	AI_ComputeGeometryHelper_58BF2
		add	sp, 4
		mov	eax, [bp+var_72]
		mov	[bp+var_8A], eax
		mov	eax, [bp+var_6E]
		mov	[bp+var_86], eax
		mov	eax, [bp+var_6A]
		mov	[bp+var_82], eax
		push	large 0
		push	1
		lea	ax, word ptr [bp+var_72]
		push	ax
		call	Utility_Helper_57B7D
		add	sp, 8
		mov	eax, [bp+var_72]
		mov	[bp+var_96], eax
		mov	eax, [bp+var_6E]
		mov	[bp+var_92], eax
		mov	eax, [bp+var_6A]
		mov	[bp+var_8E], eax
		lea	ax, word ptr [bp+var_96]
		push	ax
		call	Matrix_OrthonormalizeKeepRow1_59429
		pop	cx
		lea	ax, word ptr [bp+var_96]
		push	ax
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+0Ah]
		mov	bx, es:[bx+0Ah]
		mov	bx, [bx]
		call	dword ptr [bx+40h]
		add	sp, 4
		jmp	loc_86066

loc_85E83:
		push	large 0
		push	1
		lea	ax, word ptr [bp+var_72]
		push	ax
		call	Utility_Helper_57B7D
		add	sp, 8
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+0Ah]
		mov	bx, es:[bx+0Ah]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		mov	[bp+var_36], ax
		push	ax
		lea	ax, word ptr [bp+var_96]
		push	ax
		call	AI_ComputeGeometryHelper_58BF2
		add	sp, 4
		mov	eax, [bp+var_72]
		mov	[bp+var_8A], eax
		mov	eax, [bp+var_6E]
		mov	[bp+var_86], eax
		mov	eax, [bp+var_6A]
		mov	[bp+var_82], eax
		push	large 0FFFFh
		push	0
		lea	ax, word ptr [bp+var_72]
		push	ax
		call	Utility_Helper_57B7D
		add	sp, 8
		mov	eax, [bp+var_72]
		mov	[bp+var_96], eax
		mov	eax, [bp+var_6E]
		mov	[bp+var_92], eax
		mov	eax, [bp+var_6A]
		mov	[bp+var_8E], eax
		lea	ax, word ptr [bp+var_96]
		push	ax
		call	Matrix_OrthonormalizeKeepRow1_59429
		pop	cx
		lea	ax, word ptr [bp+var_96]
		push	ax
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+0Ah]
		mov	bx, es:[bx+0Ah]
		mov	bx, [bx]
		call	dword ptr [bx+40h]
		add	sp, 4
		jmp	loc_86066

loc_85F26:
		push	large 0FFFFh
		push	0
		lea	ax, word ptr [bp+var_72]
		push	ax
		call	Utility_Helper_57B7D
		add	sp, 8
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+0Ah]
		mov	bx, es:[bx+0Ah]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		mov	[bp+var_36], ax
		push	ax
		lea	ax, word ptr [bp+var_96]
		push	ax
		call	AI_ComputeGeometryHelper_58BF2
		add	sp, 4
		mov	eax, [bp+var_72]
		mov	[bp+var_8A], eax
		mov	eax, [bp+var_6E]
		mov	[bp+var_86], eax
		mov	eax, [bp+var_6A]
		mov	[bp+var_82], eax
		push	large 0
		push	0FFFFh
		lea	ax, word ptr [bp+var_72]
		push	ax
		call	Utility_Helper_57B7D
		add	sp, 8
		mov	eax, [bp+var_72]
		mov	[bp+var_96], eax
		mov	eax, [bp+var_6E]
		mov	[bp+var_92], eax
		mov	eax, [bp+var_6A]
		mov	[bp+var_8E], eax
		lea	ax, word ptr [bp+var_96]
		push	ax
		call	Matrix_OrthonormalizeKeepRow1_59429
		pop	cx
		lea	ax, word ptr [bp+var_96]
		push	ax
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+0Ah]
		mov	bx, es:[bx+0Ah]
		mov	bx, [bx]
		call	dword ptr [bx+40h]
		add	sp, 4
		jmp	loc_86066

loc_85FC9:
		push	large 0
		push	0FFFFh
		lea	ax, word ptr [bp+var_72]
		push	ax
		call	Utility_Helper_57B7D
		add	sp, 8
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+0Ah]
		mov	bx, es:[bx+0Ah]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		mov	[bp+var_36], ax
		push	ax
		lea	ax, word ptr [bp+var_96]
		push	ax
		call	AI_ComputeGeometryHelper_58BF2
		add	sp, 4
		mov	eax, [bp+var_72]
		mov	[bp+var_8A], eax
		mov	eax, [bp+var_6E]
		mov	[bp+var_86], eax
		mov	eax, [bp+var_6A]
		mov	[bp+var_82], eax
		push	large 1
		push	0
		lea	ax, word ptr [bp+var_72]
		push	ax
		call	Utility_Helper_57B7D
		add	sp, 8
		mov	eax, [bp+var_72]
		mov	[bp+var_96], eax
		mov	eax, [bp+var_6E]
		mov	[bp+var_92], eax
		mov	eax, [bp+var_6A]
		mov	[bp+var_8E], eax
		lea	ax, word ptr [bp+var_96]
		push	ax
		call	Matrix_OrthonormalizeKeepRow1_59429
		pop	cx
		lea	ax, word ptr [bp+var_96]
		push	ax
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+0Ah]
		mov	bx, es:[bx+0Ah]
		mov	bx, [bx]
		call	dword ptr [bx+40h]
		add	sp, 4

loc_86066:
		les	bx, [bp+arg_0]
		inc	word ptr es:[bx+0Dh]
		pop	si
		leave
		retf
sub_85AAC		endp

; START OF FUNCTION CHUNK FOR sub_85AAC
word_86070	dw 0
		dw 5Ah
		dw 0B4h
		dw 10Eh
off_86078	dw offset loc_85DE3
		dw offset loc_85FC9
		dw offset loc_85F26
		dw offset loc_85E83
; END OF FUNCTION CHUNK FOR sub_85AAC

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_86080		proc far

var_78		= word ptr -78h
var_54		= dword ptr -54h
var_50		= dword ptr -50h
var_4C		= dword ptr -4Ch
var_48		= dword ptr -48h
var_44		= dword ptr -44h
var_40		= dword ptr -40h
var_3C		= dword ptr -3Ch
var_38		= dword ptr -38h
var_34		= dword ptr -34h
var_30		= dword ptr -30h
var_2C		= word ptr -2Ch
var_2A		= dword ptr -2Ah
var_26		= word ptr -26h
var_24		= word ptr -24h
var_22		= word ptr -22h
var_20		= word ptr -20h
var_1E		= dword ptr -1Eh
var_1A		= word ptr -1Ah
var_18		= word ptr -18h
var_16		= dword ptr -16h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= dword ptr -0Eh
var_A		= word ptr -0Ah
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 78h
		push	si
		push	di
		les	bx, [bp+arg_0]
		les	bx, es:[bx+6]
		les	bx, es:[bx+7]
		mov	word ptr es:[bx+21h], 0
		les	bx, [bp+arg_0]
		les	bx, es:[bx+6]
		les	bx, es:[bx+7]
		mov	word ptr es:[bx+1Fh], 0
		les	bx, [bp+arg_0]
		les	bx, es:[bx+6]
		les	bx, es:[bx+7]
		mov	word ptr es:[bx+23h], 0
		mov	[bp+var_4], 100h
		mov	eax, [bp+var_4]
		les	bx, [bp+arg_0]
		les	bx, es:[bx+6]
		mov	bx, es:[bx+0Bh]
		mov	[bx+99h], eax
		les	bx, [bp+arg_0]
		mov	eax, dword_7976E
		add	es:[bx+53h], eax
		mov	[bp+var_8], 100h
		mov	eax, [bp+var_8]
		sub	es:[bx+4Bh], eax
		mov	eax, es:[bx+4Bh]
		sar	eax, 8
		movsx	edx, word ptr es:[bx+94h]
		cmp	eax, edx
		jge	short loc_86129
		mov	ax, es:[bx+94h]
		mov	[bp+var_A], ax
		movsx	eax, [bp+var_A]
		shl	eax, 8
		mov	[bp+var_E], eax
		mov	eax, [bp+var_E]
		mov	es:[bx+4Bh], eax
		jmp	short loc_86183

loc_86129:
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+0Ah]
		mov	bx, es:[bx+0Ah]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		mov	[bp+var_2C], ax
		push	ax
		lea	ax, [bp+var_78]
		push	ax
		call	AI_ComputeGeometryHelper_58BF2
		add	sp, 4
		mov	[bp+var_30], 100h
		lea	ax, word ptr [bp+var_30]
		push	ax
		lea	ax, [bp+var_78]
		push	ax
		call	Matrix_BuildAxisX_58C8C
		add	sp, 4
		lea	ax, [bp+var_78]
		push	ax
		call	Matrix_OrthonormalizeKeepRow1_59429
		pop	cx
		lea	ax, [bp+var_78]
		push	ax
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+0Ah]
		mov	bx, es:[bx+0Ah]
		mov	bx, [bx]
		call	dword ptr [bx+40h]
		add	sp, 4

loc_86183:
		mov	ax, [bp+arg_2]
		mov	dx, [bp+arg_0]
		add	dx, 7Fh
		mov	[bp+var_10], ax
		mov	[bp+var_12], dx
		les	si, [bp+var_12]
		mov	eax, es:[si]
		mov	[bp+var_3C], eax
		mov	eax, es:[si+4]
		mov	[bp+var_38], eax
		mov	eax, es:[si+8]
		mov	[bp+var_34], eax
		mov	ax, [bp+arg_2]
		mov	dx, [bp+arg_0]
		add	dx, 3Fh
		mov	[bp+var_18], ax
		mov	[bp+var_1A], dx
		les	bx, [bp+var_1A]
		mov	eax, es:[bx]
		mov	[bp+var_16], eax
		mov	eax, [bp+var_3C]
		mov	edx, [bp+var_16]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_3C], eax
		mov	eax, [bp+var_38]
		mov	edx, [bp+var_16]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_38], eax
		mov	eax, [bp+var_34]
		mov	edx, [bp+var_16]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_34], eax
		mov	ax, [bp+arg_2]
		mov	dx, [bp+arg_0]
		add	dx, 53h
		mov	[bp+var_20], ax
		mov	[bp+var_22], dx
		les	bx, [bp+var_22]
		mov	eax, es:[bx]
		mov	[bp+var_1E], eax
		mov	eax, [bp+var_3C]
		mov	edx, [bp+var_1E]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_48], eax
		mov	eax, [bp+var_38]
		mov	edx, [bp+var_1E]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_44], eax
		mov	eax, [bp+var_34]
		mov	edx, [bp+var_1E]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_40], eax
		les	bx, [bp+arg_0]
		mov	si, es:[bx+0Ah]
		add	si, 12h
		mov	ax, [bp+arg_2]
		mov	dx, [bp+arg_0]
		add	dx, 5Bh
		mov	[bp+var_24], ax
		mov	[bp+var_26], dx
		les	di, [bp+var_26]
		mov	eax, es:[di]
		mov	[bp+var_54], eax
		mov	eax, es:[di+4]
		mov	[bp+var_50], eax
		mov	eax, es:[di+8]
		mov	[bp+var_4C], eax
		mov	eax, [bp+var_54]
		add	eax, [bp+var_48]
		mov	[si], eax
		mov	eax, [bp+var_50]
		add	eax, [bp+var_44]
		mov	[si+4], eax
		mov	eax, [bp+var_4C]
		add	eax, [bp+var_40]
		mov	[si+8], eax
		mov	es, [bp+arg_2]
		mov	eax, es:[bx+53h]
		sar	eax, 8
		mov	edx, es:[bx+4Fh]
		sar	edx, 8
		cmp	eax, edx
		jl	short loc_862E3
		mov	[bp+var_2A], 0
		mov	eax, [bp+var_2A]
		mov	es:[bx+53h], eax
		inc	word ptr es:[bx+0Dh]

loc_862E3:
		pop	di
		pop	si
		leave
		retf
sub_86080		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_862E7		proc far

var_A0		= dword ptr -0A0h
var_9C		= dword ptr -9Ch
var_98		= dword ptr -98h
var_94		= dword ptr -94h
var_90		= dword ptr -90h
var_8C		= dword ptr -8Ch
var_7C		= dword ptr -7Ch
var_78		= dword ptr -78h
var_74		= dword ptr -74h
var_70		= dword ptr -70h
var_6C		= dword ptr -6Ch
var_68		= dword ptr -68h
var_64		= dword ptr -64h
var_60		= dword ptr -60h
var_5C		= dword ptr -5Ch
var_58		= dword ptr -58h
var_56		= dword ptr -56h
var_52		= word ptr -52h
var_50		= word ptr -50h
var_4E		= word ptr -4Eh
var_4C		= word ptr -4Ch
var_4A		= dword ptr -4Ah
var_46		= word ptr -46h
var_44		= word ptr -44h
var_42		= dword ptr -42h
var_3E		= dword ptr -3Eh
var_3A		= dword ptr -3Ah
var_36		= word ptr -36h
var_34		= word ptr -34h
var_32		= dword ptr -32h
var_2E		= dword ptr -2Eh
var_2A		= dword ptr -2Ah
var_26		= word ptr -26h
var_24		= word ptr -24h
var_22		= dword ptr -22h
var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_1A		= dword ptr -1Ah
var_16		= dword ptr -16h
var_12		= word ptr -12h
var_10		= dword ptr -10h
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_A		= word ptr  10h

		push	bp
		mov	bp, sp
		sub	sp, 0A0h
		push	si
		push	di
		mov	ax, [bp+arg_2]
		mov	dx, [bp+arg_0]
		add	dx, 53h
		mov	[bp+var_6], ax
		mov	[bp+var_8], dx
		les	bx, [bp+var_8]
		mov	eax, es:[bx]
		mov	[bp+var_4], eax
		cmp	[bp+var_4], 0
		jnz	short loc_86316
		mov	ax, 1
		jmp	short loc_86318

loc_86316:
		xor	ax, ax

loc_86318:
		or	al, al
		jz	short loc_8635D
		mov	ax, [bp+arg_2]
		mov	dx, [bp+arg_0]
		add	dx, 67h
		mov	[bp+var_A], ax
		mov	[bp+var_C], dx
		les	si, [bp+var_C]
		mov	eax, es:[si]
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+0Ah]
		mov	[bx+12h], eax
		mov	eax, es:[si+4]
		mov	bx, [bp+arg_0]
		mov	bx, es:[bx+0Ah]
		mov	[bx+16h], eax
		mov	eax, es:[si+8]
		mov	bx, [bp+arg_0]
		mov	bx, es:[bx+0Ah]
		mov	[bx+1Ah], eax

loc_8635D:
		mov	[bp+var_10], 100h
		les	bx, [bp+arg_0]
		mov	eax, [bp+var_10]
		add	es:[bx+4Bh], eax
		mov	ax, es:[bx+94h]
		mov	bx, 6
		cwd
		idiv	bx
		mov	[bp+var_12], ax
		mov	bx, [bp+arg_0]
		mov	eax, es:[bx+4Bh]
		sar	eax, 8
		movsx	edx, [bp+var_12]
		cmp	eax, edx
		jl	short loc_863A8
		mov	[bp+var_16], 0
		mov	eax, [bp+var_16]
		mov	es:[bx+4Bh], eax
		jmp	short loc_86406

loc_863A8:
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+0Ah]
		mov	bx, es:[bx+0Ah]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		mov	word ptr [bp+var_56+2], ax
		push	ax
		lea	ax, word ptr [bp+var_94]
		push	ax
		call	AI_ComputeGeometryHelper_58BF2
		add	sp, 4
		mov	[bp+var_58], 0FFFFFC00h
		lea	ax, word ptr [bp+var_58]
		push	ax
		lea	ax, word ptr [bp+var_94]
		push	ax
		call	Matrix_BuildAxisX_58C8C
		add	sp, 4
		lea	ax, word ptr [bp+var_94]
		push	ax
		call	Matrix_OrthonormalizeKeepRow1_59429
		pop	cx
		lea	ax, word ptr [bp+var_94]
		push	ax
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+0Ah]
		mov	bx, es:[bx+0Ah]
		mov	bx, [bx]
		call	dword ptr [bx+40h]
		add	sp, 4

loc_86406:
		les	bx, [bp+arg_0]
		mov	eax, dword_7976E
		add	es:[bx+53h], eax
		mov	ax, es:[bx+96h]
		mov	[bp+var_50], ax
		mov	cx, 4
		mov	bx, 140Ch

loc_86420:
		mov	ax, cs:[bx]
		cmp	ax, [bp+var_50]
		jz	short loc_86430
		add	bx, 2
		loop	short loc_86420
		jmp	loc_86589

loc_86430:
		jmp	word ptr cs:[bx+8] ; switch jump
		push	large 1
		push	0
		lea	ax, word ptr [bp+var_64]
		push	ax
		call	Utility_Helper_57B7D
		add	sp, 8
		mov	ax, [bp+arg_2]
		mov	dx, [bp+arg_0]
		add	dx, 3Fh
		mov	[bp+var_1C], ax
		mov	[bp+var_1E], dx
		les	bx, [bp+var_1E]
		mov	eax, es:[bx]
		mov	[bp+var_22], eax
		mov	eax, [bp+var_22]
		mov	[bp+var_1A], eax
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+53h]
		mov	edx, [bp+var_1A]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_60], eax
		jmp	loc_86589
		push	large 0
		push	0FFFFh
		lea	ax, word ptr [bp+var_64]
		push	ax
		call	Utility_Helper_57B7D
		add	sp, 8
		mov	ax, [bp+arg_2]
		mov	dx, [bp+arg_0]
		add	dx, 3Fh
		mov	[bp+var_24], ax
		mov	[bp+var_26], dx
		les	bx, [bp+var_26]
		mov	eax, es:[bx]
		mov	[bp+var_2A], eax
		mov	eax, [bp+var_2A]
		mov	[bp+var_1A], eax
		neg	eax
		mov	[bp+var_2E], eax
		mov	[bp+var_32], eax
		mov	[bp+var_1A], eax
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+53h]
		mov	edx, [bp+var_1A]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_64], eax
		jmp	loc_86589
		push	large 0FFFFh
		push	0
		lea	ax, word ptr [bp+var_64]
		push	ax
		call	Utility_Helper_57B7D
		add	sp, 8
		mov	ax, [bp+arg_2]
		mov	dx, [bp+arg_0]
		add	dx, 3Fh
		mov	[bp+var_34], ax
		mov	[bp+var_36], dx
		les	bx, [bp+var_36]
		mov	eax, es:[bx]
		mov	[bp+var_3A], eax
		mov	eax, [bp+var_3A]
		mov	[bp+var_1A], eax
		neg	eax
		mov	[bp+var_3E], eax
		mov	[bp+var_42], eax
		mov	[bp+var_1A], eax
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+53h]
		mov	edx, [bp+var_1A]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_60], eax
		jmp	short loc_86589
		push	large 0
		push	1
		lea	ax, word ptr [bp+var_64]
		push	ax
		call	Utility_Helper_57B7D
		add	sp, 8
		mov	ax, [bp+arg_2]
		mov	dx, [bp+arg_0]
		add	dx, 3Fh
		mov	[bp+var_44], ax
		mov	[bp+var_46], dx
		les	bx, [bp+var_46]
		mov	eax, es:[bx]
		mov	[bp+var_4A], eax
		mov	eax, [bp+var_4A]
		mov	[bp+var_1A], eax
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+53h]
		mov	edx, [bp+var_1A]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_64], eax

loc_86589:
		les	bx, [bp+arg_0]
		mov	si, es:[bx+0Ah]
		add	si, 12h
		mov	ax, [bp+arg_2]
		mov	dx, [bp+arg_0]
		add	dx, 67h
		mov	[bp+var_4C], ax
		mov	[bp+var_4E], dx
		les	di, [bp+var_4E]
		mov	eax, es:[di]
		mov	[bp+var_70], eax
		mov	eax, es:[di+4]
		mov	[bp+var_6C], eax
		mov	eax, es:[di+8]
		mov	[bp+var_68], eax
		mov	eax, [bp+var_70]
		add	eax, [bp+var_64]
		mov	[si], eax
		mov	eax, [bp+var_6C]
		add	eax, [bp+var_60]
		mov	[si+4], eax
		mov	eax, [bp+var_68]
		add	eax, [bp+var_5C]
		mov	[si+8], eax
		mov	es, [bp+arg_2]
		mov	eax, es:[bx+4Bh]
		sar	eax, 8
		cmp	eax, 0
		jle	short loc_865F7
		jmp	loc_868C8

loc_865F7:
		mov	al, es:[bx+8Bh]
		mov	ah, 0
		or	ax, ax
		jz	short loc_86605
		jmp	loc_868C8

loc_86605:
		mov	ax, es:[bx+96h]
		mov	[bp+var_52], ax
		mov	cx, 4
		mov	bx, offset word_868CC

loc_86613:
		mov	ax, cs:[bx]
		cmp	ax, [bp+var_52]
		jz	short loc_86623
		add	bx, 2
		loop	short loc_86613
		jmp	loc_868AA

loc_86623:
		jmp	word ptr cs:[bx+8] ; switch jump

loc_86627:
		push	large 1
		push	0
		lea	ax, word ptr [bp+var_7C]
		push	ax
		call	Utility_Helper_57B7D
		add	sp, 8
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+0Ah]
		mov	bx, es:[bx+0Ah]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		mov	word ptr [bp+var_58], ax
		push	ax
		lea	ax, word ptr [bp+var_A0]
		push	ax
		call	AI_ComputeGeometryHelper_58BF2
		add	sp, 4
		mov	eax, [bp+var_7C]
		mov	[bp+var_94], eax
		mov	eax, [bp+var_78]
		mov	[bp+var_90], eax
		mov	eax, [bp+var_74]
		mov	[bp+var_8C], eax
		push	large 0
		push	1
		lea	ax, word ptr [bp+var_7C]
		push	ax
		call	Utility_Helper_57B7D
		add	sp, 8
		mov	eax, [bp+var_7C]
		mov	[bp+var_A0], eax
		mov	eax, [bp+var_78]
		mov	[bp+var_9C], eax
		mov	eax, [bp+var_74]
		mov	[bp+var_98], eax
		lea	ax, word ptr [bp+var_A0]
		push	ax
		call	Matrix_OrthonormalizeKeepRow1_59429
		pop	cx
		lea	ax, word ptr [bp+var_A0]
		push	ax
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+0Ah]
		mov	bx, es:[bx+0Ah]
		mov	bx, [bx]
		call	dword ptr [bx+40h]
		add	sp, 4
		jmp	loc_868AA

loc_866C7:
		push	large 0
		push	1
		lea	ax, word ptr [bp+var_7C]
		push	ax
		call	Utility_Helper_57B7D
		add	sp, 8
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+0Ah]
		mov	bx, es:[bx+0Ah]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		mov	word ptr [bp+var_58], ax
		push	ax
		lea	ax, word ptr [bp+var_A0]
		push	ax
		call	AI_ComputeGeometryHelper_58BF2
		add	sp, 4
		mov	eax, [bp+var_7C]
		mov	[bp+var_94], eax
		mov	eax, [bp+var_78]
		mov	[bp+var_90], eax
		mov	eax, [bp+var_74]
		mov	[bp+var_8C], eax
		push	large 0FFFFh
		push	0
		lea	ax, word ptr [bp+var_7C]
		push	ax
		call	Utility_Helper_57B7D
		add	sp, 8
		mov	eax, [bp+var_7C]
		mov	[bp+var_A0], eax
		mov	eax, [bp+var_78]
		mov	[bp+var_9C], eax
		mov	eax, [bp+var_74]
		mov	[bp+var_98], eax
		lea	ax, word ptr [bp+var_A0]
		push	ax
		call	Matrix_OrthonormalizeKeepRow1_59429
		pop	cx
		lea	ax, word ptr [bp+var_A0]
		push	ax
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+0Ah]
		mov	bx, es:[bx+0Ah]
		mov	bx, [bx]
		call	dword ptr [bx+40h]
		add	sp, 4
		jmp	loc_868AA

loc_8676A:
		push	large 0FFFFh
		push	0
		lea	ax, word ptr [bp+var_7C]
		push	ax
		call	Utility_Helper_57B7D
		add	sp, 8
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+0Ah]
		mov	bx, es:[bx+0Ah]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		mov	word ptr [bp+var_58], ax
		push	ax
		lea	ax, word ptr [bp+var_A0]
		push	ax
		call	AI_ComputeGeometryHelper_58BF2
		add	sp, 4
		mov	eax, [bp+var_7C]
		mov	[bp+var_94], eax
		mov	eax, [bp+var_78]
		mov	[bp+var_90], eax
		mov	eax, [bp+var_74]
		mov	[bp+var_8C], eax
		push	large 0
		push	0FFFFh
		lea	ax, word ptr [bp+var_7C]
		push	ax
		call	Utility_Helper_57B7D
		add	sp, 8
		mov	eax, [bp+var_7C]
		mov	[bp+var_A0], eax
		mov	eax, [bp+var_78]
		mov	[bp+var_9C], eax
		mov	eax, [bp+var_74]
		mov	[bp+var_98], eax
		lea	ax, word ptr [bp+var_A0]
		push	ax
		call	Matrix_OrthonormalizeKeepRow1_59429
		pop	cx
		lea	ax, word ptr [bp+var_A0]
		push	ax
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+0Ah]
		mov	bx, es:[bx+0Ah]
		mov	bx, [bx]
		call	dword ptr [bx+40h]
		add	sp, 4
		jmp	loc_868AA

loc_8680D:
		push	large 0
		push	0FFFFh
		lea	ax, word ptr [bp+var_7C]
		push	ax
		call	Utility_Helper_57B7D
		add	sp, 8
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+0Ah]
		mov	bx, es:[bx+0Ah]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		mov	word ptr [bp+var_58], ax
		push	ax
		lea	ax, word ptr [bp+var_A0]
		push	ax
		call	AI_ComputeGeometryHelper_58BF2
		add	sp, 4
		mov	eax, [bp+var_7C]
		mov	[bp+var_94], eax
		mov	eax, [bp+var_78]
		mov	[bp+var_90], eax
		mov	eax, [bp+var_74]
		mov	[bp+var_8C], eax
		push	large 1
		push	0
		lea	ax, word ptr [bp+var_7C]
		push	ax
		call	Utility_Helper_57B7D
		add	sp, 8
		mov	eax, [bp+var_7C]
		mov	[bp+var_A0], eax
		mov	eax, [bp+var_78]
		mov	[bp+var_9C], eax
		mov	eax, [bp+var_74]
		mov	[bp+var_98], eax
		lea	ax, word ptr [bp+var_A0]
		push	ax
		call	Matrix_OrthonormalizeKeepRow1_59429
		pop	cx
		lea	ax, word ptr [bp+var_A0]
		push	ax
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+0Ah]
		mov	bx, es:[bx+0Ah]
		mov	bx, [bx]
		call	dword ptr [bx+40h]
		add	sp, 4

loc_868AA:
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+8Bh], 1
		mov	[bp+var_56], 0
		mov	eax, [bp+var_56]
		mov	es:[bx+53h], eax
		inc	word ptr es:[bx+0Dh]

loc_868C8:
		pop	di
		pop	si
		leave
		retf
sub_862E7		endp

; START OF FUNCTION CHUNK FOR sub_862E7
word_868CC	dw 0
		dw 5Ah
		dw 0B4h
		dw 10Eh
off_868D4	dw offset loc_86627
		dw offset loc_8680D
		dw offset loc_8676A
		dw offset loc_866C7
		add	[bx+si], al
		pop	dx
		add	[si+0E00h], dh
		add	[si+0Fh], sp
		mov	dl, 0Fh
		movups	xmm5, [bp+arg_A]
; END OF FUNCTION CHUNK FOR sub_862E7

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_868EC		proc far

var_32		= word ptr -32h
var_30		= word ptr -30h
var_2E		= word ptr -2Eh
var_2C		= word ptr -2Ch
var_2A		= word ptr -2Ah
var_28		= word ptr -28h
var_26		= word ptr -26h
var_24		= word ptr -24h
var_22		= word ptr -22h
var_20		= word ptr -20h
var_1E		= word ptr -1Eh
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 32h
		push	si
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+53h]
		sar	eax, 8
		cmp	eax, 0
		jnz	short loc_86937
		mov	[bp+var_4], 1400h
		mov	eax, [bp+var_4]
		mov	es:[bx+57h], eax
		mov	si, es:[bx+0Ah]
		add	si, 12h
		mov	eax, [si]
		mov	es:[bx+67h], eax
		mov	eax, [si+4]
		mov	es:[bx+6Bh], eax
		mov	eax, [si+8]
		mov	es:[bx+6Fh], eax

loc_86937:
		mov	eax, dword_7976E
		mov	[bp+var_8], eax
		les	bx, [bp+arg_0]
		add	es:[bx+53h], eax
		mov	eax, es:[bx+57h]
		sar	eax, 8
		mov	edx, es:[bx+53h]
		sar	edx, 8
		imul	eax, edx
		mov	edx, es:[bx+3Fh]
		sar	edx, 8
		sub	edx, eax
		mov	[bp+var_C], edx
		mov	eax, [bp+var_C]
		shl	eax, 8
		mov	[bp+var_10], eax
		mov	eax, [bp+var_10]
		mov	es:[bx+43h], eax
		mov	[bp+var_18], 0
		mov	eax, [bp+var_18]
		mov	[bp+var_14], eax
		mov	ax, [bp+arg_2]
		mov	dx, [bp+arg_0]
		add	dx, 43h
		mov	[bp+var_1E], ax
		mov	[bp+var_20], dx
		les	bx, [bp+var_20]
		mov	eax, es:[bx]
		mov	[bp+var_1C], eax
		mov	eax, [bp+var_1C]
		mov	edx, [bp+var_8]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_14], eax
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+96h]
		mov	[bp+var_32], ax
		mov	cx, 4
		mov	bx, offset word_86B3A

loc_869D1:
		mov	ax, cs:[bx]
		cmp	ax, [bp+var_32]
		jz	short loc_869E1
		add	bx, 2
		loop	short loc_869D1
		jmp	loc_86B21

loc_869E1:
		jmp	word ptr cs:[bx+8] ; switch jump

loc_869E5:
		les	bx, [bp+arg_0]
		mov	eax, [bp+var_14]
		add	es:[bx+6Bh], eax
		mov	ax, [bp+arg_2]
		mov	dx, [bp+arg_0]
		add	dx, 67h
		mov	[bp+var_22], ax
		mov	[bp+var_24], dx
		les	si, [bp+var_24]
		mov	eax, es:[si]
		mov	es, [bp+arg_2]
		mov	bx, es:[bx+0Ah]
		mov	[bx+12h], eax
		mov	eax, es:[si+4]
		mov	bx, [bp+arg_0]
		mov	bx, es:[bx+0Ah]
		mov	[bx+16h], eax
		mov	eax, es:[si+8]
		mov	bx, [bp+arg_0]
		mov	bx, es:[bx+0Ah]
		mov	[bx+1Ah], eax
		jmp	loc_86B21

loc_86A35:
		les	bx, [bp+arg_0]
		mov	eax, [bp+var_14]
		sub	es:[bx+67h], eax
		mov	ax, [bp+arg_2]
		mov	dx, [bp+arg_0]
		add	dx, 67h
		mov	[bp+var_26], ax
		mov	[bp+var_28], dx
		les	si, [bp+var_28]
		mov	eax, es:[si]
		mov	es, [bp+arg_2]
		mov	bx, es:[bx+0Ah]
		mov	[bx+12h], eax
		mov	eax, es:[si+4]
		mov	bx, [bp+arg_0]
		mov	bx, es:[bx+0Ah]
		mov	[bx+16h], eax
		mov	eax, es:[si+8]
		mov	bx, [bp+arg_0]
		mov	bx, es:[bx+0Ah]
		mov	[bx+1Ah], eax
		jmp	loc_86B21

loc_86A85:
		les	bx, [bp+arg_0]
		mov	eax, [bp+var_14]
		sub	es:[bx+6Bh], eax
		mov	ax, [bp+arg_2]
		mov	dx, [bp+arg_0]
		add	dx, 67h
		mov	[bp+var_2A], ax
		mov	[bp+var_2C], dx
		les	si, [bp+var_2C]
		mov	eax, es:[si]
		mov	es, [bp+arg_2]
		mov	bx, es:[bx+0Ah]
		mov	[bx+12h], eax
		mov	eax, es:[si+4]
		mov	bx, [bp+arg_0]
		mov	bx, es:[bx+0Ah]
		mov	[bx+16h], eax
		mov	eax, es:[si+8]
		mov	bx, [bp+arg_0]
		mov	bx, es:[bx+0Ah]
		mov	[bx+1Ah], eax
		jmp	short loc_86B21

loc_86AD4:
		les	bx, [bp+arg_0]
		mov	eax, [bp+var_14]
		add	es:[bx+67h], eax
		mov	ax, [bp+arg_2]
		mov	dx, [bp+arg_0]
		add	dx, 67h
		mov	[bp+var_2E], ax
		mov	[bp+var_30], dx
		les	si, [bp+var_30]
		mov	eax, es:[si]
		mov	es, [bp+arg_2]
		mov	bx, es:[bx+0Ah]
		mov	[bx+12h], eax
		mov	eax, es:[si+4]
		mov	bx, [bp+arg_0]
		mov	bx, es:[bx+0Ah]
		mov	[bx+16h], eax
		mov	eax, es:[si+8]
		mov	bx, [bp+arg_0]
		mov	bx, es:[bx+0Ah]
		mov	[bx+1Ah], eax

loc_86B21:
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+43h]
		sar	eax, 8
		cmp	eax, 0
		jg	short loc_86B37
		inc	word ptr es:[bx+0Dh]

loc_86B37:
		pop	si
		leave
		retf
sub_868EC		endp

; START OF FUNCTION CHUNK FOR sub_868EC
word_86B3A	dw 0
		dw 5Ah
		dw 0B4h
		dw 10Eh
off_86B42	dw offset loc_869E5
		dw offset loc_86A35
		dw offset loc_86A85
		dw offset loc_86AD4
; END OF FUNCTION CHUNK FOR sub_868EC

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_86B4A		proc far

var_3E		= dword ptr -3Eh
var_3A		= dword ptr -3Ah
var_36		= dword ptr -36h
var_32		= dword ptr -32h
var_2E		= dword ptr -2Eh
var_2A		= dword ptr -2Ah
var_26		= word ptr -26h
var_24		= word ptr -24h
var_22		= word ptr -22h
var_1A		= byte ptr -1Ah
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= byte ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 3Eh
		push	si
		push	large 0
		push	0
		lea	ax, word ptr [bp+var_32]
		push	ax
		call	Utility_Helper_57B7D
		add	sp, 8
		cmp	[bp+arg_4], 0
		jz	short loc_86BA9
		mov	ax, [bp+arg_2]
		mov	dx, [bp+arg_0]
		add	dx, 27h
		mov	[bp+var_2], ax
		mov	[bp+var_4], dx
		les	si, [bp+var_4]
		mov	eax, es:[si]
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+0Ah]
		mov	[bx+12h], eax
		mov	eax, es:[si+4]
		mov	bx, [bp+arg_0]
		mov	bx, es:[bx+0Ah]
		mov	[bx+16h], eax
		mov	eax, es:[si+8]
		mov	bx, [bp+arg_0]
		mov	bx, es:[bx+0Ah]
		mov	[bx+1Ah], eax

loc_86BA9:
		les	bx, [bp+arg_0]
		les	bx, es:[bx+6]
		mov	bx, es:[bx+0Bh]
		mov	bx, [bx]
		mov	eax, [bp+var_32]
		mov	[bx+2], eax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+6]
		mov	bx, es:[bx+0Bh]
		mov	bx, [bx]
		mov	eax, [bp+var_2E]
		mov	[bx+6], eax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+6]
		mov	bx, es:[bx+0Bh]
		mov	bx, [bx]
		mov	eax, [bp+var_2A]
		mov	[bx+0Ah], eax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+6]
		mov	bx, es:[bx+0Bh]
		mov	ax, [bx]
		add	ax, 2
		push	0
		mov	[bp+var_8], 0
		mov	eax, [bp+var_8]
		mov	[bp+var_3E], eax
		mov	[bp+var_C], 0
		mov	eax, [bp+var_C]
		mov	[bp+var_3A], eax
		mov	[bp+var_10], 100h
		mov	eax, [bp+var_10]
		mov	[bp+var_36], eax
		lea	ax, word ptr [bp+var_3E]
		push	ax
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+0Ah]
		add	ax, 12h
		push	ax
		push	word_79788
		push	ss
		lea	ax, word ptr [bp+var_14]
		push	ax
		call	Ground_HeightUnderPoint_3664D
		add	sp, 0Ch
		mov	eax, [bp+var_14]
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+0Ah]
		mov	[bx+1Ah], eax
		push	bx
		push	ss
		lea	ax, word ptr [bp+var_18]
		push	ax
		call	Aircraft_GroundClearance_3DF89
		add	sp, 6
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+0Ah]
		mov	eax, [bp+var_18]
		add	[bx+1Ah], eax
		mov	bx, [bp+arg_0]
		les	bx, es:[bx+6]
		les	bx, es:[bx+7]
		mov	word ptr es:[bx+21h], 0
		les	bx, [bp+arg_0]
		les	bx, es:[bx+6]
		les	bx, es:[bx+7]
		mov	word ptr es:[bx+1Fh], 0
		les	bx, [bp+arg_0]
		les	bx, es:[bx+6]
		mov	bx, es:[bx+0Bh]
		mov	al, [bx+92h]
		shr	ax, 1
		and	ax, 1
		and	ax, 1
		les	bx, [bp+arg_0]
		les	bx, es:[bx+6]
		les	bx, es:[bx+7]
		and	byte ptr es:[bx+1Ch], 0DFh
		shl	al, 5
		or	es:[bx+1Ch], al
		les	bx, [bp+arg_0]
		les	bx, es:[bx+6]
		les	bx, es:[bx+7]
		mov	word ptr es:[bx+23h], 0
		les	bx, [bp+arg_0]
		les	bx, es:[bx+6]
		les	bx, es:[bx+7]
		mov	byte ptr es:[bx+1Eh], 0FFh
		push	8
		push	ds
		push	offset aPLAYER_1
		push	ss
		lea	ax, [bp+var_22]
		push	ax
		call	sub_39E1
		add	sp, 0Ah
		mov	[bp+var_1A], 0
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+0Ah]
		mov	ax, [bx+8]
		mov	dx, [bx+6]
		mov	[bp+var_24], ax
		mov	[bp+var_26], dx
		push	8
		push	ax
		push	dx
		push	ss
		lea	ax, [bp+var_22]
		push	ax
		call	CRT_MemFamily_Extra7
		add	sp, 0Ah
		or	ax, ax
		jnz	short loc_86D2B
		mov	ax, 1
		jmp	short loc_86D2D

loc_86D2B:
		xor	ax, ax

loc_86D2D:
		or	al, al
		jz	short loc_86D36
		mov	byte_79B9B, 1

loc_86D36:
		pop	si
		leave
		retf
sub_86B4A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_86D39		proc far

var_132		= word ptr -132h
var_E2		= word ptr -0E2h
var_85		= dword ptr -85h
var_81		= dword ptr -81h
var_7D		= dword ptr -7Dh
var_68		= word ptr -68h
var_66		= word ptr -66h
var_3A		= dword ptr -3Ah
var_36		= dword ptr -36h
var_32		= dword ptr -32h
var_2E		= dword ptr -2Eh
var_2A		= dword ptr -2Ah
var_26		= dword ptr -26h
var_22		= word ptr -22h
var_20		= word ptr -20h
var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_1A		= word ptr -1Ah
var_12		= byte ptr -12h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 132h
		push	si
		push	[bp+arg_4]
		push	large [bp+arg_0]
		call	sub_10409
		add	sp, 6
		les	bx, word ptr [bp+arg_0]
		push	word ptr es:[bx+0Ah]
		push	ss
		lea	ax, word ptr [bp+var_2E]
		push	ax
		mov	bx, es:[bx+0Ah]
		mov	bx, [bx]
		call	dword ptr [bx+50h]
		add	sp, 6
		push	large [bp+var_26]
		push	large [bp+var_2A]
		push	large [bp+var_2E]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_4], eax
		mov	[bp+var_8], eax
		mov	[bp+var_C], 0A00h
		cmp	eax, [bp+var_C]
		jle	short loc_86D9B
		mov	ax, 1
		jmp	short loc_86D9D

loc_86D9B:
		xor	ax, ax

loc_86D9D:
		or	al, al
		jz	short loc_86DB0
		push	large [bp+arg_0]
		call	sub_10381
		add	sp, 4
		jmp	loc_87076

loc_86DB0:
		les	bx, word ptr [bp+arg_0]
		mov	ax, es:[bx+0Ah]
		cmp	ax, word_7CADA
		jnz	short loc_86DCC
		push	ds
		push	offset aTAKEOFF
		push	67B7h
		call	sub_737C8
		add	sp, 6

loc_86DCC:
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx+31h], 0
		mov	[bp+var_10], 0
		mov	eax, [bp+var_10]
		mov	es:[bx+37h], eax
		push	word ptr es:[bx+0Ah]
		mov	bx, es:[bx+0Ah]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch
		mov	si, ax
		mov	eax, [si]
		mov	[bp+var_3A], eax
		mov	eax, [si+4]
		mov	[bp+var_36], eax
		mov	eax, [si+8]
		mov	[bp+var_32], eax
		cmp	[bp+var_3A], 0
		jnz	short loc_86E1C
		mov	ax, 1
		jmp	short loc_86E1E

loc_86E1C:
		xor	ax, ax

loc_86E1E:
		or	al, al
		jz	short loc_86E40
		cmp	[bp+var_36], 0
		jle	short loc_86E2E
		mov	ax, 1
		jmp	short loc_86E30

loc_86E2E:
		xor	ax, ax

loc_86E30:
		or	al, al
		jz	short loc_86E40
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx+43h], 0
		jmp	loc_86ECB

loc_86E40:
		cmp	[bp+var_3A], 0
		jnz	short loc_86E4C
		mov	ax, 1
		jmp	short loc_86E4E

loc_86E4C:
		xor	ax, ax

loc_86E4E:
		or	al, al
		jz	short loc_86E6F
		cmp	[bp+var_36], 0
		jge	short loc_86E5E
		mov	ax, 1
		jmp	short loc_86E60

loc_86E5E:
		xor	ax, ax

loc_86E60:
		or	al, al
		jz	short loc_86E6F
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx+43h], 0B4h
		jmp	short loc_86ECB

loc_86E6F:
		cmp	[bp+var_36], 0
		jnz	short loc_86E7B
		mov	ax, 1
		jmp	short loc_86E7D

loc_86E7B:
		xor	ax, ax

loc_86E7D:
		or	al, al
		jz	short loc_86E9E
		cmp	[bp+var_3A], 0
		jle	short loc_86E8D
		mov	ax, 1
		jmp	short loc_86E8F

loc_86E8D:
		xor	ax, ax

loc_86E8F:
		or	al, al
		jz	short loc_86E9E
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx+43h], 10Eh
		jmp	short loc_86ECB

loc_86E9E:
		cmp	[bp+var_36], 0
		jnz	short loc_86EAA
		mov	ax, 1
		jmp	short loc_86EAC

loc_86EAA:
		xor	ax, ax

loc_86EAC:
		or	al, al
		jz	short loc_86ECB
		cmp	[bp+var_3A], 0
		jge	short loc_86EBC
		mov	ax, 1
		jmp	short loc_86EBE

loc_86EBC:
		xor	ax, ax

loc_86EBE:
		or	al, al
		jz	short loc_86ECB
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx+43h], 5Ah

loc_86ECB:
		les	bx, word ptr [bp+arg_0]
		push	word ptr es:[bx+0Ah]
		mov	bx, es:[bx+0Ah]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx
		mov	[bp+var_1C], dx
		mov	[bp+var_1E], ax
		mov	ax, [bp+var_1C]
		mov	dx, [bp+var_1E]
		add	dx, 36h
		mov	[bp+var_20], ax
		mov	[bp+var_22], dx
		push	8
		push	ax
		push	dx
		push	ss
		lea	ax, [bp+var_1A]
		push	ax
		call	sub_39E1
		add	sp, 0Ah
		mov	[bp+var_12], 0
		lea	ax, [bp+var_E2]
		push	ax
		call	StreamReader_ConstructVariantA_6BF3A
		pop	cx
		mov	[bp+var_E2], 508h
		mov	[bp+var_81], 100h
		mov	[bp+var_85], 0
		mov	[bp+var_E2], 520h
		mov	[bp+var_66], 0
		xor	ax, ax
		mov	[bp+var_68], ax
		movsx	eax, ax
		mov	[bp+var_7D], eax
		push	seg seg225
		push	0
		push	ss
		lea	ax, [bp+var_1A]
		push	ax
		push	ds
		push	offset aOBJECTS
		lea	ax, [bp+var_132]
		push	ax
		call	sub_29540
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_132]
		push	ax
		lea	ax, [bp+var_E2]
		push	ax
		mov	bx, [bp+var_E2]
		call	dword ptr [bx+14h]
		add	sp, 6
		or	al, al
		jnz	short loc_86F79
		jmp	loc_87036

loc_86F79:
		push	0
		push	large 4C414552h
		lea	ax, [bp+var_E2]
		push	ax
		call	ResourceRecord_SeekAndReadB_6D82B
		add	sp, 8
		or	ax, ax
		jnz	short loc_86F95
		jmp	loc_87036

loc_86F95:
		push	0
		push	large 544A424Fh
		lea	ax, [bp+var_E2]
		push	ax
		call	ResourceRecord_SeekAndReadB_6D82B
		add	sp, 8
		or	ax, ax
		jnz	short loc_86FB1
		jmp	loc_87036

loc_86FB1:
		push	0
		push	large 5054454Ah
		lea	ax, [bp+var_E2]
		push	ax
		call	ResourceRecord_SeekAndReadB_6D82B
		add	sp, 8
		or	ax, ax
		jz	short loc_87036
		push	0
		push	large 46464F54h
		lea	ax, [bp+var_E2]
		push	ax
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_8702D
		lea	ax, [bp+var_E2]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+3Dh], ax
		lea	ax, [bp+var_E2]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+3Bh], ax
		lea	ax, [bp+var_E2]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+3Fh], ax
		lea	ax, [bp+var_E2]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+41h], ax
		jmp	short loc_87036

loc_8702D:
		push	8015h
		call	sub_1DDFE
		pop	cx

loc_87036:
		les	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+6]
		mov	bx, es:[bx+0Bh]
		or	byte ptr [bx+92h], 4
		push	large [bp+arg_0]
		les	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx]
		call	dword ptr [bx+0Ch]
		add	sp, 4
		mov	[bp+var_E2], 520h
		lea	ax, [bp+var_E2]
		push	ax
		call	ResourceRecord_Helper_6D61E
		pop	cx
		push	0
		lea	ax, [bp+var_E2]
		push	ax
		call	StreamReader_ReleaseBuffer_6DFAB
		add	sp, 4

loc_87076:
		pop	si
		leave
		retf
sub_86D39		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_87079		proc far

arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		les	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+31h]
		cmp	bx, 4
		ja	short loc_870D5
		shl	bx, 1
		jmp	cs:off_870E0[bx]	; switch jump

loc_8708F:
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_870EA
		add	sp, 4
		jmp	short loc_870DE

loc_8709D:
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_87453
		add	sp, 4
		jmp	short loc_870DE

loc_870AB:
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr Takeoff_Phase2_GearFlapsUp_87584
		add	sp, 4
		jmp	short loc_870DE

loc_870B9:
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_875B0
		add	sp, 4
		jmp	short loc_870DE

loc_870C7:
		push	large [bp+arg_0]
		call	sub_10381
		add	sp, 4
		jmp	short loc_870DE

loc_870D5:
		push	8013h
		call	sub_1DDFE
		pop	cx

loc_870DE:
		pop	bp
		retf
sub_87079		endp

; START OF FUNCTION CHUNK FOR sub_87079
off_870E0	dw offset loc_8708F
		dw offset loc_8709D
		dw offset loc_870AB
		dw offset loc_870B9
		dw offset loc_870C7
; END OF FUNCTION CHUNK FOR sub_87079

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_870EA		proc far

var_64		= dword ptr -64h
var_5E		= dword ptr -5Eh
var_5A		= dword ptr -5Ah
var_56		= dword ptr -56h
var_52		= dword ptr -52h
var_4E		= dword ptr -4Eh
var_4A		= dword ptr -4Ah
var_45		= byte ptr -45h
var_44		= dword ptr -44h
var_40		= word ptr -40h
var_3E		= word ptr -3Eh
var_3C		= word ptr -3Ch
var_3A		= word ptr -3Ah
var_38		= word ptr -38h
var_36		= word ptr -36h
var_34		= word ptr -34h
var_32		= word ptr -32h
var_30		= word ptr -30h
var_2E		= word ptr -2Eh
var_2C		= word ptr -2Ch
var_2A		= word ptr -2Ah
var_28		= word ptr -28h
var_26		= dword ptr -26h
var_22		= dword ptr -22h
var_1E		= dword ptr -1Eh
var_1A		= dword ptr -1Ah
var_16		= dword ptr -16h
var_12		= dword ptr -12h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= dword ptr -0Ah
var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 5Eh
		push	si
		les	bx, [bp+arg_0]
		les	bx, es:[bx+6]
		les	bx, es:[bx+7]
		mov	word ptr es:[bx+21h], 0
		les	bx, [bp+arg_0]
		les	bx, es:[bx+6]
		les	bx, es:[bx+7]
		mov	word ptr es:[bx+1Fh], 0
		les	bx, [bp+arg_0]
		les	bx, es:[bx+6]
		les	bx, es:[bx+7]
		mov	word ptr es:[bx+23h], 0
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+37h]
		sar	eax, 8
		cmp	eax, 0
		jnz	short loc_87157
		mov	si, es:[bx+0Ah]
		add	si, 12h
		mov	eax, [si]
		mov	es:[bx+25h], eax
		mov	eax, [si+4]
		mov	es:[bx+29h], eax
		mov	eax, [si+8]
		mov	es:[bx+2Dh], eax

loc_87157:
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+0Ah]
		mov	byte ptr [bx+5Eh], 1
		mov	bx, [bp+arg_0]
		les	bx, es:[bx+6]
		les	bx, es:[bx+7]
		mov	byte ptr es:[bx+1Eh], 0Ah
		mov	eax, dword_7976E
		mov	[bp+var_4], eax
		les	bx, [bp+arg_0]
		add	es:[bx+37h], eax
		mov	ax, es:[bx+3Dh]
		mov	[bp+var_6], ax
		movsx	eax, [bp+var_6]
		shl	eax, 8
		mov	[bp+var_A], eax
		mov	ax, [bp+arg_2]
		mov	dx, [bp+arg_0]
		add	dx, 37h
		mov	[bp+var_C], ax
		mov	[bp+var_E], dx
		les	bx, [bp+var_E]
		mov	eax, es:[bx]
		mov	[bp+var_12], eax
		mov	eax, [bp+var_A]
		mov	edx, [bp+var_12]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_16], eax
		mov	eax, [bp+var_16]
		mov	[bp+var_1A], eax
		mov	[bp+var_1E], eax
		mov	eax, [bp+var_1E]
		les	bx, [bp+arg_0]
		mov	es:[bx+33h], eax
		mov	[bp+var_26], 0
		mov	eax, [bp+var_26]
		mov	[bp+var_22], eax
		mov	eax, es:[bx+33h]
		mov	edx, [bp+var_4]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_22], eax
		mov	ax, es:[bx+43h]
		mov	[bp+var_38], ax
		mov	cx, 4
		mov	bx, offset word_87443

loc_8720E:
		mov	ax, cs:[bx]
		cmp	ax, [bp+var_38]
		jz	short loc_8721E
		add	bx, 2
		loop	short loc_8720E
		jmp	loc_8735E

loc_8721E:
		jmp	word ptr cs:[bx+8] ; switch jump

loc_87222:
		les	bx, [bp+arg_0]
		mov	eax, [bp+var_22]
		add	es:[bx+29h], eax
		mov	ax, [bp+arg_2]
		mov	dx, [bp+arg_0]
		add	dx, 25h
		mov	[bp+var_28], ax
		mov	[bp+var_2A], dx
		les	si, [bp+var_2A]
		mov	eax, es:[si]
		mov	es, [bp+arg_2]
		mov	bx, es:[bx+0Ah]
		mov	[bx+12h], eax
		mov	eax, es:[si+4]
		mov	bx, [bp+arg_0]
		mov	bx, es:[bx+0Ah]
		mov	[bx+16h], eax
		mov	eax, es:[si+8]
		mov	bx, [bp+arg_0]
		mov	bx, es:[bx+0Ah]
		mov	[bx+1Ah], eax
		jmp	loc_8735E

loc_87272:
		les	bx, [bp+arg_0]
		mov	eax, [bp+var_22]
		sub	es:[bx+25h], eax
		mov	ax, [bp+arg_2]
		mov	dx, [bp+arg_0]
		add	dx, 25h
		mov	[bp+var_2C], ax
		mov	[bp+var_2E], dx
		les	si, [bp+var_2E]
		mov	eax, es:[si]
		mov	es, [bp+arg_2]
		mov	bx, es:[bx+0Ah]
		mov	[bx+12h], eax
		mov	eax, es:[si+4]
		mov	bx, [bp+arg_0]
		mov	bx, es:[bx+0Ah]
		mov	[bx+16h], eax
		mov	eax, es:[si+8]
		mov	bx, [bp+arg_0]
		mov	bx, es:[bx+0Ah]
		mov	[bx+1Ah], eax
		jmp	loc_8735E

loc_872C2:
		les	bx, [bp+arg_0]
		mov	eax, [bp+var_22]
		sub	es:[bx+29h], eax
		mov	ax, [bp+arg_2]
		mov	dx, [bp+arg_0]
		add	dx, 25h
		mov	[bp+var_30], ax
		mov	[bp+var_32], dx
		les	si, [bp+var_32]
		mov	eax, es:[si]
		mov	es, [bp+arg_2]
		mov	bx, es:[bx+0Ah]
		mov	[bx+12h], eax
		mov	eax, es:[si+4]
		mov	bx, [bp+arg_0]
		mov	bx, es:[bx+0Ah]
		mov	[bx+16h], eax
		mov	eax, es:[si+8]
		mov	bx, [bp+arg_0]
		mov	bx, es:[bx+0Ah]
		mov	[bx+1Ah], eax
		jmp	short loc_8735E

loc_87311:
		les	bx, [bp+arg_0]
		mov	eax, [bp+var_22]
		add	es:[bx+25h], eax
		mov	ax, [bp+arg_2]
		mov	dx, [bp+arg_0]
		add	dx, 25h
		mov	[bp+var_34], ax
		mov	[bp+var_36], dx
		les	si, [bp+var_36]
		mov	eax, es:[si]
		mov	es, [bp+arg_2]
		mov	bx, es:[bx+0Ah]
		mov	[bx+12h], eax
		mov	eax, es:[si+4]
		mov	bx, [bp+arg_0]
		mov	bx, es:[bx+0Ah]
		mov	[bx+16h], eax
		mov	eax, es:[si+8]
		mov	bx, [bp+arg_0]
		mov	bx, es:[bx+0Ah]
		mov	[bx+1Ah], eax

loc_8735E:
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+33h]
		sar	eax, 8
		movsx	edx, word ptr es:[bx+3Bh]
		cmp	eax, edx
		jg	short loc_87378
		jmp	loc_87440

loc_87378:
		inc	word ptr es:[bx+31h]
		push	word ptr es:[bx+0Ah]
		mov	bx, es:[bx+0Ah]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch
		mov	si, ax
		mov	eax, [si]
		mov	[bp+var_52], eax
		mov	eax, [si+4]
		mov	[bp+var_4E], eax
		mov	eax, [si+8]
		mov	[bp+var_4A], eax
		mov	ax, [bp+arg_2]
		mov	dx, [bp+arg_0]
		add	dx, 25h
		mov	[bp+var_3A], ax
		mov	[bp+var_3C], dx
		les	si, [bp+var_3C]
		mov	eax, es:[si]
		mov	[bp+var_5E], eax
		mov	eax, es:[si+4]
		mov	[bp+var_5A], eax
		mov	eax, es:[si+8]
		mov	[bp+var_56], eax
		mov	ax, [bp+arg_2]
		mov	dx, [bp+arg_0]
		add	dx, 33h
		mov	[bp+var_3E], ax
		mov	[bp+var_40], dx
		les	bx, [bp+var_40]
		mov	eax, es:[bx]
		mov	[bp+var_44], eax
		sub	sp, 4
		mov	[bp+var_64], eax
		lea	ax, word ptr [bp+var_52]
		push	ax
		lea	ax, word ptr [bp+var_5E]
		push	ax
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+0Ah]
		push	word ptr [bx+52h]
		mov	bx, [bp+arg_0]
		mov	bx, es:[bx+0Ah]
		mov	bx, [bx+52h]
		mov	bx, [bx]
		call	dword ptr [bx+48h]
		pop	cx
		push	ax
		call	JDYN_JumpToPoint_4936E
		add	sp, 0Ah
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+0Ah]
		mov	byte ptr [bx+5Eh], 0
		mov	[bp+var_45], 1
		mov	bx, [bp+arg_0]
		les	bx, es:[bx+6]
		mov	bx, es:[bx+0Bh]
		mov	bx, [bx]
		mov	al, [bp+var_45]
		mov	[bx+20h], al

loc_87440:
		pop	si
		leave
		retf
sub_870EA		endp

; START OF FUNCTION CHUNK FOR sub_870EA
word_87443	dw 0
		dw 5Ah
		dw 0B4h
		dw 10Eh
off_8744B	dw offset loc_87222
		dw offset loc_87272
		dw offset loc_872C2
		dw offset loc_87311
; END OF FUNCTION CHUNK FOR sub_870EA

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_87453		proc far

var_24		= dword ptr -24h
var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 24h
		les	bx, [bp+arg_0]
		les	bx, es:[bx+6]
		mov	bx, es:[bx+0Bh]
		mov	al, [bx+92h]
		and	ax, 1
		and	ax, 1
		les	bx, [bp+arg_0]
		les	bx, es:[bx+6]
		les	bx, es:[bx+7]
		and	byte ptr es:[bx+1Ch], 0BFh
		shl	al, 6
		or	es:[bx+1Ch], al
		les	bx, [bp+arg_0]
		les	bx, es:[bx+6]
		les	bx, es:[bx+7]
		mov	word ptr es:[bx+21h], 0
		les	bx, [bp+arg_0]
		les	bx, es:[bx+6]
		les	bx, es:[bx+7]
		mov	word ptr es:[bx+1Fh], 0
		les	bx, [bp+arg_0]
		les	bx, es:[bx+6]
		les	bx, es:[bx+7]
		mov	word ptr es:[bx+23h], 0
		les	bx, [bp+arg_0]
		les	bx, es:[bx+6]
		les	bx, es:[bx+7]
		mov	byte ptr es:[bx+1Eh], 0Ah
		les	bx, [bp+arg_0]
		les	bx, es:[bx+6]
		mov	bx, es:[bx+0Bh]
		or	byte ptr [bx+92h], 2
		push	0
		mov	[bp+var_4], 0
		mov	eax, [bp+var_4]
		mov	[bp+var_24], eax
		mov	[bp+var_8], 0
		mov	eax, [bp+var_8]
		mov	[bp+var_20], eax
		mov	[bp+var_C], 100h
		mov	eax, [bp+var_C]
		mov	[bp+var_1C], eax
		lea	ax, word ptr [bp+var_24]
		push	ax
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+0Ah]
		add	ax, 12h
		push	ax
		push	word_79788
		push	ss
		lea	ax, word ptr [bp+var_10]
		push	ax
		call	Ground_HeightUnderPoint_3664D
		add	sp, 0Ch
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+0Ah]
		mov	eax, [bx+1Ah]
		sub	eax, [bp+var_10]
		mov	[bp+var_14], eax
		mov	[bp+var_18], eax
		cmp	[bp+var_18], 12C00h
		jle	short loc_87550
		mov	ax, 1
		jmp	short loc_87552

loc_87550:
		xor	ax, ax

loc_87552:
		or	al, al
		jz	short loc_8756F
		les	bx, [bp+arg_0]
		les	bx, es:[bx+6]
		les	bx, es:[bx+7]
		mov	byte ptr es:[bx+1Eh], 5
		les	bx, [bp+arg_0]
		inc	word ptr es:[bx+31h]
		jmp	short loc_87582

loc_8756F:
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+3Fh]
		push	[bp+arg_2]
		push	bx
		nop
		push	cs
		call	near ptr sub_87671
		add	sp, 6

loc_87582:
		leave
		retf
sub_87453		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 5 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Takeoff_Phase2_GearFlapsUp_125C2 (sub_125C2 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; LUE 2026-09-26 (ex-'FlightState_FinalizeCounter'). DECOLLAGE IA (ordre 0xA1). Phase 2 :
; train rentre (flags_75 &= ~4), volets rentres (flags_75 &= ~2), phase 3.
; ==============================================================================================
Takeoff_Phase2_GearFlapsUp_87584		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		les	bx, es:[bx+6]
		mov	bx, es:[bx+0Bh]
		and	byte ptr [bx+92h], 0FBh
		les	bx, [bp+arg_0]
		les	bx, es:[bx+6]
		mov	bx, es:[bx+0Bh]
		and	byte ptr [bx+92h], 0FDh
		les	bx, [bp+arg_0]
		inc	word ptr es:[bx+31h]
		pop	bp
		retf
Takeoff_Phase2_GearFlapsUp_87584		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_875B0		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		les	bx, [bp+arg_0]
		les	bx, es:[bx+6]
		mov	bx, es:[bx+0Bh]
		mov	al, [bx+92h]
		and	ax, 1
		and	ax, 1
		les	bx, [bp+arg_0]
		les	bx, es:[bx+6]
		les	bx, es:[bx+7]
		and	byte ptr es:[bx+1Ch], 0BFh
		shl	al, 6
		or	es:[bx+1Ch], al
		les	bx, [bp+arg_0]
		les	bx, es:[bx+6]
		les	bx, es:[bx+7]
		mov	word ptr es:[bx+23h], 0
		les	bx, [bp+arg_0]
		les	bx, es:[bx+6]
		les	bx, es:[bx+7]
		mov	byte ptr es:[bx+1Eh], 5
		les	bx, [bp+arg_0]
		les	bx, es:[bx+6]
		mov	bx, es:[bx+0Bh]
		and	byte ptr [bx+92h], 0FDh
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+0Ah]
		mov	bx, es:[bx+0Ah]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_4]
		push	ax
		call	sub_59A03
		add	sp, 6
		cmp	[bp+var_4], 1100h
		jle	short loc_87641
		mov	ax, 1
		jmp	short loc_87643

loc_87641:
		xor	ax, ax

loc_87643:
		or	al, al
		jz	short loc_8765A
		les	bx, [bp+arg_0]
		les	bx, es:[bx+6]
		les	bx, es:[bx+7]
		mov	word ptr es:[bx+1Fh], 0FFF0h
		jmp	short loc_8766F

loc_8765A:
		les	bx, [bp+arg_0]
		inc	word ptr es:[bx+31h]
		les	bx, es:[bx+6]
		les	bx, es:[bx+7]
		mov	word ptr es:[bx+1Fh], 8

loc_8766F:
		leave
		retf
sub_875B0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_87671		proc far

var_1E		= word ptr -1Eh
var_1C		= dword ptr -1Ch
var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= dword ptr -14h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= dword ptr -0Ah
var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 1Eh
		push	si
		mov	si, [bp+arg_4]
		mov	[bp+var_6], si
		movsx	eax, [bp+var_6]
		shl	eax, 8
		mov	[bp+var_4], eax
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+0Ah]
		mov	bx, es:[bx+0Ah]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_A]
		push	ax
		call	sub_59A03
		add	sp, 6
		mov	cx, word ptr [bp+var_A+1]
		sub	cx, si
		or	cx, cx
		jge	short loc_876B9
		mov	ax, cx
		neg	ax
		jmp	short loc_876BB

loc_876B9:
		mov	ax, cx

loc_876BB:
		mov	cx, ax
		mov	eax, [bp+var_A]
		sub	[bp+var_4], eax
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+41h]
		mov	[bp+var_C], ax
		movsx	eax, [bp+var_C]
		mov	edx, [bp+var_4]
		imul	edx, eax
		mov	[bp+var_4], edx
		mov	eax, [bp+var_4]
		sar	eax, 3
		mov	[bp+var_4], eax
		mov	ax, es:[bx+41h]
		mov	[bp+var_E], ax
		movsx	eax, [bp+var_E]
		shl	eax, 8
		cmp	eax, [bp+var_4]
		jge	short loc_87707
		mov	ax, 1
		jmp	short loc_87709

loc_87707:
		xor	ax, ax

loc_87709:
		or	al, al
		jz	short loc_8772E
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+41h]
		mov	[bp+var_10], ax
		movsx	eax, [bp+var_10]
		shl	eax, 8
		mov	[bp+var_14], eax
		mov	eax, [bp+var_14]
		mov	[bp+var_4], eax
		jmp	short loc_87775

loc_8772E:
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+41h]
		neg	ax
		mov	[bp+var_16], ax
		movsx	eax, [bp+var_16]
		shl	eax, 8
		cmp	eax, [bp+var_4]
		jle	short loc_8774E
		mov	ax, 1
		jmp	short loc_87750

loc_8774E:
		xor	ax, ax

loc_87750:
		or	al, al
		jz	short loc_87775
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+41h]
		neg	ax
		mov	[bp+var_18], ax
		movsx	eax, [bp+var_18]
		shl	eax, 8
		mov	[bp+var_1C], eax
		mov	eax, [bp+var_1C]
		mov	[bp+var_4], eax

loc_87775:
		mov	ax, word ptr [bp+var_4+1]
		mov	[bp+var_1E], ax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+6]
		les	bx, es:[bx+7]
		mov	es:[bx+1Fh], ax
		cmp	cx, 5
		jge	short loc_87794
		mov	ax, 1
		jmp	short loc_87796

loc_87794:
		xor	ax, ax

loc_87796:
		pop	si
		leave
		retf
sub_87671		endp
ovr237		ends
