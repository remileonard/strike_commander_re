seg121		segment	para public 'CODE' use16
		assume cs:seg121
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0C9h, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; LinkedList_InsertAtHead_2FA11 (sub_2FA11 de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à LinkedList_InsertAtHead_5F19C (sub_5F19C de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, insère un nœud (di) en tête
; d'une liste doublement chaînée (si, head/tail à +2/+4), met à jour les liens next/prev du
; nœud voisin. Référencée par sub_5F1F8 et sub_664D5.
; ==============================================================================================
LinkedList_InsertAtHead_36332		proc far

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
		jz	short loc_36356
		mov	bx, [si+2]
		mov	[bx+4], di
		jmp	short loc_36359

loc_36356:
		mov	[si+4], di

loc_36359:
		mov	[si+2], di
		pop	di
		pop	si
		pop	bp
		retf
LinkedList_InsertAtHead_36332		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; LinkedList_InsertAtTail_2FA3F (sub_2FA3F de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à LinkedList_InsertAtTail_5F1CA (sub_5F1CA de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, symétrique de
; LinkedList_InsertAtHead_5F19C, insère en queue de liste. Référencée par sub_5F245.
; ==============================================================================================
LinkedList_InsertAtTail_36360		proc far

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
		jz	short loc_36384
		mov	bx, [si+4]
		mov	[bx+2], di
		jmp	short loc_36387

loc_36384:
		mov	[si+2], di

loc_36387:
		mov	[si+4], di
		pop	di
		pop	si
		pop	bp
		retf
LinkedList_InsertAtTail_36360		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; LinkedList_InsertAfter_2FA6D (sub_2FA6D de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à LinkedList_InsertAfter_5F1F8 (sub_5F1F8 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, insère un nœud après un nœud de
; référence donné (ou en tête via LinkedList_InsertAtHead_5F19C si aucune référence).
; ==============================================================================================
LinkedList_InsertAfter_3638E		proc far

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
		jz	short loc_363D7
		or	dx, dx
		jnz	short loc_363AF
		push	di
		push	si
		push	cs
		call	near ptr LinkedList_InsertAtHead_36332
		add	sp, 4
		jmp	short loc_363D7

loc_363AF:
		cmp	[si+4], dx
		jz	short loc_363C7
		mov	bx, dx
		mov	ax, [bx+2]
		mov	[di+2], ax
		mov	[di+4], dx
		mov	bx, [bx+2]
		mov	[bx+4], di
		jmp	short loc_363D2

loc_363C7:
		mov	[si+4], di
		mov	word ptr [di+2], 0
		mov	[di+4], dx

loc_363D2:
		mov	bx, dx
		mov	[bx+2], di

loc_363D7:
		pop	di
		pop	si
		pop	bp
		retf
LinkedList_InsertAfter_3638E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; LinkedList_InsertBefore_2FABA (sub_2FABA de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à LinkedList_InsertBefore_5F245 (sub_5F245 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, insère un nœud avant un nœud de
; référence donné (ou en queue via LinkedList_InsertAtTail_5F1CA si aucune référence).
; ==============================================================================================
LinkedList_InsertBefore_363DB		proc far

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
		jz	short loc_36424
		or	dx, dx
		jnz	short loc_363FC
		push	di
		push	si
		push	cs
		call	near ptr LinkedList_InsertAtTail_36360
		add	sp, 4
		jmp	short loc_36424

loc_363FC:
		cmp	[si+2], dx
		jz	short loc_36414
		mov	[di+2], dx
		mov	bx, dx
		mov	ax, [bx+4]
		mov	[di+4], ax
		mov	bx, [bx+4]
		mov	[bx+2], di
		jmp	short loc_3641F

loc_36414:
		mov	[si+2], di
		mov	word ptr [di+4], 0
		mov	[di+2], dx

loc_3641F:
		mov	bx, dx
		mov	[bx+4], di

loc_36424:
		pop	di
		pop	si
		pop	bp
		retf
LinkedList_InsertBefore_363DB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_36428		proc far

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
		call	near ptr LinkedList_Remove_364BA
		add	sp, 4
		push	di
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr LinkedList_InsertAfter_3638E
		add	sp, 6
		pop	di
		pop	si
		pop	bp
		retf
sub_36428		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3644D		proc far

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
		call	near ptr LinkedList_Remove_364BA
		add	sp, 4
		push	di
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr LinkedList_InsertBefore_363DB
		add	sp, 6
		pop	di
		pop	si
		pop	bp
		retf
sub_3644D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_36472		proc far

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
		call	near ptr LinkedList_Remove_364BA
		add	sp, 4
		push	di
		push	0
		push	si
		push	cs
		call	near ptr LinkedList_InsertAfter_3638E
		add	sp, 6
		pop	di
		pop	si
		pop	bp
		retf
sub_36472		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_36496		proc far

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
		call	near ptr LinkedList_Remove_364BA
		add	sp, 4
		push	di
		push	0
		push	si
		push	cs
		call	near ptr LinkedList_InsertBefore_363DB
		add	sp, 6
		pop	di
		pop	si
		pop	bp
		retf
sub_36496		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à LinkedList_Remove_2FB99
; (sub_2FB99 de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier
; ici. — Reprise de STRIKE.EXE : code identique instruction par instruction à
; LinkedList_Remove_5F324 (sub_5F324 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants
; et contexte à revérifier ici. — far, retire un nœud (di) d'une liste doublement chaînée
; (si), reliant ses voisins entre eux.
; ==============================================================================================
LinkedList_Remove_364BA		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	di, di
		jz	short loc_36503
		mov	dx, [di+4]
		or	dx, dx
		jz	short loc_364DA
		mov	ax, [di+2]
		mov	bx, dx
		mov	[bx+2], ax
		jmp	short loc_364E0

loc_364DA:
		mov	ax, [di+2]
		mov	[si+2], ax

loc_364E0:
		cmp	word ptr [di+2], 0
		jz	short loc_364EE
		mov	bx, [di+2]
		mov	[bx+4], dx
		jmp	short loc_36503

loc_364EE:
		or	dx, dx
		jz	short loc_364FB
		mov	bx, dx
		mov	word ptr [bx+2], 0
		jmp	short loc_36500

loc_364FB:
		mov	word ptr [si+2], 0

loc_36500:
		mov	[si+4], dx

loc_36503:
		pop	di
		pop	si
		pop	bp
		retf
LinkedList_Remove_364BA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_36507		proc far

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
		call	near ptr LinkedList_Remove_364BA
		add	sp, 4
		or	si, si
		jz	short loc_3652A
		push	3
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_3652A

loc_3652A:
		pop	si
		pop	bp
		retf
sub_36507		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3652D		proc far

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		jmp	short loc_3655A

loc_36539:
		mov	bx, [si+2]
		mov	ax, [bx+2]
		mov	[bp+var_2], ax
		cmp	word ptr [si+2], 0
		jz	short loc_36554
		push	3
		push	bx
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_36554

loc_36554:
		mov	ax, [bp+var_2]
		mov	[si+2], ax

loc_3655A:
		cmp	word ptr [si+2], 0
		jnz	short loc_36539
		xor	ax, ax
		mov	[si+4], ax
		mov	[si+2], ax
		pop	si
		leave
		retf
sub_3652D		endp

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
LinkedList_Helper_3656B		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		cmp	word ptr [di], 0
		jnz	short loc_36580
		mov	ax, [si+2]
		jmp	short loc_36585

loc_36580:
		mov	bx, [di]
		mov	ax, [bx+2]

loc_36585:
		mov	[di], ax
		cmp	word ptr [di], 0
		jz	short loc_36591
		mov	ax, 1
		jmp	short loc_36593

loc_36591:
		xor	ax, ax

loc_36593:
		pop	di
		pop	si
		pop	bp
		retf
LinkedList_Helper_3656B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à LinkedList_Helper_2FC76
; (sub_2FC76 de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier
; ici. — Reprise de STRIKE.EXE : code identique instruction par instruction à
; LinkedList_Helper_5F401 (sub_5F401 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants
; et contexte à revérifier ici. — far, aucun appel externe visible (rôle exact non détaillé,
; voisin du cluster liste chaînée).
; ==============================================================================================
LinkedList_Helper_36597		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		cmp	word ptr [di], 0
		jnz	short loc_365AC
		mov	ax, [si+4]
		jmp	short loc_365B1

loc_365AC:
		mov	bx, [di]
		mov	ax, [bx+4]

loc_365B1:
		mov	[di], ax
		cmp	word ptr [di], 0
		jz	short loc_365BD
		mov	ax, 1
		jmp	short loc_365BF

loc_365BD:
		xor	ax, ax

loc_365BF:
		pop	di
		pop	si
		pop	bp
		retf
LinkedList_Helper_36597		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_365C3		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_4], 0
		jmp	short loc_365DB
		inc	[bp+var_4]

loc_365DB:
		mov	si, [si+2]
		or	si, si
sub_365C3		endp
seg121		ends
