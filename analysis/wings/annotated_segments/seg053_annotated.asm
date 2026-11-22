seg053		segment	para public 'CODE' use16
		assume cs:seg053
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 59h, 0EBh, 0

loc_25CA3:
		db 5Fh, 5Eh, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; TrackedObjects_CallSlot18OnActive_22F10 (sub_22F10 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, parcourt la liste passée en
; argument (itérateur LinkedListB_Helper_5F6A9, objet à +0xE de chaque nœud) et, pour chaque
; objet dont le bit 0 de +0x52 est posé, appelle le slot +0x18 du sous-vtable pointé par +0x50
; (TrackedObject_FrameStep_2DF0D pour les sous-vtables 0x460 et 0x484 de seg339). Appelée par
; Frame_UpdateTimingAndNotifyTrackedObjects_500F6 avec la liste 0x59CD (EntityTracker) ;
; référencée aussi dans la table d'overlay seg216. Anciennement
; WorldObjects_NotifyMissionTriggers (rien de spécifique aux triggers de mission dans ce
; corps). Rôle exact du slot +0x18 non prouvé au-delà de TrackedObject_FrameStep_2DF0D.
; ==============================================================================================
TrackedObjects_CallSlot18OnActive_25CA7		proc far

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	short loc_25CD5

loc_25CB9:
		mov	bx, [bp+var_2]
		mov	di, [bx+0Eh]
		or	di, di
		jz	short loc_25CD5
		mov	al, [di+52h]
		and	ax, 1
		or	al, al
		jz	short loc_25CD5
		push	di
		mov	bx, [di+50h]
		call	dword ptr [bx+18h]
		pop	cx

loc_25CD5:
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_4874D
		add	sp, 4
		or	ax, ax
		jnz	short loc_25CB9
		pop	di
		pop	si
		leave
		retf
TrackedObjects_CallSlot18OnActive_25CA7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_25CEA		proc far

var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= word ptr -4
var_1		= byte ptr -1
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 20h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_1], 0
		mov	[bp+var_4], 0
		jmp	short loc_25D78

loc_25D00:
		mov	bx, [bp+var_4]
		mov	di, [bx+0Eh]
		or	di, di
		jz	short loc_25D78
		mov	al, [di+52h]
		and	ax, 1
		or	al, al
		jz	short loc_25D78
		push	di
		mov	bx, [di+50h]
		call	dword ptr [bx+10h]
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_25D78
		push	[bp+var_4]
		call	sub_58D89
		pop	cx
		cmp	[si+12h], di
		jnz	short loc_25D78
		cmp	word ptr [si+0Fh], 0
		jz	short loc_25D71
		push	word ptr [si+0Fh]
		call	sub_58D84
		pop	cx
		mov	bx, [si+0Fh]
		mov	di, [bx+0Eh]
		or	di, di
		jz	short loc_25D71
		push	di
		mov	bx, [di+50h]
		call	dword ptr [bx]
		pop	cx
		or	al, al
		jz	short loc_25D71
		push	di
		mov	bx, [di+50h]
		call	dword ptr [bx+14h]
		pop	cx
		mov	[si+11h], al
		mov	[si+12h], di
		mov	word ptr [si+0Fh], 0
		push	di
		mov	bx, [di+50h]
		call	dword ptr [bx+10h]
		pop	cx
		jmp	short loc_25D78

loc_25D71:
		mov	al, 0
		jmp	loc_25EF6
		jmp	short loc_25D71

loc_25D78:
		lea	ax, [bp+var_4]
		push	ax
		push	si
		call	LinkedList_Helper_4874D
		add	sp, 4
		or	ax, ax
		jz	short loc_25D8C
		jmp	loc_25D00

loc_25D8C:
		mov	al, byte_5C5B6
		mov	ah, 0
		or	ax, ax
		jnz	short loc_25DAB
		mov	al, byte_5FDDF
		mov	ah, 0
		cmp	ax, word_5B4D9
		jz	short loc_25DA7
		mov	al, byte_5FDDF
		mov	ah, 0
		jmp	short loc_25DA9

loc_25DA7:
		xor	ax, ax

loc_25DA9:
		mov	al, 0

loc_25DAB:
		push	word ptr [si+12h]
		mov	bx, [si+12h]
		mov	bx, [bx+50h]
		call	dword ptr [bx+1Ch]
		pop	cx
		mov	di, ax
		or	di, di
		jz	short loc_25DE3
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_14]
		push	ax
		mov	bx, [di]
		call	dword ptr [bx+50h]
		add	sp, 6
		mov	eax, [bp+var_14]
		mov	dword_600D0, eax
		mov	eax, [bp+var_10]
		mov	dword_600D4, eax
		mov	eax, [bp+var_C]
		jmp	loc_25ED3

loc_25DE3:
		mov	al, [bp+var_1]
		mov	ah, 0
		or	ax, ax
		jz	short loc_25DEF
		jmp	loc_25ED7

loc_25DEF:
		mov	di, [si+12h]
		add	di, 14h
		mov	eax, [di]
		mov	[bp+var_20], eax
		mov	eax, [di+4]
		mov	[bp+var_1C], eax
		mov	eax, [di+8]
		mov	[bp+var_18], eax
		mov	eax, dword_600C4
		sub	[bp+var_20], eax
		mov	eax, dword_600C8
		sub	[bp+var_1C], eax
		mov	eax, dword_600CC
		sub	[bp+var_18], eax
		cmp	dword_5C59E, 0
		jz	short loc_25E7B
		mov	eax, [bp+var_20]
		mov	edx, eax
		mov	ecx, dword_5C59E
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_20], eax
		mov	eax, [bp+var_1C]
		mov	edx, eax
		mov	ecx, dword_5C59E
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_1C], eax
		mov	eax, [bp+var_18]
		mov	edx, eax
		mov	ecx, dword_5C59E
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		jmp	short loc_25EBB

loc_25E7B:
		mov	[bp+var_8], 0A00h
		mov	eax, [bp+var_20]
		mov	edx, [bp+var_8]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_20], eax
		mov	eax, [bp+var_1C]
		mov	edx, [bp+var_8]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_1C], eax
		mov	eax, [bp+var_18]
		mov	edx, [bp+var_8]
		imul	edx
		shrd	eax, edx, 8

loc_25EBB:
		mov	[bp+var_18], eax
		mov	eax, [bp+var_20]
		mov	dword_600D0, eax
		mov	eax, [bp+var_1C]
		mov	dword_600D4, eax
		mov	eax, [bp+var_18]

loc_25ED3:
		mov	dword_600D8, eax

loc_25ED7:
		mov	si, [si+12h]
		add	si, 14h
		mov	eax, [si]
		mov	dword_600C4, eax
		mov	eax, [si+4]
		mov	dword_600C8, eax
		mov	eax, [si+8]
		mov	dword_600CC, eax
		mov	al, 1

loc_25EF6:
		pop	di
		pop	si
		leave
		retf
sub_25CEA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_25EFA		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_25EFA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_25F02		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_25F02		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_25F0A		proc far
		push	bp
		mov	bp, sp
		push	6256h
		call	Formation_ComputeGeometryHelper_3B522
		pop	cx
		mov	word_5FFA6, 0
		mov	word_5FFA8, 0
		mov	byte_5FFB3, 0
		pop	bp
		retf
sub_25F0A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_25F29		proc far
		push	bp
		mov	bp, sp
		push	6286h
sub_25F29		endp

; START OF FUNCTION CHUNK FOR sub_25F29
		db 9Ah
; END OF FUNCTION CHUNK FOR sub_25F29
seg053		ends
