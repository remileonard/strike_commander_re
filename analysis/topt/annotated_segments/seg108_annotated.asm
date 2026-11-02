seg108		segment	para public 'CODE' use16
		assume cs:seg108
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 6, 0A1h, 8Eh, 49h, 0A3h, 8Ch, 49h

loc_34A17:
		db 5Eh, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à Palette_Alloc_2CC76
; (sub_2CC76 de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier
; ici. — far, LUE 2026-10-17. Palette {+0 nombre de couleurs (arg_4), +2 premier indice
; (arg_2), +3 tableau RVB de 3 octets par couleur alloué par sub_D57}.
; ==============================================================================================
Palette_Alloc_34A1A		proc far

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
		push	seg seg015
		push	offset sub_9E0E
		push	1
		push	dx
		push	large 30000h
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		mov	[si+3], ax
		pop	si
		pop	bp
		retf
Palette_Alloc_34A1A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_34A49		proc far

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
		jmp	short loc_34A81

loc_34A63:
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

loc_34A81:
		cmp	[si], dx
		ja	short loc_34A63
		pop	di
		pop	si
		leave
		retf
sub_34A49		endp

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
Palette_LoadFromResource_34A89		proc far

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
		jz	short loc_34AAB
		push	word ptr [si+3]
		call	sub_39C
		pop	cx
		mov	word ptr [si+3], 0

loc_34AAB:
		push	0
		mov	al, [di+4]
		push	ax
		push	large [di]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
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
		push	seg seg015
		push	offset sub_9E0E
		push	1
		push	word ptr [si]
		push	large 30000h
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		mov	[si+3], ax
		cmp	word ptr [si+3], 0
		jz	short loc_34B0B
		push	large [bp+var_4]
		push	si
		push	cs
		call	near ptr sub_34A49
		add	sp, 6

loc_34B0B:
		cmp	byte ptr [di+5], 0
		jz	short loc_34B2B
		cmp	dword ptr [di], 0
		jz	short loc_34B2B
		push	0
		mov	al, [di+4]
		push	ax
		push	di
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_34B2B

loc_34B2B:
		mov	dword ptr [di], 0
		mov	byte ptr [di+5], 0
		mov	dword ptr [di+6], 0
		pop	di
		pop	si
		leave
		retf
Palette_LoadFromResource_34A89		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_34B42		proc far

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
		call	near ptr Palette_Alloc_34A1A
		add	sp, 6
		push	large [bp+arg_6]
		push	si
		push	cs
		call	near ptr sub_34A49
		add	sp, 6
		pop	si
		pop	bp
		retf
sub_34B42		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_34B67		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+3], 0
		jz	short loc_34B82
		mov	al, [si+2]
		push	ax
		push	word ptr [si]
		push	word ptr [si+3]
		call	sub_35C5F

loc_34B82:
		pop	si
		pop	bp
		retf
sub_34B67		endp

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
Palette_Upload_34B85		proc far

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
		jnz	short loc_34B9F
		jmp	loc_34C4D

loc_34B9F:
		cmp	[si+2], cl
		jbe	short loc_34BA7
		mov	cl, [si+2]

loc_34BA7:
		mov	al, [si+2]
		mov	ah, 0
		add	ax, [si]
		mov	dl, cl
		mov	dh, 0
		add	dx, di
		cmp	ax, dx
		jnb	short loc_34BC7
		mov	al, [si+2]
		mov	ah, 0
		add	ax, [si]
		mov	dl, cl
		mov	dh, 0
		sub	ax, dx
		mov	di, ax

loc_34BC7:
		mov	al, cl
		mov	ah, 0
		mov	dl, [si+2]
		mov	dh, 0
		sub	ax, dx
		imul	ax, ax, 3
		mov	si, [si+3]
		add	si, ax
		cmp	[bp+arg_6], 0
		jz	short loc_34C45
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
		jz	short loc_34C3D
		inc	[bp+var_2]
		jmp	short loc_34C3D

loc_34C00:
		call	sub_35CF8
		mov	al, [bp+var_3]
		push	ax
		push	[bp+var_2]
		push	si
		call	sub_35CCC
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
		jge	short loc_34C37
		mov	ax, dx
		jmp	short loc_34C3A

loc_34C37:
		mov	ax, [bp+var_2]

loc_34C3A:
		mov	[bp+var_2], ax

loc_34C3D:
		cmp	[bp+var_2], 0
		ja	short loc_34C00
		jmp	short loc_34C4D

loc_34C45:
		push	cx
		push	di
		push	si
		call	sub_35CCC

loc_34C4D:
		pop	di
		pop	si
		leave
		retf
Palette_Upload_34B85		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_34C51		proc far

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
		jz	short loc_34CA8
		cmp	[si+2], cl
		jbe	short loc_34C6D
		mov	cl, [si+2]

loc_34C6D:
		mov	al, [si+2]
		mov	ah, 0
		add	ax, [si]
		mov	dl, cl
		mov	dh, 0
		add	dx, di
		cmp	ax, dx
		jnb	short loc_34C8D
		mov	al, [si+2]
		mov	ah, 0
		add	ax, [si]
		mov	dl, cl
		mov	dh, 0
		sub	ax, dx
		mov	di, ax

loc_34C8D:
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
		call	sub_35C5F

loc_34CA8:
		pop	di
		pop	si
		pop	bp
		retf
sub_34C51		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Palette_FillRange_2CF08 (sub_2CF08 de OPTEST.EXE).
; Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — far, LUE 2026-10-17.
; Remplit une plage (premier indice, nombre) de la palette avec une seule couleur RVB
; (pointeur arg_2).
; ==============================================================================================
Palette_FillRange_34CAC		proc far

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
		jz	short loc_34D20
		cmp	[si+2], cl
		jbe	short loc_34CC5
		mov	cl, [si+2]

loc_34CC5:
		mov	al, [si+2]
		mov	ah, 0
		add	ax, [si]
		mov	dl, cl
		mov	dh, 0
		add	dx, [bp+arg_6]
		cmp	ax, dx
		jnb	short loc_34CE7
		mov	al, [si+2]
		mov	ah, 0
		add	ax, [si]
		mov	dl, cl
		mov	dh, 0
		sub	ax, dx
		mov	[bp+arg_6], ax

loc_34CE7:
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
		jmp	short loc_34D1B

loc_34D04:
		mov	bx, [bp+arg_2]
		mov	al, [bx]
		mov	[di], al
		mov	al, [bx+1]
		mov	[di+1], al
		mov	al, [bx+2]
		mov	[di+2], al
		inc	dx
		add	di, 3

loc_34D1B:
		cmp	dx, [bp+arg_6]
		jb	short loc_34D04

loc_34D20:
		pop	di
		pop	si
		pop	bp
		retf
Palette_FillRange_34CAC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Palette_CopyInto_2CF80 (sub_2CF80 de OPTEST.EXE).
; Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — far, LUE 2026-10-17.
; Copie la palette source dans la palette destination, à partir du premier indice de la
; source. Les cinématiques composent ainsi les 256 couleurs à partir de palettes partielles.
; ==============================================================================================
Palette_CopyInto_34D24		proc far

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
		jz	short loc_34D89
		cmp	word ptr [di+3], 0
		jz	short loc_34D89
		cmp	[si+2], cl
		jbe	short loc_34D46
		mov	cl, [si+2]

loc_34D46:
		mov	al, [si+2]
		mov	ah, 0
		add	ax, [si]
		mov	dl, cl
		mov	dh, 0
		add	dx, [bp+arg_6]
		cmp	ax, dx
		jnb	short loc_34D58

loc_34D58:
		mov	cx, [di+3]
		mov	al, [di+2]
		mov	ah, 0
		imul	ax, ax, 3
		mov	si, [si+3]
		add	si, ax
		xor	dx, dx
		jmp	short loc_34D85

loc_34D6C:
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

loc_34D85:
		cmp	[di], dx
		ja	short loc_34D6C

loc_34D89:
		pop	di
		pop	si
		pop	bp
		retf
Palette_CopyInto_34D24		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_34D8D		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= byte ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	cl, [bp+arg_4]
		cmp	[si+2], cl
		jnb	short loc_34DB4
		mov	al, [si+2]
		mov	ah, 0
		add	ax, [si]
		mov	dl, cl
		mov	dh, 0
		cmp	ax, dx
		jbe	short loc_34DB4
		push	cx
		push	[bp+arg_2]
		call	sub_35CAA

loc_34DB4:
		pop	si
		pop	bp
		retf
sub_34D8D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Palette_FadeStep_2D013 (sub_2D013 de OPTEST.EXE).
; Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — far, LUE 2026-10-17.
; Une étape de fondu de la palette arg_0 vers la palette arg_2
; (Palette_StepTowardTarget_2ED93) ; renvoie 0 quand le fondu est terminé.
; ==============================================================================================
Palette_FadeStep_34DB7		proc far

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
		call	sub_2F40E
		pop	di
		pop	si
		leave
		retf
Palette_FadeStep_34DB7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE par position d'appel dans les cinématiques : position d'appel (483 sur
; 487), à Palette_Destruct_2D048 (sub_2D048 de OPTEST.EXE). Code non comparé instruction par
; instruction. — far, LUE 2026-10-17. Libère le tableau RVB, puis l'objet si bit 1 de
; l'argument.
; ==============================================================================================
Palette_Destruct_34DEC		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	word ptr [si+3]
		call	sub_39C
		pop	cx
		mov	word ptr [si+3], 0
		pop	si
		pop	bp
		retf
Palette_Destruct_34DEC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; Palette_LoadAndUpload_2D077 (sub_2D077 de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — far, LUE 2026-10-17.
; Palette_LoadFromResource_2CCE5 puis Palette_Upload_2CDE1 sans découpage.
; ==============================================================================================
Palette_LoadAndUpload_34E04		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr Palette_LoadFromResource_34A89
		add	sp, 4
		push	0
		push	word ptr [si]
		mov	al, [si+2]
		push	ax
		push	si
		push	cs
		call	near ptr Palette_Upload_34B85
		add	sp, 8
		pop	si
		pop	bp
		retf
Palette_LoadAndUpload_34E04		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE par position d'appel dans les cinématiques : position d'appel (16 sur
; 16), à Palette_FadeToColor_2D09C (sub_2D09C de OPTEST.EXE). Code non comparé instruction par
; instruction. — far, LUE 2026-10-17. Fondu de disparition : construit une palette unie
; (couleur arg_2) sur la plage, puis répète Palette_FadeStep_2D013 de la palette courante vers
; elle et Palette_Upload_2CDE1 (pas arg_4) jusqu'à la fin.
; ==============================================================================================
Palette_FadeToColor_34E29		proc far

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
		push	seg seg015
		push	offset sub_9E0E
		push	1
		push	[bp+arg_8]
		push	large 30000h
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		mov	[bp+var_2], ax
		xor	dx, dx
		jmp	short loc_34E86

loc_34E54:
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

loc_34E86:
		cmp	dx, [bp+arg_8]
		jb	short loc_34E54
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
		call	near ptr sub_34B42
		add	sp, 0Ah
		jmp	short loc_34EC8

loc_34EB3:
		mov	ax, [bp+arg_4]
		mov	[bp+var_10], ax
		push	ax
		push	word ptr [di]
		mov	al, [di+2]
		push	ax
		push	di
		push	cs
		call	near ptr Palette_Upload_34B85
		add	sp, 8

loc_34EC8:
		lea	ax, [bp+var_8]
		push	ax
		push	di
		push	cs
		call	near ptr Palette_FadeStep_34DB7
		add	sp, 4
		or	al, al
		jnz	short loc_34EB3
		push	[bp+var_2]
		call	sub_39C
		pop	cx
		lea	ax, [bp+var_8]
		push	ax
		push	cs
		call	near ptr Palette_Destruct_34DEC
		pop	cx
		pop	di
		pop	si
		leave
		retf
Palette_FadeToColor_34E29		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE par position d'appel dans les cinématiques : position d'appel (7 sur
; 7), à Palette_FadeFromColor_2D165 (sub_2D165 de OPTEST.EXE). Code non comparé instruction
; par instruction. — far, LUE 2026-10-17. Fondu d'apparition : garde une copie de la palette
; cible, remplit la plage (premier indice, nombre) avec une couleur unie (arg_2, noir dans
; mid1), puis répète Palette_FadeStep_2D013 vers la copie et Palette_Upload_2CDE1 (pas arg_4)
; jusqu'à la fin.
; ==============================================================================================
Palette_FadeFromColor_34EEE		proc far

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
		call	near ptr Palette_Alloc_34A1A
		add	sp, 6
		mov	di, si
		push	word ptr [di]
		mov	al, [di+2]
		push	ax
		push	di
		lea	ax, [bp+var_6]
		push	ax
		push	cs
		call	near ptr Palette_CopyInto_34D24
		add	sp, 8
		push	[bp+arg_8]
		mov	al, [bp+arg_6]
		push	ax
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr Palette_FillRange_34CAC
		jmp	short loc_34F4C

loc_34F3A:
		mov	ax, [bp+arg_4]
		mov	[bp+var_C], ax
		push	ax
		push	word ptr [si]
		mov	al, [si+2]
		push	ax
		push	si
		push	cs
		call	near ptr Palette_Upload_34B85

loc_34F4C:
		add	sp, 8
		lea	ax, [bp+var_6]
		push	ax
		push	si
		push	cs
		call	near ptr Palette_FadeStep_34DB7
		add	sp, 4
		or	al, al
		jnz	short loc_34F3A
Palette_FadeFromColor_34EEE		endp

; START OF FUNCTION CHUNK FOR Palette_FadeFromColor_34EEE
		db 8Dh
; END OF FUNCTION CHUNK FOR Palette_FadeFromColor_34EEE
seg108		ends
