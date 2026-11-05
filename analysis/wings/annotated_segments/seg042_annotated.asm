seg042		segment	para public 'CODE' use16
		assume cs:seg042
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 57h, 9Ah, 55h, 2, 83h, 54h, 83h, 0C4h, 8, 5Fh, 5Eh, 0C9h, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1EE2D		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= byte ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_1EE46
		push	21h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_1EE74

loc_1EE46:
		push	[bp+arg_6]
		mov	al, [bp+arg_4]
		push	ax
		push	[bp+arg_2]
		push	si
		call	LayerGroup_Construct_45C22
		add	sp, 8
		mov	word ptr [si], 1FD4h
		mov	word ptr [si+0Ah], 1FF4h
		mov	byte ptr [si+1Fh], 0
		mov	byte ptr [si+20h], 0
		call	Keyboard_DrainBufferBIOS_578C9
		call	sub_1F377

loc_1EE74:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_1EE2D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1EE79		proc far

var_6		= word ptr -6
var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		mov	si, [bp+arg_0]
		push	1
		call	sub_1F7CA
		pop	cx
		mov	[bp+var_1], 0
		push	2
		lea	ax, [bp+var_6]
		push	ax
		call	sub_55996
		add	sp, 4
		cmp	byte ptr [bp+var_6], 0
		jnz	short loc_1EEA9
		cmp	[bp+arg_2], 0
		jz	short loc_1EECB

loc_1EEA9:
		cmp	byte ptr [bp+var_6+1], 1
		jnz	short loc_1EEBC
		mov	byte_603DE, 1
		mov	byte ptr [si+1Fh], 1
		mov	al, 0
		jmp	short loc_1EECE

loc_1EEBC:
		cmp	byte ptr [bp+var_6+1], 39h
		jnz	short loc_1EEC6
		mov	[bp+var_1], 1

loc_1EEC6:
		call	Keyboard_DrainBufferBIOS_578C9

loc_1EECB:
		mov	al, [bp+var_1]

loc_1EECE:
		pop	si
		leave
		retf
sub_1EE79		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1EED1		proc far

var_8		= dword ptr -8
var_3		= byte ptr -3
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		mov	[bp+var_3], 0
		cmp	byte_603DE, 0
		jz	short loc_1EEEF
		mov	byte ptr [si+1Fh], 1

loc_1EEEF:
		cmp	byte ptr [si+1Fh], 0
		jz	short loc_1EEFE
		push	si
		mov	bx, [si]
		call	dword ptr [bx+1Ch]
		jmp	loc_1EF85

loc_1EEFE:
		movzx	eax, word ptr [si+10h]
		mov	[bp+var_8], eax
		mov	[si+19h], eax
		mov	eax, dword_5E7D3
		mov	[si+15h], eax
		cmp	byte ptr [si+12h], 0FFh
		jz	short loc_1EF42
		mov	al, [si+12h]
		push	ax
		push	word_5DD42
		call	TextFormat_ReleaseAttribute_47B53
		add	sp, 4
		jmp	short loc_1EF42

loc_1EF2B:
		push	word ptr [si+0Eh]
		push	word ptr [si+0Ch]
		mov	bx, [bp+var_2]
		push	word ptr [bx+6]
		mov	bx, [bx+6]
		mov	bx, [bx]
		call	dword ptr [bx+10h]
		add	sp, 6

loc_1EF42:
		lea	ax, [bp+var_2]
		push	ax
		mov	ax, si
		add	ax, 4
		push	ax
		call	LinkedList_Helper_48578
		add	sp, 4
		or	ax, ax
		jnz	short loc_1EF2B
		push	word_5DD42
		push	word ptr [si+13h]
		call	UI_ApplyEncodingHelper_47B38
		add	sp, 4
		push	si
		mov	bx, [si]
		call	dword ptr [bx+1Ch]
		pop	cx
		mov	al, [bp+var_3]
		push	ax
		push	si
		push	cs
		call	near ptr sub_1EE79
		add	sp, 4
		mov	ax, si
		add	ax, 15h
		push	ax
		call	Stopwatch_WaitElapsed_5637A

loc_1EF85:
		pop	cx
		pop	si
		leave
		retf
sub_1EED1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1EF89		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_1EFB9
		mov	word ptr [si], 1FD4h
		mov	word ptr [si+0Ah], 1FF4h
		push	0
		push	si
		call	Scene_Destruct_45CB8
		add	sp, 4
		test	di, 1
		jz	short loc_1EFB9
		push	si
		call	sub_33B
		pop	cx

loc_1EFB9:
		pop	di
		pop	si
		pop	bp
		retf
sub_1EF89		endp

; ----------------------------------------------------------------------

sub_1EFBD		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	sub_45CFB
sub_1EFBD		endp

; ----------------------------------------------------------------------

sub_1EFC9		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	Layer_MoveBy_45D1D
sub_1EFC9		endp

; ----------------------------------------------------------------------

sub_1EFD5		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
sub_1EFD5		endp

; START OF FUNCTION CHUNK FOR sub_1EFD5
		db 0EAh
		jnb	short loc_1EFE2
		cbw
; END OF FUNCTION CHUNK FOR sub_1EFD5
seg042		ends
