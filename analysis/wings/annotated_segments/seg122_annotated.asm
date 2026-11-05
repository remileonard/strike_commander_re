seg122		segment	para public 'CODE' use16
		assume cs:seg122
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 8Bh, 0Eh, 1Dh, 1, 0B8h, 9, 12h, 0BBh, 46h, 53h, 0CDh, 15h, 5Fh, 0C9h, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; LinkedList_InsertAtHead_6873D (sub_6873D de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : code identique instruction
; par instruction à LinkedList_InsertAtHead_2FA11 (sub_2FA11 de OPTEST.EXE). Résumé repris de
; OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code
; identique instruction par instruction à LinkedList_InsertAtHead_5F19C (sub_5F19C de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; insère un nœud (di) en tête d'une liste doublement chaînée (si, head/tail à +2/+4), met à
; jour les liens next/prev du nœud voisin. Référencée par sub_5F1F8 et sub_664D5.
; ==============================================================================================
LinkedList_InsertAtHead_4833F		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	word ptr [di+4], 0
		mov	ax, [si+2]
		mov	[di+2], ax
		cmp	word ptr [si+2], 0
		jz	short loc_48363
		mov	bx, [si+2]
		mov	[bx+4], di
		jmp	short loc_48366

loc_48363:
		mov	[si+4], di

loc_48366:
		mov	[si+2], di
		pop	di
		pop	si
		pop	bp
		retf
LinkedList_InsertAtHead_4833F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; LinkedList_InsertAtTail_6876B (sub_6876B de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : code identique instruction
; par instruction à LinkedList_InsertAtTail_2FA3F (sub_2FA3F de OPTEST.EXE). Résumé repris de
; OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code
; identique instruction par instruction à LinkedList_InsertAtTail_5F1CA (sub_5F1CA de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; symétrique de LinkedList_InsertAtHead_5F19C, insère en queue de liste. Référencée par
; sub_5F245.
; ==============================================================================================
LinkedList_InsertAtTail_4836D		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	ax, [si+4]
		mov	[di+4], ax
		mov	word ptr [di+2], 0
		cmp	word ptr [si+4], 0
		jz	short loc_48391
		mov	bx, [si+4]
		mov	[bx+2], di
		jmp	short loc_48394

loc_48391:
		mov	[si+2], di

loc_48394:
		mov	[si+4], di
		pop	di
		pop	si
		pop	bp
		retf
LinkedList_InsertAtTail_4836D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; LinkedList_InsertAfter_68799 (sub_68799 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : code identique instruction
; par instruction à LinkedList_InsertAfter_2FA6D (sub_2FA6D de OPTEST.EXE). Résumé repris de
; OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code
; identique instruction par instruction à LinkedList_InsertAfter_5F1F8 (sub_5F1F8 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; insère un nœud après un nœud de référence donné (ou en tête via
; LinkedList_InsertAtHead_5F19C si aucune référence).
; ==============================================================================================
LinkedList_InsertAfter_4839B		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	dx, [bp+arg_2]
		mov	di, [bp+arg_4]
		or	di, di
		jz	short loc_483E4
		or	dx, dx
		jnz	short loc_483BC
		push	di
		push	si
		push	cs
		call	near ptr LinkedList_InsertAtHead_4833F
		add	sp, 4
		jmp	short loc_483E4

loc_483BC:
		cmp	[si+4], dx
		jz	short loc_483D4
		mov	bx, dx
		mov	ax, [bx+2]
		mov	[di+2], ax
		mov	[di+4], dx
		mov	bx, [bx+2]
		mov	[bx+4], di
		jmp	short loc_483DF

loc_483D4:
		mov	[si+4], di
		mov	word ptr [di+2], 0
		mov	[di+4], dx

loc_483DF:
		mov	bx, dx
		mov	[bx+2], di

loc_483E4:
		pop	di
		pop	si
		pop	bp
		retf
LinkedList_InsertAfter_4839B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; LinkedList_InsertBefore_687E6 (sub_687E6 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : code identique instruction
; par instruction à LinkedList_InsertBefore_2FABA (sub_2FABA de OPTEST.EXE). Résumé repris de
; OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code
; identique instruction par instruction à LinkedList_InsertBefore_5F245 (sub_5F245 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; insère un nœud avant un nœud de référence donné (ou en queue via
; LinkedList_InsertAtTail_5F1CA si aucune référence).
; ==============================================================================================
LinkedList_InsertBefore_483E8		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	dx, [bp+arg_2]
		mov	di, [bp+arg_4]
		or	di, di
		jz	short loc_48431
		or	dx, dx
		jnz	short loc_48409
		push	di
		push	si
		push	cs
		call	near ptr LinkedList_InsertAtTail_4836D
		add	sp, 4
		jmp	short loc_48431

loc_48409:
		cmp	[si+2], dx
		jz	short loc_48421
		mov	[di+2], dx
		mov	bx, dx
		mov	ax, [bx+4]
		mov	[di+4], ax
		mov	bx, [bx+4]
		mov	[bx+2], di
		jmp	short loc_4842C

loc_48421:
		mov	[si+2], di
		mov	word ptr [di+4], 0
		mov	[di+2], dx

loc_4842C:
		mov	bx, dx
		mov	[bx+4], di

loc_48431:
		pop	di
		pop	si
		pop	bp
		retf
LinkedList_InsertBefore_483E8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_48435		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_4]
		push	di
		push	si
		nop
		push	cs
		call	near ptr LinkedList_Remove_484C7
		add	sp, 4
		push	di
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr LinkedList_InsertAfter_4839B
		add	sp, 6
		pop	di
		pop	si
		pop	bp
		retf
sub_48435		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4845A		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_4]
		push	di
		push	si
		nop
		push	cs
		call	near ptr LinkedList_Remove_484C7
		add	sp, 4
		push	di
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr LinkedList_InsertBefore_483E8
		add	sp, 6
		pop	di
		pop	si
		pop	bp
		retf
sub_4845A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4847F		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	di
		push	si
		nop
		push	cs
		call	near ptr LinkedList_Remove_484C7
		add	sp, 4
		push	di
		push	0
		push	si
		push	cs
		call	near ptr LinkedList_InsertAfter_4839B
		add	sp, 6
		pop	di
		pop	si
		pop	bp
		retf
sub_4847F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_484A3		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	di
		push	si
		nop
		push	cs
		call	near ptr LinkedList_Remove_484C7
		add	sp, 4
		push	di
		push	0
		push	si
		push	cs
		call	near ptr LinkedList_InsertBefore_483E8
		add	sp, 6
		pop	di
		pop	si
		pop	bp
		retf
sub_484A3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; LinkedList_Remove_688C5 (sub_688C5 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants
; et contexte à revérifier ici. — Reprise de OPTEST.EXE : code identique instruction par
; instruction à LinkedList_Remove_2FB99 (sub_2FB99 de OPTEST.EXE). Résumé repris de OPTEST.EXE
; ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique
; instruction par instruction à LinkedList_Remove_5F324 (sub_5F324 de STRIKE.EXE). Résumé
; repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, retire un nœud (di)
; d'une liste doublement chaînée (si), reliant ses voisins entre eux.
; ==============================================================================================
LinkedList_Remove_484C7		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	di, di
		jz	short loc_48510
		mov	dx, [di+4]
		or	dx, dx
		jz	short loc_484E7
		mov	ax, [di+2]
		mov	bx, dx
		mov	[bx+2], ax
		jmp	short loc_484ED

loc_484E7:
		mov	ax, [di+2]
		mov	[si+2], ax

loc_484ED:
		cmp	word ptr [di+2], 0
		jz	short loc_484FB
		mov	bx, [di+2]
		mov	[bx+4], dx
		jmp	short loc_48510

loc_484FB:
		or	dx, dx
		jz	short loc_48508
		mov	bx, dx
		mov	word ptr [bx+2], 0
		jmp	short loc_4850D

loc_48508:
		mov	word ptr [si+2], 0

loc_4850D:
		mov	[si+4], dx

loc_48510:
		pop	di
		pop	si
		pop	bp
		retf
LinkedList_Remove_484C7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_48514		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	ax, [bp+arg_0]
		mov	si, [bp+arg_2]
		push	si
		push	ax
		push	cs
		call	near ptr LinkedList_Remove_484C7
		add	sp, 4
		or	si, si
		jz	short loc_48537
		push	3
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_48537

loc_48537:
		pop	si
		pop	bp
		retf
sub_48514		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4853A		proc far

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		jmp	short loc_48567

loc_48546:
		mov	bx, [si+2]
		mov	ax, [bx+2]
		mov	[bp+var_2], ax
		cmp	word ptr [si+2], 0
		jz	short loc_48561
		push	3
		push	bx
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_48561

loc_48561:
		mov	ax, [bp+var_2]
		mov	[si+2], ax

loc_48567:
		cmp	word ptr [si+2], 0
		jnz	short loc_48546
		xor	ax, ax
		mov	[si+4], ax
		mov	[si+2], ax
		pop	si
		leave
		retf
sub_4853A		endp

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
LinkedList_Helper_48578		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		cmp	word ptr [di], 0
		jnz	short loc_4858D
		mov	ax, [si+2]
		jmp	short loc_48592

loc_4858D:
		mov	bx, [di]
		mov	ax, [bx+2]

loc_48592:
		mov	[di], ax
		cmp	word ptr [di], 0
		jz	short loc_4859E
		mov	ax, 1
		jmp	short loc_485A0

loc_4859E:
		xor	ax, ax

loc_485A0:
		pop	di
		pop	si
		pop	bp
		retf
LinkedList_Helper_48578		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; LinkedList_Helper_689A2 (sub_689A2 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants
; et contexte à revérifier ici. — Reprise de OPTEST.EXE : code identique instruction par
; instruction à LinkedList_Helper_2FC76 (sub_2FC76 de OPTEST.EXE). Résumé repris de OPTEST.EXE
; ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique
; instruction par instruction à LinkedList_Helper_5F401 (sub_5F401 de STRIKE.EXE). Résumé
; repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, aucun appel externe
; visible (rôle exact non détaillé, voisin du cluster liste chaînée).
; ==============================================================================================
LinkedList_Helper_485A4		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		cmp	word ptr [di], 0
		jnz	short loc_485B9
		mov	ax, [si+4]
		jmp	short loc_485BE

loc_485B9:
		mov	bx, [di]
		mov	ax, [bx+4]

loc_485BE:
		mov	[di], ax
		cmp	word ptr [di], 0
		jz	short loc_485CA
		mov	ax, 1
		jmp	short loc_485CC

loc_485CA:
		xor	ax, ax

loc_485CC:
		pop	di
		pop	si
		pop	bp
		retf
LinkedList_Helper_485A4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_485D0		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_4], 0
		jmp	short loc_485E8

loc_485E4:
		inc	[bp+var_4]

loc_485E8:
		mov	si, [si+2]
		or	si, si
		jnz	short loc_485E4
sub_485D0		endp

; START OF FUNCTION CHUNK FOR sub_485D0
		db 66h
; END OF FUNCTION CHUNK FOR sub_485D0
seg122		ends
