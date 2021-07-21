; $84:8C01 22 C1 8F 80 JSL $808FC1[$80:8FC1]
org $848C01
    JSL hook_queue_music_track


; $85:8493 20 36 81    JSR $8136  [$85:8136]
org $858493
    JSR hook_message_box_wait_for_music


; $82:E129 22 F7 8F 80 JSL $808FF7[$80:8FF7
org $82E129
    JSL hook_queue_music_track_2


org $85FF00
hook_queue_music_track:
    PHA
    CMP #$0002 : BNE +
    LDA !sram_fanfare_toggle : BNE +

    PLA
    RTL

    +
    PLA : JSL $808FC1
    RTL


hook_message_box_wait_for_music:
    LDA !sram_fanfare_toggle : BNE +
    CPX #$0168 : BNE +

    LDX #$0020

    +
    JMP $8136


hook_queue_music_track_2:
    PHA
    LDA !sram_fanfare_toggle : BNE +
    CPY #$0168 : BNE +

    LDY #$0020

    +
    PLA
    JML $808FF7