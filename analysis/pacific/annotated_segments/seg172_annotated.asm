seg172		segment	para public 'CODE' use16
		assume cs:seg172
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0FCh, 66h, 0Fh, 0A4h, 0C2h, 10h, 5Eh, 0C9h, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_689F9		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	di, di
		jz	short loc_68A1D
		mov	ax, [si+2]
		mov	[di+2], ax
		mov	[si+2], di
		cmp	word ptr [si+4], 0
		jnz	short loc_68A1D
		mov	ax, [si+2]
		mov	[si+4], ax

loc_68A1D:
		pop	di
		pop	si
		pop	bp
		retf
sub_689F9		endp

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
LinkedListB_InsertAtTail_68A21		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	dx, [bp+arg_2]
		or	dx, dx
		jz	short loc_68A43
		cmp	word ptr [si+4], 0
		jz	short loc_68A3D
		mov	bx, [si+4]
		mov	[bx+2], dx
		jmp	short loc_68A40

loc_68A3D:
		mov	[si+2], dx

loc_68A40:
		mov	[si+4], dx

loc_68A43:
		pop	si
		pop	bp
		retf
LinkedListB_InsertAtTail_68A21		endp

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
LinkedListB_FindAndDispatch_68A46		proc far

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
		call	near ptr LinkedListB_FindByKey_68AA6
		add	sp, 6
		or	si, si
		jz	short loc_68A6D
		push	3
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_68A6D

loc_68A6D:
		pop	si
		pop	bp
		retf
LinkedListB_FindAndDispatch_68A46		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_68A70		proc far

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
		jz	short loc_68AA2
		or	dx, dx
		jz	short loc_68AA2
		cmp	[si+4], di
		jz	short loc_68A95
		mov	ax, [di+2]
		mov	bx, dx
		mov	[bx+2], ax
		jmp	short loc_68A9F

loc_68A95:
		mov	[si+4], dx
		mov	bx, dx
		mov	word ptr [bx+2], 0

loc_68A9F:
		mov	[di+2], dx

loc_68AA2:
		pop	di
		pop	si
		pop	bp
		retf
sub_68A70		endp

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
LinkedListB_FindByKey_68AA6		proc far

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
		jnz	short loc_68AD0
		mov	dx, [si+2]
		jmp	short loc_68AC4

loc_68ABD:
		mov	di, dx
		mov	bx, dx
		mov	dx, [bx+2]

loc_68AC4:
		or	dx, dx
		jz	short loc_68ACC
		cmp	dx, cx
		jnz	short loc_68ABD

loc_68ACC:
		or	dx, dx
		jz	short loc_68B09

loc_68AD0:
		or	di, di
		jnz	short loc_68AEA
		mov	bx, [si+2]
		mov	ax, [bx+2]
		mov	[si+2], ax
		cmp	word ptr [si+2], 0
		jnz	short loc_68B09
		mov	word ptr [si+4], 0
		jmp	short loc_68B09

loc_68AEA:
		cmp	[si+4], cx
		jz	short loc_68B01
		mov	bx, cx
		mov	ax, [bx+2]
		mov	[di+2], ax
		cmp	[si+2], cx
		jnz	short loc_68B09
		mov	[si+2], ax
		jmp	short loc_68B09

loc_68B01:
		mov	[si+4], di
		mov	word ptr [di+2], 0

loc_68B09:
		pop	di
		pop	si
		pop	bp
		retf
LinkedListB_FindByKey_68AA6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_68B0D		proc far

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		jmp	short loc_68B3A

loc_68B19:
		mov	bx, [si+2]
		mov	ax, [bx+2]
		mov	[bp+var_2], ax
		cmp	word ptr [si+2], 0
		jz	short loc_68B34
		push	3
		push	bx
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_68B34

loc_68B34:
		mov	ax, [bp+var_2]
		mov	[si+2], ax

loc_68B3A:
		cmp	word ptr [si+2], 0
		jnz	short loc_68B19
		xor	ax, ax
		mov	[si+4], ax
		mov	[si+2], ax
		pop	si
		leave
		retf
sub_68B0D		endp

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
LinkedList_Helper_68B4B		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		cmp	word ptr [di], 0
		jnz	short loc_68B60
		mov	ax, [si+2]
		jmp	short loc_68B65

loc_68B60:
		mov	bx, [di]
		mov	ax, [bx+2]

loc_68B65:
		mov	[di], ax
		cmp	word ptr [di], 0
		jz	short loc_68B71
		mov	ax, 1
		jmp	short loc_68B73

loc_68B71:
		xor	ax, ax

loc_68B73:
		pop	di
		pop	si
		pop	bp
		retf
LinkedList_Helper_68B4B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_68B77		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_4], 0
		jmp	short loc_68B8F

loc_68B8B:
		inc	[bp+var_4]

loc_68B8F:
		mov	si, [si+2]
		or	si, si
		jnz	short loc_68B8B
		mov	eax, [bp+var_4]
		shld	edx, eax, 10h
		pop	si
sub_68B77		endp
seg172		ends
