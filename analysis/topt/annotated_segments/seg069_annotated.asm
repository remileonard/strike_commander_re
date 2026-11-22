seg069		segment	para public 'CODE' use16
		assume cs:seg069
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 6Ah, 2, 68h, 47h, 69h, 9Ah, 0CBh, 0, 0A2h, 24h, 83h, 0C4h, 4, 0C9h, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_27BDF		proc far

var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	si, [bp+arg_4]
		mov	eax, [si]
		mov	[bp+var_4], eax
		jmp	short loc_27BFA

loc_27BF2:
		add	[bp+var_4], 16800h

loc_27BFA:
		cmp	[bp+var_4], 0FFFF4C00h
		jl	short loc_27BF2
		jmp	short loc_27C0E

loc_27C06:
		sub	[bp+var_4], 16800h

loc_27C0E:
		cmp	[bp+var_4], 0B400h
		jg	short loc_27C06
		mov	eax, [bp+var_4]
		mov	[bp+var_8], eax
		mov	bx, [bp+arg_0]
		mov	eax, [bp+var_8]
		mov	[bx], eax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	si
		leave
		retf
sub_27BDF		endp

; START OF FUNCTION CHUNK FOR sub_27BDF
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_27BDF

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_27C36		proc far

var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	[bp+arg_4]
		push	ss
		lea	ax, word ptr [bp+var_8]
		push	ax
		push	cs
		call	near ptr sub_27BDF
		add	sp, 6
		push	large [bp+var_8]
		call	Math_CosRaw_2B7FB
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 4
		mov	[bp+var_4], eax
		mov	bx, [bp+arg_0]
		mov	eax, [bp+var_4]
		mov	[bx], eax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		leave
		retf
sub_27C36		endp

; START OF FUNCTION CHUNK FOR sub_27C36
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_27C36

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_27C78		proc far

var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	[bp+arg_4]
		push	ss
		lea	ax, word ptr [bp+var_8]
		push	ax
		push	cs
		call	near ptr sub_27BDF
		add	sp, 6
		push	large [bp+var_8]
		call	sub_2B7B5
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 4
		mov	[bp+var_4], eax
		mov	bx, [bp+arg_0]
		mov	eax, [bp+var_4]
		mov	[bx], eax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		leave
		retf
sub_27C78		endp

; START OF FUNCTION CHUNK FOR sub_27C78
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_27C78

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_27CBA		proc far

var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 10h
		push	[bp+arg_4]
		push	ss
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	cs
		call	near ptr sub_27BDF
		add	sp, 6
		mov	[bp+var_8], 0
		mov	eax, [bp+var_4]
		or	eax, eax
		jge	short loc_27CE3
		neg	eax

loc_27CE3:
		mov	[bp+var_C], eax
		mov	eax, [bp+var_C]
		mov	[bp+var_10], eax
		cmp	[bp+var_10], 5A00h
		jnz	short loc_27CFE
		mov	ax, 1
		jmp	short loc_27D00

loc_27CFE:
		xor	ax, ax

loc_27D00:
		or	al, al
		jz	short loc_27D2D
		cmp	[bp+var_4], 0
		jle	short loc_27D10
		mov	ax, 1
		jmp	short loc_27D12

loc_27D10:
		xor	ax, ax

loc_27D12:
		or	al, al
		jz	short loc_27D20
		mov	eax, dword_4C86C
		mov	[bp+var_8], eax
		jmp	short loc_27D2B

loc_27D20:
		mov	eax, dword_4C86C
		neg	eax
		mov	[bp+var_8], eax

loc_27D2B:
		jmp	short loc_27D46

loc_27D2D:
		push	large [bp+var_4]
		call	Math_Tan_Raw_2B841
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 4
		mov	[bp+var_8], eax

loc_27D46:
		mov	bx, [bp+arg_0]
		mov	eax, [bp+var_8]
		mov	[bx], eax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		leave
		retf
sub_27CBA		endp

; START OF FUNCTION CHUNK FOR sub_27CBA
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_27CBA

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_27D5A		proc far

var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		push	di
		mov	si, [bp+arg_4]
		mov	[bp+var_4], 0
		mov	di, si
		mov	eax, [di]
		or	eax, eax
		jge	short loc_27D7A
		neg	eax

loc_27D7A:
		mov	[bp+var_8], eax
		mov	eax, [bp+var_8]
		mov	[bp+var_C], eax
		cmp	[bp+var_C], 100h
		jg	short loc_27D95
		mov	ax, 1
		jmp	short loc_27D97

loc_27D95:
		xor	ax, ax

loc_27D97:
		or	al, al
		jz	short loc_27DB3
		push	large [si]
		call	Math_AcosRaw_2B937
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 4
		mov	[bp+var_4], eax

loc_27DB3:
		mov	bx, [bp+arg_0]
		mov	eax, [bp+var_4]
		mov	[bx], eax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
sub_27D5A		endp

; START OF FUNCTION CHUNK FOR sub_27D5A
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_27D5A

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_27DCB		proc far

var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		push	di
		mov	si, [bp+arg_4]
		mov	[bp+var_4], 0
		mov	di, si
		mov	eax, [di]
		or	eax, eax
		jge	short loc_27DEB
		neg	eax

loc_27DEB:
		mov	[bp+var_8], eax
		mov	eax, [bp+var_8]
		mov	[bp+var_C], eax
		cmp	[bp+var_C], 100h
		jg	short loc_27E06
		mov	ax, 1
		jmp	short loc_27E08

loc_27E06:
		xor	ax, ax

loc_27E08:
		or	al, al
		jz	short loc_27E24
		push	large [si]
		call	Math_AsinRaw_2B8F4
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 4
		mov	[bp+var_4], eax

loc_27E24:
		mov	bx, [bp+arg_0]
		mov	eax, [bp+var_4]
		mov	[bx], eax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
sub_27DCB		endp

; START OF FUNCTION CHUNK FOR sub_27DCB
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_27DCB

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_27E3C		proc far

var_12		= dword ptr -12h
var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 12h
		push	si
		push	di
		mov	di, [bp+arg_4]
		mov	si, [bp+arg_6]
		mov	[bp+var_4], 0
		cmp	dword ptr [si], 0
		jnz	short loc_27E6C
		mov	bx, [bp+arg_0]
		mov	eax, [bp+var_4]
		mov	[bx], eax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	di
		pop	si
		leave
		retf

loc_27E6C:
		mov	[bp+var_6], si
		mov	eax, [di]
		mov	edx, eax
		mov	bx, [bp+var_6]
		mov	ecx, [bx]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_A], eax
		mov	eax, [bp+var_A]
		mov	[bp+var_E], eax
		lea	ax, word ptr [bp+var_E]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_12]
		push	ax
		push	cs
		call	near ptr sub_27D5A
		add	sp, 6
		mov	eax, [bp+var_12]
		mov	[bp+var_4], eax
		mov	bx, [bp+arg_0]
		mov	eax, [bp+var_4]
		mov	[bx], eax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
sub_27E3C		endp

; START OF FUNCTION CHUNK FOR sub_27E3C
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_27E3C

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_27EC2		proc far

var_12		= dword ptr -12h
var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 12h
		push	si
		push	di
		mov	di, [bp+arg_4]
		mov	si, [bp+arg_6]
		mov	[bp+var_4], 0
		cmp	dword ptr [si], 0
		jnz	short loc_27EF2
		mov	bx, [bp+arg_0]
		mov	eax, [bp+var_4]
		mov	[bx], eax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	di
		pop	si
		leave
		retf

loc_27EF2:
		mov	[bp+var_6], si
		mov	eax, [di]
		mov	edx, eax
		mov	bx, [bp+var_6]
		mov	ecx, [bx]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_A], eax
		mov	eax, [bp+var_A]
		mov	[bp+var_E], eax
		lea	ax, word ptr [bp+var_E]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_12]
		push	ax
		push	cs
		call	near ptr sub_27DCB
		add	sp, 6
		mov	eax, [bp+var_12]
		mov	[bp+var_4], eax
		mov	bx, [bp+arg_0]
		mov	eax, [bp+var_4]
		mov	[bx], eax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
sub_27EC2		endp

; START OF FUNCTION CHUNK FOR sub_27EC2
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_27EC2

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_27F48		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_4]
		push	large [si]
		call	sub_2B977
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 4
		mov	[bp+var_4], eax
		mov	bx, [bp+arg_0]
		mov	eax, [bp+var_4]
		mov	[bx], eax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	si
		leave
		retf
sub_27F48		endp

; START OF FUNCTION CHUNK FOR sub_27F48
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_27F48

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_27F80		proc far

var_20		= dword ptr -20h
var_1C		= word ptr -1Ch
var_1A		= dword ptr -1Ah
var_16		= dword ptr -16h
var_12		= dword ptr -12h
var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 20h
		push	si
		push	di
		mov	si, [bp+arg_4]
		mov	di, [bp+arg_6]
		mov	ax, [si+2]
		sar	ax, 0Fh
		or	al, al
		jz	short loc_27F9D
		mov	ax, 0FFA6h
		jmp	short loc_27FA0

loc_27F9D:
		mov	ax, 5Ah

loc_27FA0:
		mov	[bp+var_6], ax
		movsx	eax, [bp+var_6]
		shl	eax, 8
		mov	[bp+var_4], eax
		mov	eax, [si]
		sar	eax, 10h
		mov	[bp+var_E], eax
		mov	eax, [bp+var_E]
		mov	[bp+var_A], eax
		mov	eax, [di]
		sar	eax, 10h
		mov	[bp+var_16], eax
		mov	eax, [bp+var_16]
		mov	[bp+var_12], eax
		cmp	[bp+var_A], 0FFFFFFFFh
		jnz	short loc_27FE5
		mov	[bp+var_A], 0

loc_27FE5:
		cmp	[bp+var_12], 0FFFFFFFFh
		jnz	short loc_27FF4
		mov	[bp+var_12], 0

loc_27FF4:
		cmp	[bp+var_A], 0
		jz	short loc_28000
		mov	ax, 1
		jmp	short loc_28002

loc_28000:
		xor	ax, ax

loc_28002:
		or	al, al
		jz	short loc_2802C
		cmp	[bp+var_12], 0
		jnz	short loc_28012
		mov	ax, 1
		jmp	short loc_28014

loc_28012:
		xor	ax, ax

loc_28014:
		or	al, al
		jz	short loc_2802C
		mov	bx, [bp+arg_0]
		mov	eax, [bp+var_4]
		mov	[bx], eax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	di
		pop	si
		leave
		retf

loc_2802C:
		cmp	dword ptr [di], 0
		jz	short loc_28037
		mov	ax, 1
		jmp	short loc_28039

loc_28037:
		xor	ax, ax

loc_28039:
		or	al, al
		jz	short loc_2807C
		mov	[bp+var_1C], di
		mov	eax, [si]
		mov	edx, eax
		mov	bx, [bp+var_1C]
		mov	ecx, [bx]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_20], eax
		mov	eax, [bp+var_20]
		mov	[bp+var_1A], eax
		push	large [bp+var_1A]
		call	sub_2B977
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 4
		mov	[bp+var_4], eax

loc_2807C:
		mov	bx, [bp+arg_0]
		mov	eax, [bp+var_4]
		mov	[bx], eax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
sub_27F80		endp

; START OF FUNCTION CHUNK FOR sub_27F80
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_27F80

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_28094		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_4]
		mov	[bp+var_4], 0
		cmp	dword ptr [si], 0
		jge	short loc_280B6
		mov	[bp+var_4], 0B505h
		jmp	short loc_280CE

loc_280B6:
		push	large [si]
		call	sub_2BA6D
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 4
		mov	[bp+var_4], eax

loc_280CE:
		mov	bx, [bp+arg_0]
		mov	eax, [bp+var_4]
		mov	[bx], eax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	si
		leave
		retf
sub_28094		endp

; START OF FUNCTION CHUNK FOR sub_28094
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_28094

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_280E4		proc far

var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		push	di
		mov	si, [bp+arg_4]
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		mov	di, si
		mov	eax, [si]
		mov	edx, [di]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_8], eax
		mov	bx, word ptr [bp+var_4]
		mov	eax, [bp+var_8]
		mov	[bx], eax
		les	bx, word ptr [bp+var_4]
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
sub_280E4		endp

; START OF FUNCTION CHUNK FOR sub_280E4
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_280E4

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_28126		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_4]
		mov	di, [bp+arg_6]
		mov	bx, [bp+arg_8]
		push	large [bx]
		push	large [di]
		push	large [si]
		call	sub_2B9E3
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 0Ch
		mov	[bp+var_4], eax
		mov	bx, [bp+arg_0]
		mov	eax, [bp+var_4]
		mov	[bx], eax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
sub_28126		endp

; START OF FUNCTION CHUNK FOR sub_28126
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_28126

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2816D		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	word ptr [si+1]
		push	3E98h
		call	CRT_Msg_NullPtrAssign
		add	sp, 4
		pop	si
		pop	bp
		retf
sub_2816D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_28185		proc far

var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 18h
		push	si
		push	di
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_281A7
		push	14h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jnz	short loc_281A7
		jmp	loc_282D4

loc_281A7:
		mov	di, si
		mov	bx, [bp+arg_2]
		cmp	dword ptr [bx], 0
		jl	short loc_281D2
		mov	bx, [bp+arg_2]
		mov	eax, [bx]
		sar	eax, 8
		mov	[bp+var_4], eax
		mov	bx, [bp+arg_2]
		mov	eax, [bx]
		and	eax, 0FFh
		mov	[bp+var_8], eax
		jmp	short loc_2820C

loc_281D2:
		mov	bx, [bp+arg_2]
		mov	eax, [bx]
		neg	eax
		sar	eax, 8
		mov	[bp+var_4], eax
		mov	eax, [bp+var_4]
		neg	eax
		mov	[bp+var_4], eax
		cmp	[bp+var_4], 0
		jnz	short loc_281F9
		mov	byte ptr [di], 2Dh
		inc	di

loc_281F9:
		mov	bx, [bp+arg_2]
		mov	eax, [bx]
		neg	eax
		and	eax, 0FFh
		mov	[bp+var_8], eax

loc_2820C:
		mov	ax, word_4C870
		mov	[bp+var_12], ax
		mov	ax, word_4C872
		mov	[bp+var_10], ax
		mov	ax, word_4C874
		mov	[bp+var_E], ax
		mov	ax, word_4C876
		mov	[bp+var_C], ax
		cmp	[bp+arg_4], 3
		jle	short loc_2822F
		mov	[bp+arg_4], 3

loc_2822F:
		mov	bx, [bp+arg_4]
		shl	bx, 1
		lea	ax, [bp+var_12]
		add	bx, ax
		movsx	eax, word ptr [bx]
		mov	edx, [bp+var_8]
		imul	edx, eax
		mov	[bp+var_8], edx
		mov	eax, [bp+var_8]
		sar	eax, 8
		mov	[bp+var_8], eax
		mov	ax, word ptr [bp+var_8]
		mov	[bp+var_A], ax
		mov	ax, [bp+arg_4]
		dec	ax
		mov	[bp+var_14], ax
		mov	[bp+var_16], 1
		jmp	short loc_2826C

loc_28269:
		dec	[bp+var_14]

loc_2826C:
		cmp	[bp+var_14], 0
		jle	short loc_28286
		mov	bx, [bp+var_16]
		inc	[bp+var_16]
		shl	bx, 1
		lea	ax, [bp+var_12]
		add	bx, ax
		mov	ax, [bx]
		cmp	ax, [bp+var_A]
		jle	short loc_28269

loc_28286:
		push	large [bp+var_4]
		push	3E9Bh
		push	di
		call	CRT_Msg_Sprintf1
		add	sp, 8
		cmp	[bp+arg_4], 0
		jz	short loc_282D4
		jmp	short loc_2829F

loc_2829E:
		inc	di

loc_2829F:
		cmp	byte ptr [di], 0
		jnz	short loc_2829E
		mov	byte ptr [di], 2Eh
		mov	[bp+var_18], 1
		jmp	short loc_282B7

loc_282AE:
		mov	bx, [bp+var_18]
		mov	byte ptr [bx+di], 30h
		inc	[bp+var_18]

loc_282B7:
		mov	ax, [bp+var_18]
		cmp	ax, [bp+var_14]
		jle	short loc_282AE
		push	[bp+var_A]
		push	3E9Fh
		mov	ax, di
		add	ax, [bp+var_14]
		inc	ax
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 6

loc_282D4:
		mov	ax, si
		pop	di
		pop	si
		leave
		retf
sub_28185		endp

; START OF FUNCTION CHUNK FOR sub_28185
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_28185

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_282DE		proc far

var_4		= word ptr -4
var_2		= word ptr -2

		push	bp
		mov	bp, sp
		sub	sp, 4
		mov	[bp+var_2], ax
		mov	dx, [bp+var_2]
		mov	[bp+var_4], dx
		call	CRT_Rand
		movsx	eax, ax
		movsx	edx, [bp+var_4]
		imul	eax, edx
		mov	ebx, 8000h
		cdq
		idiv	ebx
		leave
		retf
sub_282DE		endp

; START OF FUNCTION CHUNK FOR sub_282DE
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_282DE

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à Math_RandomJitter_54E1C
; (sub_54E1C de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far, variante de Math_RandomScale centrée : retourne une valeur aléatoire dans
; [-x,+x]. Référencée par sub_3844F.
; ==============================================================================================
Math_RandomJitter_2830E		proc far

var_4		= word ptr -4
var_2		= word ptr -2

		push	bp
		mov	bp, sp
		sub	sp, 4
		mov	[bp+var_2], ax
		mov	dx, [bp+var_2]
		shl	dx, 1
		mov	[bp+var_4], dx
		call	CRT_Rand
		movsx	eax, ax
		movsx	edx, [bp+var_4]
		imul	eax, edx
		mov	ebx, 8000h
		cdq
		idiv	ebx
		sub	ax, [bp+var_2]
		leave
		retf
Math_RandomJitter_2830E		endp

; START OF FUNCTION CHUNK FOR Math_RandomJitter_2830E
		leave
		retf
; END OF FUNCTION CHUNK FOR Math_RandomJitter_2830E

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_28343		proc far

var_4		= word ptr -4
var_2		= word ptr -2

		push	bp
		mov	bp, sp
		sub	sp, 4
		mov	[bp+var_2], ax
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, eax, 64h
		mov	ebx, 8000h
		cdq
		idiv	ebx
		mov	[bp+var_4], ax
		mov	dx, [bp+var_4]
		cmp	dx, [bp+var_2]
		jge	short loc_28375
		mov	al, 1
		leave
		retf
		jmp	short loc_28379

loc_28375:
		mov	al, 0
		leave
		retf
sub_28343		endp

; START OF FUNCTION CHUNK FOR sub_28343

loc_28379:
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_28343

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2837B		proc far

var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		mov	[bp+var_4], 394Bh
		mov	eax, [bp+var_4]
		mov	dword_4C860, eax
		mov	[bp+var_8], 4
		mov	eax, [bp+var_8]
		mov	dword_4C864, eax
		mov	[bp+var_C], 1
		mov	eax, [bp+var_C]
sub_2837B		endp

; START OF FUNCTION CHUNK FOR sub_2837B
		db 66h, 0A3h, 88h
; END OF FUNCTION CHUNK FOR sub_2837B
seg069		ends
