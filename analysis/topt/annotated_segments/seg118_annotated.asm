seg118		segment	para public 'CODE' use16
		assume cs:seg118
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_35D92		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	dx, [bp+arg_2]
		or	si, si
		jz	short loc_35DDF
		mov	word ptr [si], 1B4h
		mov	di, word_4D392
		cmp	word_4D392, si
		jnz	short loc_35DCE
		mov	bx, word_4D392
		mov	ax, [bx+2]
		mov	word_4D392, ax
		jmp	short loc_35DD2

loc_35DBB:
		mov	cx, [di+2]
		cmp	cx, si
		jnz	short loc_35DCC
		mov	bx, cx
		mov	ax, [bx+2]
		mov	[di+2], ax
		jmp	short loc_35DD2

loc_35DCC:
		mov	di, cx

loc_35DCE:
		or	di, di
		jnz	short loc_35DBB

loc_35DD2:
		test	dx, 1
		jz	short loc_35DDF
		push	si
		call	sub_39C
		pop	cx

loc_35DDF:
		pop	di
		pop	si
		pop	bp
		retf
sub_35D92		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_35DE3		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_35DE3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_35DEB		proc far
		push	bp
		mov	bp, sp
		push	si
		push	6C30h
		call	sub_35F0F
		pop	cx
		mov	si, word_4D392
		jmp	short loc_35E08

loc_35DFE:
		push	si
		mov	bx, [si]
		call	dword ptr [bx+4]
		pop	cx
		mov	si, [si+2]

loc_35E08:
		or	si, si
		jnz	short loc_35DFE
		pop	si
		pop	bp
		retf
sub_35DEB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; PagedResourceC_RefreshAndFinalize_2FD7D (sub_2FD7D de OPTEST.EXE). Résumé repris de
; OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code
; identique instruction par instruction à PagedResourceC_RefreshAndFinalize_5F508 (sub_5F508
; de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; appelle PagedResourceC_RefreshAllInstances_5F4E0 puis sub_3C2. Référencée par sub_14279 et
; sub_67517.
; ==============================================================================================
PagedResourceC_RefreshAndFinalize_35E0F		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	cs
		call	near ptr sub_35DEB
		push	[bp+arg_0]
		call	CRT_Exit
		pop	cx
		pop	bp
		retf
PagedResourceC_RefreshAndFinalize_35E0F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_35E21		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		push	cs
		call	near ptr sub_35DEB
		cmp	si, word_4CE02
		jz	short loc_35E49
		lea	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		push	ax
		push	si
		push	word_4CE02
		call	CRT_Msg_Sprintf2
		add	sp, 6

loc_35E49:
		push	word_4CE02
sub_35E21		endp

; START OF FUNCTION CHUNK FOR sub_35E21
		db 9Ah
		add	[bx+si], al
; END OF FUNCTION CHUNK FOR sub_35E21
seg118		ends
