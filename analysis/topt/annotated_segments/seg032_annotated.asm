seg032		segment	para public 'CODE' use16
		assume cs:seg032
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0C9h, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_11C12		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_11C2D
		push	35h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_11C58

loc_11C2D:
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	si
		call	sub_14A5A
		add	sp, 0Ah
		mov	word ptr [si+0Eh], 30B1h
		xor	ax, ax
		mov	[si+20h], ax
		mov	[si+1Eh], ax
		mov	word ptr [si+22h], 0
		mov	byte ptr [si+34h], 0

loc_11C58:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_11C12		endp

; START OF FUNCTION CHUNK FOR sub_11C12
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_11C12

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_11C60		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_11C95
		mov	word ptr [si+0Eh], 30B1h
		push	si
		nop
		push	cs
		call	near ptr sub_11D13
		add	sp, 2
		push	si
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		test	di, 1
		jz	short loc_11C95
		push	si
		call	sub_39C
		add	sp, 2

loc_11C95:
		pop	di
		pop	si
		pop	bp
		retf
sub_11C60		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_11C99		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	byte ptr [si+34h], 1
		push	0
		push	si
		nop
		push	cs
		call	near ptr sub_11CCD
		add	sp, 4
		mov	di, ax
		jmp	short loc_11CC5

loc_11CB4:
		and	byte ptr [di+10h], 0FBh
		push	1
		push	si
		nop
		push	cs
		call	near ptr sub_11CCD
		add	sp, 4
		mov	di, ax

loc_11CC5:
		or	di, di
		jnz	short loc_11CB4
		pop	di
		pop	si
		pop	bp
		retf
sub_11C99		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_11CCD		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	dx, [bp+arg_2]
		or	dx, dx
		jnz	short loc_11CE3
		mov	ax, [si+1Eh]
		mov	[si+24h], ax
		jmp	short loc_11CFB

loc_11CE3:
		jmp	short loc_11CEE

loc_11CE5:
		mov	bx, [si+24h]
		mov	ax, [bx+2]
		mov	[si+24h], ax

loc_11CEE:
		cmp	word ptr [si+24h], 0
		jz	short loc_11CFB
		mov	ax, dx
		dec	dx
		or	ax, ax
		jnz	short loc_11CE5

loc_11CFB:
		cmp	word ptr [si+24h], 0
		jnz	short loc_11D08
		xor	ax, ax
		pop	si
		pop	bp
		retf
		jmp	short loc_11D10

loc_11D08:
		mov	bx, [si+24h]
		mov	ax, [bx]
		pop	si
		pop	bp
		retf
sub_11CCD		endp

; START OF FUNCTION CHUNK FOR sub_11CCD

loc_11D10:
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_11CCD

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_11D13		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		jmp	short loc_11D5A

loc_11D1D:
		mov	di, [si+1Eh]
		cmp	word ptr [di], 0
		jz	short loc_11D36
		push	3
		push	word ptr [di]
		mov	bx, [di]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx+30h]
		add	sp, 4
		jmp	short loc_11D36

loc_11D36:
		mov	ax, [di+2]
		mov	[si+1Eh], ax
		push	di
		call	sub_39C
		add	sp, 2
		mov	ax, [si+22h]
		dec	word ptr [si+22h]
		or	ax, ax
		jg	short loc_11D5A
		push	3018h
		call	Runtime_FatalErrorHandler_36797
		add	sp, 2

loc_11D5A:
		cmp	word ptr [si+1Eh], 0
		jnz	short loc_11D1D
		xor	ax, ax
		mov	[si+20h], ax
		mov	[si+1Eh], ax
		mov	word ptr [si+22h], 0
		pop	di
		pop	si
		pop	bp
		retf
sub_11D13		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_11D71		proc far

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	short loc_11DC2

loc_11D83:
		mov	[bp+var_2], 1
		mov	cx, [si+1Eh]
		mov	bx, cx
		mov	di, [bx+2]
		jmp	short loc_11DBE

loc_11D92:
		mov	bx, cx
		mov	bx, [bx]
		mov	al, [bx+15h]
		and	ax, 0Fh
		mov	bx, [di]
		mov	dl, [bx+15h]
		and	dx, 0Fh
		cmp	ax, dx
		jle	short loc_11DB9
		mov	[bp+var_2], 0
		mov	bx, cx
		mov	dx, [bx]
		mov	ax, [di]
		mov	bx, cx
		mov	[bx], ax
		mov	[di], dx

loc_11DB9:
		mov	cx, di
		mov	di, [di+2]

loc_11DBE:
		or	di, di
		jnz	short loc_11D92

loc_11DC2:
		cmp	[bp+var_2], 0
		jz	short loc_11D83
		pop	di
		pop	si
		leave
		retf
sub_11D71		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_11DCC		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	cx, [bp+arg_2]
		mov	di, [si+1Eh]
		jmp	short loc_11DFC

loc_11DDC:
		mov	bx, [di]
		mov	al, [bx+15h]
		and	ax, 0Fh
		cmp	ax, cx
		jnz	short loc_11DF9
		mov	dx, [bp+arg_4]
		mov	ax, dx
		and	ax, 0Fh
		mov	bx, [di]
		and	byte ptr [bx+15h], 0F0h
		or	[bx+15h], al

loc_11DF9:
		mov	di, [di+2]

loc_11DFC:
		or	di, di
		jnz	short loc_11DDC
		pop	di
		pop	si
		pop	bp
		retf
sub_11DCC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_11E04		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	dx, [bp+arg_2]
		mov	cx, [bp+arg_4]
		mov	di, [si+1Eh]
		jmp	short loc_11E5B

loc_11E1A:
		mov	bx, [di]
		mov	al, [bx+15h]
		and	ax, 0Fh
		cmp	ax, dx
		jnz	short loc_11E3A
		mov	[bp+var_2], cx
		mov	ax, [bp+var_2]
		and	ax, 0Fh
		mov	bx, [di]
		and	byte ptr [bx+15h], 0F0h
		or	[bx+15h], al
		jmp	short loc_11E58

loc_11E3A:
		mov	bx, [di]
		mov	al, [bx+15h]
		and	ax, 0Fh
		cmp	ax, cx
		jnz	short loc_11E58
		mov	[bp+var_4], dx
		mov	ax, [bp+var_4]
		and	ax, 0Fh
		mov	bx, [di]
		and	byte ptr [bx+15h], 0F0h
		or	[bx+15h], al

loc_11E58:
		mov	di, [di+2]

loc_11E5B:
		or	di, di
		jnz	short loc_11E1A
		pop	di
		pop	si
		leave
		retf
sub_11E04		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_11E63		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	4
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	di, ax
		or	di, di
		jz	short loc_11E9C
		mov	ax, [bp+arg_2]
		mov	[di], ax
		mov	word ptr [di+2], 0
		cmp	word ptr [si+1Eh], 0
		jnz	short loc_11E90
		mov	[si+1Eh], di
		jmp	short loc_11E96

loc_11E90:
		mov	bx, [si+20h]
		mov	[bx+2], di

loc_11E96:
		mov	[si+20h], di
		inc	word ptr [si+22h]

loc_11E9C:
		mov	ax, di
		pop	di
		pop	si
		pop	bp
		retf
sub_11E63		endp

; START OF FUNCTION CHUNK FOR sub_11E63
		pop	di
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_11E63

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_11EA6		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	4
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	di, ax
		or	di, di
		jz	short loc_11ECF
		mov	ax, [bp+arg_2]
		mov	[di], ax
		mov	ax, [si+1Eh]
		mov	[di+2], ax
		mov	[si+1Eh], di
		inc	word ptr [si+22h]

loc_11ECF:
		mov	ax, di
		pop	di
		pop	si
		pop	bp
		retf
sub_11EA6		endp

; START OF FUNCTION CHUNK FOR sub_11EA6
		pop	di
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_11EA6

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_11ED9		proc far

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
		mov	di, [si+1Eh]
		jmp	short loc_11F36

loc_11EEE:
		mov	ax, [di]
		cmp	ax, [bp+arg_2]
		jnz	short loc_11F2D
		cmp	[bp+var_2], 0
		jz	short loc_11F04
		mov	ax, [di+2]
		mov	bx, [bp+var_2]
		mov	[bx+2], ax

loc_11F04:
		cmp	[si+1Eh], di
		jnz	short loc_11F0F
		mov	ax, [di+2]
		mov	[si+1Eh], ax

loc_11F0F:
		cmp	[si+20h], di
		jnz	short loc_11F1A
		mov	ax, [bp+var_2]
		mov	[si+20h], ax

loc_11F1A:
		push	di
		call	sub_39C
		add	sp, 2
		dec	word ptr [si+22h]
		mov	ax, 1
		pop	di
		pop	si
		leave
		retf

loc_11F2D:
		mov	[bp+var_2], di
		mov	bx, [bp+var_2]
		mov	di, [bx+2]

loc_11F36:
		or	di, di
		jnz	short loc_11EEE
		xor	ax, ax
		pop	di
		pop	si
		leave
		retf
sub_11ED9		endp

; START OF FUNCTION CHUNK FOR sub_11ED9
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_11ED9

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_11F44		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	di
		mov	bx, [di+0Eh]
		call	dword ptr [bx+4]
		add	sp, 2
		push	di
		push	si
		push	cs
		call	near ptr sub_11ED9
		add	sp, 4
		pop	di
		pop	si
		pop	bp
		retf
sub_11F44		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_11F66		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	dx, [bp+arg_2]
		xor	cx, cx
		or	dx, dx
		jl	short loc_11F8B
		cmp	[si+22h], dx
		jle	short loc_11F8B
		mov	di, [si+1Eh]
		jmp	short loc_11F85

loc_11F81:
		mov	di, [di+2]
		dec	dx

loc_11F85:
		or	dx, dx
		jnz	short loc_11F81
		mov	cx, [di]

loc_11F8B:
		mov	ax, cx
		pop	di
		pop	si
		pop	bp
		retf
sub_11F66		endp

; START OF FUNCTION CHUNK FOR sub_11F66
		pop	di
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_11F66

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_11F95		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	cx, [bp+arg_2]
		xor	dx, dx
		mov	di, [si+1Eh]
		jmp	short loc_11FB5

loc_11FA7:
		cmp	[di], cx
		jnz	short loc_11FB1
		mov	ax, dx
		pop	di
		pop	si
		pop	bp
		retf

loc_11FB1:
		mov	di, [di+2]
		inc	dx

loc_11FB5:
		or	di, di
		jnz	short loc_11FA7
		mov	ax, 0FFFFh
		pop	di
		pop	si
		pop	bp
		retf
sub_11F95		endp

; START OF FUNCTION CHUNK FOR sub_11F95
		pop	di
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_11F95

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_11FC4		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	[si+26h], di
		mov	ax, [di+4]
		mov	[si+28h], ax
		mov	ax, [di+6]
		mov	[si+2Ah], ax
		mov	ax, [di+8]
		inc	ax
		mov	[si+2Ch], ax
		mov	ax, [di+0Ah]
		inc	ax
		mov	[si+2Eh], ax
		mov	ax, [si+16h]
		add	ax, [si+18h]
		mov	dx, [si+1Ah]
		sub	dx, ax
		sub	dx, [si+2Ch]
		mov	[si+30h], dx
		mov	ax, [si+16h]
		add	ax, [si+18h]
		mov	dx, [si+1Ch]
		sub	dx, ax
		sub	dx, [si+2Eh]
		mov	[si+32h], dx
		push	word ptr [si+6]
		push	word ptr [si+4]
		push	di
		mov	bx, [di+0Eh]
		call	dword ptr [bx+8]
		add	sp, 6
		push	di
		push	si
		push	cs
		call	near ptr sub_11E63
		add	sp, 4
		mov	al, [si+10h]
		and	ax, 1
		or	ax, ax
		jz	short loc_1203B
		push	di
		mov	bx, [di+0Eh]
		call	dword ptr [bx+18h]
		add	sp, 2

loc_1203B:
		pop	di
		pop	si
		pop	bp
		retf
sub_11FC4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1203F		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	di
		push	si
		push	cs
		call	near ptr sub_11ED9
		add	sp, 4
		push	di
		push	si
		push	cs
		call	near ptr sub_11E63
		add	sp, 4
		pop	di
		pop	si
		pop	bp
		retf
sub_1203F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_12060		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	di
		push	si
		push	cs
		call	near ptr sub_11ED9
		add	sp, 4
		push	di
		push	si
		push	cs
		call	near ptr sub_11EA6
		add	sp, 4
		pop	di
		pop	si
		pop	bp
		retf
sub_12060		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; GaugeWidget_Method_SetField_A31EA (sub_A31EA de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, méthode virtuelle écrivant un champ (dispatch
; vtable), référencée via jmp depuis un stub VROOMM (sub_6C749).
; ==============================================================================================
GaugeWidget_Method_SetField_12081		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [si+1Eh]
		jmp	short loc_120A4

loc_1208E:
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	word ptr [di]
		mov	bx, [di]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx+8]
		add	sp, 6
		mov	di, [di+2]

loc_120A4:
		or	di, di
		jnz	short loc_1208E
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	si
		call	Widget_TranslateBounds_14438
		add	sp, 6
		pop	di
		pop	si
		pop	bp
		retf
GaugeWidget_Method_SetField_12081		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_120BB		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [si+1Eh]
		jmp	short loc_120D7

loc_120C8:
		push	word ptr [di]
		mov	bx, [di]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx]
		add	sp, 2
		mov	di, [di+2]

loc_120D7:
		or	di, di
		jnz	short loc_120C8
		push	si
		call	Widget_SetFlagBit0_1441C
		add	sp, 2
		pop	di
		pop	si
		pop	bp
		retf
sub_120BB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_120E8		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [si+1Eh]
		jmp	short loc_12105

loc_120F5:
		push	word ptr [di]
		mov	bx, [di]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx+4]
		add	sp, 2
		mov	di, [di+2]

loc_12105:
		or	di, di
		jnz	short loc_120F5
		push	si
		call	Widget_ClearFlagBit0_1442A
		add	sp, 2
		pop	di
		pop	si
		pop	bp
		retf
sub_120E8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_12116		proc far

var_C		= word ptr -0Ch
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
		sub	sp, 0Ch
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		mov	ax, [bp+arg_2]
		add	ax, [si+4]
		mov	[bp+var_4], ax
		mov	ax, [bp+arg_4]
		add	ax, [si+6]
		mov	[bp+var_6], ax
		mov	ax, [si+1Eh]
		mov	[bp+var_8], ax
		jmp	short loc_121A7

loc_12140:
		mov	bx, [bp+var_8]
		mov	di, [bx]
		mov	ax, [di+4]
		cmp	ax, [bp+var_4]
		jg	short loc_1216A
		mov	ax, [di+6]
		cmp	ax, [bp+var_6]
		jg	short loc_1216A
		mov	ax, [di+8]
		cmp	ax, [bp+var_4]
		jl	short loc_1216A
		mov	ax, [di+0Ah]
		cmp	ax, [bp+var_6]
		jl	short loc_1216A
		mov	ax, 1
		jmp	short loc_1216C

loc_1216A:
		xor	ax, ax

loc_1216C:
		or	ax, ax
		jz	short loc_1219E
		mov	ax, [bp+var_4]
		sub	ax, [di+4]
		mov	[bp+var_A], ax
		mov	ax, [bp+var_6]
		sub	ax, [di+6]
		mov	[bp+var_C], ax
		push	[bp+var_C]
		push	[bp+var_A]
		push	di
		mov	bx, [di+0Eh]
		call	dword ptr [bx+24h]
		add	sp, 6
		mov	[bp+var_2], ax
		cmp	[bp+var_2], 0
		jnz	short loc_1219E
		mov	[bp+var_2], di

loc_1219E:
		mov	bx, [bp+var_8]
		mov	ax, [bx+2]
		mov	[bp+var_8], ax

loc_121A7:
		cmp	[bp+var_8], 0
		jnz	short loc_12140
		mov	ax, [bp+var_2]
		pop	di
		pop	si
		leave
		retf
sub_12116		endp

; START OF FUNCTION CHUNK FOR sub_12116
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_12116

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_121B8		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		mov	ax, [bp+arg_2]
		add	ax, [si+4]
		mov	cx, ax
		mov	ax, [bp+arg_4]
		add	ax, [si+6]
		mov	[bp+var_4], ax
		mov	dx, [si+1Eh]
		jmp	short loc_1220F

loc_121DE:
		mov	bx, dx
		mov	di, [bx]
		cmp	[di+4], cx
		jg	short loc_12201
		mov	ax, [di+6]
		cmp	ax, [bp+var_4]
		jg	short loc_12201
		cmp	[di+8], cx
		jl	short loc_12201
		mov	ax, [di+0Ah]
		cmp	ax, [bp+var_4]
		jl	short loc_12201
		mov	ax, 1
		jmp	short loc_12203

loc_12201:
		xor	ax, ax

loc_12203:
		or	ax, ax
		jz	short loc_1220A
		mov	[bp+var_2], di

loc_1220A:
		mov	bx, dx
		mov	dx, [bx+2]

loc_1220F:
		or	dx, dx
		jnz	short loc_121DE
		mov	ax, [bp+var_2]
		pop	di
		pop	si
		leave
		retf
sub_121B8		endp

; START OF FUNCTION CHUNK FOR sub_121B8
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_121B8

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1221E		proc far

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

		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx+24h]
		add	sp, 6
		mov	[bp+var_2], ax
		cmp	[bp+var_2], 0
		jnz	short loc_12245
		jmp	loc_122DA

loc_12245:
		mov	ax, [bp+arg_2]
		add	ax, [si+4]
		mov	[bp+var_4], ax
		mov	ax, [bp+arg_4]
		add	ax, [si+6]
		mov	[bp+var_6], ax
		mov	bx, [bp+var_2]
		mov	ax, [bp+var_4]
		sub	ax, [bx+4]
		mov	[bp+var_8], ax
		mov	bx, [bp+var_2]
		mov	ax, [bp+var_6]
		sub	ax, [bx+6]
		mov	[bp+var_A], ax
		cmp	byte ptr [si+34h], 0
		jz	short loc_122BF
		push	0
		push	si
		push	cs
		call	near ptr sub_11CCD
		add	sp, 4
		mov	di, ax
		jmp	short loc_122BB

loc_12283:
		cmp	di, [bp+var_2]
		jz	short loc_122AF
		mov	al, [di+10h]
		shr	ax, 5
		and	ax, 1
		or	ax, ax
		jz	short loc_122AF
		and	byte ptr [di+10h], 0DFh
		mov	al, [di+10h]
		and	ax, 1
		or	ax, ax
		jz	short loc_122AF
		push	di
		mov	bx, [di+0Eh]
		call	dword ptr [bx+18h]
		add	sp, 2
		jmp	short loc_122AF

loc_122AF:
		push	1
		push	si
		push	cs
		call	near ptr sub_11CCD
		add	sp, 4
		mov	di, ax

loc_122BB:
		or	di, di
		jnz	short loc_12283

loc_122BF:
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	[bp+var_A]
		push	[bp+var_8]
		push	[bp+var_2]
		mov	bx, [bp+var_2]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx+28h]
		add	sp, 0Ah

loc_122DA:
		pop	di
		pop	si
		leave
		retf
sub_1221E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_122DE		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	si
		call	sub_143DD
		add	sp, 2
		mov	di, [si+1Eh]
		jmp	short loc_12304

loc_122F4:
		push	word ptr [di]
		mov	bx, [di]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx+1Ch]
		add	sp, 2
		mov	di, [di+2]

loc_12304:
		or	di, di
		jnz	short loc_122F4
		push	si
		call	sub_143FC
		add	sp, 2
		pop	di
		pop	si
		pop	bp
		retf
sub_122DE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à GaugeWidget_ComputeRange_A3436 (sub_A3436 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; calcul sur deux champs (rôle exact non détaillé).
; ==============================================================================================
GaugeWidget_ComputeRange_12315		proc far

var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx+24h]
		add	sp, 6
		mov	di, ax
		or	di, di
		jz	short loc_1236D
		mov	ax, [bp+arg_2]
		add	ax, [si+4]
		mov	[bp+var_2], ax
		mov	ax, [bp+arg_4]
		add	ax, [si+6]
		mov	[bp+var_4], ax
		mov	ax, [bp+var_2]
		sub	ax, [di+4]
		mov	[bp+var_6], ax
		mov	ax, [bp+var_4]
		sub	ax, [di+6]
		mov	[bp+var_8], ax
		push	[bp+arg_6]
		push	[bp+var_8]
		push	[bp+var_6]
		push	di
		mov	bx, [di+0Eh]
		call	dword ptr [bx+10h]
		add	sp, 8

loc_1236D:
		pop	di
		pop	si
		leave
		retf
GaugeWidget_ComputeRange_12315		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_12371		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	word ptr [si+35h], 0
		mov	byte ptr [si+4Fh], 1
		mov	word ptr [si+5Ch], 0FFFFh
		xor	ax, ax
		mov	[si+60h], ax
		mov	[si+5Eh], ax
		xor	ax, ax
		mov	[si+64h], ax
		mov	[si+62h], ax
		push	word_4D36E
		mov	ax, si
		add	ax, 37h
		push	ax
		call	TextFormat_ApplyStyleAttribute_357D1
		add	sp, 4
		xor	ax, ax
		mov	[si+70h], ax
		mov	[si+6Eh], ax
		pop	si
		pop	bp
		retf
sub_12371		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_123B3		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_123CE
		push	72h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_12429

loc_123CE:
		push	0
		push	0
		push	0FFFFh
		push	0FFFFh
		push	si
		push	cs
		call	near ptr sub_11C12
		add	sp, 0Ah
		mov	word ptr [si+0Eh], 3075h
		mov	word ptr [si+37h], 0
		mov	word ptr [si+39h], 0
		mov	byte ptr [si+44h], 0
		mov	dword ptr [si+45h], 0
		mov	byte ptr [si+49h], 2
		mov	byte ptr [si+4Ah], 0
		mov	dword ptr [si+4Bh], 0
		mov	dword ptr [si+50h], 0
		mov	byte ptr [si+54h], 2
		mov	byte ptr [si+55h], 0
		mov	dword ptr [si+56h], 0
		push	si
		push	cs
		call	near ptr sub_12371
		add	sp, 2

loc_12429:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_123B3		endp

; START OF FUNCTION CHUNK FOR sub_123B3
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_123B3

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_12431		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_1244C
		push	72h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_124AB

loc_1244C:
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr sub_11C12
		add	sp, 0Ah
		mov	word ptr [si+0Eh], 3075h
		mov	word ptr [si+37h], 0
		mov	word ptr [si+39h], 0
		mov	byte ptr [si+44h], 0
		mov	dword ptr [si+45h], 0
		mov	byte ptr [si+49h], 2
		mov	byte ptr [si+4Ah], 0
		mov	dword ptr [si+4Bh], 0
		mov	dword ptr [si+50h], 0
		mov	byte ptr [si+54h], 2
		mov	byte ptr [si+55h], 0
		mov	dword ptr [si+56h], 0
		push	si
		push	cs
		call	near ptr sub_12371
		add	sp, 2

loc_124AB:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_12431		endp

; START OF FUNCTION CHUNK FOR sub_12431
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_12431

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_124B3		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jnz	short loc_124D2
		push	72h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_1253B

loc_124D2:
		mov	ax, [di+0Ah]
		sub	ax, [di+6]
		inc	ax
		push	ax
		mov	ax, [di+8]
		sub	ax, [di+4]
		inc	ax
		push	ax
		push	word ptr [di+6]
		push	word ptr [di+4]
		push	si
		push	cs
		call	near ptr sub_11C12
		add	sp, 0Ah
		mov	word ptr [si+0Eh], 3075h
		mov	word ptr [si+37h], 0
		mov	word ptr [si+39h], 0
		mov	byte ptr [si+44h], 0
		mov	dword ptr [si+45h], 0
		mov	byte ptr [si+49h], 2
		mov	byte ptr [si+4Ah], 0
		mov	dword ptr [si+4Bh], 0
		mov	dword ptr [si+50h], 0
		mov	byte ptr [si+54h], 2
		mov	byte ptr [si+55h], 0
		mov	dword ptr [si+56h], 0
		push	si
		push	cs
		call	near ptr sub_12371
		add	sp, 2

loc_1253B:
		mov	ax, si
		pop	di
		pop	si
		pop	bp
		retf
sub_124B3		endp

; START OF FUNCTION CHUNK FOR sub_124B3
		pop	di
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_124B3

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_12545		proc far

var_C		= word ptr -0Ch
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
		sub	sp, 0Ch
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	[si+1Ah], di
		mov	ax, [bp+arg_4]
		mov	[si+1Ch], ax
		mov	ax, [si+4]
		add	ax, [si+1Ah]
		dec	ax
		mov	[si+8], ax
		mov	ax, [si+6]
		add	ax, [si+1Ch]
		dec	ax
		mov	[si+0Ah], ax
		mov	bx, word_4D36E
		mov	ax, [bx+8]
		mov	bx, word_4D36E
		sub	ax, [bx+4]
		inc	ax
		sub	ax, di
		sar	ax, 1
		mov	[bp+var_2], ax
		mov	bx, word_4D36E
		mov	ax, [bx+0Ah]
		mov	bx, word_4D36E
		sub	ax, [bx+6]
		inc	ax
		sub	ax, [bp+arg_4]
		sar	ax, 1
		mov	[bp+var_4], ax
		mov	ax, [bp+var_2]
		mov	[bp+var_6], ax
		mov	ax, [bp+var_4]
		mov	[bp+var_8], ax
		mov	ax, [bp+var_6]
		sub	ax, [si+4]
		mov	[bp+var_A], ax
		mov	ax, [bp+var_8]
		sub	ax, [si+6]
		mov	[bp+var_C], ax
		push	[bp+var_C]
		push	[bp+var_A]
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx+8]
		add	sp, 6
		pop	di
		pop	si
		leave
		retf
sub_12545		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_125CF		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jnz	short loc_125E1
		jmp	loc_12693

loc_125E1:
		mov	word ptr [si+0Eh], 3075h
		push	si
		nop
		push	cs
		call	near ptr sub_129CC
		add	sp, 2
		push	si
		nop
		push	cs
		call	near ptr sub_12AE8
		add	sp, 2
		cmp	byte ptr [si+55h], 0
		jz	short loc_1261E
		cmp	dword ptr [si+50h], 0
		jz	short loc_1261E
		push	0
		mov	al, [si+54h]
		push	ax
		mov	ax, si
		add	ax, 50h
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_1261E

loc_1261E:
		mov	dword ptr [si+50h], 0
		mov	byte ptr [si+55h], 0
		mov	dword ptr [si+56h], 0
		cmp	byte ptr [si+4Ah], 0
		jz	short loc_12658
		cmp	dword ptr [si+45h], 0
		jz	short loc_12658
		push	0
		mov	al, [si+49h]
		push	ax
		mov	ax, si
		add	ax, 45h
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_12658

loc_12658:
		mov	dword ptr [si+45h], 0
		mov	byte ptr [si+4Ah], 0
		mov	dword ptr [si+4Bh], 0
		mov	ax, si
		add	ax, 37h
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	0
		push	si
		push	cs
		call	near ptr sub_11C60
		add	sp, 4
		test	di, 1
		jz	short loc_12693
		push	si
		call	sub_39C
		add	sp, 2

loc_12693:
		pop	di
		pop	si
		pop	bp
		retf
sub_125CF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_12697		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		call	sub_143DD
		add	sp, 2
		cmp	word ptr [si+5Ch], 0FFFFh
		jz	short loc_126C9
		mov	al, [si+5Ch]
		push	ax
		push	word ptr [si+0Ah]
		push	word ptr [si+8]
		push	word ptr [si+6]
		push	word ptr [si+4]
		push	word_4D36E
		call	sub_37A76
		add	sp, 0Ch

loc_126C9:
		cmp	word ptr [si+5Eh], 0
		jz	short loc_126D8
		push	si
		nop
		push	cs
		call	near ptr sub_1297A
		add	sp, 2

loc_126D8:
		cmp	dword ptr [si+50h], 0
		jz	short loc_126E4
		mov	ax, 1
		jmp	short loc_126E6

loc_126E4:
		xor	ax, ax

loc_126E6:
		or	ax, ax
		jz	short loc_12718
		push	word ptr [si+5Ah]
		push	0
		mov	al, [si+54h]
		push	ax
		push	word ptr [si+52h]
		push	word ptr [si+50h]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	word ptr [si+6]
		push	word ptr [si+4]
		push	word_4D36E
		call	Shape_DrawSpans_38514
		add	sp, 0Ch

loc_12718:
		push	si
		call	sub_143FC
		add	sp, 2
		pop	si
		pop	bp
		retf
sub_12697		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_12724		proc far

arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	[bp+arg_2], 0
		jz	short loc_1273B
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx+34h]
		add	sp, 2

loc_1273B:
		pop	si
		pop	bp
		retf
sub_12724		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1273E		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		cmp	di, 0FFFEh
		jnz	short loc_12761
		push	29h
		push	42h
		push	51h
		call	sub_146EF
		add	sp, 6
		mov	[si+5Ch], ax
		jmp	short loc_12764

loc_12761:
		mov	[si+5Ch], di

loc_12764:
		pop	di
		pop	si
		pop	bp
		retf
sub_1273E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_12768		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	di, di
		jz	short loc_127A2
		mov	ax, [bp+arg_4]
		sub	ax, [di+4]
		mov	[bp+var_2], ax
		mov	ax, [bp+arg_6]
		sub	ax, [di+6]
		mov	[bp+var_4], ax
		push	[bp+arg_A]
		push	[bp+arg_8]
		push	[bp+var_4]
		push	[bp+var_2]
		push	di
		mov	bx, [di+0Eh]
		call	dword ptr [bx+28h]
		add	sp, 0Ah

loc_127A2:
		pop	di
		pop	si
		leave
		retf
sub_12768		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_127A6		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h
arg_C		= word ptr  12h

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	si
		call	sub_143DD
		add	sp, 2
		cmp	[bp+arg_C], 0
		jz	short loc_127E7
		mov	al, byte ptr word_4BCB0
		push	ax
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	di
		push	word_4D36E
		call	sub_38150
		add	sp, 0Ch
		inc	di
		inc	[bp+arg_4]
		dec	[bp+arg_6]
		dec	[bp+arg_8]

loc_127E7:
		mov	[bp+var_2], 0
		jmp	short loc_12867

loc_127EE:
		mov	al, byte ptr word_4BCB4
		push	ax
		push	[bp+arg_8]
		push	[bp+arg_6]
		mov	ax, [bp+arg_4]
		inc	ax
		push	ax
		push	[bp+arg_6]
		push	word_4D36E
		call	sub_37F22
		add	sp, 0Ch
		mov	al, byte ptr word_4BCB4
		push	ax
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	[bp+arg_8]
		push	di
		push	word_4D36E
		call	sub_37F22
		add	sp, 0Ch
		mov	al, byte ptr word_4BCBA
		push	ax
		push	[bp+arg_4]
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	di
		push	word_4D36E
		call	sub_37F22
		add	sp, 0Ch
		mov	al, byte ptr word_4BCBA
		push	ax
		mov	ax, [bp+arg_8]
		dec	ax
		push	ax
		push	di
		push	[bp+arg_4]
		push	di
		push	word_4D36E
		call	sub_37F22
		add	sp, 0Ch
		inc	di
		inc	[bp+arg_4]
		dec	[bp+arg_6]
		dec	[bp+arg_8]
		inc	[bp+var_2]

loc_12867:
		mov	ax, [bp+var_2]
		cmp	ax, [bp+arg_A]
		jge	short loc_12872
		jmp	loc_127EE

loc_12872:
		mov	al, byte ptr word_4BCB8
		push	ax
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	di
		push	word_4D36E
		call	sub_37A76
		add	sp, 0Ch
		push	si
		call	sub_143FC
		add	sp, 2
		pop	di
		pop	si
		leave
		retf
sub_127A6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_12899		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	1
		push	1
		push	word ptr [si+0Ah]
		push	word ptr [si+8]
		push	word ptr [si+6]
		push	word ptr [si+4]
		push	si
		push	cs
		call	near ptr sub_127A6
		add	sp, 0Eh
		pop	si
		pop	bp
		retf
sub_12899		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_128BB		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		call	sub_143DD
		add	sp, 2
		push	word ptr [si+5Ch]
		push	[bp+arg_2]
		call	sub_150B5
		add	sp, 4
		push	si
		call	sub_143FC
		add	sp, 2
		pop	si
		pop	bp
		retf
sub_128BB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_128E5		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	word ptr [si+35h], 1
		push	si
		nop
		push	cs
		call	near ptr sub_12E73
		add	sp, 2
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx+18h]
		add	sp, 2
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx]
		add	sp, 2
		pop	si
		pop	bp
		retf
sub_128E5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_12910		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx+4]
		add	sp, 2
		push	si
		nop
		push	cs
		call	near ptr sub_130C5
		add	sp, 2
		mov	word ptr [si+35h], 0
		pop	si
		pop	bp
		retf
sub_12910		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_12932		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	0Ah
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	di, ax
		mov	ax, [bp+arg_2]
		mov	[di], ax
		mov	ax, [bp+arg_4]
		mov	[di+2], ax
		mov	ax, [bp+arg_6]
		mov	[di+4], ax
		mov	ax, [bp+arg_8]
		mov	[di+6], ax
		mov	word ptr [di+8], 0
		cmp	word ptr [si+5Eh], 0
		jnz	short loc_1296D
		mov	[si+5Eh], di
		jmp	short loc_12973

loc_1296D:
		mov	bx, [si+60h]
		mov	[bx+8], di

loc_12973:
		mov	[si+60h], di
		pop	di
		pop	si
		pop	bp
		retf
sub_12932		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1297A		proc far

var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [si+5Eh]
		jmp	short loc_129C4

loc_1298A:
		mov	ax, [di]
		mov	[bp+var_2], ax
		mov	ax, [di+2]
		mov	[bp+var_4], ax
		mov	ax, [bp+var_2]
		add	ax, [di+4]
		dec	ax
		mov	[bp+var_6], ax
		mov	ax, [bp+var_4]
		add	ax, [di+6]
		dec	ax
		mov	[bp+var_8], ax
		push	1
		push	1
		push	[bp+var_8]
		push	[bp+var_6]
		push	[bp+var_4]
		push	[bp+var_2]
		push	si
		push	cs
		call	near ptr sub_127A6
		add	sp, 0Eh
		mov	di, [di+8]

loc_129C4:
		or	di, di
		jnz	short loc_1298A
		pop	di
		pop	si
		leave
		retf
sub_1297A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_129CC		proc far

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [si+5Eh]
		jmp	short loc_129ED

loc_129DC:
		mov	[bp+var_2], di
		mov	di, [di+8]
		push	[bp+var_2]
		call	sub_39C
		add	sp, 2

loc_129ED:
		or	di, di
		jnz	short loc_129DC
		xor	ax, ax
		mov	[si+60h], ax
		mov	[si+5Eh], ax
		pop	di
		pop	si
		leave
		retf
sub_129CC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; GaugeWidget_AllocateRenderBufferWrapper_E0B7 (sub_E0B7 de OPTEST.EXE). Résumé repris de
; OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code
; identique instruction par instruction à GaugeWidget_AllocateRenderBufferWrapper_A3AB5
; (sub_A3AB5 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far, appelle GaugeWidget_AllocateRenderBuffer_A39FA.
; ==============================================================================================
GaugeWidget_AllocateRenderBufferWrapper_129FD		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+0Ah]
		sub	ax, [si+6]
		inc	ax
		push	ax
		mov	ax, [si+8]
		sub	ax, [si+4]
		inc	ax
		push	ax
		push	word ptr [si+6]
		push	word ptr [si+4]
		push	si
		push	cs
		call	near ptr sub_12932
		add	sp, 0Ah
		pop	si
		pop	bp
		retf
GaugeWidget_AllocateRenderBufferWrapper_129FD		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_12A25		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [si+62h]
		jmp	short loc_12A3E

loc_12A32:
		mov	ax, [di]
		cmp	ax, [bp+arg_2]
		jnz	short loc_12A3B
		jmp	short loc_12A42

loc_12A3B:
		mov	di, [di+4]

loc_12A3E:
		or	di, di
		jnz	short loc_12A32

loc_12A42:
		or	di, di
		jnz	short loc_12A6B
		push	6
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	di, ax
		mov	word ptr [di+4], 0
		cmp	word ptr [si+62h], 0
		jnz	short loc_12A62
		mov	[si+62h], di
		jmp	short loc_12A68

loc_12A62:
		mov	bx, [si+64h]
		mov	[bx+4], di

loc_12A68:
		mov	[si+64h], di

loc_12A6B:
		or	di, di
		jz	short loc_12A7A
		mov	ax, [bp+arg_2]
		mov	[di], ax
		mov	ax, [bp+arg_4]
		mov	[di+2], ax

loc_12A7A:
		mov	ax, di
		pop	di
		pop	si
		pop	bp
		retf
sub_12A25		endp

; START OF FUNCTION CHUNK FOR sub_12A25
		pop	di
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_12A25

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_12A84		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		mov	di, [si+62h]
		jmp	short loc_12AE0

loc_12A99:
		mov	ax, [di+2]
		cmp	ax, [bp+arg_2]
		jnz	short loc_12ADA
		mov	ax, [di+4]
		mov	[bp+var_4], ax
		cmp	[bp+var_2], 0
		jz	short loc_12AB6
		mov	bx, [bp+var_2]
		mov	ax, [bp+var_4]
		mov	[bx+4], ax

loc_12AB6:
		cmp	[si+64h], di
		jnz	short loc_12AC1
		mov	ax, [bp+var_2]
		mov	[si+64h], ax

loc_12AC1:
		cmp	[si+62h], di
		jnz	short loc_12ACC
		mov	ax, [di+4]
		mov	[si+62h], ax

loc_12ACC:
		push	di
		call	sub_39C
		add	sp, 2
		mov	di, [bp+var_4]
		jmp	short loc_12AE0

loc_12ADA:
		mov	[bp+var_2], di
		mov	di, [di+4]

loc_12AE0:
		or	di, di
		jnz	short loc_12A99
		pop	di
		pop	si
		leave
		retf
sub_12A84		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_12AE8		proc far

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [si+62h]
		jmp	short loc_12B09

loc_12AF8:
		mov	[bp+var_2], di
		mov	di, [di+4]
		push	[bp+var_2]
		call	sub_39C
		add	sp, 2

loc_12B09:
		or	di, di
		jnz	short loc_12AF8
		xor	ax, ax
		mov	[si+64h], ax
		mov	[si+62h], ax
		pop	di
		pop	si
		leave
		retf
sub_12AE8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_12B19		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	dx, [bp+arg_2]
		mov	di, [si+62h]
		jmp	short loc_12B37

loc_12B29:
		cmp	[di], dx
		jnz	short loc_12B34
		mov	ax, [di+2]
		pop	di
		pop	si
		pop	bp
		retf

loc_12B34:
		mov	di, [di+4]

loc_12B37:
		or	di, di
		jnz	short loc_12B29
		xor	ax, ax
		pop	di
		pop	si
		pop	bp
		retf
sub_12B19		endp

; START OF FUNCTION CHUNK FOR sub_12B19
		pop	di
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_12B19

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_12B45		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	di, di
		jz	short loc_12B71
		push	di
		push	si
		push	cs
		call	near ptr sub_11FC4
		add	sp, 4
		cmp	[bp+arg_4], 0
		jz	short loc_12B6F
		push	di
		push	[bp+arg_4]
		push	si
		push	cs
		call	near ptr sub_12A25
		add	sp, 6

loc_12B6F:
		jmp	short loc_12B7C

loc_12B71:
		push	303Bh
		call	Runtime_FatalErrorHandler_36797
		add	sp, 2

loc_12B7C:
		pop	di
		pop	si
		pop	bp
		retf
sub_12B45		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_12B80		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx+34h]
		add	sp, 2
		push	si
		push	cs
		call	near ptr sub_122DE
		add	sp, 2
		pop	si
		pop	bp
		retf
sub_12B80		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à GaugeWidget_QueryAndFormat_E256 (sub_E256 de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de données
; ou constantes) — à vérifier à GaugeWidget_QueryAndFormat_A3C2C (sub_A3C2C de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, combine
; Joystick_LoadCalibrationSample-like accessor (sub_66DA3, seg163) et
; GaugeWidget_FormatDisplayValue_A3CF6.
; ==============================================================================================
GaugeWidget_QueryAndFormat_12B9C		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	ax, 0C00h
		int	21h

loc_12BAB:
		push	0FFh
		push	6671h
		call	Keyboard_QueryAndDispatch_443C0
		add	sp, 4
		cmp	byte_4F051, 0
		jnz	short loc_12BAB
		push	[bp+arg_2]
		push	0FFFFh
		push	si
		nop
		push	cs
		call	near ptr sub_12C6E
		add	sp, 6
		mov	[bp+var_2], ax
		push	word ptr [si+6Ch]
		push	word ptr [si+6Ah]
		mov	ax, [si+68h]
		sub	ax, [si+6]
		push	ax
		mov	ax, [si+66h]
		sub	ax, [si+4]
		push	ax
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx+28h]
		add	sp, 0Ah
		mov	ax, [bp+var_2]
		pop	si
		leave
		retf
GaugeWidget_QueryAndFormat_12B9C		endp

; START OF FUNCTION CHUNK FOR GaugeWidget_QueryAndFormat_12B9C
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR GaugeWidget_QueryAndFormat_12B9C

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_12BF8		proc far

var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	[bp+arg_8]
		push	si
		push	cs
		call	near ptr sub_12B19
		add	sp, 4
		mov	di, ax
		or	di, di
		jz	short loc_12C50
		mov	ax, [bp+arg_2]
		add	ax, [si+4]
		mov	[bp+var_2], ax
		mov	ax, [bp+arg_4]
		add	ax, [si+6]
		mov	[bp+var_4], ax
		mov	ax, [bp+var_2]
		sub	ax, [di+4]
		mov	[bp+var_6], ax
		mov	ax, [bp+var_4]
		sub	ax, [di+6]
		mov	[bp+var_8], ax
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	[bp+var_8]
		push	[bp+var_6]
		push	di
		mov	bx, [di+0Eh]
		call	dword ptr [bx+28h]
		add	sp, 0Ah
		jmp	short loc_12C6A

loc_12C50:
		cmp	[bp+arg_6], 0
		jz	short loc_12C6A
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr sub_1221E
		add	sp, 0Ah

loc_12C6A:
		pop	di
		pop	si
		leave
		retf
sub_12BF8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_12C6E		proc far

var_C		= word ptr -0Ch
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
		sub	sp, 0Ch
		push	si
		push	di
		mov	si, [bp+arg_0]
		xor	di, di
		mov	word ptr [si+6Ch], 0
		mov	word ptr [si+6Ah], 0
		mov	[bp+var_2], 0
		push	si
		call	sub_143FC
		add	sp, 2
		jmp	loc_12E5C

loc_12C96:
		push	666Ah
		call	TextScroll_FormatAndApply_44826
		add	sp, 2
		cmp	byte_4F04A, 0
		jnz	short loc_12CCB
		push	666Ah
		call	sub_AB45
		add	sp, 2
		mov	ah, 0
		or	ax, ax
		jnz	short loc_12CC9
		push	6671h
		push	666Ah
		call	sub_A981
		add	sp, 4
		jmp	short loc_12CC9

loc_12CC9:
		jmp	short loc_12CCB

loc_12CCB:
		mov	al, byte_4F04A
		mov	ah, 0
		or	ax, ax
		jnz	short loc_12CD7
		jmp	loc_12DC3

loc_12CD7:
		mov	ax, [si+68h]
		mov	[bp+var_4], ax
		mov	ax, word_4F04C
		sar	ax, 1
		mov	[si+66h], ax
		mov	ax, word_4F04E
		mov	[si+68h], ax
		mov	ax, [si+68h]
		sub	[bp+var_4], ax
		mov	al, byte_4F04A
		mov	ah, 0
		cmp	ax, 3
		jz	short loc_12D04
		cmp	[bp+var_4], 0
		jnz	short loc_12D04
		jmp	loc_12DB1

loc_12D04:
		mov	ax, [si+68h]
		sub	ax, [si+6]
		push	ax
		mov	ax, [si+66h]
		sub	ax, [si+4]
		push	ax
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx+20h]
		add	sp, 6
		mov	[bp+var_6], ax
		mov	ax, [bp+var_6]
		cmp	ax, [bp+var_2]
		jz	short loc_12D2C
		mov	ax, 1
		jmp	short loc_12D2E

loc_12D2C:
		xor	ax, ax

loc_12D2E:
		mov	[bp+var_8], ax
		cmp	[bp+var_2], 0
		jz	short loc_12D4C
		cmp	[bp+var_8], 0
		jz	short loc_12D4C
		push	[bp+var_2]
		mov	bx, [bp+var_2]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx+14h]
		add	sp, 2

loc_12D4C:
		cmp	[bp+var_6], 0
		jz	short loc_12D8D
		push	[bp+var_8]
		mov	ax, [si+68h]
		sub	ax, [si+6]
		push	ax
		mov	ax, [si+66h]
		sub	ax, [si+4]
		push	ax
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx+10h]
		add	sp, 8
		push	si
		call	sub_143DD
		add	sp, 2
		mov	ax, [si+6Eh]
		mov	[bp+var_A], ax
		mov	ax, [bp+var_A]
		mov	word_4F7D6, ax
		push	si
		call	sub_143FC
		add	sp, 2
		jmp	short loc_12DAB

loc_12D8D:
		push	si
		call	sub_143DD
		add	sp, 2
		mov	ax, [si+70h]
		mov	[bp+var_C], ax
		mov	ax, [bp+var_C]
		mov	word_4F7D6, ax
		push	si
		call	sub_143FC
		add	sp, 2

loc_12DAB:
		mov	ax, [bp+var_6]
		mov	[bp+var_2], ax

loc_12DB1:
		mov	al, byte_4F04A
		mov	ah, 0
		cmp	ax, 1
		jnz	short loc_12DC3
		mov	al, byte_4F04B
		mov	ah, 0
		mov	[si+6Ah], ax

loc_12DC3:
		mov	al, byte_4F051
		mov	ah, 0
		cmp	ax, 2
		jnz	short loc_12E1F
		mov	ax, 0C00h
		int	21h
		mov	word ptr [si+6Ah], 0
		mov	al, byte_4F052
		mov	ah, 0
		mov	dx, word_4BC8C
		shl	dx, 8
		or	dx, ax
		mov	[si+6Ch], dx
		push	word ptr [si+6Ch]
		push	si
		push	cs
		call	near ptr sub_12B19
		add	sp, 4
		mov	di, ax
		or	di, di
		jnz	short loc_12E1F
		mov	ax, [si+68h]
		sub	ax, [si+6]
		push	ax
		mov	ax, [si+66h]
		sub	ax, [si+4]
		push	ax
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx+24h]
		add	sp, 6
		mov	di, ax
		or	di, di
		jnz	short loc_12E1F
		cmp	[bp+arg_4], 0
		jz	short loc_12E1F
		jmp	short loc_12E69

loc_12E1F:
		or	di, di
		jnz	short loc_12E53
		mov	al, byte_4F04A
		mov	ah, 0
		cmp	ax, 1
		jnz	short loc_12E53
		mov	ax, [si+68h]
		sub	ax, [si+6]
		push	ax
		mov	ax, [si+66h]
		sub	ax, [si+4]
		push	ax
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx+24h]
		add	sp, 6
		mov	di, ax
		or	di, di
		jnz	short loc_12E53
		cmp	[bp+arg_4], 0
		jz	short loc_12E53
		jmp	short loc_12E69

loc_12E53:
		cmp	[bp+arg_2], 0FFFFh
		jz	short loc_12E5C
		dec	[bp+arg_2]

loc_12E5C:
		or	di, di
		jnz	short loc_12E69
		cmp	[bp+arg_2], 0
		jz	short loc_12E69
		jmp	loc_12C96

loc_12E69:
		mov	ax, di
		pop	di
		pop	si
		leave
		retf
sub_12C6E		endp

; START OF FUNCTION CHUNK FOR sub_12C6E
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_12C6E

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_12E73		proc far

var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 20h
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	si
		call	sub_143DD
		add	sp, 2
		mov	ax, [si+4]
		mov	[bp+var_2], ax
		mov	ax, [si+6]
		mov	[bp+var_4], ax
		mov	ax, [si+8]
		mov	[bp+var_6], ax
		mov	ax, [si+0Ah]
		mov	[bp+var_8], ax
		mov	ax, [bp+var_2]
		mov	[si+3Bh], ax
		mov	ax, [bp+var_4]
		mov	[si+3Dh], ax
		mov	ax, [bp+var_6]
		mov	[si+3Fh], ax
		mov	ax, [bp+var_8]
		mov	[si+41h], ax
		mov	ax, [si+3Fh]
		sub	ax, [si+3Bh]
		inc	ax
		mov	dx, [si+41h]
		sub	dx, [si+3Dh]
		inc	dx
		imul	dx
		mov	di, ax
		push	0
		push	2
		push	6C14h
		call	Memory_TypedAllocDispatchC_329EC
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 6
		mov	[bp+var_C], eax
		push	0
		push	3
		push	6C14h
		call	Memory_TypedAllocDispatchC_329EC
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 6
		mov	[bp+var_10], eax
		cmp	byte ptr [si+4Fh], 3
		jnz	short loc_12F15
		movzx	eax, di
		cmp	eax, [bp+var_C]
		jle	short loc_12F15
		mov	byte ptr [si+4Fh], 2

loc_12F15:
		cmp	byte ptr [si+4Fh], 4
		jnz	short loc_12F29
		movzx	eax, di
		cmp	eax, [bp+var_10]
		jle	short loc_12F29
		mov	byte ptr [si+4Fh], 2

loc_12F29:
		cmp	byte ptr [si+4Fh], 1
		jnz	short loc_12F43
		movzx	eax, di
		cmp	eax, [bp+var_10]
		jle	short loc_12F3F
		mov	byte ptr [si+4Fh], 2
		jmp	short loc_12F43

loc_12F3F:
		mov	byte ptr [si+4Fh], 4

loc_12F43:
		mov	al, [si+4Fh]
		mov	ah, 0
		mov	bx, ax
		cmp	bx, 4
		jbe	short loc_12F52
		jmp	loc_130AC

loc_12F52:
		shl	bx, 1
		jmp	cs:off_130BB[bx]	; switch jump

loc_12F59:
		movzx	eax, di
		mov	[bp+var_14], eax
		push	1
		push	0
		push	2
		push	large [bp+var_14]
		push	6C14h
		call	Memory_TypedFreeWrapper_32871
		add	sp, 0Ch
		mov	word ptr [bp+var_18+2], dx
		mov	word ptr [bp+var_18], ax
		mov	eax, [bp+var_18]
		mov	[si+45h], eax
		mov	byte ptr [si+49h], 2
		mov	byte ptr [si+4Ah], 1
		mov	dword ptr [si+4Bh], 0
		mov	eax, [bp+var_14]
		mov	[si+4Bh], eax
		push	0
		mov	al, [si+49h]
		push	ax
		push	word ptr [si+47h]
		push	word ptr [si+45h]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		or	ax, dx
		jz	short loc_12FF2
		mov	ax, si
		add	ax, 37h
		jz	short loc_12FC5
		mov	ax, si
		add	ax, 3Bh
		jmp	short loc_12FCA

loc_12FC5:
		mov	ax, si
		add	ax, 37h

loc_12FCA:
		push	ax
		push	0
		mov	al, [si+49h]
		push	ax
		push	word ptr [si+47h]
		push	word ptr [si+45h]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	word_4D36E
		call	Surface_SaveRect_392F6
		add	sp, 8
		jmp	short loc_12FF6

loc_12FF2:
		mov	byte ptr [si+4Fh], 0

loc_12FF6:
		jmp	loc_130AE

loc_12FF9:
		movzx	eax, di
		mov	[bp+var_1C], eax
		push	1
		push	0
		push	3
		push	large [bp+var_1C]
		push	6C14h
		call	Memory_TypedFreeWrapper_32871
		add	sp, 0Ch
		mov	word ptr [bp+var_20+2], dx
		mov	word ptr [bp+var_20], ax
		mov	eax, [bp+var_20]
		mov	[si+45h], eax
		mov	byte ptr [si+49h], 3
		mov	byte ptr [si+4Ah], 1
		mov	dword ptr [si+4Bh], 0
		mov	eax, [bp+var_1C]
		mov	[si+4Bh], eax
		push	0
		mov	al, [si+49h]
		push	ax
		push	word ptr [si+47h]
		push	word ptr [si+45h]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		or	ax, dx
		jz	short loc_13092
		mov	ax, si
		add	ax, 37h
		jz	short loc_13065
		mov	ax, si
		add	ax, 3Bh
		jmp	short loc_1306A

loc_13065:
		mov	ax, si
		add	ax, 37h

loc_1306A:
		push	ax
		push	0
		mov	al, [si+49h]
		push	ax
		push	word ptr [si+47h]
		push	word ptr [si+45h]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	word_4D36E
		call	Surface_SaveRect_392F6
		add	sp, 8
		jmp	short loc_13096

loc_13092:
		mov	byte ptr [si+4Fh], 0

loc_13096:
		jmp	short loc_130AE

loc_13098:
		push	si
		push	305Dh
		mov	ax, si
		add	ax, 37h
		push	ax
		call	sub_47FE0
		add	sp, 6
		jmp	short loc_130AE

loc_130AC:
		jmp	short loc_130AE

loc_130AE:
		push	si
		call	sub_143FC
		add	sp, 2
		pop	di
		pop	si
		leave
		retf
sub_12E73		endp

; START OF FUNCTION CHUNK FOR sub_12E73
off_130BB	dw offset loc_130AC
		dw offset loc_130AC
		dw offset loc_13098
		dw offset loc_12F59
		dw offset loc_12FF9
; END OF FUNCTION CHUNK FOR sub_12E73

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_130C5		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		push	si
		call	sub_143DD
		add	sp, 2
		mov	al, [si+4Fh]
		mov	ah, 0
		mov	bx, ax
		cmp	bx, 4
		jbe	short loc_130E7
		jmp	loc_1321B

loc_130E7:
		shl	bx, 1
		jmp	cs:off_13239[bx]	; switch jump

loc_130EE:
		push	0
		mov	al, [si+49h]
		push	ax
		push	word ptr [si+47h]
		push	word ptr [si+45h]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		or	ax, dx
		jz	short loc_1317C
		mov	ax, si
		add	ax, 37h
		jz	short loc_13117
		mov	ax, si
		add	ax, 3Bh
		jmp	short loc_1311C

loc_13117:
		mov	ax, si
		add	ax, 37h

loc_1311C:
		push	ax
		push	0
		mov	al, [si+49h]
		push	ax
		push	word ptr [si+47h]
		push	word ptr [si+45h]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	word_4D36E
		call	Surface_RestoreRect_38CDA
		add	sp, 8
		cmp	byte ptr [si+4Ah], 0
		jz	short loc_13168
		cmp	dword ptr [si+45h], 0
		jz	short loc_13168
		push	0
		mov	al, [si+49h]
		push	ax
		mov	ax, si
		add	ax, 45h
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_13168

loc_13168:
		mov	dword ptr [si+45h], 0
		mov	byte ptr [si+4Ah], 0
		mov	dword ptr [si+4Bh], 0

loc_1317C:
		jmp	loc_1322D

loc_1317F:
		push	0
		mov	al, [si+49h]
		push	ax
		push	word ptr [si+47h]
		push	word ptr [si+45h]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		cmp	[bp+var_4], 0
		jz	short loc_13203
		mov	ax, si
		add	ax, 37h
		jz	short loc_131B1
		mov	ax, si
		add	ax, 3Bh
		jmp	short loc_131B6

loc_131B1:
		mov	ax, si
		add	ax, 37h

loc_131B6:
		push	ax
		push	word ptr [bp+var_4+2]
		push	word ptr [bp+var_4]
		push	word_4D36E
		call	Surface_RestoreRect_38CDA
		add	sp, 8
		cmp	byte ptr [si+4Ah], 0
		jz	short loc_131EF
		cmp	dword ptr [si+45h], 0
		jz	short loc_131EF
		push	0
		mov	al, [si+49h]
		push	ax
		mov	ax, si
		add	ax, 45h
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_131EF

loc_131EF:
		mov	dword ptr [si+45h], 0
		mov	byte ptr [si+4Ah], 0
		mov	dword ptr [si+4Bh], 0

loc_13203:
		jmp	short loc_1322D

loc_13205:
		push	si
		push	3069h
		mov	ax, si
		add	ax, 37h
		push	ax
		call	sub_47FE5
		add	sp, 6
		jmp	short loc_1322D

loc_13219:
		jmp	short loc_1322D

loc_1321B:
		mov	al, [si+5Ch]
		push	ax
		mov	ax, si
		add	ax, 37h
		push	ax
		call	sub_37B08
		add	sp, 4

loc_1322D:
		push	si
		call	sub_143FC
		add	sp, 2
		pop	si
		leave
		retf
sub_130C5		endp

; START OF FUNCTION CHUNK FOR sub_130C5
off_13239	dw offset loc_13219
		dw offset loc_1321B
		dw offset loc_13205
		dw offset loc_130EE
		dw offset loc_1317F
; END OF FUNCTION CHUNK FOR sub_130C5

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_13243		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	di
		push	si
		push	cs
		call	near ptr sub_12A84
		add	sp, 4
		push	di
		push	si
		push	cs
		call	near ptr sub_11F44
		add	sp, 4
		pop	di
		pop	si
		pop	bp
		retf
sub_13243		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_13264		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		cmp	[bp+arg_4], 0
		jz	short loc_13293
		push	si
		call	sub_143DD
		add	sp, 2
		push	word ptr [si+5Ch]
		push	di
		call	sub_150B5
		add	sp, 4
		push	si
		call	sub_143FC
		add	sp, 2

loc_13293:
		push	di
		push	si
		push	cs
		call	near ptr sub_13243
		add	sp, 4
		or	di, di
		jz	short loc_132AE
		push	3
		push	di
		mov	bx, [di+0Eh]
		call	dword ptr [bx+30h]
		add	sp, 4
		jmp	short loc_132AE

loc_132AE:
		pop	di
		pop	si
sub_13264		endp
seg032		ends
