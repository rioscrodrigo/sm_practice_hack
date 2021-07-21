PresetsMenuRouteA:
    dw #presets_goto_routea_crateria
    dw #$0000
    %cm_header("PRESETS FOR ROUTEA")

presets_goto_routea_crateria:
    %cm_submenu("Crateria", #presets_submenu_routea_crateria)

presets_submenu_routea_crateria:
    dw #presets_routea_crateria_ship
    dw #presets_routea_crateria_segment_2
    dw #presets_routea_crateria_segment_3
    dw #presets_routea_crateria_segment_4
    dw #presets_routea_crateria_segment_5
    dw #presets_routea_crateria_segment_6
    dw #presets_routea_crateria_segment_7
    dw #presets_routea_crateria_segment_8
    dw #presets_routea_crateria_segment_9
    dw #presets_routea_crateria_segment_10
    dw #presets_routea_crateria_segment_11
    dw #presets_routea_crateria_segment_12
    dw #presets_routea_crateria_segment_13
    dw #presets_routea_crateria_segment_14
    dw #$0000
    %cm_header("CRATERIA")


; Crateria
presets_routea_crateria_ship:
    %cm_preset("Ship", #preset_routea_crateria_ship)

presets_routea_crateria_segment_2:
    %cm_preset("Segment 2", #preset_routea_crateria_segment_2)

presets_routea_crateria_segment_3:
    %cm_preset("Segment 3", #preset_routea_crateria_segment_3)

presets_routea_crateria_segment_4:
    %cm_preset("Segment 4", #preset_routea_crateria_segment_4)

presets_routea_crateria_segment_5:
    %cm_preset("Segment 5", #preset_routea_crateria_segment_5)

presets_routea_crateria_segment_6:
    %cm_preset("Segment 6", #preset_routea_crateria_segment_6)

presets_routea_crateria_segment_7:
    %cm_preset("Segment 7", #preset_routea_crateria_segment_7)

presets_routea_crateria_segment_8:
    %cm_preset("Segment 8", #preset_routea_crateria_segment_8)

presets_routea_crateria_segment_9:
    %cm_preset("Segment 9", #preset_routea_crateria_segment_9)

presets_routea_crateria_segment_10:
    %cm_preset("Segment 10", #preset_routea_crateria_segment_10)

presets_routea_crateria_segment_11:
    %cm_preset("Segment 11", #preset_routea_crateria_segment_11)

presets_routea_crateria_segment_12:
    %cm_preset("Segment 12", #preset_routea_crateria_segment_12)

presets_routea_crateria_segment_13:
    %cm_preset("Segment 13", #preset_routea_crateria_segment_13)

presets_routea_crateria_segment_14:
    %cm_preset("Segment 14", #preset_routea_crateria_segment_14)
