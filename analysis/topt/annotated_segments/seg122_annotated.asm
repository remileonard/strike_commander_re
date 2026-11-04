seg122		segment	para public 'CODE' use16
		assume cs:seg122
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 75h, 0F5h, 66h, 8Bh, 46h, 0FCh, 66h, 0Fh, 0A4h, 0C2h, 10h, 5Eh, 0C9h, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_365EE		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	di, di
		jz	short loc_36612
		mov	ax, [si+2]
		mov	[di+2], ax
		mov	[si+2], di
		cmp	word ptr [si+4], 0
		jnz	short loc_36612
		mov	ax, [si+2]
		mov	[si+4], ax

loc_36612:
		pop	di
		pop	si
		pop	bp
		retf
sub_365EE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; LinkedListB_InsertAtTail_2FDF4 (sub_2FDF4 de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à LinkedListB_InsertAtTail_5F57F (sub_5F57F de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, insère un nœud en queue de la
; même structure de liste. Référencée par sub_1F4BB et sub_2387E.
; ==============================================================================================
LinkedListB_InsertAtTail_36616		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	dx, [bp+arg_2]
		or	dx, dx
		jz	short loc_36638
		cmp	word ptr [si+4], 0
		jz	short loc_36632
		mov	bx, [si+4]
		mov	[bx+2], dx
		jmp	short loc_36635

loc_36632:
		mov	[si+2], dx

loc_36635:
		mov	[si+4], dx

loc_36638:
		pop	si
		pop	bp
		retf
LinkedListB_InsertAtTail_36616		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à LinkedListB_FindAndDispatch_2FE19 (sub_2FE19 de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : code identique instruction par instruction à
; LinkedListB_FindAndDispatch_5F5A4 (sub_5F5A4 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, recherche un nœud (sub_5F604) puis dispatch
; vtable [bx] si trouvé.
; ==============================================================================================
LinkedListB_FindAndDispatch_3663B		proc far

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
		call	near ptr LinkedListB_FindByKey_3669B
		add	sp, 6
		or	si, si
		jz	short loc_36662
		push	3
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_36662

loc_36662:
		pop	si
		pop	bp
		retf
LinkedListB_FindAndDispatch_3663B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_36665		proc far

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
		jz	short loc_36697
		or	dx, dx
		jz	short loc_36697
		cmp	[si+4], di
		jz	short loc_3668A
		mov	ax, [di+2]
		mov	bx, dx
		mov	[bx+2], ax
		jmp	short loc_36694

loc_3668A:
		mov	[si+4], dx
		mov	bx, dx
		mov	word ptr [bx+2], 0

loc_36694:
		mov	[di+2], dx

loc_36697:
		pop	di
		pop	si
		pop	bp
		retf
sub_36665		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; LinkedListB_FindByKey_2FE79 (sub_2FE79 de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à LinkedListB_FindByKey_5F604 (sub_5F604 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, recherche un nœud par clé (cx)
; en parcourant la liste (champ +2). Appelée par LinkedListB_FindAndDispatch_5F5A4.
; ==============================================================================================
LinkedListB_FindByKey_3669B		proc far

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
		jnz	short loc_366C5
		mov	dx, [si+2]
		jmp	short loc_366B9

loc_366B2:
		mov	di, dx
		mov	bx, dx
		mov	dx, [bx+2]

loc_366B9:
		or	dx, dx
		jz	short loc_366C1
		cmp	dx, cx
		jnz	short loc_366B2

loc_366C1:
		or	dx, dx
		jz	short loc_366FE

loc_366C5:
		or	di, di
		jnz	short loc_366DF
		mov	bx, [si+2]
		mov	ax, [bx+2]
		mov	[si+2], ax
		cmp	word ptr [si+2], 0
		jnz	short loc_366FE
		mov	word ptr [si+4], 0
		jmp	short loc_366FE

loc_366DF:
		cmp	[si+4], cx
		jz	short loc_366F6
		mov	bx, cx
		mov	ax, [bx+2]
		mov	[di+2], ax
		cmp	[si+2], cx
		jnz	short loc_366FE
		mov	[si+2], ax
		jmp	short loc_366FE

loc_366F6:
		mov	[si+4], di
		mov	word ptr [di+2], 0

loc_366FE:
		pop	di
		pop	si
		pop	bp
		retf
LinkedListB_FindByKey_3669B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_36702		proc far

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		jmp	short loc_3672F

loc_3670E:
		mov	bx, [si+2]
		mov	ax, [bx+2]
		mov	[bp+var_2], ax
		cmp	word ptr [si+2], 0
		jz	short loc_36729
		push	3
		push	bx
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_36729

loc_36729:
		mov	ax, [bp+var_2]
		mov	[si+2], ax

loc_3672F:
		cmp	word ptr [si+2], 0
		jnz	short loc_3670E
		xor	ax, ax
		mov	[si+4], ax
		mov	[si+2], ax
		pop	si
		leave
		retf
sub_36702		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à LinkedList_Helper_2FC76 (sub_2FC76 de OPTEST.EXE).
; Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de
; STRIKE.EXE : code identique instruction par instruction à LinkedList_Helper_5F401 (sub_5F401
; de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; aucun appel externe visible (rôle exact non détaillé, voisin du cluster liste chaînée).
; ==============================================================================================
LinkedList_Helper_36740		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		cmp	word ptr [di], 0
		jnz	short loc_36755
		mov	ax, [si+2]
		jmp	short loc_3675A

loc_36755:
		mov	bx, [di]
		mov	ax, [bx+2]

loc_3675A:
		mov	[di], ax
		cmp	word ptr [di], 0
		jz	short loc_36766
		mov	ax, 1
		jmp	short loc_36768

loc_36766:
		xor	ax, ax

loc_36768:
		pop	di
		pop	si
		pop	bp
		retf
LinkedList_Helper_36740		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3676C		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_4], 0
		jmp	short loc_36784

loc_36780:
		inc	[bp+var_4]

loc_36784:
		mov	si, [si+2]
		or	si, si
		jnz	short loc_36780
		mov	eax, [bp+var_4]
sub_3676C		endp

; START OF FUNCTION CHUNK FOR sub_3676C
		db 66h
; END OF FUNCTION CHUNK FOR sub_3676C
seg122		ends
