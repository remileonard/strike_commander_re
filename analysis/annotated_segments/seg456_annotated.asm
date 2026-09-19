seg456		segment	para public 'OVERLAY' use16
		assume cs:seg456
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle MissionScenario_ResolveFieldChain_A8BD1.
; ==============================================================================================
MissionScenario_QueryFieldWrapper_A7FF0	proc far		; CODE XREF: VROOMM_StubThunk_6CE1AJ

arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		cmp	byte_6E4D5, 0
		jz	short loc_A8012
		push	word_706A0
		nop
		push	cs
		call	near ptr MissionScenario_ResolveFieldChain_A8BD1
		pop	cx
		cmp	dx, word ptr [bp+arg_0+2]
		jnz	short loc_A8012
		cmp	ax, word ptr [bp+arg_0]
		jnz	short loc_A8012
		mov	al, 1
		jmp	short loc_A8047
; ���������������������������������������������������������������������������

loc_A8012:				; CODE XREF: MissionScenario_QueryFieldWrapper_A7FF0+8j
					; MissionScenario_QueryFieldWrapper_A7FF0+17j ...
		les	bx, [bp+arg_0]
		cmp	dword ptr es:[bx+1Dh], 0
		jz	short loc_A8045
		cmp	word ptr es:[bx+52h], 0
		jz	short loc_A8029
		mov	ax, 1
		jmp	short loc_A802B
; ���������������������������������������������������������������������������

loc_A8029:				; CODE XREF: MissionScenario_QueryFieldWrapper_A7FF0+32j
		xor	ax, ax

loc_A802B:				; CODE XREF: MissionScenario_QueryFieldWrapper_A7FF0+37j
		or	ax, ax
		jz	short loc_A8045

loc_A802F:
		les	bx, [bp+arg_0]

loc_A8032:
		mov	al, es:[bx+39h]

loc_A8036:
		shl	ax, 0Ah

loc_A8039:
		sar	ax, 0Fh
		or	ax, ax

loc_A803E:
		jnz	short loc_A8045
		mov	ax, 1

loc_A8043:
		jmp	short loc_A8047
; ���������������������������������������������������������������������������

loc_A8045:				; CODE XREF: MissionScenario_QueryFieldWrapper_A7FF0+2Bj
					; MissionScenario_QueryFieldWrapper_A7FF0+3Dj ...
		xor	ax, ax

loc_A8047:				; CODE XREF: MissionScenario_QueryFieldWrapper_A7FF0+20j
					; MissionScenario_QueryFieldWrapper_A7FF0:loc_A8043j
		pop	bp
		retf
MissionScenario_QueryFieldWrapper_A7FF0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 105 lignes, NON DÉTAILLÉE — appelle MissionScenario_ConstructFieldChain_A8124,
; sub_6C018, Memory_TypedFree_5C7B6, libère l'objet (sub_338) et une série de stubs voisins
; (sub_6CEA4/6CEB8) — destructeur d'un ensemble de champs de scénario de mission.
; ==============================================================================================
MissionScenario_ReleaseAllFields_A8049	proc far		; CODE XREF: VROOMM_StubThunk_6CE4CJ

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jnz	short loc_A805B
		jmp	loc_A8120
; ���������������������������������������������������������������������������

loc_A805B:				; CODE XREF: MissionScenario_ReleaseAllFields_A8049+Dj
		push	si
		nop
		push	cs
		call	near ptr MissionScenario_ConstructFieldChain_A8124
		pop	cx
		push	571Ch
		call	VROOMM_StubThunk_6C018
		pop	cx
		mov	word_706A0, 0

loc_A8071:
		mov	word ptr [si+0B1h], 0
		push	0
		push	2
		mov	ax, si
		add	ax, 0D3h ; '�'
		push	ax

loc_A8081:
		push	5C44h

loc_A8084:
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		mov	dword ptr [si+0D3h], 0
		mov	byte ptr [si+6Eh], 0
		push	word ptr [si+68h]
		call	CRT_FreeNear_Wrap
		pop	cx
		mov	word ptr [si+68h], 0
		mov	ax, si
		add	ax, 48h	; 'H'
		push	ax
		call	VROOMM_StubThunk_6CEA4
		pop	cx
		mov	ax, si
		add	ax, 40h	; '@'
		push	ax
		call	VROOMM_StubThunk_6CEB8
		pop	cx
		mov	ax, si
		add	ax, 3Ah	; ':'
		push	ax
		call	VROOMM_StubThunk_6CF5D
		pop	cx
		mov	ax, si
		add	ax, 34h	; '4'
		push	ax
		call	VROOMM_StubThunk_6CF3A
		pop	cx
		mov	ax, si
		add	ax, 2Eh	; '.'
		push	ax
		call	VROOMM_StubThunk_6CF12
		pop	cx
		mov	ax, si
		add	ax, 28h	; '('
		push	ax
		call	VROOMM_StubThunk_6CF08
		pop	cx
		mov	ax, si
		add	ax, 24h	; '$'
		push	ax
		call	VROOMM_StubThunk_6CEF9
		pop	cx
		mov	ax, si
		add	ax, 1Eh
		push	ax
		call	VROOMM_StubThunk_6CEEA
		pop	cx
		mov	ax, si
		add	ax, 1Ah
		push	ax
		call	VROOMM_StubThunk_6CEDB
		pop	cx
		test	di, 1
		jz	short loc_A8120
		push	si
		call	CRT_FreeNear_Wrap
		pop	cx

loc_A8120:				; CODE XREF: MissionScenario_ReleaseAllFields_A8049+Fj
					; MissionScenario_ReleaseAllFields_A8049+CEj
		pop	di
		pop	si
		pop	bp
		retf
MissionScenario_ReleaseAllFields_A8049	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 88 lignes, NON DÉTAILLÉE — construit une chaîne de champs via une série de stubs
; voisins (sub_6CEDB/6CEEA/6CEF9/6CF08/6CF12/6CF3A).
; ==============================================================================================
MissionScenario_ConstructFieldChain_A8124	proc far		; CODE XREF: VROOMM_StubThunk_6CE38J MissionScenario_ReleaseAllFields_A8049+15p	...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, si
		add	ax, 1Ah
		push	ax

loc_A8131:
		call	VROOMM_StubThunk_6CEDB
		pop	cx
		mov	ax, si
		add	ax, 1Eh
		push	ax
		call	VROOMM_StubThunk_6CEEA
		pop	cx
		mov	ax, si
		add	ax, 24h	; '$'
		push	ax
		call	VROOMM_StubThunk_6CEF9
		pop	cx
		mov	ax, si
		add	ax, 28h	; '('
		push	ax
		call	VROOMM_StubThunk_6CF08
		pop	cx
		mov	ax, si
		add	ax, 2Eh	; '.'
		push	ax
		call	VROOMM_StubThunk_6CF12
		pop	cx
		mov	ax, si
		add	ax, 34h	; '4'
		push	ax
		call	VROOMM_StubThunk_6CF3A
		pop	cx

loc_A8173:
		mov	ax, si

loc_A8175:
		add	ax, 3Ah	; ':'

loc_A8178:
		push	ax
		call	VROOMM_StubThunk_6CF5D

loc_A817E:
		pop	cx
		mov	ax, si

loc_A8181:
		add	ax, 40h	; '@'
		push	ax
		call	VROOMM_StubThunk_6CEB8
		pop	cx
		mov	ax, si
		add	ax, 48h	; 'H'
		push	ax
		call	VROOMM_StubThunk_6CEA4
		pop	cx
		mov	word ptr [si+0B1h], 0
		push	0
		push	2
		mov	ax, si
		add	ax, 0D3h ; '�'
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		mov	dword ptr [si+0D3h], 0
		mov	byte ptr [si+6Eh], 0
		push	word ptr [si+68h]
		call	CRT_FreeNear_Wrap
		pop	cx
		mov	word ptr [si+68h], 0
		xor	ax, ax
		mov	[si+50h], ax
		mov	[si+4Eh], ax
		mov	dword ptr [si+54h], 0
		pop	si
		pop	bp
		retf
MissionScenario_ConstructFieldChain_A8124	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine sub_6CDC3, MissionScenario_ConstructFieldChain_A8124,
; Widget_ApplyLayoutHelper_5A88F (seg125), MissionScenario_LoadFromIFF_A8C44,
; PagedResourceB_Helper_5D859 (seg138) — construction et liaison à l'interface d'un scénario
; de mission chargé.
; ==============================================================================================
MissionScenario_ConstructAndBindUI_A81E0	proc far		; CODE XREF: VROOMM_StubThunk_6CE3DJ

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		call	VROOMM_StubThunk_6CDC3
		push	si
		push	cs
		call	near ptr MissionScenario_ConstructFieldChain_A8124
		pop	cx
		call	Widget_ApplyLayoutHelper_5A88F
		cmp	byte_7070E, 0
		jz	short loc_A8207
		push	si
		nop
		push	cs
		call	near ptr MissionScenario_LoadFromIFF_A8C44
		pop	cx
		jmp	short loc_A8211
; ���������������������������������������������������������������������������

loc_A8207:				; CODE XREF: MissionScenario_ConstructAndBindUI_A81E0+1Cj
		push	si
		push	si
		nop
		push	cs
		call	near ptr MissionScenario_LoadMainRecord_A8331
		add	sp, 4

loc_A8211:				; CODE XREF: MissionScenario_ConstructAndBindUI_A81E0+25j
		push	0FFFFh
		call	PagedResourceB_Helper_5D859
		pop	cx
		push	0FFh
		call	Registry_LookupForUIScreen_5B6FC
		pop	cx
		pop	si
		pop	bp
		retf
MissionScenario_ConstructAndBindUI_A81E0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 82 lignes, NON DÉTAILLÉE — combine ResourceRecord_ReadFieldGroupA_64A19,
; ReadFinalField_64B51 (seg193), sub_3B876.
; ==============================================================================================
MissionScenario_LoadFieldGroup_A8225	proc far		; CODE XREF: VROOMM_StubThunk_6CE33J MissionScenario_LoadMainRecord_A8331+511p

var_5		= byte ptr -5
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		push	di
		mov	ax, [bp+arg_0]

loc_A8230:
		mov	di, [bp+arg_2]
		jmp	short loc_A827E
; ���������������������������������������������������������������������������

loc_A8235:				; CODE XREF: MissionScenario_LoadFieldGroup_A8225+85j
		mov	[bp+var_4], 0
		cmp	[bp+var_4], 0

loc_A8242:
		jnz	short loc_A8251

loc_A8244:
		mov	ax, di
		add	ax, 0ACh ; '�'
		mov	word ptr [bp+var_4+2], ds
		mov	word ptr [bp+var_4], ax
		jmp	short $+2

loc_A8251:				; CODE XREF: MissionScenario_LoadFieldGroup_A8225:loc_A8242j
		push	large 8
		push	large [bp+var_4]
		push	di
		call	ResourceRecord_ReadFieldGroupA_64A19
		add	sp, 0Ah
		push	di
		call	ResourceRecord_ReadFinalField_64B51
		pop	cx
		mov	[bp+var_5], al
		push	ax
		push	ds
		mov	ax, di
		add	ax, 0ACh ; '�'
		push	ax
		push	571Ch
		call	IFF_LoadModelMain
		add	sp, 8

loc_A827E:				; CODE XREF: MissionScenario_LoadFieldGroup_A8225+Ej
		test	word ptr [di+72h], 1
		jz	short loc_A8297
		mov	eax, [di+76h]
		dec	eax
		cmp	[di+65h], eax
		jnz	short loc_A8297
		inc	dword ptr [di+65h]
		jmp	short $+2

loc_A8297:				; CODE XREF: MissionScenario_LoadFieldGroup_A8225+5Ej
					; MissionScenario_LoadFieldGroup_A8225+6Aj
		mov	eax, [di+65h]
		cmp	eax, [di+76h]
		jl	short loc_A82A6
		mov	ax, 1
		jmp	short loc_A82A8
; ���������������������������������������������������������������������������

loc_A82A6:				; CODE XREF: MissionScenario_LoadFieldGroup_A8225+7Aj
		xor	ax, ax

loc_A82A8:				; CODE XREF: MissionScenario_LoadFieldGroup_A8225+7Fj
		or	ax, ax
		jz	short loc_A8235
		pop	di
		pop	si
		leave
		retf
MissionScenario_LoadFieldGroup_A8225	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, libère un tampon (Memory_TypedFreeWrapperC_5C6F3) et stocke deux valeurs de champ
; (+0xD3/+0xD5).
; ==============================================================================================
MissionScenario_ReleaseAndStoreField_A82B0	proc far		; CODE XREF: VROOMM_StubThunk_6CE42J MissionScenario_LoadMainRecord_A8331+21p

var_4		= dword	ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	word_706A0, si
		mov	dword ptr [si+54h], 0
		xor	ax, ax
		mov	[si+52h], ax
		mov	[si+50h], ax
		mov	[si+4Eh], ax
		mov	[bp+var_4], 3200h
		mov	eax, [bp+var_4]
		mov	dword_706AB, eax
		mov	byte ptr [si+19h], 0
		mov	al, 0
		mov	byte_6E4B4, al
		mov	byte_6E4B8, al
		mov	byte_6E4B9, al
		mov	byte_6D559, 1
		xor	dx, dx
		jmp	short loc_A8304
; ���������������������������������������������������������������������������

loc_A82F9:				; CODE XREF: MissionScenario_ReleaseAndStoreField_A82B0+57j
		mov	bx, dx
		shl	bx, 1
		mov	word ptr [bx+si+0A1h], 0
		inc	dx

loc_A8304:				; CODE XREF: MissionScenario_ReleaseAndStoreField_A82B0+47j
		cmp	dx, 8
		jl	short loc_A82F9
		mov	word ptr [si+0B1h], 0
		push	1
		push	0
		push	2
		push	large 90h ; '�'
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	[si+0D5h], dx
		mov	[si+0D3h], ax
		pop	si
		leave
		retf
MissionScenario_ReleaseAndStoreField_A82B0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,775L — charge une mission MISSIONS\<name>.IFF, FORM racine 'MISN'. Lit 16 chunks dans
; l'ordre : VERS(u16,>=0x500 sinon fatal) NAME(char[<=16]@si+9,'UNK') TUNE(u8->byte_706A2)
; WRLD(sous-form obligatoire, avec FILE 8o -> sub_6CDCD, sinon sub_6CDC8)
; CAST(sub_6CF0D@si+0x2E) AREA(sub_6CED6@si+0x1A) SPOT(sub_6CEE5@si+0x1E)
; NUMS(sub_6CEF4@si+0x24) MSGS(sub_6CF03@si+0x28) FLAG(sub_6CE9F@si+0x48)
; PROG(sub_6CEB3@si+0x40, bytecode scripté) PART(sub_6CF35@si+0x34) TEAM(count=size/2<=8
; @si+0x84, dwords @si+0x74) PLAY(FORM 'la piece' -> MissionPlay_LoadScenes_AA595, contient N
; chunks SCNE ; objet @si+0x3A) LOAD(A8225) HOME(index AREA via GeomNode_SumAndCount_53034 ->
; si+0x58, + vecteur pos u32 si+0x5C/60/64). Puis câblage Expr VM :
; Expr_Node_Accessor_532AD(si+0x3A)->si+0x4E, ConvertFieldValue_A8B8F->si+0x54, flags
; +0x39|=0x10|0x20, SetReference16(5236h), HOME recalculé depuis le nœud si [si+0x50]!=0.
; Struct MissionScenario détaillée : DATA_MODEL.md §6.6a.
; ==============================================================================================
MissionScenario_LoadMainRecord_A8331	proc far		; CODE XREF: VROOMM_StubThunk_6CE47J MissionScenario_ConstructAndBindUI_A81E0+2Bp	...

var_128		= dword	ptr -128h
var_124		= dword	ptr -124h
var_120		= dword	ptr -120h
var_11C		= dword	ptr -11Ch
var_118		= dword	ptr -118h
var_114		= dword	ptr -114h
var_110		= word ptr -110h
var_B3		= dword	ptr -0B3h
var_AF		= dword	ptr -0AFh
var_AB		= dword	ptr -0ABh
var_A3		= byte ptr -0A3h
var_9E		= dword	ptr -9Eh
var_9A		= dword	ptr -9Ah
var_96		= word ptr -96h
var_94		= word ptr -94h
var_68		= dword	ptr -68h
var_64		= word ptr -64h
var_5C		= byte ptr -5Ch
var_5A		= word ptr -5Ah
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= dword	ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp

loc_A8334:
		sub	sp, 128h

loc_A8338:
		push	si
		push	di
		mov	si, [bp+arg_0]

loc_A833D:
		mov	di, [bp+arg_2]
		mov	ax, 1209h

loc_A8343:
		mov	bx, 5650h
		xor	cx, cx
		int	15h
		mov	cl, 1
		mov	byte_6E33B, cl
		push	si
		push	cs
		call	near ptr MissionScenario_ReleaseAndStoreField_A82B0
		pop	cx
		mov	[bp+var_2], di
		push	8
		push	[bp+var_2]
		push	si
		call	CRT_Strncpy_Pad
		add	sp, 6
		mov	byte ptr [si+8], 0
		push	si
		call	CRT_Strupr
		pop	cx
		mov	eax, [si]
		cmp	eax, dword_70718
		jnz	short loc_A838C
		mov	eax, [si+4]

loc_A8380:
		cmp	eax, dword_7071C
		jnz	short loc_A838C
		mov	ax, 1
		jmp	short loc_A838E
; ���������������������������������������������������������������������������

loc_A838C:				; CODE XREF: MissionScenario_LoadMainRecord_A8331+49j
					; MissionScenario_LoadMainRecord_A8331+54j
		xor	ax, ax

loc_A838E:				; CODE XREF: MissionScenario_LoadMainRecord_A8331+59j
		or	al, al
		jz	short loc_A83B8
		push	ds
		push	offset a_iff_0	; ".iff"
		push	ds
		push	di
		push	ds
		push	offset a_	; ".\\"
		lea	ax, [bp+var_5A]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		push	368Bh
		push	1449h
		call	CRT_Strcpy

loc_A83B3:
		add	sp, 4

loc_A83B6:
		jmp	short loc_A83D0
; ���������������������������������������������������������������������������

loc_A83B8:				; CODE XREF: MissionScenario_LoadMainRecord_A8331+5Fj
		push	seg seg215

loc_A83BB:				; ".IFF"
		push	offset a_iff
		push	ds
		push	di

loc_A83C0:
		push	ds

loc_A83C1:				; "MISSIONS"
		push	offset aMissions_0

loc_A83C4:
		lea	ax, [bp+var_5A]

loc_A83C7:
		push	ax
		call	Path_ResolveDataFile
		add	sp, 0Eh

loc_A83D0:				; CODE XREF: MissionScenario_LoadMainRecord_A8331:loc_A83B6j
		lea	ax, [bp+var_110]
		push	ax
		call	StreamReader_ConstructVariantA_63A39
		pop	cx
		mov	[bp+var_110], 2C8h
		mov	[bp+var_AF], 100h
		mov	[bp+var_B3], 0
		mov	[bp+var_110], 2E0h
		mov	[bp+var_94], 0
		xor	ax, ax
		mov	[bp+var_96], ax
		movsx	eax, ax
		mov	[bp+var_AB], eax
		mov	[bp+var_110], 36BDh
		mov	[bp+var_68], 0
		mov	[bp+var_5C], 0
		push	large 4E53494Dh
		lea	ax, [bp+var_5A]
		push	ax
		lea	ax, [bp+var_110]
		push	ax
		call	ResourceRecord_InitAndValidate_645CD
		add	sp, 8
		or	ax, ax
		jnz	short loc_A843E
		jmp	loc_A8900
; ���������������������������������������������������������������������������

loc_A843E:				; CODE XREF: MissionScenario_LoadMainRecord_A8331+108j
		xor	di, di
		push	0
		push	large 53524556h
		lea	ax, [bp+var_110]
		push	ax
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_A8466
		lea	ax, [bp+var_110]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	di, ax

loc_A8466:				; CODE XREF: MissionScenario_LoadMainRecord_A8331+126j
		cmp	di, 500h
		jge	short loc_A847B
		push	500h
		push	di
		push	3692h

loc_A8473:
		call	Runtime_FatalErrorHandler_5F700
		add	sp, 6

loc_A847B:				; CODE XREF: MissionScenario_LoadMainRecord_A8331+139j
		push	0
		push	large 454D414Eh
		lea	ax, [bp+var_110]
		push	ax
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_A84C8
		cmp	[bp+var_9E], 10h
		jl	short loc_A84A5
		push	9018h
		call	VROOMM_StubThunk_6B70F
		pop	cx

loc_A84A5:				; CODE XREF: MissionScenario_LoadMainRecord_A8331+169j
		push	large [bp+var_9E]
		push	ds
		mov	ax, si
		add	ax, 9
		push	ax
		lea	ax, [bp+var_110]
		push	ax

loc_A84B6:
		call	ResourceRecord_ReadFieldGroupA_64A19
		add	sp, 0Ah

loc_A84BE:
		mov	bx, word ptr [bp+var_9E]
		mov	byte ptr [bx+si+9], 0
		jmp	short loc_A84D8
; ���������������������������������������������������������������������������

loc_A84C8:				; CODE XREF: MissionScenario_LoadMainRecord_A8331+161j
		mov	byte ptr [si+9], 55h ; 'U'
		mov	byte ptr [si+0Ah], 4Eh ; 'N'
		mov	byte ptr [si+0Bh], 4Bh ; 'K'
		mov	byte ptr [si+0Ch], 0

loc_A84D8:				; CODE XREF: MissionScenario_LoadMainRecord_A8331+195j
		push	0
		push	large 454E5554h
		lea	ax, [bp+var_110]
		push	ax
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_A84FF
		lea	ax, [bp+var_110]
		push	ax
		call	ResourceRecord_ReadFinalField_64B51
		pop	cx
		mov	byte_706A2, al

loc_A84FF:				; CODE XREF: MissionScenario_LoadMainRecord_A8331+1BEj
		push	0
		push	large 444C5257h
		lea	ax, [bp+var_110]
		push	ax
		call	ResourceRecord_SeekAndReadB_647B2
		add	sp, 8
		or	ax, ax
		jz	short loc_A8591
		push	0
		push	large 454C4946h
		lea	ax, [bp+var_110]
		push	ax
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_A857A
		mov	[bp+var_6], 0
		cmp	[bp+var_6], 0
		jnz	short loc_A854B
		lea	ax, [bp+var_64]

loc_A8543:
		mov	word ptr [bp+var_6+2], ds
		mov	word ptr [bp+var_6], ax
		jmp	short $+2

loc_A854B:				; CODE XREF: MissionScenario_LoadMainRecord_A8331+20Dj
		push	large 8
		push	large [bp+var_6]
		lea	ax, [bp+var_110]
		push	ax
		call	ResourceRecord_ReadFieldGroupA_64A19
		add	sp, 0Ah
		lea	ax, [bp+var_64]
		push	ax
		call	VROOMM_StubThunk_6CDCD
		pop	cx
		mov	eax, [bp+var_9A]
		mov	[bp+var_AB], eax

loc_A8573:
		mov	[bp+var_A3], 0
		jmp	short loc_A8585
; ���������������������������������������������������������������������������

loc_A857A:				; CODE XREF: MissionScenario_LoadMainRecord_A8331+1FEj
		lea	ax, [bp+var_110]
		push	ax
		call	VROOMM_StubThunk_6CDC8
		pop	cx

loc_A8585:				; CODE XREF: MissionScenario_LoadMainRecord_A8331+247j
		lea	ax, [bp+var_110]
		push	ax
		call	ResourceRecord_ReleaseAndClear_64D25
		jmp	short loc_A8599
; ���������������������������������������������������������������������������

loc_A8591:				; CODE XREF: MissionScenario_LoadMainRecord_A8331+1E5j
		push	9015h
		call	VROOMM_StubThunk_6B70F

loc_A8599:				; CODE XREF: MissionScenario_LoadMainRecord_A8331+25Ej
		pop	cx
		push	0
		push	large 54534143h
		lea	ax, [bp+var_110]
		push	ax
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_A85D5

loc_A85B3:
		lea	ax, [bp+var_110]
		push	ax
		mov	ax, si

loc_A85BA:
		add	ax, 2Eh	; '.'
		push	ax
		call	VROOMM_StubThunk_6CF0D
		add	sp, 4
		mov	eax, [bp+var_9A]
		mov	[bp+var_AB], eax
		mov	[bp+var_A3], 0

loc_A85D5:				; CODE XREF: MissionScenario_LoadMainRecord_A8331+280j
		push	0
		push	large 41455241h
		lea	ax, [bp+var_110]
		push	ax
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_A8610
		lea	ax, [bp+var_110]
		push	ax
		mov	ax, si
		add	ax, 1Ah
		push	ax
		call	VROOMM_StubThunk_6CED6
		add	sp, 4
		mov	eax, [bp+var_9A]
		mov	[bp+var_AB], eax
		mov	[bp+var_A3], 0

loc_A8610:				; CODE XREF: MissionScenario_LoadMainRecord_A8331+2BBj
		push	0
		push	large 544F5053h
		lea	ax, [bp+var_110]
		push	ax
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_A864C
		lea	ax, [bp+var_110]
		push	ax
		push	si
		mov	ax, si
		add	ax, 1Eh
		push	ax

loc_A8635:
		call	VROOMM_StubThunk_6CEE5
		add	sp, 6
		mov	eax, [bp+var_9A]
		mov	[bp+var_AB], eax
		mov	[bp+var_A3], 0

loc_A864C:				; CODE XREF: MissionScenario_LoadMainRecord_A8331+2F6j
		push	0
		push	large 534D554Eh
		lea	ax, [bp+var_110]
		push	ax
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_A8687
		lea	ax, [bp+var_110]
		push	ax
		mov	ax, si
		add	ax, 24h	; '$'
		push	ax
		call	VROOMM_StubThunk_6CEF4
		add	sp, 4
		mov	eax, [bp+var_9A]
		mov	[bp+var_AB], eax
		mov	[bp+var_A3], 0

loc_A8687:				; CODE XREF: MissionScenario_LoadMainRecord_A8331+332j
		push	0
		push	large 5347534Dh
		lea	ax, [bp+var_110]
		push	ax
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_A86C2
		lea	ax, [bp+var_110]
		push	ax
		mov	ax, si
		add	ax, 28h	; '('
		push	ax
		call	VROOMM_StubThunk_6CF03
		add	sp, 4

loc_A86B3:
		mov	eax, [bp+var_9A]

loc_A86B8:
		mov	[bp+var_AB], eax

loc_A86BD:
		mov	[bp+var_A3], 0

loc_A86C2:				; CODE XREF: MissionScenario_LoadMainRecord_A8331+36Dj
		push	0

loc_A86C4:
		push	large 47414C46h
		lea	ax, [bp+var_110]
		push	ax
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_A86FD
		lea	ax, [bp+var_110]
		push	ax
		mov	ax, si
		add	ax, 48h	; 'H'
		push	ax
		call	VROOMM_StubThunk_6CE9F
		add	sp, 4
		mov	eax, [bp+var_9A]
		mov	[bp+var_AB], eax
		mov	[bp+var_A3], 0

loc_A86FD:				; CODE XREF: MissionScenario_LoadMainRecord_A8331+3A8j
		push	0
		push	large 474F5250h
		lea	ax, [bp+var_110]
		push	ax
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_A874D
		test	[bp+var_9E], 1
		jz	short loc_A872A
		push	9116h
		call	VROOMM_StubThunk_6B70F
		pop	cx

loc_A872A:				; CODE XREF: MissionScenario_LoadMainRecord_A8331+3EEj
		lea	ax, [bp+var_110]
		push	ax
		push	si
		mov	ax, si

loc_A8732:
		add	ax, 40h	; '@'
		push	ax
		call	VROOMM_StubThunk_6CEB3
		add	sp, 6
		mov	eax, [bp+var_9A]
		mov	[bp+var_AB], eax
		mov	[bp+var_A3], 0

loc_A874D:				; CODE XREF: MissionScenario_LoadMainRecord_A8331+3E3j
		push	0
		push	large 54524150h
		lea	ax, [bp+var_110]
		push	ax
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_A8788
		lea	ax, [bp+var_110]
		push	ax
		mov	ax, si
		add	ax, 34h	; '4'
		push	ax
		call	VROOMM_StubThunk_6CF35
		add	sp, 4
		mov	eax, [bp+var_9A]
		mov	[bp+var_AB], eax
		mov	[bp+var_A3], 0

loc_A8788:				; CODE XREF: MissionScenario_LoadMainRecord_A8331+433j
		mov	word ptr [si+84h], 0
		push	0
		push	large 4D414554h
		lea	ax, [bp+var_110]
		push	ax
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_A87E1
		mov	eax, [bp+var_9E]
		mov	ebx, 2
		cdq

loc_A87B4:
		idiv	ebx

loc_A87B7:
		mov	[si+84h], ax

loc_A87BB:
		cmp	word ptr [si+84h], 8
		jle	short loc_A87CB

loc_A87C2:
		push	9016h

loc_A87C5:
		call	VROOMM_StubThunk_6B70F
		pop	cx

loc_A87CB:				; CODE XREF: MissionScenario_LoadMainRecord_A8331+48Fj
		push	ds
		mov	ax, si
		add	ax, 74h	; 't'
		push	ax
		lea	ax, [bp+var_110]
		push	ax
		call	ResourceRecord_ReadDwordFieldB_64AFF
		add	sp, 6
		jmp	short loc_A87EA
; ���������������������������������������������������������������������������

loc_A87E1:				; CODE XREF: MissionScenario_LoadMainRecord_A8331+474j
		push	9017h
		call	VROOMM_StubThunk_6B70F
		pop	cx

loc_A87EA:				; CODE XREF: MissionScenario_LoadMainRecord_A8331+4AEj
		push	0
		push	large 59414C50h
		lea	ax, [bp+var_110]
		push	ax
		call	ResourceRecord_SeekAndReadB_647B2
		add	sp, 8
		or	ax, ax
		jz	short loc_A8822
		lea	ax, [bp+var_110]
		push	ax
		push	si
		mov	ax, si
		add	ax, 3Ah	; ':'
		push	ax
		call	VROOMM_StubThunk_6CF58
		add	sp, 6
		lea	ax, [bp+var_110]
		push	ax
		call	ResourceRecord_ReleaseAndClear_64D25
		pop	cx

loc_A8822:				; CODE XREF: MissionScenario_LoadMainRecord_A8331+4D0j
		push	0
		push	large 44414F4Ch
		lea	ax, [bp+var_110]
		push	ax
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_A8857
		lea	ax, [bp+var_110]
		push	ax
		push	si
		push	cs
		call	near ptr MissionScenario_LoadFieldGroup_A8225
		add	sp, 4
		mov	eax, [bp+var_9A]
		mov	[bp+var_AB], eax
		mov	[bp+var_A3], 0

loc_A8857:				; CODE XREF: MissionScenario_LoadMainRecord_A8331+508j
		push	0
		push	large 454D4F48h
		lea	ax, [bp+var_110]
		push	ax
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_A88DD
		lea	ax, [bp+var_110]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[bp+var_A], ax
		push	ax
		mov	ax, si
		add	ax, 1Ah
		push	ax
		call	GeomNode_SumAndCount_53034
		add	sp, 4
		mov	[si+5Ah], dx
		mov	[si+58h], ax
		lea	ax, [bp+var_110]
		push	ax
		call	ResourceRecord_ReadFieldGroupC_64A7E
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[si+5Ch], eax
		lea	ax, [bp+var_110]
		push	ax
		call	ResourceRecord_ReadFieldGroupC_64A7E
		push	dx

loc_A88B1:
		push	ax

loc_A88B2:
		pop	eax
		pop	cx

loc_A88B5:
		mov	[si+60h], eax

loc_A88B9:
		lea	ax, [bp+var_110]
		push	ax
		call	ResourceRecord_ReadFieldGroupC_64A7E
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[si+64h], eax
		mov	eax, [bp+var_9A]
		mov	[bp+var_AB], eax
		mov	[bp+var_A3], 0
		jmp	short loc_A88F4
; ���������������������������������������������������������������������������

loc_A88DD:				; CODE XREF: MissionScenario_LoadMainRecord_A8331+53Dj
		mov	dword ptr [si+58h], 0
		xor	eax, eax
		mov	[si+64h], eax
		mov	[si+60h], eax
		mov	[si+5Ch], eax

loc_A88F4:				; CODE XREF: MissionScenario_LoadMainRecord_A8331+5AAj
		lea	ax, [bp+var_110]
		push	ax
		call	ResourceRecord_ReleaseAndClear_64D25
		jmp	short loc_A8908
; ���������������������������������������������������������������������������

loc_A8900:				; CODE XREF: MissionScenario_LoadMainRecord_A8331+10Aj
		push	9018h
		call	VROOMM_StubThunk_6B70F

loc_A8908:				; CODE XREF: MissionScenario_LoadMainRecord_A8331+5CDj
		pop	cx
		push	large 0
		mov	ax, si
		add	ax, 3Ah	; ':'
		push	ax
		call	Expr_Node_Accessor_532AD
		add	sp, 6
		mov	[si+4Eh], ax
		cmp	word ptr [si+4Eh], 0
		jnz	short loc_A892C
		push	9019h
		call	VROOMM_StubThunk_6B70F
		pop	cx

loc_A892C:				; CODE XREF: MissionScenario_LoadMainRecord_A8331+5F0j
		push	word ptr [si+4Eh]
		call	Scene_TriggerActivation_531CD
		pop	cx
		push	si
		nop
		push	cs
		call	near ptr MissionScenario_ConvertFieldValue_A8B8F
		pop	cx
		mov	[si+56h], dx
		mov	[si+54h], ax
		cmp	dword ptr [si+54h], 0
		jz	short loc_A8953
		les	bx, [si+54h]
		cmp	word ptr es:[bx+52h], 0
		jnz	short loc_A895C

loc_A8953:				; CODE XREF: MissionScenario_LoadMainRecord_A8331+616j
		push	9999h
		call	VROOMM_StubThunk_6B70F
		pop	cx

loc_A895C:				; CODE XREF: MissionScenario_LoadMainRecord_A8331+620j
		les	bx, [si+54h]
		or	byte ptr es:[bx+39h], 10h
		or	byte ptr es:[bx+39h], 20h
		mov	ax, es:[bx+52h]
		mov	[bp+var_8], ax
		push	ax
		push	5236h
		call	SetReference16
		add	sp, 4
		push	0
		cmp	dword ptr [si+54h], 0
		jz	short loc_A899F
		push	large dword ptr	[si+54h]
		push	ss
		lea	ax, [bp+var_11C]
		push	ax
		call	Expr_Node_StoreResultVector_52C9C
		add	sp, 8
		mov	dx, ss
		lea	ax, [bp+var_11C]
		jmp	short loc_A89C0
; ���������������������������������������������������������������������������

loc_A899F:				; CODE XREF: MissionScenario_LoadMainRecord_A8331+652j
		mov	eax, dword_707F8
		mov	[bp+var_11C], eax
		mov	eax, dword_707FC
		mov	[bp+var_118], eax

loc_A89B1:
		mov	eax, dword_70800
		mov	[bp+var_114], eax

loc_A89BA:
		mov	dx, ss
		lea	ax, [bp+var_11C]

loc_A89C0:				; CODE XREF: MissionScenario_LoadMainRecord_A8331+66Cj
		lea	ax, [bp+var_11C]
		push	ax
		mov	ax, si
		add	ax, 3Ah	; ':'
		push	ax
		call	Scene_DetectAndActivateChange_532EA
		add	sp, 6
		cmp	word ptr [si+50h], 0
		jz	short loc_A8A0D
		cmp	dword ptr [si+58h], 0
		jnz	short loc_A8A0D
		push	large dword ptr	[si+54h]
		push	ss
		lea	ax, [bp+var_128]
		push	ax
		call	Expr_Node_StoreResultVector_52C9C
		add	sp, 8
		mov	eax, [bp+var_128]
		mov	[si+5Ch], eax
		mov	eax, [bp+var_124]
		mov	[si+60h], eax
		mov	eax, [bp+var_120]
		mov	[si+64h], eax

loc_A8A0D:				; CODE XREF: MissionScenario_LoadMainRecord_A8331+6A6j
					; MissionScenario_LoadMainRecord_A8331+6ADj
		push	si
		mov	ax, si
		add	ax, 68h	; 'h'
		push	ax
		call	Lexer_CountTokensAndFormat
		add	sp, 4
		mov	[bp+var_110], 2E0h
		lea	ax, [bp+var_110]
		push	ax
		call	ResourceRecord_Helper_645A5
		pop	cx
		push	0
		lea	ax, [bp+var_110]
		push	ax
		call	StreamReader_ReleaseBuffer_65643
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
MissionScenario_LoadMainRecord_A8331	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, aucun appel externe visible (49 lignes, rôle exact non détaillé).
; ==============================================================================================
MissionScenario_Helper_A8A40	proc far		; CODE XREF: VROOMM_StubThunk_6CE24J

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		xor	dx, dx
		sub	ax, [si+36h]
		sbb	dx, 0
		push	dx
		push	ax
		pop	eax
		mov	ebx, 55h ; 'U'
		cdq
		idiv	ebx
		mov	[bp+var_2], ax
		xor	dx, dx
		jmp	short loc_A8A7C
; ���������������������������������������������������������������������������

loc_A8A6B:				; CODE XREF: MissionScenario_Helper_A8A40+40j
		mov	bx, dx
		shl	bx, 1
		mov	ax, [bx+si+74h]
		cmp	ax, [bp+var_2]
		jnz	short loc_A8A7B
		mov	al, 1
		jmp	short loc_A8A84
; ���������������������������������������������������������������������������

loc_A8A7B:				; CODE XREF: MissionScenario_Helper_A8A40+35j
		inc	dx

loc_A8A7C:				; CODE XREF: MissionScenario_Helper_A8A40+29j
		cmp	[si+84h], dx
		jg	short loc_A8A6B
		mov	al, 0

loc_A8A84:				; CODE XREF: MissionScenario_Helper_A8A40+39j
		pop	si
		leave
		retf
MissionScenario_Helper_A8A40	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 109 lignes, NON DÉTAILLÉE — combine
; MissionScenario_QueryFieldWrapper_A7FF0/ResolveFieldChain_A8BD1 et
; Expr_LookupTableEntry85B_52D45 (seg114).
; ==============================================================================================
MissionScenario_QueryAndResolve_A8A87	proc far		; CODE XREF: VROOMM_StubThunk_6CE60J

var_A		= dword	ptr -0Ah
var_6		= word ptr -6
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		push	si
		push	di
		mov	si, [bp+arg_0]
		xor	di, di
		push	si
		nop
		push	cs
		call	near ptr MissionScenario_ResolveFieldChain_A8BD1
		pop	cx
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		mov	[bp+var_6], 0
		jmp	short loc_A8B25
; ���������������������������������������������������������������������������

loc_A8AA8:				; CODE XREF: MissionScenario_QueryAndResolve_A8A87+A7j
		mov	bx, [bp+var_6]
		shl	bx, 1
		push	word ptr [bx+si+74h]
		mov	ax, si

loc_A8AB2:
		add	ax, 34h	; '4'
		push	ax

loc_A8AB6:
		call	Expr_LookupTableEntry85B_52D45
		add	sp, 4
		mov	word ptr [bp+var_A+2], dx

loc_A8AC1:
		mov	word ptr [bp+var_A], ax

loc_A8AC4:
		les	bx, [bp+var_A]

loc_A8AC7:
		cmp	word ptr es:[bx+52h], 0
		jz	short loc_A8AD3
		mov	ax, 1
		jmp	short loc_A8AD5
; ���������������������������������������������������������������������������

loc_A8AD3:				; CODE XREF: MissionScenario_QueryAndResolve_A8A87+45j
		xor	ax, ax

loc_A8AD5:				; CODE XREF: MissionScenario_QueryAndResolve_A8A87+4Aj
		or	ax, ax
		jz	short loc_A8B22
		les	bx, [bp+var_A]
		mov	al, es:[bx+39h]
		shl	ax, 0Eh
		sar	ax, 0Fh
		mov	ah, 0
		or	ax, ax
		jnz	short loc_A8B22
		mov	al, es:[bx+39h]
		shl	ax, 0Ah
		sar	ax, 0Fh
		mov	dl, al
		mov	eax, [bp+var_A]
		cmp	eax, [bp+var_4]
		jnz	short loc_A8B0B
		cmp	byte_6E4D5, 0
		jz	short loc_A8B0B
		mov	dl, 0

loc_A8B0B:				; CODE XREF: MissionScenario_QueryAndResolve_A8A87+79j
					; MissionScenario_QueryAndResolve_A8A87+80j
		or	dl, dl
		jz	short loc_A8B22
		les	bx, [bp+var_A]
		mov	ax, es:[bx+52h]
		mov	dx, di
		shl	dx, 1
		mov	bx, [bp+arg_2]
		add	bx, dx
		mov	[bx], ax
		inc	di

loc_A8B22:				; CODE XREF: MissionScenario_QueryAndResolve_A8A87+50j
					; MissionScenario_QueryAndResolve_A8A87+63j ...
		inc	[bp+var_6]

loc_A8B25:				; CODE XREF: MissionScenario_QueryAndResolve_A8A87+1Fj
		mov	ax, [si+84h]
		cmp	ax, [bp+var_6]
		jle	short loc_A8B31
		jmp	loc_A8AA8
; ���������������������������������������������������������������������������

loc_A8B31:				; CODE XREF: MissionScenario_QueryAndResolve_A8A87+A5j
		mov	ax, di
		pop	di
		pop	si
		leave
		retf
MissionScenario_QueryAndResolve_A8A87	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 65 lignes, NON DÉTAILLÉE — appelle Expr_LookupTableEntry85B_52D45 (seg114).
; ==============================================================================================
MissionScenario_ResolveFieldEntry_A8B37	proc far		; CODE XREF: VROOMM_StubThunk_6CE65J MissionScenario_LoadFromIFF_A8C44+219p ...

var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		push	di
		mov	si, [bp+arg_0]
		xor	di, di
		mov	[bp+var_2], 0
		jmp	short loc_A8B80
; ���������������������������������������������������������������������������

loc_A8B4B:				; CODE XREF: MissionScenario_ResolveFieldEntry_A8B37+50j
		mov	bx, [bp+var_2]
		shl	bx, 1
		push	word ptr [bx+si+74h]
		mov	ax, si
		add	ax, 34h	; '4'
		push	ax
		call	Expr_LookupTableEntry85B_52D45
		add	sp, 4

loc_A8B61:
		mov	[bp+var_4], dx

loc_A8B64:
		mov	[bp+var_6], ax
		mov	ax, di
		shl	ax, 2

loc_A8B6C:
		mov	bx, [bp+arg_2]

loc_A8B6F:
		add	bx, ax

loc_A8B71:
		mov	ax, [bp+var_4]

loc_A8B74:
		mov	dx, [bp+var_6]

loc_A8B77:
		mov	[bx+2],	ax
		mov	[bx], dx
		inc	di
		inc	[bp+var_2]

loc_A8B80:				; CODE XREF: MissionScenario_ResolveFieldEntry_A8B37+12j
		mov	ax, [si+84h]
		cmp	ax, [bp+var_2]
		jg	short loc_A8B4B
		mov	ax, di
		pop	di
		pop	si
		leave
		retf
MissionScenario_ResolveFieldEntry_A8B37	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle Expr_Node_LookupAndConvert_52D69 (seg114).
; ==============================================================================================
MissionScenario_ConvertFieldValue_A8B8F	proc far		; CODE XREF: VROOMM_StubThunk_6CE1FJ MissionScenario_LoadMainRecord_A8331+607p

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		push	ds
		push	offset aPlayer_0 ; "PLAYER"
		mov	ax, dx
		add	ax, 34h	; '4'
		push	ax
		call	Expr_Node_LookupAndConvert_52D69
		add	sp, 6
		pop	bp
		retf
MissionScenario_ConvertFieldValue_A8B8F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle Expr_LookupTableEntry85B_52D45 (seg114).
; ==============================================================================================
MissionScenario_ResolveFieldEntryB_A8BA9	proc far		; CODE XREF: VROOMM_StubThunk_6CE29J MissionScenario_ResolveFieldChain_A8BD1+Dp

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]

loc_A8BB0:
		cmp	word ptr [si+84h], 0
		jz	short loc_A8BBC

loc_A8BB7:
		mov	ax, [si+74h]
		jmp	short loc_A8BBF
; ���������������������������������������������������������������������������

loc_A8BBC:				; CODE XREF: MissionScenario_ResolveFieldEntryB_A8BA9+Cj
		mov	ax, 0FFFFh

loc_A8BBF:				; CODE XREF: MissionScenario_ResolveFieldEntryB_A8BA9+11j
		push	ax
		mov	ax, si
		add	ax, 34h	; '4'
		push	ax
		call	Expr_LookupTableEntry85B_52D45
		add	sp, 4
		pop	si
		pop	bp
		retf
MissionScenario_ResolveFieldEntryB_A8BA9	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine MissionScenario_ResolveFieldEntryB_A8BA9 et Expr_LookupTableEntry85B_52D45.
; ==============================================================================================
MissionScenario_ResolveFieldChain_A8BD1	proc far		; CODE XREF: VROOMM_StubThunk_6CE2EJ MissionScenario_QueryFieldWrapper_A7FF0+10p	...

var_A		= dword	ptr -0Ah
var_6		= word ptr -6
var_4		= dword	ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	si
		push	cs
		call	near ptr MissionScenario_ResolveFieldEntryB_A8BA9
		pop	cx
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		cmp	[bp+var_4], 0
		jz	short loc_A8C3C
		les	bx, [bp+var_4]
		mov	al, es:[bx+1Bh]
		mov	ah, 0
		mov	[bp+var_6], ax
		mov	di, 1
		jmp	short loc_A8C36
; ���������������������������������������������������������������������������

loc_A8C00:				; CODE XREF: MissionScenario_ResolveFieldChain_A8BD1+69j
		mov	bx, di
		shl	bx, 1
		push	word ptr [bx+si+74h]
		mov	ax, si
		add	ax, 34h	; '4'
		push	ax
		call	Expr_LookupTableEntry85B_52D45
		add	sp, 4
		mov	word ptr [bp+var_A+2], dx
		mov	word ptr [bp+var_A], ax
		cmp	[bp+var_A], 0
		jz	short loc_A8C35
		les	bx, [bp+var_A]
		mov	al, es:[bx+32h]
		mov	ah, 0
		cmp	ax, [bp+var_6]
		jnz	short loc_A8C35
		mov	ax, word ptr [bp+var_A]
		jmp	short loc_A8C40
; ���������������������������������������������������������������������������

loc_A8C35:				; CODE XREF: MissionScenario_ResolveFieldChain_A8BD1+4Fj
					; MissionScenario_ResolveFieldChain_A8BD1+5Dj
		inc	di

loc_A8C36:				; CODE XREF: MissionScenario_ResolveFieldChain_A8BD1+2Dj
		cmp	[si+84h], di
		jg	short loc_A8C00

loc_A8C3C:				; CODE XREF: MissionScenario_ResolveFieldChain_A8BD1+1Cj
		xor	dx, dx
		xor	ax, ax

loc_A8C40:				; CODE XREF: MissionScenario_ResolveFieldChain_A8BD1+62j
		pop	di
		pop	si
		leave
		retf
MissionScenario_ResolveFieldChain_A8BD1	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,356L — pont campagne->mission. Charge DATA\OP2MISN.IFF (Path_BuildComposite, prefix
; unk_70720), FORM racine 'INVN'. Chunks : INFO(String@si) NAME(char<=16->unk_6E4D9, pilote)
; SNAM(->buffer AIRHEAD) CALL(->buffer SUTEK) TEAM(<=3 chaînes 9o @si+0x86). Puis appelle
; MissionScenario_LoadMainRecord_A8331(si) puis bind des enregistrements PLYR
; (enter_form('PLYR') + sub_6CF2B/6CF21, tableau si+0xB1) sur les nœuds participants (clé = id
; objet +0x52). Erreur 901Ah si INVN absent. Détail : DATA_MODEL.md §6.6a.
; ==============================================================================================
MissionScenario_LoadFromIFF_A8C44	proc far		; CODE XREF: VROOMM_StubThunk_6CE51J MissionScenario_ConstructAndBindUI_A81E0+21p

var_11A		= word ptr -11Ah
var_FA		= word ptr -0FAh
var_9D		= dword	ptr -9Dh
var_99		= dword	ptr -99h
var_95		= dword	ptr -95h
var_88		= dword	ptr -88h
var_84		= dword	ptr -84h
var_80		= word ptr -80h
var_7E		= word ptr -7Eh
var_52		= word ptr -52h
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 11Ah
		push	si
		push	di
		mov	si, [bp+arg_0]

loc_A8C50:
		mov	byte_7070E, 1

loc_A8C55:
		mov	ax, 1209h
		mov	bx, 5650h

loc_A8C5B:
		xor	cx, cx

loc_A8C5D:
		int	15h

loc_A8C5F:
		mov	cl, 1

loc_A8C61:
		mov	byte_6E33B, cl

loc_A8C65:
		push	seg seg215
		push	offset a_iff	; ".IFF"
		push	ds
		push	offset aOp2misn	; "OP2MISN"

loc_A8C6F:
		push	ds
		push	offset unk_70720
		lea	ax, [bp+var_52]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		lea	ax, [bp+var_FA]
		push	ax
		call	StreamReader_ConstructVariantA_63A39
		pop	cx
		mov	[bp+var_FA], 2C8h
		mov	[bp+var_99], 100h
		mov	[bp+var_9D], 0
		mov	[bp+var_FA], 2E0h
		mov	[bp+var_7E], 0
		xor	ax, ax

loc_A8CAF:
		mov	[bp+var_80], ax
		movsx	eax, ax
		mov	[bp+var_95], eax
		push	large 4E564E49h
		lea	ax, [bp+var_52]
		push	ax
		lea	ax, [bp+var_FA]
		push	ax
		call	ResourceRecord_InitAndValidate_645CD
		add	sp, 8
		or	ax, ax
		jnz	short loc_A8CD9
		jmp	loc_A8EF5
; ���������������������������������������������������������������������������

loc_A8CD9:				; CODE XREF: MissionScenario_LoadFromIFF_A8C44+90j
		push	0
		push	large 4F464E49h
		lea	ax, [bp+var_FA]
		push	ax
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_A8D00
		lea	ax, [bp+var_FA]
		push	ax
		push	si
		call	String_ConstructFromPtrLen
		add	sp, 4

loc_A8D00:				; CODE XREF: MissionScenario_LoadFromIFF_A8C44+ACj
		push	0
		push	large 454D414Eh
		lea	ax, [bp+var_FA]
		push	ax
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_A8D49
		cmp	[bp+var_88], 10h
		jl	short loc_A8D2A
		push	901Bh
		call	VROOMM_StubThunk_6B70F
		pop	cx

loc_A8D2A:				; CODE XREF: MissionScenario_LoadFromIFF_A8C44+DBj
		push	large [bp+var_88]
		push	ds
		push	offset unk_6E4D9
		lea	ax, [bp+var_FA]
		push	ax
		call	ResourceRecord_ReadFieldGroupA_64A19
		add	sp, 0Ah
		mov	bx, word ptr [bp+var_88]
		mov	byte ptr [bx+1429h], 0

loc_A8D49:				; CODE XREF: MissionScenario_LoadFromIFF_A8C44+D3j
		push	0
		push	large 4D414E53h
		lea	ax, [bp+var_FA]
		push	ax

loc_A8D56:
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8

loc_A8D5E:
		or	ax, ax
		jz	short loc_A8D92

loc_A8D62:
		cmp	[bp+var_88], 10h
		jl	short loc_A8D73

loc_A8D6A:
		push	901Bh
		call	VROOMM_StubThunk_6B70F
		pop	cx

loc_A8D73:				; CODE XREF: MissionScenario_LoadFromIFF_A8C44+124j
		push	large [bp+var_88]
		push	ds
		push	offset aAirhead	; "AIRHEAD"
		lea	ax, [bp+var_FA]
		push	ax
		call	ResourceRecord_ReadFieldGroupA_64A19
		add	sp, 0Ah
		mov	bx, word ptr [bp+var_88]
		mov	byte ptr [bx+1439h], 0

loc_A8D92:				; CODE XREF: MissionScenario_LoadFromIFF_A8C44+11Cj
		push	0
		push	large 4C4C4143h
		lea	ax, [bp+var_FA]
		push	ax
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_A8DDB
		cmp	[bp+var_88], 10h
		jl	short loc_A8DBC

loc_A8DB3:
		push	901Bh
		call	VROOMM_StubThunk_6B70F
		pop	cx

loc_A8DBC:				; CODE XREF: MissionScenario_LoadFromIFF_A8C44+16Dj
		push	large [bp+var_88]
		push	ds

loc_A8DC2:				; "SUTEK"
		push	offset aSutek
		lea	ax, [bp+var_FA]
		push	ax
		call	ResourceRecord_ReadFieldGroupA_64A19
		add	sp, 0Ah
		mov	bx, word ptr [bp+var_88]
		mov	byte ptr [bx+1449h], 0

loc_A8DDB:				; CODE XREF: MissionScenario_LoadFromIFF_A8C44+165j
		push	0
		push	large 4D414554h
		lea	ax, [bp+var_FA]
		push	ax
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_A8E4D
		xor	di, di
		jmp	short loc_A8E14
; ���������������������������������������������������������������������������

loc_A8DF8:				; CODE XREF: MissionScenario_LoadFromIFF_A8C44+207j
		lea	ax, [bp+var_FA]
		push	ax
		mov	ax, di
		imul	ax, 9
		mov	dx, si
		add	dx, ax
		add	dx, 86h	; '�'
		push	dx
		call	String_ConstructFromPtrLen
		add	sp, 4
		inc	di

loc_A8E14:				; CODE XREF: MissionScenario_LoadFromIFF_A8C44+1B2j
		test	word ptr [bp+var_88], 1
		jz	short loc_A8E31
		mov	eax, [bp+var_84]
		dec	eax
		cmp	eax, [bp+var_95]
		jnz	short loc_A8E31
		inc	[bp+var_95]
		jmp	short $+2

loc_A8E31:				; CODE XREF: MissionScenario_LoadFromIFF_A8C44+1D6j
					; MissionScenario_LoadFromIFF_A8C44+1E4j
		mov	eax, [bp+var_95]
		cmp	eax, [bp+var_84]
		jl	short loc_A8E42
		mov	ax, 1
		jmp	short loc_A8E44
; ���������������������������������������������������������������������������

loc_A8E42:				; CODE XREF: MissionScenario_LoadFromIFF_A8C44+1F7j
		xor	ax, ax

loc_A8E44:				; CODE XREF: MissionScenario_LoadFromIFF_A8C44+1FCj
		or	ax, ax
		jnz	short loc_A8E4D
		cmp	di, 3
		jl	short loc_A8DF8

loc_A8E4D:				; CODE XREF: MissionScenario_LoadFromIFF_A8C44+1AEj
					; MissionScenario_LoadFromIFF_A8C44+202j
		push	si
		push	si
		push	cs
		call	near ptr MissionScenario_LoadMainRecord_A8331

loc_A8E53:
		add	sp, 4
		lea	ax, [bp+var_11A]
		push	ax
		push	si

loc_A8E5C:
		push	cs
		call	near ptr MissionScenario_ResolveFieldEntry_A8B37
		add	sp, 4
		mov	[bp+var_2], ax
		lea	ax, [bp+var_FA]

loc_A8E6A:
		push	ax
		mov	ax, si
		add	ax, 0B1h ; '�'
		push	ax
		call	VROOMM_StubThunk_6CF6C
		add	sp, 4
		push	0
		push	large 52594C50h
		lea	ax, [bp+var_FA]
		push	ax
		call	ResourceRecord_SeekAndReadB_647B2
		add	sp, 8
		or	ax, ax
		jz	short loc_A8EFE
		lea	ax, [bp+var_FA]
		push	ax
		push	large dword ptr	[si+54h]
		call	VROOMM_StubThunk_6CF2B
		add	sp, 6
		lea	ax, [bp+var_FA]
		push	ax
		call	ResourceRecord_ReleaseAndClear_64D25
		pop	cx
		xor	di, di

loc_A8EB0:
		jmp	short loc_A8EEE
; ���������������������������������������������������������������������������

loc_A8EB2:				; CODE XREF: MissionScenario_LoadFromIFF_A8C44+2ADj
		mov	bx, di

loc_A8EB4:
		shl	bx, 2

loc_A8EB7:
		lea	ax, [bp+var_11A]
		add	bx, ax

loc_A8EBD:
		les	bx, [bx]
		cmp	word ptr es:[bx+52h], 0
		jz	short loc_A8ECB
		mov	ax, 1
		jmp	short loc_A8ECD
; ���������������������������������������������������������������������������

loc_A8ECB:				; CODE XREF: MissionScenario_LoadFromIFF_A8C44+280j
		xor	ax, ax

loc_A8ECD:				; CODE XREF: MissionScenario_LoadFromIFF_A8C44+285j
		or	ax, ax
		jz	short loc_A8EED
		mov	ax, si
		add	ax, 0B1h ; '�'
		push	ax
		mov	bx, di
		shl	bx, 2
		lea	ax, [bp+var_11A]
		add	bx, ax
		push	large dword ptr	[bx]
		call	VROOMM_StubThunk_6CF21
		add	sp, 6

loc_A8EED:				; CODE XREF: MissionScenario_LoadFromIFF_A8C44+28Bj
		inc	di

loc_A8EEE:				; CODE XREF: MissionScenario_LoadFromIFF_A8C44:loc_A8EB0j
		cmp	di, [bp+var_2]
		jl	short loc_A8EB2
		jmp	short loc_A8EFE
; ���������������������������������������������������������������������������

loc_A8EF5:				; CODE XREF: MissionScenario_LoadFromIFF_A8C44+92j
		push	901Ah
		call	VROOMM_StubThunk_6B70F
		pop	cx

loc_A8EFE:				; CODE XREF: MissionScenario_LoadFromIFF_A8C44+24Cj
					; MissionScenario_LoadFromIFF_A8C44+2AFj
		mov	[bp+var_FA], 2E0h
		lea	ax, [bp+var_FA]
		push	ax
		call	ResourceRecord_Helper_645A5
		pop	cx
		push	0
		lea	ax, [bp+var_FA]
		push	ax
		call	StreamReader_ReleaseBuffer_65643
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
MissionScenario_LoadFromIFF_A8C44	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,492L — pont mission->campagne (ÉCRITURE). Écrit DATA\MISN2OP.IFF, FORM racine 'INVN',
; via les primitives d'écriture ResourceRecord (WriteFieldGroupA/B, StreamReader_WriteTyped,
; AllocateAndDecodeVariant). Chunks écrits : INFO(8o de si) STAT(8×u16 de si+0xA1) JETS(par
; participant : marqueur si nœud +0x39 bit ET type +0x00=='F-16' 0x36312D46) KILL(par
; participant : u16 +0x3E, u16 +0x40, descripteur 8o via Expr_LookupBuiltinFuncDesc_52C5F)
; EXIT(1o de byte_706AF) DIED(par équipe : Expr_Node_LookupAndConvert_52D69(si+0x34))
; SCOR(score). Sauvegarde du résultat de mission pour la campagne. Détail : DATA_MODEL.md
; §6.6a.
; ==============================================================================================
MissionScenario_ResolveAndBindExpressions_A8F22	proc far		; CODE XREF: VROOMM_StubThunk_6CE56J MissionScenario_RecomputeFields_A9382+4Cp

var_12C		= word ptr -12Ch
var_CF		= dword	ptr -0CFh
var_CB		= dword	ptr -0CBh
var_C7		= dword	ptr -0C7h
var_B2		= word ptr -0B2h
var_B0		= word ptr -0B0h
var_84		= word ptr -84h
var_64		= word ptr -64h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= dword	ptr -10h
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= dword	ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 12Ch
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	ax, 1209h
		mov	bx, 5650h
		xor	cx, cx
		int	15h
		mov	cl, 1
		mov	byte_6E33B, cl
		push	seg seg215
		push	offset a_iff	; ".IFF"
		push	ds
		push	offset aMisn2op	; "MISN2OP"
		push	ds
		push	offset unk_70720
		lea	ax, [bp+var_64]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh

loc_A8F58:
		lea	ax, [bp+var_84]
		push	ax
		push	si
		push	cs
		call	near ptr MissionScenario_ResolveFieldEntry_A8B37

loc_A8F62:
		add	sp, 4
		mov	[bp+var_2], ax

loc_A8F68:
		lea	ax, [bp+var_12C]
		push	ax
		call	StreamReader_ConstructVariantA_63A39

loc_A8F72:
		pop	cx

loc_A8F73:
		mov	[bp+var_12C], 2C8h
		mov	[bp+var_CB], 100h
		mov	[bp+var_CF], 0
		mov	[bp+var_12C], 2E0h
		mov	[bp+var_B0], 0
		xor	ax, ax
		mov	[bp+var_B2], ax
		movsx	eax, ax
		mov	[bp+var_C7], eax
		mov	[bp+var_12C], 36A5h
		push	0
		lea	ax, [bp+var_64]
		push	ax
		lea	ax, [bp+var_12C]
		push	ax
		call	StreamReader_ReadDispatch_63D0E
		add	sp, 6

loc_A8FBF:
		mov	al, 0

loc_A8FC1:
		push	large 0

loc_A8FC4:
		push	large 4E564E49h
		lea	ax, [bp+var_12C]
		push	ax
		call	ResourceRecord_WriteFieldGroupB_64EC0
		add	sp, 0Ah
		lea	ax, [bp+var_12C]
		push	ax
		call	ResourceRecord_AllocateAndDecodeVariant_64F56
		pop	cx
		push	large 0
		push	large 4F464E49h
		lea	ax, [bp+var_12C]
		push	ax
		call	ResourceRecord_WriteFieldGroupA_64E50
		add	sp, 0Ah
		mov	word ptr [bp+var_6+2], ds
		mov	word ptr [bp+var_6], si
		push	large [bp+var_C7]
		push	large 8
		push	large [bp+var_6]
		lea	ax, [bp+var_12C]
		push	ax
		call	StreamReader_WriteTyped_6568F
		add	sp, 0Eh
		add	[bp+var_C7], 8
		lea	ax, [bp+var_12C]
		push	ax
		call	ResourceRecord_WriteFieldWrapper_64FD8
		pop	cx
		push	large 0
		push	large 54415453h
		lea	ax, [bp+var_12C]
		push	ax
		call	ResourceRecord_WriteFieldGroupA_64E50
		add	sp, 0Ah
		xor	di, di
		jmp	short loc_A906E
; ���������������������������������������������������������������������������

loc_A9042:				; CODE XREF: MissionScenario_ResolveAndBindExpressions_A8F22+14Fj
		mov	bx, di
		shl	bx, 1
		mov	ax, [bx+si+0A1h]
		mov	[bp+var_8], ax
		push	large [bp+var_C7]

loc_A9052:
		push	large 2
		push	ss

loc_A9056:
		lea	ax, [bp+var_8]
		push	ax

loc_A905A:
		lea	ax, [bp+var_12C]
		push	ax

loc_A905F:
		call	StreamReader_WriteTyped_6568F

loc_A9064:
		add	sp, 0Eh

loc_A9067:
		add	[bp+var_C7], 2
		inc	di

loc_A906E:				; CODE XREF: MissionScenario_ResolveAndBindExpressions_A8F22+11Ej
		cmp	di, 8
		jl	short loc_A9042
		lea	ax, [bp+var_12C]
		push	ax
		call	ResourceRecord_WriteFieldWrapper_64FD8
		pop	cx
		push	large 0
		push	large 5354454Ah
		lea	ax, [bp+var_12C]
		push	ax
		call	ResourceRecord_WriteFieldGroupA_64E50
		add	sp, 0Ah
		mov	[bp+var_8], 0
		xor	di, di
		jmp	short loc_A90DF
; ���������������������������������������������������������������������������

loc_A909D:				; CODE XREF: MissionScenario_ResolveAndBindExpressions_A8F22+1C0j
		mov	bx, di
		shl	bx, 2
		lea	ax, [bp+var_84]
		add	bx, ax
		mov	ax, [bx+2]
		mov	dx, [bx]
		mov	[bp-0Ch], ax
		mov	word ptr [bp+var_10+2],	dx
		mov	bx, di
		shl	bx, 2

loc_A90B8:
		lea	ax, [bp+var_84]

loc_A90BC:
		add	bx, ax
		les	bx, [bx]

loc_A90C0:
		mov	al, es:[bx+39h]
		shl	ax, 0Eh
		sar	ax, 0Fh
		or	ax, ax
		jz	short loc_A90DE
		les	bx, [bp+var_10+2]
		cmp	dword ptr es:[bx], 36312D46h
		jnz	short loc_A90DE
		inc	[bp+var_8]

loc_A90DE:				; CODE XREF: MissionScenario_ResolveAndBindExpressions_A8F22+1AAj
					; MissionScenario_ResolveAndBindExpressions_A8F22+1B7j
		inc	di

loc_A90DF:				; CODE XREF: MissionScenario_ResolveAndBindExpressions_A8F22+179j
		cmp	di, [bp+var_2]
		jl	short loc_A909D
		mov	ax, [bp+var_8]
		mov	[bp+var_A], ax
		push	large [bp+var_C7]
		push	large 2
		push	ss
		lea	ax, [bp+var_A]
		push	ax
		lea	ax, [bp+var_12C]
		push	ax
		call	StreamReader_WriteTyped_6568F
		add	sp, 0Eh
		add	[bp+var_C7], 2
		lea	ax, [bp+var_12C]
		push	ax
		call	ResourceRecord_WriteFieldWrapper_64FD8
		pop	cx
		xor	di, di
		jmp	short loc_A9136
; ���������������������������������������������������������������������������

loc_A9119:				; CODE XREF: MissionScenario_ResolveAndBindExpressions_A8F22+217j
		mov	ax, si
		add	ax, 0B1h ; '�'
		push	ax
		mov	bx, di
		shl	bx, 2
		lea	ax, [bp+var_84]
		add	bx, ax
		push	large dword ptr	[bx]
		call	VROOMM_StubThunk_6CF26
		add	sp, 6
		inc	di

loc_A9136:				; CODE XREF: MissionScenario_ResolveAndBindExpressions_A8F22+1F5j
		cmp	di, [bp+var_2]
		jl	short loc_A9119
		lea	ax, [bp+var_12C]
		push	ax
		mov	ax, si
		add	ax, 0B1h ; '�'
		push	ax
		call	VROOMM_StubThunk_6CF71
		add	sp, 4
		push	large 0

loc_A9151:
		push	large 4C4C494Bh

loc_A9157:
		lea	ax, [bp+var_12C]
		push	ax
		call	ResourceRecord_WriteFieldGroupA_64E50

loc_A9161:
		add	sp, 0Ah
		xor	di, di
		jmp	loc_A9203
; ���������������������������������������������������������������������������

loc_A9169:				; CODE XREF: MissionScenario_ResolveAndBindExpressions_A8F22+2E6j
		mov	bx, di
		shl	bx, 2
		lea	ax, [bp+var_84]
		add	bx, ax
		mov	ax, [bx+2]
		mov	dx, [bx]
		mov	[bp+var_A], ax
		mov	[bp-0Ch], dx
		les	bx, [bp-0Ch]
		mov	ax, es:[bx+3Eh]
		mov	word ptr [bp+var_10+2],	ax
		push	large [bp+var_C7]
		push	large 2
		push	ss
		lea	ax, [bp+var_10+2]
		push	ax
		lea	ax, [bp+var_12C]
		push	ax
		call	StreamReader_WriteTyped_6568F
		add	sp, 0Eh
		add	[bp+var_C7], 2
		les	bx, [bp-0Ch]
		mov	ax, es:[bx+40h]

loc_A91B0:
		mov	word ptr [bp+var_10], ax

loc_A91B3:
		push	large [bp+var_C7]
		push	large 2
		push	ss

loc_A91BC:
		lea	ax, [bp+var_10]
		push	ax

loc_A91C0:
		lea	ax, [bp+var_12C]

loc_A91C4:
		push	ax
		call	StreamReader_WriteTyped_6568F
		add	sp, 0Eh
		add	[bp+var_C7], 2
		push	large dword ptr	[bp-0Ch]
		call	Expr_LookupBuiltinFuncDesc_52C5F
		add	sp, 4
		mov	[bp+var_12], dx
		mov	[bp+var_14], ax
		push	large [bp+var_C7]
		push	large 8
		push	dx
		push	ax
		lea	ax, [bp+var_12C]
		push	ax
		call	StreamReader_WriteTyped_6568F
		add	sp, 0Eh
		add	[bp+var_C7], 8
		inc	di

loc_A9203:				; CODE XREF: MissionScenario_ResolveAndBindExpressions_A8F22+244j
		cmp	di, [bp+var_2]
		jge	short loc_A920B
		jmp	loc_A9169
; ���������������������������������������������������������������������������

loc_A920B:				; CODE XREF: MissionScenario_ResolveAndBindExpressions_A8F22+2E4j
		lea	ax, [bp+var_12C]
		push	ax
		call	ResourceRecord_WriteFieldWrapper_64FD8
		pop	cx
		push	large 0
		push	large 54495845h
		lea	ax, [bp+var_12C]
		push	ax
		call	ResourceRecord_WriteFieldGroupA_64E50
		add	sp, 0Ah
		mov	al, byte_706AF
		mov	byte ptr [bp+var_8+1], al
		push	large [bp+var_C7]
		push	large 1
		push	ss
		lea	ax, [bp+var_8+1]
		push	ax
		lea	ax, [bp+var_12C]
		push	ax
		call	StreamReader_WriteTyped_6568F
		add	sp, 0Eh
		inc	[bp+var_C7]

loc_A9251:
		lea	ax, [bp+var_12C]
		push	ax
		call	ResourceRecord_WriteFieldWrapper_64FD8
		pop	cx
		push	large 0

loc_A925F:
		push	large 44454944h
		lea	ax, [bp+var_12C]
		push	ax
		call	ResourceRecord_WriteFieldGroupA_64E50
		add	sp, 0Ah
		xor	di, di

loc_A9274:
		jmp	short loc_A92DD
; ���������������������������������������������������������������������������

loc_A9276:				; CODE XREF: MissionScenario_ResolveAndBindExpressions_A8F22+3BEj
		mov	ax, di
		imul	ax, 9
		mov	dx, si
		add	dx, ax
		add	dx, 86h	; '�'
		mov	[bp+var_A], dx
		push	ds
		push	dx
		mov	ax, si
		add	ax, 34h	; '4'
		push	ax
		call	Expr_Node_LookupAndConvert_52D69
		add	sp, 6
		mov	[bp-0Ch], dx
		mov	word ptr [bp+var_10+2],	ax
		cmp	[bp+var_10+2], 0
		jz	short loc_A92DC
		les	bx, [bp+var_10+2]
		mov	al, es:[bx+39h]
		shl	ax, 0Eh
		sar	ax, 0Fh
		or	al, al
		jz	short loc_A92DC
		mov	ax, [bp+var_A]
		mov	word ptr [bp+var_10], ds
		mov	[bp+var_12], ax

loc_A92BD:
		push	large [bp+var_C7]

loc_A92C2:
		push	large 8
		push	word ptr [bp+var_10]

loc_A92C8:
		push	ax
		lea	ax, [bp+var_12C]
		push	ax
		call	StreamReader_WriteTyped_6568F
		add	sp, 0Eh
		add	[bp+var_C7], 8

loc_A92DC:				; CODE XREF: MissionScenario_ResolveAndBindExpressions_A8F22+37Fj
					; MissionScenario_ResolveAndBindExpressions_A8F22+390j
		inc	di

loc_A92DD:				; CODE XREF: MissionScenario_ResolveAndBindExpressions_A8F22:loc_A9274j
		cmp	di, 3
		jl	short loc_A9276
		lea	ax, [bp+var_12C]
		push	ax
		call	ResourceRecord_WriteFieldWrapper_64FD8
		pop	cx
		push	large 0
		push	large 524F4353h
		lea	ax, [bp+var_12C]
		push	ax
		call	ResourceRecord_WriteFieldGroupA_64E50
		add	sp, 0Ah
		cmp	dword_706AB, 0
		jge	short loc_A9314
		mov	dword_706AB, 0

loc_A9314:				; CODE XREF: MissionScenario_ResolveAndBindExpressions_A8F22+3E7j
		mov	eax, dword_706AB
		mov	[bp-0Ch], eax
		sar	eax, 8
		mov	[bp-0Ch], eax
		mov	[bp+var_10], eax
		push	large [bp+var_C7]
		push	large 4
		push	ss
		lea	ax, [bp+var_10]
		push	ax
		lea	ax, [bp+var_12C]
		push	ax
		call	StreamReader_WriteTyped_6568F
		add	sp, 0Eh
		add	[bp+var_C7], 4
		lea	ax, [bp+var_12C]
		push	ax
		call	ResourceRecord_WriteFieldWrapper_64FD8
		pop	cx

loc_A9353:
		lea	ax, [bp+var_12C]
		push	ax
		call	ResourceRecord_SeekAndRelease_64FE7
		pop	cx

loc_A935E:
		mov	[bp+var_12C], 2E0h

loc_A9364:
		lea	ax, [bp+var_12C]

loc_A9368:
		push	ax

loc_A9369:
		call	ResourceRecord_Helper_645A5
		pop	cx
		push	0
		lea	ax, [bp+var_12C]
		push	ax
		call	StreamReader_ReleaseBuffer_65643
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
MissionScenario_ResolveAndBindExpressions_A8F22	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, 58 lignes, LUE INTEGRALEMENT (session ordres de mission avec Remi). Appelee CHAQUE
; FRAME directement depuis Simulator_MainLoop_53896 (via VROOMM_StubThunk_6CE5B) — chemin
; SEPARE et PARALLELE a MAIN_GAME_TICK_536F7, pas decouvert avant.   Declenche
; Scene_TriggerMissionUpdateEvent_53211 sur DEUX pointeurs de SceneRecord stockes sur
; MissionScenario : +0x50 et +0x4E. CORRIGE DATA_MODEL.md : ces deux champs ne sont PAS
; 'handle de noeud Expr'/'flag HOME depuis noeud' comme documente precedemment — ce sont des
; pointeurs de SceneRecord (+0x50 correspond exactement au champ rempli par
; Scene_DetectAndActivateChange_532EA).   Verifie ensuite une condition de fin de mission
; (position comparee a dword_70718/dword_7071C, une cible/checkpoint global) — si atteinte,
; POSE byte_706AF = 5 -- LE MEME OCTET QUI CONTROLE LA BOUCLE PRINCIPALE DE Simulator_MainLoop
; (condition de sortie == 6). Lien direct entre logique de scenario et controle du jeu a ce
; niveau.   Appelle enfin MissionScenario_ResolveAndBindExpressions_A8F22 (ecrit MISN2OP.IFF,
; resultats de fin de mission) — a chaque frame, sans garde visible ici (garde probablement
; interne a A8F22, non verifiee). Appelle aussi sub_A8124 et sub_6CDBE, non identifiees.
; ==============================================================================================
MissionScenario_RecomputeFields_A9382	proc far		; CODE XREF: VROOMM_StubThunk_6CE5BJ

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+50h], 0
		jz	short loc_A9398
		push	word ptr [si+50h]
		call	Scene_TriggerMissionUpdateEvent_53211
		pop	cx

loc_A9398:				; CODE XREF: MissionScenario_RecomputeFields_A9382+Bj
		cmp	word ptr [si+4Eh], 0
		jz	short loc_A93A7
		push	word ptr [si+4Eh]
		call	Scene_TriggerMissionUpdateEvent_53211
		pop	cx

loc_A93A7:				; CODE XREF: MissionScenario_RecomputeFields_A9382+1Aj
		mov	eax, [si]
		cmp	eax, dword_70718
		jnz	short loc_A93C1
		mov	eax, [si+4]

loc_A93B5:
		cmp	eax, dword_7071C
		jnz	short loc_A93C1

loc_A93BC:
		mov	ax, 1
		jmp	short loc_A93C3
; ���������������������������������������������������������������������������

loc_A93C1:				; CODE XREF: MissionScenario_RecomputeFields_A9382+2Dj
					; MissionScenario_RecomputeFields_A9382+38j
		xor	ax, ax

loc_A93C3:				; CODE XREF: MissionScenario_RecomputeFields_A9382+3Dj
		or	al, al
		jz	short loc_A93CC
		mov	byte_706AF, 5

loc_A93CC:				; CODE XREF: MissionScenario_RecomputeFields_A9382+43j
		push	si
		push	cs
		call	near ptr MissionScenario_ResolveAndBindExpressions_A8F22
		pop	cx
		push	si
		push	cs
		call	near ptr MissionScenario_ConstructFieldChain_A8124
		pop	cx
		call	VROOMM_StubThunk_6CDBE
		pop	si
		pop	bp
		retf
MissionScenario_RecomputeFields_A9382	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine ResourceRecord_Helper_645A5, StreamReader_ReleaseBuffer_65643 (seg195), libère
; l'objet (sub_338).
; ==============================================================================================
MissionScenario_ReleaseStreamA_A93E0	proc far		; CODE XREF: VROOMM_StubThunk_6CE15J

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_A9414
		mov	word ptr [si], 2E0h
		push	si
		call	ResourceRecord_Helper_645A5
		pop	cx
		push	0
		push	si
		call	StreamReader_ReleaseBuffer_65643
		add	sp, 4
		test	di, 1
		jz	short loc_A9414
		push	si
		call	CRT_FreeNear_Wrap
		pop	cx
		jmp	short $+2

loc_A9414:				; CODE XREF: MissionScenario_ReleaseStreamA_A93E0+Dj
					; MissionScenario_ReleaseStreamA_A93E0+29j
		pop	di
		pop	si
		pop	bp
		retf
MissionScenario_ReleaseStreamA_A93E0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, même motif que MissionScenario_ReleaseStreamA_A93E0.
; ==============================================================================================
MissionScenario_ReleaseStreamB_A9418	proc far		; CODE XREF: VROOMM_StubThunk_6CE10J

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_A944C
		mov	word ptr [si], 2E0h
		push	si
		call	ResourceRecord_Helper_645A5
		pop	cx
		push	0
		push	si
		call	StreamReader_ReleaseBuffer_65643
		add	sp, 4
		test	di, 1
		jz	short loc_A944C
		push	si
		call	CRT_FreeNear_Wrap
		pop	cx
		jmp	short $+2

loc_A944C:				; CODE XREF: MissionScenario_ReleaseStreamB_A9418+Dj
					; MissionScenario_ReleaseStreamB_A9418+29j
		pop	di
		pop	si
		pop	bp
		retf
MissionScenario_ReleaseStreamB_A9418	endp

seg456		ends
