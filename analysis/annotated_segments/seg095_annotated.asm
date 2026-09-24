seg095		segment	byte public 'CODE' use16
		assume cs:seg095
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ==============================================================================================
; far, LUE (2026-09-24). Slot +8 de la vtable modele DECY (seg339 tag 0x2430, XREF
; seg339:2438) : mov al, 10h -> categorie d'objet 0x10 = leurre.
; ==============================================================================================
DecoyModel_GetCategory_45190:				; DATA XREF: seg339:2438o
		push	bp
		mov	bp, sp
		mov	al, 10h
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_45197:				; DATA XREF: seg339:off_6ED4Eo
		push	bp

loc_45198:				; DATA XREF: seg216:03BEo
		mov	bp, sp
		mov	ax, [bp+6]
		mov	al, 10h
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_451A1:				; DATA XREF: seg339:off_6ED1Eo
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		push	word ptr [bp+8]
		push	ax
		call	Debris_NotifyChildValidate
		add	sp, 4
		pop	bp
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, LUE (2026-09-24). Slot +0x10 (mise a jour) de l'instance LEURRE (vtable 0x6ED1A) :
; inst+0x2E -= dt (dword_70458) ; tant que +0x2E >= 0 appelle Camera_NotifyFollowTarget ;
; renvoie 1 si l'objet vit encore. Le leurre meurt quand son temps restant passe sous 0.
; ==============================================================================================
Decoy_TickLifetime_451B5:				; DATA XREF: seg339:off_6ED2Ao
		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+6]
		mov	byte ptr [bp-1], 0
		mov	eax, dword_70458
		sub	[si+2Eh], eax
		mov	eax, [si+2Eh]
		sar	eax, 1Fh
		inc	ax
		or	ax, ax
		jz	short loc_451EB
		push	si
		call	Camera_NotifyFollowTarget
		pop	cx
		or	al, al
		jz	short loc_451EB
		mov	al, [bp-1]
		inc	al
		mov	[bp-1],	al

loc_451EB:				; CODE XREF: seg095:0046j seg095:0051j
		mov	al, [bp-1]
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, LUE (2026-09-24). Methode virtuelle +0x7C de l'instance LEURRE (classe DECY, vtable
; seg339 0x6ED1A = tag 0x1C6A) : signature = octet modele +0x12 (1er octet SIGN) * (temps
; restant instance+0x2E / duree modele+0x37). Calcul : ratio = (inst+0x2E << 8) / (modele+0x37
; << 8), sig = ratio * (S0 << 8) >> 8, renvoie sig >> 8 (octet). La chaleur du leurre DECROIT
; LINEAIREMENT jusqu'a 0 a la fin de sa vie. Ex-'WorldObject_GetSignatureByte0_ModelDirect'
; (l'ancien resume disait le quotient inutilise : faux, il multiplie S0).
; ==============================================================================================
Decoy_GetFadingSignature0_451F1:				; DATA XREF: seg339:1CE6o
		push	bp
		mov	bp, sp
		sub	sp, 24h
		push	si
		mov	si, [bp+6]
		les	bx, [si+0Eh]
		mov	al, es:[bx+12h]
		mov	[bp-1],	al
		mov	eax, es:[bx+37h]
		mov	[bp-6],	eax
		add	si, 2Eh	; '.'
		mov	eax, [si]
		mov	[bp-0Eh], eax
		mov	eax, [bp-6]
		mov	[bp-12h], eax
		shl	eax, 8
		mov	[bp-16h], eax
		mov	eax, [bp-0Eh]
		mov	edx, eax
		mov	ecx, [bp-16h]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp-1Ah], eax
		mov	eax, [bp-1Ah]
		mov	[bp-1Eh], eax
		mov	[bp-0Ah], eax
		mov	al, [bp-1]
		mov	ah, 0
		mov	[bp-20h], ax
		movsx	eax, word ptr [bp-20h]
		shl	eax, 8
		mov	[bp-24h], eax
		mov	eax, [bp-0Ah]
		mov	edx, [bp-24h]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-0Ah], eax
		mov	eax, [bp-0Ah]
		sar	eax, 8
		mov	[bp-1],	al
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, LUE (2026-09-24). Methode virtuelle +0x8C de l'instance LEURRE (DECY, vtable 0x6ED1A) :
; meme calcul que Decoy_GetFadingSignature0_451F1 sur l'octet modele +0x13 (2e octet SIGN) :
; S1 * temps restant / duree. Consommateur du slot +0x8C non trace (Debris_GetSubpartAttrib,
; utilise par l'aspec 4, lit modele+0x13 directement, sans decroissance).
; ==============================================================================================
Decoy_GetFadingSignature1_45285:				; DATA XREF: seg339:off_6EDA6o
		push	bp
		mov	bp, sp
		sub	sp, 24h
		push	si
		mov	si, [bp+6]
		les	bx, [si+0Eh]
		mov	al, es:[bx+13h]
		mov	[bp-1],	al
		mov	eax, es:[bx+37h]
		mov	[bp-6],	eax
		add	si, 2Eh	; '.'
		mov	eax, [si]
		mov	[bp-0Eh], eax
		mov	eax, [bp-6]
		mov	[bp-12h], eax
		shl	eax, 8
		mov	[bp-16h], eax
		mov	eax, [bp-0Eh]
		mov	edx, eax
		mov	ecx, [bp-16h]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp-1Ah], eax
		mov	eax, [bp-1Ah]
		mov	[bp-1Eh], eax
		mov	[bp-0Ah], eax
		mov	al, [bp-1]
		mov	ah, 0
		mov	[bp-20h], ax
		movsx	eax, word ptr [bp-20h]
		shl	eax, 8
		mov	[bp-24h], eax
		mov	eax, [bp-0Ah]
		mov	edx, [bp-24h]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-0Ah], eax
		mov	eax, [bp-0Ah]
		sar	eax, 8
		mov	[bp-1],	al
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_45319:				; DATA XREF: seg339:off_6ED52o
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		mov	ax, [si+32h]
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_45326:				; DATA XREF: seg339:off_6ED32o
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		or	si, si
		jz	short loc_45368
		mov	word ptr [si], 1C6Ah
		cmp	word_70472, 0
		jle	short loc_45344
		dec	word_70472

loc_45344:				; CODE XREF: seg095:01AEj
		mov	ax, si
		add	ax, 32h	; '2'
		push	ax
		call	WeakRef_InvalidateIfSet
		pop	cx
		push	0
		push	si
		call	Camera_DestructFollow
		add	sp, 4
		test	di, 1

loc_4535F:
		jz	short loc_45368
		push	si
		call	CRT_FreeNear_Wrap
		pop	cx

loc_45368:				; CODE XREF: seg095:01A3j
					; seg095:loc_4535Fj
		pop	di
		pop	si
		pop	bp
		retf
seg095		ends
