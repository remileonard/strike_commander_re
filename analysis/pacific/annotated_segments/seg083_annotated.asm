seg083		segment	para public 'CODE' use16
		assume cs:seg083
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 94h, 65h, 9Ah, 2Fh, 17h, 0, 0, 83h, 0C4h, 0Ch, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3362C		proc far

var_57C		= byte ptr -57Ch
var_57A		= byte ptr -57Ah
var_578		= byte ptr -578h
var_576		= word ptr -576h
var_574		= word ptr -574h
var_572		= word ptr -572h
var_56C		= word ptr -56Ch
var_32C		= word ptr -32Ch
var_E8		= word ptr -0E8h
var_E0		= word ptr -0E0h
var_DE		= word ptr -0DEh
var_BC		= word ptr -0BCh
var_BA		= word ptr -0BAh
var_A0		= word ptr -0A0h
var_98		= word ptr -98h
var_96		= word ptr -96h
var_7C		= dword ptr -7Ch
var_78		= dword ptr -78h
var_74		= word ptr -74h
var_72		= word ptr -72h
var_70		= word ptr -70h
var_6A		= dword ptr -6Ah
var_58		= word ptr -58h
var_56		= word ptr -56h
var_54		= word ptr -54h
var_52		= word ptr -52h
var_50		= word ptr -50h
var_4E		= word ptr -4Eh
var_4C		= dword ptr -4Ch
var_48		= dword ptr -48h
var_44		= dword ptr -44h
var_40		= dword ptr -40h
var_3C		= dword ptr -3Ch
var_38		= dword ptr -38h
var_34		= dword ptr -34h
var_30		= dword ptr -30h
var_2C		= dword ptr -2Ch
var_28		= dword ptr -28h
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

		enter	57Ch, 0
		push	si
		push	di
		push	ds
		mov	si, [bp+arg_0]
		push	[bp+arg_2]
		push	si
		call	sub_327CC
		add	sp, 4
		movzx	eax, word_7CA4C
		shl	eax, 8
		mov	[bp+var_4], eax
		movzx	eax, word_7CA4E
		shl	eax, 8
		mov	[bp+var_8], eax
		movzx	eax, word_7CA50
		shl	eax, 8
		mov	[bp+var_C], eax
		movzx	eax, word_7CA52
		shl	eax, 8
		mov	[bp+var_10], eax
		movsx	eax, word_7CA0C
		shl	eax, 8
		mov	[bp+var_14], eax
		movsx	eax, word_7CA0E
		shl	eax, 8
		mov	[bp+var_18], eax
		mov	ecx, [si+9]
		mov	eax, dword_7CA24
		imul	ecx
		mov	[bp+var_40], eax
		mov	eax, dword_7CA30
		imul	ecx
		mov	[bp+var_3C], eax
		mov	eax, dword_7CA3C
		imul	ecx
		mov	[bp+var_38], eax
		mov	eax, dword_7CA28
		imul	ecx
		mov	[bp+var_4C], eax
		mov	eax, dword_7CA34
		imul	ecx
		mov	[bp+var_48], eax
		mov	eax, dword_7CA40
		imul	ecx
		mov	[bp+var_44], eax
		shl	ecx, 8
		mov	ax, [si+3Fh]
		cwde
		imul	ecx
		sub	eax, dword_7CA18
		mov	[bp+var_34], eax
		mov	ax, [si+41h]
		cwde
		imul	ecx
		sub	eax, dword_7CA1C
		mov	[bp+var_30], eax
		mov	eax, 0
		sub	eax, dword_7CA20
		mov	[bp+var_2C], eax
		mov	ax, 62F4h
		push	ax
		lea	ax, word ptr [bp+var_34]
		push	ax
		call	Matrix_WorldToLocal_5A569
		add	sp, 4
		mov	eax, [si+5]
		mov	dword_77C22, eax
		mov	eax, [si+1]
		shl	eax, 2
		mov	dword_77C26, eax
		mov	ax, [si+17h]
		mov	[bp+var_4E], ax
		push	0
		mov	al, [si+1Dh]
		push	ax
		push	large [si+19h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		mov	word ptr dword_77BF0, ax
		mov	word_77BF2, dx
		mov	gs, dx
		mov	di, si
		mov	si, [di+25h]
		mov	[bp+var_56], 0

loc_33763:
		mov	eax, [bp+var_34]
		mov	[bp+var_28], eax
		mov	eax, [bp+var_30]
		mov	[bp+var_24], eax
		mov	eax, [bp+var_2C]
		mov	[bp+var_20], eax
		mov	bx, [bp+var_56]
		add	bx, [di+3Dh]
		mov	ax, [bx]
		mov	[bp+var_54], ax
		mov	bx, [bp+var_56]
		add	bx, [di+3Bh]
		mov	dx, [bx]
		mov	[bp+var_50], dx
		add	ax, dx
		dec	ax
		mov	[bp+var_52], ax
		mov	[bp+var_58], 0

loc_3379C:
		mov	byte ptr gs:[si+10h], 1
		mov	bx, [bp+var_4E]
		mov	ecx, [bx]
		mov	gs:[si+11h], ecx
		mov	eax, [bp+var_28]
		mov	gs:[si], eax
		mov	eax, [bp+var_20]
		mov	gs:[si+8], eax
		mov	edx, [bp+var_24]
		mov	gs:[si+4], edx
		cmp	[bp+var_54], 0
		jz	short loc_3383C
		nop
		nop
		mov	ax, [bp+var_58]
		cmp	ax, [bp+var_50]
		jl	short loc_3383C
		nop
		nop
		cmp	ax, [bp+var_52]
		jg	short loc_3383C
		nop
		nop
		mov	bx, cx
		shr	ecx, 10h
		mov	es, cx
		mov	ax, es:[bx]
		cwde
		mov	ecx, eax
		mov	eax, dword_7CA2C
		imul	ecx
		add	gs:[si], eax
		mov	eax, dword_7CA44
		imul	ecx
		add	gs:[si+8], eax
		mov	eax, dword_7CA38
		imul	ecx
		add	eax, gs:[si+4]
		mov	gs:[si+4], eax
		mov	edx, eax
		or	byte ptr gs:[si+10h], 80h
		and	byte ptr gs:[si+10h], 0FEh
		mov	al, 2
		cmp	edx, dword_77C26
		jge	short loc_33850
		nop
		nop
		mov	al, 4
		cmp	edx, dword_77C22
		jl	short loc_33850
		mov	al, 0
		jmp	short loc_33850

loc_3383C:
		mov	al, 4
		cmp	edx, dword_77C22
		jl	short loc_33850
		mov	al, 2
		cmp	edx, dword_77C26
		jg	short loc_33850
		mov	al, 0

loc_33850:
		or	gs:[si+10h], al
		add	[bp+var_4E], 4
		add	si, 15h
		mov	eax, [bp+var_40]
		add	[bp+var_28], eax
		mov	eax, [bp+var_3C]
		add	[bp+var_24], eax
		mov	eax, [bp+var_38]
		add	[bp+var_20], eax
		inc	[bp+var_58]
		mov	ax, [bp+var_58]
		cmp	ax, [di+11h]
		jb	loc_3379C
		mov	eax, [bp+var_4C]
		sub	[bp+var_34], eax
		mov	eax, [bp+var_48]
		sub	[bp+var_30], eax
		mov	eax, [bp+var_44]
		sub	[bp+var_2C], eax
		add	[bp+var_56], 2
		mov	ax, [bp+var_56]
		shr	ax, 1
		cmp	ax, [di+11h]
		jb	loc_33763
		mov	si, [di+29h]
		mov	cx, [di+27h]

loc_338AE:
		mov	byte ptr gs:[si+10h], 0
		add	si, 11h
		loop	short loc_338AE
		mov	eax, dword ptr word_77C1A
		mov	dword ptr word_77C16, eax
		mov	cx, [di+2Dh]
		mov	[bp+var_56], cx
		mov	di, [di+2Fh]
		mov	[bp+var_57C], 0
		or	byte ptr gs:[di+15h], 3Fh
		mov	[bp+var_57A], 0
		mov	si, gs:[di+2]
		mov	al, gs:[si+10h]
		mov	si, gs:[di+4]
		and	al, gs:[si+10h]
		mov	si, gs:[di+6]
		and	al, gs:[si+10h]
		test	al, 1
		jnz	loc_357B8
		and	al, 6
		jnz	loc_357B8
		test	byte ptr gs:[si+10h], 80h
		jnz	short loc_33960
		lfs	bx, gs:[si+11h]
		mov	ax, fs:[bx]
		cwde
		mov	ecx, eax
		mov	eax, dword_7CA2C
		imul	ecx
		add	gs:[si], eax
		mov	eax, dword_7CA38
		imul	ecx
		add	gs:[si+4], eax
		mov	eax, dword_7CA44
		imul	ecx
		add	gs:[si+8], eax
		or	byte ptr gs:[si+10h], 80h
		mov	dl, gs:[si+10h]
		mov	eax, gs:[si+4]
		cmp	eax, dword_77C26
		jl	short loc_3394D
		or	dl, 2
		jmp	short loc_3395C

loc_3394D:
		cmp	eax, dword_77C22
		jge	short loc_33959
		or	dl, 4
		jmp	short loc_3395C

loc_33959:
		and	dl, 0F9h

loc_3395C:
		mov	gs:[si+10h], dl

loc_33960:
		mov	si, gs:[di+4]
		test	byte ptr gs:[si+10h], 80h
		jnz	short loc_339C8
		lfs	bx, gs:[si+11h]
		mov	ax, fs:[bx]
		cwde
		mov	ecx, eax
		mov	eax, dword_7CA2C
		imul	ecx
		add	gs:[si], eax
		mov	eax, dword_7CA38
		imul	ecx
		add	gs:[si+4], eax
		mov	eax, dword_7CA44
		imul	ecx
		add	gs:[si+8], eax
		or	byte ptr gs:[si+10h], 80h
		mov	dl, gs:[si+10h]
		mov	eax, gs:[si+4]
		cmp	eax, dword_77C26
		jl	short loc_339B5
		or	dl, 2
		jmp	short loc_339C4

loc_339B5:
		cmp	eax, dword_77C22
		jge	short loc_339C1
		or	dl, 4
		jmp	short loc_339C4

loc_339C1:
		and	dl, 0F9h

loc_339C4:
		mov	gs:[si+10h], dl

loc_339C8:
		mov	si, gs:[di+2]
		test	byte ptr gs:[si+10h], 80h
		jnz	short loc_33A30
		lfs	bx, gs:[si+11h]
		mov	ax, fs:[bx]
		cwde
		mov	ecx, eax
		mov	eax, dword_7CA2C
		imul	ecx
		add	gs:[si], eax
		mov	eax, dword_7CA38
		imul	ecx
		add	gs:[si+4], eax
		mov	eax, dword_7CA44
		imul	ecx
		add	gs:[si+8], eax
		or	byte ptr gs:[si+10h], 80h
		mov	dl, gs:[si+10h]
		mov	eax, gs:[si+4]
		cmp	eax, dword_77C26
		jl	short loc_33A1D
		or	dl, 2
		jmp	short loc_33A2C

loc_33A1D:
		cmp	eax, dword_77C22
		jge	short loc_33A29
		or	dl, 4
		jmp	short loc_33A2C

loc_33A29:
		and	dl, 0F9h

loc_33A2C:
		mov	gs:[si+10h], dl

loc_33A30:
		mov	si, di
		mov	bx, gs:[si+2]
		lfs	bx, gs:[bx+11h]
		mov	al, fs:[bx+3]
		mov	dx, fs:[bx]
		mov	bx, gs:[si+4]
		lfs	bx, gs:[bx+11h]
		cmp	dx, fs:[bx]
		ja	short loc_33A59
		nop
		nop
		mov	al, fs:[bx+3]
		mov	dx, fs:[bx]

loc_33A59:
		mov	bx, gs:[si+6]
		lfs	bx, gs:[bx+11h]
		cmp	dx, fs:[bx]
		ja	short loc_33A70
		nop
		nop
		mov	al, fs:[bx+3]
		mov	dx, fs:[bx]

loc_33A70:
		mov	gs:[si], al
		mov	byte_77C14, al
		or	al, al
		jnz	short loc_33A7F
		nop
		nop
		jmp	loc_357B3

loc_33A7F:
		mov	[bp+var_576], di
		mov	si, di
		mov	ax, word_77C16
		add	ax, 60h
		cmp	ax, word_77C1E
		jnb	loc_357AF
		mov	[bp+var_578], 0
		mov	bx, gs:[si+2]
		lfs	bx, gs:[bx+11h]
		cmp	byte ptr gs:[si+1], 0
		jz	short loc_33AAE
		mov	al, fs:[bx+4]
		jmp	short loc_33AB2

loc_33AAE:
		mov	al, fs:[bx+5]

loc_33AB2:
		mov	ebx, 0
		cmp	al, 0FFh
		jz	short loc_33AF3
		nop
		nop
		cmp	al, 0DFh
		jb	short loc_33AC7
		mov	[bp+var_578], 1

loc_33AC7:
		xor	ah, ah
		cmp	ax, word_7CCEA
		mov	ebx, dword ptr word_7CCEE
		jb	short loc_33AE9
		sub	ax, word_7CCEA
		cmp	ax, word_7CCEC
		mov	ebx, 0
		jnb	short loc_33AF3
		mov	ebx, dword ptr word_7CCF2

loc_33AE9:
		imul	ax, ax, 0Eh
		cwde
		add	ebx, eax
		jmp	short loc_33AF3

loc_33AF3:
		mov	dword_77C04, ebx
		or	ebx, ebx
		jz	short loc_33B63
		mov	cx, 40h
		cmp	byte ptr gs:[si+1], 0
		jz	short loc_33B35
		mov	[bp+var_E0], 200h
		mov	[bp+var_DE], 100h
		mov	ax, cx
		dec	ax
		shl	ax, 8
		mov	[bp+var_BC], ax
		mov	[bp+var_BA], 100h
		mov	[bp+var_98], ax
		mov	ax, cx
		sub	ax, 2
		shl	ax, 8
		mov	[bp+var_96], ax
		jmp	short loc_33B63

loc_33B35:
		mov	[bp+var_E0], 0
		mov	[bp+var_DE], 100h
		mov	ax, cx
		sub	ax, 3
		shl	ax, 8
		mov	[bp+var_BC], ax
		mov	ax, cx
		sub	ax, 2
		shl	ax, 8
		mov	[bp+var_BA], ax
		mov	[bp+var_98], 0
		mov	[bp+var_96], ax

loc_33B63:
		mov	cx, 0
		lea	di, [bp+var_E8]

loc_33B6A:
		mov	bx, cx
		mov	ax, gs:[bx+si+8]
		mov	[di+1Ah], ax
		mov	ax, gs:[bx+si+0Eh]
		mov	[di+1Eh], ax
		mov	ax, gs:[bx+si+2]
		mov	[di+1Ch], ax
		mov	bx, ax
		mov	eax, gs:[bx]
		mov	[di+0Eh], eax
		mov	eax, gs:[bx+4]
		mov	[di+12h], eax
		mov	eax, gs:[bx+8]
		mov	[di+16h], eax
		mov	al, 0
		test	byte ptr gs:[bx+10h], 40h
		jz	short loc_33BC3
		movsx	eax, word ptr gs:[bx+0Ch]
		shl	eax, 8
		mov	[di], eax
		movsx	eax, word ptr gs:[bx+0Eh]
		shl	eax, 8
		mov	[di+4], eax
		mov	al, 1

loc_33BC3:
		mov	[di+20h], al
		mov	[di+21h], al
		lfs	bx, gs:[bx+11h]
		mov	ah, fs:[bx+2]
		xor	al, al
		mov	[di+0Ch], ax
		add	di, 24h
		add	cx, 2
		cmp	cx, 6
		jl	short loc_33B6A
		mov	word_77C10, 0
		mov	[bp+var_572], 0
		lea	ax, [bp+var_E8]
		mov	[bp+var_574], ax
		lea	di, [bp+var_32C]
		and	di, 0FFFCh
		lea	si, [bp+var_A0]

loc_33C02:
		mov	bx, [bp+var_572]
		mov	ax, [bp+var_574]
		mov	dx, si
		mov	si, [bp+var_576]
		mov	bx, gs:[bx+si+8]
		mov	si, dx
		mov	dx, 0
		test	byte ptr gs:[bx+10h], 40h
		jz	loc_33D40
		push	ax
		mov	ax, gs:[bx+0Ch]
		cwde
		shl	eax, 8
		mov	[di], eax
		mov	ax, gs:[bx+0Eh]
		cwde
		shl	eax, 8
		mov	[di+4], eax
		mov	eax, gs:[bx]
		mov	[di+0Eh], eax
		mov	eax, gs:[bx+4]
		mov	[di+12h], eax
		mov	eax, gs:[bx+8]
		mov	[di+16h], eax
		pop	bx
		mov	eax, [si+12h]
		sub	eax, [bx+12h]
		jz	short loc_33C72
		nop
		nop
		mov	ecx, eax
		mov	eax, [di+12h]
		sub	eax, [bx+12h]
		jmp	short loc_33C9E

loc_33C72:
		mov	eax, [si+0Eh]
		sub	eax, [bx+0Eh]
		jz	short loc_33C8B
		nop
		nop
		mov	ecx, eax
		mov	eax, [di+0Eh]
		sub	eax, [bx+0Eh]
		jmp	short loc_33C9E

loc_33C8B:
		mov	eax, [si+16h]
		sub	eax, [bx+16h]
		mov	ecx, eax
		mov	eax, [di+16h]
		sub	eax, [bx+16h]

loc_33C9E:
		cdq
		shld	edx, eax, 10h
		shl	eax, 10h
		idiv	ecx
		mov	ecx, eax
		cmp	dword_77C04, 0
		jz	short loc_33CFD
		movzx	eax, word ptr [si+8]
		movzx	edx, word ptr [bx+8]
		sub	eax, edx
		imul	ecx
		add	eax, 0
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+8]
		mov	[di+8], ax
		movzx	eax, word ptr [si+0Ah]
		movzx	edx, word ptr [bx+0Ah]
		sub	eax, edx
		imul	ecx
		add	eax, 0
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+0Ah]
		mov	[di+0Ah], ax

loc_33CFD:
		movzx	eax, word ptr [si+0Ch]
		movzx	edx, word ptr [bx+0Ch]
		sub	eax, edx
		imul	ecx
		add	eax, 0
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+0Ch]
		mov	[di+0Ch], ax
		mov	byte ptr [di+20h], 1
		mov	byte ptr [di+21h], 1
		mov	word ptr [di+1Eh], 0
		mov	word ptr [di+1Ch], 0
		mov	word ptr [di+1Ah], 0
		add	di, 24h
		inc	word_77C10
		jmp	short loc_33D42

loc_33D40:
		mov	bx, ax

loc_33D42:
		mov	si, [bp+var_574]
		mov	dx, es
		mov	cx, ds
		mov	es, cx
		mov	cx, 9
		rep movsd
		mov	es, dx
		inc	word_77C10
		mov	si, bx
		mov	ax, [bp+var_574]
		add	ax, 24h
		mov	bx, [bp+var_572]
		cmp	bx, 4
		jnz	short loc_33D6E
		lea	ax, [bp+var_E8]

loc_33D6E:
		push	si
		mov	si, [bp+var_576]
		mov	bx, gs:[bx+si+0Eh]
		pop	si
		test	byte ptr gs:[bx+10h], 40h
		jz	loc_33E9D
		push	ax
		mov	ax, gs:[bx+0Ch]
		cwde
		shl	eax, 8
		mov	[di], eax
		mov	ax, gs:[bx+0Eh]
		cwde
		shl	eax, 8
		mov	[di+4], eax
		mov	eax, gs:[bx]
		mov	[di+0Eh], eax
		mov	eax, gs:[bx+4]
		mov	[di+12h], eax
		mov	eax, gs:[bx+8]
		mov	[di+16h], eax
		pop	bx
		mov	eax, [si+12h]
		sub	eax, [bx+12h]
		jz	short loc_33DD1
		nop
		nop
		mov	ecx, eax
		mov	eax, [di+12h]
		sub	eax, [bx+12h]
		jmp	short loc_33DFD

loc_33DD1:
		mov	eax, [si+0Eh]
		sub	eax, [bx+0Eh]
		jz	short loc_33DEA
		nop
		nop
		mov	ecx, eax
		mov	eax, [di+0Eh]
		sub	eax, [bx+0Eh]
		jmp	short loc_33DFD

loc_33DEA:
		mov	eax, [si+16h]
		sub	eax, [bx+16h]
		mov	ecx, eax
		mov	eax, [di+16h]
		sub	eax, [bx+16h]

loc_33DFD:
		cdq
		shld	edx, eax, 10h
		shl	eax, 10h
		idiv	ecx
		mov	ecx, eax
		cmp	dword_77C04, 0
		jz	short loc_33E5C
		movzx	eax, word ptr [si+8]
		movzx	edx, word ptr [bx+8]
		sub	eax, edx
		imul	ecx
		add	eax, 0
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+8]
		mov	[di+8], ax
		movzx	eax, word ptr [si+0Ah]
		movzx	edx, word ptr [bx+0Ah]
		sub	eax, edx
		imul	ecx
		add	eax, 0
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+0Ah]
		mov	[di+0Ah], ax

loc_33E5C:
		movzx	eax, word ptr [si+0Ch]
		movzx	edx, word ptr [bx+0Ch]
		sub	eax, edx
		imul	ecx
		add	eax, 0
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+0Ch]
		mov	[di+0Ch], ax
		mov	byte ptr [di+20h], 1
		mov	byte ptr [di+21h], 1
		mov	word ptr [di+1Eh], 0
		mov	word ptr [di+1Ch], 0
		mov	word ptr [di+1Ah], 0
		add	di, 24h
		inc	word_77C10

loc_33E9D:
		add	[bp+var_574], 24h
		add	[bp+var_572], 2
		cmp	[bp+var_572], 6
		jl	loc_33C02
		mov	word_77C12, 0
		mov	ax, word_77C10
		mov	[bp+var_572], ax
		mov	eax, dword_77C26
		mov	dword_77C08, eax
		lea	si, [bp+var_32C]
		and	si, 0FFFCh
		mov	word_77C0C, si
		mov	bx, si
		add	bx, 24h
		mov	di, bx
		add	di, 24h
		mov	eax, [di+12h]
		mov	edx, [si+12h]
		cmp	eax, edx
		jge	short loc_33EEB
		mov	eax, edx

loc_33EEB:
		mov	edx, [bx+12h]
		cmp	eax, edx
		jge	short loc_33EF7
		mov	eax, edx

loc_33EF7:
		add	eax, 2EE00h
		mov	[bp+var_1C], eax
		lea	di, [bp+var_56C]
		and	di, 0FFFCh
		mov	word_77C0E, di
		mov	cx, [bp+var_572]

loc_33F11:
		mov	eax, [si+12h]
		cmp	eax, dword_77C08
		jg	short loc_33F2A
		add	si, 24h
		dec	cx
		jnz	short loc_33F11
		mov	si, word_77C0C
		jmp	loc_341EF
		nop

loc_33F2A:
		mov	si, word_77C0C

loc_33F2E:
		mov	dl, 0
		or	dl, [si+21h]
		jnz	short loc_33F43
		mov	eax, [si+12h]
		cmp	eax, dword_77C08
		jg	short loc_33F43
		or	dl, 1

loc_33F43:
		mov	dh, [bx+21h]
		shl	dh, 1
		or	dl, dh
		or	dh, dh
		jnz	short loc_33F5C
		mov	eax, [bx+12h]
		cmp	eax, dword_77C08
		jg	short loc_33F5C
		or	dl, 2

loc_33F5C:
		mov	al, dl
		cmp	al, 1
		jl	loc_3419F
		cmp	al, 2
		jz	loc_3407E
		jg	loc_3418B
		mov	eax, [si+12h]
		cmp	eax, dword_77C08
		jz	loc_3419F
		mov	eax, [si+12h]
		sub	eax, [bx+12h]
		mov	ecx, eax
		mov	eax, dword_77C08
		mov	[di+12h], eax
		sub	eax, [bx+12h]
		cdq
		shld	edx, eax, 10h
		shl	eax, 10h
		idiv	ecx
		mov	ecx, eax
		mov	eax, [si+0Eh]
		sub	eax, [bx+0Eh]
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [bx+0Eh]
		mov	[di+0Eh], eax
		mov	eax, [si+16h]
		sub	eax, [bx+16h]
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [bx+16h]
		mov	[di+16h], eax
		movzx	eax, word ptr [si+0Ch]
		movzx	edx, word ptr [bx+0Ch]
		sub	eax, edx
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+0Ch]
		mov	[di+0Ch], ax
		cmp	dword_77C04, 0
		jz	short loc_3405E
		movzx	eax, word ptr [si+8]
		movzx	edx, word ptr [bx+8]
		sub	eax, edx
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+8]
		mov	[di+8], ax
		movzx	eax, word ptr [si+0Ah]
		movzx	edx, word ptr [bx+0Ah]
		sub	eax, edx
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+0Ah]
		mov	[di+0Ah], ax

loc_3405E:
		mov	byte ptr [di+20h], 0
		mov	byte ptr [di+21h], 0
		mov	ax, [bx+1Ah]
		mov	[di+1Ch], ax
		mov	[di+1Ah], ax
		mov	word ptr [di+1Eh], 0
		add	di, 24h
		inc	word_77C12
		jmp	loc_3419F

loc_3407E:
		mov	eax, [bx+12h]
		cmp	eax, dword_77C08
		jz	loc_3418B
		mov	eax, [si+12h]
		sub	eax, [bx+12h]
		mov	ecx, eax
		mov	eax, dword_77C08
		mov	[di+12h], eax
		sub	eax, [bx+12h]
		cdq
		shld	edx, eax, 10h
		shl	eax, 10h
		idiv	ecx
		mov	ecx, eax
		mov	eax, [si+0Eh]
		sub	eax, [bx+0Eh]
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [bx+0Eh]
		mov	[di+0Eh], eax
		mov	eax, [si+16h]
		sub	eax, [bx+16h]
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [bx+16h]
		mov	[di+16h], eax
		movzx	eax, word ptr [si+0Ch]
		movzx	edx, word ptr [bx+0Ch]
		sub	eax, edx
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+0Ch]
		mov	[di+0Ch], ax
		cmp	dword_77C04, 0
		jz	short loc_3416E
		movzx	eax, word ptr [si+8]
		movzx	edx, word ptr [bx+8]
		sub	eax, edx
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+8]
		mov	[di+8], ax
		movzx	eax, word ptr [si+0Ah]
		movzx	edx, word ptr [bx+0Ah]
		sub	eax, edx
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+0Ah]
		mov	[di+0Ah], ax

loc_3416E:
		mov	byte ptr [di+20h], 0
		mov	byte ptr [di+21h], 0
		mov	ax, [si+1Eh]
		mov	[di+1Ch], ax
		mov	[di+1Eh], ax
		mov	word ptr [di+1Ah], 0
		add	di, 24h
		inc	word_77C12

loc_3418B:
		mov	dx, si
		mov	ax, ds
		mov	es, ax
		mov	si, bx
		mov	cx, 9
		rep movsd
		mov	si, dx
		inc	word_77C12

loc_3419F:
		add	si, 24h
		add	bx, 24h
		mov	ax, [bp+var_572]
		cmp	ax, 2
		jnz	short loc_341B2
		mov	bx, word_77C0C

loc_341B2:
		dec	[bp+var_572]
		jnz	loc_33F2E
		cmp	word_77C12, 2
		mov	[bp+var_57C], 1
		jle	loc_357AF
		mov	ax, word_77C0C
		xchg	word_77C0E, ax
		mov	word_77C0C, ax
		mov	ax, word_77C12
		mov	word_77C10, ax
		mov	[bp+var_572], ax
		mov	word_77C12, 0
		mov	si, word_77C0C
		mov	bx, si
		add	bx, 24h
		mov	di, word_77C0E

loc_341EF:
		mov	eax, dword_77C22
		mov	dword_77C08, eax
		mov	cx, [bp+var_572]

loc_341FB:
		mov	eax, [si+12h]
		cmp	eax, dword_77C08
		jl	short loc_34214
		add	si, 24h
		dec	cx
		jnz	short loc_341FB
		mov	si, word_77C0C
		jmp	loc_344C2
		nop

loc_34214:
		mov	si, word_77C0C

loc_34218:
		mov	dl, 0
		or	dl, [si+21h]
		jnz	short loc_3422D
		mov	eax, [si+12h]
		cmp	eax, dword_77C08
		jl	short loc_3422D
		or	dl, 1

loc_3422D:
		mov	dh, [bx+21h]
		shl	dh, 1
		or	dl, dh
		or	dh, dh
		jnz	short loc_34246
		mov	eax, [bx+12h]
		cmp	eax, dword_77C08
		jl	short loc_34246
		or	dl, 2

loc_34246:
		mov	al, dl
		cmp	al, 1
		jl	loc_34489
		cmp	al, 2
		jz	loc_34368
		jg	loc_34475
		mov	eax, [si+12h]
		cmp	eax, dword_77C08
		jz	loc_34489
		mov	eax, [si+12h]
		sub	eax, [bx+12h]
		mov	ecx, eax
		mov	eax, dword_77C08
		mov	[di+12h], eax
		sub	eax, [bx+12h]
		cdq
		shld	edx, eax, 10h
		shl	eax, 10h
		idiv	ecx
		mov	ecx, eax
		mov	eax, [si+0Eh]
		sub	eax, [bx+0Eh]
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [bx+0Eh]
		mov	[di+0Eh], eax
		mov	eax, [si+16h]
		sub	eax, [bx+16h]
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [bx+16h]
		mov	[di+16h], eax
		movzx	eax, word ptr [si+0Ch]
		movzx	edx, word ptr [bx+0Ch]
		sub	eax, edx
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+0Ch]
		mov	[di+0Ch], ax
		cmp	dword_77C04, 0
		jz	short loc_34348
		movzx	eax, word ptr [si+8]
		movzx	edx, word ptr [bx+8]
		sub	eax, edx
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+8]
		mov	[di+8], ax
		movzx	eax, word ptr [si+0Ah]
		movzx	edx, word ptr [bx+0Ah]
		sub	eax, edx
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+0Ah]
		mov	[di+0Ah], ax

loc_34348:
		mov	byte ptr [di+20h], 0
		mov	byte ptr [di+21h], 0
		mov	ax, [bx+1Ah]
		mov	[di+1Ch], ax
		mov	[di+1Ah], ax
		mov	word ptr [di+1Eh], 0
		add	di, 24h
		inc	word_77C12
		jmp	loc_34489

loc_34368:
		mov	eax, [bx+12h]
		cmp	eax, dword_77C08
		jz	loc_34475
		mov	eax, [si+12h]
		sub	eax, [bx+12h]
		mov	ecx, eax
		mov	eax, dword_77C08
		mov	[di+12h], eax
		sub	eax, [bx+12h]
		cdq
		shld	edx, eax, 10h
		shl	eax, 10h
		idiv	ecx
		mov	ecx, eax
		mov	eax, [si+0Eh]
		sub	eax, [bx+0Eh]
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [bx+0Eh]
		mov	[di+0Eh], eax
		mov	eax, [si+16h]
		sub	eax, [bx+16h]
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [bx+16h]
		mov	[di+16h], eax
		movzx	eax, word ptr [si+0Ch]
		movzx	edx, word ptr [bx+0Ch]
		sub	eax, edx
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+0Ch]
		mov	[di+0Ch], ax
		cmp	dword_77C04, 0
		jz	short loc_34458
		movzx	eax, word ptr [si+8]
		movzx	edx, word ptr [bx+8]
		sub	eax, edx
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+8]
		mov	[di+8], ax
		movzx	eax, word ptr [si+0Ah]
		movzx	edx, word ptr [bx+0Ah]
		sub	eax, edx
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+0Ah]
		mov	[di+0Ah], ax

loc_34458:
		mov	byte ptr [di+20h], 0
		mov	byte ptr [di+21h], 0
		mov	ax, [si+1Eh]
		mov	[di+1Ch], ax
		mov	[di+1Eh], ax
		mov	word ptr [di+1Ah], 0
		add	di, 24h
		inc	word_77C12

loc_34475:
		mov	dx, si
		mov	ax, ds
		mov	es, ax
		mov	si, bx
		mov	cx, 9
		rep movsd
		mov	si, dx
		inc	word_77C12

loc_34489:
		add	si, 24h
		add	bx, 24h
		mov	ax, [bp+var_572]
		cmp	ax, 2
		jnz	short loc_3449C
		mov	bx, word_77C0C

loc_3449C:
		dec	[bp+var_572]
		jnz	loc_34218
		cmp	word_77C12, 2
		mov	[bp+var_57C], 2
		jle	loc_357AF
		mov	ax, word_77C0C
		xchg	word_77C0E, ax
		mov	word_77C0C, ax
		mov	ax, word_77C12
		mov	word_77C10, ax

loc_344C2:
		mov	di, word_77C10
		mov	si, word_77C0C
		mov	bx, 0FFh

loc_344CD:
		cmp	byte ptr [si+20h], 1
		jz	short loc_34503
		mov	eax, [si+0Eh]
		imul	dword_7CA10
		idiv	dword ptr [si+12h]
		add	eax, [bp+var_14]
		mov	[si], eax
		mov	eax, [si+16h]
		imul	dword_7CA14
		idiv	dword ptr [si+12h]
		mov	edx, [bp+var_18]
		sub	edx, eax
		mov	[si+4], edx
		mov	byte ptr [si+20h], 1

loc_34503:
		xor	dx, dx
		mov	ecx, [bp+var_10]
		mov	eax, [bp+var_C]
		sub	ecx, [si+4]
		shld	edx, ecx, 1
		sub	eax, [si]
		shld	edx, eax, 1
		mov	ecx, [si+4]
		mov	eax, [si]
		sub	ecx, [bp+var_8]
		shld	edx, ecx, 1
		sub	eax, [bp+var_4]
		shld	edx, eax, 1
		and	bl, dl
		or	[bp+var_57A], dl
		add	si, 24h
		dec	di
		jnz	short loc_344CD
		or	bl, bl
		mov	[bp+var_57C], 3
		jnz	loc_357AF
		mov	ax, word_77C10
		mov	[bp+var_572], ax
		mov	word_77C12, 0
		mov	eax, [bp+var_8]
		mov	dword_77C08, eax
		mov	si, word_77C0C
		mov	bx, si
		add	bx, 24h
		mov	di, word_77C0E
		test	[bp+var_57A], 2
		jz	loc_34914

loc_34579:
		mov	dl, 0
		or	dl, [si+21h]
		jnz	short loc_3458E
		mov	eax, [si+4]
		cmp	eax, dword_77C08
		jl	short loc_3458E
		or	dl, 1

loc_3458E:
		mov	dh, [bx+21h]
		shl	dh, 1
		or	dl, dh
		or	dh, dh
		jnz	short loc_345A7
		mov	eax, [bx+4]
		cmp	eax, dword_77C08
		jl	short loc_345A7
		or	dl, 2

loc_345A7:
		mov	al, dl
		cmp	al, 1
		jl	loc_348C4
		cmp	al, 2
		jz	loc_34736
		jg	loc_348B0
		mov	eax, [si+4]
		cmp	eax, dword_77C08
		jz	loc_348C4
		mov	eax, [si+4]
		sub	eax, [bx+4]
		mov	ecx, eax
		mov	eax, dword_77C08
		mov	[di+4], eax
		sub	eax, [bx+4]
		cdq
		shld	edx, eax, 10h
		shl	eax, 10h
		idiv	ecx
		mov	ecx, eax
		mov	eax, [si]
		sub	eax, [bx]
		imul	ecx
		add	eax, 0
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [bx]
		mov	[di], eax
		mov	eax, [bx+12h]
		sub	eax, [si+12h]
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [si+12h]
		mov	edx, ecx
		mov	ecx, eax
		mov	eax, [bx+12h]
		imul	edx
		idiv	ecx
		mov	ecx, eax
		mov	eax, [si+12h]
		sub	eax, [bx+12h]
		imul	ecx
		add	eax, 0
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [bx+12h]
		mov	[di+12h], eax
		mov	eax, [si+0Eh]
		sub	eax, [bx+0Eh]
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [bx+0Eh]
		mov	[di+0Eh], eax
		mov	eax, [si+16h]
		sub	eax, [bx+16h]
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [bx+16h]
		mov	[di+16h], eax
		movzx	eax, word ptr [si+0Ch]
		movzx	edx, word ptr [bx+0Ch]
		sub	eax, edx
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+0Ch]
		mov	[di+0Ch], ax
		cmp	dword_77C04, 0
		jz	short loc_34716
		movzx	eax, word ptr [si+8]
		movzx	edx, word ptr [bx+8]
		sub	eax, edx
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+8]
		mov	[di+8], ax
		movzx	eax, word ptr [si+0Ah]
		movzx	edx, word ptr [bx+0Ah]
		sub	eax, edx
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+0Ah]
		mov	[di+0Ah], ax

loc_34716:
		mov	byte ptr [di+20h], 1
		mov	byte ptr [di+21h], 0
		mov	ax, [bx+1Ah]
		mov	[di+1Ch], ax
		mov	[di+1Ah], ax
		mov	word ptr [di+1Eh], 0
		add	di, 24h
		inc	word_77C12
		jmp	loc_348C4

loc_34736:
		mov	eax, [bx+4]
		cmp	eax, dword_77C08
		jz	loc_348B0
		mov	eax, [si+4]
		sub	eax, [bx+4]
		mov	ecx, eax
		mov	eax, dword_77C08
		mov	[di+4], eax
		sub	eax, [bx+4]
		cdq
		shld	edx, eax, 10h
		shl	eax, 10h
		idiv	ecx
		mov	ecx, eax
		mov	eax, [si]
		sub	eax, [bx]
		imul	ecx
		add	eax, 0
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [bx]
		mov	[di], eax
		mov	eax, [bx+12h]
		sub	eax, [si+12h]
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [si+12h]
		mov	edx, ecx
		mov	ecx, eax
		mov	eax, [bx+12h]
		imul	edx
		idiv	ecx
		mov	ecx, eax
		mov	eax, [si+12h]
		sub	eax, [bx+12h]
		imul	ecx
		add	eax, 0
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [bx+12h]
		mov	[di+12h], eax
		mov	eax, [si+0Eh]
		sub	eax, [bx+0Eh]
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [bx+0Eh]
		mov	[di+0Eh], eax
		mov	eax, [si+16h]
		sub	eax, [bx+16h]
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [bx+16h]
		mov	[di+16h], eax
		movzx	eax, word ptr [si+0Ch]
		movzx	edx, word ptr [bx+0Ch]
		sub	eax, edx
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+0Ch]
		mov	[di+0Ch], ax
		cmp	dword_77C04, 0
		jz	short loc_34893
		movzx	eax, word ptr [si+8]
		movzx	edx, word ptr [bx+8]
		sub	eax, edx
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+8]
		mov	[di+8], ax
		movzx	eax, word ptr [si+0Ah]
		movzx	edx, word ptr [bx+0Ah]
		sub	eax, edx
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+0Ah]
		mov	[di+0Ah], ax

loc_34893:
		mov	byte ptr [di+20h], 1
		mov	byte ptr [di+21h], 0
		mov	ax, [si+1Eh]
		mov	[di+1Ch], ax
		mov	[di+1Eh], ax
		mov	word ptr [di+1Ah], 0
		add	di, 24h
		inc	word_77C12

loc_348B0:
		mov	dx, si
		mov	ax, ds
		mov	es, ax
		mov	si, bx
		mov	cx, 9
		rep movsd
		mov	si, dx
		inc	word_77C12

loc_348C4:
		add	si, 24h
		add	bx, 24h
		mov	ax, [bp+var_572]
		cmp	ax, 2
		jnz	short loc_348D7
		mov	bx, word_77C0C

loc_348D7:
		dec	[bp+var_572]
		jnz	loc_34579
		cmp	word_77C12, 2
		mov	[bp+var_57C], 4
		jle	loc_357AF
		mov	ax, word_77C0C
		xchg	word_77C0E, ax
		mov	word_77C0C, ax
		mov	ax, word_77C12
		mov	word_77C10, ax
		mov	[bp+var_572], ax
		mov	word_77C12, 0
		mov	si, word_77C0C
		mov	bx, si
		add	bx, 24h
		mov	di, word_77C0E

loc_34914:
		mov	eax, [bp+var_10]
		mov	dword_77C08, eax
		test	[bp+var_57A], 8
		jz	loc_34CC8

loc_34925:
		mov	dl, 0
		or	dl, [si+21h]
		jnz	short loc_3493A
		mov	eax, [si+4]
		cmp	eax, dword_77C08
		jg	short loc_3493A
		or	dl, 1

loc_3493A:
		mov	dh, [bx+21h]
		shl	dh, 1
		or	dl, dh
		or	dh, dh
		jnz	short loc_34953
		mov	eax, [bx+4]
		cmp	eax, dword_77C08
		jg	short loc_34953
		or	dl, 2

loc_34953:
		mov	al, dl
		cmp	al, 1
		jl	loc_34C70
		cmp	al, 2
		jz	loc_34AE2
		jg	loc_34C5C
		mov	eax, [si+4]
		cmp	eax, dword_77C08
		jz	loc_34C70
		mov	eax, [si+4]
		sub	eax, [bx+4]
		mov	ecx, eax
		mov	eax, dword_77C08
		mov	[di+4], eax
		sub	eax, [bx+4]
		cdq
		shld	edx, eax, 10h
		shl	eax, 10h
		idiv	ecx
		mov	ecx, eax
		mov	eax, [si]
		sub	eax, [bx]
		imul	ecx
		add	eax, 0
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [bx]
		mov	[di], eax
		mov	eax, [bx+12h]
		sub	eax, [si+12h]
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [si+12h]
		mov	edx, ecx
		mov	ecx, eax
		mov	eax, [bx+12h]
		imul	edx
		idiv	ecx
		mov	ecx, eax
		mov	eax, [si+12h]
		sub	eax, [bx+12h]
		imul	ecx
		add	eax, 0
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [bx+12h]
		mov	[di+12h], eax
		mov	eax, [si+0Eh]
		sub	eax, [bx+0Eh]
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [bx+0Eh]
		mov	[di+0Eh], eax
		mov	eax, [si+16h]
		sub	eax, [bx+16h]
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [bx+16h]
		mov	[di+16h], eax
		movzx	eax, word ptr [si+0Ch]
		movzx	edx, word ptr [bx+0Ch]
		sub	eax, edx
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+0Ch]
		mov	[di+0Ch], ax
		cmp	dword_77C04, 0
		jz	short loc_34AC2
		movzx	eax, word ptr [si+8]
		movzx	edx, word ptr [bx+8]
		sub	eax, edx
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+8]
		mov	[di+8], ax
		movzx	eax, word ptr [si+0Ah]
		movzx	edx, word ptr [bx+0Ah]
		sub	eax, edx
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+0Ah]
		mov	[di+0Ah], ax

loc_34AC2:
		mov	byte ptr [di+20h], 1
		mov	byte ptr [di+21h], 0
		mov	ax, [bx+1Ah]
		mov	[di+1Ch], ax
		mov	[di+1Ah], ax
		mov	word ptr [di+1Eh], 0
		add	di, 24h
		inc	word_77C12
		jmp	loc_34C70

loc_34AE2:
		mov	eax, [bx+4]
		cmp	eax, dword_77C08
		jz	loc_34C5C
		mov	eax, [si+4]
		sub	eax, [bx+4]
		mov	ecx, eax
		mov	eax, dword_77C08
		mov	[di+4], eax
		sub	eax, [bx+4]
		cdq
		shld	edx, eax, 10h
		shl	eax, 10h
		idiv	ecx
		mov	ecx, eax
		mov	eax, [si]
		sub	eax, [bx]
		imul	ecx
		add	eax, 0
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [bx]
		mov	[di], eax
		mov	eax, [bx+12h]
		sub	eax, [si+12h]
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [si+12h]
		mov	edx, ecx
		mov	ecx, eax
		mov	eax, [bx+12h]
		imul	edx
		idiv	ecx
		mov	ecx, eax
		mov	eax, [si+12h]
		sub	eax, [bx+12h]
		imul	ecx
		add	eax, 0
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [bx+12h]
		mov	[di+12h], eax
		mov	eax, [si+0Eh]
		sub	eax, [bx+0Eh]
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [bx+0Eh]
		mov	[di+0Eh], eax
		mov	eax, [si+16h]
		sub	eax, [bx+16h]
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [bx+16h]
		mov	[di+16h], eax
		movzx	eax, word ptr [si+0Ch]
		movzx	edx, word ptr [bx+0Ch]
		sub	eax, edx
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+0Ch]
		mov	[di+0Ch], ax
		cmp	dword_77C04, 0
		jz	short loc_34C3F
		movzx	eax, word ptr [si+8]
		movzx	edx, word ptr [bx+8]
		sub	eax, edx
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+8]
		mov	[di+8], ax
		movzx	eax, word ptr [si+0Ah]
		movzx	edx, word ptr [bx+0Ah]
		sub	eax, edx
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+0Ah]
		mov	[di+0Ah], ax

loc_34C3F:
		mov	byte ptr [di+20h], 1
		mov	byte ptr [di+21h], 0
		mov	ax, [si+1Eh]
		mov	[di+1Ch], ax
		mov	[di+1Eh], ax
		mov	word ptr [di+1Ah], 0
		add	di, 24h
		inc	word_77C12

loc_34C5C:
		mov	dx, si
		mov	ax, ds
		mov	es, ax
		mov	si, bx
		mov	cx, 9
		rep movsd
		mov	si, dx
		inc	word_77C12

loc_34C70:
		add	si, 24h
		add	bx, 24h
		mov	ax, [bp+var_572]
		cmp	ax, 2
		jnz	short loc_34C83
		mov	bx, word_77C0C

loc_34C83:
		dec	[bp+var_572]
		jnz	loc_34925
		cmp	word_77C12, 2
		mov	[bp+var_57C], 5
		jle	loc_357AF
		mov	ax, word_77C0C
		xchg	word_77C0E, ax
		mov	word_77C0C, ax
		mov	ax, word_77C12
		mov	word_77C10, ax
		mov	[bp+var_572], ax
		mov	word_77C12, 0
		mov	eax, [bp+var_4]
		mov	dword_77C08, eax
		mov	si, word_77C0C
		mov	bx, si
		add	bx, 24h
		mov	di, word_77C0E

loc_34CC8:
		mov	eax, [bp+var_4]
		mov	dword_77C08, eax
		test	[bp+var_57A], 1
		jz	loc_35072

loc_34CD9:
		mov	dl, 0
		or	dl, [si+21h]
		jnz	short loc_34CED
		mov	eax, [si]
		cmp	eax, dword_77C08
		jl	short loc_34CED
		or	dl, 1

loc_34CED:
		mov	dh, [bx+21h]
		shl	dh, 1
		or	dl, dh
		or	dh, dh
		jnz	short loc_34D05
		mov	eax, [bx]
		cmp	eax, dword_77C08
		jl	short loc_34D05
		or	dl, 2

loc_34D05:
		mov	al, dl
		cmp	al, 1
		jl	loc_3501A
		cmp	al, 2
		jz	loc_34E90
		jg	loc_35006
		mov	eax, [si]
		cmp	eax, dword_77C08
		jz	loc_3501A
		mov	ecx, [si]
		sub	ecx, [bx]
		mov	eax, dword_77C08
		mov	[di], eax
		sub	eax, [bx]
		cdq
		shld	edx, eax, 10h
		shl	eax, 10h
		idiv	ecx
		mov	ecx, eax
		mov	eax, [si+4]
		sub	eax, [bx+4]
		imul	ecx
		add	eax, 0
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [bx+4]
		mov	[di+4], eax
		mov	eax, [bx+12h]
		sub	eax, [si+12h]
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [si+12h]
		mov	edx, ecx
		mov	ecx, eax
		mov	eax, [bx+12h]
		imul	edx
		idiv	ecx
		mov	ecx, eax
		mov	eax, [si+12h]
		sub	eax, [bx+12h]
		imul	ecx
		add	eax, 0
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [bx+12h]
		mov	[di+12h], eax
		mov	eax, [si+0Eh]
		sub	eax, [bx+0Eh]
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [bx+0Eh]
		mov	[di+0Eh], eax
		mov	eax, [si+16h]
		sub	eax, [bx+16h]
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [bx+16h]
		mov	[di+16h], eax
		movzx	eax, word ptr [si+0Ch]
		movzx	edx, word ptr [bx+0Ch]
		sub	eax, edx
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+0Ch]
		mov	[di+0Ch], ax
		cmp	dword_77C04, 0
		jz	short loc_34E70
		movzx	eax, word ptr [si+8]
		movzx	edx, word ptr [bx+8]
		sub	eax, edx
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+8]
		mov	[di+8], ax
		movzx	eax, word ptr [si+0Ah]
		movzx	edx, word ptr [bx+0Ah]
		sub	eax, edx
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+0Ah]
		mov	[di+0Ah], ax

loc_34E70:
		mov	byte ptr [di+20h], 1
		mov	byte ptr [di+21h], 0
		mov	ax, [bx+1Ah]
		mov	[di+1Ch], ax
		mov	[di+1Ah], ax
		mov	word ptr [di+1Eh], 0
		add	di, 24h
		inc	word_77C12
		jmp	loc_3501A

loc_34E90:
		mov	eax, [bx]
		cmp	eax, dword_77C08
		jz	loc_35006
		mov	ecx, [si]
		sub	ecx, [bx]
		mov	eax, dword_77C08
		mov	[di], eax
		sub	eax, [bx]
		cdq
		shld	edx, eax, 10h
		shl	eax, 10h
		idiv	ecx
		mov	ecx, eax
		mov	eax, [si+4]
		sub	eax, [bx+4]
		imul	ecx
		add	eax, 0
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [bx+4]
		mov	[di+4], eax
		mov	eax, [bx+12h]
		sub	eax, [si+12h]
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [si+12h]
		mov	edx, ecx
		mov	ecx, eax
		mov	eax, [bx+12h]
		imul	edx
		idiv	ecx
		mov	ecx, eax
		mov	eax, [si+12h]
		sub	eax, [bx+12h]
		imul	ecx
		add	eax, 0
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [bx+12h]
		mov	[di+12h], eax
		mov	eax, [si+0Eh]
		sub	eax, [bx+0Eh]
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [bx+0Eh]
		mov	[di+0Eh], eax
		mov	eax, [si+16h]
		sub	eax, [bx+16h]
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [bx+16h]
		mov	[di+16h], eax
		movzx	eax, word ptr [si+0Ch]
		movzx	edx, word ptr [bx+0Ch]
		sub	eax, edx
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+0Ch]
		mov	[di+0Ch], ax
		cmp	dword_77C04, 0
		jz	short loc_34FE9
		movzx	eax, word ptr [si+8]
		movzx	edx, word ptr [bx+8]
		sub	eax, edx
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+8]
		mov	[di+8], ax
		movzx	eax, word ptr [si+0Ah]
		movzx	edx, word ptr [bx+0Ah]
		sub	eax, edx
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+0Ah]
		mov	[di+0Ah], ax

loc_34FE9:
		mov	byte ptr [di+20h], 1
		mov	byte ptr [di+21h], 0
		mov	ax, [si+1Eh]
		mov	[di+1Ch], ax
		mov	[di+1Eh], ax
		mov	word ptr [di+1Ah], 0
		add	di, 24h
		inc	word_77C12

loc_35006:
		mov	dx, si
		mov	ax, ds
		mov	es, ax
		mov	si, bx
		mov	cx, 9
		rep movsd
		mov	si, dx
		inc	word_77C12

loc_3501A:
		add	si, 24h
		add	bx, 24h
		mov	ax, [bp+var_572]
		cmp	ax, 2
		jnz	short loc_3502D
		mov	bx, word_77C0C

loc_3502D:
		dec	[bp+var_572]
		jnz	loc_34CD9
		cmp	word_77C12, 2
		mov	[bp+var_57C], 6
		jle	loc_357AF
		mov	ax, word_77C0C
		xchg	word_77C0E, ax
		mov	word_77C0C, ax
		mov	ax, word_77C12
		mov	word_77C10, ax
		mov	[bp+var_572], ax
		mov	word_77C12, 0
		mov	eax, [bp+var_C]
		mov	dword_77C08, eax
		mov	si, word_77C0C
		mov	bx, si
		add	bx, 24h
		mov	di, word_77C0E

loc_35072:
		mov	eax, [bp+var_C]
		mov	dword_77C08, eax
		test	[bp+var_57A], 4
		jz	loc_35401

loc_35083:
		mov	dl, 0
		or	dl, [si+21h]
		jnz	short loc_35097
		mov	eax, [si]
		cmp	eax, dword_77C08
		jg	short loc_35097
		or	dl, 1

loc_35097:
		mov	dh, [bx+21h]
		shl	dh, 1
		or	dl, dh
		or	dh, dh
		jnz	short loc_350AF
		mov	eax, [bx]
		cmp	eax, dword_77C08
		jg	short loc_350AF
		or	dl, 2

loc_350AF:
		mov	al, dl
		cmp	al, 1
		jl	loc_353C4
		cmp	al, 2
		jz	loc_3523A
		jg	loc_353B0
		mov	eax, [si]
		cmp	eax, dword_77C08
		jz	loc_353C4
		mov	ecx, [si]
		sub	ecx, [bx]
		mov	eax, dword_77C08
		mov	[di], eax
		sub	eax, [bx]
		cdq
		shld	edx, eax, 10h
		shl	eax, 10h
		idiv	ecx
		mov	ecx, eax
		mov	eax, [si+4]
		sub	eax, [bx+4]
		imul	ecx
		add	eax, 0
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [bx+4]
		mov	[di+4], eax
		mov	eax, [bx+12h]
		sub	eax, [si+12h]
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [si+12h]
		mov	edx, ecx
		mov	ecx, eax
		mov	eax, [bx+12h]
		imul	edx
		idiv	ecx
		mov	ecx, eax
		mov	eax, [si+12h]
		sub	eax, [bx+12h]
		imul	ecx
		add	eax, 0
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [bx+12h]
		mov	[di+12h], eax
		mov	eax, [si+0Eh]
		sub	eax, [bx+0Eh]
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [bx+0Eh]
		mov	[di+0Eh], eax
		mov	eax, [si+16h]
		sub	eax, [bx+16h]
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [bx+16h]
		mov	[di+16h], eax
		movzx	eax, word ptr [si+0Ch]
		movzx	edx, word ptr [bx+0Ch]
		sub	eax, edx
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+0Ch]
		mov	[di+0Ch], ax
		cmp	dword_77C04, 0
		jz	short loc_3521A
		movzx	eax, word ptr [si+8]
		movzx	edx, word ptr [bx+8]
		sub	eax, edx
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+8]
		mov	[di+8], ax
		movzx	eax, word ptr [si+0Ah]
		movzx	edx, word ptr [bx+0Ah]
		sub	eax, edx
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+0Ah]
		mov	[di+0Ah], ax

loc_3521A:
		mov	byte ptr [di+20h], 1
		mov	byte ptr [di+21h], 0
		mov	ax, [bx+1Ah]
		mov	[di+1Ch], ax
		mov	[di+1Ah], ax
		mov	word ptr [di+1Eh], 0
		add	di, 24h
		inc	word_77C12
		jmp	loc_353C4

loc_3523A:
		mov	eax, [bx]
		cmp	eax, dword_77C08
		jz	loc_353B0
		mov	ecx, [si]
		sub	ecx, [bx]
		mov	eax, dword_77C08
		mov	[di], eax
		sub	eax, [bx]
		cdq
		shld	edx, eax, 10h
		shl	eax, 10h
		idiv	ecx
		mov	ecx, eax
		mov	eax, [si+4]
		sub	eax, [bx+4]
		imul	ecx
		add	eax, 0
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [bx+4]
		mov	[di+4], eax
		mov	eax, [bx+12h]
		sub	eax, [si+12h]
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [si+12h]
		mov	edx, ecx
		mov	ecx, eax
		mov	eax, [bx+12h]
		imul	edx
		idiv	ecx
		mov	ecx, eax
		mov	eax, [si+12h]
		sub	eax, [bx+12h]
		imul	ecx
		add	eax, 0
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [bx+12h]
		mov	[di+12h], eax
		mov	eax, [si+0Eh]
		sub	eax, [bx+0Eh]
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [bx+0Eh]
		mov	[di+0Eh], eax
		mov	eax, [si+16h]
		sub	eax, [bx+16h]
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	eax, [bx+16h]
		mov	[di+16h], eax
		movzx	eax, word ptr [si+0Ch]
		movzx	edx, word ptr [bx+0Ch]
		sub	eax, edx
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+0Ch]
		mov	[di+0Ch], ax
		cmp	dword_77C04, 0
		jz	short loc_35393
		movzx	eax, word ptr [si+8]
		movzx	edx, word ptr [bx+8]
		sub	eax, edx
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+8]
		mov	[di+8], ax
		movzx	eax, word ptr [si+0Ah]
		movzx	edx, word ptr [bx+0Ah]
		sub	eax, edx
		imul	ecx
		add	eax, 8000h
		adc	edx, 0
		shrd	eax, edx, 10h
		add	ax, [bx+0Ah]
		mov	[di+0Ah], ax

loc_35393:
		mov	byte ptr [di+20h], 1
		mov	byte ptr [di+21h], 0
		mov	ax, [si+1Eh]
		mov	[di+1Ch], ax
		mov	[di+1Eh], ax
		mov	word ptr [di+1Ah], 0
		add	di, 24h
		inc	word_77C12

loc_353B0:
		mov	dx, si
		mov	ax, ds
		mov	es, ax
		mov	si, bx
		mov	cx, 9
		rep movsd
		mov	si, dx
		inc	word_77C12

loc_353C4:
		add	si, 24h
		add	bx, 24h
		mov	ax, [bp+var_572]
		cmp	ax, 2
		jnz	short loc_353D7
		mov	bx, word_77C0C

loc_353D7:
		dec	[bp+var_572]
		jnz	loc_35083
		cmp	word_77C12, 2
		mov	[bp+var_57C], 7
		jle	loc_357AF
		mov	ax, word_77C12
		xchg	word_77C10, ax
		mov	word_77C12, ax
		mov	ax, word_77C0C
		xchg	word_77C0E, ax
		mov	word_77C0C, ax

loc_35401:
		mov	cx, word_77C10
		mov	si, word_77C0C

loc_35409:
		mov	di, [si+1Ch]
		or	di, di
		jz	short loc_3544D
		test	byte ptr gs:[di+10h], 40h
		jnz	short loc_3544D
		or	byte ptr gs:[di+10h], 40h
		mov	eax, [si]
		sar	eax, 8
		mov	gs:[di+0Ch], ax
		mov	eax, [si+4]
		sar	eax, 8
		mov	gs:[di+0Eh], ax
		mov	eax, [si+0Eh]
		mov	ebx, [si+12h]
		mov	gs:[di], eax
		mov	gs:[di+4], ebx
		mov	eax, [si+16h]
		mov	gs:[di+8], eax

loc_3544D:
		add	si, 24h
		loop	short loc_35409
		lea	ax, word ptr [bp+var_7C]
		mov	dx, word_77C0C
		push	di
		push	si
		push	cx
		push	es
		push	dx
		push	ax
		pop	di
		pop	si
		mov	cx, ds
		mov	es, cx
		mov	cx, 9
		rep movsd
		pop	es
		pop	cx
		pop	si
		pop	di
		push	0
		push	large [bp+var_6A]
		mov	ax, [bp+var_70]
		shr	ax, 8
		push	ax
		mov	al, byte_77C14
		xor	ah, ah
		push	ax
		push	64DEh
		call	sub_2E656
		add	sp, 0Ch
		xchg	ah, al
		xor	al, al
		mov	[bp+var_70], ax
		mov	si, word_77C0C
		add	si, 24h
		push	0
		push	large [si+12h]
		mov	ax, [si+0Ch]
		shr	ax, 8
		push	ax
		mov	al, byte_77C14
		xor	ah, ah
		push	ax
		push	64DEh
		call	sub_2E656
		add	sp, 0Ch
		xchg	ah, al
		xor	al, al
		mov	[si+0Ch], ax
		mov	ax, word_77C10
		sub	ax, 2
		mov	[bp+var_572], ax
		les	di, word_77C16
		mov	bx, si
		add	bx, 24h

loc_354D3:
		push	bx
		push	es
		push	0
		push	large [bx+12h]
		mov	ax, [bx+0Ch]
		shr	ax, 8
		push	ax
		mov	al, byte_77C14
		xor	ah, ah
		push	ax
		push	64DEh
		call	sub_2E656
		add	sp, 0Ch
		pop	es
		pop	bx
		xchg	ah, al
		xor	al, al
		mov	[bx+0Ch], ax
		mov	ecx, [bx+4]
		sub	ecx, [si+4]
		mov	eax, [si]
		sub	eax, [bp+var_7C]
		imul	ecx
		add	eax, 80h
		adc	edx, 0
		shrd	eax, edx, 8
		mov	ecx, eax
		mov	edx, [bx]
		sub	edx, [si]
		mov	eax, [si+4]
		sub	eax, [bp+var_78]
		imul	edx
		add	eax, 80h
		adc	edx, 0
		shrd	eax, edx, 8
		sub	ecx, eax
		mov	[bp+var_57C], 8
		js	loc_35799
		mov	eax, [bp+var_1C]
		mov	es:[di+2], eax
		mov	eax, 3
		mov	es:[di+14h], eax
		mov	eax, [bp+var_7C]
		sar	eax, 8
		mov	es:[di+18h], eax
		mov	eax, [bp+var_78]
		sar	eax, 8
		mov	es:[di+1Ch], eax
		mov	eax, [si]
		sar	eax, 8
		mov	es:[di+30h], eax
		mov	eax, [si+4]
		sar	eax, 8
		mov	es:[di+34h], eax
		mov	eax, [bx]
		sar	eax, 8
		mov	es:[di+48h], eax
		mov	eax, [bx+4]
		sar	eax, 8
		mov	es:[di+4Ch], eax
		cmp	byte_77C2F, 1
		jz	short loc_355E0
		nop
		nop
		xor	dx, dx
		mov	ax, [bp+var_70]
		add	ax, [si+0Ch]
		adc	dx, 0
		add	ax, [bx+0Ch]
		adc	dx, 0
		mov	cx, 3
		div	cx
		shl	eax, 8
		mov	es:[di+20h], eax
		mov	es:[di+38h], eax
		mov	es:[di+50h], eax
		jmp	short loc_3560A

loc_355E0:
		movzx	eax, [bp+var_70]
		shl	eax, 8
		mov	es:[di+20h], eax
		movzx	eax, word ptr [si+0Ch]
		shl	eax, 8
		mov	es:[di+38h], eax
		movzx	eax, word ptr [bx+0Ch]
		shl	eax, 8
		mov	es:[di+50h], eax

loc_3560A:
		push	ebx
		push	es
		mov	bx, 1
		push	bx
		mov	ax, di
		add	ax, 18h
		push	es
		push	ax
		push	ss
		pop	ds
		call	sub_634A4
		add	sp, 6
		pop	es
		pop	ebx
		mov	es:[di+8], ax
		mov	es:[di+0Ah], dx
		mov	ax, 6
		mov	es:[di+6], ax
		mov	dx, 60h
		mov	ecx, dword_77C04
		cmp	ecx, 0
		jz	loc_35725
		pushal
		push	gs
		push	fs
		push	es
		push	ds
		push	es
		push	di
		push	large dword_77C04
		push	ss
		pop	ds
		call	sub_32638
		add	sp, 4
		push	ax
		push	dx
		mov	si, [bp+arg_0]
		push	0
		mov	al, [si+1Dh]
		push	ax
		push	large [si+19h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		pop	dx
		pop	ax
		pop	di
		pop	es
		mov	es:[di+10h], ax
		mov	es:[di+12h], dx
		pop	ds
		pop	es
		pop	fs
		pop	gs
		popal
		movzx	eax, [bp+var_74]
		shl	eax, 8
		mov	es:[di+24h], eax
		movzx	eax, [bp+var_72]
		shl	eax, 8
		mov	es:[di+28h], eax
		movzx	eax, word ptr [si+8]
		shl	eax, 8
		mov	es:[di+3Ch], eax
		movzx	eax, word ptr [si+0Ah]
		shl	eax, 8
		mov	es:[di+40h], eax
		movzx	eax, word ptr [bx+8]
		shl	eax, 8
		mov	es:[di+54h], eax
		movzx	eax, word ptr [bx+0Ah]
		shl	eax, 8
		mov	es:[di+58h], eax
		mov	eax, [bp+var_6A]
		mov	edx, [si+12h]
		cmp	eax, edx
		jl	short loc_356F1
		nop
		nop
		mov	eax, edx

loc_356F1:
		mov	edx, [bx+12h]
		cmp	eax, edx
		jl	short loc_356FF
		nop
		nop
		mov	eax, edx

loc_356FF:
		mov	eax, 0
		mov	es:[di+0Ch], eax
		mov	ax, 9
		mov	es:[di+6], ax
		mov	dx, 60h
		cmp	[bp+var_578], 0
		jz	short loc_35725
		mov	ax, 9
		mov	es:[di+6], ax
		mov	dx, 60h

loc_35725:
		mov	cx, word_7CBC8
		cmp	cx, word_7CBC6
		jge	short loc_3578A
		nop
		nop
		shl	cx, 2
		mov	ax, es
		shl	eax, 10h
		mov	ax, di
		lfs	di, word_7CBCA
		add	di, cx
		push	eax
		push	edx
		push	ecx
		push	ebx
		push	esi
		push	edi
		push	ds
		push	es
		push	fs
		push	gs
		mov	bx, 1
		push	bx
		push	eax
		push	ss
		pop	ds
		call	sub_634A4
		add	sp, 6
		pop	gs
		pop	fs
		pop	es
		pop	ds
		pop	edi
		pop	esi
		pop	ebx
		pop	ecx
		mov	fs:[di], ax
		mov	fs:[di+2], dx
		pop	edx
		pop	eax
		mov	di, ax
		inc	word_7CBC8
		add	dword_7CBDE, 4

loc_3578A:
		add	di, dx
		cmp	di, word_77C1E
		mov	[bp+var_57C], 9
		jnb	short loc_357AB
		nop
		nop

loc_35799:
		mov	si, bx
		add	bx, 24h
		dec	[bp+var_572]
		jnz	loc_354D3
		mov	[bp+var_57C], 0

loc_357AB:
		mov	word_77C16, di

loc_357AF:
		mov	di, [bp+var_576]

loc_357B3:
		and	byte ptr gs:[di+15h], 0C0h

loc_357B8:
		add	di, 16h
		dec	[bp+var_56]
sub_3362C		endp

; START OF FUNCTION CHUNK FOR sub_3362C
		db 0Fh, 85h
; END OF FUNCTION CHUNK FOR sub_3362C
seg083		ends
