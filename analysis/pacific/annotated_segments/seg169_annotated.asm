seg169		segment	para public 'CODE' use16
		assume cs:seg169
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 70h, 48h, 0ECh, 0A8h, 8, 74h, 0FBh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_68298		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	dx, [bp+arg_2]
		or	si, si
		jz	short loc_682E5
		mov	word ptr [si], 0D7Ch
		mov	di, word_7AFA2
		cmp	word_7AFA2, si
		jnz	short loc_682D4
		mov	bx, word_7AFA2
		mov	ax, [bx+2]
		mov	word_7AFA2, ax
		jmp	short loc_682D8

loc_682C1:
		mov	cx, [di+2]
		cmp	cx, si
		jnz	short loc_682D2
		mov	bx, cx
		mov	ax, [bx+2]
		mov	[di+2], ax
		jmp	short loc_682D8

loc_682D2:
		mov	di, cx

loc_682D4:
		or	di, di
		jnz	short loc_682C1

loc_682D8:
		test	dx, 1
		jz	short loc_682E5
		push	si
		call	sub_3B2
		pop	cx

loc_682E5:
		pop	di
		pop	si
		pop	bp
		retf
sub_68298		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_682E9		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_682E9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_682F1		proc far
		push	bp
		mov	bp, sp
		push	si
		push	6B20h
		call	sub_68415
		pop	cx
		mov	si, word_7AFA2
		jmp	short loc_6830E

loc_68304:
		push	si
		mov	bx, [si]
		call	dword ptr [bx+4]
		pop	cx
		mov	si, [si+2]

loc_6830E:
		or	si, si
		jnz	short loc_68304
		pop	si
		pop	bp
		retf
sub_682F1		endp

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
PagedResourceC_RefreshAndFinalize_68315		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	cs
		call	near ptr sub_682F1
		push	[bp+arg_0]
		call	CRT_Exit
		pop	cx
		pop	bp
		retf
PagedResourceC_RefreshAndFinalize_68315		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_68327		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		push	cs
		call	near ptr sub_682F1
		cmp	si, word_7AB7A
		jz	short loc_6834F
		lea	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		push	ax
		push	si
		push	word_7AB7A
		call	CRT_Msg_Sprintf2
		add	sp, 6

loc_6834F:
		push	word_7AB7A
		call	sub_76620
		pop	cx
		push	0
		call	CRT_Exit
sub_68327		endp
seg169		ends
