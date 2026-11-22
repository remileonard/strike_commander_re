seg093		segment	para public 'CODE' use16
		assume cs:seg093
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0C4h, 4

loc_3B142:
		db 5Eh, 0C9h, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3B145		proc far
		push	bp
		mov	bp, sp
		mov	al, 1
		pop	bp
		retf
sub_3B145		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3B14C		proc far

arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_4]
		push	si
		push	large [bp+arg_0]
		call	sub_741CF
		add	sp, 6
		push	0
		push	large 4E474C41h
		push	si
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_3B185
		push	si
		call	ResourceRecord_ReadFinalField_6DBCA
		pop	cx
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+48h], al
		jmp	short loc_3B18D

loc_3B185:
		les	bx, word ptr [bp+arg_0]
		mov	byte ptr es:[bx+48h], 0

loc_3B18D:
		pop	si
		pop	bp
		retf
sub_3B14C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3B190		proc far

arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	large [bp+arg_0]
		push	0
		nop
		push	cs
		call	near ptr sub_3B223
		add	sp, 6
		mov	si, ax
		push	ax
		push	large [bp+arg_0]
		call	sub_741DE
		add	sp, 6
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_3B190		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3B1B6		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_3B1CF
		push	52h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_3B21E

loc_3B1CF:
		mov	word ptr [si], 0DAEh
		mov	dword ptr [si+6], 0
		mov	word ptr [si+4], 0
		mov	byte ptr [si+2], 0
		mov	byte ptr [si+3], 0
		mov	word ptr [si], 15EAh
		push	si
		call	Debris_BodyReset
		pop	cx
		mov	word ptr [si], 1F34h
		mov	ax, si
		add	ax, 2Dh
		push	ax
		call	Formation_ComputeGeometryHelper_58B0C
		pop	cx
		mov	ax, si
		add	ax, 2Dh
		push	ax
		call	Matrix_BuildFromAngle_58B3B
		pop	cx
		push	0
		push	si
		call	sub_7434A
		add	sp, 4
		or	byte ptr [si+2], 10h

loc_3B21E:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_3B1B6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3B223		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= dword ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_3B23F
		push	52h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_3B2B4

loc_3B23F:
		mov	word ptr [si], 0DAEh
		mov	dword ptr [si+6], 0
		mov	word ptr [si+4], 0
		mov	byte ptr [si+2], 0
		mov	byte ptr [si+3], 0
		mov	word ptr [si], 15EAh
		push	si
		call	Debris_BodyReset
		pop	cx
		mov	word ptr [si], 1F34h
		mov	ax, si
		add	ax, 2Dh
		push	ax
		call	Formation_ComputeGeometryHelper_58B0C
		pop	cx
		mov	eax, [bp+arg_2]
		mov	[bp+var_4], eax
		push	large [bp+var_4]
		push	si
		call	sub_36985
		add	sp, 6
		mov	ax, si
		add	ax, 2Dh
		push	ax
		call	Matrix_BuildFromAngle_58B3B
		pop	cx
		push	0
		push	si
		call	sub_7434A
		add	sp, 4
		or	byte ptr [si+2], 10h
		les	bx, word ptr [bp+var_4]
		mov	al, es:[bx+48h]
		push	ax
		push	si
		call	sub_7434A
		add	sp, 4

loc_3B2B4:
		mov	ax, si
		pop	si
		leave
		retf
sub_3B223		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3B2B9		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_3B2E4
		mov	word ptr [si], 1F34h
		push	0
		push	si
		call	sub_7418A
		add	sp, 4
		test	di, 1
		jz	short loc_3B2E4
		push	si
		call	sub_3B2
		pop	cx

loc_3B2E4:
		pop	di
		pop	si
		pop	bp
		retf
sub_3B2B9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3B2E8		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	al, 1
		pop	bp
		retf
sub_3B2E8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3B2F2		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	[bp+arg_2]
		mov	ax, si
		add	ax, 2Dh
		push	ax
		call	Matrix_BuildFullOrientation_5937B
		add	sp, 8
		push	si
		call	sub_36AAC
		pop	cx
		pop	si
		pop	bp
		retf
sub_3B2F2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3B31A		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	[bp+arg_2]
		mov	ax, si
		add	ax, 2Dh
		push	ax
		call	WorldObject_BuildOrientationMatrix_58C53
		add	sp, 4
		push	si
		call	sub_36AAC
		pop	cx
		pop	si
		pop	bp
		retf
sub_3B31A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3B33C		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		mov	ax, dx
		add	ax, 2Dh
		pop	bp
		retf
sub_3B33C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3B349		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+26h], 0
		jz	short loc_3B362
		push	si
		mov	bx, [si]
		call	dword ptr [bx+78h]
		pop	cx
		mov	ax, [si+26h]
		jmp	short loc_3B367

loc_3B362:
		mov	ax, si
		add	ax, 2Dh

loc_3B367:
		pop	si
		pop	bp
		retf
sub_3B349		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3B36A		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax
		push	[bp+arg_2]
		call	Matrix_WorldToLocal_5A569
		add	sp, 4
		pop	si
		pop	bp
		retf
sub_3B36A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à Debris_PositionWidget
; (sub_38068 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far,21L — récupère la position (vtable[0x3C]) et notifie sub_56E29 : positionnement
; d'un widget/marqueur sur un objet physique.
; ==============================================================================================
Debris_PositionWidget_3B387		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax
		push	[bp+arg_2]
		call	sub_5A629
		add	sp, 4
		pop	si
		pop	bp
		retf
Debris_PositionWidget_3B387		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3B3A4		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	[bp+arg_2]
		mov	ax, si
		add	ax, 2Dh
		push	ax
		call	AI_ComputeGeometryHelper_58BF2
		add	sp, 4
		push	si
		call	sub_36AAC
		pop	cx
		pop	si
		pop	bp
		retf
sub_3B3A4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; StreamReader_DestructWrapper_3D231 (sub_3D231 de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à StreamReader_DestructWrapper_659C1 (sub_659C1 de STRIKE.EXE). Résumé
; repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, référencée via vtable
; (DATA XREF seg339) — enveloppe appelant StreamReader_Destruct_638FF. Référencée directement
; par TextRenderer_Main (sub_27477, seg048).
; ==============================================================================================
StreamReader_DestructWrapper_3B3C6		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		push	ax
		call	sub_36D52
		pop	cx
		pop	bp
		retf
StreamReader_DestructWrapper_3B3C6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3B3D5		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+26h], 0
		jz	short loc_3B425
		mov	bx, [si+26h]
		mov	al, [bx+30h]
		shr	ax, 1
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jnz	short loc_3B425
		push	si
		mov	bx, [si]
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax
		push	word ptr [si+26h]
		call	AI_ComputeGeometryHelper_58BF2
		add	sp, 4
		push	word ptr [si+24h]
		mov	bx, [si+24h]
		mov	bx, [bx]
		call	dword ptr [bx+7Ch]
		pop	cx
		push	ax
		push	word ptr [si+26h]
		call	sub_59563
		add	sp, 4
		mov	bx, [si+26h]
		or	byte ptr [bx+30h], 2

loc_3B425:
		pop	si
		pop	bp
		retf
sub_3B3D5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3B428		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_3B428		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3B430		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	ax, [bp+arg_2]
		push	ax
		push	ax
		call	WorldObject_ApplyOrientationVariantA_59533
		add	sp, 4
		pop	bp
		retf
sub_3B430		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3B445		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	ax, [bp+arg_2]
		push	ax
		push	ax
sub_3B445		endp
seg093		ends
