ovr209		segment	para public 'OVERLAY' use16
		assume cs:ovr209
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

loc_B6FF0:				; CODE XREF: sub_42620J
		push	bp
		mov	bp, sp
		sub	sp, 0D1Ah
		push	si
		push	di
		mov	word ptr [bp-4], 0
		push	0C8h ; '�'
		push	0Ch
		lea	ax, [bp-6]
		push	ax
		call	TextArray_Init_CBE1
		add	sp, 6
		mov	byte_495FC, 0
		mov	byte ptr [bp-7], 0
		mov	byte ptr [bp-8], 0
		mov	byte ptr [bp-9], 0
		cmp	word_4684B, 0
		jz	short loc_B702B
		mov	byte ptr [bp-8], 1

loc_B702B:				; CODE XREF: ovr209:0035j
		mov	ax, word_46F46
		mov	[bp-0Ch], ax
		mov	word ptr [bp-216h], 0
		mov	word ptr [bp-214h], 0
		push	word ptr [bp-0Ch]
		lea	ax, [bp-216h]
		push	ax
		call	TextFormat_ApplyStyleAttribute_2E9A4
		add	sp, 4
		mov	word ptr [bp-224h], 0
		mov	word ptr [bp-222h], 0
		mov	word ptr [bp-220h], 0
		mov	word ptr [bp-21Eh], 0
		mov	word ptr [bp-21Ch], 13Fh
		mov	word ptr [bp-21Ah], 9Dh	; '�'
		push	0
		lea	ax, [bp-224h]
		push	ax
		call	TextRenderer_ApplyFormatChange_2EA21
		add	sp, 4
		lea	ax, [bp-224h]
		push	ax
		lea	ax, [bp-10h]
		push	ax
		call	SmallObject_RegisterInList_2CB40
		add	sp, 4
		push	100h
		push	0
		lea	ax, [bp-16h]
		push	ax
		call	Palette_Alloc_2CC76
		add	sp, 6
		mov	word ptr [bp-212h], 0
		mov	word ptr [bp-210h], 18h
		mov	word ptr [bp-20Eh], 13Fh
		mov	word ptr [bp-20Ch], 97h	; '�'
		mov	byte ptr [bp-1Ah], 0
		mov	byte ptr [bp-19h], 0
		mov	byte ptr [bp-18h], 0
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aMid36	; "mid36"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp-208h]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	1
		lea	ax, [bp-208h]
		push	ax
		lea	ax, [bp-29Ch]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_3D2BA
		add	sp, 6
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aMidgames_46 ; "midgames"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp-208h]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	1
		lea	ax, [bp-208h]
		push	ax
		lea	ax, [bp-314h]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_3D2BA
		add	sp, 6
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aMid36voc ; "mid36voc"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp-208h]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		lea	ax, [bp-38Ch]
		push	ax
		call	IndexedRecordReader_ConstructVariantA_3D28A
		add	sp, 2
		cmp	byte ptr [bp-8], 0
		jz	short loc_B7176
		push	ds
		lea	ax, [bp-208h]
		push	ax
		call	sub_6734
		add	sp, 4
		or	al, al
		jz	short loc_B7176
		push	1
		lea	ax, [bp-208h]
		push	ax
		lea	ax, [bp-38Ch]
		push	ax
		mov	bx, [bp-38Ch]
		call	dword ptr [bx+14h]
		add	sp, 6
		jmp	short loc_B717A
; ���������������������������������������������������������������������������

loc_B7176:				; CODE XREF: ovr209:015Aj ovr209:016Cj
		mov	byte ptr [bp-8], 0

loc_B717A:				; CODE XREF: ovr209:0184j
		mov	dword ptr [bp-24h], 0
		mov	byte ptr [bp-20h], 2
		mov	byte ptr [bp-1Fh], 0
		mov	dword ptr [bp-1Eh], 0
		mov	al, byte_46848
		mov	[bp-26h], al
		lea	ax, [bp-404h]
		push	ax
		call	IndexedRecordReader_ConstructVariantA_3D28A
		add	sp, 2
		mov	al, [bp-26h]
		mov	ah, 0
		cmp	ax, 1
		jz	short loc_B71BA
		cmp	ax, 2
		jnz	short loc_B71B7
		jmp	loc_B7330
; ���������������������������������������������������������������������������

loc_B71B7:				; CODE XREF: ovr209:01C2j
		jmp	loc_B74A5
; ���������������������������������������������������������������������������

loc_B71BA:				; CODE XREF: ovr209:01BDj
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aRsoundfx ; "rsoundfx"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp-208h]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	ds
		lea	ax, [bp-208h]
		push	ax
		call	sub_6734
		add	sp, 4
		or	al, al
		jnz	short loc_B71E8
		jmp	loc_B72EF
; ���������������������������������������������������������������������������

loc_B71E8:				; CODE XREF: ovr209:01F3j
		push	1
		lea	ax, [bp-208h]
		push	ax
		lea	ax, [bp-404h]
		push	ax
		mov	bx, [bp-404h]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	ds
		push	offset a_iff	; ".iff"
		push	ds
		push	offset aMidgames_47 ; "midgames"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp-208h]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		lea	ax, [bp-0D1Ah]
		push	ax
		call	StreamReader_ConstructVariantA_3B2A9
		add	sp, 2
		mov	word ptr [bp-0D1Ah], 556h
		mov	dword ptr [bp-0CB9h], 100h
		mov	dword ptr [bp-0CBDh], 0
		mov	word ptr [bp-0D1Ah], 56Eh
		push	1
		lea	ax, [bp-208h]
		push	ax
		lea	ax, [bp-0D1Ah]
		push	ax
		mov	bx, [bp-0D1Ah]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	0
		push	large 554C4F56h
		lea	ax, [bp-0D1Ah]
		push	ax
		call	ResourceRecord_SeekAndReadB_3C022
		add	sp, 8
		push	1
		push	large 3233544Dh
		lea	ax, [bp-0D1Ah]
		push	ax
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		lea	ax, [bp-0D1Ah]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_3C2C4
		add	sp, 2
		mov	word_48F76, ax
		mov	word ptr [bp-13Ah], 1
		jmp	short loc_B72B5
; ���������������������������������������������������������������������������

loc_B729A:				; CODE XREF: ovr209:02CAj
		lea	ax, [bp-0D1Ah]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_3C2C4
		add	sp, 2
		mov	bx, [bp-13Ah]
		shl	bx, 1
		mov	[bx+5E80h], ax
		inc	word ptr [bp-13Ah]

loc_B72B5:				; CODE XREF: ovr209:02A8j
		cmp	word ptr [bp-13Ah], 6Ah	; 'j'
		jle	short loc_B729A
		lea	ax, [bp-0D1Ah]
		push	ax
		call	ResourceRecord_Helper_3BE15
		add	sp, 2
		mov	byte ptr [bp-9], 1
		mov	word ptr [bp-0D1Ah], 56Eh
		lea	ax, [bp-0D1Ah]
		push	ax
		call	ResourceRecord_Helper_3BE15
		add	sp, 2
		push	0
		lea	ax, [bp-0D1Ah]
		push	ax
		call	StreamReader_ReleaseBuffer_3CEB3
		add	sp, 4

loc_B72EF:				; CODE XREF: ovr209:01F5j
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aRmusic	; "rmusic"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp-208h]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	ds
		lea	ax, [bp-208h]
		push	ax
		call	sub_6734
		add	sp, 4
		or	al, al
		jz	short loc_B732D
		mov	byte ptr [bp-7], 1
		mov	al, [bp-9]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_B732D
		mov	word_48F76, 5Ah	; 'Z'

loc_B732D:				; CODE XREF: ovr209:0328j ovr209:0335j
		jmp	loc_B74A5
; ���������������������������������������������������������������������������

loc_B7330:				; CODE XREF: ovr209:01C4j
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aAsoundfx ; "asoundfx"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp-208h]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	ds
		lea	ax, [bp-208h]
		push	ax
		call	sub_6734
		add	sp, 4
		or	al, al
		jnz	short loc_B735E
		jmp	loc_B7465
; ���������������������������������������������������������������������������

loc_B735E:				; CODE XREF: ovr209:0369j
		push	1
		lea	ax, [bp-208h]
		push	ax
		lea	ax, [bp-404h]
		push	ax
		mov	bx, [bp-404h]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	ds
		push	offset a_iff	; ".iff"
		push	ds
		push	offset aMidgames_48 ; "midgames"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp-208h]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		lea	ax, [bp-0D1Ah]
		push	ax
		call	StreamReader_ConstructVariantA_3B2A9
		add	sp, 2
		mov	word ptr [bp-0D1Ah], 556h
		mov	dword ptr [bp-0CB9h], 100h
		mov	dword ptr [bp-0CBDh], 0
		mov	word ptr [bp-0D1Ah], 56Eh
		push	1
		lea	ax, [bp-208h]
		push	ax
		lea	ax, [bp-0D1Ah]
		push	ax
		mov	bx, [bp-0D1Ah]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	0
		push	large 554C4F56h
		lea	ax, [bp-0D1Ah]
		push	ax
		call	ResourceRecord_SeekAndReadB_3C022
		add	sp, 8
		push	1
		push	large 424C4441h
		lea	ax, [bp-0D1Ah]
		push	ax
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		lea	ax, [bp-0D1Ah]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_3C2C4
		add	sp, 2
		mov	word_48F76, ax
		mov	word ptr [bp-13Ah], 1
		jmp	short loc_B742B
; ���������������������������������������������������������������������������

loc_B7410:				; CODE XREF: ovr209:0440j
		lea	ax, [bp-0D1Ah]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_3C2C4
		add	sp, 2
		mov	bx, [bp-13Ah]
		shl	bx, 1
		mov	[bx+5E80h], ax
		inc	word ptr [bp-13Ah]

loc_B742B:				; CODE XREF: ovr209:041Ej
		cmp	word ptr [bp-13Ah], 6Ah	; 'j'
		jle	short loc_B7410
		lea	ax, [bp-0D1Ah]
		push	ax
		call	ResourceRecord_Helper_3BE15
		add	sp, 2
		mov	byte ptr [bp-9], 1
		mov	word ptr [bp-0D1Ah], 56Eh
		lea	ax, [bp-0D1Ah]
		push	ax
		call	ResourceRecord_Helper_3BE15
		add	sp, 2
		push	0
		lea	ax, [bp-0D1Ah]
		push	ax
		call	StreamReader_ReleaseBuffer_3CEB3
		add	sp, 4

loc_B7465:				; CODE XREF: ovr209:036Bj
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aAmusic	; "amusic"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp-208h]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	ds
		lea	ax, [bp-208h]
		push	ax
		call	sub_6734
		add	sp, 4
		or	al, al
		jz	short loc_B74A3
		mov	byte ptr [bp-7], 1
		mov	al, [bp-9]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_B74A3
		mov	word_48F76, 0FFh

loc_B74A3:				; CODE XREF: ovr209:049Ej ovr209:04ABj
		jmp	short $+2

loc_B74A5:				; CODE XREF: ovr209:loc_B71B7j
					; ovr209:loc_B732Dj
		mov	ax, word_457D6
		mov	[bp-2Eh], ax
		mov	ax, word_457D8
		mov	[bp-2Ch], ax
		mov	ax, word_457DA
		mov	[bp-2Ah], ax
		mov	al, byte_457DC
		mov	[bp-28h], al
		cmp	byte ptr [bp-9], 0
		jnz	short loc_B74C6
		jmp	loc_B7600
; ���������������������������������������������������������������������������

loc_B74C6:				; CODE XREF: ovr209:04D1j
		mov	dword ptr [bp-0C7Ch], 0
		mov	byte ptr [bp-0C78h], 2
		mov	byte ptr [bp-0C77h], 0
		mov	dword ptr [bp-0C76h], 0
		mov	word ptr [bp-0C80h], 0
		mov	word ptr [bp-0C7Eh], 0FFFFh
		push	word_46849
		lea	ax, [bp-0C80h]
		push	ax
		call	MusicChannel_Init_78A4
		add	sp, 4
		mov	word ptr [bp-13Ah], 0
		jmp	loc_B75AA
; ���������������������������������������������������������������������������

loc_B7508:				; CODE XREF: ovr209:05C1j
		mov	dword ptr [bp-144h], 0
		mov	byte ptr [bp-140h], 2
		mov	byte ptr [bp-13Fh], 0
		mov	dword ptr [bp-13Eh], 0
		push	3
		lea	ax, [bp-144h]
		push	ax
		lea	ax, [bp-2Eh]
		mov	bx, [bp-13Ah]
		add	bx, ax
		mov	al, [bx]
		mov	ah, 0
		push	ax
		lea	ax, [bp-404h]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	0
		lea	ax, [bp-144h]
		push	ax
		lea	ax, [bp-0C80h]
		push	ax
		call	MusicChannel_RegisterSequence_7918
		add	sp, 6
		lea	ax, [bp-0C80h]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	byte ptr [bp-13Fh], 0
		jz	short loc_B758F
		cmp	dword ptr [bp-144h], 0
		jz	short loc_B758F
		push	0
		mov	al, [bp-140h]
		push	ax
		lea	ax, [bp-144h]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B758F:				; CODE XREF: ovr209:057Cj ovr209:0584j
		mov	dword ptr [bp-144h], 0
		mov	byte ptr [bp-13Fh], 0
		mov	dword ptr [bp-13Eh], 0
		inc	word ptr [bp-13Ah]

loc_B75AA:				; CODE XREF: ovr209:0515j
		cmp	word ptr [bp-13Ah], 7
		jge	short loc_B75B4
		jmp	loc_B7508
; ���������������������������������������������������������������������������

loc_B75B4:				; CODE XREF: ovr209:05BFj
		lea	ax, [bp-0C80h]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	byte ptr [bp-0C77h], 0
		jz	short loc_B75E9
		cmp	dword ptr [bp-0C7Ch], 0
		jz	short loc_B75E9
		push	0
		mov	al, [bp-0C78h]
		push	ax
		lea	ax, [bp-0C7Ch]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B75E9:				; CODE XREF: ovr209:05D6j ovr209:05DEj
		mov	dword ptr [bp-0C7Ch], 0
		mov	byte ptr [bp-0C77h], 0
		mov	dword ptr [bp-0C76h], 0

loc_B7600:				; CODE XREF: ovr209:04D3j
		mov	dword ptr [bp-40Eh], 0
		mov	byte ptr [bp-40Ah], 2
		mov	byte ptr [bp-409h], 0
		mov	dword ptr [bp-408h], 0
		mov	word ptr [bp-412h], 0
		mov	word ptr [bp-410h], 0FFFFh
		cmp	byte ptr [bp-7], 0
		jz	short loc_B76A1
		push	1
		lea	ax, [bp-208h]
		push	ax
		lea	ax, [bp-0CEAh]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_3D2BA
		add	sp, 6
		cmp	byte ptr [bp-8], 0
		jz	short loc_B764F
		mov	byte ptr [bp-139h], 16h
		jmp	short loc_B7654
; ���������������������������������������������������������������������������

loc_B764F:				; CODE XREF: ovr209:0656j
		mov	byte ptr [bp-139h], 15h

loc_B7654:				; CODE XREF: ovr209:065Dj
		push	3
		lea	ax, [bp-24h]
		push	ax
		mov	al, [bp-139h]
		mov	ah, 0
		push	ax
		lea	ax, [bp-0CEAh]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	word_46849
		lea	ax, [bp-412h]
		push	ax
		call	MusicChannel_Init_78A4
		add	sp, 4
		push	0
		lea	ax, [bp-24h]
		push	ax
		lea	ax, [bp-412h]
		push	ax
		call	MusicChannel_RegisterSequence_7918
		add	sp, 6
		push	2
		lea	ax, [bp-0CEAh]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4

loc_B76A1:				; CODE XREF: ovr209:063Cj
		mov	word ptr [bp-0C38h], 185Fh
		mov	dword ptr [bp-0C28h], 0
		mov	byte ptr [bp-0C24h], 2
		mov	byte ptr [bp-0C23h], 0
		mov	dword ptr [bp-0C22h], 0
		mov	word ptr [bp-0C36h], 0
		mov	word ptr [bp-0C38h], 186Fh
		xor	eax, eax
		mov	[bp-41Bh], eax
		mov	[bp-417h], eax
		cmp	byte ptr [bp-8], 0
		jz	short loc_B76F6
		push	word_4684B
		lea	ax, [bp-0C38h]
		push	ax
		call	VoicePlayer_SetDriver_7A3D
		add	sp, 4
		jmp	loc_B7A4E
; ���������������������������������������������������������������������������

loc_B76F6:				; CODE XREF: ovr209:06F0j
		push	ds
		push	offset a_iff	; ".iff"
		push	ds
		push	offset aMidgames_49 ; "midgames"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp-208h]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		lea	ax, [bp-0D1Ah]
		push	ax
		call	StreamReader_ConstructVariantA_3B2A9
		add	sp, 2
		mov	word ptr [bp-0D1Ah], 556h
		mov	dword ptr [bp-0CB9h], 100h
		mov	dword ptr [bp-0CBDh], 0
		mov	word ptr [bp-0D1Ah], 56Eh
		push	1
		lea	ax, [bp-208h]
		push	ax
		lea	ax, [bp-0D1Ah]
		push	ax
		mov	bx, [bp-0D1Ah]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	0
		push	large 3633474Dh
		lea	ax, [bp-0D1Ah]
		push	ax
		call	ResourceRecord_SeekAndReadB_3C022
		add	sp, 8
		push	0
		push	large 41544144h
		lea	ax, [bp-0D1Ah]
		push	ax
		call	ResourceRecord_SeekAndReadB_3C022
		add	sp, 8
		mov	word ptr [bp-13Ah], 0
		jmp	short loc_B77D0
; ���������������������������������������������������������������������������

loc_B7782:				; CODE XREF: ovr209:07E5j
		push	1
		push	large 54584554h
		lea	ax, [bp-0D1Ah]
		push	ax
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		mov	ax, [bp-0CA8h]
		mov	[bp-13Ch], ax
		movsx	eax, word ptr [bp-13Ch]
		push	eax
		push	ds
		mov	ax, [bp-6]
		imul	word ptr [bp-13Ah]
		mov	dx, [bp-4]
		add	dx, ax
		push	dx
		lea	ax, [bp-0D1Ah]
		push	ax
		call	ResourceRecord_ReadFieldGroupA_3C289
		add	sp, 0Ah
		mov	eax, [bp-0CA4h]
		mov	[bp-0CB5h], eax
		inc	word ptr [bp-13Ah]

loc_B77D0:				; CODE XREF: ovr209:0790j
		cmp	word ptr [bp-13Ah], 0Ch
		jl	short loc_B7782
		lea	ax, [bp-0D1Ah]
		push	ax
		call	ResourceRecord_Helper_3BE15
		add	sp, 2
		push	word ptr [bp+8]
		call	CRT_Strlen
		add	sp, 2
		or	ax, ax
		jz	short loc_B782B
		push	word ptr [bp+8]
		mov	ax, [bp-6]
		shl	ax, 1
		mov	dx, [bp-4]
		add	dx, ax
		push	dx
		call	CRT_Strcat
		add	sp, 4
		mov	ax, [bp-6]
		shl	ax, 2
		mov	dx, [bp-4]
		add	dx, ax
		push	dx
		mov	ax, [bp-6]
		shl	ax, 1
		mov	dx, [bp-4]
		add	dx, ax
		push	dx
		call	CRT_Strcat
		add	sp, 4
		jmp	loc_B78F8
; ���������������������������������������������������������������������������

loc_B782B:				; CODE XREF: ovr209:0801j
		push	word ptr [bp+6]
		call	CRT_Strlen
		add	sp, 2
		or	ax, ax
		jz	short loc_B7872
		push	word ptr [bp+6]
		mov	ax, [bp-6]
		shl	ax, 1
		mov	dx, [bp-4]
		add	dx, ax
		push	dx
		call	CRT_Strcat
		add	sp, 4
		mov	ax, [bp-6]
		shl	ax, 2
		mov	dx, [bp-4]
		add	dx, ax
		push	dx
		mov	ax, [bp-6]
		shl	ax, 1
		mov	dx, [bp-4]
		add	dx, ax
		push	dx
		call	CRT_Strcat
		add	sp, 4
		jmp	loc_B78F8
; ���������������������������������������������������������������������������

loc_B7872:				; CODE XREF: ovr209:0848j
		push	word ptr [bp+0Ah]
		call	CRT_Strlen
		add	sp, 2
		or	ax, ax
		jz	short loc_B78B8
		push	word ptr [bp+0Ah]
		mov	ax, [bp-6]
		shl	ax, 1
		mov	dx, [bp-4]
		add	dx, ax
		push	dx
		call	CRT_Strcat
		add	sp, 4
		mov	ax, [bp-6]
		shl	ax, 2
		mov	dx, [bp-4]
		add	dx, ax
		push	dx
		mov	ax, [bp-6]
		shl	ax, 1
		mov	dx, [bp-4]
		add	dx, ax
		push	dx
		call	CRT_Strcat
		add	sp, 4
		jmp	short loc_B78F8
; ���������������������������������������������������������������������������

loc_B78B8:				; CODE XREF: ovr209:088Fj
		mov	ax, [bp-6]
		shl	ax, 1
		add	ax, [bp-6]
		mov	dx, [bp-4]
		add	dx, ax
		push	dx
		mov	ax, [bp-6]
		shl	ax, 1
		mov	dx, [bp-4]
		add	dx, ax
		push	dx
		call	CRT_Strcat
		add	sp, 4
		mov	ax, [bp-6]
		shl	ax, 2
		mov	dx, [bp-4]
		add	dx, ax
		push	dx
		mov	ax, [bp-6]
		shl	ax, 1
		mov	dx, [bp-4]
		add	dx, ax
		push	dx
		call	CRT_Strcat
		add	sp, 4

loc_B78F8:				; CODE XREF: ovr209:0838j ovr209:087Fj ...
		push	word ptr [bp+6]
		call	CRT_Strlen
		add	sp, 2
		or	ax, ax
		jz	short loc_B7947
		push	word ptr [bp+6]
		mov	ax, [bp-6]
		mov	dx, 0Ah
		imul	dx
		mov	dx, [bp-4]
		add	dx, ax
		push	dx
		call	CRT_Strcat
		add	sp, 4
		mov	ax, [bp-6]
		mov	dx, 0Bh
		imul	dx
		mov	dx, [bp-4]
		add	dx, ax
		push	dx
		mov	ax, [bp-6]
		mov	dx, 0Ah
		imul	dx
		mov	dx, [bp-4]
		add	dx, ax
		push	dx
		call	CRT_Strcat
		add	sp, 4
		jmp	loc_B7A2C
; ���������������������������������������������������������������������������

loc_B7947:				; CODE XREF: ovr209:0915j
		push	word ptr [bp+0Ah]
		call	CRT_Strlen
		add	sp, 2
		or	ax, ax
		jz	short loc_B7996
		push	word ptr [bp+0Ah]
		mov	ax, [bp-6]
		mov	dx, 0Ah
		imul	dx
		mov	dx, [bp-4]
		add	dx, ax
		push	dx
		call	CRT_Strcat
		add	sp, 4
		mov	ax, [bp-6]
		mov	dx, 0Bh
		imul	dx
		mov	dx, [bp-4]
		add	dx, ax
		push	dx
		mov	ax, [bp-6]
		mov	dx, 0Ah
		imul	dx
		mov	dx, [bp-4]
		add	dx, ax
		push	dx
		call	CRT_Strcat
		add	sp, 4
		jmp	loc_B7A2C
; ���������������������������������������������������������������������������

loc_B7996:				; CODE XREF: ovr209:0964j
		push	word ptr [bp+8]
		call	CRT_Strlen
		add	sp, 2
		or	ax, ax
		jz	short loc_B79E4
		push	word ptr [bp+8]
		mov	ax, [bp-6]
		mov	dx, 0Ah
		imul	dx
		mov	dx, [bp-4]
		add	dx, ax
		push	dx
		call	CRT_Strcat
		add	sp, 4
		mov	ax, [bp-6]
		mov	dx, 0Bh
		imul	dx
		mov	dx, [bp-4]
		add	dx, ax
		push	dx
		mov	ax, [bp-6]
		mov	dx, 0Ah
		imul	dx
		mov	dx, [bp-4]
		add	dx, ax
		push	dx
		call	CRT_Strcat
		add	sp, 4
		jmp	short loc_B7A2C
; ���������������������������������������������������������������������������

loc_B79E4:				; CODE XREF: ovr209:09B3j
		mov	ax, [bp-6]
		shl	ax, 1
		add	ax, [bp-6]
		mov	dx, [bp-4]
		add	dx, ax
		push	dx
		mov	ax, [bp-6]
		mov	dx, 0Ah
		imul	dx
		mov	dx, [bp-4]
		add	dx, ax
		push	dx
		call	CRT_Strcat
		add	sp, 4
		mov	ax, [bp-6]
		mov	dx, 0Bh
		imul	dx
		mov	dx, [bp-4]
		add	dx, ax
		push	dx
		mov	ax, [bp-6]
		mov	dx, 0Ah
		imul	dx
		mov	dx, [bp-4]
		add	dx, ax
		push	dx
		call	CRT_Strcat
		add	sp, 4

loc_B7A2C:				; CODE XREF: ovr209:0954j ovr209:09A3j ...
		mov	word ptr [bp-0D1Ah], 56Eh
		lea	ax, [bp-0D1Ah]
		push	ax
		call	ResourceRecord_Helper_3BE15
		add	sp, 2
		push	0
		lea	ax, [bp-0D1Ah]
		push	ax
		call	StreamReader_ReleaseBuffer_3CEB3
		add	sp, 4

loc_B7A4E:				; CODE XREF: ovr209:0703j
		mov	dword ptr [bp-38h], 0
		mov	byte ptr [bp-34h], 2
		mov	byte ptr [bp-33h], 0
		mov	dword ptr [bp-32h], 0
		push	3
		lea	ax, [bp-38h]
		push	ax
		push	2Ah ; '*'
		lea	ax, [bp-314h]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	dword ptr [bp-42h], 0
		mov	byte ptr [bp-3Eh], 2
		mov	byte ptr [bp-3Dh], 0
		mov	dword ptr [bp-3Ch], 0
		push	3
		lea	ax, [bp-42h]
		push	ax
		push	2Ch ; ','
		lea	ax, [bp-314h]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	dword ptr [bp-4Ch], 0
		mov	byte ptr [bp-48h], 2
		mov	byte ptr [bp-47h], 0
		mov	dword ptr [bp-46h], 0
		push	3
		lea	ax, [bp-4Ch]
		push	ax
		push	12h
		lea	ax, [bp-29Ch]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	dword ptr [bp-56h], 0
		mov	byte ptr [bp-52h], 2
		mov	byte ptr [bp-51h], 0
		mov	dword ptr [bp-50h], 0
		push	3
		lea	ax, [bp-56h]
		push	ax
		push	0
		lea	ax, [bp-29Ch]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	dword ptr [bp-60h], 0
		mov	byte ptr [bp-5Ch], 2
		mov	byte ptr [bp-5Bh], 0
		mov	dword ptr [bp-5Ah], 0
		push	3
		lea	ax, [bp-60h]
		push	ax
		push	3
		lea	ax, [bp-29Ch]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	dword ptr [bp-6Ah], 0
		mov	byte ptr [bp-66h], 2
		mov	byte ptr [bp-65h], 0
		mov	dword ptr [bp-64h], 0
		push	2
		lea	ax, [bp-6Ah]
		push	ax
		push	2Bh ; '+'
		lea	ax, [bp-314h]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	word ptr [bp-6Dh], 0
		lea	ax, [bp-6Ah]
		push	ax
		lea	ax, [bp-70h]
		push	ax
		call	Palette_LoadFromResource_2CCE5
		add	sp, 4
		mov	dword ptr [bp-7Ah], 0
		mov	byte ptr [bp-76h], 2
		mov	byte ptr [bp-75h], 0
		mov	dword ptr [bp-74h], 0
		push	2
		lea	ax, [bp-7Ah]
		push	ax
		push	2Dh ; '-'
		lea	ax, [bp-314h]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	word ptr [bp-7Dh], 0
		lea	ax, [bp-7Ah]
		push	ax
		lea	ax, [bp-80h]
		push	ax
		call	Palette_LoadFromResource_2CCE5
		add	sp, 4
		mov	dword ptr [bp-8Ah], 0
		mov	byte ptr [bp-86h], 2
		mov	byte ptr [bp-85h], 0
		mov	dword ptr [bp-84h], 0
		push	2
		lea	ax, [bp-8Ah]
		push	ax
		push	24h ; '$'
		lea	ax, [bp-29Ch]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	word ptr [bp-8Dh], 0
		lea	ax, [bp-8Ah]
		push	ax
		lea	ax, [bp-90h]
		push	ax
		call	Palette_LoadFromResource_2CCE5
		add	sp, 4
		mov	dword ptr [bp-9Ah], 0
		mov	byte ptr [bp-96h], 2
		mov	byte ptr [bp-95h], 0
		mov	dword ptr [bp-94h], 0
		push	2
		lea	ax, [bp-9Ah]
		push	ax
		push	25h ; '%'
		lea	ax, [bp-29Ch]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	word ptr [bp-9Dh], 0
		lea	ax, [bp-9Ah]
		push	ax
		lea	ax, [bp-0A0h]
		push	ax
		call	Palette_LoadFromResource_2CCE5
		add	sp, 4
		mov	dword ptr [bp-0AAh], 0
		mov	byte ptr [bp-0A6h], 2
		mov	byte ptr [bp-0A5h], 0
		mov	dword ptr [bp-0A4h], 0
		push	2
		lea	ax, [bp-0AAh]
		push	ax
		push	1Eh
		lea	ax, [bp-29Ch]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	word ptr [bp-0ADh], 0
		lea	ax, [bp-0AAh]
		push	ax
		lea	ax, [bp-0B0h]
		push	ax
		call	Palette_LoadFromResource_2CCE5
		add	sp, 4
		mov	dword ptr [bp-0BAh], 0
		mov	byte ptr [bp-0B6h], 2
		mov	byte ptr [bp-0B5h], 0
		mov	dword ptr [bp-0B4h], 0
		push	2
		lea	ax, [bp-0BAh]
		push	ax
		push	2Fh ; '/'
		lea	ax, [bp-314h]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	word ptr [bp-0BDh], 0
		lea	ax, [bp-0BAh]
		push	ax
		lea	ax, [bp-0C0h]
		push	ax
		call	Palette_LoadFromResource_2CCE5
		add	sp, 4
		mov	dword ptr [bp-0CAh], 0
		mov	byte ptr [bp-0C6h], 2
		mov	byte ptr [bp-0C5h], 0
		mov	dword ptr [bp-0C4h], 0
		push	0
		push	2
		lea	ax, [bp-0CAh]
		push	ax
		call	ConvData_LoadNormalOrNight_C3A6
		add	sp, 6
		mov	word ptr [bp-0CDh], 0
		lea	ax, [bp-0CAh]
		push	ax
		lea	ax, [bp-0D0h]
		push	ax
		call	Palette_LoadFromResource_2CCE5
		add	sp, 4
		mov	dword ptr [bp-0DAh], 0
		mov	byte ptr [bp-0D6h], 2
		mov	byte ptr [bp-0D5h], 0
		mov	dword ptr [bp-0D4h], 0
		push	3
		lea	ax, [bp-0DAh]
		push	ax
		push	27F0h
		call	ConvData_LoadByName_C38E
		add	sp, 6
		mov	dword ptr [bp-0E4h], 0
		mov	byte ptr [bp-0E0h], 2
		mov	byte ptr [bp-0DFh], 0
		mov	dword ptr [bp-0DEh], 0
		push	3
		lea	ax, [bp-0E4h]
		push	ax
		push	27F4h
		call	ConvData_LoadByName_C38E
		add	sp, 6
		mov	dword ptr [bp-0EEh], 0
		mov	byte ptr [bp-0EAh], 2
		mov	byte ptr [bp-0E9h], 0
		mov	dword ptr [bp-0E8h], 0
		push	3
		lea	ax, [bp-0EEh]
		push	ax
		push	27FAh
		call	ConvData_LoadByName_C38E
		add	sp, 6
		mov	dword ptr [bp-0F8h], 0
		mov	byte ptr [bp-0F4h], 2
		mov	byte ptr [bp-0F3h], 0
		mov	dword ptr [bp-0F2h], 0
		push	3
		lea	ax, [bp-0F8h]
		push	ax
		push	2801h
		call	ConvData_LoadByName_C38E
		add	sp, 6
		mov	dword ptr [bp-102h], 0
		mov	byte ptr [bp-0FEh], 2
		mov	byte ptr [bp-0FDh], 0
		mov	dword ptr [bp-0FCh], 0
		push	3
		lea	ax, [bp-102h]
		push	ax
		push	2806h
		call	ConvData_LoadByName_C38E
		add	sp, 6
		mov	dword ptr [bp-10Ch], 0
		mov	byte ptr [bp-108h], 2
		mov	byte ptr [bp-107h], 0
		mov	dword ptr [bp-106h], 0
		push	3
		lea	ax, [bp-10Ch]
		push	ax
		push	280Ah
		call	ConvData_LoadByName_C38E
		add	sp, 6
		mov	dword ptr [bp-116h], 0
		mov	byte ptr [bp-112h], 2
		mov	byte ptr [bp-111h], 0
		mov	dword ptr [bp-110h], 0
		push	3
		lea	ax, [bp-116h]
		push	ax
		push	2811h
		call	ConvData_LoadByName_C38E
		add	sp, 6
		mov	dword ptr [bp-120h], 0
		mov	byte ptr [bp-11Ch], 2
		mov	byte ptr [bp-11Bh], 0
		mov	dword ptr [bp-11Ah], 0
		push	ds
		push	offset a_shp	; ".shp"
		push	ds
		push	offset aConvfont_3 ; "convfont"
		push	ds
		push	offset a____DataFonts ;	"..\\..\\data\\fonts\\"
		lea	ax, [bp-208h]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	2
		lea	ax, [bp-208h]
		push	ax
		call	TextRenderer_LoadResourceFile_3DA1F
		add	sp, 4
		mov	[bp-122h], dx
		mov	[bp-124h], ax
		mov	eax, [bp-124h]
		mov	[bp-120h], eax
		mov	byte ptr [bp-11Ch], 2
		mov	byte ptr [bp-11Bh], 1
		mov	dword ptr [bp-11Ah], 0
		lea	ax, [bp-120h]
		push	ax
		lea	ax, [bp-0C50h]
		push	ax
		call	GlyphObject_ConstructWithBuffer_311CF
		add	sp, 4
		mov	word ptr [bp-12Ch], 0
		mov	word ptr [bp-12Ah], 98h	; '�'
		mov	word ptr [bp-128h], 13Fh
		mov	word ptr [bp-126h], 0C7h ; '�'
		mov	ax, word_46F46
		mov	[bp-12Eh], ax
		lea	ax, [bp-0C50h]
		push	ax
		push	word ptr [bp-12Eh]
		lea	ax, [bp-0C72h]
		push	ax
		call	Widget_ApplyStyleAndAllocate_3144B
		add	sp, 6
		mov	word ptr [bp-0C72h], 1218h
		mov	ax, [bp-12Ah]
		mov	[bp-130h], ax
		mov	ax, [bp-128h]
		mov	[bp-132h], ax
		mov	ax, [bp-126h]
		mov	[bp-134h], ax
		mov	ax, [bp-12Ch]
		mov	[bp-0C59h], ax
		mov	ax, [bp-130h]
		mov	[bp-0C57h], ax
		mov	ax, [bp-132h]
		mov	[bp-0C55h], ax
		mov	ax, [bp-134h]
		mov	[bp-0C53h], ax
		push	0
		lea	ax, [bp-0C72h]
		push	ax
		call	Widget_Method_DispatchC_314CB
		add	sp, 4
		push	0C8h ; '�'
		lea	ax, [bp-0C72h]
		push	ax
		call	Widget_Method_Dispatch8_314A9
		add	sp, 4
		cmp	byte_495FC, 0
		jz	short loc_B7F79
		jmp	loc_BD722
; ���������������������������������������������������������������������������

loc_B7F79:				; CODE XREF: ovr209:0F84j
		cmp	byte ptr [bp-7], 0
		jz	short loc_B7FC3
		mov	ax, word_48F76
		mov	[bp-136h], ax
		mov	word ptr [bp-138h], 0
		cmp	word ptr [bp-412h], 0
		jz	short loc_B7FC3
		push	word ptr [bp-410h]
		mov	bx, [bp-412h]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	word ptr [bp-138h]
		push	word ptr [bp-136h]
		push	word ptr [bp-410h]
		mov	bx, [bp-412h]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_B7FC3:				; CODE XREF: ovr209:0F8Dj ovr209:0FA1j
		mov	dword ptr [bp-142h], 0
		mov	byte ptr [bp-13Eh], 2
		mov	byte ptr [bp-13Dh], 0
		mov	dword ptr [bp-13Ch], 0
		mov	dword ptr [bp-0C7Ch], 0
		mov	byte ptr [bp-0C78h], 2
		mov	byte ptr [bp-0C77h], 0
		mov	dword ptr [bp-0C76h], 0
		mov	word ptr [bp-0C80h], 0
		mov	word ptr [bp-0C7Eh], 0FFFFh
		cmp	byte ptr [bp-9], 0
		jnz	short loc_B8010
		jmp	loc_B808F
; ���������������������������������������������������������������������������

loc_B8010:				; CODE XREF: ovr209:101Bj
		push	3
		lea	ax, [bp-142h]
		push	ax
		push	3Eh ; '>'
		lea	ax, [bp-404h]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	word_46849
		lea	ax, [bp-0C80h]
		push	ax
		call	MusicChannel_Init_78A4
		add	sp, 4
		push	0
		lea	ax, [bp-142h]
		push	ax
		lea	ax, [bp-0C80h]
		push	ax
		call	MusicChannel_RegisterSequence_7918
		add	sp, 6
		mov	ax, word_48F1E
		mov	[bp-144h], ax
		mov	word ptr [bp-146h], 0
		cmp	word ptr [bp-0C80h], 0
		jz	short loc_B808F
		push	word ptr [bp-0C7Eh]
		mov	bx, [bp-0C80h]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	word ptr [bp-146h]
		push	word ptr [bp-144h]
		push	word ptr [bp-0C7Eh]
		mov	bx, [bp-0C80h]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_B808F:				; CODE XREF: ovr209:101Dj ovr209:106Dj
		mov	dword ptr [bp-150h], 0
		mov	byte ptr [bp-14Ch], 2
		mov	byte ptr [bp-14Bh], 0
		mov	dword ptr [bp-14Ah], 0
		push	3
		lea	ax, [bp-150h]
		push	ax
		push	4
		lea	ax, [bp-29Ch]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	dword ptr [bp-15Ah], 0
		mov	byte ptr [bp-156h], 2
		mov	byte ptr [bp-155h], 0
		mov	dword ptr [bp-154h], 0
		push	3
		lea	ax, [bp-15Ah]
		push	ax
		push	5
		lea	ax, [bp-29Ch]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	dword ptr [bp-164h], 0
		mov	byte ptr [bp-160h], 2
		mov	byte ptr [bp-15Fh], 0
		mov	dword ptr [bp-15Eh], 0
		push	2
		lea	ax, [bp-164h]
		push	ax
		push	20h ; ' '
		lea	ax, [bp-29Ch]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	word ptr [bp-167h], 0
		lea	ax, [bp-164h]
		push	ax
		lea	ax, [bp-16Ah]
		push	ax
		call	Palette_LoadFromResource_2CCE5
		add	sp, 4
		lea	ax, [bp-216h]
		push	ax
		push	0FFh
		push	0Fh
		lea	ax, [bp-0CA2h]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		push	0FFB0h
		push	0
		lea	ax, [bp-38h]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	[bp-16Ch], ax
		push	0
		push	0
		lea	ax, [bp-15Ah]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	[bp-16Eh], ax
		push	0
		push	0
		lea	ax, [bp-150h]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	[bp-170h], ax
		push	0A0h ; '�'
		push	0A0h ; '�'
		lea	ax, [bp-0C72h]
		push	ax
		push	0
		call	TextLayer_Construct_ACF1
		add	sp, 8
		mov	[bp-172h], ax
		push	word ptr [bp-16Ah]
		mov	al, [bp-168h]
		push	ax
		lea	ax, [bp-16Ah]
		push	ax
		lea	ax, [bp-16h]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	word ptr [bp-16Ch]
		lea	ax, [bp-0CA2h]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp-170h]
		lea	ax, [bp-0CA2h]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp-16Eh] ; CODE XREF:	ovr209:4E8Cj
					; ovr209:4F0Ej
		lea	ax, [bp-0CA2h]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp-172h]
		lea	ax, [bp-0CA2h]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		push	0
		push	word ptr [bp-16h]
		mov	al, [bp-14h]
		push	ax
		lea	ax, [bp-16h]
		push	ax
		call	Palette_Upload_2CDE1
		add	sp, 8
		mov	word ptr [bp-174h], 0
		jmp	short loc_B826B
; ���������������������������������������������������������������������������

loc_B823A:				; CODE XREF: ovr209:1294j
		mov	ax, [bp-174h]
		mov	[bp-176h], ax
		inc	word ptr [bp-174h]
		mov	bx, [bp-16Eh]
		mov	ax, [bp-176h]
		mov	[bx+1Bh], ax
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_B825E
		jmp	short loc_B825E
; ���������������������������������������������������������������������������
		jmp	short loc_B8286
; ���������������������������������������������������������������������������

loc_B825E:				; CODE XREF: ovr209:1268j ovr209:126Aj
		lea	ax, [bp-0CA2h]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_B826B:				; CODE XREF: ovr209:1248j
		cmp	word ptr [bp-0C85h], 1Fh
		jnb	short loc_B8279
		cmp	byte ptr [bp-0C83h], 0
		jz	short loc_B827E

loc_B8279:				; CODE XREF: ovr209:1280j
		mov	ax, 1
		jmp	short loc_B8280
; ���������������������������������������������������������������������������

loc_B827E:				; CODE XREF: ovr209:1287j
		xor	ax, ax

loc_B8280:				; CODE XREF: ovr209:128Cj
		mov	ah, 0
		or	ax, ax
		jz	short loc_B823A

loc_B8286:				; CODE XREF: ovr209:126Cj
		push	0
		lea	ax, [bp-0CA2h]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		push	2
		lea	ax, [bp-16Ah]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	byte ptr [bp-15Fh], 0
		jz	short loc_B82CC
		cmp	dword ptr [bp-164h], 0
		jz	short loc_B82CC
		push	0
		mov	al, [bp-160h]
		push	ax
		lea	ax, [bp-164h]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B82CC:				; CODE XREF: ovr209:12B9j ovr209:12C1j
		mov	dword ptr [bp-164h], 0
		mov	byte ptr [bp-15Fh], 0
		mov	dword ptr [bp-15Eh], 0
		cmp	byte ptr [bp-155h], 0
		jz	short loc_B830B
		cmp	dword ptr [bp-15Ah], 0
		jz	short loc_B830B
		push	0
		mov	al, [bp-156h]
		push	ax
		lea	ax, [bp-15Ah]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B830B:				; CODE XREF: ovr209:12F8j ovr209:1300j
		mov	dword ptr [bp-15Ah], 0
		mov	byte ptr [bp-155h], 0
		mov	dword ptr [bp-154h], 0
		cmp	byte ptr [bp-14Bh], 0
		jz	short loc_B834A
		cmp	dword ptr [bp-150h], 0
		jz	short loc_B834A
		push	0
		mov	al, [bp-14Ch]
		push	ax
		lea	ax, [bp-150h]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B834A:				; CODE XREF: ovr209:1337j ovr209:133Fj
		mov	dword ptr [bp-150h], 0
		mov	byte ptr [bp-14Bh], 0
		mov	dword ptr [bp-14Ah], 0
		lea	ax, [bp-0C80h]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	byte ptr [bp-0C77h], 0
		jz	short loc_B8396
		cmp	dword ptr [bp-0C7Ch], 0
		jz	short loc_B8396
		push	0
		mov	al, [bp-0C78h]
		push	ax
		lea	ax, [bp-0C7Ch]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B8396:				; CODE XREF: ovr209:1383j ovr209:138Bj
		mov	dword ptr [bp-0C7Ch], 0
		mov	byte ptr [bp-0C77h], 0
		mov	dword ptr [bp-0C76h], 0
		cmp	byte ptr [bp-13Dh], 0
		jz	short loc_B83D5
		cmp	dword ptr [bp-142h], 0
		jz	short loc_B83D5
		push	0
		mov	al, [bp-13Eh]
		push	ax
		lea	ax, [bp-142h]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B83D5:				; CODE XREF: ovr209:13C2j ovr209:13CAj
		mov	dword ptr [bp-142h], 0
		mov	byte ptr [bp-13Dh], 0
		mov	dword ptr [bp-13Ch], 0
		cmp	byte_495FC, 0
		jz	short loc_B83F6
		jmp	loc_BD722
; ���������������������������������������������������������������������������

loc_B83F6:				; CODE XREF: ovr209:1401j
		mov	dword ptr [bp-142h], 0
		mov	byte ptr [bp-13Eh], 2
		mov	byte ptr [bp-13Dh], 0
		mov	dword ptr [bp-13Ch], 0
		push	3
		lea	ax, [bp-142h]
		push	ax
		push	0Bh
		lea	ax, [bp-29Ch]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	dword ptr [bp-14Ch], 0
		mov	byte ptr [bp-148h], 2
		mov	byte ptr [bp-147h], 0
		mov	dword ptr [bp-146h], 0
		push	3
		lea	ax, [bp-14Ch]
		push	ax
		push	0Ch
		lea	ax, [bp-29Ch]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	dword ptr [bp-156h], 0
		mov	byte ptr [bp-152h], 2
		mov	byte ptr [bp-151h], 0
		mov	dword ptr [bp-150h], 0
		push	3
		lea	ax, [bp-156h]
		push	ax
		push	0Eh
		lea	ax, [bp-29Ch]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	dword ptr [bp-160h], 0
		mov	byte ptr [bp-15Ch], 2
		mov	byte ptr [bp-15Bh], 0
		mov	dword ptr [bp-15Ah], 0
		push	3
		lea	ax, [bp-160h]
		push	ax
		push	0Dh
		lea	ax, [bp-29Ch]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	dword ptr [bp-16Ah], 0
		mov	byte ptr [bp-166h], 2
		mov	byte ptr [bp-165h], 0
		mov	dword ptr [bp-164h], 0
		push	3
		lea	ax, [bp-16Ah]
		push	ax
		push	0Fh
		lea	ax, [bp-29Ch]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	dword ptr [bp-174h], 0
		mov	byte ptr [bp-170h], 2
		mov	byte ptr [bp-16Fh], 0
		mov	dword ptr [bp-16Eh], 0
		push	3
		lea	ax, [bp-174h]
		push	ax
		push	10h
		lea	ax, [bp-29Ch]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	dword ptr [bp-17Eh], 0
		mov	byte ptr [bp-17Ah], 2
		mov	byte ptr [bp-179h], 0
		mov	dword ptr [bp-178h], 0
		push	2
		lea	ax, [bp-17Eh]
		push	ax
		push	23h ; '#'
		lea	ax, [bp-29Ch]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	word ptr [bp-181h], 0
		lea	ax, [bp-17Eh]
		push	ax
		lea	ax, [bp-184h]
		push	ax
		call	Palette_LoadFromResource_2CCE5
		add	sp, 4
		mov	dword ptr [bp-18Eh], 0
		mov	byte ptr [bp-18Ah], 2
		mov	byte ptr [bp-189h], 0
		mov	dword ptr [bp-188h], 0
		push	2
		lea	ax, [bp-18Eh]
		push	ax
		push	22h ; '"'
		lea	ax, [bp-29Ch]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	word ptr [bp-191h], 0
		lea	ax, [bp-18Eh]
		push	ax
		lea	ax, [bp-194h]
		push	ax
		call	Palette_LoadFromResource_2CCE5
		add	sp, 4
		lea	ax, [bp-216h]
		push	ax
		push	0FFh
		push	6
		lea	ax, [bp-0C94h]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		push	0
		push	0
		lea	ax, [bp-174h]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	[bp-196h], ax
		push	0
		push	0
		lea	ax, [bp-16Ah]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	[bp-198h], ax
		push	0
		push	0
		lea	ax, [bp-142h]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	[bp-19Ah], ax
		push	0
		push	0
		lea	ax, [bp-14Ch]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	[bp-19Ch], ax
		push	0
		push	0
		lea	ax, [bp-156h]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	[bp-19Eh], ax
		push	0
		push	0
		lea	ax, [bp-160h]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	[bp-1A0h], ax
		push	word ptr [bp-184h]
		mov	al, [bp-182h]
		push	ax
		lea	ax, [bp-184h]
		push	ax
		lea	ax, [bp-16h]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	word ptr [bp-194h]
		mov	al, [bp-192h]
		push	ax
		lea	ax, [bp-194h]
		push	ax
		lea	ax, [bp-16h]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	word ptr [bp-196h]
		lea	ax, [bp-0C94h]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp-198h]
		lea	ax, [bp-0C94h]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp-19Ah]
		lea	ax, [bp-0C94h]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp-19Ch]
		lea	ax, [bp-0C94h]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp-19Eh]
		lea	ax, [bp-0C94h]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp-1A0h]
		lea	ax, [bp-0C94h]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		push	0
		push	word ptr [bp-16h]
		mov	al, [bp-14h]
		push	ax
		lea	ax, [bp-16h]
		push	ax
		call	Palette_Upload_2CDE1
		add	sp, 8
		mov	word ptr [bp-1A2h], 0
		jmp	short loc_B8799
; ���������������������������������������������������������������������������

loc_B871C:				; CODE XREF: ovr209:17C4j
		mov	ax, [bp-0C77h]
		mov	[bp-1A4h], ax
		cmp	word ptr [bp-1A4h], 8
		jnz	short loc_B8734
		mov	bx, [bp-19Ch]
		mov	word ptr [bx+1Bh], 1

loc_B8734:				; CODE XREF: ovr209:1739j
		cmp	word ptr [bp-1A4h], 9
		jnz	short loc_B8744
		mov	bx, [bp-1A0h]
		mov	word ptr [bx+1Bh], 1

loc_B8744:				; CODE XREF: ovr209:1749j
		cmp	word ptr [bp-1A4h], 0Ah
		jnz	short loc_B8754
		mov	bx, [bp-1A0h]
		mov	word ptr [bx+1Bh], 2

loc_B8754:				; CODE XREF: ovr209:1759j
		cmp	word ptr [bp-1A4h], 7
		jge	short loc_B877F
		mov	ax, [bp-1A2h]
		mov	[bp-1A6h], ax
		inc	word ptr [bp-1A2h]
		mov	bx, [bp-19Eh]
		mov	ax, [bp-1A6h]
		mov	[bx+1Bh], ax
		cmp	word ptr [bp-1A2h], 1
		jle	short loc_B877F
		mov	word ptr [bp-1A2h], 0

loc_B877F:				; CODE XREF: ovr209:1769j ovr209:1787j
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_B878C
		jmp	short loc_B878C
; ���������������������������������������������������������������������������
		jmp	short loc_B87B7
; ���������������������������������������������������������������������������

loc_B878C:				; CODE XREF: ovr209:1796j ovr209:1798j
		lea	ax, [bp-0C94h]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_B8799:				; CODE XREF: ovr209:172Aj
		cmp	word ptr [bp-0C77h], 0Ch
		jnb	short loc_B87A7
		cmp	byte ptr [bp-0C75h], 0
		jz	short loc_B87AC

loc_B87A7:				; CODE XREF: ovr209:17AEj
		mov	ax, 1
		jmp	short loc_B87AE
; ���������������������������������������������������������������������������

loc_B87AC:				; CODE XREF: ovr209:17B5j
		xor	ax, ax

loc_B87AE:				; CODE XREF: ovr209:17BAj
		mov	ah, 0
		or	ax, ax
		jnz	short loc_B87B7
		jmp	loc_B871C
; ���������������������������������������������������������������������������

loc_B87B7:				; CODE XREF: ovr209:179Aj ovr209:17C2j
		push	0
		lea	ax, [bp-0C94h]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		push	2
		lea	ax, [bp-194h]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	byte ptr [bp-189h], 0
		jz	short loc_B87FD
		cmp	dword ptr [bp-18Eh], 0
		jz	short loc_B87FD
		push	0
		mov	al, [bp-18Ah]
		push	ax
		lea	ax, [bp-18Eh]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B87FD:				; CODE XREF: ovr209:17EAj ovr209:17F2j
		mov	dword ptr [bp-18Eh], 0
		mov	byte ptr [bp-189h], 0
		mov	dword ptr [bp-188h], 0
		push	2
		lea	ax, [bp-184h]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	byte ptr [bp-179h], 0
		jz	short loc_B884B
		cmp	dword ptr [bp-17Eh], 0
		jz	short loc_B884B
		push	0
		mov	al, [bp-17Ah]
		push	ax
		lea	ax, [bp-17Eh]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B884B:				; CODE XREF: ovr209:1838j ovr209:1840j
		mov	dword ptr [bp-17Eh], 0
		mov	byte ptr [bp-179h], 0
		mov	dword ptr [bp-178h], 0
		cmp	byte ptr [bp-16Fh], 0
		jz	short loc_B888A
		cmp	dword ptr [bp-174h], 0
		jz	short loc_B888A
		push	0
		mov	al, [bp-170h]
		push	ax
		lea	ax, [bp-174h]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B888A:				; CODE XREF: ovr209:1877j ovr209:187Fj
		mov	dword ptr [bp-174h], 0
		mov	byte ptr [bp-16Fh], 0
		mov	dword ptr [bp-16Eh], 0
		cmp	byte ptr [bp-165h], 0
		jz	short loc_B88C9
		cmp	dword ptr [bp-16Ah], 0
		jz	short loc_B88C9
		push	0
		mov	al, [bp-166h]
		push	ax
		lea	ax, [bp-16Ah]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B88C9:				; CODE XREF: ovr209:18B6j ovr209:18BEj
		mov	dword ptr [bp-16Ah], 0
		mov	byte ptr [bp-165h], 0
		mov	dword ptr [bp-164h], 0
		cmp	byte ptr [bp-15Bh], 0
		jz	short loc_B8908
		cmp	dword ptr [bp-160h], 0
		jz	short loc_B8908
		push	0
		mov	al, [bp-15Ch]
		push	ax
		lea	ax, [bp-160h]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B8908:				; CODE XREF: ovr209:18F5j ovr209:18FDj
		mov	dword ptr [bp-160h], 0
		mov	byte ptr [bp-15Bh], 0
		mov	dword ptr [bp-15Ah], 0
		cmp	byte ptr [bp-151h], 0
		jz	short loc_B8947
		cmp	dword ptr [bp-156h], 0
		jz	short loc_B8947
		push	0
		mov	al, [bp-152h]
		push	ax
		lea	ax, [bp-156h]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B8947:				; CODE XREF: ovr209:1934j ovr209:193Cj
		mov	dword ptr [bp-156h], 0
		mov	byte ptr [bp-151h], 0
		mov	dword ptr [bp-150h], 0
		cmp	byte ptr [bp-147h], 0
		jz	short loc_B8986
		cmp	dword ptr [bp-14Ch], 0
		jz	short loc_B8986
		push	0
		mov	al, [bp-148h]
		push	ax
		lea	ax, [bp-14Ch]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B8986:				; CODE XREF: ovr209:1973j ovr209:197Bj
		mov	dword ptr [bp-14Ch], 0
		mov	byte ptr [bp-147h], 0
		mov	dword ptr [bp-146h], 0
		cmp	byte ptr [bp-13Dh], 0
		jz	short loc_B89C5
		cmp	dword ptr [bp-142h], 0
		jz	short loc_B89C5
		push	0
		mov	al, [bp-13Eh]
		push	ax
		lea	ax, [bp-142h]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B89C5:				; CODE XREF: ovr209:19B2j ovr209:19BAj
		mov	dword ptr [bp-142h], 0
		mov	byte ptr [bp-13Dh], 0
		mov	dword ptr [bp-13Ch], 0
		cmp	byte_495FC, 0
		jz	short loc_B89E6
		jmp	loc_BD722
; ���������������������������������������������������������������������������

loc_B89E6:				; CODE XREF: ovr209:19F1j
		mov	dword ptr [bp-142h], 0
		mov	byte ptr [bp-13Eh], 2
		mov	byte ptr [bp-13Dh], 0
		mov	dword ptr [bp-13Ch], 0
		mov	dword ptr [bp-0C7Ch], 0
		mov	byte ptr [bp-0C78h], 2
		mov	byte ptr [bp-0C77h], 0
		mov	dword ptr [bp-0C76h], 0
		mov	word ptr [bp-0C80h], 0
		mov	word ptr [bp-0C7Eh], 0FFFFh
		cmp	byte ptr [bp-9], 0
		jnz	short loc_B8A33
		jmp	loc_B8AB2
; ���������������������������������������������������������������������������

loc_B8A33:				; CODE XREF: ovr209:1A3Ej
		push	3
		lea	ax, [bp-142h]
		push	ax
		push	3Eh ; '>'
		lea	ax, [bp-404h]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	word_46849
		lea	ax, [bp-0C80h]
		push	ax
		call	MusicChannel_Init_78A4
		add	sp, 4
		push	0
		lea	ax, [bp-142h]
		push	ax
		lea	ax, [bp-0C80h]
		push	ax
		call	MusicChannel_RegisterSequence_7918
		add	sp, 6
		mov	ax, word_48F1E
		mov	[bp-144h], ax
		mov	word ptr [bp-146h], 0
		cmp	word ptr [bp-0C80h], 0
		jz	short loc_B8AB2
		push	word ptr [bp-0C7Eh]
		mov	bx, [bp-0C80h]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	word ptr [bp-146h]
		push	word ptr [bp-144h]
		push	word ptr [bp-0C7Eh]
		mov	bx, [bp-0C80h]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_B8AB2:				; CODE XREF: ovr209:1A40j ovr209:1A90j
		mov	dword ptr [bp-150h], 0
		mov	byte ptr [bp-14Ch], 2
		mov	byte ptr [bp-14Bh], 0
		mov	dword ptr [bp-14Ah], 0
		push	3
		lea	ax, [bp-150h]
		push	ax
		push	7
		lea	ax, [bp-29Ch]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	dword ptr [bp-15Ah], 0
		mov	byte ptr [bp-156h], 2
		mov	byte ptr [bp-155h], 0
		mov	dword ptr [bp-154h], 0
		push	3
		lea	ax, [bp-15Ah]
		push	ax
		push	6
		lea	ax, [bp-29Ch]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	dword ptr [bp-164h], 0
		mov	byte ptr [bp-160h], 2
		mov	byte ptr [bp-15Fh], 0
		mov	dword ptr [bp-15Eh], 0
		push	2
		lea	ax, [bp-164h]
		push	ax
		push	21h ; '!'
		lea	ax, [bp-29Ch]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	word ptr [bp-167h], 0
		lea	ax, [bp-164h]
		push	ax
		lea	ax, [bp-16Ah]
		push	ax
		call	Palette_LoadFromResource_2CCE5
		add	sp, 4
		lea	ax, [bp-216h]
		push	ax
		push	0FFh
		push	0Fh
		lea	ax, [bp-0CA2h]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		push	0
		push	0
		lea	ax, [bp-150h]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	[bp-16Ch], ax
		push	0
		push	0
		lea	ax, [bp-15Ah]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	[bp-16Eh], ax
		push	word ptr [bp-16Ah]
		mov	al, [bp-168h]
		push	ax
		lea	ax, [bp-16Ah]
		push	ax
		lea	ax, [bp-16h]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	word ptr [bp-16Ch]
		lea	ax, [bp-0CA2h]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp-16Eh]
		lea	ax, [bp-0CA2h]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		push	0
		push	word ptr [bp-16h]
		mov	al, [bp-14h]
		push	ax
		lea	ax, [bp-16h]
		push	ax
		call	Palette_Upload_2CDE1
		add	sp, 8
		mov	word ptr [bp-170h], 8
		jmp	short loc_B8C6F
; ���������������������������������������������������������������������������

loc_B8C0C:				; CODE XREF: ovr209:1C98j
		mov	ax, [bp-170h]
		mov	[bp-172h], ax
		inc	word ptr [bp-170h]
		mov	bx, [bp-16Eh]
		mov	ax, [bp-172h]
		mov	[bx+1Bh], ax
		cmp	word ptr [bp-170h], 29h	; ')'
		jnz	short loc_B8C55
		push	word ptr [bp-16Eh]
		lea	ax, [bp-0CA2h]
		push	ax
		call	LayerGroup_Remove_2DBC1
		add	sp, 4
		cmp	word ptr [bp-16Eh], 0
		jz	short loc_B8C55
		push	3
		push	word ptr [bp-16Eh]
		mov	bx, [bp-16Eh]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short $+2

loc_B8C55:				; CODE XREF: ovr209:1C38j ovr209:1C50j
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_B8C62
		jmp	short loc_B8C62
; ���������������������������������������������������������������������������
		jmp	short loc_B8C8A
; ���������������������������������������������������������������������������

loc_B8C62:				; CODE XREF: ovr209:1C6Cj ovr209:1C6Ej
		lea	ax, [bp-0CA2h]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_B8C6F:				; CODE XREF: ovr209:1C1Aj
		cmp	word ptr [bp-0C85h], 23h ; '#'
		jnb	short loc_B8C7D
		cmp	byte ptr [bp-0C83h], 0
		jz	short loc_B8C82

loc_B8C7D:				; CODE XREF: ovr209:1C84j
		mov	ax, 1
		jmp	short loc_B8C84
; ���������������������������������������������������������������������������

loc_B8C82:				; CODE XREF: ovr209:1C8Bj
		xor	ax, ax

loc_B8C84:				; CODE XREF: ovr209:1C90j
		mov	ah, 0
		or	ax, ax
		jz	short loc_B8C0C

loc_B8C8A:				; CODE XREF: ovr209:1C70j
		push	0
		lea	ax, [bp-0CA2h]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		push	2
		lea	ax, [bp-16Ah]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	byte ptr [bp-15Fh], 0
		jz	short loc_B8CD0
		cmp	dword ptr [bp-164h], 0
		jz	short loc_B8CD0
		push	0
		mov	al, [bp-160h]
		push	ax
		lea	ax, [bp-164h]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B8CD0:				; CODE XREF: ovr209:1CBDj ovr209:1CC5j
		mov	dword ptr [bp-164h], 0
		mov	byte ptr [bp-15Fh], 0
		mov	dword ptr [bp-15Eh], 0
		cmp	byte ptr [bp-155h], 0
		jz	short loc_B8D0F
		cmp	dword ptr [bp-15Ah], 0
		jz	short loc_B8D0F
		push	0
		mov	al, [bp-156h]
		push	ax
		lea	ax, [bp-15Ah]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B8D0F:				; CODE XREF: ovr209:1CFCj ovr209:1D04j
		mov	dword ptr [bp-15Ah], 0
		mov	byte ptr [bp-155h], 0
		mov	dword ptr [bp-154h], 0
		cmp	byte ptr [bp-14Bh], 0
		jz	short loc_B8D4E
		cmp	dword ptr [bp-150h], 0
		jz	short loc_B8D4E
		push	0
		mov	al, [bp-14Ch]
		push	ax
		lea	ax, [bp-150h]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B8D4E:				; CODE XREF: ovr209:1D3Bj ovr209:1D43j
		mov	dword ptr [bp-150h], 0
		mov	byte ptr [bp-14Bh], 0
		mov	dword ptr [bp-14Ah], 0
		lea	ax, [bp-0C80h]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	byte ptr [bp-0C77h], 0
		jz	short loc_B8D9A
		cmp	dword ptr [bp-0C7Ch], 0
		jz	short loc_B8D9A
		push	0
		mov	al, [bp-0C78h]
		push	ax
		lea	ax, [bp-0C7Ch]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B8D9A:				; CODE XREF: ovr209:1D87j ovr209:1D8Fj
		mov	dword ptr [bp-0C7Ch], 0
		mov	byte ptr [bp-0C77h], 0
		mov	dword ptr [bp-0C76h], 0
		cmp	byte ptr [bp-13Dh], 0
		jz	short loc_B8DD9
		cmp	dword ptr [bp-142h], 0
		jz	short loc_B8DD9
		push	0
		mov	al, [bp-13Eh]
		push	ax
		lea	ax, [bp-142h]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B8DD9:				; CODE XREF: ovr209:1DC6j ovr209:1DCEj
		mov	dword ptr [bp-142h], 0
		mov	byte ptr [bp-13Dh], 0
		mov	dword ptr [bp-13Ch], 0
		cmp	byte_495FC, 0
		jz	short loc_B8DFA
		jmp	loc_BD722
; ���������������������������������������������������������������������������

loc_B8DFA:				; CODE XREF: ovr209:1E05j
		mov	dword ptr [bp-142h], 0
		mov	byte ptr [bp-13Eh], 2
		mov	byte ptr [bp-13Dh], 0
		mov	dword ptr [bp-13Ch], 0
		mov	dword ptr [bp-0C7Ch], 0
		mov	byte ptr [bp-0C78h], 2
		mov	byte ptr [bp-0C77h], 0
		mov	dword ptr [bp-0C76h], 0
		mov	word ptr [bp-0C80h], 0
		mov	word ptr [bp-0C7Eh], 0FFFFh
		cmp	byte ptr [bp-9], 0
		jnz	short loc_B8E47
		jmp	loc_B8EC6
; ���������������������������������������������������������������������������

loc_B8E47:				; CODE XREF: ovr209:1E52j
		push	3
		lea	ax, [bp-142h]
		push	ax
		push	7
		lea	ax, [bp-404h]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	word_46849
		lea	ax, [bp-0C80h]
		push	ax
		call	MusicChannel_Init_78A4
		add	sp, 4
		push	0
		lea	ax, [bp-142h]
		push	ax
		lea	ax, [bp-0C80h]
		push	ax
		call	MusicChannel_RegisterSequence_7918
		add	sp, 6
		mov	ax, word_48EB0
		mov	[bp-144h], ax
		mov	word ptr [bp-146h], 0
		cmp	word ptr [bp-0C80h], 0
		jz	short loc_B8EC6
		push	word ptr [bp-0C7Eh]
		mov	bx, [bp-0C80h]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	word ptr [bp-146h]
		push	word ptr [bp-144h]
		push	word ptr [bp-0C7Eh]
		mov	bx, [bp-0C80h]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_B8EC6:				; CODE XREF: ovr209:1E54j ovr209:1EA4j
		mov	dword ptr [bp-150h], 0
		mov	byte ptr [bp-14Ch], 2
		mov	byte ptr [bp-14Bh], 0
		mov	dword ptr [bp-14Ah], 0
		push	3
		lea	ax, [bp-150h]
		push	ax
		push	2
		lea	ax, [bp-29Ch]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	dword ptr [bp-15Ah], 0
		mov	byte ptr [bp-156h], 2
		mov	byte ptr [bp-155h], 0
		mov	dword ptr [bp-154h], 0
		push	3
		lea	ax, [bp-15Ah]
		push	ax
		push	32h ; '2'
		lea	ax, [bp-314h]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	dword ptr [bp-164h], 0
		mov	byte ptr [bp-160h], 2
		mov	byte ptr [bp-15Fh], 0
		mov	dword ptr [bp-15Eh], 0
		push	3
		lea	ax, [bp-164h]
		push	ax
		push	1
		lea	ax, [bp-29Ch]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	dword ptr [bp-16Eh], 0
		mov	byte ptr [bp-16Ah], 2
		mov	byte ptr [bp-169h], 0
		mov	dword ptr [bp-168h], 0
		push	2
		lea	ax, [bp-16Eh]
		push	ax
		push	1Fh
		lea	ax, [bp-29Ch]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	word ptr [bp-171h], 0
		lea	ax, [bp-16Eh]
		push	ax
		lea	ax, [bp-174h]
		push	ax
		call	Palette_LoadFromResource_2CCE5
		add	sp, 4
		lea	ax, [bp-216h]
		push	ax
		push	0FFh
		push	0Fh
		lea	ax, [bp-0CA2h]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		push	0FFB0h
		push	0
		lea	ax, [bp-38h]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	[bp-176h], ax
		push	0
		push	0
		lea	ax, [bp-150h]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	[bp-178h], ax
		push	0Ch
		push	0
		lea	ax, [bp-15Ah]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	[bp-17Ah], ax
		push	0
		push	0
		lea	ax, [bp-164h]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	[bp-17Ch], ax
		push	0FFF5h
		push	2Ch ; ','
		lea	ax, [bp-164h]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	[bp-17Eh], ax
		push	word ptr [bp-174h]
		mov	al, [bp-172h]
		push	ax
		lea	ax, [bp-174h]
		push	ax
		lea	ax, [bp-16h]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	word ptr [bp-176h]
		lea	ax, [bp-0CA2h]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp-178h]
		lea	ax, [bp-0CA2h]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp-17Ah]
		lea	ax, [bp-0CA2h]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp-17Eh]
		lea	ax, [bp-0CA2h]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		push	0
		push	word ptr [bp-16h]
		mov	al, [bp-14h]
		push	ax
		lea	ax, [bp-16h]
		push	ax
		call	Palette_Upload_2CDE1
		add	sp, 8
		push	0
		lea	ax, [bp-0C72h]
		push	ax
		call	Widget_Method_DispatchC_314CB
		add	sp, 4
		push	0
		lea	ax, [bp-0C72h]
		push	ax
		call	Widget_Method_Dispatch8_314A9
		add	sp, 4
		mov	bx, [bp-17Eh]
		mov	word ptr [bx+1Bh], 3
		jmp	short loc_B9107
; ���������������������������������������������������������������������������

loc_B90D9:				; CODE XREF: ovr209:2130j
		push	1
		push	0FFFCh
		push	word ptr [bp-17Eh]
		mov	bx, [bp-17Eh]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_B90FA
		jmp	short loc_B90FA
; ���������������������������������������������������������������������������
		jmp	short loc_B9122
; ���������������������������������������������������������������������������

loc_B90FA:				; CODE XREF: ovr209:2104j ovr209:2106j
		lea	ax, [bp-0CA2h]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_B9107:				; CODE XREF: ovr209:20E7j
		cmp	word ptr [bp-0C85h], 0Ah
		jnb	short loc_B9115
		cmp	byte ptr [bp-0C83h], 0
		jz	short loc_B911A

loc_B9115:				; CODE XREF: ovr209:211Cj
		mov	ax, 1
		jmp	short loc_B911C
; ���������������������������������������������������������������������������

loc_B911A:				; CODE XREF: ovr209:2123j
		xor	ax, ax

loc_B911C:				; CODE XREF: ovr209:2128j
		mov	ah, 0
		or	ax, ax
		jz	short loc_B90D9

loc_B9122:				; CODE XREF: ovr209:2108j
		push	word ptr [bp-17Eh]
		lea	ax, [bp-0CA2h]
		push	ax
		call	LayerGroup_Remove_2DBC1
		add	sp, 4
		cmp	word ptr [bp-17Eh], 0
		jz	short loc_B914D
		push	3
		push	word ptr [bp-17Eh]
		mov	bx, [bp-17Eh]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short $+2

loc_B914D:				; CODE XREF: ovr209:2148j
		push	word ptr [bp-17Ch]
		lea	ax, [bp-0CA2h]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		mov	word ptr [bp-0C85h], 0
		mov	word ptr [bp-180h], 0
		mov	word ptr [bp-182h], 3
		jmp	short loc_B91E2
; ���������������������������������������������������������������������������

loc_B9172:				; CODE XREF: ovr209:220Dj
		mov	ax, [bp-0C85h]
		mov	[bp-184h], ax
		cmp	word ptr [bp-184h], 33h	; '3'
		jge	short loc_B919A
		mov	ax, [bp-182h]
		mov	[bp-186h], ax
		inc	word ptr [bp-182h]
		mov	bx, [bp-17Ch]
		mov	ax, [bp-186h]
		mov	[bx+1Bh], ax
		jmp	short loc_B91C8
; ���������������������������������������������������������������������������

loc_B919A:				; CODE XREF: ovr209:218Fj
		mov	ax, [bp-180h]
		mov	[bp-188h], ax
		inc	word ptr [bp-180h]
		mov	bx, [bp-17Ah]
		mov	ax, [bp-188h]
		mov	[bx+1Bh], ax
		mov	ax, [bp-182h]
		mov	[bp-18Ah], ax
		inc	word ptr [bp-182h]
		mov	bx, [bp-17Ch]
		mov	ax, [bp-18Ah]
		mov	[bx+1Bh], ax

loc_B91C8:				; CODE XREF: ovr209:21A8j
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_B91D5
		jmp	short loc_B91D5
; ���������������������������������������������������������������������������
		jmp	short loc_B9200
; ���������������������������������������������������������������������������

loc_B91D5:				; CODE XREF: ovr209:21DFj ovr209:21E1j
		lea	ax, [bp-0CA2h]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_B91E2:				; CODE XREF: ovr209:2180j
		cmp	word ptr [bp-0C85h], 49h ; 'I'
		jnb	short loc_B91F0
		cmp	byte ptr [bp-0C83h], 0
		jz	short loc_B91F5

loc_B91F0:				; CODE XREF: ovr209:21F7j
		mov	ax, 1
		jmp	short loc_B91F7
; ���������������������������������������������������������������������������

loc_B91F5:				; CODE XREF: ovr209:21FEj
		xor	ax, ax

loc_B91F7:				; CODE XREF: ovr209:2203j
		mov	ah, 0
		or	ax, ax
		jnz	short loc_B9200
		jmp	loc_B9172
; ���������������������������������������������������������������������������

loc_B9200:				; CODE XREF: ovr209:21E3j ovr209:220Bj
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		push	0
		lea	ax, [bp-0CA2h]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		push	2
		lea	ax, [bp-174h]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	byte ptr [bp-169h], 0
		jz	short loc_B9254
		cmp	dword ptr [bp-16Eh], 0
		jz	short loc_B9254
		push	0
		mov	al, [bp-16Ah]
		push	ax
		lea	ax, [bp-16Eh]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B9254:				; CODE XREF: ovr209:2241j ovr209:2249j
		mov	dword ptr [bp-16Eh], 0
		mov	byte ptr [bp-169h], 0
		mov	dword ptr [bp-168h], 0
		cmp	byte ptr [bp-15Fh], 0
		jz	short loc_B9293
		cmp	dword ptr [bp-164h], 0
		jz	short loc_B9293
		push	0
		mov	al, [bp-160h]
		push	ax
		lea	ax, [bp-164h]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B9293:				; CODE XREF: ovr209:2280j ovr209:2288j
		mov	dword ptr [bp-164h], 0
		mov	byte ptr [bp-15Fh], 0
		mov	dword ptr [bp-15Eh], 0
		cmp	byte ptr [bp-155h], 0
		jz	short loc_B92D2
		cmp	dword ptr [bp-15Ah], 0
		jz	short loc_B92D2
		push	0
		mov	al, [bp-156h]
		push	ax
		lea	ax, [bp-15Ah]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B92D2:				; CODE XREF: ovr209:22BFj ovr209:22C7j
		mov	dword ptr [bp-15Ah], 0
		mov	byte ptr [bp-155h], 0
		mov	dword ptr [bp-154h], 0
		cmp	byte ptr [bp-14Bh], 0
		jz	short loc_B9311
		cmp	dword ptr [bp-150h], 0
		jz	short loc_B9311
		push	0
		mov	al, [bp-14Ch]
		push	ax
		lea	ax, [bp-150h]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B9311:				; CODE XREF: ovr209:22FEj ovr209:2306j
		mov	dword ptr [bp-150h], 0
		mov	byte ptr [bp-14Bh], 0
		mov	dword ptr [bp-14Ah], 0
		lea	ax, [bp-0C80h]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	byte ptr [bp-0C77h], 0
		jz	short loc_B935D
		cmp	dword ptr [bp-0C7Ch], 0
		jz	short loc_B935D
		push	0
		mov	al, [bp-0C78h]
		push	ax
		lea	ax, [bp-0C7Ch]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B935D:				; CODE XREF: ovr209:234Aj ovr209:2352j
		mov	dword ptr [bp-0C7Ch], 0
		mov	byte ptr [bp-0C77h], 0
		mov	dword ptr [bp-0C76h], 0
		cmp	byte ptr [bp-13Dh], 0
		jz	short loc_B939C
		cmp	dword ptr [bp-142h], 0
		jz	short loc_B939C
		push	0
		mov	al, [bp-13Eh]
		push	ax
		lea	ax, [bp-142h]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B939C:				; CODE XREF: ovr209:2389j ovr209:2391j
		mov	dword ptr [bp-142h], 0
		mov	byte ptr [bp-13Dh], 0
		mov	dword ptr [bp-13Ch], 0
		cmp	byte_495FC, 0
		jz	short loc_B93BD
		jmp	loc_BD722
; ���������������������������������������������������������������������������

loc_B93BD:				; CODE XREF: ovr209:23C8j
		mov	dword ptr [bp-142h], 0
		mov	byte ptr [bp-13Eh], 2
		mov	byte ptr [bp-13Dh], 0
		mov	dword ptr [bp-13Ch], 0
		mov	dword ptr [bp-14Ch], 0
		mov	byte ptr [bp-148h], 2
		mov	byte ptr [bp-147h], 0
		mov	dword ptr [bp-146h], 0
		mov	dword ptr [bp-0C7Ch], 0
		mov	byte ptr [bp-0C78h], 2
		mov	byte ptr [bp-0C77h], 0
		mov	dword ptr [bp-0C76h], 0
		mov	word ptr [bp-0C80h], 0
		mov	word ptr [bp-0C7Eh], 0FFFFh
		mov	dword ptr [bp-0C8Ah], 0
		mov	byte ptr [bp-0C86h], 2
		mov	byte ptr [bp-0C85h], 0
		mov	dword ptr [bp-0C84h], 0
		mov	word ptr [bp-0C8Eh], 0
		mov	word ptr [bp-0C8Ch], 0FFFFh
		cmp	byte ptr [bp-9], 0
		jnz	short loc_B944E
		jmp	loc_B9508
; ���������������������������������������������������������������������������

loc_B944E:				; CODE XREF: ovr209:2459j
		push	3
		lea	ax, [bp-142h]
		push	ax
		push	5Dh ; ']'
		lea	ax, [bp-404h]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	word_46849
		lea	ax, [bp-0C80h]
		push	ax
		call	MusicChannel_Init_78A4
		add	sp, 4
		push	0
		lea	ax, [bp-142h]
		push	ax
		lea	ax, [bp-0C80h]
		push	ax
		call	MusicChannel_RegisterSequence_7918
		add	sp, 6
		mov	ax, word_48F5C
		mov	[bp-14Eh], ax
		mov	word ptr [bp-150h], 0
		cmp	word ptr [bp-0C80h], 0
		jz	short loc_B94CD
		push	word ptr [bp-0C7Eh]
		mov	bx, [bp-0C80h]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	word ptr [bp-150h]
		push	word ptr [bp-14Eh]
		push	word ptr [bp-0C7Eh]
		mov	bx, [bp-0C80h]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_B94CD:				; CODE XREF: ovr209:24ABj
		push	3
		lea	ax, [bp-14Ch]
		push	ax
		push	14h
		lea	ax, [bp-404h]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	word_46849
		lea	ax, [bp-0C8Eh]
		push	ax
		call	MusicChannel_Init_78A4
		add	sp, 4
		push	0
		lea	ax, [bp-14Ch]
		push	ax
		lea	ax, [bp-0C8Eh]
		push	ax
		call	MusicChannel_RegisterSequence_7918
		add	sp, 6

loc_B9508:				; CODE XREF: ovr209:245Bj
		mov	dword ptr [bp-15Ah], 0
		mov	byte ptr [bp-156h], 2
		mov	byte ptr [bp-155h], 0
		mov	dword ptr [bp-154h], 0
		push	3
		lea	ax, [bp-15Ah]
		push	ax
		push	0Ah
		lea	ax, [bp-29Ch]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		lea	ax, [bp-216h]
		push	ax
		push	0FFh
		push	0Fh
		lea	ax, [bp-0CB0h]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		push	0FFB0h
		push	0
		lea	ax, [bp-38h]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	[bp-15Ch], ax
		push	0
		push	0
		lea	ax, [bp-56h]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	[bp-15Eh], ax
		push	1
		push	0
		push	0
		lea	ax, [bp-60h]
		push	ax
		push	0
		call	OverlayImageLayer_Construct_A9D6
		add	sp, 0Ah
		mov	[bp-160h], ax
		push	0
		push	0
		lea	ax, [bp-15Ah]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	[bp-162h], ax
		push	word ptr [bp-70h]
		mov	al, [bp-6Eh]
		push	ax
		lea	ax, [bp-70h]
		push	ax
		lea	ax, [bp-16h]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	word ptr [bp-0B0h]
		mov	al, [bp-0AEh]
		push	ax
		lea	ax, [bp-0B0h]
		push	ax
		lea	ax, [bp-16h]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	word ptr [bp-0C0h]
		mov	al, [bp-0BEh]
		push	ax
		lea	ax, [bp-0C0h]
		push	ax
		lea	ax, [bp-16h]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	word ptr [bp-15Ch]
		lea	ax, [bp-0CB0h]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp-15Eh]
		lea	ax, [bp-0CB0h]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp-160h]
		lea	ax, [bp-0CB0h]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp-162h]
		lea	ax, [bp-0CB0h]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		push	0
		push	word ptr [bp-16h]
		mov	al, [bp-14h]
		push	ax
		lea	ax, [bp-16h]
		push	ax
		call	Palette_Upload_2CDE1
		add	sp, 8
		lea	ax, [bp-0CB0h]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		mov	dword ptr [bp-16Ch], 0
		mov	byte ptr [bp-168h], 2
		mov	byte ptr [bp-167h], 0
		mov	dword ptr [bp-166h], 0
		push	2
		lea	ax, [bp-16Ch]
		push	ax
		push	30h ; '0'
		lea	ax, [bp-314h]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	dword ptr [bp-176h], 0
		mov	byte ptr [bp-172h], 2
		mov	byte ptr [bp-171h], 0
		mov	dword ptr [bp-170h], 0
		push	2
		lea	ax, [bp-176h]
		push	ax
		push	31h ; '1'
		lea	ax, [bp-314h]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	dword ptr [bp-180h], 0
		mov	byte ptr [bp-17Ch], 2
		mov	byte ptr [bp-17Bh], 0
		mov	dword ptr [bp-17Ah], 0
		push	2
		lea	ax, [bp-180h]
		push	ax
		push	8
		lea	ax, [bp-29Ch]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	dword ptr [bp-18Ah], 0
		mov	byte ptr [bp-186h], 2
		mov	byte ptr [bp-185h], 0
		mov	dword ptr [bp-184h], 0
		push	2
		lea	ax, [bp-18Ah]
		push	ax
		push	1Bh
		lea	ax, [bp-29Ch]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	0
		push	0
		lea	ax, [bp-16Ch]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	[bp-18Ch], ax
		push	0
		push	0
		lea	ax, [bp-176h]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	[bp-18Eh], ax
		push	0
		push	0
		lea	ax, [bp-180h]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	[bp-190h], ax
		push	0
		push	0
		lea	ax, [bp-18Ah]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	[bp-192h], ax
		mov	word ptr [bp-0C93h], 0
		push	word ptr [bp-160h]
		lea	ax, [bp-0CB0h]
		push	ax
		call	LayerGroup_Remove_2DBC1
		add	sp, 4
		push	word ptr [bp-162h]
		lea	ax, [bp-0CB0h]
		push	ax
		call	LayerGroup_Remove_2DBC1
		add	sp, 4
		push	word ptr [bp-18Ch]
		lea	ax, [bp-0CB0h]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp-190h]
		lea	ax, [bp-0CB0h]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp-160h]
		lea	ax, [bp-0CB0h]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp-162h]
		lea	ax, [bp-0CB0h]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		mov	word ptr [bp-194h], 0
		mov	word ptr [bp-196h], 0
		jmp	loc_B9ABA
; ���������������������������������������������������������������������������

loc_B980A:				; CODE XREF: ovr209:2AE5j
		mov	ax, [bp-0C93h]
		mov	[bp-198h], ax
		cmp	word ptr [bp-198h], 14h
		jnz	short loc_B9828
		push	0Dh
		lea	ax, [bp-0CB0h]
		push	ax
		call	Scene_SetFps_2DE27
		add	sp, 4

loc_B9828:				; CODE XREF: ovr209:2827j
		cmp	word ptr [bp-198h], 1Eh
		jnz	short loc_B983E
		push	0Bh
		lea	ax, [bp-0CB0h]
		push	ax
		call	Scene_SetFps_2DE27
		add	sp, 4

loc_B983E:				; CODE XREF: ovr209:283Dj
		cmp	word ptr [bp-198h], 28h	; '('
		jnz	short loc_B9854
		push	9
		lea	ax, [bp-0CB0h]
		push	ax
		call	Scene_SetFps_2DE27
		add	sp, 4

loc_B9854:				; CODE XREF: ovr209:2853j
		cmp	word ptr [bp-198h], 32h	; '2'
		jnz	short loc_B986A
		push	7
		lea	ax, [bp-0CB0h]
		push	ax
		call	Scene_SetFps_2DE27
		add	sp, 4

loc_B986A:				; CODE XREF: ovr209:2869j
		cmp	word ptr [bp-198h], 1Eh
		jge	short loc_B98A2
		mov	ax, [bp-194h]
		mov	[bp-19Ah], ax
		inc	word ptr [bp-194h]
		mov	bx, [bp-18Ch]
		mov	ax, [bp-19Ah]
		mov	[bx+1Bh], ax
		mov	ax, [bp-196h]
		mov	[bp-19Ch], ax
		inc	word ptr [bp-196h]
		mov	bx, [bp-190h]
		mov	ax, [bp-19Ch]
		mov	[bx+1Bh], ax
		jmp	loc_B9AA0
; ���������������������������������������������������������������������������

loc_B98A2:				; CODE XREF: ovr209:287Fj
		cmp	word ptr [bp-198h], 1Eh
		jz	short loc_B98AC
		jmp	loc_B9963
; ���������������������������������������������������������������������������

loc_B98AC:				; CODE XREF: ovr209:28B7j
		mov	word ptr [bp-194h], 0
		push	word ptr [bp-18Ch]
		lea	ax, [bp-0CB0h]
		push	ax
		call	LayerGroup_Remove_2DBC1
		add	sp, 4
		cmp	word ptr [bp-18Ch], 0
		jz	short loc_B98DD
		push	3
		push	word ptr [bp-18Ch]
		mov	bx, [bp-18Ch]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short $+2

loc_B98DD:				; CODE XREF: ovr209:28D8j
		push	word ptr [bp-160h]
		lea	ax, [bp-0CB0h]
		push	ax
		call	LayerGroup_Remove_2DBC1
		add	sp, 4
		push	word ptr [bp-162h]
		lea	ax, [bp-0CB0h]
		push	ax
		call	LayerGroup_Remove_2DBC1
		add	sp, 4
		push	word ptr [bp-18Eh]
		lea	ax, [bp-0CB0h]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp-160h]
		lea	ax, [bp-0CB0h]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp-162h]
		lea	ax, [bp-0CB0h]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		mov	ax, [bp-194h]
		mov	[bp-19Eh], ax
		inc	word ptr [bp-194h]
		mov	bx, [bp-18Eh]
		mov	ax, [bp-19Eh]
		mov	[bx+1Bh], ax
		mov	ax, [bp-196h]
		mov	[bp-1A0h], ax
		inc	word ptr [bp-196h]
		mov	bx, [bp-190h]
		mov	ax, [bp-1A0h]
		mov	[bx+1Bh], ax
		jmp	loc_B9AA0
; ���������������������������������������������������������������������������

loc_B9963:				; CODE XREF: ovr209:28B9j
		cmp	word ptr [bp-198h], 1Eh
		jle	short loc_B99A2
		cmp	word ptr [bp-198h], 32h	; '2'
		jge	short loc_B99A2
		mov	ax, [bp-194h]
		mov	[bp-1A2h], ax
		inc	word ptr [bp-194h]
		mov	bx, [bp-18Eh]
		mov	ax, [bp-1A2h]
		mov	[bx+1Bh], ax
		mov	ax, [bp-196h]
		mov	[bp-1A4h], ax
		inc	word ptr [bp-196h]
		mov	bx, [bp-190h]
		mov	ax, [bp-1A4h]
		mov	[bx+1Bh], ax
		jmp	loc_B9AA0
; ���������������������������������������������������������������������������

loc_B99A2:				; CODE XREF: ovr209:2978j ovr209:297Fj
		cmp	word ptr [bp-198h], 3Ch	; '<'
		jz	short loc_B99AC
		jmp	loc_B9A73
; ���������������������������������������������������������������������������

loc_B99AC:				; CODE XREF: ovr209:29B7j
		cmp	byte ptr [bp-9], 0
		jnz	short loc_B99B5
		jmp	loc_B9A34
; ���������������������������������������������������������������������������

loc_B99B5:				; CODE XREF: ovr209:29C0j
		push	3
		lea	ax, [bp-14Ch]
		push	ax
		push	14h
		lea	ax, [bp-404h]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	word_46849
		lea	ax, [bp-0C8Eh]
		push	ax
		call	MusicChannel_Init_78A4
		add	sp, 4
		push	0
		lea	ax, [bp-14Ch]
		push	ax
		lea	ax, [bp-0C8Eh]
		push	ax
		call	MusicChannel_RegisterSequence_7918
		add	sp, 6
		mov	ax, word_48ECA
		mov	[bp-1A6h], ax
		mov	word ptr [bp-1A8h], 0
		cmp	word ptr [bp-0C8Eh], 0
		jz	short loc_B9A34
		push	word ptr [bp-0C8Ch]
		mov	bx, [bp-0C8Eh]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	word ptr [bp-1A8h]
		push	word ptr [bp-1A6h]
		push	word ptr [bp-0C8Ch]
		mov	bx, [bp-0C8Eh]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_B9A34:				; CODE XREF: ovr209:29C2j ovr209:2A12j
		mov	word ptr [bp-194h], 0
		push	0Fh
		lea	ax, [bp-0CB0h]
		push	ax
		call	Scene_SetFps_2DE27
		add	sp, 4
		push	word ptr [bp-192h]
		lea	ax, [bp-0CB0h]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		mov	ax, [bp-194h]
		mov	[bp-1AAh], ax
		inc	word ptr [bp-194h]
		mov	bx, [bp-192h]
		mov	ax, [bp-1AAh]
		mov	[bx+1Bh], ax
		jmp	short loc_B9AA0
; ���������������������������������������������������������������������������

loc_B9A73:				; CODE XREF: ovr209:29B9j
		cmp	word ptr [bp-198h], 3Ch	; '<'
		jle	short loc_B9AA0
		cmp	word ptr [bp-198h], 4Eh	; 'N'
		jge	short loc_B9AA0
		test	word ptr [bp-198h], 1
		jz	short loc_B9AA0
		mov	ax, [bp-194h]
		mov	[bp-1ACh], ax
		inc	word ptr [bp-194h]
		mov	bx, [bp-192h]
		mov	ax, [bp-1ACh]
		mov	[bx+1Bh], ax

loc_B9AA0:				; CODE XREF: ovr209:28AFj ovr209:2970j ...
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_B9AAD
		jmp	short loc_B9AAD
; ���������������������������������������������������������������������������
		jmp	short loc_B9AD8
; ���������������������������������������������������������������������������

loc_B9AAD:				; CODE XREF: ovr209:2AB7j ovr209:2AB9j
		lea	ax, [bp-0CB0h]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_B9ABA:				; CODE XREF: ovr209:2817j
		cmp	word ptr [bp-0C93h], 58h ; 'X'
		jnb	short loc_B9AC8
		cmp	byte ptr [bp-0C91h], 0
		jz	short loc_B9ACD

loc_B9AC8:				; CODE XREF: ovr209:2ACFj
		mov	ax, 1
		jmp	short loc_B9ACF
; ���������������������������������������������������������������������������

loc_B9ACD:				; CODE XREF: ovr209:2AD6j
		xor	ax, ax

loc_B9ACF:				; CODE XREF: ovr209:2ADBj
		mov	ah, 0
		or	ax, ax
		jnz	short loc_B9AD8
		jmp	loc_B980A
; ���������������������������������������������������������������������������

loc_B9AD8:				; CODE XREF: ovr209:2ABBj ovr209:2AE3j
		cmp	byte ptr [bp-185h], 0
		jz	short loc_B9B00
		cmp	dword ptr [bp-18Ah], 0
		jz	short loc_B9B00
		push	0
		mov	al, [bp-186h]
		push	ax
		lea	ax, [bp-18Ah]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B9B00:				; CODE XREF: ovr209:2AEDj ovr209:2AF5j
		mov	dword ptr [bp-18Ah], 0
		mov	byte ptr [bp-185h], 0
		mov	dword ptr [bp-184h], 0
		cmp	byte ptr [bp-17Bh], 0
		jz	short loc_B9B3F
		cmp	dword ptr [bp-180h], 0
		jz	short loc_B9B3F
		push	0
		mov	al, [bp-17Ch]
		push	ax
		lea	ax, [bp-180h]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B9B3F:				; CODE XREF: ovr209:2B2Cj ovr209:2B34j
		mov	dword ptr [bp-180h], 0
		mov	byte ptr [bp-17Bh], 0
		mov	dword ptr [bp-17Ah], 0
		cmp	byte ptr [bp-171h], 0
		jz	short loc_B9B7E
		cmp	dword ptr [bp-176h], 0
		jz	short loc_B9B7E
		push	0
		mov	al, [bp-172h]
		push	ax
		lea	ax, [bp-176h]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B9B7E:				; CODE XREF: ovr209:2B6Bj ovr209:2B73j
		mov	dword ptr [bp-176h], 0
		mov	byte ptr [bp-171h], 0
		mov	dword ptr [bp-170h], 0
		cmp	byte ptr [bp-167h], 0
		jz	short loc_B9BBD
		cmp	dword ptr [bp-16Ch], 0
		jz	short loc_B9BBD
		push	0
		mov	al, [bp-168h]
		push	ax
		lea	ax, [bp-16Ch]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B9BBD:				; CODE XREF: ovr209:2BAAj ovr209:2BB2j
		mov	dword ptr [bp-16Ch], 0
		mov	byte ptr [bp-167h], 0
		mov	dword ptr [bp-166h], 0
		push	0
		lea	ax, [bp-0CB0h]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		cmp	byte ptr [bp-155h], 0
		jz	short loc_B9C0B
		cmp	dword ptr [bp-15Ah], 0
		jz	short loc_B9C0B
		push	0
		mov	al, [bp-156h]
		push	ax
		lea	ax, [bp-15Ah]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B9C0B:				; CODE XREF: ovr209:2BF8j ovr209:2C00j
		mov	dword ptr [bp-15Ah], 0
		mov	byte ptr [bp-155h], 0
		mov	dword ptr [bp-154h], 0
		lea	ax, [bp-0C8Eh]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	byte ptr [bp-0C85h], 0
		jz	short loc_B9C57
		cmp	dword ptr [bp-0C8Ah], 0
		jz	short loc_B9C57
		push	0
		mov	al, [bp-0C86h]
		push	ax
		lea	ax, [bp-0C8Ah]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B9C57:				; CODE XREF: ovr209:2C44j ovr209:2C4Cj
		mov	dword ptr [bp-0C8Ah], 0
		mov	byte ptr [bp-0C85h], 0
		mov	dword ptr [bp-0C84h], 0
		lea	ax, [bp-0C80h]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	byte ptr [bp-0C77h], 0
		jz	short loc_B9CA3
		cmp	dword ptr [bp-0C7Ch], 0
		jz	short loc_B9CA3
		push	0
		mov	al, [bp-0C78h]
		push	ax
		lea	ax, [bp-0C7Ch]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B9CA3:				; CODE XREF: ovr209:2C90j ovr209:2C98j
		mov	dword ptr [bp-0C7Ch], 0
		mov	byte ptr [bp-0C77h], 0
		mov	dword ptr [bp-0C76h], 0
		cmp	byte ptr [bp-147h], 0
		jz	short loc_B9CE2
		cmp	dword ptr [bp-14Ch], 0
		jz	short loc_B9CE2
		push	0
		mov	al, [bp-148h]
		push	ax
		lea	ax, [bp-14Ch]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B9CE2:				; CODE XREF: ovr209:2CCFj ovr209:2CD7j
		mov	dword ptr [bp-14Ch], 0
		mov	byte ptr [bp-147h], 0
		mov	dword ptr [bp-146h], 0
		cmp	byte ptr [bp-13Dh], 0
		jz	short loc_B9D21
		cmp	dword ptr [bp-142h], 0
		jz	short loc_B9D21
		push	0
		mov	al, [bp-13Eh]
		push	ax
		lea	ax, [bp-142h]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_B9D21:				; CODE XREF: ovr209:2D0Ej ovr209:2D16j
		mov	dword ptr [bp-142h], 0
		mov	byte ptr [bp-13Dh], 0
		mov	dword ptr [bp-13Ch], 0
		cmp	byte_495FC, 0
		jz	short loc_B9D42
		jmp	loc_BD722
; ���������������������������������������������������������������������������

loc_B9D42:				; CODE XREF: ovr209:2D4Dj
		lea	ax, [bp-216h]
		push	ax
		push	0FFh
		push	0Ah
		lea	ax, [bp-0C94h]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		mov	dword ptr [bp-142h], 0
		mov	byte ptr [bp-13Eh], 2
		mov	byte ptr [bp-13Dh], 0
		mov	dword ptr [bp-13Ch], 0
		push	2
		lea	ax, [bp-142h]
		push	ax
		push	6
		lea	ax, [bp-314h]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	word ptr [bp-145h], 0
		lea	ax, [bp-142h]
		push	ax
		lea	ax, [bp-148h]
		push	ax
		call	Palette_LoadFromResource_2CCE5
		add	sp, 4
		mov	dword ptr [bp-152h], 0
		mov	byte ptr [bp-14Eh], 2
		mov	byte ptr [bp-14Dh], 0
		mov	dword ptr [bp-14Ch], 0
		push	3
		lea	ax, [bp-152h]
		push	ax
		push	4
		lea	ax, [bp-314h]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	0FFB0h
		push	0
		lea	ax, [bp-38h]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	[bp-154h], ax
		mov	dword ptr [bp-15Eh], 0
		mov	byte ptr [bp-15Ah], 2
		mov	byte ptr [bp-159h], 0
		mov	dword ptr [bp-158h], 0
		push	2
		lea	ax, [bp-15Eh]
		push	ax
		push	281Fh
		call	ConvData_LoadByName_C38E
		add	sp, 6
		push	0
		push	0
		lea	ax, [bp-152h]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	[bp-160h], ax
		push	81h ; '�'
		push	0A0h ; '�'
		lea	ax, [bp-15Eh]
		push	ax
		push	0
		call	TalkingHeadOverlay_Construct_B20F
		add	sp, 8
		mov	[bp-162h], ax
		push	33h ; '3'
		push	81h ; '�'
		push	0A0h ; '�'
		lea	ax, [bp-15Eh]
		push	ax
		push	0
		call	ImageLayer_Construct_2E02C
		add	sp, 0Ah
		mov	[bp-164h], ax
		push	word ptr [bp-70h]
		mov	al, [bp-6Eh]
		push	ax
		lea	ax, [bp-70h]
		push	ax
		lea	ax, [bp-16h]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	word ptr [bp-0B0h]
		mov	al, [bp-0AEh]
		push	ax
		lea	ax, [bp-0B0h]
		push	ax
		lea	ax, [bp-16h]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	word ptr [bp-148h]
		mov	al, [bp-146h]
		push	ax
		lea	ax, [bp-148h]
		push	ax
		lea	ax, [bp-16h]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	word ptr [bp-0D0h]
		mov	al, [bp-0CEh]
		push	ax
		lea	ax, [bp-0D0h]
		push	ax
		lea	ax, [bp-16h]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		push	0
		push	word ptr [bp-16h]
		mov	al, [bp-14h]
		push	ax
		lea	ax, [bp-16h]
		push	ax
		call	Palette_Upload_2CDE1
		add	sp, 8
		push	word ptr [bp-154h]
		lea	ax, [bp-0C94h]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp-160h]
		lea	ax, [bp-0C94h]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp-162h]
		lea	ax, [bp-0C94h]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp-164h]
		lea	ax, [bp-0C94h]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	0
		lea	ax, [bp-0C72h]
		push	ax
		call	Widget_Method_DispatchC_314CB
		add	sp, 4
		push	7Fh ; ''
		lea	ax, [bp-0C72h]
		push	ax
		call	Widget_Method_Dispatch8_314A9
		add	sp, 4
		mov	dword ptr [bp-16Eh], 0
		mov	byte ptr [bp-16Ah], 2
		mov	byte ptr [bp-169h], 0
		mov	dword ptr [bp-168h], 0
		push	3
		lea	ax, [bp-16Eh]
		push	ax
		push	0
		lea	ax, [bp-314h]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	1
		push	80h ; '�'
		push	0A0h ; '�'
		lea	ax, [bp-16Eh]
		push	ax
		push	0
		call	ToggleLayer_Construct_B57B
		add	sp, 0Ah
		mov	[bp-170h], ax
		push	word ptr [bp-170h]
		lea	ax, [bp-0C94h]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		jmp	short loc_B9FBB
; ���������������������������������������������������������������������������

loc_B9FAE:				; CODE XREF: ovr209:2FE4j
		lea	ax, [bp-0C94h]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_B9FBB:				; CODE XREF: ovr209:2FBCj
		cmp	word ptr [bp-0C77h], 0Fh
		jnb	short loc_B9FC9
		cmp	byte ptr [bp-0C75h], 0
		jz	short loc_B9FCE

loc_B9FC9:				; CODE XREF: ovr209:2FD0j
		mov	ax, 1
		jmp	short loc_B9FD0
; ���������������������������������������������������������������������������

loc_B9FCE:				; CODE XREF: ovr209:2FD7j
		xor	ax, ax

loc_B9FD0:				; CODE XREF: ovr209:2FDCj
		mov	ah, 0
		or	ax, ax
		jz	short loc_B9FAE
		mov	word ptr [bp-0C77h], 0
		push	1Bh
		push	word ptr [bp-162h]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4
		jmp	short loc_B9FF9
; ���������������������������������������������������������������������������

loc_B9FEC:				; CODE XREF: ovr209:3022j
		lea	ax, [bp-0C94h]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_B9FF9:				; CODE XREF: ovr209:2FFAj
		cmp	word ptr [bp-0C77h], 2
		jnb	short loc_BA007
		cmp	byte ptr [bp-0C75h], 0
		jz	short loc_BA00C

loc_BA007:				; CODE XREF: ovr209:300Ej
		mov	ax, 1
		jmp	short loc_BA00E
; ���������������������������������������������������������������������������

loc_BA00C:				; CODE XREF: ovr209:3015j
		xor	ax, ax

loc_BA00E:				; CODE XREF: ovr209:301Aj
		mov	ah, 0
		or	ax, ax
		jz	short loc_B9FEC
		push	1Ch
		push	word ptr [bp-162h]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4
		jmp	short loc_BA031
; ���������������������������������������������������������������������������

loc_BA024:				; CODE XREF: ovr209:305Aj
		lea	ax, [bp-0C94h]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_BA031:				; CODE XREF: ovr209:3032j
		cmp	word ptr [bp-0C77h], 0Ah
		jnb	short loc_BA03F
		cmp	byte ptr [bp-0C75h], 0
		jz	short loc_BA044

loc_BA03F:				; CODE XREF: ovr209:3046j
		mov	ax, 1
		jmp	short loc_BA046
; ���������������������������������������������������������������������������

loc_BA044:				; CODE XREF: ovr209:304Dj
		xor	ax, ax

loc_BA046:				; CODE XREF: ovr209:3052j
		mov	ah, 0
		or	ax, ax
		jz	short loc_BA024
		cmp	byte ptr [bp-169h], 0
		jz	short loc_BA074
		cmp	dword ptr [bp-16Eh], 0
		jz	short loc_BA074
		push	0
		mov	al, [bp-16Ah]
		push	ax
		lea	ax, [bp-16Eh]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_BA074:				; CODE XREF: ovr209:3061j ovr209:3069j
		mov	dword ptr [bp-16Eh], 0
		mov	byte ptr [bp-169h], 0
		mov	dword ptr [bp-168h], 0
		cmp	byte ptr [bp-159h], 0
		jz	short loc_BA0B3
		cmp	dword ptr [bp-15Eh], 0
		jz	short loc_BA0B3
		push	0
		mov	al, [bp-15Ah]
		push	ax
		lea	ax, [bp-15Eh]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_BA0B3:				; CODE XREF: ovr209:30A0j ovr209:30A8j
		mov	dword ptr [bp-15Eh], 0
		mov	byte ptr [bp-159h], 0
		mov	dword ptr [bp-158h], 0
		cmp	byte ptr [bp-14Dh], 0
		jz	short loc_BA0F2
		cmp	dword ptr [bp-152h], 0
		jz	short loc_BA0F2
		push	0
		mov	al, [bp-14Eh]
		push	ax
		lea	ax, [bp-152h]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_BA0F2:				; CODE XREF: ovr209:30DFj ovr209:30E7j
		mov	dword ptr [bp-152h], 0
		mov	byte ptr [bp-14Dh], 0
		mov	dword ptr [bp-14Ch], 0
		push	2
		lea	ax, [bp-148h]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	byte ptr [bp-13Dh], 0
		jz	short loc_BA140
		cmp	dword ptr [bp-142h], 0
		jz	short loc_BA140
		push	0
		mov	al, [bp-13Eh]
		push	ax
		lea	ax, [bp-142h]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_BA140:				; CODE XREF: ovr209:312Dj ovr209:3135j
		mov	dword ptr [bp-142h], 0
		mov	byte ptr [bp-13Dh], 0
		mov	dword ptr [bp-13Ch], 0
		push	0
		lea	ax, [bp-0C94h]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		cmp	byte_495FC, 0
		jz	short loc_BA170
		jmp	loc_BD722
; ���������������������������������������������������������������������������

loc_BA170:				; CODE XREF: ovr209:317Bj
		mov	dword ptr [bp-142h], 0
		mov	byte ptr [bp-13Eh], 2
		mov	byte ptr [bp-13Dh], 0
		mov	dword ptr [bp-13Ch], 0
		push	3
		lea	ax, [bp-142h]
		push	ax
		push	17h
		lea	ax, [bp-29Ch]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	dword ptr [bp-14Ch], 0
		mov	byte ptr [bp-148h], 2
		mov	byte ptr [bp-147h], 0
		mov	dword ptr [bp-146h], 0
		push	3
		lea	ax, [bp-14Ch]
		push	ax
		push	16h
		lea	ax, [bp-29Ch]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	dword ptr [bp-156h], 0
		mov	byte ptr [bp-152h], 2
		mov	byte ptr [bp-151h], 0
		mov	dword ptr [bp-150h], 0
		push	3
		lea	ax, [bp-156h]
		push	ax
		push	14h
		lea	ax, [bp-29Ch]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	dword ptr [bp-160h], 0
		mov	byte ptr [bp-15Ch], 2
		mov	byte ptr [bp-15Bh], 0
		mov	dword ptr [bp-15Ah], 0
		push	3
		lea	ax, [bp-160h]
		push	ax
		push	1Ah
		lea	ax, [bp-29Ch]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	dword ptr [bp-16Ah], 0
		mov	byte ptr [bp-166h], 2
		mov	byte ptr [bp-165h], 0
		mov	dword ptr [bp-164h], 0
		push	3
		lea	ax, [bp-16Ah]
		push	ax
		push	19h
		lea	ax, [bp-29Ch]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	dword ptr [bp-174h], 0
		mov	byte ptr [bp-170h], 2
		mov	byte ptr [bp-16Fh], 0
		mov	dword ptr [bp-16Eh], 0
		push	3
		lea	ax, [bp-174h]
		push	ax
		push	15h
		lea	ax, [bp-29Ch]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	dword ptr [bp-17Eh], 0
		mov	byte ptr [bp-17Ah], 2
		mov	byte ptr [bp-179h], 0
		mov	dword ptr [bp-178h], 0
		push	3
		lea	ax, [bp-17Eh]
		push	ax
		push	18h
		lea	ax, [bp-29Ch]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		lea	ax, [bp-216h]
		push	ax
		push	0FFh
		push	0Ah
		lea	ax, [bp-0C94h]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		push	0
		push	0
		lea	ax, [bp-42h]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	[bp-180h], ax
		push	0
		push	0
		lea	ax, [bp-4Ch]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	[bp-182h], ax
		push	3
		push	0
		lea	ax, [bp-142h]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	[bp-184h], ax
		push	0
		push	3
		push	71h ; 'q'
		lea	ax, [bp-14Ch]
		push	ax
		push	0
		call	OverlayImageLayer_Construct_A9D6
		add	sp, 0Ah
		mov	[bp-186h], ax
		push	0
		push	3
		push	0
		lea	ax, [bp-156h]
		push	ax
		push	0
		call	OverlayImageLayer_Construct_A9D6
		add	sp, 0Ah
		mov	[bp-188h], ax
		push	0
		push	3
		push	0
		lea	ax, [bp-16Ah]
		push	ax
		push	0
		call	OverlayImageLayer_Construct_A9D6
		add	sp, 0Ah
		mov	[bp-18Ah], ax
		push	0
		push	3
		push	28h ; '('
		lea	ax, [bp-160h]
		push	ax
		push	0
		call	OverlayImageLayer_Construct_A9D6
		add	sp, 0Ah
		mov	[bp-18Ch], ax
		push	0
		push	3
		push	0
		lea	ax, [bp-174h]
		push	ax
		push	0
		call	OverlayImageLayer_Construct_A9D6
		add	sp, 0Ah
		mov	[bp-18Eh], ax
		push	0
		push	3
		push	0FF74h
		lea	ax, [bp-17Eh]
		push	ax
		push	0
		call	OverlayImageLayer_Construct_A9D6
		add	sp, 0Ah
		mov	[bp-190h], ax
		push	word ptr [bp-90h]
		mov	al, [bp-8Eh]
		push	ax
		lea	ax, [bp-90h]
		push	ax
		lea	ax, [bp-16h]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	word ptr [bp-80h]
		mov	al, [bp-7Eh]
		push	ax
		lea	ax, [bp-80h]
		push	ax
		lea	ax, [bp-16h]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	word ptr [bp-0A0h]
		mov	al, [bp-9Eh]
		push	ax
		lea	ax, [bp-0A0h]
		push	ax
		lea	ax, [bp-16h]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	word ptr [bp-180h]
		lea	ax, [bp-0C94h]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp-182h]
		lea	ax, [bp-0C94h]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp-184h]
		lea	ax, [bp-0C94h]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp-190h]
		lea	ax, [bp-0C94h]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp-18Ah]
		lea	ax, [bp-0C94h]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp-188h]
		lea	ax, [bp-0C94h]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp-18Eh]
		lea	ax, [bp-0C94h]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp-18Ch]
		lea	ax, [bp-0C94h]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp-186h]
		lea	ax, [bp-0C94h]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		mov	bx, [bp-186h]
		mov	word ptr [bx+1Bh], 2
		mov	bx, [bp-188h]
		mov	word ptr [bx+1Bh], 2
		mov	bx, [bp-18Ah]
		mov	word ptr [bx+1Bh], 1
		mov	bx, [bp-18Eh]
		mov	word ptr [bx+1Bh], 9
		mov	bx, [bp-18Ch]
		mov	word ptr [bx+1Bh], 1
		mov	bx, [bp-190h]
		mov	word ptr [bx+1Bh], 1
		push	0
		push	word ptr [bp-16h]
		mov	al, [bp-14h]
		push	ax
		lea	ax, [bp-16h]
		push	ax
		call	Palette_Upload_2CDE1
		add	sp, 8
		mov	word ptr [bp-192h], 1
		mov	word ptr [bp-194h], 1
		mov	word ptr [bp-0C77h], 0
		jmp	loc_BA605
; ���������������������������������������������������������������������������

loc_BA511:				; CODE XREF: ovr209:3630j
		mov	ax, [bp-0C77h]
		mov	[bp-196h], ax
		cmp	word ptr [bp-196h], 2
		jnz	short loc_BA537
		mov	ax, [bp-192h]
		mov	[bp-198h], ax
		inc	word ptr [bp-192h]
		mov	bx, [bp-188h]
		mov	ax, [bp-198h]
		mov	[bx+1Bh], ax

loc_BA537:				; CODE XREF: ovr209:352Ej
		cmp	word ptr [bp-196h], 1
		jle	short loc_BA55C
		cmp	word ptr [bp-196h], 7
		jge	short loc_BA55C
		mov	ax, [bp-194h]
		mov	[bp-19Ah], ax
		inc	word ptr [bp-194h]
		mov	bx, [bp-18Eh]
		mov	ax, [bp-19Ah]
		mov	[bx+1Bh], ax

loc_BA55C:				; CODE XREF: ovr209:354Cj ovr209:3553j
		cmp	word ptr [bp-196h], 0Dh
		jle	short loc_BA581
		cmp	word ptr [bp-196h], 10h
		jge	short loc_BA581
		mov	ax, [bp-194h]
		mov	[bp-19Ch], ax
		inc	word ptr [bp-194h]
		mov	bx, [bp-18Eh]
		mov	ax, [bp-19Ch]
		mov	[bx+1Bh], ax

loc_BA581:				; CODE XREF: ovr209:3571j ovr209:3578j
		cmp	word ptr [bp-196h], 11h
		jnz	short loc_BA59B
		mov	ax, [bp-192h]
		mov	[bp-19Eh], ax
		mov	bx, [bp-188h]
		mov	ax, [bp-19Eh]
		mov	[bx+1Bh], ax

loc_BA59B:				; CODE XREF: ovr209:3596j
		cmp	word ptr [bp-196h], 11h
		jnz	short loc_BA5AB
		mov	bx, [bp-18Eh]
		mov	word ptr [bx+1Bh], 2

loc_BA5AB:				; CODE XREF: ovr209:35B0j
		cmp	word ptr [bp-196h], 12h
		jnz	short loc_BA5BB
		mov	bx, [bp-18Eh]
		mov	word ptr [bx+1Bh], 1

loc_BA5BB:				; CODE XREF: ovr209:35C0j
		cmp	word ptr [bp-196h], 13h
		jnz	short loc_BA5CB
		mov	bx, [bp-18Eh]
		mov	word ptr [bx+1Bh], 9

loc_BA5CB:				; CODE XREF: ovr209:35D0j
		cmp	word ptr [bp-196h], 3
		jnz	short loc_BA5DB
		mov	bx, [bp-18Ch]
		mov	word ptr [bx+1Bh], 2

loc_BA5DB:				; CODE XREF: ovr209:35E0j
		cmp	word ptr [bp-196h], 14h
		jnz	short loc_BA5EB
		mov	bx, [bp-18Ah]
		mov	word ptr [bx+1Bh], 2

loc_BA5EB:				; CODE XREF: ovr209:35F0j
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_BA5F8
		jmp	short loc_BA5F8
; ���������������������������������������������������������������������������
		jmp	short loc_BA623
; ���������������������������������������������������������������������������

loc_BA5F8:				; CODE XREF: ovr209:3602j ovr209:3604j
		lea	ax, [bp-0C94h]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_BA605:				; CODE XREF: ovr209:351Ej
		cmp	word ptr [bp-0C77h], 1Eh
		jnb	short loc_BA613
		cmp	byte ptr [bp-0C75h], 0
		jz	short loc_BA618

loc_BA613:				; CODE XREF: ovr209:361Aj
		mov	ax, 1
		jmp	short loc_BA61A
; ���������������������������������������������������������������������������

loc_BA618:				; CODE XREF: ovr209:3621j
		xor	ax, ax

loc_BA61A:				; CODE XREF: ovr209:3626j
		mov	ah, 0
		or	ax, ax
		jnz	short loc_BA623
		jmp	loc_BA511
; ���������������������������������������������������������������������������

loc_BA623:				; CODE XREF: ovr209:3606j ovr209:362Ej
		push	0
		lea	ax, [bp-0C94h]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		cmp	byte ptr [bp-179h], 0
		jz	short loc_BA65A
		cmp	dword ptr [bp-17Eh], 0
		jz	short loc_BA65A
		push	0
		mov	al, [bp-17Ah]
		push	ax
		lea	ax, [bp-17Eh]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_BA65A:				; CODE XREF: ovr209:3647j ovr209:364Fj
		mov	dword ptr [bp-17Eh], 0
		mov	byte ptr [bp-179h], 0
		mov	dword ptr [bp-178h], 0
		cmp	byte ptr [bp-16Fh], 0
		jz	short loc_BA699
		cmp	dword ptr [bp-174h], 0
		jz	short loc_BA699
		push	0
		mov	al, [bp-170h]
		push	ax
		lea	ax, [bp-174h]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_BA699:				; CODE XREF: ovr209:3686j ovr209:368Ej
		mov	dword ptr [bp-174h], 0
		mov	byte ptr [bp-16Fh], 0
		mov	dword ptr [bp-16Eh], 0
		cmp	byte ptr [bp-165h], 0
		jz	short loc_BA6D8
		cmp	dword ptr [bp-16Ah], 0
		jz	short loc_BA6D8
		push	0
		mov	al, [bp-166h]
		push	ax
		lea	ax, [bp-16Ah]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_BA6D8:				; CODE XREF: ovr209:36C5j ovr209:36CDj
		mov	dword ptr [bp-16Ah], 0
		mov	byte ptr [bp-165h], 0
		mov	dword ptr [bp-164h], 0
		cmp	byte ptr [bp-15Bh], 0
		jz	short loc_BA717
		cmp	dword ptr [bp-160h], 0
		jz	short loc_BA717
		push	0
		mov	al, [bp-15Ch]
		push	ax
		lea	ax, [bp-160h]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_BA717:				; CODE XREF: ovr209:3704j ovr209:370Cj
		mov	dword ptr [bp-160h], 0
		mov	byte ptr [bp-15Bh], 0
		mov	dword ptr [bp-15Ah], 0
		cmp	byte ptr [bp-151h], 0
		jz	short loc_BA756
		cmp	dword ptr [bp-156h], 0
		jz	short loc_BA756
		push	0
		mov	al, [bp-152h]
		push	ax
		lea	ax, [bp-156h]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_BA756:				; CODE XREF: ovr209:3743j ovr209:374Bj
		mov	dword ptr [bp-156h], 0
		mov	byte ptr [bp-151h], 0
		mov	dword ptr [bp-150h], 0
		cmp	byte ptr [bp-147h], 0
		jz	short loc_BA795
		cmp	dword ptr [bp-14Ch], 0
		jz	short loc_BA795
		push	0
		mov	al, [bp-148h]
		push	ax
		lea	ax, [bp-14Ch]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_BA795:				; CODE XREF: ovr209:3782j ovr209:378Aj
		mov	dword ptr [bp-14Ch], 0
		mov	byte ptr [bp-147h], 0
		mov	dword ptr [bp-146h], 0
		cmp	byte ptr [bp-13Dh], 0
		jz	short loc_BA7D4
		cmp	dword ptr [bp-142h], 0
		jz	short loc_BA7D4
		push	0
		mov	al, [bp-13Eh]
		push	ax
		lea	ax, [bp-142h]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_BA7D4:				; CODE XREF: ovr209:37C1j ovr209:37C9j
		mov	dword ptr [bp-142h], 0
		mov	byte ptr [bp-13Dh], 0
		mov	dword ptr [bp-13Ch], 0
		cmp	byte_495FC, 0
		jz	short loc_BA7F5
		jmp	loc_BD722
; ���������������������������������������������������������������������������

loc_BA7F5:				; CODE XREF: ovr209:3800j
		lea	ax, [bp-216h]
		push	ax
		push	0FFh
		push	9
		lea	ax, [bp-0C94h]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		push	0
		push	0
		lea	ax, [bp-42h]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	[bp-13Ah], ax
		push	0
		push	0
		lea	ax, [bp-4Ch]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	[bp-13Ch], ax
		push	81h ; '�'
		push	69h ; 'i'
		lea	ax, [bp-10Ch]
		push	ax
		push	0
		call	TalkingHead_Construct_98F4
		add	sp, 8
		mov	[bp-13Eh], ax
		push	81h ; '�'
		push	109h
		lea	ax, [bp-116h]
		push	ax
		push	0
		call	TalkingHead_Construct_98F4
		add	sp, 8
		mov	[bp-140h], ax
		push	81h ; '�'
		push	0FFD3h
		lea	ax, [bp-0EEh]
		push	ax
		push	0
		call	TalkingHead_Construct_98F4
		add	sp, 8
		mov	[bp-142h], ax
		push	word ptr [bp-0D0h]
		mov	al, [bp-0CEh]
		push	ax
		lea	ax, [bp-0D0h]
		push	ax
		lea	ax, [bp-16h]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	word ptr [bp-90h]
		mov	al, [bp-8Eh]
		push	ax
		lea	ax, [bp-90h]
		push	ax
		lea	ax, [bp-16h]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	word ptr [bp-80h]
		mov	al, [bp-7Eh]
		push	ax
		lea	ax, [bp-80h]
		push	ax
		lea	ax, [bp-16h]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	word ptr [bp-13Ah]
		lea	ax, [bp-0C94h]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp-13Ch]
		lea	ax, [bp-0C94h]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp-142h]
		lea	ax, [bp-0C94h]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp-13Eh]
		lea	ax, [bp-0C94h]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp-140h]
		lea	ax, [bp-0C94h]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		push	0
		push	word ptr [bp-16h]
		mov	al, [bp-14h]
		push	ax
		lea	ax, [bp-16h]
		push	ax
		call	Palette_Upload_2CDE1
		add	sp, 8
		push	21h ; '!'
		push	word ptr [bp-13Eh]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4
		push	1Bh
		push	word ptr [bp-140h]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4
		cmp	byte ptr [bp-8], 0
		jnz	short loc_BA969
		jmp	loc_BAAAC
; ���������������������������������������������������������������������������

loc_BA969:				; CODE XREF: ovr209:3974j
		lea	ax, [bp-0C94h]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		mov	dword ptr [bp-14Ch], 0
		mov	byte ptr [bp-148h], 2
		mov	byte ptr [bp-147h], 0
		mov	dword ptr [bp-146h], 0
		push	2
		lea	ax, [bp-14Ch]
		push	ax
		push	0
		lea	ax, [bp-38Ch]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	9
		lea	ax, [bp-14Ch]
		push	ax
		push	word ptr [bp-13Eh]
		call	TalkingHead_AttachVoice_9CF7
		add	sp, 6
		mov	word ptr [bp-14Eh], 0
		jmp	short loc_BA9D4
; ���������������������������������������������������������������������������

loc_BA9C3:				; CODE XREF: ovr209:39E9j
		lea	ax, [bp-0C94h]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	word ptr [bp-14Eh]

loc_BA9D4:				; CODE XREF: ovr209:39D1j
		cmp	word ptr [bp-14Eh], 3
		jl	short loc_BA9C3
		mov	word ptr [bp-14Eh], 0
		jmp	short loc_BAA57
; ���������������������������������������������������������������������������

loc_BA9E3:				; CODE XREF: ovr209:3A77j
		cmp	word ptr [bp-14Eh], 5
		jnz	short loc_BA9F8
		push	0FFFFh
		push	word ptr [bp-140h]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_BA9F8:				; CODE XREF: ovr209:39F8j
		cmp	word ptr [bp-14Eh], 6
		jnz	short loc_BAA0D
		push	19h
		push	word ptr [bp-140h]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_BAA0D:				; CODE XREF: ovr209:3A0Dj
		cmp	word ptr [bp-14Eh], 8
		jnz	short loc_BAA22
		push	1Fh
		push	word ptr [bp-140h]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_BAA22:				; CODE XREF: ovr209:3A22j
		mov	ax, [bp-14Eh]
		inc	word ptr [bp-14Eh]
		cmp	ax, 0Ch
		jnz	short loc_BAA3D
		push	12h
		push	word ptr [bp-140h]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_BAA3D:				; CODE XREF: ovr209:3A3Dj
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_BAA4A
		jmp	short loc_BAA4A
; ���������������������������������������������������������������������������
		jmp	short loc_BAA6A
; ���������������������������������������������������������������������������

loc_BAA4A:				; CODE XREF: ovr209:3A54j ovr209:3A56j
		lea	ax, [bp-0C94h]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_BAA57:				; CODE XREF: ovr209:39F1j
		push	word ptr [bp-13Eh]
		call	TalkingHead_StartVoiceAndIsSpeaking_9C64
		add	sp, 2
		or	al, al
		jz	short loc_BAA6A
		jmp	loc_BA9E3
; ���������������������������������������������������������������������������

loc_BAA6A:				; CODE XREF: ovr209:3A58j ovr209:3A75j
		cmp	byte ptr [bp-147h], 0
		jz	short loc_BAA92
		cmp	dword ptr [bp-14Ch], 0
		jz	short loc_BAA92
		push	0
		mov	al, [bp-148h]
		push	ax
		lea	ax, [bp-14Ch]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_BAA92:				; CODE XREF: ovr209:3A7Fj ovr209:3A87j
		mov	dword ptr [bp-14Ch], 0
		mov	byte ptr [bp-147h], 0
		mov	dword ptr [bp-146h], 0
		jmp	loc_BAC37
; ���������������������������������������������������������������������������

loc_BAAAC:				; CODE XREF: ovr209:3976j
		push	0
		lea	ax, [bp-0C72h]
		push	ax
		call	Widget_Method_DispatchC_314CB
		add	sp, 4
		push	0E3h ; '�'
		lea	ax, [bp-0C72h]
		push	ax
		call	Widget_Method_Dispatch8_314A9
		add	sp, 4
		mov	word ptr [bp-2], 3Ch ; '<'
		mov	si, [bp-0C77h]
		mov	ax, [bp-2]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	di, dx
		jmp	loc_BAC1A
; ���������������������������������������������������������������������������

loc_BAAEB:				; CODE XREF: ovr209:3C44j
		mov	ax, [bp-0C77h]
		mov	[bp-144h], ax
		mov	ax, si
		add	ax, 2
		cmp	ax, [bp-144h]
		jnz	short loc_BAB0E
		push	word ptr [bp-4]
		lea	ax, [bp-0C72h]
		push	ax
		call	sub_C8F5
		add	sp, 4

loc_BAB0E:				; CODE XREF: ovr209:3B0Cj
		mov	ax, si
		add	ax, 2
		cmp	ax, [bp-144h]
		jnz	short loc_BAB28
		push	2823h
		push	word ptr [bp-13Eh]
		call	TalkingHead_SetLipText_9C4F
		add	sp, 4

loc_BAB28:				; CODE XREF: ovr209:3B27j
		mov	ax, si
		add	ax, 0Ah
		cmp	ax, [bp-144h]
		jnz	short loc_BAB41
		push	0FFFFh
		push	word ptr [bp-140h]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_BAB41:				; CODE XREF: ovr209:3B41j
		mov	ax, si
		add	ax, 0Ah
		cmp	ax, [bp-144h]
		jnz	short loc_BAB5A
		push	19h
		push	word ptr [bp-140h]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_BAB5A:				; CODE XREF: ovr209:3B5Aj
		mov	ax, si
		add	ax, 0Dh
		cmp	ax, [bp-144h]
		jnz	short loc_BAB73
		push	1Fh
		push	word ptr [bp-140h]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_BAB73:				; CODE XREF: ovr209:3B73j
		mov	ax, di
		dec	ax
		cmp	ax, [bp-144h]
		jnz	short loc_BABBE
		mov	word ptr [bp-0CA0h], 11BCh
		mov	word ptr [bp-0CA0h], 11C8h
		mov	word ptr [bp-0CA0h], 11D8h
		mov	word ptr [bp-0CA0h], 11E8h
		mov	word ptr [bp-0CA0h], 11FCh
		lea	ax, [bp-0C70h]
		push	ax
		push	0
		push	word ptr [bp-0C53h]
		push	word ptr [bp-0C55h]
		push	word ptr [bp-0C57h]
		push	word ptr [bp-0C59h]
		lea	ax, [bp-0CA0h]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh

loc_BABBE:				; CODE XREF: ovr209:3B8Aj
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_BAC0D
		jmp	short loc_BAC0D
; ���������������������������������������������������������������������������
		mov	word ptr [bp-0CACh], 11BCh
		mov	word ptr [bp-0CACh], 11C8h
		mov	word ptr [bp-0CACh], 11D8h
		mov	word ptr [bp-0CACh], 11E8h
		mov	word ptr [bp-0CACh], 11FCh
		lea	ax, [bp-0C70h]
		push	ax
		push	0
		push	word ptr [bp-0C53h]
		push	word ptr [bp-0C55h]
		push	word ptr [bp-0C57h]
		push	word ptr [bp-0C59h]
		lea	ax, [bp-0CACh]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_BAC37
; ���������������������������������������������������������������������������

loc_BAC0D:				; CODE XREF: ovr209:3BD5j ovr209:3BD7j
		lea	ax, [bp-0C94h]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_BAC1A:				; CODE XREF: ovr209:3AF8j
		cmp	[bp-0C77h], di
		jnb	short loc_BAC27
		cmp	byte ptr [bp-0C75h], 0
		jz	short loc_BAC2C

loc_BAC27:				; CODE XREF: ovr209:3C2Ej
		mov	ax, 1
		jmp	short loc_BAC2E
; ���������������������������������������������������������������������������

loc_BAC2C:				; CODE XREF: ovr209:3C35j
		xor	ax, ax

loc_BAC2E:				; CODE XREF: ovr209:3C3Aj
		mov	ah, 0
		or	ax, ax
		jnz	short loc_BAC37
		jmp	loc_BAAEB
; ���������������������������������������������������������������������������

loc_BAC37:				; CODE XREF: ovr209:3AB9j ovr209:3C1Bj ...
		cmp	byte_495FC, 0
		jz	short loc_BAC50
		push	0
		lea	ax, [bp-0C94h]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		jmp	loc_BD722
; ���������������������������������������������������������������������������

loc_BAC50:				; CODE XREF: ovr209:3C4Cj
		cmp	byte ptr [bp-8], 0
		jnz	short loc_BAC59
		jmp	loc_BAD5A
; ���������������������������������������������������������������������������

loc_BAC59:				; CODE XREF: ovr209:3C64j
		lea	ax, [bp-0C94h]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		mov	dword ptr [bp-14Ch], 0
		mov	byte ptr [bp-148h], 2
		mov	byte ptr [bp-147h], 0
		mov	dword ptr [bp-146h], 0
		push	2
		lea	ax, [bp-14Ch]
		push	ax
		push	1
		lea	ax, [bp-38Ch]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	9
		lea	ax, [bp-14Ch]
		push	ax
		push	word ptr [bp-140h]
		call	TalkingHead_AttachVoice_9CF7
		add	sp, 6
		mov	word ptr [bp-14Eh], 0
		jmp	short loc_BACC4
; ���������������������������������������������������������������������������

loc_BACB3:				; CODE XREF: ovr209:3CD9j
		lea	ax, [bp-0C94h]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	word ptr [bp-14Eh]

loc_BACC4:				; CODE XREF: ovr209:3CC1j
		cmp	word ptr [bp-14Eh], 3
		jl	short loc_BACB3
		mov	word ptr [bp-14Eh], 0
		jmp	short loc_BAD08
; ���������������������������������������������������������������������������

loc_BACD3:				; CODE XREF: ovr209:3D26j
		mov	ax, [bp-14Eh]
		inc	word ptr [bp-14Eh]
		cmp	ax, 4
		jnz	short loc_BACEE
		push	11h
		push	word ptr [bp-13Eh]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_BACEE:				; CODE XREF: ovr209:3CEEj
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_BACFB
		jmp	short loc_BACFB
; ���������������������������������������������������������������������������
		jmp	short loc_BAD18
; ���������������������������������������������������������������������������

loc_BACFB:				; CODE XREF: ovr209:3D05j ovr209:3D07j
		lea	ax, [bp-0C94h]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_BAD08:				; CODE XREF: ovr209:3CE1j
		push	word ptr [bp-140h]
		call	TalkingHead_StartVoiceAndIsSpeaking_9C64
		add	sp, 2
		or	al, al
		jnz	short loc_BACD3

loc_BAD18:				; CODE XREF: ovr209:3D09j
		cmp	byte ptr [bp-147h], 0
		jz	short loc_BAD40
		cmp	dword ptr [bp-14Ch], 0
		jz	short loc_BAD40
		push	0
		mov	al, [bp-148h]
		push	ax
		lea	ax, [bp-14Ch]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_BAD40:				; CODE XREF: ovr209:3D2Dj ovr209:3D35j
		mov	dword ptr [bp-14Ch], 0
		mov	byte ptr [bp-147h], 0
		mov	dword ptr [bp-146h], 0
		jmp	loc_BAEBB
; ���������������������������������������������������������������������������

loc_BAD5A:				; CODE XREF: ovr209:3C66j
		push	0EBh ; '�'
		lea	ax, [bp-0C72h]
		push	ax
		call	Widget_Method_Dispatch8_314A9
		add	sp, 4
		mov	word ptr [bp-2], 1Eh
		mov	si, [bp-0C77h]
		mov	ax, [bp-2]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	di, dx
		jmp	loc_BAE9E
; ���������������������������������������������������������������������������

loc_BAD8A:				; CODE XREF: ovr209:3EC8j
		mov	ax, [bp-0C77h]
		mov	[bp-144h], ax
		mov	ax, si
		inc	ax
		cmp	ax, [bp-144h]
		jnz	short loc_BADA9
		push	12h
		push	word ptr [bp-140h]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_BADA9:				; CODE XREF: ovr209:3DA9j
		mov	ax, si
		inc	ax
		cmp	ax, [bp-144h]
		jnz	short loc_BADC6
		mov	ax, [bp-4]
		add	ax, [bp-6]
		push	ax
		lea	ax, [bp-0C72h]
		push	ax
		call	sub_C8F5
		add	sp, 4

loc_BADC6:				; CODE XREF: ovr209:3DC0j
		mov	ax, si
		inc	ax
		cmp	ax, [bp-144h]
		jnz	short loc_BADDE
		push	283Eh
		push	word ptr [bp-140h]
		call	TalkingHead_SetLipText_9C4F
		add	sp, 4

loc_BADDE:				; CODE XREF: ovr209:3DDDj
		mov	ax, si
		add	ax, 2
		cmp	ax, [bp-144h]
		jnz	short loc_BADF7
		push	11h
		push	word ptr [bp-13Eh]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_BADF7:				; CODE XREF: ovr209:3DF7j
		mov	ax, di
		dec	ax
		cmp	ax, [bp-144h]
		jnz	short loc_BAE42
		mov	word ptr [bp-0CA0h], 11BCh
		mov	word ptr [bp-0CA0h], 11C8h
		mov	word ptr [bp-0CA0h], 11D8h
		mov	word ptr [bp-0CA0h], 11E8h
		mov	word ptr [bp-0CA0h], 11FCh
		lea	ax, [bp-0C70h]
		push	ax
		push	0
		push	word ptr [bp-0C53h]
		push	word ptr [bp-0C55h]
		push	word ptr [bp-0C57h]
		push	word ptr [bp-0C59h]
		lea	ax, [bp-0CA0h]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh

loc_BAE42:				; CODE XREF: ovr209:3E0Ej
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_BAE91
		jmp	short loc_BAE91
; ���������������������������������������������������������������������������
		mov	word ptr [bp-0CACh], 11BCh
		mov	word ptr [bp-0CACh], 11C8h
		mov	word ptr [bp-0CACh], 11D8h
		mov	word ptr [bp-0CACh], 11E8h
		mov	word ptr [bp-0CACh], 11FCh
		lea	ax, [bp-0C70h]
		push	ax
		push	0
		push	word ptr [bp-0C53h]
		push	word ptr [bp-0C55h]
		push	word ptr [bp-0C57h]
		push	word ptr [bp-0C59h]
		lea	ax, [bp-0CACh]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_BAEBB
; ���������������������������������������������������������������������������

loc_BAE91:				; CODE XREF: ovr209:3E59j ovr209:3E5Bj
		lea	ax, [bp-0C94h]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_BAE9E:				; CODE XREF: ovr209:3D97j
		cmp	[bp-0C77h], di
		jnb	short loc_BAEAB
		cmp	byte ptr [bp-0C75h], 0
		jz	short loc_BAEB0

loc_BAEAB:				; CODE XREF: ovr209:3EB2j
		mov	ax, 1
		jmp	short loc_BAEB2
; ���������������������������������������������������������������������������

loc_BAEB0:				; CODE XREF: ovr209:3EB9j
		xor	ax, ax

loc_BAEB2:				; CODE XREF: ovr209:3EBEj
		mov	ah, 0
		or	ax, ax
		jnz	short loc_BAEBB
		jmp	loc_BAD8A
; ���������������������������������������������������������������������������

loc_BAEBB:				; CODE XREF: ovr209:3D67j ovr209:3E9Fj ...
		cmp	byte_495FC, 0
		jz	short loc_BAED4
		push	0
		lea	ax, [bp-0C94h]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		jmp	loc_BD722
; ���������������������������������������������������������������������������

loc_BAED4:				; CODE XREF: ovr209:3ED0j
		cmp	byte ptr [bp-8], 0
		jnz	short loc_BAEDD
		jmp	loc_BB036
; ���������������������������������������������������������������������������

loc_BAEDD:				; CODE XREF: ovr209:3EE8j
		lea	ax, [bp-0C94h]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		mov	dword ptr [bp-14Ch], 0
		mov	byte ptr [bp-148h], 2
		mov	byte ptr [bp-147h], 0
		mov	dword ptr [bp-146h], 0
		push	2
		lea	ax, [bp-14Ch]
		push	ax
		push	2
		lea	ax, [bp-38Ch]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	9
		lea	ax, [bp-14Ch]
		push	ax
		push	word ptr [bp-13Eh]
		call	TalkingHead_AttachVoice_9CF7
		add	sp, 6
		mov	word ptr [bp-14Eh], 0
		jmp	short loc_BAF48
; ���������������������������������������������������������������������������

loc_BAF37:				; CODE XREF: ovr209:3F5Dj
		lea	ax, [bp-0C94h]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	word ptr [bp-14Eh]

loc_BAF48:				; CODE XREF: ovr209:3F45j
		cmp	word ptr [bp-14Eh], 3
		jl	short loc_BAF37
		mov	word ptr [bp-14Eh], 0
		jmp	short loc_BAFB6
; ���������������������������������������������������������������������������

loc_BAF57:				; CODE XREF: ovr209:3FD4j
		cmp	word ptr [bp-14Eh], 5
		jnz	short loc_BAF6C
		push	0FFFFh
		push	word ptr [bp-13Eh]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_BAF6C:				; CODE XREF: ovr209:3F6Cj
		cmp	word ptr [bp-14Eh], 0Ah
		jnz	short loc_BAF81
		push	0FFFFh
		push	word ptr [bp-140h]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_BAF81:				; CODE XREF: ovr209:3F81j
		mov	ax, [bp-14Eh]
		inc	word ptr [bp-14Eh]
		cmp	ax, 0Ah
		jnz	short loc_BAF9C
		push	1Bh
		push	word ptr [bp-140h]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_BAF9C:				; CODE XREF: ovr209:3F9Cj
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_BAFA9
		jmp	short loc_BAFA9
; ���������������������������������������������������������������������������
		jmp	short loc_BAFC6
; ���������������������������������������������������������������������������

loc_BAFA9:				; CODE XREF: ovr209:3FB3j ovr209:3FB5j
		lea	ax, [bp-0C94h]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_BAFB6:				; CODE XREF: ovr209:3F65j
		push	word ptr [bp-13Eh]
		call	TalkingHead_StartVoiceAndIsSpeaking_9C64
		add	sp, 2
		or	al, al
		jnz	short loc_BAF57

loc_BAFC6:				; CODE XREF: ovr209:3FB7j
		push	1Bh
		push	word ptr [bp-13Eh]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4
		mov	word ptr [bp-14Eh], 0
		jmp	short loc_BAFED
; ���������������������������������������������������������������������������

loc_BAFDC:				; CODE XREF: ovr209:4002j
		lea	ax, [bp-0C94h]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	word ptr [bp-14Eh]

loc_BAFED:				; CODE XREF: ovr209:3FEAj
		cmp	word ptr [bp-14Eh], 6
		jl	short loc_BAFDC
		cmp	byte ptr [bp-147h], 0
		jz	short loc_BB01C
		cmp	dword ptr [bp-14Ch], 0
		jz	short loc_BB01C
		push	0
		mov	al, [bp-148h]
		push	ax
		lea	ax, [bp-14Ch]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_BB01C:				; CODE XREF: ovr209:4009j ovr209:4011j
		mov	dword ptr [bp-14Ch], 0
		mov	byte ptr [bp-147h], 0
		mov	dword ptr [bp-146h], 0
		jmp	loc_BB32B
; ���������������������������������������������������������������������������

loc_BB036:				; CODE XREF: ovr209:3EEAj
		push	0E3h ; '�'
		lea	ax, [bp-0C72h]
		push	ax
		call	Widget_Method_Dispatch8_314A9
		add	sp, 4
		mov	word ptr [bp-2], 60h ; '`'
		mov	si, [bp-0C77h]
		mov	ax, [bp-2]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	di, dx
		jmp	loc_BB19D
; ���������������������������������������������������������������������������

loc_BB066:				; CODE XREF: ovr209:41C7j
		mov	ax, [bp-0C77h]
		mov	[bp-144h], ax
		mov	ax, si
		add	ax, 8
		cmp	ax, [bp-144h]
		jnz	short loc_BB091
		mov	ax, [bp-6]
		shl	ax, 1
		mov	dx, [bp-4]
		add	dx, ax
		push	dx
		lea	ax, [bp-0C72h]
		push	ax
		call	sub_C8F5
		add	sp, 4

loc_BB091:				; CODE XREF: ovr209:4087j
		mov	ax, si
		add	ax, 8
		cmp	ax, [bp-144h]
		jnz	short loc_BB0AB
		push	2848h
		push	word ptr [bp-13Eh]
		call	TalkingHead_SetLipText_9C4F
		add	sp, 4

loc_BB0AB:				; CODE XREF: ovr209:40AAj
		mov	ax, si
		add	ax, 14h
		cmp	ax, [bp-144h]
		jnz	short loc_BB0C4
		push	0FFFFh
		push	word ptr [bp-13Eh]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_BB0C4:				; CODE XREF: ovr209:40C4j
		mov	ax, di
		add	ax, 0FFFBh
		cmp	ax, [bp-144h]
		jnz	short loc_BB0DD
		push	0FFFFh
		push	word ptr [bp-140h]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_BB0DD:				; CODE XREF: ovr209:40DDj
		mov	ax, di
		add	ax, 0FFFBh
		cmp	ax, [bp-144h]
		jnz	short loc_BB0F6
		push	1Bh
		push	word ptr [bp-140h]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_BB0F6:				; CODE XREF: ovr209:40F6j
		mov	ax, di
		dec	ax
		cmp	ax, [bp-144h]
		jnz	short loc_BB141
		mov	word ptr [bp-0CA0h], 11BCh
		mov	word ptr [bp-0CA0h], 11C8h
		mov	word ptr [bp-0CA0h], 11D8h
		mov	word ptr [bp-0CA0h], 11E8h
		mov	word ptr [bp-0CA0h], 11FCh
		lea	ax, [bp-0C70h]
		push	ax
		push	0
		push	word ptr [bp-0C53h]
		push	word ptr [bp-0C55h]
		push	word ptr [bp-0C57h]
		push	word ptr [bp-0C59h]
		lea	ax, [bp-0CA0h]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh

loc_BB141:				; CODE XREF: ovr209:410Dj
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_BB190
		jmp	short loc_BB190
; ���������������������������������������������������������������������������
		mov	word ptr [bp-0CACh], 11BCh
		mov	word ptr [bp-0CACh], 11C8h
		mov	word ptr [bp-0CACh], 11D8h
		mov	word ptr [bp-0CACh], 11E8h
		mov	word ptr [bp-0CACh], 11FCh
		lea	ax, [bp-0C70h]
		push	ax
		push	0
		push	word ptr [bp-0C53h]
		push	word ptr [bp-0C55h]
		push	word ptr [bp-0C57h]
		push	word ptr [bp-0C59h]
		lea	ax, [bp-0CACh]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_BB1BA
; ���������������������������������������������������������������������������

loc_BB190:				; CODE XREF: ovr209:4158j ovr209:415Aj
		lea	ax, [bp-0C94h]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_BB19D:				; CODE XREF: ovr209:4073j
		cmp	[bp-0C77h], di
		jnb	short loc_BB1AA
		cmp	byte ptr [bp-0C75h], 0
		jz	short loc_BB1AF

loc_BB1AA:				; CODE XREF: ovr209:41B1j
		mov	ax, 1
		jmp	short loc_BB1B1
; ���������������������������������������������������������������������������

loc_BB1AF:				; CODE XREF: ovr209:41B8j
		xor	ax, ax

loc_BB1B1:				; CODE XREF: ovr209:41BDj
		mov	ah, 0
		or	ax, ax
		jnz	short loc_BB1BA
		jmp	loc_BB066
; ���������������������������������������������������������������������������

loc_BB1BA:				; CODE XREF: ovr209:419Ej ovr209:41C5j
		cmp	byte_495FC, 0
		jz	short loc_BB1D3
		push	0
		lea	ax, [bp-0C94h]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		jmp	loc_BD722
; ���������������������������������������������������������������������������

loc_BB1D3:				; CODE XREF: ovr209:41CFj
		mov	word ptr [bp-2], 46h ; 'F'
		mov	si, [bp-0C77h]
		mov	ax, [bp-2]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	di, dx
		jmp	loc_BB30E
; ���������������������������������������������������������������������������

loc_BB1F3:				; CODE XREF: ovr209:4338j
		mov	ax, [bp-0C77h]
		mov	[bp-144h], ax
		mov	ax, si
		inc	ax
		cmp	ax, [bp-144h]
		jnz	short loc_BB212
		push	0FFFFh
		push	word ptr [bp-13Eh]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_BB212:				; CODE XREF: ovr209:4212j
		mov	ax, si
		inc	ax
		cmp	ax, [bp-144h]
		jnz	short loc_BB236
		mov	ax, [bp-6]
		mov	dx, 5
		imul	dx
		mov	dx, [bp-4]
		add	dx, ax
		push	dx
		lea	ax, [bp-0C72h]
		push	ax
		call	sub_C8F5
		add	sp, 4

loc_BB236:				; CODE XREF: ovr209:4229j
		mov	ax, si
		inc	ax
		cmp	ax, [bp-144h]
		jnz	short loc_BB24E
		push	2867h
		push	word ptr [bp-13Eh]
		call	TalkingHead_SetLipText_9C4F
		add	sp, 4

loc_BB24E:				; CODE XREF: ovr209:424Dj
		mov	ax, di
		add	ax, 0FFFCh
		cmp	ax, [bp-144h]
		jnz	short loc_BB267
		push	1Bh
		push	word ptr [bp-13Eh]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_BB267:				; CODE XREF: ovr209:4267j
		mov	ax, di
		dec	ax
		cmp	ax, [bp-144h]
		jnz	short loc_BB2B2
		mov	word ptr [bp-0CA0h], 11BCh
		mov	word ptr [bp-0CA0h], 11C8h
		mov	word ptr [bp-0CA0h], 11D8h
		mov	word ptr [bp-0CA0h], 11E8h
		mov	word ptr [bp-0CA0h], 11FCh
		lea	ax, [bp-0C70h]
		push	ax
		push	0
		push	word ptr [bp-0C53h]
		push	word ptr [bp-0C55h]
		push	word ptr [bp-0C57h]
		push	word ptr [bp-0C59h]
		lea	ax, [bp-0CA0h]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh

loc_BB2B2:				; CODE XREF: ovr209:427Ej
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_BB301
		jmp	short loc_BB301
; ���������������������������������������������������������������������������
		mov	word ptr [bp-0CACh], 11BCh
		mov	word ptr [bp-0CACh], 11C8h
		mov	word ptr [bp-0CACh], 11D8h
		mov	word ptr [bp-0CACh], 11E8h
		mov	word ptr [bp-0CACh], 11FCh
		lea	ax, [bp-0C70h]
		push	ax
		push	0
		push	word ptr [bp-0C53h]
		push	word ptr [bp-0C55h]
		push	word ptr [bp-0C57h]
		push	word ptr [bp-0C59h]
		lea	ax, [bp-0CACh]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_BB32B
; ���������������������������������������������������������������������������

loc_BB301:				; CODE XREF: ovr209:42C9j ovr209:42CBj
		lea	ax, [bp-0C94h]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_BB30E:				; CODE XREF: ovr209:4200j
		cmp	[bp-0C77h], di
		jnb	short loc_BB31B
		cmp	byte ptr [bp-0C75h], 0
		jz	short loc_BB320

loc_BB31B:				; CODE XREF: ovr209:4322j
		mov	ax, 1
		jmp	short loc_BB322
; ���������������������������������������������������������������������������

loc_BB320:				; CODE XREF: ovr209:4329j
		xor	ax, ax

loc_BB322:				; CODE XREF: ovr209:432Ej
		mov	ah, 0
		or	ax, ax
		jnz	short loc_BB32B
		jmp	loc_BB1F3
; ���������������������������������������������������������������������������

loc_BB32B:				; CODE XREF: ovr209:4043j ovr209:430Fj ...
		push	0
		lea	ax, [bp-0C94h]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		cmp	byte_495FC, 0
		jz	short loc_BB344
		jmp	loc_BD722
; ���������������������������������������������������������������������������

loc_BB344:				; CODE XREF: ovr209:434Fj
		lea	ax, [bp-216h]
		push	ax
		push	0FFh
		push	0Ah
		lea	ax, [bp-0C94h]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		push	0
		push	0
		lea	ax, [bp-42h]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	[bp-13Ah], ax
		push	0
		push	0
		lea	ax, [bp-4Ch]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	[bp-13Ch], ax
		push	81h ; '�'
		push	0A0h ; '�'
		lea	ax, [bp-0F8h]
		push	ax
		push	0
		call	TalkingHead_Construct_98F4
		add	sp, 8
		mov	[bp-13Eh], ax
		push	81h ; '�'
		push	0FFE2h
		lea	ax, [bp-0E4h]
		push	ax
		push	0
		call	TalkingHead_Construct_98F4
		add	sp, 8
		mov	[bp-140h], ax
		push	81h ; '�'
		push	15Eh
		lea	ax, [bp-102h]
		push	ax
		push	0
		call	TalkingHead_Construct_98F4
		add	sp, 8
		mov	[bp-142h], ax
		push	word ptr [bp-0D0h]
		mov	al, [bp-0CEh]
		push	ax
		lea	ax, [bp-0D0h]
		push	ax
		lea	ax, [bp-16h]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	word ptr [bp-90h]
		mov	al, [bp-8Eh]
		push	ax
		lea	ax, [bp-90h]
		push	ax
		lea	ax, [bp-16h]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	word ptr [bp-80h]
		mov	al, [bp-7Eh]
		push	ax
		lea	ax, [bp-80h]
		push	ax
		lea	ax, [bp-16h]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	word ptr [bp-13Ah]
		lea	ax, [bp-0C94h]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp-13Ch]
		lea	ax, [bp-0C94h]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp-140h]
		lea	ax, [bp-0C94h]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp-142h]
		lea	ax, [bp-0C94h]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp-13Eh]
		lea	ax, [bp-0C94h]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		push	0
		push	word ptr [bp-16h]
		mov	al, [bp-14h]
		push	ax
		lea	ax, [bp-16h]
		push	ax
		call	Palette_Upload_2CDE1
		add	sp, 8
		cmp	byte ptr [bp-8], 0
		jnz	short loc_BB49D
		jmp	loc_BB5AB
; ���������������������������������������������������������������������������

loc_BB49D:				; CODE XREF: ovr209:44A8j
		lea	ax, [bp-0C94h]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		mov	dword ptr [bp-14Ch], 0
		mov	byte ptr [bp-148h], 2
		mov	byte ptr [bp-147h], 0
		mov	dword ptr [bp-146h], 0
		push	2
		lea	ax, [bp-14Ch]
		push	ax
		push	3
		lea	ax, [bp-38Ch]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	9
		lea	ax, [bp-14Ch]
		push	ax
		push	word ptr [bp-13Eh]
		call	TalkingHead_AttachVoice_9CF7
		add	sp, 6
		mov	word ptr [bp-14Eh], 0
		jmp	short loc_BB508
; ���������������������������������������������������������������������������

loc_BB4F7:				; CODE XREF: ovr209:451Dj
		lea	ax, [bp-0C94h]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	word ptr [bp-14Eh]

loc_BB508:				; CODE XREF: ovr209:4505j
		cmp	word ptr [bp-14Eh], 3
		jl	short loc_BB4F7
		jmp	short loc_BB52B
; ���������������������������������������������������������������������������

loc_BB511:				; CODE XREF: ovr209:4549j
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_BB51E
		jmp	short loc_BB51E
; ���������������������������������������������������������������������������
		jmp	short loc_BB53B
; ���������������������������������������������������������������������������

loc_BB51E:				; CODE XREF: ovr209:4528j ovr209:452Aj
		lea	ax, [bp-0C94h]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_BB52B:				; CODE XREF: ovr209:451Fj
		push	word ptr [bp-13Eh]
		call	TalkingHead_StartVoiceAndIsSpeaking_9C64
		add	sp, 2
		or	al, al
		jnz	short loc_BB511

loc_BB53B:				; CODE XREF: ovr209:452Cj
		push	1Bh
		push	word ptr [bp-13Eh]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4
		mov	word ptr [bp-14Eh], 0
		jmp	short loc_BB562
; ���������������������������������������������������������������������������

loc_BB551:				; CODE XREF: ovr209:4577j
		lea	ax, [bp-0C94h]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	word ptr [bp-14Eh]

loc_BB562:				; CODE XREF: ovr209:455Fj
		cmp	word ptr [bp-14Eh], 6
		jl	short loc_BB551
		cmp	byte ptr [bp-147h], 0
		jz	short loc_BB591
		cmp	dword ptr [bp-14Ch], 0
		jz	short loc_BB591
		push	0
		mov	al, [bp-148h]
		push	ax
		lea	ax, [bp-14Ch]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_BB591:				; CODE XREF: ovr209:457Ej ovr209:4586j
		mov	dword ptr [bp-14Ch], 0
		mov	byte ptr [bp-147h], 0
		mov	dword ptr [bp-146h], 0
		jmp	loc_BB6FC
; ���������������������������������������������������������������������������

loc_BB5AB:				; CODE XREF: ovr209:44AAj
		push	0E3h ; '�'
		lea	ax, [bp-0C72h]
		push	ax
		call	Widget_Method_Dispatch8_314A9
		add	sp, 4
		mov	word ptr [bp-2], 40h ; '@'
		mov	si, [bp-0C77h]
		mov	ax, [bp-2]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	di, dx
		jmp	loc_BB6DF
; ���������������������������������������������������������������������������

loc_BB5DB:				; CODE XREF: ovr209:4709j
		mov	ax, [bp-0C77h]
		mov	[bp-144h], ax
		mov	ax, si
		inc	ax
		cmp	ax, [bp-144h]
		jnz	short loc_BB607
		mov	ax, [bp-6]
		mov	dx, 6
		imul	dx
		mov	dx, [bp-4]
		add	dx, ax
		push	dx
		lea	ax, [bp-0C72h]
		push	ax
		call	sub_C8F5
		add	sp, 4

loc_BB607:				; CODE XREF: ovr209:45FAj
		mov	ax, si
		inc	ax
		cmp	ax, [bp-144h]
		jnz	short loc_BB61F
		push	287Dh
		push	word ptr [bp-13Eh]
		call	TalkingHead_SetLipText_9C4F
		add	sp, 4

loc_BB61F:				; CODE XREF: ovr209:461Ej
		mov	ax, di
		add	ax, 0FFFAh
		cmp	ax, [bp-144h]
		jnz	short loc_BB638
		push	1Bh
		push	word ptr [bp-13Eh]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_BB638:				; CODE XREF: ovr209:4638j
		mov	ax, di
		dec	ax
		cmp	ax, [bp-144h]
		jnz	short loc_BB683
		mov	word ptr [bp-0CA0h], 11BCh
		mov	word ptr [bp-0CA0h], 11C8h
		mov	word ptr [bp-0CA0h], 11D8h
		mov	word ptr [bp-0CA0h], 11E8h
		mov	word ptr [bp-0CA0h], 11FCh
		lea	ax, [bp-0C70h]
		push	ax
		push	0
		push	word ptr [bp-0C53h]
		push	word ptr [bp-0C55h]
		push	word ptr [bp-0C57h]
		push	word ptr [bp-0C59h]
		lea	ax, [bp-0CA0h]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh

loc_BB683:				; CODE XREF: ovr209:464Fj
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_BB6D2
		jmp	short loc_BB6D2
; ���������������������������������������������������������������������������
		mov	word ptr [bp-0CACh], 11BCh
		mov	word ptr [bp-0CACh], 11C8h
		mov	word ptr [bp-0CACh], 11D8h
		mov	word ptr [bp-0CACh], 11E8h
		mov	word ptr [bp-0CACh], 11FCh
		lea	ax, [bp-0C70h]
		push	ax
		push	0
		push	word ptr [bp-0C53h]
		push	word ptr [bp-0C55h]
		push	word ptr [bp-0C57h]
		push	word ptr [bp-0C59h]
		lea	ax, [bp-0CACh]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_BB6FC
; ���������������������������������������������������������������������������

loc_BB6D2:				; CODE XREF: ovr209:469Aj ovr209:469Cj
		lea	ax, [bp-0C94h]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_BB6DF:				; CODE XREF: ovr209:45E8j
		cmp	[bp-0C77h], di
		jnb	short loc_BB6EC
		cmp	byte ptr [bp-0C75h], 0
		jz	short loc_BB6F1

loc_BB6EC:				; CODE XREF: ovr209:46F3j
		mov	ax, 1
		jmp	short loc_BB6F3
; ���������������������������������������������������������������������������

loc_BB6F1:				; CODE XREF: ovr209:46FAj
		xor	ax, ax

loc_BB6F3:				; CODE XREF: ovr209:46FFj
		mov	ah, 0
		or	ax, ax
		jnz	short loc_BB6FC
		jmp	loc_BB5DB
; ���������������������������������������������������������������������������

loc_BB6FC:				; CODE XREF: ovr209:45B8j ovr209:46E0j ...
		push	0
		lea	ax, [bp-0C94h]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		cmp	byte_495FC, 0
		jz	short loc_BB715
		jmp	loc_BD722
; ���������������������������������������������������������������������������

loc_BB715:				; CODE XREF: ovr209:4720j
		lea	ax, [bp-216h]
		push	ax
		push	0FFh
		push	0Ah
		lea	ax, [bp-0C94h]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		push	0
		push	0
		lea	ax, [bp-42h]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	[bp-13Ah], ax
		push	0
		push	0
		lea	ax, [bp-4Ch]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	[bp-13Ch], ax
		push	81h ; '�'
		push	0C8h ; '�'
		lea	ax, [bp-0DAh]
		push	ax
		push	0
		call	TalkingHead_Construct_98F4
		add	sp, 8
		mov	[bp-13Eh], ax
		push	81h ; '�'
		push	0FFE2h
		lea	ax, [bp-102h]
		push	ax
		push	0
		call	TalkingHead_Construct_98F4
		add	sp, 8
		mov	[bp-140h], ax
		push	word ptr [bp-0D0h]
		mov	al, [bp-0CEh]
		push	ax
		lea	ax, [bp-0D0h]
		push	ax
		lea	ax, [bp-16h]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	word ptr [bp-90h]
		mov	al, [bp-8Eh]
		push	ax
		lea	ax, [bp-90h]
		push	ax
		lea	ax, [bp-16h]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	word ptr [bp-80h]
		mov	al, [bp-7Eh]
		push	ax
		lea	ax, [bp-80h]
		push	ax
		lea	ax, [bp-16h]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	word ptr [bp-13Ah]
		lea	ax, [bp-0C94h]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp-13Ch]
		lea	ax, [bp-0C94h]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp-13Eh]
		lea	ax, [bp-0C94h]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp-140h]
		lea	ax, [bp-0C94h]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		push	0
		push	word ptr [bp-16h]
		mov	al, [bp-14h]
		push	ax
		lea	ax, [bp-16h]
		push	ax
		call	Palette_Upload_2CDE1
		add	sp, 8
		push	19h
		push	word ptr [bp-13Eh]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4
		push	1Fh
		push	word ptr [bp-13Eh]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4
		cmp	byte ptr [bp-8], 0
		jnz	short loc_BB860
		jmp	loc_BB976
; ���������������������������������������������������������������������������

loc_BB860:				; CODE XREF: ovr209:486Bj
		lea	ax, [bp-0C94h]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		mov	dword ptr [bp-14Ah], 0
		mov	byte ptr [bp-146h], 2
		mov	byte ptr [bp-145h], 0
		mov	dword ptr [bp-144h], 0
		push	2
		lea	ax, [bp-14Ah]
		push	ax
		push	4
		lea	ax, [bp-38Ch]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	9
		lea	ax, [bp-14Ah]
		push	ax
		push	word ptr [bp-13Eh]
		call	TalkingHead_AttachVoice_9CF7
		add	sp, 6
		mov	word ptr [bp-14Ch], 0
		jmp	short loc_BB904
; ���������������������������������������������������������������������������

loc_BB8BA:				; CODE XREF: ovr209:4922j
		cmp	word ptr [bp-14Ch], 0Dh
		jnz	short loc_BB8CF
		push	0FFFFh
		push	word ptr [bp-13Eh]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_BB8CF:				; CODE XREF: ovr209:48CFj
		mov	ax, [bp-14Ch]
		inc	word ptr [bp-14Ch]
		cmp	ax, 0Eh
		jnz	short loc_BB8EA
		push	1Bh
		push	word ptr [bp-13Eh]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_BB8EA:				; CODE XREF: ovr209:48EAj
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_BB8F7
		jmp	short loc_BB8F7
; ���������������������������������������������������������������������������
		jmp	short loc_BB914
; ���������������������������������������������������������������������������

loc_BB8F7:				; CODE XREF: ovr209:4901j ovr209:4903j
		lea	ax, [bp-0C94h]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_BB904:				; CODE XREF: ovr209:48C8j
		push	word ptr [bp-13Eh]
		call	TalkingHead_StartVoiceAndIsSpeaking_9C64
		add	sp, 2
		or	al, al
		jnz	short loc_BB8BA

loc_BB914:				; CODE XREF: ovr209:4905j
		mov	word ptr [bp-14Ch], 0
		jmp	short loc_BB92D
; ���������������������������������������������������������������������������

loc_BB91C:				; CODE XREF: ovr209:4942j
		lea	ax, [bp-0C94h]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	word ptr [bp-14Ch]

loc_BB92D:				; CODE XREF: ovr209:492Aj
		cmp	word ptr [bp-14Ch], 0Ah
		jl	short loc_BB91C
		cmp	byte ptr [bp-145h], 0
		jz	short loc_BB95C
		cmp	dword ptr [bp-14Ah], 0
		jz	short loc_BB95C
		push	0
		mov	al, [bp-146h]
		push	ax
		lea	ax, [bp-14Ah]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_BB95C:				; CODE XREF: ovr209:4949j ovr209:4951j
		mov	dword ptr [bp-14Ah], 0
		mov	byte ptr [bp-145h], 0
		mov	dword ptr [bp-144h], 0
		jmp	loc_BBC39
; ���������������������������������������������������������������������������

loc_BB976:				; CODE XREF: ovr209:486Dj
		push	0FEh ; '�'
		lea	ax, [bp-0C72h]
		push	ax
		call	Widget_Method_Dispatch8_314A9
		add	sp, 4
		mov	word ptr [bp-2], 38h ; '8'
		mov	si, [bp-0C77h]
		mov	ax, [bp-2]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	di, dx
		jmp	loc_BBA91
; ���������������������������������������������������������������������������

loc_BB9A6:				; CODE XREF: ovr209:4ABBj
		mov	ax, [bp-0C77h]
		mov	[bp-142h], ax
		mov	ax, si
		inc	ax
		cmp	ax, [bp-142h]
		jnz	short loc_BB9D2
		mov	ax, [bp-6]
		mov	dx, 7
		imul	dx
		mov	dx, [bp-4]
		add	dx, ax
		push	dx
		lea	ax, [bp-0C72h]
		push	ax
		call	sub_C8F5
		add	sp, 4

loc_BB9D2:				; CODE XREF: ovr209:49C5j
		mov	ax, si
		inc	ax
		cmp	ax, [bp-142h]
		jnz	short loc_BB9EA
		push	2898h
		push	word ptr [bp-13Eh]
		call	TalkingHead_SetLipText_9C4F
		add	sp, 4

loc_BB9EA:				; CODE XREF: ovr209:49E9j
		mov	ax, di
		dec	ax
		cmp	ax, [bp-142h]
		jnz	short loc_BBA35
		mov	word ptr [bp-0CA0h], 11BCh
		mov	word ptr [bp-0CA0h], 11C8h
		mov	word ptr [bp-0CA0h], 11D8h
		mov	word ptr [bp-0CA0h], 11E8h
		mov	word ptr [bp-0CA0h], 11FCh
		lea	ax, [bp-0C70h]
		push	ax
		push	0
		push	word ptr [bp-0C53h]
		push	word ptr [bp-0C55h]
		push	word ptr [bp-0C57h]
		push	word ptr [bp-0C59h]
		lea	ax, [bp-0CA0h]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh

loc_BBA35:				; CODE XREF: ovr209:4A01j
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_BBA84
		jmp	short loc_BBA84
; ���������������������������������������������������������������������������
		mov	word ptr [bp-0CACh], 11BCh
		mov	word ptr [bp-0CACh], 11C8h
		mov	word ptr [bp-0CACh], 11D8h
		mov	word ptr [bp-0CACh], 11E8h
		mov	word ptr [bp-0CACh], 11FCh
		lea	ax, [bp-0C70h]
		push	ax
		push	0
		push	word ptr [bp-0C53h]
		push	word ptr [bp-0C55h]
		push	word ptr [bp-0C57h]
		push	word ptr [bp-0C59h]
		lea	ax, [bp-0CACh]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_BBAAE
; ���������������������������������������������������������������������������

loc_BBA84:				; CODE XREF: ovr209:4A4Cj ovr209:4A4Ej
		lea	ax, [bp-0C94h]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_BBA91:				; CODE XREF: ovr209:49B3j
		cmp	[bp-0C77h], di
		jnb	short loc_BBA9E
		cmp	byte ptr [bp-0C75h], 0
		jz	short loc_BBAA3

loc_BBA9E:				; CODE XREF: ovr209:4AA5j
		mov	ax, 1
		jmp	short loc_BBAA5
; ���������������������������������������������������������������������������

loc_BBAA3:				; CODE XREF: ovr209:4AACj
		xor	ax, ax

loc_BBAA5:				; CODE XREF: ovr209:4AB1j
		mov	ah, 0
		or	ax, ax
		jnz	short loc_BBAAE
		jmp	loc_BB9A6
; ���������������������������������������������������������������������������

loc_BBAAE:				; CODE XREF: ovr209:4A92j ovr209:4AB9j
		cmp	byte_495FC, 0
		jz	short loc_BBAC7
		push	0
		lea	ax, [bp-0C94h]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		jmp	loc_BD722
; ���������������������������������������������������������������������������

loc_BBAC7:				; CODE XREF: ovr209:4AC3j
		mov	word ptr [bp-2], 50h ; 'P'
		mov	si, [bp-0C77h]
		mov	ax, [bp-2]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	di, dx
		jmp	loc_BBC1C
; ���������������������������������������������������������������������������

loc_BBAE7:				; CODE XREF: ovr209:4C46j
		mov	ax, [bp-0C77h]
		mov	[bp-142h], ax
		mov	ax, si
		inc	ax
		cmp	ax, [bp-142h]
		jnz	short loc_BBB11
		mov	ax, [bp-6]
		shl	ax, 3
		mov	dx, [bp-4]
		add	dx, ax
		push	dx
		lea	ax, [bp-0C72h]
		push	ax
		call	sub_C8F5
		add	sp, 4

loc_BBB11:				; CODE XREF: ovr209:4B06j
		mov	ax, si
		inc	ax
		cmp	ax, [bp-142h]
		jnz	short loc_BBB29
		push	28ADh
		push	word ptr [bp-13Eh]
		call	TalkingHead_SetLipText_9C4F
		add	sp, 4

loc_BBB29:				; CODE XREF: ovr209:4B28j
		mov	ax, si
		add	ax, 0Dh
		cmp	ax, [bp-142h]
		jnz	short loc_BBB42
		push	0FFFFh
		push	word ptr [bp-13Eh]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_BBB42:				; CODE XREF: ovr209:4B42j
		mov	ax, si
		add	ax, 0Eh
		cmp	ax, [bp-142h]
		jnz	short loc_BBB5B
		push	1Bh
		push	word ptr [bp-13Eh]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_BBB5B:				; CODE XREF: ovr209:4B5Bj
		mov	ax, si
		add	ax, 0Fh
		cmp	ax, [bp-142h]
		jnz	short loc_BBB75
		push	28B9h
		push	word ptr [bp-13Eh]
		call	TalkingHead_SetLipText_9C4F
		add	sp, 4

loc_BBB75:				; CODE XREF: ovr209:4B74j
		mov	ax, di
		dec	ax
		cmp	ax, [bp-142h]
		jnz	short loc_BBBC0
		mov	word ptr [bp-0CA0h], 11BCh
		mov	word ptr [bp-0CA0h], 11C8h
		mov	word ptr [bp-0CA0h], 11D8h
		mov	word ptr [bp-0CA0h], 11E8h
		mov	word ptr [bp-0CA0h], 11FCh
		lea	ax, [bp-0C70h]
		push	ax
		push	0
		push	word ptr [bp-0C53h]
		push	word ptr [bp-0C55h]
		push	word ptr [bp-0C57h]
		push	word ptr [bp-0C59h]
		lea	ax, [bp-0CA0h]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh

loc_BBBC0:				; CODE XREF: ovr209:4B8Cj
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_BBC0F
		jmp	short loc_BBC0F
; ���������������������������������������������������������������������������
		mov	word ptr [bp-0CACh], 11BCh
		mov	word ptr [bp-0CACh], 11C8h
		mov	word ptr [bp-0CACh], 11D8h
		mov	word ptr [bp-0CACh], 11E8h
		mov	word ptr [bp-0CACh], 11FCh
		lea	ax, [bp-0C70h]
		push	ax
		push	0
		push	word ptr [bp-0C53h]
		push	word ptr [bp-0C55h]
		push	word ptr [bp-0C57h]
		push	word ptr [bp-0C59h]
		lea	ax, [bp-0CACh]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_BBC39
; ���������������������������������������������������������������������������

loc_BBC0F:				; CODE XREF: ovr209:4BD7j ovr209:4BD9j
		lea	ax, [bp-0C94h]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_BBC1C:				; CODE XREF: ovr209:4AF4j
		cmp	[bp-0C77h], di
		jnb	short loc_BBC29
		cmp	byte ptr [bp-0C75h], 0
		jz	short loc_BBC2E

loc_BBC29:				; CODE XREF: ovr209:4C30j
		mov	ax, 1
		jmp	short loc_BBC30
; ���������������������������������������������������������������������������

loc_BBC2E:				; CODE XREF: ovr209:4C37j
		xor	ax, ax

loc_BBC30:				; CODE XREF: ovr209:4C3Cj
		mov	ah, 0
		or	ax, ax
		jnz	short loc_BBC39
		jmp	loc_BBAE7
; ���������������������������������������������������������������������������

loc_BBC39:				; CODE XREF: ovr209:4983j ovr209:4C1Dj ...
		push	0
		lea	ax, [bp-0C94h]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		cmp	byte_495FC, 0
		jz	short loc_BBC52
		jmp	loc_BD722
; ���������������������������������������������������������������������������

loc_BBC52:				; CODE XREF: ovr209:4C5Dj
		lea	ax, [bp-216h]
		push	ax
		push	0FFh
		push	9
		lea	ax, [bp-0C94h]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		push	0
		push	0
		lea	ax, [bp-42h]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	[bp-13Ah], ax
		push	0
		push	0
		lea	ax, [bp-4Ch]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	[bp-13Ch], ax
		push	81h ; '�'
		push	0FFD3h
		lea	ax, [bp-10Ch]
		push	ax
		push	0
		call	TalkingHead_Construct_98F4
		add	sp, 8
		mov	[bp-13Eh], ax
		push	81h ; '�'
		push	91h ; '�'
		lea	ax, [bp-116h]
		push	ax
		push	0
		call	TalkingHead_Construct_98F4
		add	sp, 8
		mov	[bp-140h], ax
		push	81h ; '�'
		push	136h
		lea	ax, [bp-0E4h]
		push	ax
		push	0
		call	TalkingHead_Construct_98F4
		add	sp, 8
		mov	[bp-142h], ax
		push	word ptr [bp-0D0h]
		mov	al, [bp-0CEh]
		push	ax
		lea	ax, [bp-0D0h]
		push	ax
		lea	ax, [bp-16h]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	word ptr [bp-90h]
		mov	al, [bp-8Eh]
		push	ax
		lea	ax, [bp-90h]
		push	ax
		lea	ax, [bp-16h]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	word ptr [bp-80h]
		mov	al, [bp-7Eh]
		push	ax
		lea	ax, [bp-80h]
		push	ax
		lea	ax, [bp-16h]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	word ptr [bp-13Ah]
		lea	ax, [bp-0C94h]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp-13Ch]
		lea	ax, [bp-0C94h]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp-13Eh]
		lea	ax, [bp-0C94h]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp-142h]
		lea	ax, [bp-0C94h]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp-140h]
		lea	ax, [bp-0C94h]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		push	0
		push	word ptr [bp-16h]
		mov	al, [bp-14h]
		push	ax
		lea	ax, [bp-16h]
		push	ax
		call	Palette_Upload_2CDE1
		add	sp, 8
		push	1Bh
		push	word ptr [bp-13Eh]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4
		push	1Bh
		push	word ptr [bp-142h]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4
		mov	bx, [bp-140h]
		mov	byte ptr [bx+852h], 0
		cmp	byte ptr [bp-8], 0
		jnz	short loc_BBDD0
		jmp	loc_BC033
; ���������������������������������������������������������������������������

loc_BBDD0:				; CODE XREF: ovr209:4DDBj
		lea	ax, [bp-0C94h]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		mov	dword ptr [bp-14Ch], 0
		mov	byte ptr [bp-148h], 2
		mov	byte ptr [bp-147h], 0
		mov	dword ptr [bp-146h], 0
		push	2
		lea	ax, [bp-14Ch]
		push	ax
		push	5
		lea	ax, [bp-38Ch]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	9
		lea	ax, [bp-14Ch]
		push	ax
		push	word ptr [bp-140h]
		call	TalkingHead_AttachVoice_9CF7
		add	sp, 6
		mov	word ptr [bp-14Eh], 0
		jmp	short loc_BBE3B
; ���������������������������������������������������������������������������

loc_BBE2A:				; CODE XREF: ovr209:4E50j
		lea	ax, [bp-0C94h]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	word ptr [bp-14Eh]

loc_BBE3B:				; CODE XREF: ovr209:4E38j
		cmp	word ptr [bp-14Eh], 3
		jl	short loc_BBE2A
		jmp	short loc_BBE5E
; ���������������������������������������������������������������������������

loc_BBE44:				; CODE XREF: ovr209:4E7Cj
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_BBE51
		jmp	short loc_BBE51
; ���������������������������������������������������������������������������
		jmp	short loc_BBE6E
; ���������������������������������������������������������������������������

loc_BBE51:				; CODE XREF: ovr209:4E5Bj ovr209:4E5Dj
		lea	ax, [bp-0C94h]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_BBE5E:				; CODE XREF: ovr209:4E52j
		push	word ptr [bp-140h]
		call	TalkingHead_StartVoiceAndIsSpeaking_9C64
		add	sp, 2
		or	al, al
		jnz	short loc_BBE44

loc_BBE6E:				; CODE XREF: ovr209:4E5Fj
		cmp	byte_495FC, 0
		jz	short loc_BBE91
		cmp	byte ptr [bp-147h], 0
		jnz	short loc_BBE7F
		jmp	near ptr loc_B81ED+2
; ���������������������������������������������������������������������������

loc_BBE7F:				; CODE XREF: ovr209:4E8Aj
		push	0
		lea	ax, [bp-0C94h]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		jmp	loc_BD722
; ���������������������������������������������������������������������������

loc_BBE91:				; CODE XREF: ovr209:4E83j
		mov	word ptr [bp-14Eh], 0
		jmp	short loc_BBEE9
; ���������������������������������������������������������������������������

loc_BBE99:				; CODE XREF: ovr209:4EFEj
		cmp	word ptr [bp-14Eh], 2
		jnz	short loc_BBEAE
		push	1Bh
		push	word ptr [bp-140h]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_BBEAE:				; CODE XREF: ovr209:4EAEj
		cmp	word ptr [bp-14Eh], 4
		jnz	short loc_BBEC3
		push	0Fh
		push	word ptr [bp-140h]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_BBEC3:				; CODE XREF: ovr209:4EC3j
		cmp	word ptr [bp-14Eh], 6
		jnz	short loc_BBED8
		push	0FFFFh
		push	word ptr [bp-140h]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_BBED8:				; CODE XREF: ovr209:4ED8j
		lea	ax, [bp-0C94h]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	word ptr [bp-14Eh]

loc_BBEE9:				; CODE XREF: ovr209:4EA7j
		cmp	word ptr [bp-14Eh], 0Ch
		jl	short loc_BBE99
		cmp	byte_495FC, 0
		jz	short loc_BBF13
		cmp	byte ptr [bp-147h], 0
		jnz	short loc_BBF01
		jmp	near ptr loc_B81ED+2
; ���������������������������������������������������������������������������

loc_BBF01:				; CODE XREF: ovr209:4F0Cj
		push	0
		lea	ax, [bp-0C94h]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		jmp	loc_BD722
; ���������������������������������������������������������������������������

loc_BBF13:				; CODE XREF: ovr209:4F05j
		mov	dword ptr [bp-158h], 0
		mov	byte ptr [bp-154h], 2
		mov	byte ptr [bp-153h], 0
		mov	dword ptr [bp-152h], 0
		push	2
		lea	ax, [bp-158h]
		push	ax
		push	6
		lea	ax, [bp-38Ch]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	9
		lea	ax, [bp-158h]
		push	ax
		push	word ptr [bp-140h]
		call	TalkingHead_AttachVoice_9CF7
		add	sp, 6
		jmp	short loc_BBF74
; ���������������������������������������������������������������������������

loc_BBF5A:				; CODE XREF: ovr209:4F92j
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_BBF67
		jmp	short loc_BBF67
; ���������������������������������������������������������������������������
		jmp	short loc_BBF84
; ���������������������������������������������������������������������������

loc_BBF67:				; CODE XREF: ovr209:4F71j ovr209:4F73j
		lea	ax, [bp-0C94h]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_BBF74:				; CODE XREF: ovr209:4F68j
		push	word ptr [bp-140h]
		call	TalkingHead_StartVoiceAndIsSpeaking_9C64
		add	sp, 2
		or	al, al
		jnz	short loc_BBF5A

loc_BBF84:				; CODE XREF: ovr209:4F75j
		push	1Bh
		push	word ptr [bp-140h]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4
		mov	word ptr [bp-14Eh], 0
		jmp	short loc_BBFAB
; ���������������������������������������������������������������������������

loc_BBF9A:				; CODE XREF: ovr209:4FC0j
		lea	ax, [bp-0C94h]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2
		inc	word ptr [bp-14Eh]

loc_BBFAB:				; CODE XREF: ovr209:4FA8j
		cmp	word ptr [bp-14Eh], 0Ah
		jl	short loc_BBF9A
		cmp	byte ptr [bp-153h], 0
		jz	short loc_BBFDA
		cmp	dword ptr [bp-158h], 0
		jz	short loc_BBFDA
		push	0
		mov	al, [bp-154h]
		push	ax
		lea	ax, [bp-158h]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_BBFDA:				; CODE XREF: ovr209:4FC7j ovr209:4FCFj
		mov	dword ptr [bp-158h], 0
		mov	byte ptr [bp-153h], 0
		mov	dword ptr [bp-152h], 0
		cmp	byte ptr [bp-147h], 0
		jz	short loc_BC019
		cmp	dword ptr [bp-14Ch], 0
		jz	short loc_BC019
		push	0
		mov	al, [bp-148h]
		push	ax
		lea	ax, [bp-14Ch]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_BC019:				; CODE XREF: ovr209:5006j ovr209:500Ej
		mov	dword ptr [bp-14Ch], 0
		mov	byte ptr [bp-147h], 0
		mov	dword ptr [bp-146h], 0
		jmp	loc_BC383
; ���������������������������������������������������������������������������

loc_BC033:				; CODE XREF: ovr209:4DDDj
		push	0EBh ; '�'
		lea	ax, [bp-0C72h]
		push	ax
		call	Widget_Method_Dispatch8_314A9
		add	sp, 4
		mov	word ptr [bp-2], 1Eh
		mov	si, [bp-0C77h]
		mov	ax, [bp-2]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	di, dx
		jmp	loc_BC190
; ���������������������������������������������������������������������������

loc_BC063:				; CODE XREF: ovr209:51BAj
		mov	ax, [bp-0C77h]
		mov	[bp-144h], ax
		cmp	[bp-144h], si
		jnz	short loc_BC07F
		push	13h
		push	word ptr [bp-140h]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_BC07F:				; CODE XREF: ovr209:507Fj
		mov	ax, si
		inc	ax
		cmp	ax, [bp-144h]
		jnz	short loc_BC0A3
		mov	ax, [bp-6]
		mov	dx, 9
		imul	dx
		mov	dx, [bp-4]
		add	dx, ax
		push	dx
		lea	ax, [bp-0C72h]
		push	ax
		call	sub_C8F5
		add	sp, 4

loc_BC0A3:				; CODE XREF: ovr209:5096j
		mov	ax, si
		inc	ax
		cmp	ax, [bp-144h]
		jnz	short loc_BC0BB
		push	28CBh
		push	word ptr [bp-140h]
		call	TalkingHead_SetLipText_9C4F
		add	sp, 4

loc_BC0BB:				; CODE XREF: ovr209:50BAj
		mov	ax, di
		dec	ax
		cmp	ax, [bp-144h]
		jnz	short loc_BC0D2
		push	0FFFFh
		push	word ptr [bp-140h]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_BC0D2:				; CODE XREF: ovr209:50D2j
		mov	ax, di
		dec	ax
		cmp	ax, [bp-144h]
		jnz	short loc_BC0E9
		push	1Bh
		push	word ptr [bp-140h]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_BC0E9:				; CODE XREF: ovr209:50E9j
		mov	ax, di
		dec	ax
		cmp	ax, [bp-144h]
		jnz	short loc_BC134
		mov	word ptr [bp-0CA0h], 11BCh
		mov	word ptr [bp-0CA0h], 11C8h
		mov	word ptr [bp-0CA0h], 11D8h
		mov	word ptr [bp-0CA0h], 11E8h
		mov	word ptr [bp-0CA0h], 11FCh
		lea	ax, [bp-0C70h]
		push	ax
		push	0
		push	word ptr [bp-0C53h]
		push	word ptr [bp-0C55h]
		push	word ptr [bp-0C57h]
		push	word ptr [bp-0C59h]
		lea	ax, [bp-0CA0h]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh

loc_BC134:				; CODE XREF: ovr209:5100j
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_BC183
		jmp	short loc_BC183
; ���������������������������������������������������������������������������
		mov	word ptr [bp-0CACh], 11BCh
		mov	word ptr [bp-0CACh], 11C8h
		mov	word ptr [bp-0CACh], 11D8h
		mov	word ptr [bp-0CACh], 11E8h
		mov	word ptr [bp-0CACh], 11FCh
		lea	ax, [bp-0C70h]
		push	ax
		push	0
		push	word ptr [bp-0C53h]
		push	word ptr [bp-0C55h]
		push	word ptr [bp-0C57h]
		push	word ptr [bp-0C59h]
		lea	ax, [bp-0CACh]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_BC1AD
; ���������������������������������������������������������������������������

loc_BC183:				; CODE XREF: ovr209:514Bj ovr209:514Dj
		lea	ax, [bp-0C94h]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_BC190:				; CODE XREF: ovr209:5070j
		cmp	[bp-0C77h], di
		jnb	short loc_BC19D
		cmp	byte ptr [bp-0C75h], 0
		jz	short loc_BC1A2

loc_BC19D:				; CODE XREF: ovr209:51A4j
		mov	ax, 1
		jmp	short loc_BC1A4
; ���������������������������������������������������������������������������

loc_BC1A2:				; CODE XREF: ovr209:51ABj
		xor	ax, ax

loc_BC1A4:				; CODE XREF: ovr209:51B0j
		mov	ah, 0
		or	ax, ax
		jnz	short loc_BC1AD
		jmp	loc_BC063
; ���������������������������������������������������������������������������

loc_BC1AD:				; CODE XREF: ovr209:5191j ovr209:51B8j
		cmp	byte_495FC, 0
		jz	short loc_BC1C6
		push	0
		lea	ax, [bp-0C94h]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		jmp	loc_BD722
; ���������������������������������������������������������������������������

loc_BC1C6:				; CODE XREF: ovr209:51C2j
		mov	word ptr [bp-2], 32h ; '2'
		mov	si, [bp-0C77h]
		mov	ax, [bp-2]
		mov	dx, 46h	; 'F'
		imul	dx
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	dx, si
		add	dx, ax
		mov	di, dx
		jmp	loc_BC366
; ���������������������������������������������������������������������������

loc_BC1E6:				; CODE XREF: ovr209:5390j
		mov	ax, [bp-0C77h]
		mov	[bp-144h], ax
		mov	ax, si
		inc	ax
		cmp	ax, [bp-144h]
		jnz	short loc_BC205
		push	0FFFFh
		push	word ptr [bp-140h]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_BC205:				; CODE XREF: ovr209:5205j
		mov	ax, si
		inc	ax
		cmp	ax, [bp-144h]
		jnz	short loc_BC229
		mov	ax, [bp-6]
		mov	dx, 0Ah
		imul	dx
		mov	dx, [bp-4]
		add	dx, ax
		push	dx
		lea	ax, [bp-0C72h]
		push	ax
		call	sub_C8F5
		add	sp, 4

loc_BC229:				; CODE XREF: ovr209:521Cj
		mov	ax, si
		inc	ax
		cmp	ax, [bp-144h]
		jnz	short loc_BC241
		push	28D9h
		push	word ptr [bp-140h]
		call	TalkingHead_SetLipText_9C4F
		add	sp, 4

loc_BC241:				; CODE XREF: ovr209:5240j
		mov	ax, si
		add	ax, 0Ah
		cmp	ax, [bp-144h]
		jnz	short loc_BC25A
		push	1Bh
		push	word ptr [bp-140h]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_BC25A:				; CODE XREF: ovr209:525Aj
		mov	ax, si
		add	ax, 0Ch
		cmp	ax, [bp-144h]
		jnz	short loc_BC273
		push	0Fh
		push	word ptr [bp-140h]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_BC273:				; CODE XREF: ovr209:5273j
		mov	ax, si
		add	ax, 0Eh
		cmp	ax, [bp-144h]
		jnz	short loc_BC28C
		push	0FFFFh
		push	word ptr [bp-140h]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_BC28C:				; CODE XREF: ovr209:528Cj
		mov	ax, si
		add	ax, 0Eh
		cmp	ax, [bp-144h]
		jnz	short loc_BC2A6
		push	28E1h
		push	word ptr [bp-140h]
		call	TalkingHead_SetLipText_9C4F
		add	sp, 4

loc_BC2A6:				; CODE XREF: ovr209:52A5j
		mov	ax, di
		add	ax, 0FFFBh
		cmp	ax, [bp-144h]
		jnz	short loc_BC2BF
		push	1Bh
		push	word ptr [bp-140h]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4

loc_BC2BF:				; CODE XREF: ovr209:52BFj
		mov	ax, di
		dec	ax
		cmp	ax, [bp-144h]
		jnz	short loc_BC30A
		mov	word ptr [bp-0CA0h], 11BCh
		mov	word ptr [bp-0CA0h], 11C8h
		mov	word ptr [bp-0CA0h], 11D8h
		mov	word ptr [bp-0CA0h], 11E8h
		mov	word ptr [bp-0CA0h], 11FCh
		lea	ax, [bp-0C70h]
		push	ax
		push	0
		push	word ptr [bp-0C53h]
		push	word ptr [bp-0C55h]
		push	word ptr [bp-0C57h]
		push	word ptr [bp-0C59h]
		lea	ax, [bp-0CA0h]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh

loc_BC30A:				; CODE XREF: ovr209:52D6j
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_BC359
		jmp	short loc_BC359
; ���������������������������������������������������������������������������
		mov	word ptr [bp-0CACh], 11BCh
		mov	word ptr [bp-0CACh], 11C8h
		mov	word ptr [bp-0CACh], 11D8h
		mov	word ptr [bp-0CACh], 11E8h
		mov	word ptr [bp-0CACh], 11FCh
		lea	ax, [bp-0C70h]
		push	ax
		push	0
		push	word ptr [bp-0C53h]
		push	word ptr [bp-0C55h]
		push	word ptr [bp-0C57h]
		push	word ptr [bp-0C59h]
		lea	ax, [bp-0CACh]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		jmp	short loc_BC383
; ���������������������������������������������������������������������������

loc_BC359:				; CODE XREF: ovr209:5321j ovr209:5323j
		lea	ax, [bp-0C94h]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_BC366:				; CODE XREF: ovr209:51F3j
		cmp	[bp-0C77h], di
		jnb	short loc_BC373
		cmp	byte ptr [bp-0C75h], 0
		jz	short loc_BC378

loc_BC373:				; CODE XREF: ovr209:537Aj
		mov	ax, 1
		jmp	short loc_BC37A
; ���������������������������������������������������������������������������

loc_BC378:				; CODE XREF: ovr209:5381j
		xor	ax, ax

loc_BC37A:				; CODE XREF: ovr209:5386j
		mov	ah, 0
		or	ax, ax
		jnz	short loc_BC383
		jmp	loc_BC1E6
; ���������������������������������������������������������������������������

loc_BC383:				; CODE XREF: ovr209:5040j ovr209:5367j ...
		push	0
		lea	ax, [bp-0C94h]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		cmp	byte_495FC, 0
		jz	short loc_BC39C
		jmp	loc_BD722
; ���������������������������������������������������������������������������

loc_BC39C:				; CODE XREF: ovr209:53A7j
		mov	dword ptr [bp-142h], 0
		mov	byte ptr [bp-13Eh], 2
		mov	byte ptr [bp-13Dh], 0
		mov	dword ptr [bp-13Ch], 0
		mov	dword ptr [bp-0C7Ch], 0
		mov	byte ptr [bp-0C78h], 2
		mov	byte ptr [bp-0C77h], 0
		mov	dword ptr [bp-0C76h], 0
		mov	word ptr [bp-0C80h], 0
		mov	word ptr [bp-0C7Eh], 0FFFFh
		cmp	byte ptr [bp-9], 0
		jz	short loc_BC421
		push	3
		lea	ax, [bp-142h]
		push	ax
		push	19h
		lea	ax, [bp-404h]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	word_46849
		lea	ax, [bp-0C80h]
		push	ax
		call	MusicChannel_Init_78A4
		add	sp, 4
		push	0
		lea	ax, [bp-142h]
		push	ax
		lea	ax, [bp-0C80h]
		push	ax
		call	MusicChannel_RegisterSequence_7918
		add	sp, 6

loc_BC421:				; CODE XREF: ovr209:53F4j
		mov	dword ptr [bp-14Ch], 0
		mov	byte ptr [bp-148h], 2
		mov	byte ptr [bp-147h], 0
		mov	dword ptr [bp-146h], 0
		push	3
		lea	ax, [bp-14Ch]
		push	ax
		push	17h
		lea	ax, [bp-29Ch]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	dword ptr [bp-156h], 0
		mov	byte ptr [bp-152h], 2
		mov	byte ptr [bp-151h], 0
		mov	dword ptr [bp-150h], 0
		push	3
		lea	ax, [bp-156h]
		push	ax
		push	16h
		lea	ax, [bp-29Ch]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	dword ptr [bp-160h], 0
		mov	byte ptr [bp-15Ch], 2
		mov	byte ptr [bp-15Bh], 0
		mov	dword ptr [bp-15Ah], 0
		push	3
		lea	ax, [bp-160h]
		push	ax
		push	14h
		lea	ax, [bp-29Ch]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	dword ptr [bp-16Ah], 0
		mov	byte ptr [bp-166h], 2
		mov	byte ptr [bp-165h], 0
		mov	dword ptr [bp-164h], 0
		push	3
		lea	ax, [bp-16Ah]
		push	ax
		push	1Ah
		lea	ax, [bp-29Ch]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	dword ptr [bp-174h], 0
		mov	byte ptr [bp-170h], 2
		mov	byte ptr [bp-16Fh], 0
		mov	dword ptr [bp-16Eh], 0
		push	3
		lea	ax, [bp-174h]
		push	ax
		push	19h
		lea	ax, [bp-29Ch]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	dword ptr [bp-17Eh], 0
		mov	byte ptr [bp-17Ah], 2
		mov	byte ptr [bp-179h], 0
		mov	dword ptr [bp-178h], 0
		push	3
		lea	ax, [bp-17Eh]
		push	ax
		push	15h
		lea	ax, [bp-29Ch]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	dword ptr [bp-188h], 0
		mov	byte ptr [bp-184h], 2
		mov	byte ptr [bp-183h], 0
		mov	dword ptr [bp-182h], 0
		push	3
		lea	ax, [bp-188h]
		push	ax
		push	18h
		lea	ax, [bp-29Ch]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		lea	ax, [bp-216h]
		push	ax
		push	0FFh
		push	0Ah
		lea	ax, [bp-0CA2h]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		push	0
		push	0
		lea	ax, [bp-42h]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	[bp-18Ah], ax
		push	0
		push	0
		lea	ax, [bp-4Ch]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	[bp-18Ch], ax
		push	3
		push	0
		lea	ax, [bp-14Ch]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	[bp-18Eh], ax
		push	0
		push	3
		push	71h ; 'q'
		lea	ax, [bp-156h]
		push	ax
		push	0
		call	OverlayImageLayer_Construct_A9D6
		add	sp, 0Ah
		mov	[bp-190h], ax
		push	0
		push	3
		push	0
		lea	ax, [bp-160h]
		push	ax
		push	0
		call	OverlayImageLayer_Construct_A9D6
		add	sp, 0Ah
		mov	[bp-192h], ax
		push	0
		push	3
		push	0
		lea	ax, [bp-174h]
		push	ax
		push	0
		call	OverlayImageLayer_Construct_A9D6
		add	sp, 0Ah
		mov	[bp-194h], ax
		push	0
		push	3
		push	28h ; '('
		lea	ax, [bp-16Ah]
		push	ax
		push	0
		call	OverlayImageLayer_Construct_A9D6
		add	sp, 0Ah
		mov	[bp-196h], ax
		push	0
		push	3
		push	0
		lea	ax, [bp-17Eh]
		push	ax
		push	0
		call	OverlayImageLayer_Construct_A9D6
		add	sp, 0Ah
		mov	[bp-198h], ax
		push	0
		push	3
		push	0FF74h
		lea	ax, [bp-188h]
		push	ax
		push	0
		call	OverlayImageLayer_Construct_A9D6
		add	sp, 0Ah
		mov	[bp-19Ah], ax
		push	word ptr [bp-90h]
		mov	al, [bp-8Eh]
		push	ax
		lea	ax, [bp-90h]
		push	ax
		lea	ax, [bp-16h]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	word ptr [bp-80h]
		mov	al, [bp-7Eh]
		push	ax
		lea	ax, [bp-80h]
		push	ax
		lea	ax, [bp-16h]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	word ptr [bp-0A0h]
		mov	al, [bp-9Eh]
		push	ax
		lea	ax, [bp-0A0h]
		push	ax
		lea	ax, [bp-16h]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	word ptr [bp-18Ah]
		lea	ax, [bp-0CA2h]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp-18Ch]
		lea	ax, [bp-0CA2h]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp-18Eh]
		lea	ax, [bp-0CA2h]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp-19Ah]
		lea	ax, [bp-0CA2h]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp-194h]
		lea	ax, [bp-0CA2h]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp-192h]
		lea	ax, [bp-0CA2h]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp-198h]
		lea	ax, [bp-0CA2h]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp-196h]
		lea	ax, [bp-0CA2h]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp-190h]
		lea	ax, [bp-0CA2h]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		mov	bx, [bp-190h]
		mov	word ptr [bx+1Bh], 2
		mov	bx, [bp-192h]
		mov	word ptr [bx+1Bh], 2
		mov	bx, [bp-194h]
		mov	word ptr [bx+1Bh], 1
		mov	bx, [bp-198h]
		mov	word ptr [bx+1Bh], 9
		mov	bx, [bp-196h]
		mov	word ptr [bx+1Bh], 1
		mov	bx, [bp-19Ah]
		mov	word ptr [bx+1Bh], 1
		push	0
		push	word ptr [bp-16h]
		mov	al, [bp-14h]
		push	ax
		lea	ax, [bp-16h]
		push	ax
		call	Palette_Upload_2CDE1
		add	sp, 8
		mov	word ptr [bp-19Ch], 3
		mov	word ptr [bp-19Eh], 0Ah
		mov	word ptr [bp-1A0h], 8
		mov	word ptr [bp-1A2h], 3
		mov	word ptr [bp-1A4h], 3
		mov	word ptr [bp-1A6h], 0Ah
		mov	word ptr [bp-0C85h], 0
		jmp	loc_BC99C
; ���������������������������������������������������������������������������

loc_BC7DA:				; CODE XREF: ovr209:59CDj
		mov	ax, [bp-0C85h]
		mov	[bp-1A8h], ax
		cmp	word ptr [bp-1A8h], 0Eh
		jnz	short loc_BC7F2
		mov	bx, [bp-196h]
		mov	word ptr [bx+1Bh], 2

loc_BC7F2:				; CODE XREF: ovr209:57F7j
		cmp	word ptr [bp-1A8h], 10h
		jnz	short loc_BC802
		mov	bx, [bp-194h]
		mov	word ptr [bx+1Bh], 2

loc_BC802:				; CODE XREF: ovr209:5807j
		cmp	word ptr [bp-1A8h], 1
		jle	short loc_BC83A
		mov	ax, [bp-1A8h]
		cmp	ax, [bp-1A6h]
		jge	short loc_BC83A
		call	CRT_Rand
		movsx	eax, ax
		shl	eax, 1
		mov	ebx, 8000h
		cdq
		idiv	ebx
		inc	ax
		mov	[bp-1AAh], ax
		mov	bx, [bp-190h]
		mov	ax, [bp-1AAh]
		mov	[bx+1Bh], ax

loc_BC83A:				; CODE XREF: ovr209:5817j ovr209:5821j
		mov	ax, [bp-1A6h]
		inc	ax
		cmp	ax, [bp-1A8h]
		jnz	short loc_BC88F
		cmp	byte ptr [bp-9], 0
		jz	short loc_BC88F
		mov	ax, word_48ED4
		mov	[bp-1ACh], ax
		mov	word ptr [bp-1AEh], 0
		cmp	word ptr [bp-0C80h], 0
		jz	short loc_BC88F
		push	word ptr [bp-0C7Eh]
		mov	bx, [bp-0C80h]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	word ptr [bp-1AEh]
		push	word ptr [bp-1ACh]
		push	word ptr [bp-0C7Eh]
		mov	bx, [bp-0C80h]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_BC88F:				; CODE XREF: ovr209:5853j ovr209:5859j ...
		mov	ax, [bp-1A6h]
		dec	ax
		cmp	ax, [bp-1A8h]
		jge	short loc_BC8BE
		mov	ax, [bp-1A6h]
		add	ax, 7
		cmp	ax, [bp-1A8h]
		jle	short loc_BC8BE
		mov	ax, [bp-1A4h]
		mov	[bp-1B0h], ax
		inc	word ptr [bp-1A4h]
		mov	bx, [bp-190h]
		mov	ax, [bp-1B0h]
		mov	[bx+1Bh], ax

loc_BC8BE:				; CODE XREF: ovr209:58A8j ovr209:58B5j
		mov	ax, [bp-1A6h]
		add	ax, 0Ah
		cmp	ax, [bp-1A8h]
		jge	short loc_BC8EF
		mov	ax, [bp-1A6h]
		add	ax, 0Dh
		cmp	ax, [bp-1A8h]
		jle	short loc_BC8EF
		mov	ax, [bp-19Ch]
		mov	[bp-1B2h], ax
		inc	word ptr [bp-19Ch]
		mov	bx, [bp-192h]
		mov	ax, [bp-1B2h]
		mov	[bx+1Bh], ax

loc_BC8EF:				; CODE XREF: ovr209:58D9j ovr209:58E6j
		mov	ax, [bp-1A6h]
		add	ax, 0Ch
		cmp	ax, [bp-1A8h]
		jge	short loc_BC920
		mov	ax, [bp-1A6h]
		add	ax, 0Fh
		cmp	ax, [bp-1A8h]
		jle	short loc_BC920
		mov	ax, [bp-19Eh]
		mov	[bp-1B4h], ax
		inc	word ptr [bp-19Eh]
		mov	bx, [bp-198h]
		mov	ax, [bp-1B4h]
		mov	[bx+1Bh], ax

loc_BC920:				; CODE XREF: ovr209:590Aj ovr209:5917j
		mov	ax, [bp-1A6h]
		add	ax, 0Ah
		cmp	ax, [bp-1A8h]
		jge	short loc_BC951
		mov	ax, [bp-1A6h]
		add	ax, 0Eh
		cmp	ax, [bp-1A8h]
		jle	short loc_BC951
		mov	ax, [bp-1A0h]
		mov	[bp-1B6h], ax
		inc	word ptr [bp-1A0h]
		mov	bx, [bp-19Ah]
		mov	ax, [bp-1B6h]
		mov	[bx+1Bh], ax

loc_BC951:				; CODE XREF: ovr209:593Bj ovr209:5948j
		mov	ax, [bp-1A6h]
		add	ax, 9
		cmp	ax, [bp-1A8h]
		jge	short loc_BC982
		mov	ax, [bp-1A6h]
		add	ax, 0Dh
		cmp	ax, [bp-1A8h]
		jle	short loc_BC982
		mov	ax, [bp-1A2h]
		mov	[bp-1B8h], ax
		inc	word ptr [bp-1A2h]
		mov	bx, [bp-196h]
		mov	ax, [bp-1B8h]
		mov	[bx+1Bh], ax

loc_BC982:				; CODE XREF: ovr209:596Cj ovr209:5979j
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_BC98F
		jmp	short loc_BC98F
; ���������������������������������������������������������������������������
		jmp	short loc_BC9C0
; ���������������������������������������������������������������������������

loc_BC98F:				; CODE XREF: ovr209:5999j ovr209:599Bj
		lea	ax, [bp-0CA2h]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_BC99C:				; CODE XREF: ovr209:57E7j
		mov	ax, [bp-1A6h]
		add	ax, 19h
		cmp	ax, [bp-0C85h]
		jbe	short loc_BC9B0
		cmp	byte ptr [bp-0C83h], 0
		jz	short loc_BC9B5

loc_BC9B0:				; CODE XREF: ovr209:59B7j
		mov	ax, 1
		jmp	short loc_BC9B7
; ���������������������������������������������������������������������������

loc_BC9B5:				; CODE XREF: ovr209:59BEj
		xor	ax, ax

loc_BC9B7:				; CODE XREF: ovr209:59C3j
		mov	ah, 0
		or	ax, ax
		jnz	short loc_BC9C0
		jmp	loc_BC7DA
; ���������������������������������������������������������������������������

loc_BC9C0:				; CODE XREF: ovr209:599Dj ovr209:59CBj
		push	0
		lea	ax, [bp-0CA2h]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		cmp	byte ptr [bp-183h], 0
		jz	short loc_BC9F7
		cmp	dword ptr [bp-188h], 0
		jz	short loc_BC9F7
		push	0
		mov	al, [bp-184h]
		push	ax
		lea	ax, [bp-188h]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_BC9F7:				; CODE XREF: ovr209:59E4j ovr209:59ECj
		mov	dword ptr [bp-188h], 0
		mov	byte ptr [bp-183h], 0
		mov	dword ptr [bp-182h], 0
		cmp	byte ptr [bp-179h], 0
		jz	short loc_BCA36
		cmp	dword ptr [bp-17Eh], 0
		jz	short loc_BCA36
		push	0
		mov	al, [bp-17Ah]
		push	ax
		lea	ax, [bp-17Eh]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_BCA36:				; CODE XREF: ovr209:5A23j ovr209:5A2Bj
		mov	dword ptr [bp-17Eh], 0
		mov	byte ptr [bp-179h], 0
		mov	dword ptr [bp-178h], 0
		cmp	byte ptr [bp-16Fh], 0
		jz	short loc_BCA75
		cmp	dword ptr [bp-174h], 0
		jz	short loc_BCA75
		push	0
		mov	al, [bp-170h]
		push	ax
		lea	ax, [bp-174h]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_BCA75:				; CODE XREF: ovr209:5A62j ovr209:5A6Aj
		mov	dword ptr [bp-174h], 0
		mov	byte ptr [bp-16Fh], 0
		mov	dword ptr [bp-16Eh], 0
		cmp	byte ptr [bp-165h], 0
		jz	short loc_BCAB4
		cmp	dword ptr [bp-16Ah], 0
		jz	short loc_BCAB4
		push	0
		mov	al, [bp-166h]
		push	ax
		lea	ax, [bp-16Ah]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_BCAB4:				; CODE XREF: ovr209:5AA1j ovr209:5AA9j
		mov	dword ptr [bp-16Ah], 0
		mov	byte ptr [bp-165h], 0
		mov	dword ptr [bp-164h], 0
		cmp	byte ptr [bp-15Bh], 0
		jz	short loc_BCAF3
		cmp	dword ptr [bp-160h], 0
		jz	short loc_BCAF3
		push	0
		mov	al, [bp-15Ch]
		push	ax
		lea	ax, [bp-160h]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_BCAF3:				; CODE XREF: ovr209:5AE0j ovr209:5AE8j
		mov	dword ptr [bp-160h], 0
		mov	byte ptr [bp-15Bh], 0
		mov	dword ptr [bp-15Ah], 0
		cmp	byte ptr [bp-151h], 0
		jz	short loc_BCB32
		cmp	dword ptr [bp-156h], 0
		jz	short loc_BCB32
		push	0
		mov	al, [bp-152h]
		push	ax
		lea	ax, [bp-156h]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_BCB32:				; CODE XREF: ovr209:5B1Fj ovr209:5B27j
		mov	dword ptr [bp-156h], 0
		mov	byte ptr [bp-151h], 0
		mov	dword ptr [bp-150h], 0
		cmp	byte ptr [bp-147h], 0
		jz	short loc_BCB71
		cmp	dword ptr [bp-14Ch], 0
		jz	short loc_BCB71
		push	0
		mov	al, [bp-148h]
		push	ax
		lea	ax, [bp-14Ch]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_BCB71:				; CODE XREF: ovr209:5B5Ej ovr209:5B66j
		mov	dword ptr [bp-14Ch], 0
		mov	byte ptr [bp-147h], 0
		mov	dword ptr [bp-146h], 0
		lea	ax, [bp-0C80h]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	byte ptr [bp-0C77h], 0
		jz	short loc_BCBBD
		cmp	dword ptr [bp-0C7Ch], 0
		jz	short loc_BCBBD
		push	0
		mov	al, [bp-0C78h]
		push	ax
		lea	ax, [bp-0C7Ch]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_BCBBD:				; CODE XREF: ovr209:5BAAj ovr209:5BB2j
		mov	dword ptr [bp-0C7Ch], 0
		mov	byte ptr [bp-0C77h], 0
		mov	dword ptr [bp-0C76h], 0
		cmp	byte ptr [bp-13Dh], 0
		jz	short loc_BCBFC
		cmp	dword ptr [bp-142h], 0
		jz	short loc_BCBFC
		push	0
		mov	al, [bp-13Eh]
		push	ax
		lea	ax, [bp-142h]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_BCBFC:				; CODE XREF: ovr209:5BE9j ovr209:5BF1j
		mov	dword ptr [bp-142h], 0
		mov	byte ptr [bp-13Dh], 0
		mov	dword ptr [bp-13Ch], 0
		cmp	byte_495FC, 0
		jz	short loc_BCC1D
		jmp	loc_BD722
; ���������������������������������������������������������������������������

loc_BCC1D:				; CODE XREF: ovr209:5C28j
		mov	dword ptr [bp-142h], 0
		mov	byte ptr [bp-13Eh], 2
		mov	byte ptr [bp-13Dh], 0
		mov	dword ptr [bp-13Ch], 0
		mov	dword ptr [bp-0C7Ch], 0
		mov	byte ptr [bp-0C78h], 2
		mov	byte ptr [bp-0C77h], 0
		mov	dword ptr [bp-0C76h], 0
		mov	word ptr [bp-0C80h], 0
		mov	word ptr [bp-0C7Eh], 0FFFFh
		cmp	byte ptr [bp-9], 0
		jz	short loc_BCCA2
		push	3
		lea	ax, [bp-142h]
		push	ax
		push	21h ; '!'
		lea	ax, [bp-404h]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	word_46849
		lea	ax, [bp-0C80h]
		push	ax
		call	MusicChannel_Init_78A4
		add	sp, 4
		push	0
		lea	ax, [bp-142h]
		push	ax
		lea	ax, [bp-0C80h]
		push	ax
		call	MusicChannel_RegisterSequence_7918
		add	sp, 6

loc_BCCA2:				; CODE XREF: ovr209:5C75j
		mov	dword ptr [bp-14Ch], 0
		mov	byte ptr [bp-148h], 2
		mov	byte ptr [bp-147h], 0
		mov	dword ptr [bp-146h], 0
		push	3
		lea	ax, [bp-14Ch]
		push	ax
		push	11h
		lea	ax, [bp-29Ch]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	dword ptr [bp-156h], 0
		mov	byte ptr [bp-152h], 2
		mov	byte ptr [bp-151h], 0
		mov	dword ptr [bp-150h], 0
		push	3
		lea	ax, [bp-156h]
		push	ax
		push	1Dh
		lea	ax, [bp-29Ch]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	dword ptr [bp-160h], 0
		mov	byte ptr [bp-15Ch], 2
		mov	byte ptr [bp-15Bh], 0
		mov	dword ptr [bp-15Ah], 0
		push	3
		lea	ax, [bp-160h]
		push	ax
		push	13h
		lea	ax, [bp-29Ch]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	dword ptr [bp-16Ah], 0
		mov	byte ptr [bp-166h], 2
		mov	byte ptr [bp-165h], 0
		mov	dword ptr [bp-164h], 0
		push	3
		lea	ax, [bp-16Ah]
		push	ax
		push	1Ch
		lea	ax, [bp-29Ch]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	dword ptr [bp-174h], 0
		mov	byte ptr [bp-170h], 2
		mov	byte ptr [bp-16Fh], 0
		mov	dword ptr [bp-16Eh], 0
		push	3
		lea	ax, [bp-174h]
		push	ax
		push	0Ah
		lea	ax, [bp-29Ch]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	dword ptr [bp-17Eh], 0
		mov	byte ptr [bp-17Ah], 2
		mov	byte ptr [bp-179h], 0
		mov	dword ptr [bp-178h], 0
		push	3
		lea	ax, [bp-17Eh]
		push	ax
		push	9
		lea	ax, [bp-29Ch]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		lea	ax, [bp-216h]
		push	ax
		push	0FFh
		push	9
		lea	ax, [bp-0CA2h]
		push	ax
		call	Scene_Create_C55E
		add	sp, 8
		push	21h ; '!'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp-182h], ax
		or	ax, ax
		jz	short loc_BCE46
		push	0FFB0h
		push	0
		lea	ax, [bp-38h]
		push	ax
		push	word ptr [bp-182h]
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	bx, [bp-182h]
		mov	word ptr [bx], 1977h
		mov	bx, [bp-182h]
		mov	word ptr [bx+0Ah], 1997h
		mov	bx, [bp-182h]
		mov	word ptr [bx+1Dh], 0
		mov	bx, [bp-182h]
		mov	word ptr [bx+1Fh], 0
		mov	bx, [bp-182h]
		mov	word ptr [bx+1Dh], 0
		mov	bx, [bp-182h]
		mov	word ptr [bx+1Fh], 0
		mov	ax, [bp-182h]
		jmp	short loc_BCE4A
; ���������������������������������������������������������������������������

loc_BCE46:				; CODE XREF: ovr209:5E05j
		mov	ax, [bp-182h]

loc_BCE4A:				; CODE XREF: ovr209:5E54j
		mov	[bp-180h], ax
		push	21h ; '!'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp-186h], ax
		or	ax, ax
		jz	short loc_BCEB0
		push	0
		push	0
		lea	ax, [bp-160h]
		push	ax
		push	word ptr [bp-186h]
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	bx, [bp-186h]
		mov	word ptr [bx], 1977h
		mov	bx, [bp-186h]
		mov	word ptr [bx+0Ah], 1997h
		mov	bx, [bp-186h]
		mov	word ptr [bx+1Dh], 0
		mov	bx, [bp-186h]
		mov	word ptr [bx+1Fh], 0
		mov	bx, [bp-186h]
		mov	word ptr [bx+1Dh], 0
		mov	bx, [bp-186h]
		mov	word ptr [bx+1Fh], 0
		mov	ax, [bp-186h]
		jmp	short loc_BCEB4
; ���������������������������������������������������������������������������

loc_BCEB0:				; CODE XREF: ovr209:5E6Ej
		mov	ax, [bp-186h]

loc_BCEB4:				; CODE XREF: ovr209:5EBEj
		mov	[bp-184h], ax
		push	21h ; '!'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp-18Ah], ax
		or	ax, ax
		jz	short loc_BCF1A
		push	0FFB0h
		push	0
		lea	ax, [bp-14Ch]
		push	ax
		push	word ptr [bp-18Ah]
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	bx, [bp-18Ah]
		mov	word ptr [bx], 1977h
		mov	bx, [bp-18Ah]
		mov	word ptr [bx+0Ah], 1997h
		mov	bx, [bp-18Ah]
		mov	word ptr [bx+1Dh], 0
		mov	bx, [bp-18Ah]
		mov	word ptr [bx+1Fh], 0
		mov	bx, [bp-18Ah]
		mov	word ptr [bx+1Dh], 0
		mov	bx, [bp-18Ah]
		mov	word ptr [bx+1Fh], 0
		mov	ax, [bp-18Ah]
		jmp	short loc_BCF1E
; ���������������������������������������������������������������������������

loc_BCF1A:				; CODE XREF: ovr209:5ED8j
		mov	ax, [bp-18Ah]

loc_BCF1E:				; CODE XREF: ovr209:5F28j
		mov	[bp-188h], ax
		push	21h ; '!'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp-18Eh], ax
		or	ax, ax
		jz	short loc_BCF84
		push	0
		push	0
		lea	ax, [bp-16Ah]
		push	ax
		push	word ptr [bp-18Eh]
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	bx, [bp-18Eh]
		mov	word ptr [bx], 1977h
		mov	bx, [bp-18Eh]
		mov	word ptr [bx+0Ah], 1997h
		mov	bx, [bp-18Eh]
		mov	word ptr [bx+1Dh], 0
		mov	bx, [bp-18Eh]
		mov	word ptr [bx+1Fh], 0
		mov	bx, [bp-18Eh]
		mov	word ptr [bx+1Dh], 0
		mov	bx, [bp-18Eh]
		mov	word ptr [bx+1Fh], 0
		mov	ax, [bp-18Eh]
		jmp	short loc_BCF88
; ���������������������������������������������������������������������������

loc_BCF84:				; CODE XREF: ovr209:5F42j
		mov	ax, [bp-18Eh]

loc_BCF88:				; CODE XREF: ovr209:5F92j
		mov	[bp-18Ch], ax
		push	21h ; '!'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp-192h], ax
		or	ax, ax
		jz	short loc_BCFEE
		push	0
		push	0
		lea	ax, [bp-156h]
		push	ax
		push	word ptr [bp-192h]
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	bx, [bp-192h]
		mov	word ptr [bx], 1977h
		mov	bx, [bp-192h]
		mov	word ptr [bx+0Ah], 1997h
		mov	bx, [bp-192h]
		mov	word ptr [bx+1Dh], 0
		mov	bx, [bp-192h]
		mov	word ptr [bx+1Fh], 0
		mov	bx, [bp-192h]
		mov	word ptr [bx+1Dh], 0
		mov	bx, [bp-192h]
		mov	word ptr [bx+1Fh], 0
		mov	ax, [bp-192h]
		jmp	short loc_BCFF2
; ���������������������������������������������������������������������������

loc_BCFEE:				; CODE XREF: ovr209:5FACj
		mov	ax, [bp-192h]

loc_BCFF2:				; CODE XREF: ovr209:5FFCj
		mov	[bp-190h], ax
		push	21h ; '!'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp-196h], ax
		or	ax, ax
		jz	short loc_BD058
		push	0
		push	0
		lea	ax, [bp-17Eh]
		push	ax
		push	word ptr [bp-196h]
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	bx, [bp-196h]
		mov	word ptr [bx], 1977h
		mov	bx, [bp-196h]
		mov	word ptr [bx+0Ah], 1997h
		mov	bx, [bp-196h]
		mov	word ptr [bx+1Dh], 0
		mov	bx, [bp-196h]
		mov	word ptr [bx+1Fh], 0
		mov	bx, [bp-196h]
		mov	word ptr [bx+1Dh], 0
		mov	bx, [bp-196h]
		mov	word ptr [bx+1Fh], 0
		mov	ax, [bp-196h]
		jmp	short loc_BD05C
; ���������������������������������������������������������������������������

loc_BD058:				; CODE XREF: ovr209:6016j
		mov	ax, [bp-196h]

loc_BD05C:				; CODE XREF: ovr209:6066j
		mov	[bp-194h], ax
		push	2
		push	0
		push	0
		push	0
		push	0
		lea	ax, [bp-60h]
		push	ax
		push	0
		call	MovingOverlayLayer_Construct_A837
		add	sp, 0Eh
		mov	[bp-198h], ax
		push	21h ; '!'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp-19Ch], ax
		or	ax, ax
		jz	short loc_BD0DE
		push	0
		push	0
		lea	ax, [bp-174h]
		push	ax
		push	word ptr [bp-19Ch]
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	bx, [bp-19Ch]
		mov	word ptr [bx], 1977h
		mov	bx, [bp-19Ch]
		mov	word ptr [bx+0Ah], 1997h
		mov	bx, [bp-19Ch]
		mov	word ptr [bx+1Dh], 0
		mov	bx, [bp-19Ch]
		mov	word ptr [bx+1Fh], 0
		mov	bx, [bp-19Ch]
		mov	word ptr [bx+1Dh], 0
		mov	bx, [bp-19Ch]
		mov	word ptr [bx+1Fh], 0
		mov	ax, [bp-19Ch]
		jmp	short loc_BD0E2
; ���������������������������������������������������������������������������

loc_BD0DE:				; CODE XREF: ovr209:609Cj
		mov	ax, [bp-19Ch]

loc_BD0E2:				; CODE XREF: ovr209:60ECj
		mov	[bp-19Ah], ax
		push	word ptr [bp-70h]
		mov	al, [bp-6Eh]
		push	ax
		lea	ax, [bp-70h]
		push	ax
		lea	ax, [bp-16h]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	word ptr [bp-0B0h]
		mov	al, [bp-0AEh]
		push	ax
		lea	ax, [bp-0B0h]
		push	ax
		lea	ax, [bp-16h]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	word ptr [bp-0C0h]
		mov	al, [bp-0BEh]
		push	ax
		lea	ax, [bp-0C0h]
		push	ax
		lea	ax, [bp-16h]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	word ptr [bp-180h]
		lea	ax, [bp-0CA2h]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp-184h]
		lea	ax, [bp-0CA2h]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp-18Ch]
		lea	ax, [bp-0CA2h]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp-190h]
		lea	ax, [bp-0CA2h]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp-194h]
		lea	ax, [bp-0CA2h]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp-198h]
		lea	ax, [bp-0CA2h]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp-19Ah]
		lea	ax, [bp-0CA2h]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	word ptr [bp-188h]
		lea	ax, [bp-0CA2h]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		push	0
		push	word ptr [bp-16h]
		mov	al, [bp-14h]
		push	ax
		lea	ax, [bp-16h]
		push	ax
		call	Palette_Upload_2CDE1
		add	sp, 8
		mov	word ptr [bp-19Eh], 0
		mov	word ptr [bp-1A0h], 0
		jmp	loc_BD4D8
; ���������������������������������������������������������������������������

loc_BD1EB:				; CODE XREF: ovr209:6504j
		mov	ax, [bp-0C85h]
		mov	[bp-1A2h], ax
		cmp	word ptr [bp-1A2h], 8
		jle	short loc_BD218
		cmp	word ptr [bp-1A2h], 0Eh
		jge	short loc_BD218
		mov	ax, [bp-1A0h]
		mov	[bp-1A4h], ax
		inc	word ptr [bp-1A0h]
		mov	bx, [bp-194h]
		mov	ax, [bp-1A4h]
		mov	[bx+1Bh], ax

loc_BD218:				; CODE XREF: ovr209:6208j ovr209:620Fj
		cmp	word ptr [bp-1A2h], 14h
		jz	short loc_BD222
		jmp	loc_BD2B2
; ���������������������������������������������������������������������������

loc_BD222:				; CODE XREF: ovr209:622Dj
		mov	bx, [bp-180h]
		mov	word ptr [bx+1Dh], 0
		mov	bx, [bp-180h]
		mov	word ptr [bx+1Fh], 1
		mov	bx, [bp-184h]
		mov	word ptr [bx+1Dh], 0
		mov	bx, [bp-184h]
		mov	word ptr [bx+1Fh], 1
		mov	bx, [bp-188h]
		mov	word ptr [bx+1Dh], 0
		mov	bx, [bp-188h]
		mov	word ptr [bx+1Fh], 1
		mov	bx, [bp-18Ch]
		mov	word ptr [bx+1Dh], 0
		mov	bx, [bp-18Ch]
		mov	word ptr [bx+1Fh], 2
		mov	bx, [bp-190h]
		mov	word ptr [bx+1Dh], 0
		mov	bx, [bp-190h]
		mov	word ptr [bx+1Fh], 3
		mov	bx, [bp-194h]
		mov	word ptr [bx+1Dh], 0
		mov	bx, [bp-194h]
		mov	word ptr [bx+1Fh], 3
		mov	bx, [bp-198h]
		mov	word ptr [bx+1Dh], 0
		mov	bx, [bp-198h]
		mov	word ptr [bx+1Fh], 3
		mov	bx, [bp-19Ah]
		mov	word ptr [bx+1Dh], 0
		mov	bx, [bp-19Ah]
		mov	word ptr [bx+1Fh], 4

loc_BD2B2:				; CODE XREF: ovr209:622Fj
		cmp	word ptr [bp-1A2h], 64h	; 'd'
		jnz	short loc_BD301
		mov	bx, [bp-180h]
		mov	word ptr [bx+1Dh], 0
		mov	bx, [bp-180h]
		mov	word ptr [bx+1Fh], 0
		mov	bx, [bp-184h]
		mov	word ptr [bx+1Dh], 0
		mov	bx, [bp-184h]
		mov	word ptr [bx+1Fh], 0
		mov	bx, [bp-188h]
		mov	word ptr [bx+1Dh], 0
		mov	bx, [bp-188h]
		mov	word ptr [bx+1Fh], 0
		mov	bx, [bp-18Ch]
		mov	word ptr [bx+1Dh], 0
		mov	bx, [bp-18Ch]
		mov	word ptr [bx+1Fh], 0

loc_BD301:				; CODE XREF: ovr209:62C7j
		cmp	word ptr [bp-1A2h], 50h	; 'P'
		jnz	short loc_BD32C
		mov	bx, [bp-190h]
		mov	word ptr [bx+1Dh], 0
		mov	bx, [bp-190h]
		mov	word ptr [bx+1Fh], 0
		mov	bx, [bp-194h]
		mov	word ptr [bx+1Dh], 0
		mov	bx, [bp-194h]
		mov	word ptr [bx+1Fh], 0

loc_BD32C:				; CODE XREF: ovr209:6316j
		cmp	word ptr [bp-1A2h], 3Ch	; '<'
		jnz	short loc_BD357
		mov	bx, [bp-198h]
		mov	word ptr [bx+1Dh], 0
		mov	bx, [bp-198h]
		mov	word ptr [bx+1Fh], 0
		mov	bx, [bp-19Ah]
		mov	word ptr [bx+1Dh], 0
		mov	bx, [bp-19Ah]
		mov	word ptr [bx+1Fh], 0

loc_BD357:				; CODE XREF: ovr209:6341j
		cmp	word ptr [bp-19Eh], 52h	; 'R'
		jnz	short loc_BD38D
		inc	word ptr [bp-19Eh]
		push	word ptr [bp-188h]
		lea	ax, [bp-0CA2h]
		push	ax
		call	LayerGroup_Remove_2DBC1
		add	sp, 4
		cmp	word ptr [bp-188h], 0
		jz	short loc_BD38D
		push	3
		push	word ptr [bp-188h]
		mov	bx, [bp-188h]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short $+2

loc_BD38D:				; CODE XREF: ovr209:636Cj ovr209:6388j
		cmp	word ptr [bp-1A2h], 63h	; 'c'
		jnz	short loc_BD3A3
		push	0Ch
		lea	ax, [bp-0CA2h]
		push	ax
		call	Scene_SetFps_2DE27
		add	sp, 4

loc_BD3A3:				; CODE XREF: ovr209:63A2j
		cmp	word ptr [bp-1A2h], 63h	; 'c'
		jle	short loc_BD3C8
		cmp	word ptr [bp-19Eh], 52h	; 'R'
		jge	short loc_BD3C8
		mov	ax, [bp-19Eh]
		mov	[bp-1A6h], ax
		inc	word ptr [bp-19Eh]
		mov	bx, [bp-188h]
		mov	ax, [bp-1A6h]
		mov	[bx+1Bh], ax

loc_BD3C8:				; CODE XREF: ovr209:63B8j ovr209:63BFj
		cmp	word ptr [bp-1A2h], 6Ch	; 'l'
		jnz	short loc_BD419
		cmp	byte ptr [bp-9], 0
		jz	short loc_BD419
		mov	ax, word_48EE4
		mov	[bp-1A8h], ax
		mov	word ptr [bp-1AAh], 0
		cmp	word ptr [bp-0C80h], 0
		jz	short loc_BD419
		push	word ptr [bp-0C7Eh]
		mov	bx, [bp-0C80h]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	word ptr [bp-1AAh]
		push	word ptr [bp-1A8h]
		push	word ptr [bp-0C7Eh]
		mov	bx, [bp-0C80h]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_BD419:				; CODE XREF: ovr209:63DDj ovr209:63E3j ...
		cmp	word ptr [bp-1A2h], 76h	; 'v'
		jnz	short loc_BD46A
		cmp	byte ptr [bp-9], 0
		jz	short loc_BD46A
		mov	ax, word_48EE4
		mov	[bp-1ACh], ax
		mov	word ptr [bp-1AEh], 0
		cmp	word ptr [bp-0C80h], 0
		jz	short loc_BD46A
		push	word ptr [bp-0C7Eh]
		mov	bx, [bp-0C80h]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	word ptr [bp-1AEh]
		push	word ptr [bp-1ACh]
		push	word ptr [bp-0C7Eh]
		mov	bx, [bp-0C80h]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_BD46A:				; CODE XREF: ovr209:642Ej ovr209:6434j ...
		cmp	word ptr [bp-19Eh], 4Bh	; 'K'
		jnz	short loc_BD4BE
		cmp	byte ptr [bp-9], 0
		jz	short loc_BD4BE
		mov	ax, word_48EE4
		add	ax, 0FFC4h
		mov	[bp-1B0h], ax
		mov	word ptr [bp-1B2h], 0
		cmp	word ptr [bp-0C80h], 0
		jz	short loc_BD4BE
		push	word ptr [bp-0C7Eh]
		mov	bx, [bp-0C80h]
		push	word ptr [bx+4]
		call	AIL_start_sequence_30C42
		add	sp, 4
		push	word ptr [bp-1B2h]
		push	word ptr [bp-1B0h]
		push	word ptr [bp-0C7Eh]
		mov	bx, [bp-0C80h]
		push	word ptr [bx+4]
		call	AIL_set_relative_volume_30C66
		add	sp, 8
		jmp	short $+2

loc_BD4BE:				; CODE XREF: ovr209:647Fj ovr209:6485j ...
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_BD4CB
		jmp	short loc_BD4CB
; ���������������������������������������������������������������������������
		jmp	short loc_BD4F7
; ���������������������������������������������������������������������������

loc_BD4CB:				; CODE XREF: ovr209:64D5j ovr209:64D7j
		lea	ax, [bp-0CA2h]
		push	ax
		call	Scene_Tick_C652
		add	sp, 2

loc_BD4D8:				; CODE XREF: ovr209:61F8j
		cmp	word ptr [bp-0C85h], 0B9h ; '�'
		jnb	short loc_BD4E7
		cmp	byte ptr [bp-0C83h], 0
		jz	short loc_BD4EC

loc_BD4E7:				; CODE XREF: ovr209:64EEj
		mov	ax, 1
		jmp	short loc_BD4EE
; ���������������������������������������������������������������������������

loc_BD4EC:				; CODE XREF: ovr209:64F5j
		xor	ax, ax

loc_BD4EE:				; CODE XREF: ovr209:64FAj
		mov	ah, 0
		or	ax, ax
		jnz	short loc_BD4F7
		jmp	loc_BD1EB
; ���������������������������������������������������������������������������

loc_BD4F7:				; CODE XREF: ovr209:64D9j ovr209:6502j
		push	0
		lea	ax, [bp-0CA2h]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		cmp	byte ptr [bp-179h], 0
		jz	short loc_BD52E
		cmp	dword ptr [bp-17Eh], 0
		jz	short loc_BD52E
		push	0
		mov	al, [bp-17Ah]
		push	ax
		lea	ax, [bp-17Eh]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_BD52E:				; CODE XREF: ovr209:651Bj ovr209:6523j
		mov	dword ptr [bp-17Eh], 0
		mov	byte ptr [bp-179h], 0
		mov	dword ptr [bp-178h], 0
		cmp	byte ptr [bp-16Fh], 0
		jz	short loc_BD56D
		cmp	dword ptr [bp-174h], 0
		jz	short loc_BD56D
		push	0
		mov	al, [bp-170h]
		push	ax
		lea	ax, [bp-174h]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_BD56D:				; CODE XREF: ovr209:655Aj ovr209:6562j
		mov	dword ptr [bp-174h], 0
		mov	byte ptr [bp-16Fh], 0
		mov	dword ptr [bp-16Eh], 0
		cmp	byte ptr [bp-165h], 0
		jz	short loc_BD5AC
		cmp	dword ptr [bp-16Ah], 0
		jz	short loc_BD5AC
		push	0
		mov	al, [bp-166h]
		push	ax
		lea	ax, [bp-16Ah]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_BD5AC:				; CODE XREF: ovr209:6599j ovr209:65A1j
		mov	dword ptr [bp-16Ah], 0
		mov	byte ptr [bp-165h], 0
		mov	dword ptr [bp-164h], 0
		cmp	byte ptr [bp-15Bh], 0
		jz	short loc_BD5EB
		cmp	dword ptr [bp-160h], 0
		jz	short loc_BD5EB
		push	0
		mov	al, [bp-15Ch]
		push	ax
		lea	ax, [bp-160h]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_BD5EB:				; CODE XREF: ovr209:65D8j ovr209:65E0j
		mov	dword ptr [bp-160h], 0
		mov	byte ptr [bp-15Bh], 0
		mov	dword ptr [bp-15Ah], 0
		cmp	byte ptr [bp-151h], 0
		jz	short loc_BD62A
		cmp	dword ptr [bp-156h], 0
		jz	short loc_BD62A
		push	0
		mov	al, [bp-152h]
		push	ax
		lea	ax, [bp-156h]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_BD62A:				; CODE XREF: ovr209:6617j ovr209:661Fj
		mov	dword ptr [bp-156h], 0
		mov	byte ptr [bp-151h], 0
		mov	dword ptr [bp-150h], 0
		cmp	byte ptr [bp-147h], 0
		jz	short loc_BD669
		cmp	dword ptr [bp-14Ch], 0
		jz	short loc_BD669
		push	0
		mov	al, [bp-148h]
		push	ax
		lea	ax, [bp-14Ch]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_BD669:				; CODE XREF: ovr209:6656j ovr209:665Ej
		mov	dword ptr [bp-14Ch], 0
		mov	byte ptr [bp-147h], 0
		mov	dword ptr [bp-146h], 0
		lea	ax, [bp-0C80h]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	byte ptr [bp-0C77h], 0
		jz	short loc_BD6B5
		cmp	dword ptr [bp-0C7Ch], 0
		jz	short loc_BD6B5
		push	0
		mov	al, [bp-0C78h]
		push	ax
		lea	ax, [bp-0C7Ch]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_BD6B5:				; CODE XREF: ovr209:66A2j ovr209:66AAj
		mov	dword ptr [bp-0C7Ch], 0
		mov	byte ptr [bp-0C77h], 0
		mov	dword ptr [bp-0C76h], 0
		cmp	byte ptr [bp-13Dh], 0
		jz	short loc_BD6F4
		cmp	dword ptr [bp-142h], 0
		jz	short loc_BD6F4
		push	0
		mov	al, [bp-13Eh]
		push	ax
		lea	ax, [bp-142h]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_BD6F4:				; CODE XREF: ovr209:66E1j ovr209:66E9j
		mov	dword ptr [bp-142h], 0
		mov	byte ptr [bp-13Dh], 0
		mov	dword ptr [bp-13Ch], 0
		push	100h
		push	0
		push	2
		lea	ax, [bp-1Ah]
		push	ax
		lea	ax, [bp-16h]
		push	ax
		call	Palette_FadeToColor_2D09C
		add	sp, 0Ah

loc_BD722:				; CODE XREF: ovr209:0F86j ovr209:1403j ...
		lea	ax, [bp-0C70h]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp-0C50h]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_313D6
		add	sp, 4
		cmp	byte ptr [bp-11Bh], 0
		jz	short loc_BD766
		cmp	dword ptr [bp-120h], 0
		jz	short loc_BD766
		push	0
		mov	al, [bp-11Ch]
		push	ax
		lea	ax, [bp-120h]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_BD766:				; CODE XREF: ovr209:6753j ovr209:675Bj
		mov	dword ptr [bp-120h], 0
		mov	byte ptr [bp-11Bh], 0
		mov	dword ptr [bp-11Ah], 0
		cmp	byte ptr [bp-111h], 0
		jz	short loc_BD7A5
		cmp	dword ptr [bp-116h], 0
		jz	short loc_BD7A5
		push	0
		mov	al, [bp-112h]
		push	ax
		lea	ax, [bp-116h]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_BD7A5:				; CODE XREF: ovr209:6792j ovr209:679Aj
		mov	dword ptr [bp-116h], 0
		mov	byte ptr [bp-111h], 0
		mov	dword ptr [bp-110h], 0
		cmp	byte ptr [bp-107h], 0
		jz	short loc_BD7E4
		cmp	dword ptr [bp-10Ch], 0
		jz	short loc_BD7E4
		push	0
		mov	al, [bp-108h]
		push	ax
		lea	ax, [bp-10Ch]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_BD7E4:				; CODE XREF: ovr209:67D1j ovr209:67D9j
		mov	dword ptr [bp-10Ch], 0
		mov	byte ptr [bp-107h], 0
		mov	dword ptr [bp-106h], 0
		cmp	byte ptr [bp-0FDh], 0
		jz	short loc_BD823
		cmp	dword ptr [bp-102h], 0
		jz	short loc_BD823
		push	0
		mov	al, [bp-0FEh]
		push	ax
		lea	ax, [bp-102h]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_BD823:				; CODE XREF: ovr209:6810j ovr209:6818j
		mov	dword ptr [bp-102h], 0
		mov	byte ptr [bp-0FDh], 0
		mov	dword ptr [bp-0FCh], 0
		cmp	byte ptr [bp-0F3h], 0
		jz	short loc_BD862
		cmp	dword ptr [bp-0F8h], 0
		jz	short loc_BD862
		push	0
		mov	al, [bp-0F4h]
		push	ax
		lea	ax, [bp-0F8h]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_BD862:				; CODE XREF: ovr209:684Fj ovr209:6857j
		mov	dword ptr [bp-0F8h], 0
		mov	byte ptr [bp-0F3h], 0
		mov	dword ptr [bp-0F2h], 0
		cmp	byte ptr [bp-0E9h], 0
		jz	short loc_BD8A1
		cmp	dword ptr [bp-0EEh], 0
		jz	short loc_BD8A1
		push	0
		mov	al, [bp-0EAh]
		push	ax
		lea	ax, [bp-0EEh]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_BD8A1:				; CODE XREF: ovr209:688Ej ovr209:6896j
		mov	dword ptr [bp-0EEh], 0
		mov	byte ptr [bp-0E9h], 0
		mov	dword ptr [bp-0E8h], 0
		cmp	byte ptr [bp-0DFh], 0
		jz	short loc_BD8E0
		cmp	dword ptr [bp-0E4h], 0
		jz	short loc_BD8E0
		push	0
		mov	al, [bp-0E0h]
		push	ax
		lea	ax, [bp-0E4h]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_BD8E0:				; CODE XREF: ovr209:68CDj ovr209:68D5j
		mov	dword ptr [bp-0E4h], 0
		mov	byte ptr [bp-0DFh], 0
		mov	dword ptr [bp-0DEh], 0
		cmp	byte ptr [bp-0D5h], 0
		jz	short loc_BD91F
		cmp	dword ptr [bp-0DAh], 0
		jz	short loc_BD91F
		push	0
		mov	al, [bp-0D6h]
		push	ax
		lea	ax, [bp-0DAh]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_BD91F:				; CODE XREF: ovr209:690Cj ovr209:6914j
		mov	dword ptr [bp-0DAh], 0
		mov	byte ptr [bp-0D5h], 0
		mov	dword ptr [bp-0D4h], 0
		push	2
		lea	ax, [bp-0D0h]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	byte ptr [bp-0C5h], 0
		jz	short loc_BD96D
		cmp	dword ptr [bp-0CAh], 0
		jz	short loc_BD96D
		push	0
		mov	al, [bp-0C6h]
		push	ax
		lea	ax, [bp-0CAh]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_BD96D:				; CODE XREF: ovr209:695Aj ovr209:6962j
		mov	dword ptr [bp-0CAh], 0
		mov	byte ptr [bp-0C5h], 0
		mov	dword ptr [bp-0C4h], 0
		push	2
		lea	ax, [bp-0C0h]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	byte ptr [bp-0B5h], 0
		jz	short loc_BD9BB
		cmp	dword ptr [bp-0BAh], 0
		jz	short loc_BD9BB
		push	0
		mov	al, [bp-0B6h]
		push	ax
		lea	ax, [bp-0BAh]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_BD9BB:				; CODE XREF: ovr209:69A8j ovr209:69B0j
		mov	dword ptr [bp-0BAh], 0
		mov	byte ptr [bp-0B5h], 0
		mov	dword ptr [bp-0B4h], 0
		push	2
		lea	ax, [bp-0B0h]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	byte ptr [bp-0A5h], 0
		jz	short loc_BDA09
		cmp	dword ptr [bp-0AAh], 0
		jz	short loc_BDA09
		push	0
		mov	al, [bp-0A6h]
		push	ax
		lea	ax, [bp-0AAh]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_BDA09:				; CODE XREF: ovr209:69F6j ovr209:69FEj
		mov	dword ptr [bp-0AAh], 0
		mov	byte ptr [bp-0A5h], 0
		mov	dword ptr [bp-0A4h], 0
		push	2
		lea	ax, [bp-0A0h]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	byte ptr [bp-95h], 0
		jz	short loc_BDA57
		cmp	dword ptr [bp-9Ah], 0
		jz	short loc_BDA57
		push	0
		mov	al, [bp-96h]
		push	ax
		lea	ax, [bp-9Ah]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_BDA57:				; CODE XREF: ovr209:6A44j ovr209:6A4Cj
		mov	dword ptr [bp-9Ah], 0
		mov	byte ptr [bp-95h], 0
		mov	dword ptr [bp-94h], 0
		push	2
		lea	ax, [bp-90h]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	byte ptr [bp-85h], 0
		jz	short loc_BDAA5
		cmp	dword ptr [bp-8Ah], 0
		jz	short loc_BDAA5
		push	0
		mov	al, [bp-86h]
		push	ax
		lea	ax, [bp-8Ah]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_BDAA5:				; CODE XREF: ovr209:6A92j ovr209:6A9Aj
		mov	dword ptr [bp-8Ah], 0
		mov	byte ptr [bp-85h], 0
		mov	dword ptr [bp-84h], 0
		push	2
		lea	ax, [bp-80h]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	byte ptr [bp-75h], 0
		jz	short loc_BDAEE
		cmp	dword ptr [bp-7Ah], 0
		jz	short loc_BDAEE
		push	0
		mov	al, [bp-76h]
		push	ax
		lea	ax, [bp-7Ah]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_BDAEE:				; CODE XREF: ovr209:6ADEj ovr209:6AE5j
		mov	dword ptr [bp-7Ah], 0
		mov	byte ptr [bp-75h], 0
		mov	dword ptr [bp-74h], 0
		push	2
		lea	ax, [bp-70h]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	byte ptr [bp-65h], 0
		jz	short loc_BDB34
		cmp	dword ptr [bp-6Ah], 0
		jz	short loc_BDB34
		push	0
		mov	al, [bp-66h]
		push	ax
		lea	ax, [bp-6Ah]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_BDB34:				; CODE XREF: ovr209:6B24j ovr209:6B2Bj
		mov	dword ptr [bp-6Ah], 0
		mov	byte ptr [bp-65h], 0
		mov	dword ptr [bp-64h], 0
		cmp	byte ptr [bp-5Bh], 0
		jz	short loc_BDB6C
		cmp	dword ptr [bp-60h], 0
		jz	short loc_BDB6C
		push	0
		mov	al, [bp-5Ch]
		push	ax
		lea	ax, [bp-60h]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_BDB6C:				; CODE XREF: ovr209:6B5Cj ovr209:6B63j
		mov	dword ptr [bp-60h], 0
		mov	byte ptr [bp-5Bh], 0
		mov	dword ptr [bp-5Ah], 0
		cmp	byte ptr [bp-51h], 0
		jz	short loc_BDBA4
		cmp	dword ptr [bp-56h], 0
		jz	short loc_BDBA4
		push	0
		mov	al, [bp-52h]
		push	ax
		lea	ax, [bp-56h]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_BDBA4:				; CODE XREF: ovr209:6B94j ovr209:6B9Bj
		mov	dword ptr [bp-56h], 0
		mov	byte ptr [bp-51h], 0
		mov	dword ptr [bp-50h], 0
		cmp	byte ptr [bp-47h], 0
		jz	short loc_BDBDC
		cmp	dword ptr [bp-4Ch], 0
		jz	short loc_BDBDC
		push	0
		mov	al, [bp-48h]
		push	ax
		lea	ax, [bp-4Ch]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_BDBDC:				; CODE XREF: ovr209:6BCCj ovr209:6BD3j
		mov	dword ptr [bp-4Ch], 0
		mov	byte ptr [bp-47h], 0
		mov	dword ptr [bp-46h], 0
		cmp	byte ptr [bp-3Dh], 0
		jz	short loc_BDC14
		cmp	dword ptr [bp-42h], 0
		jz	short loc_BDC14
		push	0
		mov	al, [bp-3Eh]
		push	ax
		lea	ax, [bp-42h]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_BDC14:				; CODE XREF: ovr209:6C04j ovr209:6C0Bj
		mov	dword ptr [bp-42h], 0
		mov	byte ptr [bp-3Dh], 0
		mov	dword ptr [bp-3Ch], 0
		cmp	byte ptr [bp-33h], 0
		jz	short loc_BDC4C
		cmp	dword ptr [bp-38h], 0
		jz	short loc_BDC4C
		push	0
		mov	al, [bp-34h]
		push	ax
		lea	ax, [bp-38h]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_BDC4C:				; CODE XREF: ovr209:6C3Cj ovr209:6C43j
		mov	dword ptr [bp-38h], 0
		mov	byte ptr [bp-33h], 0
		mov	dword ptr [bp-32h], 0
		mov	word ptr [bp-0C38h], 185Fh
		lea	ax, [bp-0C38h]
		push	ax
		call	VoicePlayer_Stop_7B5A
		add	sp, 2
		cmp	byte ptr [bp-0C23h], 0
		jz	short loc_BDC9B
		cmp	dword ptr [bp-0C28h], 0
		jz	short loc_BDC9B
		push	0
		mov	al, [bp-0C24h]
		push	ax
		lea	ax, [bp-0C28h]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_BDC9B:				; CODE XREF: ovr209:6C88j ovr209:6C90j
		mov	dword ptr [bp-0C28h], 0
		mov	byte ptr [bp-0C23h], 0
		mov	dword ptr [bp-0C22h], 0
		lea	ax, [bp-412h]
		push	ax
		call	Music_ChannelStopSequence_783A
		add	sp, 2
		cmp	byte ptr [bp-409h], 0
		jz	short loc_BDCE7
		cmp	dword ptr [bp-40Eh], 0
		jz	short loc_BDCE7
		push	0
		mov	al, [bp-40Ah]
		push	ax
		lea	ax, [bp-40Eh]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_BDCE7:				; CODE XREF: ovr209:6CD4j ovr209:6CDCj
		mov	dword ptr [bp-40Eh], 0
		mov	byte ptr [bp-409h], 0
		mov	dword ptr [bp-408h], 0
		push	2
		lea	ax, [bp-404h]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		cmp	byte ptr [bp-1Fh], 0
		jz	short loc_BDD31
		cmp	dword ptr [bp-24h], 0
		jz	short loc_BDD31
		push	0
		mov	al, [bp-20h]
		push	ax
		lea	ax, [bp-24h]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_BDD31:				; CODE XREF: ovr209:6D21j ovr209:6D28j
		mov	dword ptr [bp-24h], 0
		mov	byte ptr [bp-1Fh], 0
		mov	dword ptr [bp-1Eh], 0
		push	2
		lea	ax, [bp-38Ch]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp-314h]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp-29Ch]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	0
		lea	ax, [bp-16h]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp-10h]
		push	ax
		call	SmallObject_UnregisterFromList_2CB7A
		add	sp, 4
		lea	ax, [bp-224h]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		lea	ax, [bp-216h]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp-6]
		push	ax
		call	TextArray_Destruct_CC03
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
ovr209		ends
