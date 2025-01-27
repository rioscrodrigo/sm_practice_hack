; --------
; Helpers
; --------

macro cm_header(title)
    table ../resources/header.tbl
    db #$28, "<title>", #$FF
    table ../resources/normal.tbl
endmacro

macro cm_numfield(title, addr, start, end, increment, jsrtarget)
    dw !ACTION_NUMFIELD
    dl <addr>
    db <start>, <end>, <increment>
    dw <jsrtarget>
    db #$28, "<title>", #$FF
endmacro

macro cm_toggle(title, addr, value, jsrtarget)
    dw !ACTION_TOGGLE
    dl <addr>
    db <value>
    dw <jsrtarget>
    db #$28, "<title>", #$FF
endmacro

macro cm_toggle_bit(title, addr, mask, jsrtarget)
    dw !ACTION_TOGGLE_BIT
    dl <addr>
    dw <mask>
    dw <jsrtarget>
    db #$28, "<title>", #$FF
endmacro

macro cm_jsr(title, routine, argument)
    dw !ACTION_JSR
    dw <routine>
    dw <argument>
    db #$28, "<title>", #$FF
endmacro

macro cm_submenu(title, target)
    %cm_jsr("<title>", #action_submenu, <target>)
endmacro

macro cm_preset(title, target)
    %cm_jsr("<title>", #action_load_preset, <target>)
endmacro

macro cm_ctrl_shortcut(title, addr)
    dw !ACTION_CTRL_SHORTCUT
    dl <addr>
    db #$28, "<title>", #$FF
endmacro

action_submenu:
{
    ; Increment stack pointer by 2, then store current menu
    LDA !ram_cm_stack_index : INC #2 : STA !ram_cm_stack_index : TAX
    TYA : STA !ram_cm_menu_stack,X
    LDA #$0000 : STA !ram_cm_cursor_stack,X

    LDA #!SOUND_MENU_MOVE : JSL $80903F
    JSR cm_calculate_max
    JSR cm_draw

    RTS
}

action_presets_submenu:
{
    ; Increment stack pointer by 2, then store current menu    
    LDA !ram_cm_stack_index : INC #2 : STA !ram_cm_stack_index : TAX
    LDA !sram_preset_category : ASL : TAY
    
    LDA.w preset_category_submenus,Y : STA !ram_cm_menu_stack,X
    LDA.w preset_category_banks,Y : STA !ram_cm_menu_bank
    
    LDA #$0000 : STA !ram_cm_cursor_stack,X

    LDA #!SOUND_MENU_MOVE : JSL $80903F
    JSR cm_calculate_max
    JSR cm_draw

    RTS
}

preset_category_submenus:
{
    dw #PresetsMenuRouteA
    dw #PresetsMenuRouteB
    ; dw #PresetsMenuHundo
    ; dw #PresetsMenu100early
    ; dw #PresetsMenuRbo
    ; dw #PresetsMenuPkrd
    ; dw #PresetsMenuKpdr25
    ; dw #PresetsMenuGtclassic
    ; dw #PresetsMenu14ice
    ; dw #PresetsMenu14speed
    ; dw #PresetsMenuAllbosskpdr
    ; dw #PresetsMenuAllbosspkdr
    ; dw #PresetsMenuAllbossprkd    
    dw #$0000
}

preset_category_banks:
{
    dw #PresetsMenuRouteA>>16
    dw #PresetsMenuRouteB>>16
    ; dw #PresetsMenuHundo>>16
    ; dw #PresetsMenu100early>>16
    ; dw #PresetsMenuRbo>>16
    ; dw #PresetsMenuPkrd>>16
    ; dw #PresetsMenuKpdr25>>16
    ; dw #PresetsMenuGtclassic>>16
    ; dw #PresetsMenu14ice>>16
    ; dw #PresetsMenu14speed>>16
    ; dw #PresetsMenuAllbosskpdr>>16
    ; dw #PresetsMenuAllbosspkdr>>16
    ; dw #PresetsMenuAllbossprkd>>16
    dw #$0000

}

; -----------
; Main menu
; -----------

MainMenu:
    dw #mm_goto_equipment
    dw #mm_goto_presets
    dw #mm_goto_select_preset_category
    dw #mm_goto_teleport
    dw #mm_goto_events
    dw #mm_goto_misc
    dw #mm_goto_infohud
    dw #mm_goto_gamemenu
    dw #mm_goto_rngmenu
    dw #mm_goto_ctrlsmenu
    dw #$0000
    %cm_header("SM REIMAGINED v0.2")

mm_goto_equipment:
    %cm_submenu("Equipment", #EquipmentMenu)

mm_goto_presets:
    %cm_jsr("Category Presets", #action_presets_submenu, #$0000)

mm_goto_select_preset_category:
    %cm_submenu("Select Preset Category", #SelectPresetCategoryMenu)

mm_goto_teleport:
    %cm_submenu("Teleport", #TeleportMenu)

mm_goto_events:
    %cm_submenu("Events", #EventsMenu)

mm_goto_misc:
    %cm_submenu("Misc", #MiscMenu)

mm_goto_infohud:
    %cm_submenu("Infohud", #InfoHudMenu)

mm_goto_gamemenu:
    %cm_submenu("Game", #GameMenu)

mm_goto_rngmenu:
    %cm_submenu("RNG Control", #RngMenu)

mm_goto_ctrlsmenu:
    %cm_submenu("Controller Shortcuts", #CtrlMenu)


; -------------
; Presets menu
; -------------
pushpc

org $FE8000
incsrc presets/routea_menu.asm
incsrc presets/routeb_menu.asm
; incsrc presets/hundo_menu.asm
; incsrc presets/100early_menu.asm
; incsrc presets/rbo_menu.asm
; incsrc presets/kpdr25_menu.asm
; incsrc presets/gtclassic_menu.asm

; org $FF8000
; incsrc presets/14ice_menu.asm
; incsrc presets/14speed_menu.asm
; incsrc presets/allbosskpdr_menu.asm
; incsrc presets/allbosspkdr_menu.asm
; incsrc presets/allbossprkd_menu.asm
; incsrc presets/pkrd_menu.asm

pullpc

action_load_preset:
{
    PHB
    PHK : PLB

    TYA : STA !ram_load_preset
    LDA #$0001 : STA !ram_cm_leave

    PLB
    RTS
}


; ----------------
; Equipment menu
; ----------------

EquipmentMenu:
    dw #eq_refill
    dw #eq_toggle_category
    dw #eq_goto_toggleitems
    dw #eq_goto_togglebeams
    dw #eq_setetanks
    dw #eq_setreserves
    dw #eq_setmissiles
    dw #eq_setsupers
    dw #eq_setpbs
    dw #$0000
    %cm_header("EQUIPMENT")

eq_refill:
    %cm_jsr("Refill", .refill, #$0000)

  .refill
    LDA $7E09C4 : STA $7E09C2 ; health
    LDA $7E09C8 : STA $7E09C6 ; missiles
    LDA $7E09CC : STA $7E09CA ; supers
    LDA $7E09D0 : STA $7E09CE ; pbs
    LDA $7E09D4 : STA $7E09D6 ; reserves
    LDA #!SOUND_MENU_JSR : JSL $80903F
    RTS

eq_toggle_category:
    %cm_submenu("Toggle Category", #ToggleCategoryMenu)

eq_goto_toggleitems:
    %cm_submenu("Toggle Items", #ToggleItemsMenu)

eq_goto_togglebeams:
    %cm_submenu("Toggle Beams", #ToggleBeamsMenu)

eq_setetanks:
    %cm_numfield("Energy Tanks", !ram_cm_etanks, 0, 14, 1, .routine)
    .routine
        TAX
        LDA #$0063
        -
        DEX : BMI +
        CLC : ADC #$0064
        BRA -
        +
        STA $09C4 : STA $7E09C2
        RTS

eq_setreserves:
    %cm_numfield("Reserve Tanks", !ram_cm_reserve, 0, 4, 1, .routine)
    .routine
        TAX
        LDA #$0000
        -
        DEX : BMI +
        CLC : ADC #$0064
        BRA -
        +
        STA $09D4 : STA $09D6
        RTS

eq_setmissiles:
    %cm_numfield("Missiles", $7E09C8, 0, 230, 5, .routine)
    .routine
        LDA $09C8 : STA $09C6 ; missiles
        RTS

eq_setsupers:
    %cm_numfield("Super Missiles", $7E09CC, 0, 50, 5, .routine)
    .routine
        LDA $09CC : STA $09CA ; supers
        RTS

eq_setpbs:
    %cm_numfield("Power Bombs", $7E09D0, 0, 50, 5, .routine)
    .routine
        LDA $09D0 : STA $09CE ; pbs
        RTS

; ---------------------
; Toggle Category menu
; ---------------------

ToggleCategoryMenu:
;   dw #cat_100
   dw #cat_any_a
   dw #cat_any_b
;    dw #cat_14ice
;    dw #cat_14speed
;    dw #cat_gt_code
;    dw #cat_rbo
;    dw #cat_any_glitched
   dw #cat_nothing
   dw #$0000
   %cm_header("TOGGLE CATEGORY")


;cat_100:
;    %cm_jsr("100%", action_category, #$0000)

cat_any_a:
    %cm_jsr("Any% Route A", action_category, #$0000)

cat_any_b:
    %cm_jsr("Any% Route B", action_category, #$0001)

; cat_14ice:
;     %cm_jsr("14% Ice", action_category, #$0003)

; cat_14speed:
;     %cm_jsr("14% Speed", action_category, #$0004)

; cat_gt_code:
;     %cm_jsr("GT Code", action_category, #$0005)

; cat_rbo:
;     %cm_jsr("RBO", action_category, #$0006)

; cat_any_glitched:
;     %cm_jsr("Any% glitched", action_category, #$0007)

cat_nothing:
    %cm_jsr("Nothing", action_category, #$0002)


action_category:
{
    TYA : ASL #4 : TAX

    ; Items
    LDA.l .table, X : STA $7E09A4 : STA $7E09A2 : INX #2

    ; Beams
    LDA.l .table, X : STA $7E09A8 : AND #$FFFB : STA $7E09A6 : INX #2

    ; Health
    LDA.l .table, X : STA $7E09C2 : STA $7E09C4 : INX #2

    ; Missiles
    LDA.l .table, X : STA $7E09C6 : STA $7E09C8 : INX #2

    ; Supers
    LDA.l .table, X : STA $7E09CA : STA $7E09CC : INX #2

    ; PBs
    LDA.l .table, X : STA $7E09CE : STA $7E09D0 : INX #2

    ; Reserves
    LDA.l .table, X : STA $7E09D4 : STA $7E09D6 : INX #2

    CPY #$0000 : BNE +

    LDA $7E09A6 : AND #$000C : CMP #$000C : BNE +
    LDA $7E09A6 : EOR #$0004 : STA $7E09A6

    +
    JSR cm_set_etanks_and_reserve
    LDA #!SOUND_MENU_JSR : JSL $80903F
    RTS

  .table
    ;  Items,  Beams,  Health, Miss,   Supers, PBs,    Reserv, Dummy
    dw #$F32F, #$100F, #$05db, #$00E6, #$0032, #$0032, #$0190, #$0000        ;   100%
    dw #$3125, #$1007, #$01F3, #$0014, #$000A, #$000A, #$0000, #$0000        ;   any% A
    dw #$7F2F, #$100B, #$01F3, #$0014, #$000A, #$000A, #$0000, #$0000        ;   any% B
    ; dw #$1025, #$1002, #$018F, #$000A, #$000A, #$0005, #$0000, #$0000        ;   14% ice
    ; dw #$3025, #$1000, #$018F, #$000A, #$000A, #$0005, #$0000, #$0000        ;   14% speed
    ; dw #$F32F, #$100F, #$02BC, #$0064, #$0014, #$0014, #$012C, #$0000        ;   gt code
    ; dw #$710C, #$1001, #$031F, #$001E, #$0019, #$0014, #$0064, #$0000        ;   rbo
    ; dw #$9004, #$0000, #$00C7, #$0005, #$0005, #$0005, #$0000, #$0000        ;   any% glitched
    dw #$0000, #$0000, #$0063, #$0000, #$0000, #$0000, #$0000, #$0000        ;   nothing
}


; ------------------
; Toggle Items menu
; ------------------

ToggleItemsMenu:
    dw #ti_variasuit
    dw #ti_gravitysuit
    dw #ti_morphball
    dw #ti_bomb
    dw #ti_springball
    dw #ti_screwattack
    dw #ti_hijumpboots
    dw #ti_spacejump
    dw #ti_speedbooster
    dw #ti_grapple
    dw #ti_xray
    dw #$0000
    %cm_header("TOGGLE ITEMS")

ti_variasuit:
    %cm_toggle_bit("Varia Suit", $7E09A4, #$0001, #0)

ti_gravitysuit:
    %cm_toggle_bit("Gravity Suit", $7E09A4, #$0020, #0)

ti_morphball:
    %cm_toggle_bit("Morphing Ball", $7E09A4, #$0004, #0)

ti_bomb:
    %cm_toggle_bit("Bombs", $7E09A4, #$1000, #0)

ti_springball:
    %cm_toggle_bit("Spring Ball", $7E09A4, #$0002, #0)

ti_screwattack:
    %cm_toggle_bit("Screw Attack", $7E09A4, #$0008, #0)

ti_hijumpboots:
    %cm_toggle_bit("Hi Jump Boots", $7E09A4, #$0100, #0)

ti_spacejump:
    %cm_toggle_bit("Space Jump", $7E09A4, #$0200, #0)

ti_speedbooster:
    %cm_toggle_bit("Speed Booster", $7E09A4, #$2000, #0)

ti_grapple:
    %cm_toggle_bit("Grapple", $7E09A2, #$4000, #0)

ti_xray:
    %cm_toggle_bit("X-Ray", $7E09A2, #$8000, #0)


; ------------------
; Toggle Beams menu
; ------------------

ToggleBeamsMenu:
    dw tb_chargebeam
    dw tb_icebeam
    dw tb_wavebeam
    dw tb_spazerbeam
    dw tb_plasmabeam
    dw #$0000
    %cm_header("TOGGLE BEAMS")

tb_chargebeam:
    %cm_toggle_bit("Charge", $7E09A8, #$1000, #0)

tb_icebeam:
    %cm_toggle_bit("Ice", $7E09A8, #$0002, #0)

tb_wavebeam:
    %cm_toggle_bit("Wave", $7E09A8, #$0001, #0)

tb_spazerbeam:
    %cm_toggle_bit("Spazer", $7E09A8, #$0004, #0)

tb_plasmabeam:
    %cm_toggle_bit("Plasma", $7E09A8, #$0008, #0)


; ------------------
; Select Preset Category menu
; ------------------

SelectPresetCategoryMenu:
    dw #precat_current
    dw #precat_routea
    dw #precat_routeb
    ; dw #precat_hundo
    ; dw #precat_100early
    ; dw #precat_rbo
    ; dw #precat_pkrd
    ; dw #precat_kpdr25
    ; dw #precat_gtclassic
    ; dw #precat_14ice
    ; dw #precat_14speed
    ; dw #precat_allbosskpdr
    ; dw #precat_allbosspkdr
    ; dw #precat_allbossprkd
    dw #$0000
    %cm_header("SELECT PRESET CATEGORY")

precat_current:
    dw !ACTION_CHOICE
    dl #!sram_preset_category
    dw #$0000
    db #$28, "CURRENT PRESET", #$FF
        db #$28, "    ROUTE A", #$FF ; Note the "y" ;)
        db #$28, "    ROUTE B", #$FF
        ; db #$28, "        100", #$FF
        ; db #$28, "  100 EARLY", #$FF
        ; db #$28, "        RBO", #$FF
        ; db #$28, "       PKRD", #$FF
        ; db #$28, "     KPDR25", #$FF
        ; db #$28, " GT CLASSIC", #$FF
        ; db #$28, "     14 ICE", #$FF
        ; db #$28, "   14 SPEED", #$FF
        ; db #$28, "   ALL KPDR", #$FF
        ; db #$28, "   ALL PKDR", #$FF
        ; db #$28, "   ALL PRKD", #$FF
    db #$FF
    db #$FF

precat_routea:
    %cm_jsr("Any% Route A", #action_select_preset_category, #$0000)

precat_routeb:
    %cm_jsr("Any% Route B", #action_select_preset_category, #$0001)

;precat_hundo:
;    %cm_jsr("100%", #action_select_preset_category, #$0002)

; precat_100early:
;     %cm_jsr("100% Early Crocomire", #action_select_preset_category, #$0003)

; precat_rbo:
;     %cm_jsr("Reverse Boss Order", #action_select_preset_category, #$0004)

; precat_pkrd:
;     %cm_jsr("Any% PKRD", #action_select_preset_category, #$0005)

; precat_kpdr25:
;     %cm_jsr("Any% KPDR Early Ice", #action_select_preset_category, #$0006)

; precat_gtclassic:
;     %cm_jsr("GT Classic", #action_select_preset_category, #$0007)

; precat_14ice:
;     %cm_jsr("Low% Ice", #action_select_preset_category, #$0008)

; precat_14speed:
;     %cm_jsr("Low% Speed", #action_select_preset_category, #$0009)

; precat_allbosskpdr:
;     %cm_jsr("All Bosses KPDR", #action_select_preset_category, #$000A)

; precat_allbosspkdr:
;     %cm_jsr("All Bosses PKDR", #action_select_preset_category, #$000B)

; precat_allbossprkd:
;     %cm_jsr("All Bosses PRKD", #action_select_preset_category, #$000C)

action_select_preset_category:
{
    TYA : STA !sram_preset_category
    JSR cm_go_back
    JSR cm_calculate_max
    RTS
}


; ; ---------------
; ; Teleport menu
; ; ---------------

TeleportMenu:

    dw #tel_goto_crateria
    dw #tel_goto_brinstar
    dw #tel_goto_norfair
    dw #tel_goto_wreckedship
    dw #tel_goto_maridia
    dw #tel_goto_tourian
    dw #$0000
    %cm_header("TELEPORT")


; ------------------
; Crateria Teleport Menu
; ------------------


tel_goto_crateria:
    %cm_submenu("Crateria", #GoToCrateriaMenu)

GoToCrateriaMenu:
    dw #tel_crateriaship
    dw #tel_cateriabombtorizo
    dw #tel_cateriaunderwater
    dw #tel_cateriaoldlab
    dw #$0000
    %cm_header("CRATERIA")


tel_crateriaship:
    %cm_jsr("Crateria Ship", #action_teleport, #$0000)

tel_cateriabombtorizo:
    %cm_jsr("Crateria Bomb Torizo", #action_teleport, #$0001)

tel_cateriaunderwater:
    %cm_jsr("Crateria Underwater", #action_teleport, #$0002)

tel_cateriaoldlab:
    %cm_jsr("Crateria Old Lab", #action_teleport, #$0003)


; ------------------
; Brinstar Teleport Menu
; ------------------


tel_goto_brinstar:
    %cm_submenu("Brinstar", #GoToBrinstarMenu)

GoToBrinstarMenu:
    dw #tel_brinstarentrace
    dw #tel_brinstarpink
    dw #tel_brinstarredtower
    dw #tel_brinstarkraid
    dw #tel_brinstarredtowerwaterway
    dw #$0000
    %cm_header("BRINSTAR")


tel_brinstarentrace:
    %cm_jsr("Brinstar Entrace", #action_teleport, #$0100)

tel_brinstarpink:
    %cm_jsr("Brinstar Pink", #action_teleport, #$0101)

tel_brinstarredtower:
    %cm_jsr("Brinstar Red Tower", #action_teleport, #$0102)

tel_brinstarkraid:
    %cm_jsr("Brinstar Kraid", #action_teleport, #$0103)

tel_brinstarredtowerwaterway:
    %cm_jsr("Brinstar Red Tower Waterway", #action_teleport, #$0104)

; ------------------
; Norfair Teleport Menu
; ------------------

tel_goto_norfair:
    %cm_submenu("Norfair", #GoToNorfairMenu)

GoToNorfairMenu:
    dw #tel_norfairentrace
    dw #tel_norfairsupermissiles
    dw #tel_norfairbubbleroom
    dw #tel_norfaircrocomire
    dw #tel_norfairbubblemountain
    dw #tel_norfairridley
    dw #$0000
    %cm_header("NORFAIR")


tel_norfairentrace:
    %cm_jsr("Norfair Entrace", #action_teleport, #$0202)

tel_norfairsupermissiles:
    %cm_jsr("Norfair Super Missiles", #action_teleport, #$0200)

tel_norfairbubbleroom:
    %cm_jsr("Norfair Bubble Room", #action_teleport, #$0201)

tel_norfaircrocomire:
    %cm_jsr("Norfair Crocomire", #action_teleport, #$0203)

tel_norfairbubblemountain:
    %cm_jsr("Norfair Bubble Mountain", #action_teleport, #$0204)

tel_norfairridley:
    %cm_jsr("Norfair Ridley", #action_teleport, #$0205)

; ------------------
; Wrecked Ship Teleport Menu
; ------------------

tel_goto_wreckedship:
    %cm_submenu("Wrecked Ship", #GoToWreckedShipMenu)

GoToWreckedShipMenu:
    dw #tel_wreckedship
    dw #$0000
    %cm_header("WRECKED SHIP")

tel_wreckedship:
    %cm_jsr("Wrecked Ship", #action_teleport, #$0300)

; ------------------
; Maridia Teleport Menu
; ------------------

tel_goto_maridia:
    %cm_submenu("Maridia", #GoToMaridiaMenu)

GoToMaridiaMenu:
    dw #tel_maridiaelevator
    dw #tel_maridiaelevator2  
    dw #tel_maridiaupper
    dw #tel_maridialower
    dw #tel_maridiadraygon
    dw #$0000
    %cm_header("MARIDIA")

tel_maridiaelevator:
    %cm_jsr("Maridia Elevator", #action_teleport, #$0400)

tel_maridiaelevator2:
    %cm_jsr("Maridia Elevator 2", #action_teleport, #$0401)

tel_maridiaupper:
    %cm_jsr("Maridia Upper", #action_teleport, #$0402)

tel_maridialower:
    %cm_jsr("Maridia Lower", #action_teleport, #$0403)

tel_maridiadraygon:
    %cm_jsr("Maridia Draygon", #action_teleport, #$0404)

; ------------------
; Tourian Teleport Menu
; ------------------

tel_goto_tourian:
    %cm_submenu("Tourian", #GoToTourianMenu)

GoToTourianMenu:
    dw #tel_tourianentrance
    dw #tel_tourianbbyskip
    dw #tel_tourianmb
    dw #$0000
    %cm_header("TOURIAN")

tel_tourianentrance:
    %cm_jsr("Tourian Entrance", #action_teleport, #$0501)

tel_tourianbbyskip:
    %cm_jsr("Tourian Baby Skip", #action_teleport, #$0511)

tel_tourianmb:
    %cm_jsr("Tourian MB", #action_teleport, #$0500)

action_teleport:
{
    ; teleport destination in Y when called
    TYA : AND #$FF00 : XBA : STA $7E079F
    TYA : AND #$00FF : STA $7E078B
    LDA #$0006 : STA $7E0998

    ; Make sure we can teleport to Zebes from Ceres
    SEP #$20
    LDA #$05 : STA $7ED914
    REP #$20

    JSL reset_all_counters
    JSL stop_all_sounds

    LDA #$0001 : STA !ram_cm_leave

    RTS
}

; ; -----------
; ; Misc menu
; ; -----------

MiscMenu:
    dw #misc_bluesuit
    dw #misc_flashsuit
    dw #misc_hyperbeam
    dw #misc_babyslowdown
    dw #misc_magicpants
    dw #misc_fanfare_toggle
    dw #misc_music_toggle
    dw #misc_transparent
    dw #misc_invincibility
    dw #$0000
    %cm_header("MISC")

misc_bluesuit:
    %cm_toggle("Blue Suit", $7E0B3F, #$0004, #0)

misc_flashsuit:
    %cm_toggle("Flash Suit", $7E0A68, #$0001, #0)

misc_hyperbeam:
    %cm_toggle("Hyper Beam", $7E0A76, #$0001, #0)

misc_babyslowdown:
    %cm_toggle("Baby Slowdown", $7E0A66, #$0002, #0)

misc_magicpants:
    %cm_toggle_bit("Magic Pants", !ram_magic_pants_1, #$0001, #0)

misc_fanfare_toggle:
    %cm_toggle("Fanfare", !sram_fanfare_toggle, #$0001, #0)

misc_music_toggle:
    %cm_toggle("Music", !sram_music_toggle, #$0001, .routine)

  .routine
    BIT #$0001 : BEQ .noMusic

    LDA $07F5 : STA $2140

    RTS

  .noMusic
    LDA #$0000 
    STA $0629
    STA $062B
    STA $062D
    STA $062F
    STA $0631
    STA $0633
    STA $0635
    STA $0637
    STA $063F
    STA $2140
    RTS

misc_transparent:
    %cm_toggle_bit("Samus on top", !ram_sprite_prio_flag, #$3000, #0)

misc_invincibility:
    %cm_toggle_bit("Invincibility", $7E0DE0, #$0007, #0)


; -----------
; Events menu
; -----------
EventsMenu:
    dw #events_resetevents
    dw #events_resetdoors
    dw #events_resetitems
    dw #events_goto_bosses
    dw #events_zebesawake
    dw #events_maridiatubebroken
    dw #events_chozoacid
    dw #events_shaktool
    dw #events_tourian
    dw #events_metroid1
    dw #events_metroid2
    dw #events_metroid3
    dw #events_metroid4
    dw #events_zebesexploding
    dw #events_animals
    dw #$0000
    %cm_header("EVENTS")

events_resetevents:
    %cm_jsr("Reset All Events", action_reset_events, #$0000)

events_resetdoors:
    %cm_jsr("Reset All Doors", action_reset_doors, #$0000)

events_resetitems:
    %cm_jsr("Reset All Items", action_reset_items, #$0000)

events_goto_bosses:
    %cm_submenu("Bosses", #BossesMenu)

events_zebesawake:
    %cm_toggle_bit("Zebes Awake", $7ED820, #$0001, #0)

events_maridiatubebroken:
    %cm_toggle_bit("Maridia Tube Broken", $7ED820, #$0800, #0)

events_shaktool:
    %cm_toggle_bit("Shaktool Done Digging", $7ED820, #$2000, #0)

events_chozoacid:
    %cm_toggle_bit("Chozo Lowered Acid", $7ED821, #$0010, #0)

events_tourian:
    %cm_toggle_bit("Tourian Open", $7ED820, #$0400, #0)

events_metroid1:
    %cm_toggle_bit("1st Metroids Cleared", $7ED822, #$0001, #0)

events_metroid2:
    %cm_toggle_bit("2nd Metroids Cleared", $7ED822, #$0002, #0)

events_metroid3:
    %cm_toggle_bit("3rd Metroids Cleared", $7ED822, #$0004, #0)

events_metroid4:
    %cm_toggle_bit("4th Metroids Cleared", $7ED822, #$0008, #0)

events_zebesexploding:
    %cm_toggle_bit("Zebes Set Ablaze", $7ED820, #$4000, #0)

events_animals:
    %cm_toggle_bit("Animals Saved", $7ED820, #$8000, #0)


action_reset_events:
{
    LDA #$0000
    STA $7ED820
    STA $7ED822
    LDA #!SOUND_MENU_JSR : JSL $80903F
    RTS
}

action_reset_doors:
{
    PHP
    %ai8()
    LDX #$B0
    LDA #$00
-   STA $7ED800, X
    INX
    CPX #$D0
    BNE -
    PLP
    LDA #!SOUND_MENU_JSR : JSL $80903F
    RTS
}

action_reset_items:
{
    PHP
    %ai8()
    LDX #$70
    LDA #$00
-   STA $7ED800, X
    INX
    CPX #$90
    BNE -
    PLP
    LDA #!SOUND_MENU_JSR : JSL $80903F
    RTS
}


; ; ------------
; ; Bosses menu
; ; ------------

BossesMenu:
    dw #boss_bombtorizo
    dw #boss_spospo
    dw #boss_kraid
    dw #boss_phantoon
    dw #boss_botwoon
    dw #boss_draygon
    dw #boss_crocomire
    dw #boss_gt
    dw #boss_ridley
    dw #$0000
    %cm_header("BOSSES")

boss_bombtorizo:
    %cm_toggle_bit("Bomb Torizo", #$7ED828, #$0004, #0)

boss_spospo:
    %cm_toggle_bit("Spore Spawn", #$7ED828, #$0200, #0)

boss_kraid:
    %cm_toggle_bit("Kraid", #$7ED828, #$0100, #0)

boss_phantoon:
    %cm_toggle_bit("Phantoon", #$7ED82A, #$0100, #0)

boss_botwoon:
    %cm_toggle_bit("Botwoon", #$7ED82C, #$0002, #0)

boss_draygon:
    %cm_toggle_bit("Draygon", #$7ED82C, #$0001, #0)

boss_crocomire:
    %cm_toggle_bit("Crocomire", #$7ED82A, #$0002, #0)

boss_gt:
    %cm_toggle_bit("Golden Torizo", #$7ED82A, #$0004, #0)

boss_ridley:
    %cm_toggle_bit("Ridley", #$7ED82A, #$0001, #0)


; ------------
; Config menu
; ------------

ConfigMenu:
    dw #$0000
    %cm_header("CONFIG")



; --------------
; Infohud menu
; --------------

InfoHudMenu:
    dw #ih_goto_display_mode
    dw #ih_display_mode
    dw #ih_goto_room_strat
    dw #ih_room_strat
    dw #ih_room_counter
    dw #ih_lag
    dw #$0000
    %cm_header("INFOHUD")

ih_goto_display_mode:
    %cm_submenu("Select InfoHUD Mode", #DisplayModeMenu)

DisplayModeMenu:
    dw ihmode_enemyhp
    dw ihmode_roomstrat
    dw ihmode_chargetimer
    dw ihmode_xfactor
    dw ihmode_cooldowncounter
    dw ihmode_shinetimer
    dw ihmode_dashcounter
    dw ihmode_shinefinetune
    dw ihmode_iframecounter
    dw ihmode_spikesuit
    dw ihmode_lagcounter
    dw ihmode_xpos
    dw ihmode_ypos
    dw ihmode_hspeed
    dw ihmode_vspeed
    dw ihmode_quickdrop
    dw ihmode_walljump
    dw ihmode_shottimer
    dw #$0000
    %cm_header("INFOHUD DISPLAY MODE")

ihmode_enemyhp:
    %cm_jsr("Enemy HP", #action_select_infohud_mode, #$0000)

ihmode_roomstrat:
    %cm_jsr("Room Strat", #action_select_infohud_mode, #$0001)

ihmode_chargetimer:
    %cm_jsr("Charge Timer", #action_select_infohud_mode, #$0002)

ihmode_xfactor:
    %cm_jsr("X-Factor Timer", #action_select_infohud_mode, #$0003)

ihmode_cooldowncounter:
    %cm_jsr("Cooldown Timer", #action_select_infohud_mode, #$0004)

ihmode_shinetimer:
    %cm_jsr("Shinespark Timer", #action_select_infohud_mode, #$0005)

ihmode_dashcounter:
    %cm_jsr("Dash Counter", #action_select_infohud_mode, #$0006)

ihmode_shinefinetune:
    %cm_jsr("Shine Tune", #action_select_infohud_mode, #$0007)

ihmode_iframecounter:
    %cm_jsr("I-Frame Counter", #action_select_infohud_mode, #$0008)

ihmode_spikesuit:
    %cm_jsr("Spikesuit Trainer", #action_select_infohud_mode, #$0009)

ihmode_lagcounter:
    %cm_jsr("CPU Usage", #action_select_infohud_mode, #$000A)

ihmode_xpos:
    %cm_jsr("X Position", #action_select_infohud_mode, #$000B)

ihmode_ypos:
    %cm_jsr("Y Position", #action_select_infohud_mode, #$000C)

ihmode_hspeed:
    %cm_jsr("Horizontal Speed", #action_select_infohud_mode, #$000D)

ihmode_vspeed:
    %cm_jsr("Vertical Speed", #action_select_infohud_mode, #$000E)

ihmode_quickdrop:
    %cm_jsr("Quickdrop Trainer", #action_select_infohud_mode, #$000F)

ihmode_walljump:
    %cm_jsr("Walljump Trainer", #action_select_infohud_mode, #$0010)

ihmode_shottimer:
    %cm_jsr("Shot Timer", #action_select_infohud_mode, #$0011)

action_select_infohud_mode:
{
    TYA : STA !sram_display_mode
    JSR cm_go_back
    JSR cm_calculate_max
    RTS
}

ih_display_mode:
    dw !ACTION_CHOICE
    dl #!sram_display_mode
    dw #$0000
    db #$28, "Current Mode", #$FF
    db #$28, "   ENEMY HP", #$FF
    db #$28, " ROOM STRAT", #$FF
    db #$28, "     CHARGE", #$FF
    db #$28, "   X FACTOR", #$FF
    db #$28, "   COOLDOWN", #$FF
    db #$28, " SHINESPARK", #$FF
    db #$28, "       DASH", #$FF
    db #$28, " SHINE TUNE", #$FF
    db #$28, "   I FRAMES", #$FF
    db #$28, "  SPIKESUIT", #$FF
    db #$28, "  CPU USAGE", #$FF
    db #$28, " X POSITION", #$FF
    db #$28, " Y POSITION", #$FF
    db #$28, "HORIZ SPEED", #$FF
    db #$28, " VERT SPEED", #$FF
    db #$28, " QUICK DROP", #$FF
    db #$28, "  WALL JUMP", #$FF
    db #$28, " SHOT TIMER", #$FF
    db #$FF

ih_goto_room_strat:
    %cm_submenu("Select Room Strat", #RoomStratMenu)

RoomStratMenu:
    dw ihstrat_tacotank
    dw ihstrat_gateglitch
    dw ihstrat_moatcwj
    dw ihstrat_robotflush
    dw ihstrat_shinetopb
    dw ihstrat_elevatorcf
    dw ihstrat_botwooncf
    dw ihstrat_mbhp
    dw #$0000
    %cm_header("INFOHUD ROOM STRAT")

ihstrat_tacotank:
    %cm_jsr("Taco Tank", #action_select_room_strat, #$0000)

ihstrat_gateglitch:
    %cm_jsr("Gate Glitch", #action_select_room_strat, #$0001)

ihstrat_moatcwj:
    %cm_jsr("Moat CWJ", #action_select_room_strat, #$0002)

ihstrat_robotflush:
    %cm_jsr("Robot Flush", #action_select_room_strat, #$0003)

ihstrat_shinetopb:
    %cm_jsr("Shine to PB", #action_select_room_strat, #$0004)

ihstrat_elevatorcf:
    %cm_jsr("Elevator Crystal Flash", #action_select_room_strat, #$0005)

ihstrat_botwooncf:
    %cm_jsr("Botwoon Crystal Flash", #action_select_room_strat, #$0006)

ihstrat_mbhp:
    %cm_jsr("Mother Brain HP", #action_select_room_strat, #$0007)

action_select_room_strat:
{
    TYA : STA !sram_room_strat
    LDA #$0001 : STA !sram_display_mode
    JSR cm_go_back
    JSR cm_calculate_max
    RTS
}

ih_room_strat:
    dw !ACTION_CHOICE
    dl #!sram_room_strat
    dw #$0000
    db #$28, "Current Strat", #$FF
    db #$28, "  TACO TANK", #$FF
    db #$28, "GATE GLITCH", #$FF
    db #$28, "   MOAT CWJ", #$FF
    db #$28, "ROBOT FLUSH", #$FF
    db #$28, "SHINE TO PB", #$FF
    db #$28, "ELEVATOR CF", #$FF
    db #$28, " BOTWOON CF", #$FF
    db #$28, "      MB HP", #$FF
    db #$FF

ih_room_counter:
    dw !ACTION_CHOICE
    dl #!sram_frame_counter_mode
    dw #$0000
    db #$28, "Frame Counters", #$FF
    db #$28, "   REALTIME", #$FF
    db #$28, "     INGAME", #$FF
    db #$FF

ih_lag:
    %cm_numfield("Artificial lag", !sram_artificial_lag, 0, 64, 1, #0)


; ----------
; Game menu
; ----------

GameMenu:
    dw #game_japanesetext
    dw #game_moonwalk
    dw #game_iconcancel
    dw #game_debugmode
    dw #$0000
    %cm_header("GAME")

game_japanesetext:
    %cm_toggle("Japanese Text", $7E09E2, #$0001, #0)

game_moonwalk:
    %cm_toggle("Moon Walk", $7E09E4, #$0001, #0)

game_iconcancel:
    %cm_toggle("Icon Cancel", $7E09EA, #$0001, #0)

game_debugmode:
    %cm_toggle("Debug Mode", $7E05D1, #$0001, #0)

; ----------
; RNG menu
; ----------

RngMenu:
    if !FEATURE_SD2SNES
        dw #rng_rerandomize
    endif
    dw #rng_phan_first_phase
    dw #rng_phan_second_phase
    dw #rng_phan_eyeclose
    dw #rng_botwoon_rng
    dw #rng_draygon_rng_right
    dw #rng_draygon_rng_left
    dw #rng_crocomire_rng
    dw #$0000
    %cm_header("BOSS RNG CONTROL")

rng_rerandomize:
    %cm_toggle("Rerandomize", !sram_rerandomize, #$0001, #0)

rng_botwoon_rng:
    dw !ACTION_CHOICE
    dl #!ram_botwoon_rng
    dw #$0000
    db #$28, "Botwoon RNG", #$FF
    db #$28, "     RANDOM", #$FF
    db #$28, "       DOWN", #$FF
    db #$28, "         UP", #$FF
    db #$28, "      RIGHT", #$FF
    db #$28, "       LEFT", #$FF
    db #$FF

rng_phan_first_phase:
    dw !ACTION_CHOICE
    dl #!ram_phantoon_rng_1
    dw #$0000
    db #$28, "Phan 1st Phase", #$FF
    db #$28, "     RANDOM", #$FF
    db #$28, "  FAST LEFT", #$FF
    db #$28, "   MID LEFT", #$FF
    db #$28, "  SLOW LEFT", #$FF
    db #$28, " FAST RIGHT", #$FF
    db #$28, "  MID RIGHT", #$FF
    db #$28, " SLOW RIGHT", #$FF
    db #$FF

rng_phan_second_phase:
    dw !ACTION_CHOICE
    dl #!ram_phantoon_rng_2
    dw #$0000
    db #$28, "Phan 2nd Phase", #$FF
    db #$28, "     RANDOM", #$FF
    db #$28, "  FAST LEFT", #$FF
    db #$28, "   MID LEFT", #$FF
    db #$28, "  SLOW LEFT", #$FF
    db #$28, " FAST RIGHT", #$FF
    db #$28, "  MID RIGHT", #$FF
    db #$28, " SLOW RIGHT", #$FF
    db #$FF

rng_phan_eyeclose:
    dw !ACTION_CHOICE
    dl #!ram_phantoon_rng_3
    dw #$0000
    db #$28, "Phan Eye Close", #$FF
    db #$28, "     RANDOM", #$FF
    db #$28, "       SLOW", #$FF
    db #$28, "        MID", #$FF
    db #$28, "       FAST", #$FF
    db #$FF

rng_draygon_rng_right:
    dw !ACTION_CHOICE
    dl #!ram_draygon_rng_right
    dw #$0000
    db #$28, "Draygon from R", #$FF
    db #$28, "ight RANDOM", #$FF
    db #$28, "ight   GOOP", #$FF
    db #$28, "ight  SWOOP", #$FF
    db #$FF

rng_draygon_rng_left:
    dw !ACTION_CHOICE
    dl #!ram_draygon_rng_left
    dw #$0000
    db #$28, "Draygon from L", #$FF
    db #$28, "eft  RANDOM", #$FF
    db #$28, "eft    GOOP", #$FF
    db #$28, "eft   SWOOP", #$FF
    db #$FF

rng_crocomire_rng:
    dw !ACTION_CHOICE
    dl #!ram_crocomire_rng
    dw #$0000
    db #$28, "Crocomire RNG", #$FF
    db #$28, "     RANDOM", #$FF
    db #$28, "       STEP", #$FF
    db #$28, "      SWIPE", #$FF
    db #$FF


; ----------
; Ctrl Menu
; ----------

CtrlMenu:
    dw #ctrl_menu
    dw #ctrl_load_last_preset
    if !FEATURE_SD2SNES
        dw #ctrl_save_state
        dw #ctrl_load_state
    endif
    dw #ctrl_reset_segment_timer
    dw #ctrl_full_equipment
    dw #ctrl_kill_enemies
    dw #ctrl_clear_shortcuts
    dw #$0000
    %cm_header("CONTROLLER SHORTCUTS")


ctrl_menu:
    %cm_ctrl_shortcut("Main menu", !sram_ctrl_menu)

ctrl_load_last_preset:
    %cm_ctrl_shortcut("Reload Preset", !sram_ctrl_load_last_preset)

ctrl_save_state:
    %cm_ctrl_shortcut("Save State", !sram_ctrl_save_state)

ctrl_load_state:
    %cm_ctrl_shortcut("Load State", !sram_ctrl_load_state)

ctrl_reset_segment_timer:
    %cm_ctrl_shortcut("Reset Seg Timer", !sram_ctrl_reset_segment_timer)

ctrl_full_equipment:
    %cm_ctrl_shortcut("Full Equipment", !sram_ctrl_full_equipment)

ctrl_kill_enemies:
    %cm_ctrl_shortcut("Kill Enemies", !sram_ctrl_kill_enemies)

ctrl_clear_shortcuts:
    %cm_jsr("Clear Shortcuts", action_clear_shortcuts, #$0000)

action_clear_shortcuts:
{
    TYA
    STA !sram_ctrl_save_state
    STA !sram_ctrl_load_state
    STA !sram_ctrl_load_last_preset
    STA !sram_ctrl_full_equipment
    STA !sram_ctrl_kill_enemies
    STA !sram_ctrl_reset_segment_timer
    ; menu to default, Start + Select
    LDA #$3000 : STA !sram_ctrl_menu
    RTS
}