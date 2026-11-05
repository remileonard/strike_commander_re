seg220		segment	para public 'CODE' use16
		assume cs:seg220
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 50h, 4Bh, 57h, 41h, 52h, 45h, 20h, 44h, 61h, 74h, 61h, 20h, 43h, 6Fh, 6Dh, 70h
		db 72h, 65h, 73h, 73h, 69h, 6Fh, 6Eh, 20h, 4Ch, 69h, 62h, 72h, 61h, 72h, 79h, 28h
		db 74h, 6Dh, 29h, 0Dh, 0Ah, 43h, 6Fh, 70h, 79h, 72h, 69h, 67h, 68h, 74h, 20h, 31h
		db 39h, 39h, 30h, 2Dh, 39h, 31h, 20h, 50h, 4Bh, 57h, 41h, 52h, 45h, 20h, 49h, 6Eh
		db 63h, 2Eh, 20h, 20h, 41h, 6Ch, 6Ch, 20h, 52h, 69h, 67h, 68h, 74h, 73h, 20h, 52h
		db 65h, 73h, 65h, 72h, 76h, 65h, 64h, 2Eh, 0Dh, 0Ah, 50h, 61h, 74h, 65h, 6Eh, 74h
		db 20h, 50h, 65h, 6Eh, 64h, 69h, 6Eh, 67h, 2Eh, 0Dh, 0Ah, 56h, 65h, 72h, 73h, 69h
		db 6Fh, 6Eh, 20h, 31h, 2Eh, 30h, 32h, 0Dh, 0Ah, 0EAh

; ----------------------------------------------------------------------

sub_7026A		proc near
		push	sp
		pop	ax
		sub	ax, sp
		mov	word_7B4D6, ax
		ret
sub_7026A		endp

; START OF FUNCTION CHUNK FOR sub_7026A
		add	al, [si]
		add	al, 5
		add	ax, 505h
		push	es
		push	es
		push	es
		push	es
		push	es
		push	es
		push	es
		push	es
		push	es
		push	es
		push	es
		push	es
		push	es
		push	es
		push	es
		pop	es
		pop	es
		pop	es
		pop	es
		pop	es
		pop	es
		pop	es
		pop	es
		pop	es
		pop	es
		pop	es
		pop	es
		pop	es

loc_70295:
		pop	es
		pop	es
		pop	es
		pop	es
		pop	es
		pop	es
		pop	es
		pop	es
		pop	es
		pop	es
		pop	es
		pop	es
		pop	es
		or	[bx+si], cl
		or	[bx+si], cl
		or	[bx+si], cl
		or	[bx+si], cl
		or	[bx+si], cl
		or	[bx+si], cl
		or	[bx+si], cl
		or	[bx+si], cl
		add	cx, [di]
		add	ax, 919h
		adc	[bx+di], ax
		push	ds
		push	cs
		push	ss
		push	es
		cmp	bl, [bp+si]
		sub	cl, [bp+si]
		xor	dl, [bp+si]
		and	al, [bp+si+2]
		jl	short loc_70308
		pop	sp
		sbb	al, 6Ch
		sub	al, 4Ch
		or	al, 74h
		xor	al, 54h
		adc	al, 64h
		and	al, 44h
		add	al, 78h
		cmp	[bx+si+18h], bl
		push	4828h
		or	al, dh
		jo	short loc_70295
		xor	al, dl
		push	ax
		nop
		adc	al, ah
		pushaw
		mov	al, byte_82750
		inc	ax
		add	byte ptr [bx+si], 0
		add	[bx+si], al
		add	[bx+si], al
		add	[bx+si], al
		add	[bx+di], al
		add	al, [bp+di]
		add	al, 5
		push	es
		pop	es
		or	[bx+si], al
		add	[bx+di], al
		add	[bp+si], al
		add	[bp+di], al
		add	[si], al
		add	[di], al
		add	byte_76E30, al
		add	[bx+si], cl
		add	[bp+si], cl
		add	byte_77D30, cl
		add	byte_7AD30, ah
		add	[bp+600h], al
		add	[bp+di], ax
		add	al, [bp+di]
		add	ax, [si]
		add	al, 4
		add	ax, 505h
		add	ax, 606h
		push	es
		pop	es
		pop	es
		add	ax, 103h
		push	es
		or	al, [bp+si]
		or	al, 14h
		add	al, 18h
		or	[bx+si], dh
		adc	[bx+si], ah
		inc	ax
		add	[bp+di], cl
		or	al, 0Ch
		or	al, 0Ch
		or	al, 0Ch
		or	al, 0Ch
		or	[bx], al
		or	al, 0Ch
		pop	es
		or	al, 0Ch
		or	al, 0Ch
		or	al, 0Ch
		or	al, 0Ch
		or	al, 0Ch
		or	al, 0Ch
		or	ax, 0C0Ch
		or	al, 0Ch
		or	al, 4
		or	cl, [bx+si]
		or	al, 0Ah
		or	al, 0Ah
		or	[bx], al
		pop	es
		or	[bx+di], cl
		pop	es
		push	es
		pop	es
		or	[bx], al
		push	es
		pop	es
		pop	es
		pop	es
		pop	es
		or	[bx], al
		pop	es
		or	[bx+si], cl
		or	al, 0Bh
		pop	es
		or	[bp+di], cx
		or	al, 6
		pop	es
		push	es
		push	es
		add	ax, 807h
		or	byte_7703B, al
		push	es
		pop	es
		push	es
		push	es
		pop	es
		or	ax, word_76D36
		pop	es
		or	[bx+si], cx
		or	[bx+di], cx
		or	cx, [bx+si]
		or	cx, [bx+di]
		or	al, 8
		or	al, 5
		push	es
		push	es
		push	es
		add	ax, 606h
		push	es
		add	ax, 70Bh
		add	ax, 506h
		add	ax, 0A06h
		add	ax, 505h
		add	ax, 708h
		or	[bx+si], cl
		or	cl, [bp+di]
		or	cx, [si]
		or	al, 0Ch
		or	ax, 0D0Dh
		or	ax, 0D0Dh
		or	ax, 0D0Dh
		or	ax, 0D0Dh
		or	ax, 0D0Dh
		or	ax, 0D0Dh
		or	ax, 0D0Dh
		or	ax, 0D0Dh
		or	ax, 0D0Dh
		or	ax, 0D0Dh
		or	ax, 0D0Dh
		or	ax, 0D0Dh
		or	ax, 0D0Dh
		or	ax, 0D0Dh
		or	ax, 0D0Dh
		or	ax, 0D0Dh
		or	al, 0Ch
		or	al, 0Ch
		or	al, 0Ch
		or	al, 0Ch
		or	al, 0Ch
		or	al, 0Ch
		or	al, 0Ch
		or	al, 0Ch
		or	al, 0Ch
		or	al, 0Ch
		or	al, 0Ch
		or	al, 0Ch
		or	al, 0Ch
		or	al, 0Ch
		or	al, 0Ch
		or	al, 0Ch
		or	al, 0Ch
		or	al, 0Ch
		or	al, 0Ch
		or	al, 0Ch
		or	al, 0Ch
		or	al, 0Ch
		or	al, 0Ch
		or	al, 0Ch
		or	ax, 0D0Ch
		or	ax, 0C0Dh
		or	ax, 0D0Dh
		or	al, 0Dh
		or	ax, 0D0Dh
		or	al, 0Dh
		or	ax, 0C0Dh
		or	al, 0Ch
		or	ax, 0D0Dh
		or	ax, 0D0Dh
		or	ax, 0D0Dh
		or	ax, 900Dh
		add	al, 0E0h
		pavgb	mm0, [bx]
		loopne	short loc_70455
		loopne	short loc_7044F
		loopne	short loc_7045B
		loopne	short loc_70455
		loopne	short loc_7045B
		loopne	short loc_70455
		mov	ax, 6200h
		add	al, ah
		push	cs
		loopne	short loc_70462
		and	al, [bx+si]
		loopne	short loc_7046A
		loopne	short loc_70464

loc_70462:
		loopne	short loc_70470

loc_70464:
		loopne	short loc_7046A
		loopne	short loc_70470

loc_70468:
		loopne	short loc_7046A

loc_7046A:
		pushaw
		punpcklbw	mm0, [bx]
		pushaw
		or	sp, [bx+si+3]
		pushaw
		or	ax, 560h
		inc	ax
		adc	ah, [bx+si+9]
		pushaw
		add	[bx+si+0Eh], sp
		pushaw
		push	es
		pushaw
		or	cl, [bx]
		add	[bx+si+2], dl
		cmp	[bx+si], al
		pushaw
		add	dl, [bx+si]
		pushaw
		or	al, 90h
		add	bx, ax
		add	[bp+si], al
		add	al, [bx+si]
		pop	ax
		add	[bx+si+7C01h], dh
		add	[bx+di], ch
		add	[si], bh
		add	[bx+si+5C00h], bl
		add	[bx+di], cl
		add	[si], bl
		add	[si], ch
		sub	al, 0
		dec	sp
		add	[bx+si], bl
		add	[si], cl
		add	[si], dh
		call	loc_76CB7
		add	[bx+si+4], ah
		nop
		add	[si], dh
		add	[bx+si+1000h], dh
		pop	es
		pushaw
		or	[bx+di], dh
		add	[si], dl
		adc	[bx+si], ax
		and	[bx+si], ax
		pop	ss
		add	[si], dl
		add	[bx+si+2800h], ch
		add	[bx+di], al
		add	[bx+si], dl
		add	si, [bx+si]
		add	word ptr dword_7CB30, di
		add	byte_79530, bl
		add	[si], ah
		add	[bx+si], dl
		add	ax, 0Eh
		add	ss:4400h, dl
		add	[bx+si], dh
		add	al, cl
		add	al, dl
		add	ax, dx
		add	[bx+si], dl
		add	[bx+si], cx
		adc	byte_76880, al
		pushaw
		add	[bx+si-6000h], cl
		sysret
		add	byte_76D30, ah
		add	[bp+si], bh
		add	[bp+di], bl
		add	[bp+si], bl
		add	[bp+si], ch
		add	[bp+si], cl
		add	[bp+di], cl
		add	[bx+si], dl
		add	al, [si]
		add	[bp+di], dl
		add	[bp+si], dh
		add	[bp+di], al
		add	[di], bl
		add	[bp+si], dl
		add	[bx+si+0D01h], dl
		add	[di], dl
		add	[di], al
		add	[bx+di], bl
		add	[bx+si], cl
		add	[bx+si], bh
		lock add	[bx+si], dh
		nop
		add	dl, [bx+si]
		add	al, 10h
		add	[bx+si-5FF9h], ah
		or	sp, [bx+si+4003h]
		add	al, [bx+si+1Ch]
		inc	ax
		or	al, 40h
		adc	al, 40h
		add	al, 40h
		sbb	[bx+si+8], al
		inc	ax
		adc	[bx+si], al
		sbb	byte ptr [bx], 80h
		jo	loc_78572
		pop	es
		sbb	byte ptr [bp+di], 80h
		or	ax, [bx+si-7FEDh]
		add	ax, [bx+si-7FE3h]
		or	ax, 1580h
		add	byte ptr [di], 80h
		sbb	[bx+si-7FF7h], ax
		adc	[bx+si-7FFFh], ax
		push	ds
		or	byte_77DB0, 80h
		push	es
		sbb	byte ptr [bp+si], 80h
		or	al, [bx+si-7FEEh]
		add	al, [bx+si-7FE4h]
		or	al, 80h
		adc	al, 80h
		add	al, 80h
		sbb	[bx+si-7FF8h], al
		adc	[bx+si], al
		pop	ds
		add	[bx], cl
		add	[bx], dl
		add	[bx], al
		add	[bp+di], bl
		add	[bp+di], cl
		add	[bp+di], dl
		mov	al, byte_8073D
		add	ax, 9A0h
		mov	al, byte_80731
		push	cs
		mov	al, byte_80736
		or	ah, [bx+si-5FFEh]
		or	al, 0A0h
		add	al, 0A0h
		or	[bx+si+2000h], ah
		mov	edi, cr0
		and	[bp+di], cl
		and	[bp+di], al
		and	[di], cl
		and	[di], al
		and	[bx+di], cl
		and	[bx+di], al
		and	byte_76D50, cl
		and	[bp+si], cl
		and	[bp+si], al
		and	[si], cl
		and	[si], al
		and	[bx+si], cl
		and	[bx+si], al
		ror	byte ptr [bx], 0C0h
		pop	es
		ror	byte ptr [bp+di], 0C0h
		add	ax, ax
		or	ax, 5C0h
		ror	byte ptr [bx+di], 0C0h
		add	ax, ax
		push	cs
		rol	byte_771F0, 0C0h
		add	al, al
		or	al, 0C0h
		add	al, 0C0h
		or	al, al
		add	[bx+si+0Fh], al
		inc	ax
		pop	es
		inc	ax
		or	ax, [bx+si+3]
		add	[bp+di], al
		inc	ax
		or	ax, 1D00h
		add	[di], cl
		add	[di], dl
		inc	ax
		add	ax, 500h
		add	[bx+di], bl
		add	[bx+di], cl
		inc	ax
		or	[bx+si], ax
		adc	[bx+si], ax
		add	[bx+si], ax
		push	ds
		add	byte_76870, cl
		add	byte_76D30, dl
		add	[bp+si], bl
		inc	ax
		push	cs
		inc	ax
		push	es
		inc	ax
		or	al, [bx+si]
		or	al, [bx+si]
		adc	al, [bx+si]
		add	al, [bx+si]
		sbb	al, 0
		or	al, 0
		adc	al, 0
		add	al, 0
		sbb	[bx+si], al
		or	[bx+si], al
		adc	[bx+si], al
		db 0
; END OF FUNCTION CHUNK FOR sub_7026A

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_70642		proc far

var_A		= word ptr -0Ah
arg_0		= word ptr  6
arg_4		= word ptr  0Ah
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h
arg_C		= word ptr  12h
arg_10		= word ptr  16h

		push	bp
		mov	bp, sp
		sub	sp, 14h
		push	di
		push	si
		mov	si, [bp+arg_8]
		mov	word_7B4D8, si
		push	ds
		mov	ds, [bp+arg_A]
		les	ax, [bp+arg_10]
		mov	[si+9A0h], ax
		mov	[si+9A2h], es
		les	ax, [bp+arg_C]
		mov	[si+9A4h], ax
		mov	[si+9A6h], es
		les	di, [bp+arg_0]
		mov	ax, es:[di]
		mov	[si+0Ch], ax
		les	bx, [bp+arg_4]
		mov	cx, es:[bx]
		mov	[si+0Ah], cx
		mov	word ptr [si+6], 4
		mov	word ptr [si+8], 0Fh
		pop	es
		mov	es:4DAAh, ds
		push	ds
		pop	es
		sub	ax, 400h
		jz	short loc_706C5
		sub	ax, 400h
		jz	short loc_706BE
		sub	ax, 800h
		jz	short loc_706B7
		mov	ax, 1

loc_706A1:
		mov	bx, seg dseg
		mov	ds, bx
		jmp	loc_70781
		call	far ptr 5070h:1FB8h
		mov	ax, 452h
		push	ax
		call	sub_7026A
		retf
		cmp	di, 644h
		or	byte ptr [si+8], 20h

loc_706BE:
		inc	word ptr [si+6]
		or	byte ptr [si+8], 10h

loc_706C5:
		jcxz	short loc_706CF
		dec	cx
		jz	short loc_706ED
		mov	ax, 2
		jmp	short loc_706A1

loc_706CF:
		cld
		lea	di, [si+8Eh]
		mov	ax, 909h
		mov	cx, 80h
		rep stosw
		mov	cx, 100h
		lea	di, [si+394h]
		xor	ax, ax

loc_706E5:
		stosw
		inc	ax
		inc	ax
		loop	short loc_706E5
		jmp	short loc_7070D
		jmp	far ptr 2E00h:0FFBBh
		mov	al, [bx+152h]
		inc	al
		mov	[bx+si+8Eh], al
		shl	bx, 1
		mov	ax, cs:[bx+252h]
		shl	ax, 1
		mov	[bx+si+394h], ax
		shr	bx, 1
		dec	bx
		jge	short loc_706F0

loc_7070D:
		xor	di, di
		mov	bx, 100h

loc_70712:
		mov	cl, cs:[di+102h]
		mov	dx, 1
		shl	dx, cl
		mov	[bp+var_A], dx
		xor	dx, dx

loc_70721:
		mov	al, cs:[di+132h]
		mov	cl, al
		inc	al
		add	al, cs:[di+102h]
		mov	[bx+si+8Eh], al
		mov	ax, dx
		shl	ax, cl
		or	al, cs:[di+142h]
		shl	ax, 1
		inc	ax
		shl	bx, 1
		mov	[bx+si+394h], ax
		shr	bx, 1
		inc	bx
		inc	dx
		cmp	[bp+var_A], dx
		ja	short loc_70721
		inc	di
		cmp	di, 10h
		jb	short loc_70712
		mov	ax, seg dseg
		mov	ds, ax
		lea	ax, [si+4Eh]
		push	es
		push	ax
		mov	ax, 0C2h
		push	cs
		push	ax
		mov	ax, 40h
		call	sub_70DBA
		lea	ax, [si+0Eh]
		push	word_7B4DA
		push	ax
		mov	ax, 82h
		push	cs
		push	ax
		mov	ax, 40h
		call	sub_70DBA
		call	sub_7078A
		sub	ax, ax

loc_70781:
		pop	si
		pop	di
		mov	sp, bp
		pop	bp
		retf	14h
sub_70642		endp

; START OF FUNCTION CHUNK FOR sub_70642
		db 0C7h
; END OF FUNCTION CHUNK FOR sub_70642

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_7078A		proc near

var_57E2		= word ptr -57E2h
var_3B07		= byte ptr -3B07h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_8FB		= word ptr  8FFh

		push	bp
		mov	bp, sp
		sub	sp, 0Eh
		push	di
		push	si
		les	bx, word_7B4D8
		add	bx, es:[bx+0Ch]
		lea	ax, [bx+25B0h]
		mov	[bp+var_6], ax
		mov	bx, word_7B4D8
		mov	al, es:[bx+0Ah]
		mov	es:[bx+1BAAh], al
		mov	al, es:[bx+6]
		mov	es:[bx+1BABh], al
		mov	word ptr es:[bx+2], 2
		lea	ax, [bx+1BACh]
		push	es
		push	ax
		sub	ax, ax
		mov	[bp+var_E], ax
		mov	[bp+var_C], ax
		mov	dx, 800h
		call	sub_70DE2
		les	bx, word_7B4D8
		mov	word ptr es:[bx+4], 0

loc_707DB:
		mov	[bp+var_A], 1000h
		sub	si, si

loc_707E2:
		les	bx, word_7B4D8
		add	bx, es:[bx+0Ch]
		lea	di, [bp+var_A]
		push	[bp+var_A]
		push	si
		lea	bx, [bx+si+25B0h]
		push	es
		push	bx
		push	ss
		push	di
		mov	bx, word_7B4D8
		call	dword ptr es:[bx+9A0h]
		pop	si
		pop	[bp+var_A]
		mov	di, ax
		or	di, di
		jz	short loc_7081C
		add	si, di
		sub	[bp+var_A], di
		jnz	short loc_707E2
		mov	[bp+var_2], si
		mov	cx, si
		jmp	loc_709A0
		db 0C7h

loc_7081C:
		mov	[bp+var_2], si
		mov	cx, si
		or	cx, cx
		jz	short loc_70828
		jmp	loc_7099B

loc_70828:
		cmp	[bp+var_E], 0
		jz	short loc_70831
		jmp	loc_7099B

loc_70831:
		les	bx, word_7B4D8
		push	es
		push	bx
		mov	al, es:[bx+393h]
		sub	ah, ah
		mov	dx, es:[bx+99Eh]
		call	sub_70CB6
		pop	bx
		pop	es
		cmp	word ptr es:[bx+4], 0
		jz	short loc_70853
		inc	word ptr es:[bx+2]

loc_70853:
		lea	ax, [bx+1BAAh]
		push	es
		push	ax
		lea	ax, [bx+2]
		push	es
		push	ax
		call	dword ptr es:[bx+9A4h]
		pop	si
		pop	di
		mov	sp, bp
		pop	bp
		ret

loc_70869:
		mov	[bp+var_8], di

loc_7086C:
		mov	bx, si
		call	sub_70A48
		mov	di, ax

loc_70873:
		les	bx, word_7B4D8
		or	di, di
		jz	short loc_708A9
		cmp	di, 2
		jnz	short loc_70887
		cmp	word ptr es:[bx], 100h
		jnb	short loc_708A9

loc_70887:
		cmp	[bp+var_C], 0
		jz	short loc_708C5
		mov	ax, si
		add	ax, di
		cmp	ax, [bp+var_8]
		jbe	short loc_708C5
		mov	di, [bp+var_8]
		sub	di, si
		cmp	di, 2
		jb	short loc_708A9
		jnz	short loc_7091D
		cmp	word ptr es:[bx], 100h
		jb	short loc_7091D

loc_708A9:
		mov	di, bx
		mov	bl, es:[si]
		sub	bh, bh
		mov	al, es:[bx+di+8Eh]
		sub	ah, ah
		shl	bx, 1
		mov	dx, es:[bx+di+394h]
		mov	di, 1
		jmp	loc_7098D
		add	[bp+di+arg_8FB], 5373h
		inc	si
		cmp	si, [bp+var_8]
		dec	si
		jnb	short loc_7091D
		mov	ax, es:[bx]
		mov	[bp+var_4], ax
		mov	[bp+var_2], di
		push	es
		push	bx
		lea	bx, [si+1]
		call	sub_70A48
		pop	bx
		pop	es
		xchg	di, ax
		mov	ax, [bp+var_2]
		cmp	di, ax
		jbe	short loc_70914
		inc	ax
		cmp	ax, di
		jb	short loc_708F8
		cmp	[bp+var_4], 80h
		jbe	short loc_70914

loc_708F8:
		mov	cl, es:[si]
		sub	ch, ch
		add	bx, cx
		mov	al, es:[bx+8Eh]
		sub	ah, ah
		add	bx, cx
		mov	dx, es:[bx+394h]
		call	sub_70CB6
		inc	si
		jmp	loc_70873

loc_70914:
		mov	di, [bp+var_2]
		mov	ax, [bp+var_4]
		mov	es:[bx], ax

loc_7091D:
		push	es
		push	bx
		mov	ax, di
		shl	ax, 1
		add	bx, ax
		mov	dx, es:[bx+590h]
		pop	bx
		push	bx
		mov	al, es:[bx+di+18Ch]
		sub	ah, ah
		call	sub_70CB6
		pop	bx
		pop	es
		cmp	di, 2
		jnz	short loc_70964
		push	es
		push	bx
		mov	ax, es:[bx]
		shr	ax, 1
		shr	ax, 1
		add	bx, ax
		mov	dl, es:[bx+4Eh]
		mov	al, es:[bx+0Eh]
		sub	ah, ah
		sub	dh, dh
		call	sub_70CB6
		pop	bx
		pop	es
		mov	dl, es:[bx]
		and	dx, 3
		mov	ax, di
		jmp	short loc_7098D
		test	word_78D83, 78Bh
		mov	cl, es:[bx+6]
		shr	ax, cl
		add	bx, ax
		mov	dl, es:[bx+4Eh]
		mov	al, es:[bx+0Eh]
		sub	ah, ah
		sub	dh, dh
		call	sub_70CB6
		pop	bx
		pop	es
		mov	dx, es:[bx+8]
		and	dx, es:[bx]
		mov	ax, es:[bx+6]

loc_7098D:
		call	sub_70CB6
		add	si, di
		cmp	[bp+var_8], si
		jbe	short loc_70A14
		jmp	loc_7086C
		jmp	far ptr 1F4h:46C7h
		add	[bp+di+var_3B07], cl
		push	ds
		test	al, 4Dh
		add	di, es:[bx+0Ch]
		lea	di, [bx+di+23ACh]
		cmp	[bp+var_C], 0
		jz	short loc_709B8
		add	di, 204h

loc_709B8:
		mov	ax, [bp+var_E]
		or	ax, ax
		jz	short loc_709D9
		dec	ax
		jz	short loc_709F3
		mov	si, [bp+var_6]
		lea	ax, [di+1]
		mov	bx, word_7B4D8
		mov	cx, es:[bx+0Ch]
		mov	bx, si
		sub	bx, cx
		call	sub_70D2D
		jmp	short loc_70A0D

loc_709D9:
		mov	bx, word_7B4D8
		cmp	word ptr es:[bx+0Ch], 1000h
		jz	short loc_709E8
		inc	[bp+var_E]

loc_709E8:
		mov	si, [bp+var_6]
		lea	ax, [di+1]
		mov	bx, si
		jmp	short loc_70A07
		call	far ptr 8DFAh:768Bh
		inc	bp
		add	[bp+di+var_57E2], cx
		dec	bp
		mov	cx, es:[bx+0Ch]
		lea	bx, [si+204h]
		sub	bx, cx

loc_70A07:
		call	sub_70D2D
		inc	[bp+var_E]

loc_70A0D:
		cmp	di, si
		jbe	short loc_70A14
		jmp	loc_70869

loc_70A14:
		cmp	[bp+var_C], 0
		jnz	short loc_70A38
		les	bx, word_7B4D8
		lea	ax, [bx+23ACh]
		push	es
		push	ax
		lea	ax, [bx+33ACh]
		push	es
		push	ax
		mov	ax, es:[bx+0Ch]
		add	ax, 204h
		call	sub_70DBA
		sub	si, 1000h

loc_70A38:
		mov	[bp+var_6], si
		cmp	[bp+var_C], 0
		jnz	short loc_70A44
		jmp	loc_707DB

loc_70A44:
		jmp	loc_70831
sub_7078A		endp

; START OF FUNCTION CHUNK FOR sub_7078A
		db 0F7h
; END OF FUNCTION CHUNK FOR sub_7078A

; ----------------------------------------------------------------------

sub_70A48		proc near
		mov	word_7BCEA, ss
		mov	word_7BCEC, sp
		mov	ax, ds
		cmp	word_7B4D6, 0
		jz	short loc_70A63
		cli
		mov	ss, ax
		mov	sp, 55BAh
		sti
		jmp	short loc_70A68
		db 0C7h

loc_70A63:
		mov	ss, ax
		mov	sp, 55BAh

loc_70A68:
		push	bp
		mov	bp, sp
		sub	sp, 0Eh
		push	bx
		push	di
		push	si
		mov	word ptr [bp-6], 1
		push	ds
		mov	ds, word_7B4DA
		cld
		mov	di, bx
		mov	al, [bx+1]
		mov	bl, [bx]
		sub	bh, bh
		sub	ah, ah
		mov	cl, 3
		shl	bx, cl
		add	bx, ax
		shl	bx, 1
		mov	[bp-0Ah], bx
		pop	es
		push	es
		mov	si, es:4DA8h
		mov	bx, [bx+si+9A8h]
		mov	[bp-8], bx
		sub	di, [si+0Ch]
		inc	di
		push	ds
		pop	es
		cmp	[bx], di
		jnb	short loc_70ABB

loc_70AAA:
		inc	bx
		inc	bx
		cmp	[bx], di
		jb	short loc_70AAA
		mov	[bp-8], bx
		xchg	bx, ax
		mov	bx, [bp-0Ah]
		mov	[bx+si+9A8h], ax

loc_70ABB:
		mov	bx, [bp-8]
		mov	di, [bx]
		mov	dx, [bp-10h]
		dec	dx
		cmp	di, dx
		jb	short loc_70ACE
		sub	ax, ax
		jmp	loc_70C93
		or	word ptr [bp+di-0F8Ah], 0CE8Bh
		mov	[bp-4], si
		mov	bx, [bp-6]
		dec	bx
		mov	al, [bx+si]
		jmp	short loc_70B0A

loc_70ADE:
		mov	ax, [bp-6]
		cmp	ax, 2
		jb	short loc_70AE9
		jmp	loc_70C93

loc_70AE9:
		xor	ax, ax
		jmp	loc_70C93

loc_70AEE:
		mov	bx, [bp-6]
		dec	bx
		mov	si, [bp-4]
		mov	al, [bx+si]
		mov	cx, si
		nop

loc_70AFA:
		mov	si, cx

loc_70AFC:
		mov	di, [bp-8]
		inc	di
		inc	di
		mov	[bp-8], di
		mov	di, [di]
		cmp	di, dx
		jnb	short loc_70ADE

loc_70B0A:
		cmp	[bx+di], al
		jnz	short loc_70AFC
		cmpsb
		jnz	short loc_70AFA
		mov	cx, 202h
		inc	si
		inc	di
		repe cmpsb
		jz	short loc_70B1B
		inc	cx

loc_70B1B:
		sub	cx, 205h
		not	cx
		cmp	[bp-6], cx
		ja	short loc_70AEE
		lea	ax, [si-1]
		sub	ax, di
		mov	bx, ss:4DA8h
		mov	[bx], ax
		mov	[bp-6], cx
		cmp	cx, 0Eh
		jb	short loc_70AEE
		cmp	cx, 204h
		jnz	short loc_70B4C

loc_70B40:
		xchg	cx, ax
		jmp	loc_70C93
		test	word ptr [bp+di-5BAh], 48E9h
		add	[bx+si+5E8Bh], dx
		clc
		cmp	[bx+2], dx
		jnb	short loc_70B45
		cmp	[bx+4], dx
		jnb	short loc_70AEE
		sub	si, si
		mov	ss:4DB2h, si
		mov	word ptr ss:4DB0h, 0FFFFh
		mov	di, 1
		mov	bx, [bp-4]
		mov	cx, [bp-6]

loc_70B70:
		mov	al, [bx+di]
		cmp	[bx+si], al
		jz	short loc_70B81
		shl	si, 1
		mov	si, ss:[si+4DB0h]
		test	si, si
		jns	short loc_70B8C

loc_70B81:
		inc	si
		inc	di
		shl	di, 1
		mov	ss:[di+4DB0h], si
		shr	di, 1

loc_70B8C:
		cmp	cx, di
		ja	short loc_70B70
		mov	[bp-0Eh], si
		mov	[bp-0Ch], di
		mov	bx, [bp-8]
		mov	di, [bx]
		add	di, cx
		inc	di

loc_70B9E:
		dec	di
		mov	si, cx
		mov	bx, si
		mov	si, ss:[bx+si+4DB0h]
		cmp	si, 0FFFFh
		jnz	short loc_70BAE
		inc	si

loc_70BAE:
		add	word ptr [bp-8], 2
		mov	bx, [bp-8]
		mov	ax, [bx]
		mov	[bp-0Ah], ax
		cmp	ax, dx
		jnb	short loc_70B45
		add	ax, si
		cmp	ax, di
		jb	short loc_70BAE
		mov	bx, [bp-6]
		add	bx, [bp-0Ah]
		mov	ax, [bx-2]
		mov	bx, [bp-4]
		add	bx, [bp-6]
		cmp	[bx-2], ax
		jz	short loc_70C08
		mov	bx, [bp-6]
		dec	bx
		dec	bx
		mov	si, [bp-4]

loc_70BE0:
		mov	di, [bp-8]
		inc	di
		inc	di
		mov	[bp-8], di
		mov	di, [di]
		cmp	di, dx
		jb	short loc_70BF2
		jmp	loc_70B45
		jmp	far ptr 39h:18Bh
		jnz	short loc_70BE0
		mov	al, [di]
		cmp	[si], al
		jnz	short loc_70BE0
		mov	cx, 2
		mov	[bp-0Ah], di
		add	di, cx
		jmp	short loc_70C18

loc_70C08:
		mov	cx, si
		mov	ax, [bp-0Ah]
		add	ax, cx
		cmp	ax, di
		jz	short loc_70C18
		sub	cx, cx
		mov	di, [bp-0Ah]

loc_70C18:
		mov	si, [bp-4]
		add	si, cx
		sub	cx, 205h
		not	cx
		repe cmpsb
		jz	short loc_70C28
		inc	cx

loc_70C28:
		sub	cx, 205h
		not	cx
		cmp	cx, 204h
		jbe	short loc_70C35
		int3

loc_70C35:
		cmp	[bp-6], cx
		jbe	short loc_70C3E
		jmp	loc_70B9E
		db 9Ah

loc_70C3E:
		lea	ax, [si-1]
		sub	ax, di
		mov	bx, ss:4DA8h
		mov	[bx], ax
		cmp	[bp-6], cx
		jb	short loc_70C52
		jmp	loc_70B9E

loc_70C52:
		cmp	cx, 204h
		jnz	short loc_70C5B
		jmp	loc_70B40

loc_70C5B:
		mov	[bp-6], cx

loc_70C5E:
		mov	si, [bp-4]
		mov	bx, [bp-0Ch]
		mov	al, [bx+si]
		mov	bx, [bp-0Eh]
		cmp	[bx+si], al
		jz	short loc_70C78
		shl	bx, 1
		mov	bx, ss:[bx+4DB0h]
		test	bx, bx
		jns	short loc_70C86

loc_70C78:
		inc	bx
		inc	word ptr [bp-0Ch]
		mov	si, [bp-0Ch]
		shl	si, 1
		mov	ss:[si+4DB0h], bx

loc_70C86:
		mov	[bp-0Eh], bx
		mov	ax, [bp-0Ch]
		cmp	cx, ax
		ja	short loc_70C5E
		jmp	loc_70B9E

loc_70C93:
		pop	ds
		pop	si
		pop	di
		mov	sp, bp
		pop	bp
		cmp	word_7B4D6, 0
		jz	short loc_70CAB
		cli
		mov	ss, word_7BCEA
		mov	sp, word_7BCEC
		sti
		ret

loc_70CAB:
		mov	ss, word_7BCEA
		mov	sp, word_7BCEC
		ret
sub_70A48		endp

; START OF FUNCTION CHUNK FOR sub_70A48
		db 0EAh
		nop
; END OF FUNCTION CHUNK FOR sub_70A48

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_70CB6		proc near

var_4		= word ptr -4
var_2		= word ptr -2

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	ax
		push	di
		push	si
		mov	di, dx
		cmp	ax, 8
		jbe	short loc_70CD4
		mov	ax, 8
		call	sub_70CB6
		sub	[bp+var_4], 8
		mov	cl, 8
		shr	di, cl

loc_70CD4:
		les	bx, word_7B4D8
		mov	cx, es:[bx+4]
		mov	[bp+var_2], cx
		mov	ax, di
		shl	al, cl
		mov	si, es:[bx+2]
		or	es:[bx+si+1BAAh], al
		mov	ax, cx
		add	ax, [bp+var_4]
		mov	es:[bx+4], ax
		cmp	ax, 8
		jbe	short loc_70D11
		inc	si
		mov	cl, 8
		sub	cl, byte ptr [bp+var_2]
		shr	di, cl
		mov	ax, di
		mov	es:[bx+si+1BAAh], al
		and	word ptr es:[bx+4], 7
		jmp	short loc_70D19
		db 0C7h

loc_70D11:
		and	word ptr es:[bx+4], 7
		jnz	short loc_70D19
		inc	si

loc_70D19:
		mov	es:[bx+2], si
		cmp	si, 800h
		jb	short loc_70D26
		call	sub_70E05

loc_70D26:
		pop	si
		pop	di
		mov	sp, bp
		pop	bp
		ret
sub_70CB6		endp

; START OF FUNCTION CHUNK FOR sub_70CB6
		db 9Ah
; END OF FUNCTION CHUNK FOR sub_70CB6

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_70D2D		proc near

var_8		= word ptr -8
var_6		= word ptr -6
var_2		= word ptr -2

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	ax
		push	bx
		push	di
		push	si
		cld
		mov	si, word_7B4D8
		mov	[bp+var_2], si
		sub	ax, ax
		mov	es, word_7B4DA
		mov	cx, 900h
		lea	di, [si+9A8h]
		rep stosw
		lea	di, [si+9A8h]
		mov	dx, [bp+var_6]
		mov	si, [bp+var_8]
		sub	dx, si
		mov	cl, 3
		sub	ah, ah
		push	ds
		push	es
		pop	ds
		nop

loc_70D62:
		lodsb
		mov	bl, [si]
		sub	bh, bh
		xchg	bx, ax
		shl	bx, cl
		add	bx, ax
		shl	bx, 1
		add	word ptr [bx+di], 2
		dec	dx
		jnz	short loc_70D62
		mov	si, [bp+var_2]
		lea	ax, [si+45B0h]
		mov	cx, 480h
		lea	di, [si+9A8h]

loc_70D82:
		add	ax, [di]
		stosw
		add	ax, [di]
		stosw
		loop	short loc_70D82
		lea	di, [si+9A8h]
		mov	dx, [bp+var_6]
		mov	si, dx
		sub	dx, [bp+var_8]
		mov	cl, 3
		sub	ah, ah
		std
		nop

loc_70D9C:
		lodsb
		mov	bl, [si]
		sub	bh, bh
		shl	bx, cl
		add	bx, ax
		shl	bx, 1
		sub	word ptr [bx+di], 2
		mov	bx, [bx+di]
		mov	[bx], si
		dec	dx
		jnz	short loc_70D9C
		cld
		pop	ds
		pop	si
		pop	di
		mov	sp, bp
		pop	bp
		ret
sub_70D2D		endp

; START OF FUNCTION CHUNK FOR sub_70D2D
		db 0C7h
; END OF FUNCTION CHUNK FOR sub_70D2D

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_70DBA		proc near

arg_0		= word ptr  4
arg_4		= word ptr  8

		push	bp
		mov	bp, sp
		push	di
		push	si
		xchg	cx, ax
		jcxz	short loc_70DDB
		push	ds
		cld
		lds	si, [bp+arg_0]
		les	di, [bp+arg_4]
		test	di, 1
		jz	short loc_70DD2
		movsb
		dec	cx

loc_70DD2:
		shr	cx, 1
		rep movsw
		rcl	cx, 1
		rep movsb
		pop	ds

loc_70DDB:
		pop	si
		pop	di
		pop	bp
		ret	8
sub_70DBA		endp

; START OF FUNCTION CHUNK FOR sub_70DBA
		db 81h
; END OF FUNCTION CHUNK FOR sub_70DBA

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_70DE2		proc near

arg_0		= word ptr  4

		push	bp
		mov	bp, sp
		push	di
		xchg	dx, cx
		jcxz	short loc_70DFF
		les	di, [bp+arg_0]
		mov	ah, al
		test	di, 1
		jz	short loc_70DF7
		stosb
		dec	cx

loc_70DF7:
		shr	cx, 1
		rep stosw
		shl	cx, 1
		rep stosb

loc_70DFF:
		pop	di
		pop	bp
		ret	4
sub_70DE2		endp

; START OF FUNCTION CHUNK FOR sub_70DE2
		db 0F7h
; END OF FUNCTION CHUNK FOR sub_70DE2

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_70E05		proc near

var_750D		= word ptr -750Dh
var_4		= word ptr -4
var_2		= byte ptr -2
var_1		= byte ptr -1

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	[bp+var_4], 800h
		push	si
		push	di
		mov	ax, word_7B4D8
		add	ax, 1BAAh
		push	word_7B4DA
		push	ax
		lea	ax, [bp+var_4]
		push	ss
		push	ax
		les	bx, word_7B4D8
		call	dword ptr es:[bx+9A4h]
		pop	di
		pop	si
		les	bx, word_7B4D8
		add	bx, es:[bx+2]
		mov	al, es:[bx+1BAAh]
		mov	[bp+var_1], al
		mov	bx, word_7B4D8
		mov	al, es:[bx+23AAh]
		mov	[bp+var_2], al
		sub	word ptr es:[bx+2], 800h
		lea	ax, [bx+1BAAh]
		push	es
		push	ax
		sub	ax, ax
		mov	dx, 802h
		call	sub_70DE2
		les	bx, word_7B4D8
		cmp	word ptr es:[bx+2], 0
		jnz	short loc_70E6E
		mov	si, bx
		jmp	short loc_70E78
		or	[bp+di+var_750D], 0FE46h
		mov	es:[si+1BAAh], al

loc_70E78:
		cmp	word ptr es:[si+4], 0
		jz	short loc_70E8D
		mov	bx, es:[si+2]
		add	bx, si
		mov	al, [bp+var_1]
		mov	es:[bx+1BAAh], al

loc_70E8D:
		pop	si
		mov	sp, bp
		pop	bp
		ret
sub_70E05		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_70E92		proc far

arg_0		= word ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	ax, [bp+arg_4]
		mov	dx, [bp+arg_6]
		les	si, [bp+arg_0]
		mov	di, es
		mov	word_7B4DC, si
		mov	word_7B4DE, es
		mov	es:[si+16h], ax
		mov	es:[si+18h], dx
		mov	word ptr es:[si+0Eh], 800h
		push	si
		push	di
		lea	ax, [si+221Eh]
		push	es
		push	ax
		lea	ax, [si+0Eh]
		push	es
		push	ax
		mov	ax, [bp+arg_8]
		mov	dx, [bp+arg_A]
		mov	es:[si+12h], ax
		mov	es:[si+14h], dx
		call	dword ptr es:[si+12h]
		pop	di
		pop	si
		mov	es, di
		mov	es:[si+10h], ax
		cmp	ax, 4
		ja	short loc_70EF8
		mov	ax, 3
		jmp	loc_70FDE
sub_70E92		endp

; START OF FUNCTION CHUNK FOR sub_70E92
		db 0EAh
; END OF FUNCTION CHUNK FOR sub_70E92

; ----------------------------------------------------------------------

sub_70EEB		proc far
		mov	ax, seg seg220
		push	ax
		mov	ax, 0CA2h
		push	ax
		call	sub_7026A
		retf
		db 0C7h

loc_70EF8:
		mov	al, es:[si+221Eh]
		sub	ah, ah
		mov	es:[si+2], ax
		mov	al, es:[si+2220h]
		mov	es:[si+0Ah], ax
		mov	al, es:[si+221Fh]
		mov	es:[si+6], ax
		mov	word ptr es:[si+0Ch], 0
		mov	word ptr es:[si+0Eh], 3
		cmp	ax, 4
		jnb	short loc_70F29
		jmp	loc_70FDB

loc_70F29:
		cmp	ax, 6
		jbe	short loc_70F31
		jmp	loc_70FDB

loc_70F31:
		mov	cl, 10h
		sub	cl, al
		mov	ax, 0FFFFh
		shr	ax, cl
		mov	es:[si+8], ax
		mov	ax, es:[si+2]
		or	ax, ax
		jz	short loc_70F63
		dec	ax
		jz	short loc_70F4F
		mov	ax, 2
		jmp	loc_70FDE

loc_70F4F:
		lea	ax, [si+2F9Eh]
		push	es
		push	ax
		mov	ax, 152h
		push	cs
		push	ax
		mov	ax, 100h
		call	sub_70DBA
		call	sub_7130F

loc_70F63:
		push	di
		lea	ax, [si+30DEh]
		push	ax
		mov	ax, 132h
		push	cs
		push	ax
		mov	ax, 10h
		call	sub_70DBA
		lea	bx, [si+30DEh]
		mov	cx, 142h
		lea	dx, [si+2B1Eh]
		mov	ax, 10h
		call	sub_712D9
		push	di
		lea	ax, [si+30EEh]
		push	ax
		mov	ax, 102h
		push	cs
		push	ax
		mov	ax, 10h
		call	sub_70DBA
		push	di
		lea	ax, [si+30FEh]
		push	ax
		mov	ax, 112h
		push	cs
		push	ax
		mov	ax, 20h
		call	sub_70DBA
		push	di
		lea	ax, [si+309Eh]
		push	ax
		mov	ax, 82h
		push	cs
		push	ax
		mov	ax, 40h
		call	sub_70DBA
		lea	bx, [si+309Eh]
		mov	cx, 0C2h
		lea	dx, [si+2A1Eh]
		mov	ax, 40h
		call	sub_712D9
		call	sub_70FE5
		cmp	ax, 306h
		jnz	short loc_70FD7
		mov	ax, 4
		jmp	short loc_70FDE
		sub	word ptr [bp+di], 0EBC0h
		add	di, [bx+si+1]

loc_70FDE:
		pop	di
		pop	si
		pop	bp
		retf	0Ch
sub_70EEB		endp

; START OF FUNCTION CHUNK FOR sub_70EEB
		db 0EAh
; END OF FUNCTION CHUNK FOR sub_70EEB

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_70FE5		proc near

var_2		= word ptr -2

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		les	si, word_7B4DC
		mov	word ptr es:[si+4], 1000h

loc_70FF7:
		push	es
		call	sub_710B0
		pop	es
		cmp	ax, 305h
		jb	short loc_71004
		jmp	loc_7108D

loc_71004:
		cmp	ax, 100h
		jnb	short loc_7101A
		lea	bx, [si+1Ah]
		mov	di, es:[si+4]
		mov	es:[bx+di], al
		inc	di
		mov	es:[si+4], di
		jmp	short loc_7104A

loc_7101A:
		sub	ax, 0FEh
		mov	di, ax
		push	es
		call	sub_711EE
		pop	es
		or	ax, ax
		jz	short loc_71088
		mov	cx, di
		lea	bx, [si+1Ah]
		mov	di, es:[si+4]
		add	di, bx
		mov	dx, si
		mov	si, di
		sub	si, ax
		cld
		push	ds
		mov	ax, es
		mov	ds, ax
		rep movsb
		pop	ds
		mov	si, dx
		sub	di, bx
		mov	es:[si+4], di

loc_7104A:
		cmp	di, 2000h
		jb	short loc_70FF7
		mov	[bp+var_2], 1000h
		push	si
		push	di
		lea	ax, [si+101Ah]
		push	es
		push	ax
		lea	ax, [bp+var_2]
		push	ss
		push	ax
		call	dword ptr es:[si+16h]
		pop	di
		pop	si
		mov	es, word_7B4DE
		lea	ax, [si+1Ah]
		push	es
		push	ax
		add	ax, 1000h
		push	es
		push	ax
		mov	ax, es:[si+4]
		sub	ax, 1000h
		mov	es:[si+4], ax
		call	sub_70DBA
		jmp	loc_70FF7
		test	di, 0FE46h
		push	es
		add	di, di

loc_7108E:
		jbe	short loc_7108E
		mov	ax, es:[si+4]
		sub	ax, 1000h
		mov	[bp+var_2], ax
		lea	ax, [si+101Ah]
		push	es
		push	ax
		lea	ax, [bp+var_2]
		push	ss
		push	ax
		call	dword ptr es:[si+16h]
		pop	ax
		pop	di
		pop	si
		mov	sp, bp
		pop	bp
		ret
sub_70FE5		endp

; ----------------------------------------------------------------------

sub_710B0		proc near
		push	di
		push	si
		les	bx, word_7B4DC
		test	byte ptr es:[bx+0Ah], 1
		jz	short loc_71127
		mov	ax, 1
		call	sub_71256
		or	ax, ax
		jz	short loc_710CD

loc_710C7:
		mov	ax, 306h
		jmp	loc_711EA

loc_710CD:
		les	bx, word_7B4DC
		mov	si, es:[bx+0Ah]
		and	si, 0FFh
		mov	al, es:[bx+si+2B1Eh]
		sub	ah, ah
		mov	di, ax
		lea	si, [bx+30DEh]
		mov	bx, ax
		mov	al, es:[bx+si]
		sub	ah, ah
		call	sub_71256
		or	ax, ax
		jnz	short loc_710C7
		les	bx, word_7B4DC
		mov	cl, es:[bx+di+30EEh]
		test	cl, cl
		jz	short loc_7111F
		mov	si, 1
		shl	si, cl
		dec	si
		and	si, es:[bx+0Ah]
		shl	di, 1
		add	si, es:[bx+di+30FEh]
		mov	al, cl
		sub	ah, ah
		call	sub_71256
		or	ax, ax
		jnz	short loc_710C7
		mov	di, si

loc_7111F:
		add	di, 100h
		jmp	loc_711E8
		jmp	far ptr 0E800h:1B8h
		sub	[bx+di], ax
		or	ax, ax
		jz	short loc_71133
		jmp	short loc_710C7

loc_71133:
		les	si, word_7B4DC
		cmp	es:[si+2], ax
		jnz	short loc_71157
		mov	bx, si
		mov	di, es:[bx+0Ah]
		and	di, 0FFh
		mov	ax, 8

loc_7114A:
		call	sub_71256
		or	ax, ax
		jnz	short loc_71154
		jmp	loc_711E8

loc_71154:
		jmp	loc_710C7

loc_71157:
		mov	al, es:[si+0Ah]
		sub	ah, ah
		or	ax, ax
		jz	short loc_711B8
		mov	bx, si
		add	bx, ax
		mov	al, es:[bx+2C1Eh]
		mov	di, ax
		cmp	ax, 0FFh
		jnz	short loc_711DA
		test	byte ptr es:[si+0Ah], 3Fh
		jz	short loc_71198
		mov	ax, 4
		call	sub_71256
		or	ax, ax
		jz	short loc_71185
		jmp	loc_710C7

loc_71185:
		les	bx, word_7B4DC
		mov	si, es:[bx+0Ah]
		and	si, 0FFh
		mov	di, es:[bx+si+2D1Eh]
		jmp	short loc_711D6

loc_71198:
		mov	ax, 6
		call	sub_71256
		or	ax, ax
		jz	short loc_711A6
		jmp	loc_710C7
		call	far ptr 4DACh:1EC4h
		mov	si, es:[bx+0Ah]
		and	si, 7Fh
		mov	di, es:[bx+si+2E1Eh]
		jmp	short loc_711D6

loc_711B8:
		mov	ax, 8
		call	sub_71256
		or	ax, ax
		jz	short loc_711C5
		jmp	loc_710C7

loc_711C5:
		les	bx, word_7B4DC
		mov	si, es:[bx+0Ah]
		and	si, 0FFh
		mov	di, es:[bx+si+2E9Eh]

loc_711D6:
		and	di, 0FFh

loc_711DA:
		mov	bx, word_7B4DC
		mov	al, es:[bx+di+2F9Eh]
		sub	ah, ah
		jmp	loc_7114A

loc_711E8:
		mov	ax, di

loc_711EA:
		pop	si
		pop	di
		ret
sub_710B0		endp

; START OF FUNCTION CHUNK FOR sub_710B0
		db 9Ah
; END OF FUNCTION CHUNK FOR sub_710B0

; ----------------------------------------------------------------------

sub_711EE		proc near
		push	di
		push	si
		mov	di, ax
		les	si, word_7B4DC
		mov	bl, es:[si+0Ah]
		sub	bh, bh
		mov	bl, es:[bx+si+2A1Eh]
		sub	bh, bh
		xchg	si, bx
		mov	al, es:[bx+si+309Eh]
		sub	ah, ah
		call	sub_71256
		or	ax, ax
		jz	short loc_71217

loc_71213:
		sub	ax, ax
		jmp	short loc_71251

loc_71217:
		les	bx, word_7B4DC
		cmp	di, 2
		jnz	short loc_71238
		shl	si, 1
		shl	si, 1
		mov	al, es:[bx+0Ah]
		and	ax, 3
		or	si, ax
		mov	ax, di

loc_7122F:
		call	sub_71256
		or	ax, ax
		jz	short loc_7124F
		jmp	short loc_71213

loc_71238:
		mov	cl, es:[bx+6]
		shl	si, cl
		mov	ax, es:[bx+8]
		and	ax, es:[bx+0Ah]
		or	si, ax
		mov	al, cl
		xor	ch, ch
		jmp	short loc_7122F
		db 0C7h

loc_7124F:
		xchg	si, ax
		inc	ax

loc_71251:
		pop	si
		pop	di
		ret
sub_711EE		endp

; START OF FUNCTION CHUNK FOR sub_711EE
		db 0C7h
		nop
; END OF FUNCTION CHUNK FOR sub_711EE

; ----------------------------------------------------------------------

sub_71256		proc near
		xchg	cx, ax
		les	bx, word_7B4DC
		mov	ch, es:[bx+0Ch]
		cmp	ch, cl
		jb	short loc_71270
		shr	es:[bx+0Ah], cl
		sub	ch, cl
		mov	es:[bx+0Ch], ch
		xor	ax, ax
		ret

loc_71270:
		push	di
		push	si
		mov	si, bx
		xchg	cl, ch
		shr	es:[si+0Ah], cl
		mov	di, es:[si+0Eh]
		cmp	es:[si+10h], di
		ja	short loc_712B0
		mov	word ptr es:[si+0Eh], 800h
		push	cx
		push	si
		push	di
		lea	ax, [si+221Eh]
		push	es
		push	ax
		lea	ax, [si+0Eh]
		push	es
		push	ax
		call	dword ptr es:[si+12h]
		pop	di
		pop	si
		pop	cx
		mov	es, word_7B4DE
		mov	es:[si+10h], ax
		test	ax, ax
		mov	ax, 1
		jz	short loc_712D5
		xor	di, di

loc_712B0:
		mov	bx, di
		mov	ah, es:[bx+si+221Eh]
		sub	al, al
		or	es:[si+0Ah], ax
		inc	di
		sub	ch, cl
		mov	cl, ch
		shr	es:[si+0Ah], cl
		sub	cl, 8
		neg	cl
		mov	es:[si+0Ch], cl
		sub	ax, ax
		mov	es:[si+0Eh], di

loc_712D5:
		pop	si
		pop	di
		ret
sub_71256		endp

; START OF FUNCTION CHUNK FOR sub_71256
		db 81h
; END OF FUNCTION CHUNK FOR sub_71256

; ----------------------------------------------------------------------

sub_712D9		proc near
		push	bp
		push	di
		push	si
		mov	es, word_7B4DE
		mov	si, cx
		mov	di, dx
		mov	dx, bx
		mov	bx, ax
		dec	bx

loc_712E9:
		add	bx, dx
		mov	cl, es:[bx]
		sub	bx, dx
		mov	ax, 1
		shl	ax, cl
		mov	bp, cs:[bx+si]
		and	bp, 0FFh

loc_712FC:
		mov	es:[bp+di], bl
		add	bp, ax
		cmp	bp, 0FFh
		jbe	short loc_712FC
		dec	bx
		jge	short loc_712E9
		pop	si
		pop	di
		pop	bp
		ret
sub_712D9		endp

; START OF FUNCTION CHUNK FOR sub_712D9
		db 0F7h
; END OF FUNCTION CHUNK FOR sub_712D9

; ----------------------------------------------------------------------

sub_7130F		proc near
		push	bp
		push	di
		push	si
		push	ds
		lds	si, word_7B4DC
		mov	dx, 0FFh
		mov	bx, dx

loc_7131C:
		shl	bx, 1
		mov	di, cs:[bx+252h]
		shr	bx, 1
		xor	cl, cl
		mov	bp, 2C1Eh
		mov	al, [bx+si+2F9Eh]
		cmp	al, 8
		jbe	short loc_7135A
		test	dx, di
		jz	short loc_71355
		mov	bp, di
		and	bp, dx
		mov	ds:[bp+si+2C1Eh], dl
		mov	cl, 4
		mov	bp, 2D1Eh
		test	di, 3Fh
		jnz	short loc_7135A
		mov	cl, 6
		mov	bp, 2E1Eh
		mov	dx, 7Fh
		jmp	short loc_7135A
		div	word ptr [bx+di-42F8h]
		sahf
		shr	di, cl
		sub	al, cl
		mov	[bx+si+2F9Eh], al
		xchg	cx, ax
		mov	ax, 1
		shl	ax, cl
		add	bp, si

loc_7136A:
		mov	ds:[bp+di], bl
		add	di, ax
		cmp	di, dx
		jbe	short loc_7136A
		mov	dx, 0FFh
		dec	bx
		jge	short loc_7131C
		pop	ds
		pop	si
		pop	di
		pop	bp
		ret
sub_7130F		endp

; START OF FUNCTION CHUNK FOR sub_7130F
		add	[bx+si], al
; END OF FUNCTION CHUNK FOR sub_7130F
seg220		ends
