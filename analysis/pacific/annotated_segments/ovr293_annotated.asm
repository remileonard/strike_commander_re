ovr293		segment	para public 'OVERLAY' use16
		assume cs:ovr293
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à Terrain_Helper6_9AD80
; (sub_9AD80 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far, aucun appel externe visible (50 lignes).
; ==============================================================================================
Terrain_Helper6_A93E0		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		cmp	byte ptr [di], 0
		jz	short loc_A9425
		mov	[si+1], di
		mov	bx, [si+1]
		mov	ax, [bx+7]
		mov	[si+3], ax
		mov	eax, [bx+8Ah]
		mov	[si+5], eax
		mov	eax, [bx+92h]
		mov	[si+11h], eax
		mov	eax, [bx+8Eh]
		mov	[si+9], eax
		mov	eax, [si+9]
		sar	eax, 1
		mov	[si+0Dh], eax
		mov	byte ptr [si], 1

loc_A9425:
		pop	di
		pop	si
		pop	bp
		retf
Terrain_Helper6_A93E0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A9429		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	dx, [bp+arg_2]
		or	ax, ax
		jz	short loc_A9443
		test	dx, 1
		jz	short loc_A9443
		push	ax
		call	sub_3B2
		pop	cx

loc_A9443:
		pop	bp
		retf
sub_A9429		endp
ovr293		ends
