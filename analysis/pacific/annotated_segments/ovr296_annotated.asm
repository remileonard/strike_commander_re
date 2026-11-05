ovr296		segment	para public 'OVERLAY' use16
		assume cs:ovr296
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_AA620		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jnz	short loc_AA632
		jmp	loc_AA6B3

loc_AA632:
		mov	word ptr [si], 15EAh
		cmp	dword ptr [si+0Ah], 0
		jz	short loc_AA651
		push	3
		push	large [si+0Ah]
		les	bx, [si+0Ah]
		mov	bx, es:[bx]
		call	dword ptr [bx+28h]
		add	sp, 6
		jmp	short loc_AA651

loc_AA651:
		mov	dword ptr [si+0Ah], 0
		push	3
		push	word ptr [si+1Eh]
		call	Container_Op_1EFD2
		add	sp, 4
		mov	word ptr [si+1Eh], 0
		push	word ptr [si+26h]
		call	sub_3B2
		pop	cx
		mov	word ptr [si+26h], 0
		push	si
		push	67A5h
		call	WeakRef_UnregisterByValue
		add	sp, 4
		push	si
		nop
		push	cs
		call	near ptr sub_AA6EA
		pop	cx
		push	large [si+0Eh]
		push	65D0h
		call	Debris_FindAndRemoveByID
		add	sp, 6
		push	0
		push	si
		call	sub_1E120
		add	sp, 4
		test	di, 1
		jz	short loc_AA6B3
		push	si
		call	sub_3B2
		pop	cx

loc_AA6B3:
		pop	di
		pop	si
		pop	bp
		retf
sub_AA620		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Debris_ContainerOpWrapperB_9B78D (sub_9B78D de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; appelle une opération de conteneur (WorldObjects_RemoveAndDelete_223C5).
; ==============================================================================================
Debris_ContainerOpWrapperB_AA6B7		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	byte_7975D, 0
		push	[bp+arg_2]
		push	si
		push	large [si+0Eh]
		les	bx, [si+0Eh]
		mov	bx, es:[bx]
		call	dword ptr [bx+0Ch]
		add	sp, 8
		or	al, al
		jz	short loc_AA6E7
		push	si
		push	67ADh
		call	sub_1E610
		add	sp, 4

loc_AA6E7:
		pop	si
		pop	bp
		retf
Debris_ContainerOpWrapperB_AA6B7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_AA6EA		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		cmp	word_79799, 0
		jz	short loc_AA72E
		mov	bx, word_79799
		mov	dx, [bx+0Ch]
		mov	eax, [bx+24h]
		mov	[bp+var_4], eax
		jmp	short loc_AA72A

loc_AA708:
		les	bx, word ptr [bp+var_4]
		mov	al, es:[bx+4]
		and	ax, 3
		or	al, al
		jz	short loc_AA726
		mov	ax, es:[bx+19h]
		cmp	ax, [bp+arg_0]
		jnz	short loc_AA725
		mov	word ptr es:[bx+19h], 0

loc_AA725:
		dec	dx

loc_AA726:
		add	word ptr [bp+var_4], 1Bh

loc_AA72A:
		or	dx, dx
		jnz	short loc_AA708

loc_AA72E:
		leave
		retf
sub_AA6EA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_AA730		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_AA730		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_AA738		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	al, 0
		pop	bp
		retf
sub_AA738		endp
ovr296		ends
