seg051		segment	para public 'CODE' use16
		assume cs:seg051
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1F2F1		proc far

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	short loc_1F321

loc_1F303:
		mov	bx, [bp+var_2]
		mov	di, [bx+0Eh]
		or	di, di
		jz	short loc_1F321
		mov	al, [di+52h]
		and	ax, 1
		or	al, al
		jz	short loc_1F321
		push	di
		mov	bx, [di+50h]
		call	dword ptr [bx+18h]
		pop	cx
		jmp	short loc_1F332

loc_1F321:
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_68B4B
		add	sp, 4
		or	ax, ax
		jnz	short loc_1F303

loc_1F332:
		pop	di
		pop	si
		leave
		retf
sub_1F2F1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1F336		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	short loc_1F368

loc_1F348:
		mov	bx, [bp+var_2]
		mov	di, [bx+0Eh]
		or	di, di
		jz	short loc_1F368
		mov	al, [di+52h]
		and	ax, 1
		or	al, al
		jz	short loc_1F368
		push	[bp+arg_2]
		push	di
		call	sub_73D80
		add	sp, 4

loc_1F368:
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_68B4B
		add	sp, 4
		or	ax, ax
		jnz	short loc_1F348
		pop	di
		pop	si
		leave
		retf
sub_1F336		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1F37D		proc far

var_60		= dword ptr -60h
var_58		= word ptr -58h
var_7		= byte ptr -7
var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 58h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	byte_7750C, 0
		mov	byte_7750D, 0
		cmp	byte_7CB18, 0
		jz	short loc_1F3FD
		cmp	word_7977C, 1
		jbe	short loc_1F3FD
		cmp	word_7CADA, 0
		jz	short loc_1F3FD
		mov	al, byte_77698
		mov	ah, 0
		or	ax, ax
		jnz	short loc_1F3FD
		mov	al, byte_7769E
		mov	ah, 0
		or	ax, ax
		jnz	short loc_1F3FD
		mov	al, byte_79787
		mov	ah, 0
		or	ax, ax
		jnz	short loc_1F3FD
		mov	bx, word_7CADA
		push	word ptr [bx+52h]
		push	ss
		lea	ax, word ptr [bp+var_4]
		push	ax
		call	Physics_ApplyGroundHeightConstraint
		add	sp, 6
		cmp	[bp+var_4], 400h
		jle	short loc_1F3E5
		mov	ax, 1
		jmp	short loc_1F3E7

loc_1F3E5:
		xor	ax, ax

loc_1F3E7:
		or	al, al
		jnz	short loc_1F3F2
		cmp	byte_776B8, 0
		jz	short loc_1F3FD

loc_1F3F2:
		push	4
		push	si
		call	sub_737CD
		add	sp, 4

loc_1F3FD:
		mov	[bp+var_6], 0
		jmp	short loc_1F47F

loc_1F404:
		mov	bx, [bp+var_6]
		mov	di, [bx+0Eh]
		or	di, di
		jz	short loc_1F47F
		mov	al, [di+52h]
		and	ax, 1
		or	al, al
		jz	short loc_1F47F
		push	di
		mov	bx, [di+50h]
		call	dword ptr [bx+10h]
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_1F47F
		push	[bp+var_6]
		call	sub_73764
		pop	cx
		cmp	[si+12h], di
		jnz	short loc_1F47F
		cmp	word ptr [si+0Fh], 0
		jz	short loc_1F47A
		push	word ptr [si+0Fh]
		call	sub_7375F
		pop	cx
		mov	bx, [si+0Fh]
		mov	di, [bx+0Eh]
		or	di, di
		jz	short loc_1F475
		push	di
		mov	bx, [di+50h]
		call	dword ptr [bx]
		pop	cx
		or	al, al
		jz	short loc_1F475
		push	di
		mov	bx, [di+50h]
		call	dword ptr [bx+14h]
		pop	cx
		mov	[si+11h], al
		mov	[si+12h], di
		mov	word ptr [si+0Fh], 0
		push	di
		mov	bx, [di+50h]
		call	dword ptr [bx+10h]
		pop	cx
		jmp	short loc_1F47F

loc_1F475:
		mov	al, 0
		jmp	loc_1F681

loc_1F47A:
		mov	al, 0
		jmp	loc_1F681

loc_1F47F:
		lea	ax, [bp+var_6]
		push	ax
		push	si
		call	LinkedList_Helper_68B4B
		add	sp, 4
		or	ax, ax
		jz	short loc_1F493
		jmp	loc_1F404

loc_1F493:
		mov	al, byte_79787
		mov	ah, 0
		or	ax, ax
		jz	short loc_1F49F
		jmp	loc_1F582

loc_1F49F:
		mov	al, byte_7CAC3
		mov	ah, 0
		cmp	ax, word_775E3
		jz	short loc_1F4B1
		mov	al, byte_7CAC3
		mov	ah, 0
		jmp	short loc_1F4B3

loc_1F4B1:
		xor	ax, ax

loc_1F4B3:
		mov	[bp+var_7], al
		mov	ah, 0
		sub	ax, 3Bh
		mov	bx, ax
		cmp	bx, 7
		jbe	short loc_1F4C5
		jmp	loc_1F565

loc_1F4C5:
		shl	bx, 1
		jmp	cs:off_1F685[bx]	; switch jump

loc_1F4CC:
		push	4
		push	si
		call	sub_737CD
		add	sp, 4
		jmp	loc_1F582

loc_1F4DA:
		push	5
		push	si
		call	sub_737CD
		add	sp, 4
		jmp	loc_1F582

loc_1F4E8:
		push	3
		push	si
		call	sub_737CD
		add	sp, 4
		or	al, al
		jnz	short loc_1F4FA
		jmp	loc_1F582

loc_1F4FA:
		push	seg seg008
		push	offset loc_55C4
		lea	ax, [bp+var_58]
		push	ax
		call	sub_54BE
		add	sp, 6
		sub	sp, 4
		mov	[bp+var_60], 200h
		push	ss
		lea	ax, [bp+var_58]
		push	ax
		push	ds
		push	offset unk_7CEFE
		call	GlyphObject_Helper9_15CE5
		add	sp, 0Ch
		jmp	short loc_1F582

loc_1F52A:
		push	9
		push	si
		call	sub_737CD
		add	sp, 4
		jmp	short loc_1F582

loc_1F537:
		push	0Ah
		push	si
		call	sub_737CD
		add	sp, 4
		or	al, al
		jz	short loc_1F582
		sub	sp, 4
		mov	[bp+var_60], 200h
		push	seg seg008
		push	offset loc_563C
		push	ds
		push	offset unk_7CEFE
		call	GlyphObject_Helper9_15CE5
		add	sp, 0Ch
		jmp	short loc_1F582

loc_1F565:
		cmp	byte ptr [si+11h], 4
		jz	short loc_1F582
		cmp	word_77696, 0
		jz	short loc_1F582
		mov	al, [bp+var_7]
		push	ax
		push	word_77696
		call	sub_17413
		add	sp, 4

loc_1F582:
		mov	al, byte_7CAC3
		mov	ah, 0
		cmp	ax, word_775E3
		jz	short loc_1F594
		mov	al, byte_7CAC3
		mov	ah, 0
		jmp	short loc_1F596

loc_1F594:
		xor	ax, ax

loc_1F596:
		cmp	ax, 43h
		jz	short loc_1F5A3
		cmp	ax, 44h
		jz	short loc_1F610
		jmp	loc_1F67F

loc_1F5A3:
		xor	byte ptr [si+15h], 1
		mov	al, [si+15h]
		mov	byte_7CB17, al
		push	seg seg008
		push	offset loc_55FB
		push	seg seg008
		push	offset loc_5612
		call	sub_38D6
		add	sp, 8
		cmp	byte ptr [si+15h], 0
		jz	short loc_1F5DD
		push	seg seg008
		push	offset loc_560E
		push	seg seg008
		push	offset loc_5612
		call	CRT_MemFamily_Extra2
		add	sp, 8
		jmp	short loc_1F5F1

loc_1F5DD:
		push	seg seg008
		push	offset loc_5609
		push	seg seg008
		push	offset loc_5612
		call	CRT_MemFamily_Extra2
		add	sp, 8

loc_1F5F1:
		sub	sp, 4
		mov	[bp+var_60], 200h
		push	seg seg008
		push	offset loc_5612
		push	ds
		push	offset unk_7CEFE
		call	GlyphObject_Helper9_15CE5
		add	sp, 0Ch
		jmp	short loc_1F67F

loc_1F610:
		mov	al, [si+16h]
		xor	al, 1
		mov	[si+16h], al
		mov	al, [si+16h]
		mov	byte_7CB16, al
		push	seg seg008
		push	offset loc_55ED
		push	seg seg008
		push	offset loc_5612
		call	sub_38D6
		add	sp, 8
		cmp	byte ptr [si+16h], 0
		jz	short loc_1F64E
		push	seg seg008
		push	offset loc_560E
		push	seg seg008
		push	offset loc_5612
		call	CRT_MemFamily_Extra2
		add	sp, 8
		jmp	short loc_1F662

loc_1F64E:
		push	seg seg008
		push	offset loc_5609
		push	seg seg008
		push	offset loc_5612
		call	CRT_MemFamily_Extra2
		add	sp, 8

loc_1F662:
		sub	sp, 4
		mov	[bp+var_60], 200h
		push	seg seg008
		push	offset loc_5612
		push	ds
		push	offset unk_7CEFE
		call	GlyphObject_Helper9_15CE5
		add	sp, 0Ch

loc_1F67F:
		mov	al, 1

loc_1F681:
		pop	di
		pop	si
		leave
		retf
sub_1F37D		endp

; START OF FUNCTION CHUNK FOR sub_1F37D
off_1F685	dw offset loc_1F4CC
		dw offset loc_1F4E8
		dw offset loc_1F565
		dw offset loc_1F565
		dw offset loc_1F565
		dw offset loc_1F52A
		dw offset loc_1F4DA
		dw offset loc_1F537
; END OF FUNCTION CHUNK FOR sub_1F37D

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1F695		proc far

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	short loc_1F724

loc_1F6A7:
		mov	bx, [bp+var_2]
		mov	di, [bx+0Eh]
		or	di, di
		jz	short loc_1F724
		mov	al, [di+52h]
		and	ax, 1
		or	al, al
		jz	short loc_1F724
		push	di
		mov	bx, [di+50h]
		call	dword ptr [bx+10h]
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_1F720
		push	[bp+var_2]
		call	sub_73764
		pop	cx
		cmp	[si+12h], di
		jnz	short loc_1F720
		cmp	word ptr [si+0Fh], 0
		jz	short loc_1F71C
		push	word ptr [si+0Fh]
		call	sub_7375F
		pop	cx
		mov	bx, [si+0Fh]
		mov	di, [bx+0Eh]
		or	di, di
		jz	short loc_1F718
		push	di
		mov	bx, [di+50h]
		call	dword ptr [bx]
		pop	cx
		or	al, al
		jz	short loc_1F718
		push	di
		mov	bx, [di+50h]
		call	dword ptr [bx+14h]
		pop	cx
		mov	[si+11h], al
		mov	[si+12h], di
		mov	word ptr [si+0Fh], 0
		push	di
		mov	bx, [di+50h]
		call	dword ptr [bx+10h]
		pop	cx
		jmp	short loc_1F720

loc_1F718:
		mov	al, 0
		jmp	short loc_1F73A

loc_1F71C:
		mov	al, 0
		jmp	short loc_1F73A

loc_1F720:
		mov	al, 1
		jmp	short loc_1F73A

loc_1F724:
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_68B4B
		add	sp, 4
		or	ax, ax
		jz	short loc_1F738
		jmp	loc_1F6A7

loc_1F738:
		mov	al, 1

loc_1F73A:
		pop	di
		pop	si
		leave
		retf
sub_1F695		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1F73E		proc far

var_62		= dword ptr -62h
var_5A		= word ptr -5Ah
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
		sub	sp, 5Ah
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	ax, [bp+arg_4]
		mov	[bp+var_2], ax
		cmp	[bp+var_2], 0
		jz	short loc_1F767
		mov	bx, [bp+var_2]
		cmp	word ptr [bx+24h], 0
		jz	short loc_1F767
		mov	ax, [bx+24h]
		mov	[bp+var_2], ax

loc_1F767:
		push	di
		mov	bx, [di]
		call	dword ptr [bx+38h]
		pop	cx
		mov	[bp+var_4], ax
		cmp	byte ptr [si+15h], 0
		jnz	short loc_1F77A
		jmp	loc_1F869

loc_1F77A:
		cmp	[bp+var_2], 0
		jnz	short loc_1F783
		jmp	loc_1F869

loc_1F783:
		or	di, di
		jnz	short loc_1F78A
		jmp	loc_1F869

loc_1F78A:
		cmp	byte ptr [si+11h], 8
		jnz	short loc_1F793
		jmp	loc_1F869

loc_1F793:
		cmp	byte ptr [si+11h], 0Ch
		jnz	short loc_1F79C
		jmp	loc_1F869

loc_1F79C:
		mov	[bp+var_6], 1
		push	di
		mov	bx, [di]
		call	dword ptr [bx]
		pop	cx
		or	ax, dx
		jz	short loc_1F7B4
		push	di
		mov	bx, [di]
		call	dword ptr [bx+34h]
		pop	cx
		jmp	short loc_1F7B6

loc_1F7B4:
		mov	al, 1Ch

loc_1F7B6:
		cmp	al, 6
		jnz	short loc_1F7E6
		mov	[bp+var_8], di
		mov	bx, [bp+var_8]
		push	word ptr [bx+52h]
		mov	bx, [bx+52h]
		mov	bx, [bx]
		call	dword ptr [bx+48h]
		pop	cx
		mov	bx, ax
		mov	al, [bx+92h]
		shr	ax, 5
		and	ax, 1
		mov	byte ptr [bp+var_A+1], al
		cmp	byte ptr [bp+var_A+1], 0
		jz	short loc_1F7E6
		mov	[bp+var_6], 0

loc_1F7E6:
		cmp	[bp+var_6], 0
		jz	short loc_1F869
		mov	ax, [bp+var_2]
		cmp	ax, word_7CADA
		jnz	short loc_1F869
		mov	ax, [bp+var_4]
		cmp	ax, word_7CADA
		jz	short loc_1F869
		cmp	byte ptr [si+11h], 8
		jz	short loc_1F869
		mov	al, [si+11h]
		mov	byte ptr [bp+var_8], al
		push	8
		push	si
		call	sub_737AA
		add	sp, 4
		mov	[bp+var_A], ax
		mov	al, byte ptr [bp+var_8]
		push	ax
		push	[bp+arg_4]
		push	di
		push	[bp+var_A]
		call	sub_733ED
		add	sp, 8
		push	[bp+var_A]
		push	si
		call	sub_737D2
		add	sp, 4
		or	al, al
		jz	short loc_1F869
		push	seg seg008
		push	offset loc_55D1
		lea	ax, [bp+var_5A]
		push	ax
		call	sub_54BE
		add	sp, 6
		sub	sp, 4
		mov	[bp+var_62], 200h
		push	ss
		lea	ax, [bp+var_5A]
		push	ax
		push	ds
		push	offset unk_7CEFE
		call	GlyphObject_Helper9_15CE5
		add	sp, 0Ch

loc_1F869:
		pop	di
		pop	si
		leave
		retf
sub_1F73E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1F86D		proc far

var_8E		= dword ptr -8Eh
var_86		= word ptr -86h
var_36		= word ptr -36h
var_12		= dword ptr -12h
var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_6		= word ptr -6
var_4		= byte ptr -4
var_2		= byte ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 86h
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	byte ptr [si+16h], 0
		jnz	short loc_1F882
		jmp	loc_1F96D

loc_1F882:
		mov	ax, [bp+arg_2]
		cmp	ax, word_7CADA
		jz	short loc_1F88E
		jmp	loc_1F96D

loc_1F88E:
		push	[bp+arg_4]
		mov	bx, [bp+arg_4]
		mov	bx, [bx]
		call	dword ptr [bx+34h]
		pop	cx
		mov	[bp+var_2], al
		cmp	byte ptr [si+11h], 0Ch
		jnz	short loc_1F8A6
		jmp	loc_1F96D

loc_1F8A6:
		cmp	byte ptr [si+11h], 8
		jnz	short loc_1F8AF
		jmp	loc_1F96D

loc_1F8AF:
		cmp	[bp+var_2], 9
		jz	short loc_1F8C4
		cmp	[bp+var_2], 8
		jz	short loc_1F8C4
		cmp	[bp+var_2], 1Ah
		jz	short loc_1F8C4
		jmp	loc_1F96D

loc_1F8C4:
		mov	al, [si+11h]
		mov	[bp+var_4], al
		mov	di, [si+12h]
		add	di, 14h
		mov	eax, [di]
		mov	[bp+var_12], eax
		mov	eax, [di+4]
		mov	[bp+var_E], eax
		mov	eax, [di+8]
		mov	[bp+var_A], eax
		mov	ax, [si+12h]
		add	ax, 20h
		mov	[bp+var_6], ax
		push	ax
		lea	ax, [bp+var_36]
		push	ax
		call	AI_ComputeGeometryHelper_58BF2
		add	sp, 4
		cmp	byte ptr [si+11h], 0Ch
		jz	short loc_1F96D
		push	0Ch
		push	si
		call	sub_737AA
		add	sp, 4
		mov	di, ax
		lea	ax, [bp+var_36]
		push	ax
		lea	ax, word ptr [bp+var_12]
		push	ax
		mov	al, [bp+var_4]
		push	ax
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	di
		call	sub_73395
		add	sp, 0Eh
		push	di
		push	si
		call	sub_737D2
		add	sp, 4
		or	al, al
		jz	short loc_1F96D
		push	seg seg008
		push	offset loc_55DF
		lea	ax, [bp+var_86]
		push	ax
		call	sub_54BE
		add	sp, 6
		sub	sp, 4
		mov	[bp+var_8E], 200h
		push	ss
		lea	ax, [bp+var_86]
		push	ax
		push	ds
		push	offset unk_7CEFE
		call	GlyphObject_Helper9_15CE5
		add	sp, 0Ch

loc_1F96D:
		pop	di
		pop	si
		leave
		retf
sub_1F86D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1F971		proc far
		push	bp
		mov	bp, sp
		push	62F4h
		call	Formation_ComputeGeometryHelper_58B0C
		pop	cx
		mov	word_7CA54, 0
		mov	word_7CA56, 0
		mov	byte_7CA61, 0
		pop	bp
		retf
sub_1F971		endp
seg051		ends
