seg123		segment	para public 'CODE' use16
		assume cs:seg123
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 8Bh, 46h, 0FCh, 66h, 0Fh, 0A4h, 0C2h, 10h, 5Eh, 0C9h, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_485FB		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	di, di
		jz	short loc_4861F
		mov	ax, [si+2]
		mov	[di+2], ax
		mov	[si+2], di
		cmp	word ptr [si+4], 0
		jnz	short loc_4861F
		mov	ax, [si+2]
		mov	[si+4], ax

loc_4861F:
		pop	di
		pop	si
		pop	bp
		retf
sub_485FB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; LinkedListB_InsertAtTail_68A21 (sub_68A21 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : code identique instruction
; par instruction à LinkedListB_InsertAtTail_2FDF4 (sub_2FDF4 de OPTEST.EXE). Résumé repris de
; OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code
; identique instruction par instruction à LinkedListB_InsertAtTail_5F57F (sub_5F57F de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; insère un nœud en queue de la même structure de liste. Référencée par sub_1F4BB et
; sub_2387E.
; ==============================================================================================
LinkedListB_InsertAtTail_48623		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	dx, [bp+arg_2]
		or	dx, dx
		jz	short loc_48645
		cmp	word ptr [si+4], 0
		jz	short loc_4863F
		mov	bx, [si+4]
		mov	[bx+2], dx
		jmp	short loc_48642

loc_4863F:
		mov	[si+2], dx

loc_48642:
		mov	[si+4], dx

loc_48645:
		pop	si
		pop	bp
		retf
LinkedListB_InsertAtTail_48623		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; LinkedListB_FindAndDispatch_68A46 (sub_68A46 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : même suite d'instructions,
; 1 opérande(s) différent(s) (adresses de données ou constantes) — à vérifier à
; LinkedListB_FindAndDispatch_2FE19 (sub_2FE19 de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à LinkedListB_FindAndDispatch_5F5A4 (sub_5F5A4 de STRIKE.EXE). Résumé repris
; de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, recherche un nœud (sub_5F604)
; puis dispatch vtable [bx] si trouvé.
; ==============================================================================================
LinkedListB_FindAndDispatch_48648		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	ax, [bp+arg_0]
		mov	si, [bp+arg_2]
		push	[bp+arg_4]
		push	si
		push	ax
		nop
		push	cs
		call	near ptr LinkedListB_FindByKey_486A8
		add	sp, 6
		or	si, si
		jz	short loc_4866F
		push	3
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_4866F

loc_4866F:
		pop	si
		pop	bp
		retf
LinkedListB_FindAndDispatch_48648		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_48672		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	dx, [bp+arg_4]
		or	di, di
		jz	short loc_486A4
		or	dx, dx
		jz	short loc_486A4
		cmp	[si+4], di
		jz	short loc_48697
		mov	ax, [di+2]
		mov	bx, dx
		mov	[bx+2], ax
		jmp	short loc_486A1

loc_48697:
		mov	[si+4], dx
		mov	bx, dx
		mov	word ptr [bx+2], 0

loc_486A1:
		mov	[di+2], dx

loc_486A4:
		pop	di
		pop	si
		pop	bp
		retf
sub_48672		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; LinkedListB_FindByKey_68AA6 (sub_68AA6 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : code identique instruction
; par instruction à LinkedListB_FindByKey_2FE79 (sub_2FE79 de OPTEST.EXE). Résumé repris de
; OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code
; identique instruction par instruction à LinkedListB_FindByKey_5F604 (sub_5F604 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; recherche un nœud par clé (cx) en parcourant la liste (champ +2). Appelée par
; LinkedListB_FindAndDispatch_5F5A4.
; ==============================================================================================
LinkedListB_FindByKey_486A8		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	cx, [bp+arg_2]
		mov	di, [bp+arg_4]
		or	di, di
		jnz	short loc_486D2
		mov	dx, [si+2]
		jmp	short loc_486C6

loc_486BF:
		mov	di, dx
		mov	bx, dx
		mov	dx, [bx+2]

loc_486C6:
		or	dx, dx
		jz	short loc_486CE
		cmp	dx, cx
		jnz	short loc_486BF

loc_486CE:
		or	dx, dx
		jz	short loc_4870B

loc_486D2:
		or	di, di
		jnz	short loc_486EC
		mov	bx, [si+2]
		mov	ax, [bx+2]
		mov	[si+2], ax
		cmp	word ptr [si+2], 0
		jnz	short loc_4870B
		mov	word ptr [si+4], 0
		jmp	short loc_4870B

loc_486EC:
		cmp	[si+4], cx
		jz	short loc_48703
		mov	bx, cx
		mov	ax, [bx+2]
		mov	[di+2], ax
		cmp	[si+2], cx
		jnz	short loc_4870B
		mov	[si+2], ax
		jmp	short loc_4870B

loc_48703:
		mov	[si+4], di
		mov	word ptr [di+2], 0

loc_4870B:
		pop	di
		pop	si
		pop	bp
		retf
LinkedListB_FindByKey_486A8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4870F		proc far

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		jmp	short loc_4873C

loc_4871B:
		mov	bx, [si+2]
		mov	ax, [bx+2]
		mov	[bp+var_2], ax
		cmp	word ptr [si+2], 0
		jz	short loc_48736
		push	3
		push	bx
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_48736

loc_48736:
		mov	ax, [bp+var_2]
		mov	[si+2], ax

loc_4873C:
		cmp	word ptr [si+2], 0
		jnz	short loc_4871B
		xor	ax, ax
		mov	[si+4], ax
		mov	[si+2], ax
		pop	si
		leave
		retf
sub_4870F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; LinkedList_Helper_68976 (sub_68976 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants
; et contexte à revérifier ici. — Reprise de OPTEST.EXE : même suite d'instructions, 2
; opérande(s) différent(s) (adresses de données ou constantes) — à vérifier à
; LinkedList_Helper_2FC76 (sub_2FC76 de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants
; et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction par
; instruction à LinkedList_Helper_5F401 (sub_5F401 de STRIKE.EXE). Résumé repris de STRIKE.EXE
; ; appelants et contexte à revérifier ici. — far, aucun appel externe visible (rôle exact non
; détaillé, voisin du cluster liste chaînée).
; ==============================================================================================
LinkedList_Helper_4874D		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		cmp	word ptr [di], 0
		jnz	short loc_48762
		mov	ax, [si+2]
		jmp	short loc_48767

loc_48762:
		mov	bx, [di]
		mov	ax, [bx+2]

loc_48767:
		mov	[di], ax
		cmp	word ptr [di], 0
		jz	short loc_48773
		mov	ax, 1
		jmp	short loc_48775

loc_48773:
		xor	ax, ax

loc_48775:
		pop	di
		pop	si
		pop	bp
		retf
LinkedList_Helper_4874D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_48779		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_4], 0
		jmp	short loc_48791

loc_4878D:
		inc	[bp+var_4]

loc_48791:
		mov	si, [si+2]
		or	si, si
		jnz	short loc_4878D
		mov	eax, [bp+var_4]
sub_48779		endp

; START OF FUNCTION CHUNK FOR sub_48779
		db 66h, 0Fh, 0A4h, 0C2h
; END OF FUNCTION CHUNK FOR sub_48779
seg123		ends
