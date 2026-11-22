seg043		segment	para public 'CODE' use16
		assume cs:seg043
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1BEB1		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_1BECA
		push	10h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_1BEE9

loc_1BECA:
		mov	dword ptr [si+2], 0
		mov	byte ptr [si+6], 2
		mov	byte ptr [si+7], 0
		mov	dword ptr [si+8], 0
		push	si
		nop
		push	cs
		call	near ptr sub_1BF30
		pop	cx

loc_1BEE9:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_1BEB1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1BEEE		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_1BF07
		push	10h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_1BF2B

loc_1BF07:
		mov	dword ptr [si+2], 0
		mov	byte ptr [si+6], 2
		mov	byte ptr [si+7], 0
		mov	dword ptr [si+8], 0
		push	[bp+arg_2]
		push	si
		nop
		push	cs
		call	near ptr sub_1BF47
		add	sp, 4

loc_1BF2B:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_1BEEE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1BF30		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	word ptr [si+0Ch], 0
		mov	word ptr [si], 0
		mov	byte ptr [si+0Fh], 0
		pop	si
		pop	bp
		retf
sub_1BF30		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1BF47		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		push	cs
		call	near ptr sub_1BF30
		pop	cx
		mov	ax, [bp+arg_2]
		mov	[si], ax
		pop	si
		pop	bp
		retf
sub_1BF47		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE 2026-11-11. FORM DAMG du cockpit : DATA = entrées de 13 octets (6 mots, un octet),
; rangées sur 14 octets (+0Dh mis à 0), nombre en +0Eh ; SHAP = PAK d'images (+2).
; ==============================================================================================
Cockpit_LoadDamage_1BF5C		proc far

var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= byte ptr -0Ch
var_A		= dword ptr -0Ah
var_6		= dword ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 18h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr sub_1BF47
		add	sp, 4
		push	0
		push	large 41544144h
		push	[bp+arg_4]
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jnz	short loc_1BF91
		jmp	loc_1C05E

loc_1BF91:
		mov	bx, [bp+arg_4]
		mov	eax, [bx+72h]
		mov	ebx, 0Dh
		cdq
		idiv	ebx
		mov	[bp+var_2], ax
		push	seg seg043
		push	offset sub_1C189
		push	1
		push	ax
		push	large 0E0000h
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		mov	[si+0Ch], ax
		xor	di, di
		jmp	loc_1C056

loc_1BFC5:
		push	large 0Dh
		push	ss
		lea	ax, [bp+var_18]
		push	ax
		push	[bp+arg_4]
		call	ResourceRecord_ReadFieldGroupA_6DA92
		add	sp, 0Ah
		mov	ax, di
		imul	ax, ax, 0Eh
		mov	bx, [si+0Ch]
		add	bx, ax
		mov	ax, [bp+var_18]
		mov	[bx], ax
		mov	ax, di
		imul	ax, ax, 0Eh
		mov	bx, [si+0Ch]
		add	bx, ax
		mov	ax, [bp+var_16]
		mov	[bx+2], ax
		mov	ax, di
		imul	ax, ax, 0Eh
		mov	bx, [si+0Ch]
		add	bx, ax
		mov	ax, [bp+var_14]
		mov	[bx+4], ax
		mov	ax, di
		imul	ax, ax, 0Eh
		mov	bx, [si+0Ch]
		add	bx, ax
		mov	ax, [bp+var_12]
		mov	[bx+6], ax
		mov	ax, di
		imul	ax, ax, 0Eh
		mov	bx, [si+0Ch]
		add	bx, ax
		mov	ax, [bp+var_10]
		mov	[bx+8], ax
		mov	ax, di
		imul	ax, ax, 0Eh
		mov	bx, [si+0Ch]
		add	bx, ax
		mov	ax, [bp+var_E]
		mov	[bx+0Ah], ax
		mov	ax, di
		imul	ax, ax, 0Eh
		mov	bx, [si+0Ch]
		add	bx, ax
		mov	al, [bp+var_C]
		mov	[bx+0Ch], al
		mov	ax, di
		imul	ax, ax, 0Eh
		mov	bx, [si+0Ch]
		add	bx, ax
		mov	byte ptr [bx+0Dh], 0
		inc	di

loc_1C056:
		cmp	di, [bp+var_2]
		jge	short loc_1C05E
		jmp	loc_1BFC5

loc_1C05E:
		push	0
		push	large 50414853h
		push	[bp+arg_4]
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_1C0DB
		mov	bx, [bp+arg_4]
		mov	eax, [bx+72h]
		mov	[bp+var_6], eax
		push	1
		push	0
		push	3
		push	eax
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	word ptr [bp+var_A+2], dx
		mov	word ptr [bp+var_A], ax
		mov	eax, [bp+var_A]
		mov	[si+2], eax
		mov	byte ptr [si+6], 3
		mov	byte ptr [si+7], 1
		mov	dword ptr [si+8], 0
		mov	eax, [bp+var_6]
		mov	[si+8], eax
		push	0
		mov	al, [si+6]
		push	ax
		push	large [si+2]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+arg_4]
		call	ResourceRecord_ReadDwordFieldB_6DB78
		add	sp, 6

loc_1C0DB:
		mov	al, byte ptr [bp+var_2]
		mov	[si+0Eh], al
		mov	byte ptr [si+0Fh], 0
		pop	di
		pop	si
		leave
		retf
Cockpit_LoadDamage_1BF5C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1C0E9		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jnz	short loc_1C0FB
		jmp	loc_1C185

loc_1C0FB:
		push	word ptr [si+0Ch]
		call	sub_3B2
		pop	cx
		cmp	byte ptr [si+7], 0
		jz	short loc_1C12A
		cmp	dword ptr [si+2], 0
		jz	short loc_1C12A
		push	0
		mov	al, [si+6]
		push	ax
		mov	ax, si
		add	ax, 2
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_1C12A

loc_1C12A:
		mov	dword ptr [si+2], 0
		mov	byte ptr [si+7], 0
		mov	dword ptr [si+8], 0
		cmp	byte ptr [si+7], 0
		jz	short loc_1C164
		cmp	dword ptr [si+2], 0
		jz	short loc_1C164
		push	0
		mov	al, [si+6]
		push	ax
		mov	ax, si
		add	ax, 2
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_1C164

loc_1C164:
		mov	dword ptr [si+2], 0
		mov	byte ptr [si+7], 0
		mov	dword ptr [si+8], 0
		test	di, 1
		jz	short loc_1C185
		push	si
		call	sub_3B2
		pop	cx

loc_1C185:
		pop	di
		pop	si
		pop	bp
		retf
sub_1C0E9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1C189		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_1C1A2
		push	0Eh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_1C1D0

loc_1C1A2:
		push	seg seg043
		push	offset sub_1C1D5
		push	large 10003h
		push	4
		push	si
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		mov	byte ptr [si+0Dh], 0
		xor	ax, ax
		mov	[si+0Ah], ax
		mov	[si+8], ax
		mov	[si+6], ax
		mov	[si+4], ax
		mov	[si+2], ax
		mov	[si], ax

loc_1C1D0:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_1C189		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1C1D5		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		or	dx, dx
		jnz	short loc_1C1EB
sub_1C1D5		endp

; START OF FUNCTION CHUNK FOR sub_1C1D5
		db 6Ah
; END OF FUNCTION CHUNK FOR sub_1C1D5
seg043		ends
