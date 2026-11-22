seg119		segment	para public 'CODE' use16
		assume cs:seg119
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 46h, 40h, 0ECh, 0A8h, 8, 75h, 0FBh, 0ECh, 0A8h, 8, 74h, 0FBh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_47DAD		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	dx, [bp+arg_2]
		or	si, si
		jz	short loc_47DFA
		mov	word ptr [si], 96Dh
		mov	di, word_5DD68
		cmp	word_5DD68, si
		jnz	short loc_47DE9
		mov	bx, word_5DD68
		mov	ax, [bx+2]
		mov	word_5DD68, ax
		jmp	short loc_47DED

loc_47DD6:
		mov	cx, [di+2]
		cmp	cx, si
		jnz	short loc_47DE7
		mov	bx, cx
		mov	ax, [bx+2]
		mov	[di+2], ax
		jmp	short loc_47DED

loc_47DE7:
		mov	di, cx

loc_47DE9:
		or	di, di
		jnz	short loc_47DD6

loc_47DED:
		test	dx, 1
		jz	short loc_47DFA
		push	si
		call	sub_33B
		pop	cx

loc_47DFA:
		pop	di
		pop	si
		pop	bp
		retf
sub_47DAD		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_47DFE		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_47DFE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_47E06		proc far
		push	bp
		mov	bp, sp
		push	si
		push	67CCh
		call	sub_47F2A
		pop	cx
		mov	si, word_5DD68
		jmp	short loc_47E23

loc_47E19:
		push	si
		mov	bx, [si]
		call	dword ptr [bx+4]
		pop	cx
		mov	si, [si+2]

loc_47E23:
		or	si, si
		jnz	short loc_47E19
		pop	si
		pop	bp
		retf
sub_47E06		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; PagedResourceC_RefreshAndFinalize_68315 (sub_68315 de PACIFIC.EXE). Résumé repris de
; PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : code
; identique instruction par instruction à PagedResourceC_RefreshAndFinalize_2FD7D (sub_2FD7D
; de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. —
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; PagedResourceC_RefreshAndFinalize_5F508 (sub_5F508 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, appelle
; PagedResourceC_RefreshAllInstances_5F4E0 puis sub_3C2. Référencée par sub_14279 et
; sub_67517.
; ==============================================================================================
PagedResourceC_RefreshAndFinalize_47E2A		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	cs
		call	near ptr sub_47E06
		push	[bp+arg_0]
		call	CRT_Exit
		pop	cx
		pop	bp
		retf
PagedResourceC_RefreshAndFinalize_47E2A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_47E3C		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		push	cs
		call	near ptr sub_47E06
		cmp	si, word_5D91C
		jz	short loc_47E64
		lea	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		push	ax
		push	si
		push	word_5D91C
		call	CRT_Msg_Sprintf2
		add	sp, 6

loc_47E64:
		push	word_5D91C
		call	sub_59BB0
		pop	cx
		push	0
sub_47E3C		endp
seg119		ends
