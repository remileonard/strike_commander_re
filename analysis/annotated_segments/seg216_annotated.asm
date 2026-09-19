seg216		segment	byte public 'UNK' use16
		assume cs:seg216
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
unk_69DE0	db    0			; DATA XREF: seg216:078Eo
		db    0
word_69DE2	dw 4F8h			; DATA XREF: VROOMM_Helper_68384+16r
seg_69DE4	dw seg seg212		; DATA XREF: VROOMM_Helper_68384+1Ar
byte_69DE6	db 0			; DATA XREF: VROOMM_OpenFile_684A7+22r
		align 10h
		db  4Ah	; J
		db    9
off_69DF2	dw offset nullsub_7	; DATA XREF: seg212:loc_683F2r
off_69DF4	dw offset nullsub_7	; DATA XREF: seg212:01ADr
off_69DF6	dd nullsub_1		; DATA XREF: VROOMM_AllocateAndRelocate_6855F+B0r
					; seg212:0550r	...
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
unk_69E1A	db    0
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
unk_69E44	db    0
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
unk_69E63	db    0
		db    0
		db    0
		db    0
		db    0
unk_69E68	db    0
		db    0
		db    0
		db    0
		db    0
unk_69E6D	db    0
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
word_69E80	dw 3FCDh		; DATA XREF: VROOMM_LocateAndValidate_68254:loc_68263r
					; seg212:07E5r	...
		align 4
word_69E84	dw 0			; DATA XREF: VROOMM_LocateAndValidate_68254:loc_68311w
word_69E86	dw 0			; DATA XREF: VROOMM_LocateAndValidate_68254:loc_68314w
word_69E88	dw 0			; DATA XREF: VROOMM_LocateAndValidate_68254+112w
word_69E8A	dw 0			; DATA XREF: VROOMM_LocateAndValidate_68254:loc_68356r
					; seg212:08FAr
		align 8
word_69E90	dw 0			; DATA XREF: VROOMM_LocateAndValidate_68254:loc_68341w
word_69E92	dw 0			; DATA XREF: VROOMM_ReadAndParseHeader_684DF+30w
word_69E94	dw 0			; DATA XREF: VROOMM_LocateAndValidate_68254+EAw
					; VROOMM_LocateAndValidate_68254:loc_68352r	...
word_69E96	dw 0			; DATA XREF: VROOMM_LocateAndValidate_68254+F3w
					; VROOMM_LocateAndValidate_68254+FAr ...
word_69E98	dw 0			; DATA XREF: VROOMM_LocateAndValidate_68254+4Cw
					; VROOMM_LocateAndValidate_68254:loc_6832Fw	...
		align 4
word_69E9C	dw 0			; DATA XREF: VROOMM_AdvanceLoadPointer_68979+Dr
					; VROOMM_AdvanceLoadPointer_68979+14w
off_69E9E	dd EntryPoint_RuntimeInit		; DATA XREF: VROOMM_LocateAndValidate_68254:loc_6827Ao
		db  5Bh	; [
		db  31h	; 1
		db    1
		db    0
		dd 3150000h
		db  40h	; @
		db  0Dh
		db    1
		db    0
		dd loc_3E99+2
		db 0F0h	; �
		db  10h
		db    1
		db    0
		dd loc_4F80
		db 0CCh	; �
		db  31h	; 1
		db    1
		db    0
		dd 8140000h
		db 0C7h	; �
		db  21h	; !
		db    1
		db    0
		dd loc_A30A+2
		db  53h	; S
		db  16h
		db    1
		db    0
		dd loc_B956+1
		db 0D1h	; �
		db  23h	; #
		db    1
		db    0
		dd loc_DD22+1
		db  84h	; �
		db    8
		db    1
		db    0
		dd 0E5A0001h
		db  4Dh	; M
		db  36h	; 6
		db    1
		db    0
		dd 11BE0004h
		db  26h	; &
		db  0Ch
		db    1
		db    0
		dd loc_1280D
		db 0FCh	; �
		db    7
		db    1
		db    0
		dd 12FF0006h
		db  89h	; �
		db  12h
		db    1
		db    0
		dd loc_1427C
		db  75h	; u
		db    2
		db    1
		db    0
		dd loc_144E8+1
		db  79h	; y
		db    3
		db    1
		db    0
		dd 14850005h
		db 0AAh	; �
		db    6
unk_69F14	db    1
		db    0
off_69F16	dd 14EF0009h
unk_69F1A	db  9Bh	; �
		db  12h
		db    1
		db    0
		dd 1618000Ah
unk_69F22	db  18h
		db    7
		db    1
		db    0
off_69F26	dd loc_1689B
		db 0F8h	; �
		db    0
		db    1
		db    0
		dd Radar_Project3DToScreen
		db 0C2h	; �
		db    8
		db    1
		db    0
		dd loc_17248
		db  7Ch	; |
		db    3
		db    1
		db    0
		dd 175B0002h
		db 0EDh	; �
		db  0Dh
		db    1
		db    0
		dd 1839000Ch
		db  2Eh	; .
		db  10h
		db    1
		db    0
		dd 193B000Dh
		db 0EFh	; �
		db    6
		db    1
		db    0
		dd 19A9000Eh
		db 0DAh	; �
		db    5
		db    1
		db    0
		dd loc_1A06D+2
		db  2Fh	; /
		db    8
		db    1
		db    0
		dd 1A88000Ah
		db  77h	; w
		db  0Ch
		db    1
		db    0
		dd loc_1B4FE+1
		db 0D8h	; �
		db    3
		db    1
		db    0
		dd 1B8C0007h
		db  99h	; �
		db  0Ch
		db    1
		db    0
		dd 1C550008h
		db  9Dh	; �
		db    3
		db    1
		db    0
		dd 1C8E0009h
		db  3Fh	; ?
		db    6
		db    1
		db    0
		dd 1CF1000Dh
		db  26h	; &
		db  1Bh
		db    1
		db    0
		dd loc_1EA3B+4
		db  8Bh	; �
		db  0Ah
		db    1
		db    0
		dd 1F4B0006h
		db 0DFh	; �
		db    7
		db    1
		db    0
		dd 1FC8000Bh
		db  15h
		db    3
		db    1
		db    0
		dd loc_1FF9F
		db  80h	; �
		db    6
		db    1
		db    0
		dd loc_20614+1
		db  6Eh	; n
		db    0
		db    1
		db    0
		dd 20670000h
		db 0D8h	; �
		db    1
		db    1
		db    0
		dd loc_2084E
		db 0ECh	; �
		db  15h
		db    1
		db    0
		dd 21E20008h
		db  70h	; p
		db    0
		db    1
		db    0
		dd loc_21E9C
		db  80h	; �
		db  10h
		db    1
		db    0
		dd TrackedObjects_CallSlot18OnActive_22F10
		db  0Fh
		db    5
		db    1
		db    0
		dd 23410000h
		db 0F4h	; �
		db  0Ch
		db    1
		db    0
		dd loc_2410E+1
		db 0E1h	; �
		db  0Dh
		db    1
		db    0
		dd loc_24EE2+2
		db 0C7h	; �
		db    9
		db    1
		db    0
		dd 258A0002h
		db    3
		db    3
		db    1
		db    0
		dd loc_25BA8
		db  59h	; Y
		db    2
		db    1
		db    0
off_6A00E	dd 25DF0004h
		db  3Bh	; ;
		db  11h
		db    1
		db    0
off_6A016	dd 26F2000Ah
		db 0C8h	; �
		db    3
		db    1
		db    0
		dd loc_272EB
		db  62h	; b
		db  13h
		db    1
		db    0
		dd loc_28645+3
		db  59h	; Y
		db    6
		db    1
		db    0
		dd 28C90002h
		db  21h	; !
		db    2
		db    1
		db    0
		dd loc_28EB9
		db  86h	; �
		db    1
		db    1
		db    0
		dd 29030001h
		db 0E5h	; �
		db    0
		db    1
		db    0
		dd loc_29116
		db  7Fh	; 
		db    0
		db    1
		db    0
off_6A04E	dd 29180005h
		db  62h	; b
unk_6A053	db    0
		db    1
		db    0
off_6A056	dd loc_291ED+2
		db  85h	; �
		db  1Bh
		db    1
		db    0
off_6A05E	dd 2AD60002h
		db    5
unk_6A063	db    0
unk_6A064	db    1
		db    0
off_6A066	dd Collection_NotifyAllDestroy
		db  29h	; )
		db    2
unk_6A06C	db    1
unk_6A06D	db    0
off_6A06E	dd 2AF80005h
unk_6A072	db  6Ah	; j
		db    1
unk_6A074	db    1
		db    0
off_6A076	dd 2B0E0009h
		db  19h
		db    5
		db    1
		db    0
		dd loc_2B5FA
		db 0ADh	; �
		db    6
		db    1
		db    0
		dd 2BC90009h
		db 0BDh	; �
		db  0Ch
		db    1
		db    0
		dd loc_2C94D
		db    2
		db  10h
		db    1
		db    0
		dd loc_2D94C+1
		db  2Ah	; *
		db    4
		db    1
		db    0
		dd 2DD60002h
		db  8Ah	; �
		db    0
		db    1
		db    0
		dd loc_2DDEA
		db  2Bh	; +
		db    0
		db    1
		db    0
		dd 2DE0000Ah
		db    1
		db  0Ah
		db    1
		db    0
		dd loc_2E80B
		db  4Dh	; M
		db  0Ah
		db    1
		db    0
		dd 2F240001h
		db  50h	; P
		db    6
		db    1
		db    0
		dd loc_2F89D+1
		db  52h	; R
		db    6
		db    1
		db    0
		dd 2FEE0000h
		db 0D5h	; �
		db  1Ch
		db    1
		db    0
		dd 31BB0002h
		db  7Ah	; z
		db  0Ah
		db    1
		db    0
		dd 32620005h
		db 0F8h	; �
		db  0Ah
		db    1
		db    0
		dd loc_33119+1
		db 0FEh	; �
		db    3
		db    1
		db    0
		dd 33500008h
		db 0D5h	; �
		db  10h
		db    1
		db    0
		dd loc_345DD+1
		db  6Eh	; n
		db  21h	; !
		db    1
		db    0
		dd 36730006h
		db  74h	; t
		db    3
		db    1
		db    0
		dd loc_36AAE
		db 0C4h	; �
		db  0Ah
		db    1
		db    0
off_6A10E	dd loc_37564
		db 0ECh	; �
		db    6
		db    1
		db    0
		dd 37C40004h
		db  37h	; 7
		db    7
		db    1
		db    0
		dd loc_3837C
		db  19h
		db  0Ah
		db    1
		db    0
		dd 38D80007h
		db 0C0h	; �
		db  14h
		db    1
		db    0
		dd loc_3A247+2
		db  3Bh	; ;
		db    2
		db    1
		db    0
		dd 3A470000h
		db    6
		db  14h
		db    1
		db    0
		dd loc_3B879+2
		db 0CBh	; �
		db  10h
		db    1
		db    0
		dd 3C930006h
		db  1Bh
		db    3
		db    1
		db    0
off_6A14E	dd loc_3CC4B
		db  7Ah	; z
		db  11h
		db    1
		db    0
		dd loc_3DDBB
		db  37h	; 7
		db    1
		db    1
		db    0
off_6A15E	dd loc_3DEEA
		db  64h	; d
unk_6A163	db    8
		db    1
		db    0
off_6A166	dd loc_3E747
		db 0D1h	; �
		db  2Bh	; +
		db    1
		db    0
off_6A16E	dd loc_41314
		db  3Eh	; >
		db  11h
		db    1
		db    0
		dd 42440001h
		db  4Ch	; L
		db    9
		db    1
		db    0
		dd loc_42D8D+1
		db  7Eh	; ~
		db    6
		db    1
		db    0
		dd 433F000Ch
		db 0ECh	; �
		db    8
		db    1
		db    0
		dd loc_43CDD+1
		db 0C8h	; �
		db    1
		db    1
		db    0
		dd loc_43E9B+1
		db    0
		db  13h
		db    1
		db    0
		dd loc_45198
		db 0DCh	; �
		db    1
		db    1
		db    0
		dd 45360000h
		db  27h	; '
		db    0
		db    1
		db    0
		dd loc_4538C
		db  2Fh	; /
		db    7
		db    1
		db    0
		dd 45AA0007h
		db  4Ah	; J
		db    2
		db    1
		db    0
		dd loc_45CED+2
		db    8
		db    4
		db    1
		db    0
		dd loc_460E9+1
		db  0Dh
		db    1
		db    1
		db    0
		dd 461E0008h
		db  8Ch	; �
		db    7
		db    1
		db    0
		dd loc_4696D
		db  6Dh	; m
		db  16h
		db    1
		db    0
		dd 47FC000Ch
		db  38h	; 8
		db  39h	; 9
		db    1
		db    0
		dd loc_4B8FB+2
		db 0E5h	; �
		db    3
		db    1
		db    0
		dd loc_4BCD8
		db  80h	; �
		db    3
		db    1
		db    0
		dd loc_4C055
		db  55h	; U
		db  16h
		db    1
		db    0
		dd 4D6A0000h
		db 0F4h	; �
		db  16h
		db    1
		db    0
		dd loc_4ED95
		db  2Ah	; *
		db    5
		db    1
		db    0
		dd 4F2B0004h
		db 0F2h	; �
unk_6A213	db    6
		db    1
		db    0
		dd loc_4F9AA
		db 0E4h	; �
		db    1
		db    1
		db    0
		dd 4FB80002h
		db  71h	; q
		db    0
unk_6A224	db    1
		db    0
		dd loc_4FBF4
		db 0FEh	; �
		db  0Dh
		db    1
		db    0
		dd 509E0001h
		db  80h	; �
		db    4
		db    1
		db    0
		dd loc_50E6D+1
		db  8Fh	; �
		db  39h	; 9
		db    1
		db    0
		dd 547E0000h
		db 0E4h	; �
		db    6
		db    1
		db    0
		dd Effect_RandomJitterVector_54ECF
		db  56h	; V
		db  31h	; 1
		db    1
		db    0
off_6A24E	dd 58010004h
		db 0D8h	; �
		db    8
		db    1
		db    0
		dd 588E0006h
		db 0D2h	; �
		db    0
		db    1
		db    0
		dd byte_589B2+6
		db  4Dh	; M
unk_6A263	db    4
unk_6A264	db    1
		db    0
		dd 58DF0002h
		db 0E5h	; �
		db    0
unk_6A26C	db    1
		db    0
off_6A26E	dd loc_58EDC+2
		db 0D6h	; �
unk_6A273	db    9
		db    1
		db    0
off_6A276	dd 598A0005h
		db  7Dh	; }
		db    6
		db    1
		db    0
		dd 59F10006h
		db 0E3h	; �
		db    1
		db    1
		db    0
		dd loc_5A0FC+1
		db  9Fh	; �
		db    7
		db    1
		db    0
		dd 5A880003h
		db 0DFh	; �
		db    5
		db    1
		db    0
		dd Registry_ResolveOrInsertNode_5AE5F
		db 0A1h	; �
		db    9
		db    1
		db    0
		dd loc_5B7FE+1
		db  99h	; �
		db    8
		db    1
		db    0
		dd 5C080001h
		db  3Fh	; ?
		db    2
		db    1
		db    0
		dd 5C2B0009h
		db  7Ch	; |
		db    1
		db    1
		db    0
		dd loc_5C42F
		db  23h	; #
		db    2
		db    1
		db    0
		dd loc_5C64B+1
		db  5Eh	; ^
		db    4
		db    1
		db    0
		dd 5CA90003h
		db    9
		db    1
		db    1
		db    0
		dd loc_5CB9C+2
		db  2Bh	; +
		db    1
		db    1
		db    0
		dd 5CCB0009h
		db  5Ah	; Z
		db    1
		db    1
		db    0
		dd TextFormat_BuildLabelString_5CE0B
		db 0F8h	; �
unk_6A2E3	db    1
		db    1
		db    0
off_6A2E6	dd loc_5CFF9+1
		db  14h
		db    1
unk_6A2EC	db    1
unk_6A2ED	db    0
off_6A2EE	dd loc_5D108
unk_6A2F2	db  82h	; �
		db    3
unk_6A2F4	db    1
		db    0
off_6A2F6	dd PagedResourceB_TreeSearchRecursive_5D482+2
		db  19h
		db    5
		db    1
		db    0
		dd 5D990002h
		db  6Dh	; m
		db    0
		db    1
		db    0
		dd 5D9F0009h
		db  58h	; X
		db    0
		db    1
		db    0
		dd loc_5DA4C+1
		db  3Bh	; ;
unk_6A313	db    8
		db    1
		db    0
off_6A316	dd 5E270008h
		db  60h	; `
		db    0
		db    1
unk_6A31D	db    0
		dd loc_5E2DB
		db  4Ch	; L
		db    3
		db    1
		db    0
		dd 5E610000h
		db  23h	; #
		db    0
		db    1
		db    0
		dd TextFormat_ValidateLinearTable_5E63B+1
		db  8Fh	; �
		db    0
		db    1
		db    0
		dd 5E6B0003h
		db  56h	; V
		db    0
		db    1
		db    0
		dd loc_5E70E+1
		db  4Dh	; M
		db    0
		db    1
		db    0
		dd 5E740006h
		db  96h	; �
		db    0
		db    1
		db    0
		dd loc_5E7DC+2
		db  1Ah
		db    0
unk_6A354	db    1
		db    0
off_6A356	dd 5E7E0006h
		db  39h	; 9
		db    0
		db    1
		db    0
off_6A35E	dd loc_5E81A
		db 0F3h	; �
unk_6A363	db    1
		db    1
		db    0
off_6A366	dd loc_5EA07+2
unk_6A36A	db 0EDh	; �
		db    0
unk_6A36C	db    1
		db    0
		dd 5EAE0003h
unk_6A372	db 0FCh	; �
		db    3
		db    1
		db    0
		dd PagedMemory_ExceptionHandler_5EEDD
		db    3
		db    1
		db    1
		db    0
		dd loc_5EFDA+2
		db 0CCh	; �
		db    1
		db    1
		db    0
		dd 5F190003h
		db 0C8h	; �
		db    2
		db    1
		db    0
		dd loc_5F45B+1
		db  88h	; �
		db    0
		db    1
		db    0
		dd PagedResourceC_Method_PassThrough_5F4D8
		db  87h	; �
		db    0
		db    1
		db    0
		dd LinkedListB_InsertAtHead_5F558
		db 0B0h	; �
		db    1
		db    1
		db    0
		dd loc_5F707
		db 0B4h	; �
		db    0
		db    1
		db    0
		dd 5F7B0000h
		db 0A6h	; �
		db  0Ch
		db    1
		db    0
		dd 60450004h
		db  91h	; �
		db    3
		db    1
		db    0
		dd loc_607E4+2
		db  21h	; !
		db    7
		db    1
		db    0
		dd 60F00001h
		db  93h	; �
		db    0
		db    1
		db    0
		dd 60F90002h
		db  51h	; Q
		db    0
		db    1
		db    0
		dd loc_60FE3+1
		db  8Eh	; �
		db    0
		db    1
		db    0
		dd 61060002h
		db  4Fh	; O
		db    3
		db    1
		db    0
off_6A3E6	dd loc_613BE
		db  61h	; a
		db    2
		db    1
		db    0
off_6A3EE	dd 61610000h
		db  4Fh	; O
		db    3
		db    1
		db    0
		dd Render_FillClippedRect_61960+2
		db 0F8h	; �
		db    1
		db    1
		db    0
		dd 61B50000h
		db  3Dh	; =
		db    0
		db    1
		db    0
		dd 61B80008h
		db  52h	; R
		db    1
		db    1
		db    0
		dd loc_61CDC+2
		db  82h	; �
		db    2
		db    1
		db    0
		dd Render_MeasureOrDrawTextString_61F52
		db  52h	; R
		db    2
		db    1
		db    0
		dd Render_DrawScaledSprite_621A2
		db  2Ch	; ,
		db    4
		db    1
		db    0
		dd 625C0002h
		db  22h	; "
		db    0
		db    1
		db    0
		dd loc_625EB+1
		db  3Ah	; :
		db    1
		db    1
		db    0
		dd 62710002h
		db 0F0h	; �
		db    0
		db    1
		db    0
		dd loc_62807+3
		db 0FDh	; �
		db    3
		db    1
		db    0
		dd 62BF0000h
		db  46h	; F
		db    1
		db    1
		db    0
		dd loc_62D3E
		db 0E5h	; �
		db    0
		db    1
		db    0
		dd Rect_BlitOverlapRegionVariant_62E16
		db 0B7h	; �
		db    0
		db    1
		db    0
		dd 62EC0006h
unk_6A462	db 0FAh	; �
unk_6A463	db    1
unk_6A464	db    1
		db    0
off_6A466	dd 630B0008h
unk_6A46A	db  35h	; 5
		db    0
		db    1
unk_6A46D	db    0
off_6A46E	dd File_ReadOrDelegateToPaged_630E7+3
unk_6A472	db  53h	; S
		db    3
unk_6A474	db    1
		db    0
off_6A476	dd loc_63435+1
		db  52h	; R
		db    0
		db    1
		db    0
		dd loc_63483+1
		db  3Ah	; :
unk_6A483	db    0
		db    1
		db    0
off_6A486	dd 634B0002h
		db 0FEh	; �
		db    0
unk_6A48C	db    1
unk_6A48D	db    0
off_6A48E	dd 635A000Ah
unk_6A492	db  5Fh	; _
		db    3
unk_6A494	db    1
		db    0
off_6A496	dd 638F000Eh
		db 0C0h	; �
		db    7
		db    1
		db    0
		dd loc_640BE+1
		db 0A3h	; �
		db    2
		db    1
		db    0
		dd 64350000h
		db 0BBh	; �
		db    1
		db    1
		db    0
		dd 64500003h
		db  1Dh
		db    9
		db    1
		db    0
		dd 64E1000Bh
		db  1Eh
		db    7
		db    1
		db    0
		dd 6552000Dh
		db 0B0h	; �
		db    4
		db    1
		db    0
		dd loc_659DD+1
		db  4Fh	; O
		db    5
		db    1
		db    0
		dd word_65F20
		db  8Fh	; �
		db    2
		db    1
		db    0
		dd 661A0000h
		db 0ACh	; �
		db    1
		db    1
		db    0
		dd loc_6634F
		db  96h	; �
unk_6A4E3	db    0
		db    1
		db    0
		dd loc_663DA+2
		db  5Dh	; ]
		db    3
unk_6A4EC	db    1
		db    0
		dd 66720006h
		db 0A4h	; �
		db    3
		db    1
		db    0
		dd loc_66ACD
		db 0FAh	; �
		db    2
		db    1
		db    0
		dd 66DB0004h
		db  14h
		db    2
		db    1
		db    0
		dd loc_66FC8+2
		db 0A7h	; �
		db    2
		db    1
		db    0
		dd 67260004h
		db  54h	; T
unk_6A513	db    3
		db    1
		db    0
off_6A516	dd loc_675B7
		db  3Fh	; ?
		db    0
unk_6A51C	db    1
unk_6A51D	db    0
off_6A51E	dd 675E0004h
unk_6A522	db  55h	; U
		db    2
unk_6A524	db    1
		db    0
off_6A526	dd loc_6783D+2
		db 0C5h	; �
		db    5
		db    1
		db    0
		dd TextScrollDisplayB_ConstructAndReset_67DF5
		db 0FCh	; �
		db    2
		db    1
		db    0
		dd 680E0005h
		db 0D6h	; �
		db    0
		db    1
		db    0
		dd Keyboard_BIOSInterceptHandler_681BC
		db  99h	; �
		db    0
		db    1
		db    0
		dd 68240006h
		db  4Ch	; L
		db    9
		db    1
		db    0
		dd unk_68B99
		align 8
		dw seg seg213
		db  3Bh	; ;
		db    6
		db    0
		db    0
off_6A55E	dd unk_691D0
		db    0
unk_6A563	db  0Ch
		db    0
		db    0
off_6A566	dd a_iff		; ".IFF"
		db    5
		db    0
		db    0
		db    0
		dd unk_69DE0
algn_6A572:
		align 8
		dw seg seg216
		align 8
		dw seg seg216
		db  18h
		db  0Ch
		db    0
		db    0
off_6A586	dd 69E80000h
		db 0FFh
		db 0FFh
		db    4
		db    0
off_6A58E	dd 69EA0000h
		db 0FFh
		db 0FFh
		db    4
		db    0
		dd 69EA0000h
		db 0FFh
		db 0FFh
		db    4
		db    0
		dd 69EA0000h
		db 0FFh
		db 0FFh
		db    4
		db    0
		dd 69EA0000h
		db 0FFh
		db 0FFh
		db    4
		db    0
		dd stru_6AA00
		align 4
		db    1
		db    0
		dd stru_6AA00
		db  52h	; R
		db    0
		db    3
		db    0
		dd stru_6AA60
		db 0B6h	; �
		db    0
		db    3
		db    0
		dd stru_6AB20
		db  39h	; 9
		db    0
		db    3
		db    0
		dd stru_6AB60
		db  4Dh	; M
		db    0
		db    3
		db    0
		dd stru_6ABB0
		db  43h	; C
		db    0
		db    3
		db    0
		dd stru_6AC00
		db  5Ch	; \
		db    0
		db    3
		db    0
		dd stru_6AC60
unk_6A5EA	db  2Fh	; /
		db    0
		db    3
		db    0
		dd stru_6AC90
		db  2Fh	; /
		db    0
		db    3
		db    0
		dd stru_6ACC0
		db  25h	; %
		db    0
		db    3
		db    0
		dd stru_6ACF0
		db  25h	; %
		db    0
		db    3
		db    0
		dd stru_6AD20
		db  25h	; %
		db    0
		db    3
		db    0
off_6A60E	dd stru_6AD50
		db  2Ah	; *
unk_6A613	db    0
		db    3
		db    0
off_6A616	dd stru_6AD80
		db  48h	; H
		db    0
		db    3
		db    0
off_6A61E	dd stru_6ADD0
		db  2Fh	; /
		db    0
		db    3
		db    0
		dd stru_6AE00
		db 0ACh	; �
		db    0
		db    3
		db    0
		dd stru_6AEB0
		db  57h	; W
		db    0
		db    3
		db    0
		dd stru_6AF10
		db  7Ah	; z
		db    0
		db    3
		db    0
		dd stru_6AF90
		db 0CAh	; �
		db    0
		db    3
		db    0
		dd stru_6B060
		db  48h	; H
		db    0
		db    3
		db    0
		dd stru_6B0B0
		db  89h	; �
		db    0
		db    3
unk_6A655	db    0
		dd stru_6B140
		db  48h	; H
		db    0
		db    3
		db    0
off_6A65E	dd stru_6B190
		db  39h	; 9
		db    0
		db    3
		db    0
		dd stru_6B1D0
		db  57h	; W
		db    0
		db    3
		db    0
		dd stru_6B230
		db  34h	; 4
		db    0
		db    3
		db    0
		dd stru_6B270
		db  48h	; H
		db    0
		db    3
		db    0
		dd stru_6B2C0
		db  25h	; %
unk_6A683	db    0
		db    3
		db    0
		dd stru_6B2F0
		db  98h	; �
		db    0
unk_6A68C	db    3
		db    0
		dd stru_6B390
		db  70h	; p
		db    0
		db    3
		db    0
		dd stru_6B400
		db 0A7h	; �
		db    0
		db    3
		db    0
		dd stru_6B4B0
		db  66h	; f
		db    0
		db    3
		db    0
		dd stru_6B520
		db  2Ah	; *
		db    0
		db    3
		db    0
		dd stru_6B550
		db  84h	; �
		db    0
		db    3
		db    0
		dd stru_6B5E0
		db  2Ah	; *
		db    0
		db    3
		db    0
		dd stru_6B610
		db  34h	; 4
		db    0
		db    3
		db    0
		dd stru_6B650
		db  25h	; %
		db    0
		db    3
		db    0
		dd stru_6B680
		db  25h	; %
		db    0
		db    3
		db    0
		dd stru_6B6B0
		db  2Ah	; *
		db    0
		db    3
		db    0
		dd stru_6B6E0
		db  34h	; 4
		db    0
unk_6A6E4	db    3
		db    0
off_6A6E6	dd stru_6B720
unk_6A6EA	db  3Eh	; >
		db    0
		db    3
		db    0
		dd stru_6B760
unk_6A6F2	db  66h	; f
		db    0
		db    3
		db    0
off_6A6F6	dd stru_6B7D0
		db  34h	; 4
		db    0
		db    3
		db    0
		dd stru_6B810
		db  34h	; 4
		db    0
		db    3
		db    0
		dd stru_6B850
		db  34h	; 4
		db    0
		db    3
		db    0
		dd stru_6B890
		db  2Fh	; /
unk_6A713	db    0
		db    3
		db    0
		dd stru_6B8C0
		db  2Fh	; /
		db    0
unk_6A71C	db    3
		db    0
off_6A71E	dd stru_6B8F0
		db  25h	; %
unk_6A723	db    0
		db    3
		db    0
off_6A726	dd stru_6B920
		db  25h	; %
		db    0
		db    3
		db    0
		dd stru_6B950
		db  25h	; %
		db    0
		db    3
		db    0
		dd stru_6B980
		db  25h	; %
		db    0
		db    3
		db    0
		dd stru_6B9B0
		db  25h	; %
		db    0
		db    3
		db    0
		dd stru_6B9E0
		db  25h	; %
		db    0
		db    3
		db    0
		dd stru_6BA10
		db  25h	; %
		db    0
unk_6A754	db    3
		db    0
		dd stru_6BA40
		db  2Ah	; *
		db    0
		db    3
		db    0
off_6A75E	dd stru_6BA70
		db  25h	; %
unk_6A763	db    0
		db    3
		db    0
off_6A766	dd stru_6BAA0
		db  25h	; %
		db    0
		db    3
		db    0
off_6A76E	dd stru_6BAD0
		db  25h	; %
		db    0
unk_6A774	db    3
		db    0
		dd stru_6BB00
		db  25h	; %
		db    0
		db    3
		db    0
		dd stru_6BB30
		db  2Fh	; /
		db    0
		db    3
		db    0
		dd stru_6BB60
unk_6A78A	db  2Fh	; /
		db    0
		db    3
		db    0
		dd stru_6BB90
		db  2Ah	; *
		db    0
		db    3
		db    0
		dd stru_6BBC0
		db  7Ah	; z
		db    0
		db    3
		db    0
		dd stru_6BC40
		db  70h	; p
		db    0
		db    3
		db    0
		dd stru_6BCB0
		db  25h	; %
		db    0
		db    3
		db    0
		dd stru_6BCE0
		db  25h	; %
		db    0
		db    3
		db    0
		dd stru_6BD10
		db  25h	; %
		db    0
		db    3
		db    0
		dd stru_6BD40
		db  2Fh	; /
		db    0
		db    3
		db    0
		dd stru_6BD70
		db  2Ah	; *
		db    0
		db    3
		db    0
		dd stru_6BDA0
		db  43h	; C
		db    0
		db    3
		db    0
		dd stru_6BDF0
		db  57h	; W
		db    0
		db    3
		db    0
off_6A7DE	dd stru_6BE50
		db  2Fh	; /
		db    0
		db    3
		db    0
off_6A7E6	dd stru_6BE80
		db  2Fh	; /
		db    0
		db    3
		db    0
		dd stru_6BEB0
		db  2Ah	; *
		db    0
		db    3
		db    0
		dd stru_6BEE0
		db  52h	; R
		db    0
		db    3
		db    0
		dd stru_6BF40
		db  43h	; C
		db    0
		db    3
		db    0
		dd stru_6BF90
		db  34h	; 4
		db    0
		db    3
		db    0
		dd stru_6BFD0
		db  4Dh	; M
		db    0
		db    3
		db    0
off_6A816	dd stru_6C020
unk_6A81A	db  34h	; 4
		db    0
unk_6A81C	db    3
		db    0
		dd stru_6C060
unk_6A822	db  2Fh	; /
		db    0
		db    3
		db    0
		dd stru_6C090
		db  25h	; %
		db    0
		db    3
		db    0
		dd stru_6C0C0
		db  2Ah	; *
		db    0
		db    3
		db    0
		dd stru_6C0F0
		db  43h	; C
		db    0
		db    3
		db    0
		dd stru_6C140
		db  2Ah	; *
		db    0
		db    3
		db    0
		dd stru_6C170
		db  2Ah	; *
		db    0
		db    3
		db    0
		dd stru_6C1A0
		db  3Eh	; >
		db    0
		db    3
		db    0
		dd stru_6C1E0
		db  2Ah	; *
		db    0
		db    3
		db    0
off_6A85E	dd stru_6C210
		db  2Fh	; /
unk_6A863	db    0
		db    3
		db    0
off_6A866	dd stru_6C240
		db  25h	; %
		db    0
unk_6A86C	db    3
unk_6A86D	db    0
off_6A86E	dd stru_6C270
unk_6A872	db  25h	; %
		db    0
unk_6A874	db    3
		db    0
off_6A876	dd stru_6C2A0
		db  25h	; %
		db    0
		db    3
		db    0
		dd stru_6C2D0
		db  25h	; %
		db    0
unk_6A884	db    3
		db    0
off_6A886	dd stru_6C300
unk_6A88A	db  2Fh	; /
		db    0
		db    3
		db    0
		dd stru_6C330
unk_6A892	db  25h	; %
		db    0
		db    3
		db    0
off_6A896	dd stru_6C360
		db 0E3h	; �
		db    0
		db    3
		db    0
		dd stru_6C450
		db 0B1h	; �
		db    0
		db    3
		db    0
		dd stru_6C510
		db  6Bh	; k
		db    0
		db    3
		db    0
		dd stru_6C580
		db  34h	; 4
		db    0
		db    3
		db    0
		dd stru_6C5C0
		db  34h	; 4
		db    0
		db    3
		db    0
		dd stru_6C600
		db  48h	; H
		db    0
		db    3
		db    0
		dd stru_6C650
		db  2Fh	; /
		db    0
		db    3
		db    0
		dd stru_6C680
		db  25h	; %
		db    0
		db    3
		db    0
		dd stru_6C6B0
		db  2Ah	; *
		db    0
		db    3
		db    0
off_6A8DE	dd stru_6C6E0
		db  2Ah	; *
		db    0
		db    3
		db    0
		dd stru_6C710
		db  3Dh	; =
		db    1
		db    3
		db    0
		dd stru_6C850
		db  3Eh	; >
		db    0
		db    3
		db    0
		dd stru_6C890
		db  3Dh	; =
		db    1
		db    3
		db    0
		dd stru_6C9D0
		db  34h	; 4
		db    0
		db    3
		db    0
		dd stru_6CA10
		db  84h	; �
		db    0
		db    3
		db    0
		dd stru_6CAA0
unk_6A912	db  3Eh	; >
unk_6A913	db    0
unk_6A914	db    3
		db    0
off_6A916	dd stru_6CAE0
unk_6A91A	db 0ACh	; �
		db    0
		db    3
unk_6A91D	db    0
off_6A91E	dd stru_6CB90
unk_6A922	db  57h	; W
		db    0
unk_6A924	db    3
		db    0
off_6A926	dd stru_6CBF0
		db  52h	; R
		db    0
		db    3
		db    0
		dd stru_6CC50
		db  2Ah	; *
		db    0
		db    3
		db    0
		dd stru_6CC80
		db  43h	; C
		db    0
		db    3
		db    0
		dd stru_6CCD0
		db  39h	; 9
		db    0
		db    3
		db    0
		dd stru_6CD10
		db  6Bh	; k
		db    0
		db    3
		db    0
		dd stru_6CD80
		db  61h	; a
		db    0
		db    3
		db    0
		dd stru_6CDF0
		db  7Ah	; z
		db    0
		db    3
		db    0
off_6A95E	dd stru_6CE70
		db    6
		db    1
		db    3
		db    0
off_6A966	dd stru_6CF80
		db  61h	; a
		db    0
		db    3
		db    0
off_6A96E	dd stru_6CFF0
		db  3Eh	; >
unk_6A973	db    0
unk_6A974	db    3
		db    0
		dd stru_6D030
		db  39h	; 9
		db    0
		db    3
		db    0
off_6A97E	dd stru_6D070
		db  34h	; 4
		db    0
		db    3
		db    0
off_6A986	dd unk_6D0B0
		db  30h	; 0
		db  67h	; g
		db    0
		db    0
		dd 71E30000h
		db    1
		db    0
		db    4
		db    0
		dd 71E30002h
		db    3
		db    0
		db    4
		db    0
		dd 71E30004h
		db    9
		db    0
		db    4
		db    0
		dd 71E3000Ah
		db    9
		db    0
		db    4
		db    0
		dd 71F7000Ah
		db    7
		db    0
		db    4
		db    0
		dd 71F70008h
		db    7
		db    0
		db    4
		db    0
		dd 72010008h
		db    3
		db    0
		db    4
		db    0
		dd 72010004h
		db    3
		db    0
		db    4
		db    0
		dd 72F50004h
		db    9
		db    0
		db    4
		db    0
		dd 72F6000Ah
		db 0FFh
		db 0FFh
		db    4
		db    0
		dd 72FE0000h
		db 0FFh
unk_6A9E3	db 0FFh
		db    4
		db    0
		db    0
		db    0
aStrike_exe	db 'strike.exe',0       ; DATA XREF: VROOMM_LocateAndValidate_68254:loc_6827Ao
		align 2
unk_6A9F4	db    1
		db    4
		db 0C9h	; �
		db    7
seg216		ends
