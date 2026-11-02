seg059		segment	para public 'CODE' use16
		assume cs:seg059
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0D2h, 33h, 0C0h, 5Dh, 0CBh, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_230C7		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, si
		add	ax, 2
		push	ax
		push	ds
		push	offset unk_4F345
		call	sub_4882F
		add	sp, 6
		mov	ax, [si+2]
		cmp	ax, [si+10h]
		jz	short loc_230FC
		mov	ax, si
		add	ax, 10h
		push	ax
		mov	ax, si
		add	ax, 2
		push	ax
		call	UI_ApplyEncodingHelper_35A77
		add	sp, 4

loc_230FC:
		pop	si
		pop	bp
		retf
sub_230C7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_230FF		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	di, [bp+arg_0]
		mov	bx, [bp+arg_2]
		mov	eax, [bx]
		mov	[di], eax
		mov	bx, [bp+arg_2]
		mov	eax, [bx+4]
		mov	[di+4], eax
		mov	bx, [bp+arg_2]
		mov	eax, [bx+8]
		mov	[di+8], eax
		mov	bx, [bp+arg_2]
		mov	eax, [bx+0Ch]
		mov	[di+0Ch], eax
		mov	bx, [bp+arg_2]
		mov	eax, [bx+10h]
		mov	[di+10h], eax
		mov	ax, [bp+arg_2]
		add	ax, 14h
		mov	[bp+var_2], ax
		mov	bx, [bp+var_2]
		mov	eax, [bx]
		mov	[di+14h], eax
		mov	bx, [bp+var_2]
		mov	eax, [bx+4]
		mov	[di+18h], eax
		mov	bx, [bp+var_2]
		mov	eax, [bx+8]
		mov	[di+1Ch], eax
		mov	ax, [bp+arg_2]
		add	ax, 20h
		push	ax
		mov	ax, di
		add	ax, 20h
		push	ax
		call	sub_2A606
		add	sp, 4
		mov	bx, [bp+arg_2]
		mov	eax, [bx+44h]
		mov	[di+44h], eax
		mov	bx, [bp+arg_2]
		mov	ax, [bx+48h]
		mov	[di+48h], ax
		mov	bx, [bp+arg_2]
		mov	ax, [bx+4Ah]
		mov	[di+4Ah], ax
		mov	bx, [bp+arg_2]
		mov	ax, [bx+4Ch]
		mov	[di+4Ch], ax
		mov	bx, [bp+arg_2]
		mov	ax, [bx+4Eh]
		mov	[di+4Eh], ax
		pop	di
		pop	si
		leave
		retf
sub_230FF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_231B0		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		nop
		push	cs
		call	near ptr sub_23340
		add	sp, 2
		mov	al, 1
		pop	si
		pop	bp
		retf
sub_231B0		endp

; START OF FUNCTION CHUNK FOR sub_231B0
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_231B0

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_231C8		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		mov	al, 0
		pop	bp
		retf
sub_231C8		endp

; START OF FUNCTION CHUNK FOR sub_231C8
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_231C8

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_231D4		proc far

var_8		= byte ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	si, [bp+arg_0]
		call	sub_99B8
		shl	eax, 10h
		shrd	eax, edx, 10h
		mov	dword_4F400, eax
		cmp	word ptr [si+5Ch], 0
		jnz	short loc_231F9
		jmp	loc_2332A

loc_231F9:
		push	si
		push	6778h
		push	cs
		call	near ptr sub_230FF
		add	sp, 4
		mov	ax, [si+5Ch]
		add	ax, 2
		mov	[bp+var_6], ax
		push	[bp+var_6]
		lea	ax, [bp+var_4]
		push	ax
		call	sub_3499B
		add	sp, 4
		cmp	byte_4F156, 0
		jz	short loc_23240
		push	si
		nop
		push	cs
		call	near ptr Camera_UpdateViewportClip
		add	sp, 2
		call	sub_99B8
		shl	eax, 10h
		shrd	eax, edx, 10h
		mov	dword_4F404, eax
		jmp	short loc_23274

loc_23240:
		push	0
		push	0
		mov	al, byte_4F288
		push	ax
		push	word_4F286
		push	word ptr dword_4F284
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		mov	bx, [si+5Ch]
		mov	ax, [bx+16h]
		neg	ax
		push	ax
		push	0
		push	word_4D36C
		call	sub_38514
		add	sp, 0Ch

loc_23274:
		push	688Ch
		call	sub_22545
		add	sp, 2
		push	si
		push	6947h
		call	sub_24D7C
		add	sp, 4
		call	sub_99B8
		shl	eax, 10h
		shrd	eax, edx, 10h
		mov	dword_4F408, eax
		push	688Ch
		call	sub_22609
		add	sp, 2
		call	sub_99B8
		shl	eax, 10h
		shrd	eax, edx, 10h
		mov	dword_4F40C, eax
		push	688Ch
		call	sub_22562
		add	sp, 2
		call	sub_99B8
		shl	eax, 10h
		shrd	eax, edx, 10h
		mov	dword_4F410, eax
		push	si
		call	sub_48670
		add	sp, 2
		cmp	byte_4C377, 0
		jz	short loc_232F1
		push	si
		mov	bx, [si+50h]
		call	dword ptr [bx+20h]
		add	sp, 2

loc_232F1:
		push	si
		mov	bx, [si+50h]
		call	dword ptr [bx+14h]
		add	sp, 2
		mov	[bp+var_8], al
		push	word ptr [si+5Ch]
		mov	bx, [si+5Ch]
		mov	bx, [bx]
		call	dword ptr [bx+4]
		add	sp, 2
		call	sub_99B8
		shl	eax, 10h
		shrd	eax, edx, 10h
		mov	dword_4F414, eax
		lea	ax, [bp+var_4]
		push	ax
		call	SmallObject_UnregisterFromList_349C1
		add	sp, 2

loc_2332A:
		pop	si
		leave
		retf
sub_231D4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2332D		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		call	sub_484C0
		add	sp, 2
		pop	si
		pop	bp
		retf
sub_2332D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_23340		proc far

var_96		= dword ptr -96h
var_92		= dword ptr -92h
var_8E		= dword ptr -8Eh
var_8A		= dword ptr -8Ah
var_86		= dword ptr -86h
var_82		= dword ptr -82h
var_7E		= dword ptr -7Eh
var_7A		= dword ptr -7Ah
var_76		= dword ptr -76h
var_72		= dword ptr -72h
var_6E		= word ptr -6Eh
var_6C		= word ptr -6Ch
var_6A		= dword ptr -6Ah
var_66		= dword ptr -66h
var_62		= dword ptr -62h
var_5E		= dword ptr -5Eh
var_5A		= word ptr -5Ah
var_58		= word ptr -58h
var_56		= dword ptr -56h
var_52		= dword ptr -52h
var_4E		= dword ptr -4Eh
var_4A		= dword ptr -4Ah
var_46		= word ptr -46h
var_44		= word ptr -44h
var_42		= dword ptr -42h
var_3E		= dword ptr -3Eh
var_3A		= dword ptr -3Ah
var_36		= dword ptr -36h
var_32		= word ptr -32h
var_30		= word ptr -30h
var_2E		= dword ptr -2Eh
var_2A		= dword ptr -2Ah
var_26		= word ptr -26h
var_24		= dword ptr -24h
var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 96h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	eax, [si+2Ch]
		mov	[bp+var_8A], eax
		mov	eax, [si+30h]
		mov	[bp+var_86], eax
		mov	[bp+var_14], 0
		mov	eax, [bp+var_14]
		mov	[bp+var_82], eax
		lea	ax, word ptr [bp+var_8A]
		push	ax
		call	sub_28F25
		add	sp, 2
		mov	eax, [bp+var_86]
		mov	[bp+var_96], eax
		mov	eax, [bp+var_8A]
		neg	eax
		mov	[bp+var_18], eax
		mov	eax, [bp+var_18]
		mov	[bp+var_1C], eax
		mov	eax, [bp+var_1C]
		mov	[bp+var_92], eax
		mov	eax, [bp+var_82]
		mov	[bp+var_8E], eax
		mov	eax, [bp+var_8A]
		mov	edx, dword_4C3C5
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_8A], eax
		mov	eax, [bp+var_86]
		mov	edx, dword_4C3C5
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_86], eax
		mov	eax, [bp+var_82]
		mov	edx, dword_4C3C5
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_82], eax
		mov	eax, dword_4C3C5
		sar	eax, 1
		mov	[bp+var_20], eax
		mov	eax, [bp+var_20]
		mov	[bp+var_24], eax
		mov	eax, [bp+var_96]
		mov	edx, [bp+var_24]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_96], eax
		mov	eax, [bp+var_92]
		mov	edx, [bp+var_24]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_92], eax
		mov	eax, [bp+var_8E]
		mov	edx, [bp+var_24]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_8E], eax
		mov	eax, [bp+var_96]
		sub	[bp+var_8A], eax
		mov	eax, [bp+var_92]
		sub	[bp+var_86], eax
		mov	eax, [bp+var_8E]
		sub	[bp+var_82], eax
		mov	eax, [bp+var_8A]
		add	[bp+var_96], eax
		mov	eax, [bp+var_86]
		add	[bp+var_92], eax
		mov	eax, [bp+var_82]
		add	[bp+var_8E], eax
		mov	eax, dword_4C3C9
		mov	[bp+var_82], eax
		mov	eax, dword_4C3C9
		mov	[bp+var_8E], eax
		mov	ax, si
		add	ax, 1Ch
		mov	di, ax
		mov	eax, [di]
		sub	[bp+var_82], eax
		mov	ax, si
		add	ax, 20h
		push	ax
		lea	ax, word ptr [bp+var_8A]
		push	ax
		call	Matrix_WorldToLocal_2BED7
		add	sp, 4
		mov	ax, si
		add	ax, 1Ch
		mov	[bp+var_26], ax
		mov	bx, [bp+var_26]
		mov	eax, [bx]
		sub	[bp+var_8E], eax
		mov	ax, si
		add	ax, 20h
		push	ax
		lea	ax, word ptr [bp+var_96]
		push	ax
		call	Matrix_WorldToLocal_2BED7
		add	sp, 4
		mov	[bp+var_2A], 0E6h
		mov	eax, [si+34h]
		cmp	eax, [bp+var_2A]
		jle	short loc_234F4
		mov	ax, 1
		jmp	short loc_234F6

loc_234F4:
		xor	ax, ax

loc_234F6:
		or	al, al
		jnz	short loc_23517
		mov	[bp+var_2E], 0FFFFFF1Ah
		mov	eax, [si+34h]
		cmp	eax, [bp+var_2E]
		jge	short loc_23511
		mov	ax, 1
		jmp	short loc_23513

loc_23511:
		xor	ax, ax

loc_23513:
		or	al, al
		jz	short loc_2356E

loc_23517:
		cmp	dword ptr [si+34h], 0
		jle	short loc_23523
		mov	ax, 1
		jmp	short loc_23525

loc_23523:
		xor	ax, ax

loc_23525:
		or	al, al
		jz	short loc_2354B
		mov	[bp+var_4], 0FFFFFF9Ch
		mov	[bp+var_8], 12Ch
		mov	[bp+var_C], 190h
		mov	[bp+var_10], 12Ch
		jmp	short loc_2356B

loc_2354B:
		mov	[bp+var_4], 0FFFFFF9Ch
		mov	[bp+var_8], 0FFFFFF9Ch
		mov	[bp+var_C], 190h
		mov	[bp+var_10], 0FFFFFF9Ch

loc_2356B:
		jmp	loc_236F4

loc_2356E:
		mov	ax, [si+8]
		mov	[bp+var_30], ax
		mov	ax, si
		add	ax, 0Ch
		mov	[bp+var_32], ax
		push	large [bp+var_86]
		mov	bx, [bp+var_32]
		push	large [bx]
		push	large [bp+var_8A]
		call	Math_FixedMulDiv_2B79E
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 0Ch
		mov	[bp+var_36], eax
		mov	eax, [bp+var_36]
		mov	[bp+var_3A], eax
		movsx	eax, [bp+var_30]
		shl	eax, 8
		mov	edx, [bp+var_3A]
		add	edx, eax
		mov	[bp+var_3E], edx
		mov	eax, [bp+var_3E]
		mov	[bp+var_42], eax
		mov	eax, [bp+var_42]
		sar	eax, 8
		mov	[bp+var_4], eax
		mov	ax, [si+0Ah]
		mov	[bp+var_44], ax
		mov	ax, si
		add	ax, 10h
		mov	[bp+var_46], ax
		push	large [bp+var_86]
		mov	bx, [bp+var_46]
		push	large [bx]
		push	large [bp+var_82]
		call	Math_FixedMulDiv_2B79E
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 0Ch
		mov	[bp+var_4A], eax
		mov	eax, [bp+var_4A]
		mov	[bp+var_4E], eax
		movsx	eax, [bp+var_44]
		shl	eax, 8
		sub	eax, [bp+var_4E]
		mov	[bp+var_52], eax
		mov	eax, [bp+var_52]
		mov	[bp+var_56], eax
		mov	eax, [bp+var_56]
		sar	eax, 8
		mov	[bp+var_8], eax
		mov	ax, [si+8]
		mov	[bp+var_58], ax
		mov	ax, si
		add	ax, 0Ch
		mov	[bp+var_5A], ax
		push	large [bp+var_92]
		mov	bx, [bp+var_5A]
		push	large [bx]
		push	large [bp+var_96]
		call	Math_FixedMulDiv_2B79E
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 0Ch
		mov	[bp+var_5E], eax
		mov	eax, [bp+var_5E]
		mov	[bp+var_62], eax
		movsx	eax, [bp+var_58]
		shl	eax, 8
		mov	edx, [bp+var_62]
		add	edx, eax
		mov	[bp+var_66], edx
		mov	eax, [bp+var_66]
		mov	[bp+var_6A], eax
		mov	eax, [bp+var_6A]
		sar	eax, 8
		mov	[bp+var_C], eax
		mov	ax, [si+0Ah]
		mov	[bp+var_6C], ax
		mov	ax, si
		add	ax, 10h
		mov	[bp+var_6E], ax
		push	large [bp+var_92]
		mov	bx, [bp+var_6E]
		push	large [bx]
		push	large [bp+var_8E]
		call	Math_FixedMulDiv_2B79E
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 0Ch
		mov	[bp+var_72], eax
		mov	eax, [bp+var_72]
		mov	[bp+var_76], eax
		movsx	eax, [bp+var_6C]
		shl	eax, 8
		sub	eax, [bp+var_76]
		mov	[bp+var_7A], eax
		mov	eax, [bp+var_7A]
		mov	[bp+var_7E], eax
		mov	eax, [bp+var_7E]
		sar	eax, 8
		mov	[bp+var_10], eax

loc_236F4:
		cmp	[bp+var_4], 1FFFh
		jle	short loc_23708
		mov	[bp+var_4], 1FFFh
		jmp	short loc_2371A

loc_23708:
		cmp	[bp+var_4], 0FFFFE001h
		jge	short loc_2371A
		mov	[bp+var_4], 0FFFFE001h

loc_2371A:
		cmp	[bp+var_8], 1FFFh
		jle	short loc_2372E
		mov	[bp+var_8], 1FFFh
		jmp	short loc_23740

loc_2372E:
		cmp	[bp+var_8], 0FFFFE001h
		jge	short loc_23740
		mov	[bp+var_8], 0FFFFE001h

loc_23740:
		cmp	[bp+var_C], 1FFFh
		jle	short loc_23754
		mov	[bp+var_C], 1FFFh
		jmp	short loc_23766

loc_23754:
		cmp	[bp+var_C], 0FFFFE001h
		jge	short loc_23766
		mov	[bp+var_C], 0FFFFE001h

loc_23766:
		cmp	[bp+var_10], 1FFFh
		jle	short loc_2377A
		mov	[bp+var_10], 1FFFh
		jmp	short loc_2378C

loc_2377A:
		cmp	[bp+var_10], 0FFFFE001h
		jge	short loc_2378C
		mov	[bp+var_10], 0FFFFE001h

loc_2378C:
		mov	ax, word ptr [bp+var_4]
		mov	[si+76h], ax
		mov	ax, word ptr [bp+var_8]
		mov	[si+78h], ax
		mov	ax, word ptr [bp+var_C]
		mov	[si+7Ah], ax
		mov	ax, word ptr [bp+var_10]
		mov	[si+7Ch], ax
		pop	di
		pop	si
		leave
		retf
sub_23340		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; Camera_UpdateViewportClip (sub_1EA87 de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants
; et contexte à revérifier ici. — Reprise de STRIKE.EXE : même suite d'instructions, 8
; opérande(s) différent(s) (adresses de données ou constantes) — à vérifier à
; Camera_UpdateViewportClip (sub_2E6CB de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants
; et contexte à revérifier ici. — far,36L — compare le rectangle de viewport courant
; (+0x78-0x7E) au précédent, met à jour la zone de clipping si changé (sub_58B97) : mise à
; jour du rectangle de clipping du viewport caméra (cache si inchangé).
; ==============================================================================================
Camera_UpdateViewportClip		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+76h]
		cmp	ax, [si+7Ah]
		jnz	short loc_237BF
		mov	ax, [si+78h]
		cmp	ax, [si+7Ch]
		jz	short loc_237D7

loc_237BF:
		push	word ptr [si+7Ch]
		push	word ptr [si+7Ah]
		push	word ptr [si+78h]
		push	word ptr [si+76h]
		push	word_4D36C
		call	sub_484F0
		add	sp, 0Ah

loc_237D7:
		pop	si
		pop	bp
		retf
Camera_UpdateViewportClip		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_237DA		proc far

var_8		= dword ptr -8
var_4		= dword ptr -4

		push	bp
		mov	bp, sp
		sub	sp, 8
		mov	[bp+var_4], 100h
		mov	eax, [bp+var_4]
		mov	dword_4C156, eax
		mov	word_4F26C, 0
		mov	[bp+var_8], 0D5h
		mov	eax, [bp+var_8]
		mov	dword_4C15A, eax
		mov	dword_4F284, 0
		mov	byte_4F288, 2
		mov	byte_4F289, 0
		mov	dword_4F28A, 0
		leave
		retf
sub_237DA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_23824		proc far
		push	bp
		mov	bp, sp
		cmp	byte_4F289, 0
		jz	short loc_2384C
		cmp	dword_4F284, 0
		jz	short loc_2384C
		push	0
		mov	al, byte_4F288
		push	ax
		push	68A4h
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_2384C

loc_2384C:
		mov	dword_4F284, 0
		mov	byte_4F289, 0
		mov	dword_4F28A, 0
		push	688Ch
		call	sub_226C3
		add	sp, 2
		pop	bp
		retf
sub_23824		endp
seg059		ends
