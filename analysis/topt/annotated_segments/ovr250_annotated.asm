ovr250		segment	para public 'OVERLAY' use16
		assume cs:ovr250
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BFEB0		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+2Ch]
		mov	bx, [si+2Ah]
		mov	[bx], ax
		pop	si
		pop	bp
		retf
sub_BFEB0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; InfoWidget_CopyFieldB_C8242 (sub_C8242 de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à InfoWidget_CopyFieldB_A4582 (sub_A4582 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, copie conditionnellement un
; champ (+0x20) vers un pointeur cible (+0x1E) si un flag (arg_8) est posé.
; ==============================================================================================
InfoWidget_CopyFieldB_BFEC2		proc far

arg_0		= word ptr  6
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	[bp+arg_8], 0
		jz	short loc_BFED7
		mov	ax, [si+20h]
		mov	bx, [si+1Eh]
		mov	[bx], ax

loc_BFED7:
		pop	si
		pop	bp
		retf
InfoWidget_CopyFieldB_BFEC2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BFEDA		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+2Ch]
		mov	bx, [si+2Ah]
		mov	[bx], ax
		pop	si
		pop	bp
		retf
sub_BFEDA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BFEEC		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		call	sub_143DD
		add	sp, 2
		mov	al, [si+10h]
		shr	ax, 5
		and	ax, 1
		or	ax, ax
		jz	short loc_BFF39
		push	word ptr [si+2Eh]
		push	0
		mov	al, [si+22h]
		push	ax
		push	word ptr [si+20h]
		push	word ptr [si+1Eh]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	word ptr [si+6]
		push	word ptr [si+4]
		push	word_4D36E
		call	sub_38514
		add	sp, 0Ch
		jmp	short loc_BFF67

loc_BFF39:
		push	word ptr [si+28h]
		push	0
		mov	al, [si+22h]
		push	ax
		push	word ptr [si+20h]
		push	word ptr [si+1Eh]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	word ptr [si+6]
		push	word ptr [si+4]
		push	word_4D36E
		call	sub_38514
		add	sp, 0Ch

loc_BFF67:
		push	si
		call	sub_143FC
		add	sp, 2
		pop	si
		pop	bp
		retf
sub_BFEEC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BFF73		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	0FFFFh
		push	0FFFFh
		push	word ptr [si+2Ch]
		push	word ptr [si+2Ah]
		mov	bx, [si+2Ah]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx+0Ch]
		add	sp, 8
		pop	si
		pop	bp
		retf
sub_BFF73		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BFF93		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		call	sub_143DD
		add	sp, 2
		mov	al, [si+10h]
		shr	ax, 5
		and	ax, 1
		or	ax, ax
		jz	short loc_BFFE0
		push	word ptr [si+2Eh]
		push	0
		mov	al, [si+22h]
		push	ax
		push	word ptr [si+20h]
		push	word ptr [si+1Eh]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	word ptr [si+6]
		push	word ptr [si+4]
		push	word_4D36E
		call	sub_38514
		add	sp, 0Ch
		jmp	short loc_C000E

loc_BFFE0:
		push	word ptr [si+28h]
		push	0
		mov	al, [si+22h]
		push	ax
		push	word ptr [si+20h]
		push	word ptr [si+1Eh]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	word ptr [si+6]
		push	word ptr [si+4]
		push	word_4D36E
		call	sub_38514
		add	sp, 0Ch

loc_C000E:
		push	si
		call	sub_143FC
		add	sp, 2
		pop	si
		pop	bp
		retf
sub_BFF93		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_C001A		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	0FFFFh
		push	0FFFFh
		push	word ptr [si+2Ch]
		push	word ptr [si+2Ah]
		mov	bx, [si+2Ah]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx+0Ch]
		add	sp, 8
		pop	si
		pop	bp
		retf
sub_C001A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_C003A		proc far

arg_0		= word ptr  6
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, 0FFFFh
		cmp	[bp+arg_6], 1
		jnz	short loc_C0050
		mov	di, [si+2Ch]
		jmp	short loc_C0053

loc_C0050:
		mov	di, [si+30h]

loc_C0053:
		push	0FFFFh
		push	0FFFFh
		push	di
		push	word ptr [si+2Ah]
		mov	bx, [si+2Ah]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx+0Ch]
		add	sp, 8
		pop	di
		pop	si
		pop	bp
		retf
sub_C003A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_C006B		proc far

var_18		= word ptr -18h
var_16		= word ptr -16h
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 18h
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+4]
		add	ax, [si+16h]
		add	ax, [si+18h]
		mov	[bp+var_2], ax
		mov	ax, [si+6]
		add	ax, [si+16h]
		add	ax, [si+18h]
		mov	[bp+var_4], ax
		mov	ax, [si+16h]
		add	ax, [si+18h]
		add	ax, [si+2Ah]
		mov	dl, [si+10h]
		shr	dx, 5
		and	dx, 1
		add	ax, dx
		mov	[bp+var_6], ax
		mov	ax, [si+16h]
		add	ax, [si+18h]
		mov	dl, [si+10h]
		shr	dx, 5
		and	dx, 1
		add	ax, dx
		mov	[bp+var_8], ax
		mov	ax, word_4BD04
		add	ax, 2
		mov	[bp+var_A], ax
		mov	[bp+var_18], 0
		mov	[bp+var_16], 0
		push	[bp+var_A]
		lea	ax, [bp+var_18]
		push	ax
		call	TextFormat_ApplyStyleAttribute_357D1
		add	sp, 4
		push	si
		mov	ax, word_4BD04
		add	ax, 2
		push	ax
		call	TextFormat_ApplyStyleAttribute_357D1
		add	sp, 4
		push	si
		call	sub_143DD
		add	sp, 2
		mov	al, [si+10h]
		shr	ax, 5
		and	ax, 1
		or	ax, ax
		jz	short loc_C0130
		push	word ptr [si+34h]
		push	0
		mov	al, [si+22h]
		push	ax
		push	word ptr [si+20h]
		push	word ptr [si+1Eh]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	word ptr [si+6]
		push	word ptr [si+4]
		push	word_4D36E
		call	sub_38514
		add	sp, 0Ch
		jmp	short loc_C015E

loc_C0130:
		push	word ptr [si+28h]
		push	0
		mov	al, [si+22h]
		push	ax
		push	word ptr [si+20h]
		push	word ptr [si+1Eh]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	word ptr [si+6]
		push	word ptr [si+4]
		push	word_4D36E
		call	sub_38514
		add	sp, 0Ch

loc_C015E:
		push	word_4BD04
		push	0FFh
		mov	ax, [si+2Eh]
		add	ax, [si+28h]
		push	ax
		push	[bp+var_8]
		push	[bp+var_6]
		call	PaletteScreen_DispatchWidgetLayoutB_15EE7
		add	sp, 0Ah
		push	si
		call	sub_143FC
		add	sp, 2
		lea	ax, [bp+var_18]
		push	ax
		mov	ax, word_4BD04
		add	ax, 2
		push	ax
		call	TextFormat_ApplyStyleAttribute_357D1
		add	sp, 4
		lea	ax, [bp+var_18]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		pop	si
		leave
		retf
sub_C006B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_C01A5		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	0FFFFh
		push	0FFFFh
		push	word ptr [si+32h]
		push	word ptr [si+30h]
		mov	bx, [si+30h]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx+0Ch]
		add	sp, 8
		pop	si
		pop	bp
		retf
sub_C01A5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_C01C5		proc far

arg_0		= word ptr  6
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, 0FFFFh
		cmp	[bp+arg_6], 1
		jnz	short loc_C01DB
		mov	di, [si+32h]
		jmp	short loc_C01DE

loc_C01DB:
		mov	di, [si+36h]

loc_C01DE:
		push	0FFFFh
		push	0FFFFh
		push	di
		push	word ptr [si+30h]
		mov	bx, [si+30h]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx+0Ch]
		add	sp, 8
		pop	di
		pop	si
		pop	bp
		retf
sub_C01C5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_C01F6		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		call	sub_14D4C
		add	sp, 2
		push	word ptr [si+2Eh]
		push	si
		call	sub_14CC6
		add	sp, 4
		pop	si
		pop	bp
		retf
sub_C01F6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_C0215		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+2Ch], 0
		jge	short loc_C0236
		mov	bx, [si+2Ah]
		mov	ax, [bx]
		cmp	ax, [si+2Eh]
		jle	short loc_C0234
		mov	ax, [si+2Ch]
		mov	bx, [si+2Ah]
		add	[bx], ax

loc_C0234:
		jmp	short loc_C0248

loc_C0236:
		mov	bx, [si+2Ah]
		mov	ax, [bx]
		cmp	ax, [si+30h]
		jge	short loc_C0248
		mov	ax, [si+2Ch]
		mov	bx, [si+2Ah]
		add	[bx], ax

loc_C0248:
		pop	si
		pop	bp
		retf
sub_C0215		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; InfoWidget_Method_DispatchField2A_C85CB (sub_C85CB de OPTEST.EXE). Résumé repris de
; OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code
; identique instruction par instruction à InfoWidget_Method_DispatchField2A_A4843 (sub_A4843
; de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; dispatch vtable via champ [si+0x2A].
; ==============================================================================================
InfoWidget_Method_DispatchField2A_C024B		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		call	dword ptr [si+2Ah]
		pop	si
		pop	bp
		retf
InfoWidget_Method_DispatchField2A_C024B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_C0258		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	bx, [si+2Ah]
		mov	ax, [bx]
		neg	ax
		sbb	ax, ax
		inc	ax
		mov	bx, [si+2Ah]
		mov	[bx], ax
		pop	si
		pop	bp
		retf
sub_C0258		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_C0271		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	al, [si+10h]
		shr	ax, 5
		and	ax, 1
		or	ax, ax
		jz	short loc_C028F
		mov	ax, [si+2Ch]
		mov	bx, [si+2Ah]
		mov	[bx], ax
		jmp	short loc_C0297

loc_C028F:
		mov	ax, [si+2Eh]
		mov	bx, [si+2Ah]
		mov	[bx], ax

loc_C0297:
		pop	si
		pop	bp
		retf
sub_C0271		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_C029A		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	word_4BCB8
		push	si
		call	sub_150B5
		add	sp, 4
		push	word_4BC90
		push	si
		call	sub_1505C
		add	sp, 4
		push	word_4BC90
		mov	ax, [si+1Ch]
		add	ax, 0FFFCh
		push	ax
		push	8
		push	2
		push	3
		push	si
		call	sub_1510E
		add	sp, 0Ch
		mov	di, word_4BCB4
		mov	bx, [si+1Eh]
		cmp	byte ptr [bx], 0
		jz	short loc_C034E
		mov	di, word_4BC90
		push	word_4BCAE
		mov	ax, [si+1Ch]
		add	ax, 0FFFDh
		push	ax
		push	9
		push	2
		push	3
		push	si
		call	sub_15200
		add	sp, 0Ch
		push	word_4BCAE
		mov	ax, [si+1Ch]
		add	ax, 0FFFDh
		push	ax
		push	0Ah
		push	2
		push	4
		push	si
		call	sub_15200
		add	sp, 0Ch
		push	word_4BCAE
		mov	ax, [si+1Ch]
		add	ax, 0FFFDh
		push	ax
		push	3
		push	2
		push	9
		push	si
		call	sub_15200
		add	sp, 0Ch
		push	word_4BCAE
		mov	ax, [si+1Ch]
		add	ax, 0FFFDh
		push	ax
		push	4
		push	2
		push	0Ah
		push	si
		call	sub_15200
		add	sp, 0Ch

loc_C034E:
		push	si
		call	sub_143DD
		add	sp, 2
		push	word_4BD04
		push	di
		push	word ptr [si+20h]
		mov	ax, [si+6]
		add	ax, 2
		push	ax
		mov	ax, [si+4]
		add	ax, 0Dh
		push	ax
		call	PaletteScreen_DispatchWidgetLayoutB_15EE7
		add	sp, 0Ah
		push	si
		call	sub_143FC
		add	sp, 2
		pop	di
		pop	si
		pop	bp
		retf
sub_C029A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_C0382		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	bx, [si+1Eh]
		cmp	byte ptr [bx], 0
		jz	short loc_C0399
		mov	bx, [si+1Eh]
		mov	byte ptr [bx], 0
		jmp	short loc_C039F

loc_C0399:
		mov	bx, [si+1Eh]
		mov	byte ptr [bx], 1

loc_C039F:
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx+18h]
		add	sp, 2
		pop	si
		pop	bp
		retf
sub_C0382		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_C03AC		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		call	sub_143DD
		add	sp, 2
		mov	bx, [si+1Eh]
		cmp	byte ptr [bx], 0
		jz	short loc_C03F4
		push	word ptr [si+2Ch]
		push	0
		mov	al, [si+24h]
		push	ax
		push	word ptr [si+22h]
		push	word ptr [si+20h]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	word ptr [si+6]
		push	word ptr [si+4]
		push	word_4D36E
		call	sub_38514
		add	sp, 0Ch
		jmp	short loc_C0422

loc_C03F4:
		push	word ptr [si+2Ah]
		push	0
		mov	al, [si+24h]
		push	ax
		push	word ptr [si+22h]
		push	word ptr [si+20h]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	word ptr [si+6]
		push	word ptr [si+4]
		push	word_4D36E
		call	sub_38514
		add	sp, 0Ch

loc_C0422:
		push	si
		call	sub_143FC
		add	sp, 2
		pop	si
		pop	bp
		retf
sub_C03AC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_C042E		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	bx, [si+1Eh]
		cmp	byte ptr [bx], 0
		jz	short loc_C0445
		mov	bx, [si+1Eh]
		mov	byte ptr [bx], 0
		jmp	short loc_C044B

loc_C0445:
		mov	bx, [si+1Eh]
		mov	byte ptr [bx], 1

loc_C044B:
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx+18h]
		add	sp, 2
		pop	si
		pop	bp
		retf
sub_C042E		endp
ovr250		ends
