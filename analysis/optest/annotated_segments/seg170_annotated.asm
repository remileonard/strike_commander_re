seg170		segment	byte public 'UNK' use16
		assume cs:seg170
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing
unk_41600	db    0			; DATA XREF: seg170:0636o
		db    0
word_41602	dw 4FCh			; DATA XREF: VROOMM_InstallIntHandler_3FBA8+16r
seg_41604	dw seg seg166		; DATA XREF: VROOMM_InstallIntHandler_3FBA8+1Ar
byte_41606	db 0			; DATA XREF: VROOMM_TryOpenFile_3FCCB+22r
		align 10h
		db  4Eh	; N
		db    9
off_41612	dw offset nullsub_7	; DATA XREF: seg166:01B6r
off_41614	dw offset nullsub_7	; DATA XREF: seg166:01B1r
off_41616	dd nullsub_4		; DATA XREF: VROOMM_ScanMemoryArena_3FD83+B0r
					; seg166:0554r	...
		db  0Eh
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
word_416A0	dw 3FCDh		; DATA XREF: VROOMM_OpenAndParseOverlayFile_3FA78+Fr seg166:07E9r ...
		align 4
word_416A4	dw 0			; DATA XREF: VROOMM_OpenAndParseOverlayFile_3FA78:loc_3FB35w
word_416A6	dw 0			; DATA XREF: VROOMM_OpenAndParseOverlayFile_3FA78+C0w
word_416A8	dw 0			; DATA XREF: VROOMM_OpenAndParseOverlayFile_3FA78+112w
word_416AA	dw 0			; DATA XREF: VROOMM_OpenAndParseOverlayFile_3FA78+102r
					; seg166:08FEr
		align 8
word_416B0	dw 0			; DATA XREF: VROOMM_OpenAndParseOverlayFile_3FA78+EDw
word_416B2	dw 0			; DATA XREF: VROOMM_ScanFreeMemoryBlocks_3FD03+30w
word_416B4	dw 0			; DATA XREF: VROOMM_OpenAndParseOverlayFile_3FA78+EAw
					; VROOMM_OpenAndParseOverlayFile_3FA78+FEr ...
word_416B6	dw 0			; DATA XREF: VROOMM_OpenAndParseOverlayFile_3FA78+F3w
					; VROOMM_OpenAndParseOverlayFile_3FA78+FAr ...
word_416B8	dw 0			; DATA XREF: VROOMM_OpenAndParseOverlayFile_3FA78+4Cw
					; VROOMM_OpenAndParseOverlayFile_3FA78+DBw ...
		align 4
word_416BC	dw 0			; DATA XREF: VROOMM_UpdateFreeListOffset_4019D+Dr
					; VROOMM_UpdateFreeListOffset_4019D+14w
off_416BE	dd EntryPoint_RuntimeInit		; DATA XREF: VROOMM_OpenAndParseOverlayFile_3FA78+26o
		db 0D3h	; �
		db  30h	; 0
		db    1
		db    0
		dd 30D0000h
		db  26h	; &
		db    4
		db    1
		db    0
		dd 34F0003h
		db 0E8h	; �
		db  0Eh
		db    1
		db    0
		dd 43D0006h
		db 0ECh	; �
		db    5
		db    1
		db    0
		dd 49B0008h
		db  8Bh	; �
		db  0Ch
		db    1
		db    0
		dd loc_563C
		db 0D5h	; �
		db  0Ch
		db    1
		db    0
		dd loc_630A+1
		db  34h	; 4
		db    4
		db    1
		db    0
		dd loc_6735
		db  34h	; 4
		db    2
		db    1
		db    0
		dd loc_6964
		db 0CFh	; �
		db    6
		db    1
		db    0
		dd 7020004h
		db  1Ah
		db    8
		db    1
		db    0
		dd loc_783E+1
		db  0Dh
		db    2
		db    1
		db    0
		dd 7A3000Ah
		db  6Bh	; k
		db  0Bh
		db    1
		db    0
		dd loc_859C+1
		db  78h	; x
		db    5
		db    1
		db    0
		dd loc_8B0B
		db  91h	; �
		db    8
		db    1
		db    0
		dd loc_9398
		db 0ADh	; �
		db  2Dh	; -
		db    1
		db    0
		dd 0C130001h
		db  2Eh	; .
		db    4
		db    1
		db    0
		dd 0C55000Dh
		db  25h	; %
		db    2
		db    1
		db    0
		dd loc_C77D+1
		db  85h	; �
		db    1
		db    1
		db    0
		dd sub_C8F5
		db  46h	; F
		db    3
		db    1
		db    0
		dd 0CC30005h
		db 0ACh	; �
		db    1
		db    1
		db    0
		dd 0CDD0006h
		db 0FCh	; �
		db    4
		db    1
		db    0
		dd sub_D2CC
		db 0ACh	; �
		db  16h
		db    1
		db    0
		dd sub_E96C
		db 0F9h	; �
		db  0Eh
		db    1
		db    0
		dd loc_F85C
		db 0E3h	; �
		db  19h
		db    1
		db    0
		dd loc_11239
		db 0D0h	; �
		db    1
		db    1
		db    0
		dd loc_11403
		db  61h	; a
		db  0Bh
		db    1
		db    0
		dd 11F60000h
		db  23h	; #
		db  1Ch
		db    1
		db    0
		dd 13B80001h
		db 0A2h	; �
		db    1
		db    1
		db    0
		dd loc_13D23
		db  93h	; �
		db  10h
		db    1
		db    0
		dd 14DB0002h
		db 0FCh	; �
		db  14h
		db    1
		db    0
		dd 162A0003h
		db 0DAh	; �
		db    9
		db    1
		db    0
		dd sub_16C7A+2
		db  3Bh	; ;
		db    3
		db    1
		db    0
		dd 16FA000Ah
		db  61h	; a
		db    2
		db    1
		db    0
		dd loc_1720B+1
		db 0D8h	; �
		db  16h
		db    1
		db    0
		dd 188D0002h
		db 0C9h	; �
		db    6
		db    1
		db    0
		dd 18F90008h
		db  40h	; @
		db  11h
		db    1
		db    0
		dd loc_1A0DA
		db 0FCh	; �
		db    0
		db    1
		db    0
		dd 1A1C0000h
		db  80h	; �
		db    2
		db    1
		db    0
		dd loc_1A44A+2
		db  8Bh	; �
		db    0
		db    1
		db    0
		dd 1A4C0000h
		db  79h	; y
		db  0Eh
		db    1
		db    0
		dd loc_1B33A+1
		db  8Bh	; �
		db    1
		db    1
		db    0
		dd 1B4B0009h
		db  67h	; g
		db    0
		db    1
		db    0
		dd loc_1B51A+1
		db  36h	; 6
		db  1Fh
		db    1
		db    0
		dd loc_1D447
		db    6
		db    0
		db    1
		db    0
		dd sub_1D446
		db  3Fh	; ?
		db    2
		db    1
		db    0
		dd 1D670006h
		db  70h	; p
		db    5
		db    1
		db    0
		dd loc_1DBEF
		db 0D5h	; �
		db    7
		db    1
		db    0
		dd 1E3B0000h
		db  4Fh	; O
		db    8
		db    1
		db    0
		dd 1EBF0005h
		db  62h	; b
		db  0Bh
		db    1
		db    0
		dd loc_1F75E+1
		db  4Ch	; L
		db    6
		db    1
		db    0
		dd 1FD90002h
		db 0F3h	; �
		db  12h
		db    1
		db    0
		dd loc_2108A+2
		db  17h
		db    8
		db    1
		db    0
		dd 21890003h
		db  9Ah	; �
		db    5
		db    1
		db    0
		dd 21E20007h
		db  83h	; �
		db    3
		db    1
		db    0
		dd loc_221AA
		db  71h	; q
		db    2
		db    1
		db    0
		dd loc_22412+1
		db  77h	; w
		db    0
		db    1
		db    0
		dd 22480001h
		db  53h	; S
		db    9
		db    1
		db    0
		dd loc_22DD6+1
		db 0E0h	; �
		db    7
		db    1
		db    0
		dd loc_235B3
		db 0CEh	; �
		db  35h	; 5
		db    1
		db    0
		dd 26B70000h
		db 0E3h	; �
		db    8
		db    1
		db    0
		dd loc_2745E
		db 0CEh	; �
		db    0
		db    1
		db    0
		dd 27510004h
		db 0F8h	; �
		db  15h
		db    1
		db    0
		dd loc_28B0E
		db  75h	; u
		db    0
		db    1
		db    0
		dd loc_28B78
		db  84h	; �
		db    6
		db    1
		db    0
		dd loc_291F5
		db  98h	; �
		db    9
		db    1
		db    0
		dd 29B80004h
		db 0CDh	; �
		db    3
		db    1
		db    0
		dd 29F40008h
		db  0Dh
		db    0
		db    1
		db    0
		dd Registry_ResolveOrInsertNode_29F4D
		db  9Fh	; �
		db    9
		db    1
		db    0
		dd 2A8D000Dh
		db 0A7h	; �
		db    8
		db    1
		db    0
		dd loc_2B17D+2
		db  3Dh	; =
		db    2
		db    1
		db    0
		dd 2B3A0007h
		db  7Ah	; z
		db    1
		db    1
		db    0
		dd loc_2B51D
		db  21h	; !
		db    2
		db    1
		db    0
		dd loc_2B739+1
		db  5Ch	; \
		db    4
		db    1
		db    0
		dd 2BB80001h
		db    7
		db    1
		db    1
		db    0
		dd loc_2BC8A+2
		db  29h	; )
		db    1
		db    1
		db    0
		dd 2BDA0007h
		db  58h	; X
		db    1
		db    1
		db    0
		dd loc_2BEF9
		db 0F6h	; �
		db    1
		db    1
		db    0
		dd loc_2C0E7+1
		db  12h
		db    1
		db    1
		db    0
		dd loc_2C1F6
		db  80h	; �
		db    3
		db    1
		db    0
		dd PagedResourceB_TreeSearchRecursive_2C570+2
		db  17h
		db    5
		db    1
		db    0
		dd 2CA80000h
		db 0C0h	; �
		db    0
		db    1
		db    0
		dd loc_2CB47
		db  64h	; d
		db    0
		db    1
		db    0
		dd 2CBA0000h
		db  8Bh	; �
		db    0
		db    1
		db    0
		dd 2CC20004h
		db  0Bh
		db    0
		db    1
		db    0
		dd TextRenderer_GetOrInitFormatState_2CC2B
		db  56h	; V
		db    0
		db    1
		db    0
		dd loc_2CC7A+1
		db  91h	; �
		db    5
		db    1
		db    0
		dd loc_2D205+1
		db 0C7h	; �
		db    7
		db    1
		db    0
		dd 2D9C0001h
		db  8Fh	; �
		db  0Fh
		db    1
		db    0
		dd 2E940007h
		db  64h	; d
		db    0
		db    1
		db    0
		dd loc_2E9AF
		db  50h	; P
		db    3
		db    1
		db    0
		dd loc_2ECF4
		db  17h
		db    0
		db    1
		db    0
		dd 2ED00000h
		db  93h	; �
		db    0
		db    1
		db    0
		dd loc_2ED97
		db  72h	; r
		db    1
		db    1
		db    0
		dd loc_2EF03
		db  8Ah	; �
		db    0
		db    1
		db    0
		dd 2EF80002h
		db  6Dh	; m
		db    0
		db    1
		db    0
		dd 2EFE000Ah
		db  22h	; "
		db    0
		db    1
		db    0
		dd loc_2F00C+2
		db  50h	; P
		db    0
		db    1
		db    0
		dd sub_2F050+2
		db  0Fh
		db    0
		db    1
		db    0
		dd sub_2F050
		db  3Eh	; >
		db    0
		db    1
		db    0
		dd loc_2F08F
		db 0F8h	; �
		db    1
		db    1
		db    0
		dd loc_2F27C+2
		db 0F2h	; �
		db    0
		db    1
		db    0
		dd loc_2F368
		db 0F1h	; �
		db    3
		db    1
		db    0
		dd loc_2F752
		db 0F8h	; �
		db    0
		db    1
		db    0
		dd 2F840001h
		db 0D1h	; �
		db    1
		db    1
		db    0
		dd loc_2FA16+2
		db 0BDh	; �
		db    2
		db    1
		db    0
		dd 2FCC0001h
		db  8Dh	; �
		db    0
		db    1
		db    0
		dd loc_2FD4D
		db  8Ch	; �
		db    0
		db    1
		db    0
		dd loc_2FDCD
		db 0B5h	; �
		db    1
		db    1
		db    0
		dd loc_2FF7C
		db 0B9h	; �
		db    0
		db    1
		db    0
		dd 30020005h
		db 0ACh	; �
		db  0Ch
		db    1
		db    0
		dd 30CC000Ah
		db  5Eh	; ^
		db    4
		db    1
		db    0
		dd 3111000Ch
		db  3Bh	; ;
		db    3
		db    1
		db    0
		dd loc_3144E
		db  5Fh	; _
		db    7
		db    1
		db    0
		dd loc_31BAB
		db  47h	; G
		db    1
		db    1
		db    0
		dd 31CE0000h
		db    9
		db    2
		db    1
		db    0
		dd 31EE0008h
		db  9Bh	; �
		db    0
		db    1
		db    0
		dd 31F7000Ah
		db  59h	; Y
		db    0
		db    1
		db    0
		dd loc_31FCB+1
		db  96h	; �
		db    0
		db    1
		db    0
		dd loc_3205A
		db  47h	; G
		db    3
		db    1
		db    0
		dd 32390006h
		db  55h	; U
		db    3
		db    1
		db    0
		dd Render_FillClippedRect_326E6+2
		db 0FEh	; �
		db    1
		db    1
		db    0
		dd 328D0006h
		db  43h	; C
		db    0
		db    1
		db    0
		dd loc_3291E
		db  48h	; H
		db    1
		db    1
		db    0
		dd 32A50004h
		db  88h	; �
		db    2
		db    1
		db    0
		dd Render_MeasureOrDrawTextString_32CD8
		db  58h	; X
		db    2
		db    1
		db    0
		dd Render_DrawScaledSprite_32F28
		db  32h	; 2
		db    4
		db    1
		db    0
		dd loc_33357+1
		db  18h
		db    0
		db    1
		db    0
		dd 33360002h
		db  40h	; @
		db    1
		db    1
		db    0
		dd loc_334A8
		db 0E6h	; �
		db    0
		db    1
		db    0
		dd 33580000h
		db    3
		db    4
		db    1
		db    0
		dd loc_33985+1
		db  3Ch	; <
		db    1
		db    1
		db    0
		dd 33AB0004h
		db 0EBh	; �
		db    0
		db    1
		db    0
		dd sub_33B9C
		db 0E8h	; �
		db    2
		db    1
		db    0
		dd loc_33E7B+1
		db 0FAh	; �
		db    1
		db    1
		db    0
		dd 34060008h
		db 0E7h	; �
		db  11h
		db    1
		db    0
		dd loc_35248+2
		db  99h	; �
		db  2Bh	; +
		db    1
		db    0
		dd 37DD0008h
		db 0F4h	; �
		db    5
		db    1
		db    0
		dd loc_383C9+1
		db 0F5h	; �
		db    7
		db    1
		db    0
		dd 38BB0004h
		db 0DCh	; �
		db  0Fh
		db    1
		db    0
		dd 39B80006h
		db  0Ch
		db    6
		db    1
		db    0
		dd loc_3A18C
		db 0AAh	; �
		db    7
		db    1
		db    0
		dd loc_3A92B+1
		db  35h	; 5
		db    0
		db    1
		db    0
		dd File_ReadOrDelegateToPaged_3A957+3
		db  53h	; S
		db    3
		db    1
		db    0
		dd loc_3ACA5+1
		db  52h	; R
		db    0
		db    1
		db    0
		dd loc_3ACF3+1
		db  3Ah	; :
		db    0
		db    1
		db    0
		dd 3AD20002h
		db 0FEh	; �
		db    0
		db    1
		db    0
		dd 3AE1000Ah
		db  5Fh	; _
		db    3
		db    1
		db    0
		dd 3B16000Eh
		db 0C0h	; �
		db    7
		db    1
		db    0
		dd loc_3B92E+1
		db 0A3h	; �
		db    2
		db    1
		db    0
		dd 3BBC0000h
		db 0BBh	; �
		db    1
		db    1
		db    0
		dd 3BD70003h
		db  1Dh
		db    9
		db    1
		db    0
		dd 3C68000Bh
		db  1Eh
		db    7
		db    1
		db    0
		dd 3CD9000Dh
		db 0B0h	; �
		db    4
		db    1
		db    0
		dd loc_3D24D+1
		db  4Fh	; O
		db    5
		db    1
		db    0
		dd word_3D790
		db  8Fh	; �
		db    2
		db    1
		db    0
		dd 3DA10000h
		db 0ACh	; �
		db    1
		db    1
		db    0
		dd loc_3DBBF
		db  96h	; �
		db    0
		db    1
		db    0
		dd loc_3DC4A+2
		db  11h
		db    3
		db    1
		db    0
		dd loc_3DF55+1
		db  98h	; �
		db    3
		db    1
		db    0
		dd 3E2E0001h
		db 0FEh	; �
		db    2
		db    1
		db    0
		dd 3E5D0008h
		db  18h
		db    2
		db    1
		db    0
		dd loc_3E7EC+2
		db 0ABh	; �
		db    2
		db    1
		db    0
		dd 3EA80008h
		db  58h	; X
		db    3
		db    1
		db    0
		dd loc_3EDDB
		db  43h	; C
		db    0
		db    1
		db    0
		dd loc_3EE17+1
		db  49h	; I
		db    2
		db    1
		db    0
		dd 3F050003h
		db 0C9h	; �
		db    5
		db    1
		db    0
		dd TextScrollDisplayB_ConstructAndReset_3F619
		db    0
		db    3
		db    1
		db    0
		dd byte_3F910+9
		align 4
		db    1
		db    0
		dd byte_3F910
		db 0CAh	; �
		db    0
		db    1
		db    0
		dd 3F9D0000h
		db  9Dh	; �
		db    0
		db    1
		db    0
		dd 3FA6000Ah
		db  50h	; P
		db    9
		db    1
		db    0
		dd unk_403BD
		align 8
		dw seg seg167
		db  3Bh	; ;
		db    6
		db    0
		db    0
		dd a_iff_0		; ".IFF"
		db    5
		db    0
		db    0
		db    0
		dd unk_40A00
		db    0
		db  0Ch
		db    0
		db    0
		dd unk_41600
		align 8
		dw seg seg170
		align 8
		dw seg seg170
		db 0E8h	; �
		db    8
		db    0
		db    0
		dd 416A0000h
		db 0FFh
		db 0FFh
		db    4
		db    0
		dd 416C0000h
		db 0FFh
		db 0FFh
		db    4
		db    0
		dd 416C0000h
		db 0FFh
		db 0FFh
		db    4
		db    0
		dd 416C0000h
		db 0FFh
		db 0FFh
		db    4
		db    0
		dd 416C0000h
		db 0FFh
		db 0FFh
		db    4
		db    0
		dd stru_41EF0
		align 4
		db    1
		db    0
		dd stru_41EF0
		db  6Bh	; k
		db    0
		db    3
		db    0
		dd stru_41F60
		db  98h	; �
		db    0
		db    3
		db    0
		dd stru_42000
		db  2Ah	; *
		db    0
		db    3
		db    0
		dd stru_42030
		db  39h	; 9
		db    0
		db    3
		db    0
		dd stru_42070
		db  48h	; H
		db    0
		db    3
		db    0
		dd stru_420C0
		db  2Fh	; /
		db    0
		db    3
		db    0
		dd stru_420F0
		db  7Ah	; z
		db    0
		db    3
		db    0
		dd stru_42170
		db 0CAh	; �
		db    0
		db    3
		db    0
		dd stru_42240
		db  52h	; R
		db    0
		db    3
		db    0
		dd stru_422A0
		db  3Eh	; >
		db    0
		db    3
		db    0
		dd stru_422E0
		db  3Eh	; >
		db    0
		db    3
		db    0
		dd stru_42320
		db  61h	; a
		db    0
		db    3
		db    0
		dd stru_42390
		db  2Ah	; *
		db    0
		db    3
		db    0
		dd stru_423C0
		db  25h	; %
		db    0
		db    3
		db    0
		dd stru_423F0
		db  25h	; %
		db    0
		db    3
		db    0
		dd stru_42420
		db  25h	; %
		db    0
		db    3
		db    0
		dd stru_42450
		db  25h	; %
		db    0
		db    3
		db    0
		dd stru_42480
		db  25h	; %
		db    0
		db    3
		db    0
		dd stru_424B0
		db  25h	; %
		db    0
		db    3
		db    0
		dd stru_424E0
		db  25h	; %
		db    0
		db    3
		db    0
		dd stru_42510
		db  25h	; %
		db    0
		db    3
		db    0
		dd stru_42540
		db  25h	; %
		db    0
		db    3
		db    0
		dd stru_42570
		db  25h	; %
		db    0
		db    3
		db    0
		dd stru_425A0
		db  25h	; %
		db    0
		db    3
		db    0
		dd stru_425D0
		db  25h	; %
		db    0
		db    3
		db    0
		dd stru_42600
		db  25h	; %
		db    0
		db    3
		db    0
		dd stru_42630
		db  25h	; %
		db    0
		db    3
		db    0
		dd stru_42660
		db  2Fh	; /
		db    0
		db    3
		db    0
		dd stru_42690
		db  2Ah	; *
		db    0
		db    3
		db    0
		dd stru_426C0
		db  52h	; R
		db    0
		db    3
		db    0
		dd stru_42720
		db 0B1h	; �
		db    0
		db    3
		db    0
		dd stru_427E0
		db  39h	; 9
		db    0
		db    3
		db    0
		dd stru_42820
		db  89h	; �
		db    0
		db    3
		db    0
		dd stru_428B0
		db  70h	; p
		db    0
		db    3
		db    0
		dd stru_42920
		db  43h	; C
		db    0
		db    3
		db    0
		dd stru_42970
		db  34h	; 4
		db    0
		db    3
		db    0
		dd stru_429B0
		db  52h	; R
		db    0
		db    3
		db    0
		dd stru_42A10
		db  2Ah	; *
		db    0
		db    3
		db    0
		dd stru_42A40
		db  2Ah	; *
		db    0
		db    3
		db    0
		dd stru_42A70
		db  6Bh	; k
		db    0
		db    3
		db    0
		dd stru_42AE0
		db  5Ch	; \
		db    0
		db    3
		db    0
		dd stru_42B40
		db  2Ah	; *
		db    0
		db    3
		db    0
		dd stru_42B70
		db  25h	; %
		db    0
		db    3
		db    0
		dd stru_42BA0
		db  25h	; %
		db    0
		db    3
		db    0
		dd stru_42BD0
		db  25h	; %
		db    0
		db    3
		db    0
		dd stru_42C00
		db  25h	; %
		db    0
		db    3
		db    0
		dd stru_42C30
		db  25h	; %
		db    0
		db    3
		db    0
		dd stru_42C60
		db  25h	; %
		db    0
		db    3
		db    0
		dd stru_42C90
		db  25h	; %
		db    0
		db    3
		db    0
		dd stru_42CC0
		db  25h	; %
		db    0
		db    3
		db    0
		dd stru_42CF0
		db  25h	; %
		db    0
		db    3
		db    0
		dd stru_42D20
		db  2Ah	; *
		db    0
		db    3
		db    0
		dd stru_42D50
		db  25h	; %
		db    0
		db    3
		db    0
		dd stru_42D80
		db  25h	; %
		db    0
		db    3
		db    0
		dd stru_42DB0
		db  25h	; %
		db    0
		db    3
		db    0
		dd stru_42DE0
		db  25h	; %
		db    0
		db    3
		db    0
		dd stru_42E10
		db  2Fh	; /
		db    0
		db    3
		db    0
		dd stru_42E40
		db  39h	; 9
		db    0
		db    3
		db    0
		dd stru_42E80
		db  57h	; W
		db    0
		db    3
		db    0
		dd stru_42EE0
		db  25h	; %
		db    0
		db    3
		db    0
		dd stru_42F10
		db  39h	; 9
		db    0
		db    3
		db    0
		dd stru_42F50
		db  84h	; �
		db    0
		db    3
		db    0
		dd stru_42FE0
		db  34h	; 4
		db    0
		db    3
		db    0
		dd unk_43020
		db  20h
		db  71h	; q
		db    0
		db    0
		dd 488D0000h
		db  0Dh
		db    0
		db    4
		db    0
		dd 488E000Eh
		db 0FFh
		db 0FFh
		db    4
		db    0
		dd 488E0000h
		db    5
		db    0
		db    4
		db    0
		dd 488E0006h
		db    5
		db    0
		db    4
		db    0
		dd 489B0006h
		db    1
		db    0
		db    4
		db    0
		dd 489B0002h
		db    1
		db    0
		db    4
		db    0
		dd 48A20002h
		db    3
		db    0
		db    4
		db    0
		dd 48A20004h
		db    3
		db    0
		db    4
		db    0
		dd 498B0004h
		db    1
		db    0
		db    4
		db    0
		dd 498C0002h
		db 0FFh
		db 0FFh
		db    4
		db    0
		dd 49940000h
		db 0FFh
		db 0FFh
		db    4
		db    0
		db    0
		db    0
aOpttest_exe	db 'opttest.exe',0      ; DATA XREF: VROOMM_OpenAndParseOverlayFile_3FA78+26o
		db    1
		db    4
		db 0C9h	; �
		db    7
seg170		ends
