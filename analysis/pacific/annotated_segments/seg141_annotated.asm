seg141		segment	para public 'CODE' use16
		assume cs:seg141
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 8, 3Bh, 66h

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5FF23		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= byte ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_8]
		or	si, si
		jnz	short loc_5FF46
		push	44h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jnz	short loc_5FF46
		jmp	loc_5FFEA

loc_5FF46:
		push	[bp+arg_6]
		mov	al, [bp+arg_4]
		push	ax
		push	[bp+arg_2]
		push	si
		call	LayerGroup_Construct_66650
		add	sp, 8
		mov	word ptr [si], 3964h
		mov	word ptr [si+0Ah], 3984h
		mov	word ptr [si+1Fh], 0
		mov	word ptr [si+21h], 0
		mov	byte ptr [si+2Ch], 0
		push	100h
		push	0
		mov	ax, si
		add	ax, 39h
		push	ax
		call	sub_76245
		add	sp, 6
		mov	word ptr [si+3Eh], 909h
		xor	ax, ax
		mov	[si+42h], ax
		mov	[si+40h], ax
		mov	word ptr [si+3Eh], 3960h
		mov	word ptr [si+23h], 0
		mov	word ptr [si+25h], 0
		mov	word ptr [si+27h], 13Fh
		mov	word ptr [si+29h], 0C7h
		push	0
		mov	ax, si
		add	ax, 1Fh
		push	ax
		call	TextRenderer_ApplyFormatChange_67CBE
		add	sp, 4
		push	di
		mov	ax, si
		add	ax, 1Fh
		push	ax
		push	0
		call	sub_75D04
		add	sp, 6
		mov	[si+2Dh], ax
		mov	[bp+var_2], di
		mov	bx, [si+2Dh]
		mov	ax, [bp+var_2]
		mov	[bx+14h], ax
		mov	word ptr [si+37h], 0
		mov	byte ptr [si+30h], 0
		mov	byte ptr [si+31h], 0
		mov	byte ptr [si+32h], 0FFh

loc_5FFEA:
		mov	ax, si
		pop	di
		pop	si
		leave
		retf
sub_5FF23		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5FFF0		proc far

var_E		= word ptr -0Eh
var_B		= byte ptr -0Bh
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= byte ptr  10h
arg_C		= word ptr  12h

		push	bp
		mov	bp, sp
		sub	sp, 0Eh
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[bp+var_4], ax
		mov	ax, [bp+arg_4]
		mov	[bp+var_6], ax
		mov	ax, [bp+arg_6]
		mov	[bp+var_8], ax
		mov	ax, [bp+arg_8]
		mov	[bp+var_A], ax
		mov	al, [bp+arg_A]
		mov	[bp+var_B], al
		mov	ax, [bp+arg_C]
		mov	[bp+var_E], ax
		push	1Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_6008C
		mov	bx, [bp+var_4]
		mov	eax, [bx]
		mov	[di], eax
		mov	bx, [bp+var_6]
		mov	eax, [bx]
		mov	[di+4], eax
		mov	bx, [bp+var_8]
		mov	eax, [bx]
		mov	[di+8], eax
		mov	bx, [bp+var_A]
		mov	eax, [bx]
		mov	[di+0Ch], eax
		mov	word ptr [di+10h], 9B2h
		mov	word ptr [di+12h], 0
		mov	word ptr [di+10h], 3924h
		mov	word ptr [di+18h], 3938h
		mov	word ptr [di+10h], 394Ch
		mov	byte ptr [di+17h], 0
		mov	word ptr [di+14h], 0
		push	[bp+var_E]
		call	CRT_Strdup
		pop	cx
		mov	[di+1Ah], ax
		mov	al, [bp+var_B]
		mov	[di+16h], al
		mov	ax, di
		jmp	short loc_6008E

loc_6008C:
		mov	ax, di

loc_6008E:
		mov	dx, ax
		or	dx, dx
		jz	short loc_60099
		add	ax, 10h
		jmp	short loc_6009B

loc_60099:
		mov	ax, dx

loc_6009B:
		mov	[bp+var_2], ax
		push	ax
		mov	ax, si
		add	ax, 3Eh
		push	ax
		call	LinkedListB_InsertAtTail_68A21
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_5FFF0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_600B1		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		or	si, si
		jz	short loc_600CF
		mov	word ptr [si], 3924h
		test	ax, 1
		jz	short loc_600CF
		push	si
		call	sub_3B2
		pop	cx

loc_600CF:
		pop	si
		pop	bp
		retf
sub_600B1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_600D2		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_6012A
		mov	word ptr [si+18h], 3938h
		mov	word ptr [si+10h], 394Ch
		cmp	word ptr [si+14h], 0
		jz	short loc_60114
		push	word ptr [si+14h]
		mov	bx, [si+14h]
		mov	bx, [bx]
		call	dword ptr [bx+14h]
		pop	cx
		cmp	word ptr [si+14h], 0
		jz	short loc_60114
		push	3
		push	word ptr [si+14h]
		mov	bx, [si+14h]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_60114

loc_60114:
		push	word ptr [si+1Ah]
		call	sub_65A86
		pop	cx
		test	di, 1
		jz	short loc_6012A
		push	si
		call	sub_3B2
		pop	cx

loc_6012A:
		pop	di
		pop	si
		pop	bp
		retf
sub_600D2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6012E		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+1Ah]
		pop	si
		pop	bp
		retf
sub_6012E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6013B		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[si+1Ah], ax
		pop	si
		pop	bp
		retf
sub_6013B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6014B		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		push	[bp+arg_2]
		push	ax
		call	sub_75660
		add	sp, 4
		pop	bp
		retf
sub_6014B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6015F		proc far

var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 8
		mov	dx, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		mov	ax, [bp+arg_4]
		mov	[bp+var_4], ax
		mov	ax, [bp+var_2]
		mov	[bp+var_8], ax
		mov	ax, [bp+var_4]
		mov	[bp+var_6], ax
		lea	ax, [bp+var_8]
		push	ax
		push	dx
		call	sub_75660
		add	sp, 4
		leave
		retf
sub_6015F		endp

; ----------------------------------------------------------------------

sub_6018F		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF0h
		nop
		nop
		jmp	sub_6013B
sub_6018F		endp

; ----------------------------------------------------------------------

sub_6019B		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF0h
		nop
		nop
		jmp	sub_6012E
sub_6019B		endp

; ----------------------------------------------------------------------

sub_601A7		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF0h
		nop
		nop
		jmp	sub_6015F
sub_601A7		endp

; ----------------------------------------------------------------------

sub_601B3		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF0h
		nop
		nop
		jmp	sub_6014B
sub_601B3		endp

; ----------------------------------------------------------------------

sub_601BF		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF0h
		nop
		nop
		jmp	sub_600D2
sub_601BF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_601CB		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_6024B
		mov	word ptr [si], 3964h
		mov	word ptr [si+0Ah], 3984h
		call	TextScrollDisplayB_ApplyHelperD_6FAF5
		mov	byte_7D3BC, 0
		cmp	word ptr [si+2Dh], 0
		jz	short loc_6020B
		mov	ax, [si+2Dh]
		add	ax, 2
		push	ax
		call	TextFormat_ReleaseStyleList_67E97
		pop	cx
		push	word ptr [si+2Dh]
		call	sub_3B2
		pop	cx
		jmp	short loc_6020B

loc_6020B:
		push	2
		mov	ax, si
		add	ax, 3Eh
		push	ax
		call	sub_75A4D
		add	sp, 4
		mov	ax, si
		add	ax, 39h
		push	ax
		call	sub_7627C
		pop	cx
		mov	ax, si
		add	ax, 1Fh
		push	ax
		call	TextFormat_ReleaseStyleList_67E97
		pop	cx
		push	0
		push	si
		call	Scene_Destruct_666E6
		add	sp, 4
		test	di, 1
		jz	short loc_6024B
		push	si
		call	sub_3B2
		pop	cx

loc_6024B:
		pop	di
		pop	si
		pop	bp
		retf
sub_601CB		endp

; ----------------------------------------------------------------------

sub_6024F		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	sub_66729
sub_6024F		endp

; ----------------------------------------------------------------------

sub_6025B		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	Layer_MoveBy_6674B
sub_6025B		endp

; ----------------------------------------------------------------------

sub_60267		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
sub_60267		endp

; START OF FUNCTION CHUNK FOR sub_60267
		db 0EAh, 71h
; END OF FUNCTION CHUNK FOR sub_60267
seg141		ends
