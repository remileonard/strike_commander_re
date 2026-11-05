seg110		segment	para public 'CODE' use16
		assume cs:seg110
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0A1h, 24h, 40h, 0A3h, 22h, 40h

loc_46A26:
		db 5Eh, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à Palette_Alloc_DF5F0
; (sub_DF5F0 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à
; revérifier ici. — Reprise de OPTEST.EXE : code identique instruction par instruction à
; Palette_Alloc_2CC76 (sub_2CC76 de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et
; contexte à revérifier ici. — far, LUE 2026-10-17. Palette {+0 nombre de couleurs (arg_4), +2
; premier indice (arg_2), +3 tableau RVB de 3 octets par couleur alloué par sub_D57}.
; ==============================================================================================
Palette_Alloc_46A29		proc far

arg_0		= word ptr  6
arg_2		= byte ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	dx, [bp+arg_4]
		mov	al, [bp+arg_2]
		mov	[si+2], al
		mov	[si], dx
		push	seg seg110
		push	offset sub_46F88
		push	1
		push	dx
		push	large 30000h
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		mov	[si+3], ax
		pop	si
		pop	bp
		retf
Palette_Alloc_46A29		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_46A58		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= dword ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	eax, [bp+arg_2]
		mov	[bp+var_4], eax
		mov	di, [si+3]
		xor	dx, dx
		jmp	short loc_46A90

loc_46A72:
		les	bx, word ptr [bp+var_4]
		mov	al, es:[bx]
		mov	[di], al
		mov	al, es:[bx+1]
		mov	[di+1], al
		mov	al, es:[bx+2]
		mov	[di+2], al
		inc	dx
		add	word ptr [bp+var_4], 3
		add	di, 3

loc_46A90:
		cmp	[si], dx
		ja	short loc_46A72
		pop	di
		pop	si
		leave
		retf
sub_46A58		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_46A98		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		cmp	word ptr [si+3], 0
		jz	short loc_46ABA
		push	word ptr [si+3]
		call	sub_33B
		pop	cx
		mov	word ptr [si+3], 0

loc_46ABA:
		cmp	byte ptr [di+4], 3
		jnz	short loc_46AD6
		push	0
		mov	al, [di+4]
		push	ax
		push	large [di]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_46ADB

loc_46AD6:
		mov	dx, [di+2]
		mov	ax, [di]

loc_46ADB:
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		les	bx, word ptr [bp+var_4]
		mov	al, es:[bx]
		mov	[si+2], al
		add	word ptr [bp+var_4], 2
		les	bx, word ptr [bp+var_4]
		mov	ax, es:[bx]
		mov	[si], ax
		add	word ptr [bp+var_4], 2
		push	seg seg110
		push	offset sub_46F88
		push	1
		push	word ptr [si]
		push	large 30000h
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		mov	[si+3], ax
		cmp	word ptr [si+3], 0
		jz	short loc_46B27
		push	large [bp+var_4]
		push	si
		push	cs
		call	near ptr sub_46A58
		add	sp, 6

loc_46B27:
		cmp	byte ptr [di+5], 0
		jz	short loc_46B47
		cmp	dword ptr [di], 0
		jz	short loc_46B47
		push	0
		mov	al, [di+4]
		push	ax
		push	di
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_46B47

loc_46B47:
		mov	dword ptr [di], 0
		mov	byte ptr [di+5], 0
		mov	dword ptr [di+6], 0
		pop	di
		pop	si
		leave
		retf
sub_46A98		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_46B5E		proc far

arg_0		= word ptr  6
arg_2		= byte ptr  8
arg_4		= word ptr  0Ah
arg_6		= dword ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	[bp+arg_4]
		mov	al, [bp+arg_2]
		push	ax
		push	si
		push	cs
		call	near ptr Palette_Alloc_46A29
		add	sp, 6
		push	large [bp+arg_6]
		push	si
		push	cs
		call	near ptr sub_46A58
		add	sp, 6
		pop	si
		pop	bp
		retf
sub_46B5E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_46B83		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+3], 0
		jz	short loc_46B9E
		mov	al, [si+2]
		push	ax
		push	word ptr [si]
		push	word ptr [si+3]
		call	sub_47D05

loc_46B9E:
		pop	si
		pop	bp
		retf
sub_46B83		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à Palette_Upload_DF75B
; (sub_DF75B de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à
; revérifier ici. — Reprise de OPTEST.EXE : même suite d'instructions, 2 opérande(s)
; différent(s) (adresses de données ou constantes) — à vérifier à Palette_Upload_2CDE1
; (sub_2CDE1 de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier
; ici. — far, LUE 2026-10-17. Envoie une plage de la palette à la carte VGA (sub_2F024),
; bornée à la palette. Avec un pas non nul, découpe l'envoi en morceaux de nombre / pas
; couleurs, chacun après une attente de balayage (sub_2F050).
; ==============================================================================================
Palette_Upload_46BA1		proc far

var_6		= word ptr -6
var_3		= byte ptr -3
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= byte ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	cl, [bp+arg_2]
		mov	di, [bp+arg_4]
		cmp	word ptr [si+3], 0
		jnz	short loc_46BBB
		jmp	loc_46C69

loc_46BBB:
		cmp	[si+2], cl
		jbe	short loc_46BC3
		mov	cl, [si+2]

loc_46BC3:
		mov	al, [si+2]
		mov	ah, 0
		add	ax, [si]
		mov	dl, cl
		mov	dh, 0
		add	dx, di
		cmp	ax, dx
		jnb	short loc_46BE3
		mov	al, [si+2]
		mov	ah, 0
		add	ax, [si]
		mov	dl, cl
		mov	dh, 0
		sub	ax, dx
		mov	di, ax

loc_46BE3:
		mov	al, cl
		mov	ah, 0
		mov	dl, [si+2]
		mov	dh, 0
		sub	ax, dx
		imul	ax, ax, 3
		mov	si, [si+3]
		add	si, ax
		cmp	[bp+arg_6], 0
		jz	short loc_46C61
		mov	ax, di
		xor	dx, dx
		div	[bp+arg_6]
		mov	[bp+var_2], ax
		mov	[bp+var_3], cl
		mov	[bp+var_6], di
		mov	ax, di
		xor	dx, dx
		div	[bp+arg_6]
		or	dx, dx
		jz	short loc_46C59
		inc	[bp+var_2]
		jmp	short loc_46C59

loc_46C1C:
		call	sub_47D9E
		mov	al, [bp+var_3]
		push	ax
		push	[bp+var_2]
		push	si
		call	sub_47D72
		mov	al, [bp+var_3]
		add	al, byte ptr [bp+var_2]
		mov	[bp+var_3], al
		mov	ax, [bp+var_2]
		imul	ax, ax, 3
		add	si, ax
		mov	ax, [bp+var_6]
		sub	ax, [bp+var_2]
		mov	[bp+var_6], ax
		mov	dx, ax
		cmp	dx, [bp+var_2]
		jge	short loc_46C53
		mov	ax, dx
		jmp	short loc_46C56

loc_46C53:
		mov	ax, [bp+var_2]

loc_46C56:
		mov	[bp+var_2], ax

loc_46C59:
		cmp	[bp+var_2], 0
		ja	short loc_46C1C
		jmp	short loc_46C69

loc_46C61:
		push	cx
		push	di
		push	si
		call	sub_47D72

loc_46C69:
		pop	di
		pop	si
		leave
		retf
Palette_Upload_46BA1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_46C6D		proc far

arg_0		= word ptr  6
arg_2		= byte ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	cl, [bp+arg_2]
		mov	di, [bp+arg_4]
		cmp	word ptr [si+3], 0
		jz	short loc_46CC4
		cmp	[si+2], cl
		jbe	short loc_46C89
		mov	cl, [si+2]

loc_46C89:
		mov	al, [si+2]
		mov	ah, 0
		add	ax, [si]
		mov	dl, cl
		mov	dh, 0
		add	dx, di
		cmp	ax, dx
		jnb	short loc_46CA9
		mov	al, [si+2]
		mov	ah, 0
		add	ax, [si]
		mov	dl, cl
		mov	dh, 0
		sub	ax, dx
		mov	di, ax

loc_46CA9:
		push	cx
		push	di
		mov	al, cl
		mov	ah, 0
		mov	dl, [si+2]
		mov	dh, 0
		sub	ax, dx
		imul	ax, ax, 3
		mov	dx, [si+3]
		add	dx, ax
		push	dx
		call	sub_47D05

loc_46CC4:
		pop	di
		pop	si
		pop	bp
		retf
sub_46C6D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; Palette_FillRange_DF882 (sub_DF882 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants
; et contexte à revérifier ici. — Reprise de OPTEST.EXE : même suite d'instructions, 1
; opérande(s) différent(s) (adresses de données ou constantes) — à vérifier à
; Palette_FillRange_2CF08 (sub_2CF08 de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants
; et contexte à revérifier ici. — far, LUE 2026-10-17. Remplit une plage (premier indice,
; nombre) de la palette avec une seule couleur RVB (pointeur arg_2).
; ==============================================================================================
Palette_FillRange_46CC8		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= byte ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	cl, [bp+arg_4]
		cmp	word ptr [si+3], 0
		jz	short loc_46D3C
		cmp	[si+2], cl
		jbe	short loc_46CE1
		mov	cl, [si+2]

loc_46CE1:
		mov	al, [si+2]
		mov	ah, 0
		add	ax, [si]
		mov	dl, cl
		mov	dh, 0
		add	dx, [bp+arg_6]
		cmp	ax, dx
		jnb	short loc_46D03
		mov	al, [si+2]
		mov	ah, 0
		add	ax, [si]
		mov	dl, cl
		mov	dh, 0
		sub	ax, dx
		mov	[bp+arg_6], ax

loc_46D03:
		mov	di, [si+3]
		mov	al, cl
		mov	ah, 0
		mov	dl, [si+2]
		mov	dh, 0
		sub	ax, dx
		imul	ax, ax, 3
		mov	dx, [si+3]
		add	dx, ax
		mov	[si+3], dx
		xor	dx, dx
		jmp	short loc_46D37

loc_46D20:
		mov	bx, [bp+arg_2]
		mov	al, [bx]
		mov	[di], al
		mov	al, [bx+1]
		mov	[di+1], al
		mov	al, [bx+2]
		mov	[di+2], al
		inc	dx
		add	di, 3

loc_46D37:
		cmp	dx, [bp+arg_6]
		jb	short loc_46D20

loc_46D3C:
		pop	di
		pop	si
		pop	bp
		retf
Palette_FillRange_46CC8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à Palette_CopyInto_DF8FA
; (sub_DF8FA de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à
; revérifier ici. — Reprise de OPTEST.EXE : même suite d'instructions, 2 opérande(s)
; différent(s) (adresses de données ou constantes) — à vérifier à Palette_CopyInto_2CF80
; (sub_2CF80 de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier
; ici. — far, LUE 2026-10-17. Copie la palette source dans la palette destination, à partir du
; premier indice de la source. Les cinématiques composent ainsi les 256 couleurs à partir de
; palettes partielles.
; ==============================================================================================
Palette_CopyInto_46D40		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= byte ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	cl, [bp+arg_4]
		cmp	word ptr [si+3], 0
		jz	short loc_46DA5
		cmp	word ptr [di+3], 0
		jz	short loc_46DA5
		cmp	[si+2], cl
		jbe	short loc_46D62
		mov	cl, [si+2]

loc_46D62:
		mov	al, [si+2]
		mov	ah, 0
		add	ax, [si]
		mov	dl, cl
		mov	dh, 0
		add	dx, [bp+arg_6]
		cmp	ax, dx
		jnb	short loc_46D74

loc_46D74:
		mov	cx, [di+3]
		mov	al, [di+2]
		mov	ah, 0
		imul	ax, ax, 3
		mov	si, [si+3]
		add	si, ax
		xor	dx, dx
		jmp	short loc_46DA1

loc_46D88:
		mov	bx, cx
		mov	al, [bx]
		mov	[si], al
		mov	al, [bx+1]
		mov	[si+1], al
		mov	al, [bx+2]
		mov	[si+2], al
		inc	dx
		add	cx, 3
		add	si, 3

loc_46DA1:
		cmp	[di], dx
		ja	short loc_46D88

loc_46DA5:
		pop	di
		pop	si
		pop	bp
		retf
Palette_CopyInto_46D40		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_46DA9		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= byte ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	cl, [bp+arg_4]
		cmp	[si+2], cl
		jnb	short loc_46DD0
		mov	al, [si+2]
		mov	ah, 0
		add	ax, [si]
		mov	dl, cl
		mov	dh, 0
		cmp	ax, dx
		jbe	short loc_46DD0
		push	cx
		push	[bp+arg_2]
		call	sub_47D50

loc_46DD0:
		pop	si
		pop	bp
		retf
sub_46DA9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Palette_FadeStep_2D013 (sub_2D013 de OPTEST.EXE).
; Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — far, LUE 2026-10-17.
; Une étape de fondu de la palette arg_0 vers la palette arg_2
; (Palette_StepTowardTarget_2ED93) ; renvoie 0 quand le fondu est terminé.
; ==============================================================================================
Palette_FadeStep_46DD3		proc far

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
		mov	di, [bp+arg_2]
		mov	al, [di+2]
		mov	ah, 0
		imul	ax, ax, 3
		mov	dx, [si+3]
		add	dx, ax
		mov	[bp+var_2], dx
		mov	ax, [di+3]
		mov	[bp+var_4], ax
		push	dx
		push	ax
		mov	ax, [di]
		imul	ax, ax, 3
		push	ax
		call	sub_59AD0
		pop	di
		pop	si
		leave
		retf
Palette_FadeStep_46DD3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_46E08		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	word ptr [si+3]
		call	sub_33B
		pop	cx
		mov	word ptr [si+3], 0
		pop	si
		pop	bp
		retf
sub_46E08		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; Palette_LoadAndUpload_DF9E5 (sub_DF9E5 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : code identique instruction
; par instruction à Palette_LoadAndUpload_2D077 (sub_2D077 de OPTEST.EXE). Résumé repris de
; OPTEST.EXE ; appelants et contexte à revérifier ici. — far, LUE 2026-10-17.
; Palette_LoadFromResource_2CCE5 puis Palette_Upload_2CDE1 sans découpage.
; ==============================================================================================
Palette_LoadAndUpload_46E20		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr sub_46A98
		add	sp, 4
		push	0
		push	word ptr [si]
		mov	al, [si+2]
		push	ax
		push	si
		push	cs
		call	near ptr Palette_Upload_46BA1
		add	sp, 8
		pop	si
		pop	bp
		retf
Palette_LoadAndUpload_46E20		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_46E45		proc far

var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_9		= byte ptr -9
var_8		= word ptr -8
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= byte ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 10h
		push	si
		push	di
		mov	di, [bp+arg_0]
		push	seg seg110
		push	offset sub_46F88
		push	1
		push	[bp+arg_8]
		push	large 30000h
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		mov	[bp+var_2], ax
		xor	dx, dx
		jmp	short loc_46EA2

loc_46E70:
		mov	ax, dx
		imul	ax, ax, 3
		mov	bx, [bp+var_2]
		add	bx, ax
		mov	si, [bp+arg_2]
		mov	al, [si]
		mov	[bx], al
		mov	ax, dx
		imul	ax, ax, 3
		mov	bx, [bp+var_2]
		add	bx, ax
		mov	al, [si+2]
		mov	[bx+2], al
		mov	ax, dx
		imul	ax, ax, 3
		mov	bx, [bp+var_2]
		add	bx, ax
		mov	al, [si+1]
		mov	[bx+1], al
		inc	dx

loc_46EA2:
		cmp	dx, [bp+arg_8]
		jb	short loc_46E70
		mov	al, [bp+arg_6]
		mov	[bp+var_9], al
		mov	ax, [bp+arg_8]
		mov	[bp+var_C], ax
		mov	ax, [bp+var_2]
		mov	[bp+var_E], ax
		push	ds
		push	ax
		push	[bp+var_C]
		mov	al, [bp+var_9]
		push	ax
		lea	ax, [bp+var_8]
		push	ax
		push	cs
		call	near ptr sub_46B5E
		add	sp, 0Ah
		jmp	short loc_46EE4

loc_46ECF:
		mov	ax, [bp+arg_4]
		mov	[bp+var_10], ax
		push	ax
		push	word ptr [di]
		mov	al, [di+2]
		push	ax
		push	di
		push	cs
		call	near ptr Palette_Upload_46BA1
		add	sp, 8

loc_46EE4:
		lea	ax, [bp+var_8]
		push	ax
		push	di
		push	cs
		call	near ptr Palette_FadeStep_46DD3
		add	sp, 4
		or	al, al
		jnz	short loc_46ECF
		push	[bp+var_2]
		call	sub_33B
		pop	cx
		lea	ax, [bp+var_8]
		push	ax
		push	cs
		call	near ptr sub_46E08
		pop	cx
		pop	di
		pop	si
		leave
		retf
sub_46E45		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_46F0A		proc far

var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_7		= byte ptr -7
var_6		= word ptr -6
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= byte ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	al, [bp+arg_6]
		mov	[bp+var_7], al
		mov	ax, [bp+arg_8]
		mov	[bp+var_A], ax
		push	ax
		mov	al, [bp+var_7]
		push	ax
		lea	ax, [bp+var_6]
		push	ax
		push	cs
		call	near ptr Palette_Alloc_46A29
		add	sp, 6
		mov	di, si
		push	word ptr [di]
		mov	al, [di+2]
		push	ax
		push	di
		lea	ax, [bp+var_6]
		push	ax
		push	cs
		call	near ptr Palette_CopyInto_46D40
		add	sp, 8
		push	[bp+arg_8]
		mov	al, [bp+arg_6]
		push	ax
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr Palette_FillRange_46CC8
		jmp	short loc_46F68

loc_46F56:
		mov	ax, [bp+arg_4]
		mov	[bp+var_C], ax
		push	ax
		push	word ptr [si]
		mov	al, [si+2]
		push	ax
		push	si
		push	cs
		call	near ptr Palette_Upload_46BA1

loc_46F68:
		add	sp, 8
		lea	ax, [bp+var_6]
		push	ax
		push	si
		push	cs
		call	near ptr Palette_FadeStep_46DD3
		add	sp, 4
		or	al, al
		jnz	short loc_46F56
		lea	ax, [bp+var_6]
		push	ax
		push	cs
		call	near ptr sub_46E08
		pop	cx
		pop	di
		pop	si
		leave
		retf
sub_46F0A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_46F88		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		or	dx, dx
		jnz	short loc_46F9E
		push	3
		call	CRT_Malloc16_Retry
		pop	cx
		mov	dx, ax
		or	ax, ax

loc_46F9E:
		mov	ax, dx
sub_46F88		endp
seg110		ends
