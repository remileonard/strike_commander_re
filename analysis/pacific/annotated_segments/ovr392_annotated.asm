ovr392		segment	para public 'OVERLAY' use16
		assume cs:ovr392
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à Palette_Alloc_2CC76
; (sub_2CC76 de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier
; ici. — far, LUE 2026-10-17. Palette {+0 nombre de couleurs (arg_4), +2 premier indice
; (arg_2), +3 tableau RVB de 3 octets par couleur alloué par sub_D57}.
; ==============================================================================================
Palette_Alloc_DF5F0		proc far

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
		push	seg stub392
		push	offset sub_76240
		push	1
		push	dx
		push	large 30000h
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		mov	[si+3], ax
		pop	si
		pop	bp
		retf
Palette_Alloc_DF5F0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_DF61F		proc far

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
		jmp	short loc_DF657

loc_DF639:
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

loc_DF657:
		cmp	[si], dx
		ja	short loc_DF639
		pop	di
		pop	si
		leave
		retf
sub_DF61F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 6 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Palette_LoadFromResource_2CCE5 (sub_2CCE5 de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — far,
; LUE 2026-10-17. Charge une palette depuis un bloc de ressource : octet premier indice, mot
; nombre de couleurs, puis RVB (3 octets par couleur, copiés par sub_2CCA5) ; libère ensuite
; le bloc source.
; ==============================================================================================
Palette_LoadFromResource_DF65F		proc far

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
		jz	short loc_DF681
		push	word ptr [si+3]
		call	sub_3B2
		pop	cx
		mov	word ptr [si+3], 0

loc_DF681:
		push	0
		mov	al, [di+4]
		push	ax
		push	large [di]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
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
		push	seg stub392
		push	offset sub_76240
		push	1
		push	word ptr [si]
		push	large 30000h
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		mov	[si+3], ax
		cmp	word ptr [si+3], 0
		jz	short loc_DF6E1
		push	large [bp+var_4]
		push	si
		push	cs
		call	near ptr sub_DF61F
		add	sp, 6

loc_DF6E1:
		cmp	byte ptr [di+5], 0
		jz	short loc_DF701
		cmp	dword ptr [di], 0
		jz	short loc_DF701
		push	0
		mov	al, [di+4]
		push	ax
		push	di
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_DF701

loc_DF701:
		mov	dword ptr [di], 0
		mov	byte ptr [di+5], 0
		mov	dword ptr [di+6], 0
		pop	di
		pop	si
		leave
		retf
Palette_LoadFromResource_DF65F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_DF718		proc far

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
		call	near ptr Palette_Alloc_DF5F0
		add	sp, 6
		push	large [bp+arg_6]
		push	si
		push	cs
		call	near ptr sub_DF61F
		add	sp, 6
		pop	si
		pop	bp
		retf
sub_DF718		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_DF73D		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+3], 0
		jz	short loc_DF758
		mov	al, [si+2]
		push	ax
		push	word ptr [si]
		push	word ptr [si+3]
		call	sub_6815D

loc_DF758:
		pop	si
		pop	bp
		retf
sub_DF73D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Palette_Upload_2CDE1 (sub_2CDE1 de OPTEST.EXE). Résumé
; repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — far, LUE 2026-10-17. Envoie
; une plage de la palette à la carte VGA (sub_2F024), bornée à la palette. Avec un pas non
; nul, découpe l'envoi en morceaux de nombre / pas couleurs, chacun après une attente de
; balayage (sub_2F050).
; ==============================================================================================
Palette_Upload_DF75B		proc far

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
		jnz	short loc_DF775
		jmp	loc_DF823

loc_DF775:
		cmp	[si+2], cl
		jbe	short loc_DF77D
		mov	cl, [si+2]

loc_DF77D:
		mov	al, [si+2]
		mov	ah, 0
		add	ax, [si]
		mov	dl, cl
		mov	dh, 0
		add	dx, di
		cmp	ax, dx
		jnb	short loc_DF79D
		mov	al, [si+2]
		mov	ah, 0
		add	ax, [si]
		mov	dl, cl
		mov	dh, 0
		sub	ax, dx
		mov	di, ax

loc_DF79D:
		mov	al, cl
		mov	ah, 0
		mov	dl, [si+2]
		mov	dh, 0
		sub	ax, dx
		imul	ax, ax, 3
		mov	si, [si+3]
		add	si, ax
		cmp	[bp+arg_6], 0
		jz	short loc_DF81B
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
		jz	short loc_DF813
		inc	[bp+var_2]
		jmp	short loc_DF813

loc_DF7D6:
		call	sub_681F6
		mov	al, [bp+var_3]
		push	ax
		push	[bp+var_2]
		push	si
		call	sub_681CA
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
		jge	short loc_DF80D
		mov	ax, dx
		jmp	short loc_DF810

loc_DF80D:
		mov	ax, [bp+var_2]

loc_DF810:
		mov	[bp+var_2], ax

loc_DF813:
		cmp	[bp+var_2], 0
		ja	short loc_DF7D6
		jmp	short loc_DF823

loc_DF81B:
		push	cx
		push	di
		push	si
		call	sub_681CA

loc_DF823:
		pop	di
		pop	si
		leave
		retf
Palette_Upload_DF75B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_DF827		proc far

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
		jz	short loc_DF87E
		cmp	[si+2], cl
		jbe	short loc_DF843
		mov	cl, [si+2]

loc_DF843:
		mov	al, [si+2]
		mov	ah, 0
		add	ax, [si]
		mov	dl, cl
		mov	dh, 0
		add	dx, di
		cmp	ax, dx
		jnb	short loc_DF863
		mov	al, [si+2]
		mov	ah, 0
		add	ax, [si]
		mov	dl, cl
		mov	dh, 0
		sub	ax, dx
		mov	di, ax

loc_DF863:
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
		call	sub_6815D

loc_DF87E:
		pop	di
		pop	si
		pop	bp
		retf
sub_DF827		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Palette_FillRange_2CF08 (sub_2CF08 de OPTEST.EXE).
; Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — far, LUE 2026-10-17.
; Remplit une plage (premier indice, nombre) de la palette avec une seule couleur RVB
; (pointeur arg_2).
; ==============================================================================================
Palette_FillRange_DF882		proc far

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
		jz	short loc_DF8F6
		cmp	[si+2], cl
		jbe	short loc_DF89B
		mov	cl, [si+2]

loc_DF89B:
		mov	al, [si+2]
		mov	ah, 0
		add	ax, [si]
		mov	dl, cl
		mov	dh, 0
		add	dx, [bp+arg_6]
		cmp	ax, dx
		jnb	short loc_DF8BD
		mov	al, [si+2]
		mov	ah, 0
		add	ax, [si]
		mov	dl, cl
		mov	dh, 0
		sub	ax, dx
		mov	[bp+arg_6], ax

loc_DF8BD:
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
		jmp	short loc_DF8F1

loc_DF8DA:
		mov	bx, [bp+arg_2]
		mov	al, [bx]
		mov	[di], al
		mov	al, [bx+1]
		mov	[di+1], al
		mov	al, [bx+2]
		mov	[di+2], al
		inc	dx
		add	di, 3

loc_DF8F1:
		cmp	dx, [bp+arg_6]
		jb	short loc_DF8DA

loc_DF8F6:
		pop	di
		pop	si
		pop	bp
		retf
Palette_FillRange_DF882		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Palette_CopyInto_2CF80 (sub_2CF80 de OPTEST.EXE).
; Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — far, LUE 2026-10-17.
; Copie la palette source dans la palette destination, à partir du premier indice de la
; source. Les cinématiques composent ainsi les 256 couleurs à partir de palettes partielles.
; ==============================================================================================
Palette_CopyInto_DF8FA		proc far

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
		jz	short loc_DF95F
		cmp	word ptr [di+3], 0
		jz	short loc_DF95F
		cmp	[si+2], cl
		jbe	short loc_DF91C
		mov	cl, [si+2]

loc_DF91C:
		mov	al, [si+2]
		mov	ah, 0
		add	ax, [si]
		mov	dl, cl
		mov	dh, 0
		add	dx, [bp+arg_6]
		cmp	ax, dx
		jnb	short loc_DF92E

loc_DF92E:
		mov	cx, [di+3]
		mov	al, [di+2]
		mov	ah, 0
		imul	ax, ax, 3
		mov	si, [si+3]
		add	si, ax
		xor	dx, dx
		jmp	short loc_DF95B

loc_DF942:
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

loc_DF95B:
		cmp	[di], dx
		ja	short loc_DF942

loc_DF95F:
		pop	di
		pop	si
		pop	bp
		retf
Palette_CopyInto_DF8FA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_DF963		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= byte ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	cl, [bp+arg_4]
		cmp	[si+2], cl
		jnb	short loc_DF98A
		mov	al, [si+2]
		mov	ah, 0
		add	ax, [si]
		mov	dl, cl
		mov	dh, 0
		cmp	ax, dx
		jbe	short loc_DF98A
		push	cx
		push	[bp+arg_2]
		call	sub_681A8

loc_DF98A:
		pop	si
		pop	bp
		retf
sub_DF963		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_DF98D		proc far

var_6		= word ptr -6
var_4		= word ptr -4
var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	al, [di+2]
		mov	ah, 0
		imul	ax, ax, 3
		mov	dx, [si+3]
		add	dx, ax
		mov	[bp+var_4], dx
		mov	ax, [di+3]
		mov	[bp+var_6], ax
		push	[bp+arg_4]
		mov	ax, [di]
		imul	ax, ax, 3
		push	ax
		push	[bp+var_6]
		push	dx
		call	sub_762BA
		add	sp, 8
		mov	[bp+var_1], al
		pop	di
		pop	si
		leave
		retf
sub_DF98D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_DF9CD		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	word ptr [si+3]
		call	sub_3B2
		pop	cx
		mov	word ptr [si+3], 0
		pop	si
		pop	bp
		retf
sub_DF9CD		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; Palette_LoadAndUpload_2D077 (sub_2D077 de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — far, LUE 2026-10-17.
; Palette_LoadFromResource_2CCE5 puis Palette_Upload_2CDE1 sans découpage.
; ==============================================================================================
Palette_LoadAndUpload_DF9E5		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr Palette_LoadFromResource_DF65F
		add	sp, 4
		push	0
		push	word ptr [si]
		mov	al, [si+2]
		push	ax
		push	si
		push	cs
		call	near ptr Palette_Upload_DF75B
		add	sp, 8
		pop	si
		pop	bp
		retf
Palette_LoadAndUpload_DF9E5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_DFA0A		proc far

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
		push	seg stub392
		push	offset sub_76240
		push	1
		push	[bp+arg_8]
		push	large 30000h
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		mov	[bp+var_2], ax
		xor	dx, dx
		jmp	short loc_DFA67

loc_DFA35:
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

loc_DFA67:
		cmp	dx, [bp+arg_8]
		jb	short loc_DFA35
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
		call	near ptr sub_DF718
		add	sp, 0Ah
		jmp	short loc_DFAA9

loc_DFA94:
		mov	ax, [bp+arg_4]
		mov	[bp+var_10], ax
		push	ax
		push	word ptr [di]
		mov	al, [di+2]
		push	ax
		push	di
		push	cs
		call	near ptr Palette_Upload_DF75B
		add	sp, 8

loc_DFAA9:
		push	63h
		lea	ax, [bp+var_8]
		push	ax
		push	di
		push	cs
		call	near ptr sub_DF98D
		add	sp, 6
		or	al, al
		jnz	short loc_DFA94
		push	[bp+var_2]
		call	sub_3B2
		pop	cx
		lea	ax, [bp+var_8]
		push	ax
		push	cs
		call	near ptr sub_DF9CD
		pop	cx
		pop	di
		pop	si
		leave
		retf
sub_DFA0A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_DFAD1		proc far

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
		call	near ptr Palette_Alloc_DF5F0
		add	sp, 6
		mov	di, si
		push	word ptr [di]
		mov	al, [di+2]
		push	ax
		push	di
		lea	ax, [bp+var_6]
		push	ax
		push	cs
		call	near ptr Palette_CopyInto_DF8FA
		add	sp, 8
		push	[bp+arg_8]
		mov	al, [bp+arg_6]
		push	ax
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr Palette_FillRange_DF882
		jmp	short loc_DFB2F

loc_DFB1D:
		mov	ax, [bp+arg_4]
		mov	[bp+var_C], ax
		push	ax
		push	word ptr [si]
		mov	al, [si+2]
		push	ax
		push	si
		push	cs
		call	near ptr Palette_Upload_DF75B

loc_DFB2F:
		add	sp, 8
		push	63h
		lea	ax, [bp+var_6]
		push	ax
		push	si
		push	cs
		call	near ptr sub_DF98D
		add	sp, 6
		or	al, al
		jnz	short loc_DFB1D
		lea	ax, [bp+var_6]
		push	ax
		push	cs
		call	near ptr sub_DF9CD
		pop	cx
		pop	di
		pop	si
		leave
		retf
sub_DFAD1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à TextureLoader_AllocateC_98A3E (sub_98A3E de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; alloue (CRT_Malloc16_Retry, 22 lignes).
; ==============================================================================================
TextureLoader_AllocateC_DFB51		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		or	dx, dx
		jnz	short loc_DFB67
		push	3
		call	CRT_Malloc16_Retry
		pop	cx
		mov	dx, ax
		or	ax, ax

loc_DFB67:
		mov	ax, dx
		pop	bp
		retf
TextureLoader_AllocateC_DFB51		endp
ovr392		ends
