seg005		segment	para public 'CODE' use16
		assume cs:seg005
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5181		proc far
		push	bp
		mov	bp, sp
		call	PagedMemory_CheckDriverPresent_30D62
		pop	bp
		retf
sub_5181		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_518B		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word_49E50, 0
		jnz	short loc_51A3
		mov	byte_4D04A, 0
		call	PagedMemory_CheckDriverPresent_30D62

loc_51A3:
		pop	si
		pop	bp
		retf
sub_518B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_51A6		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_51F7
		mov	word ptr [si], 17Eh
		mov	word ptr [si+4], 1A6h
		cmp	word_49E50, 0
		jnz	short loc_51CF
		mov	byte_4D04A, 0
		call	PagedMemory_CheckDriverPresent_30D62

loc_51CF:
		mov	ax, si
		add	ax, 0Ah
		push	ax
		call	Member_ClearAndFree_2F796
		add	sp, 2
		push	0
		push	si
		call	sub_35D92
		add	sp, 4
		test	di, 1
		jz	short loc_51F7
		push	si
		call	sub_39C
		add	sp, 2

loc_51F7:
		pop	di
		pop	si
		pop	bp
		retf
sub_51A6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_51FB		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		mov	al, 3
		pop	bp
		retf
sub_51FB		endp

; START OF FUNCTION CHUNK FOR sub_51FB
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_51FB

; ----------------------------------------------------------------------

sub_5207		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFFCh
		nop
		nop
		jmp	sub_51A6
sub_5207		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5213		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= dword ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		mov	ax, [bp+arg_0]
		push	0
		push	large [bp+arg_2]
		push	ss
		lea	ax, word ptr [bp+var_4]
		push	ax
		call	sub_31DF0
		add	sp, 0Ah
		mov	eax, [bp+var_4]
		shld	edx, eax, 10h
		leave
		retf
sub_5213		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_523A		proc far

var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	ax, [bp+arg_0]
		mov	si, [bp+arg_2]
		cmp	dword ptr [si], 0
		jz	short loc_5274
		mov	eax, [si]
		mov	[bp+var_4], eax
		mov	[bp+var_8], 0
		mov	[bp+var_8], eax
		push	ss
		lea	ax, word ptr [bp+var_8]
		push	ax
		call	sub_31FAF
		add	sp, 4
		mov	dword ptr [si], 0

loc_5274:
		pop	si
		leave
		retf
sub_523A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5277		proc far

var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= dword ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 8
		mov	ax, [bp+arg_0]
		mov	eax, [bp+arg_2]
		mov	[bp+var_4], eax
		mov	[bp+var_8], 0
		mov	[bp+var_8], eax
		push	ss
		lea	ax, word ptr [bp+var_8]
		push	ax
		call	PagedMemory_WriteByte_31364
		add	sp, 4
		leave
		retf
sub_5277		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_52A3		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		call	sub_32221
		pop	bp
		retf
sub_52A3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_52B0		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	ax, 1
		pop	bp
		retf
sub_52B0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_52BB		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	al, byte_4D04A
		pop	bp
		retf
sub_52BB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_52C6		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	byte_4D04A, 0
		call	PagedMemory_CheckDriverPresent_30D62
		pop	bp
		retf
sub_52C6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 7 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à PagedMemory_ReadTextResource_2B23C (sub_2B23C de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : même suite d'instructions, 7 opérande(s) différent(s) (adresses de données
; ou constantes) — à vérifier à PagedMemory_ReadTextResource_5C14E (sub_5C14E de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️ far, 66 lignes,
; NON DÉTAILLÉE — alloue (sub_658), combine sub_5F4A9 et PagedMemory_InitSubsystem_5BB0D.
; Référencée directement par TextRenderer_Main (sub_27477, seg048) — probable point d'entrée «
; charger une ressource texte depuis la mémoire paginée ».
; ==============================================================================================
PagedMemory_ReadTextResource_52D8		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_52F1
		push	0Eh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_534E

loc_52F1:
		mov	word ptr [si], 1B4h
		mov	ax, word_4D392
		mov	[si+2], ax
		mov	word_4D392, si
		mov	word ptr [si+4], 4511h
		mov	word ptr [si+0Ah], 0
		mov	word ptr [si+0Ch], 0
		mov	word ptr [si+8], seg seg123
		mov	word ptr [si+6], 7
		mov	word ptr [si], 466Bh
		mov	word ptr [si+4], 4693h
		mov	word ptr [si], 17Eh
		mov	word ptr [si+4], 1A6h
		cmp	byte_4D04A, 0
		jz	short loc_5344
		push	300h
		mov	ax, si
		add	ax, 4
		push	ax
		call	DisplayContext_CommitFrameWithTag_300C1
		add	sp, 4
		jmp	short loc_5349

loc_5344:
		call	sub_3101C

loc_5349:
		mov	byte_4D04A, 1

loc_534E:
		mov	ax, si
		pop	si
		pop	bp
		retf
PagedMemory_ReadTextResource_52D8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5353		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_5399
		mov	word ptr [si], 17Eh
		mov	word ptr [si+4], 1A6h
		mov	byte_4D04A, 0
		call	PagedMemory_CheckDriverPresent_30D62
		mov	ax, si
		add	ax, 0Ah
		push	ax
		call	Member_ClearAndFree_2F796
		pop	cx
		push	0
		push	si
		call	sub_35D92
		add	sp, 4
		test	di, 1
		jz	short loc_5399
		push	si
		call	sub_39C
		pop	cx

loc_5399:
		pop	di
		pop	si
		pop	bp
		retf
sub_5353		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_539D		proc far

var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= dword ptr  8
arg_6		= dword ptr  0Ch
arg_A		= dword ptr  10h

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		mov	ax, [bp+arg_0]
		mov	eax, [bp+arg_2]
		mov	[bp+var_4], eax
		mov	[bp+var_8], 0
		mov	[bp+var_C], 0
		mov	[bp+var_8], eax
		mov	eax, [bp+arg_6]
		mov	[bp+var_4], eax
		mov	[bp+var_C], eax
		push	large [bp+arg_A]
		and	eax, 0FFFFFEh
		add	eax, 10h
		push	eax
		mov	eax, [bp+var_8]
		and	eax, 0FFFFFEh
		add	eax, 10h
		push	eax
		call	sub_31804
		add	sp, 0Ch
		leave
		retf
sub_539D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_53F8		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		push	0
		push	0
		push	0
		call	sub_31490
		add	sp, 6
		mov	ax, 1
		pop	bp
		retf
sub_53F8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5411		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_544D
		mov	word ptr [si], 466Bh
		mov	word ptr [si+4], 4693h
		mov	ax, si
		add	ax, 0Ah
		push	ax
		call	Member_ClearAndFree_2F796
		pop	cx
		push	0
		push	si
		call	sub_35D92
		add	sp, 4
		test	di, 1
		jz	short loc_544D
		push	si
		call	sub_39C
		pop	cx

loc_544D:
		pop	di
		pop	si
		pop	bp
sub_5411		endp
seg005		ends
