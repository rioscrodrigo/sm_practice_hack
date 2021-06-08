PresetsMenuRouteB:
    dw #presets_goto_routeb_crateria
    dw #presets_goto_routeb_brinstar
    dw #presets_goto_routeb_upper_norfair
    dw #presets_goto_routeb_red_brinstar
    dw #presets_goto_routeb_wrecked_ship
    dw #presets_goto_routeb_red_brinstar_final
    dw #presets_goto_routeb_maridia
    dw #presets_goto_routeb_upper_norfair_revisit
    dw #presets_goto_routeb_lower_norfair
    dw #presets_goto_routeb_backtracking
    dw #presets_goto_routeb_tourian
    dw #$0000
    %cm_header("PRESETS FOR ANY KPDR")

presets_goto_routeb_crateria:
    %cm_submenu("Crateria", #presets_submenu_routeb_crateria)

presets_goto_routeb_brinstar:
    %cm_submenu("Brinstar", #presets_submenu_routeb_brinstar)

presets_goto_routeb_upper_norfair:
    %cm_submenu("Upper Norfair", #presets_submenu_routeb_upper_norfair)

presets_goto_routeb_red_brinstar:
    %cm_submenu("Red Brinstar", #presets_submenu_routeb_red_brinstar)

presets_goto_routeb_wrecked_ship:
    %cm_submenu("Wrecked Ship", #presets_submenu_routeb_wrecked_ship)

presets_goto_routeb_red_brinstar_final:
    %cm_submenu("Red Brinstar Final", #presets_submenu_routeb_red_brinstar_final)

presets_goto_routeb_maridia:
    %cm_submenu("Maridia", #presets_submenu_routeb_maridia)

presets_goto_routeb_upper_norfair_revisit:
    %cm_submenu("Upper Norfair Revisit", #presets_submenu_routeb_upper_norfair_revisit)

presets_goto_routeb_lower_norfair:
    %cm_submenu("Lower Norfair", #presets_submenu_routeb_lower_norfair)

presets_goto_routeb_backtracking:
    %cm_submenu("Backtracking", #presets_submenu_routeb_backtracking)

presets_goto_routeb_tourian:
    %cm_submenu("Tourian", #presets_submenu_routeb_tourian)

presets_submenu_routeb_crateria:
    dw #presets_routeb_crateria_ship
    dw #presets_routeb_crateria_parlor
    dw #presets_routeb_crateria_parlor_downback
    dw #presets_routeb_crateria_climb_down
    dw #presets_routeb_crateria_pit_room
    dw #presets_routeb_crateria_morph
    dw #presets_routeb_crateria_construction_zone
    dw #presets_routeb_crateria_construction_zone_revisit
    dw #presets_routeb_crateria_pit_room_revisit
    dw #presets_routeb_crateria_climb_up
    dw #presets_routeb_crateria_parlor_revisit
    dw #presets_routeb_crateria_flyway
    dw #presets_routeb_crateria_bomb_torizo
    dw #presets_routeb_crateria_alcatraz
    dw #presets_routeb_crateria_terminator
    dw #presets_routeb_crateria_green_pirate_shaft
    dw #$0000
    %cm_header("CRATERIA")

presets_submenu_routeb_brinstar:
    dw #presets_routeb_brinstar_green_brinstar_elevator
    dw #presets_routeb_brinstar_early_supers
    dw #presets_routeb_brinstar_dachora_room
    dw #presets_routeb_brinstar_big_pink
    dw #presets_routeb_brinstar_green_hill_zone
    dw #presets_routeb_brinstar_noob_bridge
    dw #presets_routeb_brinstar_red_tower
    dw #presets_routeb_brinstar_skree_boost
    dw #presets_routeb_brinstar_below_spazer
    dw #presets_routeb_brinstar_entering_kraids_lair
    dw #presets_routeb_brinstar_kraid_kihunters
    dw #presets_routeb_brinstar_mini_kraid
    dw #presets_routeb_brinstar_kraid
    dw #presets_routeb_brinstar_leaving_varia
    dw #presets_routeb_brinstar_mini_kraid_revisit
    dw #presets_routeb_brinstar_kraid_kihunters_revisit
    dw #presets_routeb_brinstar_kraid_etank
    dw #$0000
    %cm_header("BRINSTAR")

presets_submenu_routeb_upper_norfair:
    dw #presets_routeb_upper_norfair_business_center
    dw #presets_routeb_upper_norfair_hi_jump_etank
    dw #presets_routeb_upper_norfair_leaving_hi_jump
    dw #presets_routeb_upper_norfair_business_center_2
    dw #presets_routeb_upper_norfair_precathedral
    dw #presets_routeb_upper_norfair_cathedral
    dw #presets_routeb_upper_norfair_rising_tide
    dw #presets_routeb_upper_norfair_bubble_mountain
    dw #presets_routeb_upper_norfair_bat_cave
    dw #presets_routeb_upper_norfair_single_chamber
    dw #presets_routeb_upper_norfair_double_chamber
    dw #presets_routeb_upper_norfair_double_chamber_revisit
    dw #presets_routeb_upper_norfair_single_chamber_revisit
    dw #presets_routeb_upper_norfair_bubble_mountain_revisit
    dw #presets_routeb_upper_norfair_frog_speedway
    dw #presets_routeb_upper_norfair_business_center_3
    dw #$0000
    %cm_header("UPPER NORFAIR")

presets_submenu_routeb_red_brinstar:
    dw #presets_routeb_red_brinstar_alpha_spark
    dw #presets_routeb_red_brinstar_reverse_skree_boost
    dw #presets_routeb_red_brinstar_red_tower_climb
    dw #presets_routeb_red_brinstar_hellway
    dw #presets_routeb_red_brinstar_caterpillars_down
    dw #presets_routeb_red_brinstar_alpha_power_bombs
    dw #presets_routeb_red_brinstar_caterpillars_up
    dw #$0000
    %cm_header("RED BRINSTAR")

presets_submenu_routeb_wrecked_ship:
    dw #presets_routeb_wrecked_ship_crateria_kihunters
    dw #presets_routeb_wrecked_ship_oceanfly_setup
    dw #presets_routeb_wrecked_ship_ocean_spark
    dw #presets_routeb_wrecked_ship_entering_wrecked_ship
    dw #presets_routeb_wrecked_ship_basement
    dw #presets_routeb_wrecked_ship_phantoon
    dw #presets_routeb_wrecked_ship_leaving_phantoon
    dw #presets_routeb_wrecked_ship_shaft_to_supers
    dw #presets_routeb_wrecked_ship_wrecked_ship_shaft
    dw #presets_routeb_wrecked_ship_attic
    dw #presets_routeb_wrecked_ship_upper_west_ocean
    dw #presets_routeb_wrecked_ship_pancakes_and_wavers
    dw #presets_routeb_wrecked_ship_bowling_spark
    dw #presets_routeb_wrecked_ship_leaving_gravity
    dw #presets_routeb_wrecked_ship_moat_ball
    dw #presets_routeb_wrecked_ship_crateria_kihunters_return
    dw #$0000
    %cm_header("WRECKED SHIP")

presets_submenu_routeb_red_brinstar_final:
    dw #presets_routeb_red_brinstar_final_red_tower_elevator
    dw #presets_routeb_red_brinstar_final_hellway_revisit
    dw #presets_routeb_red_brinstar_final_red_tower_down
    dw #presets_routeb_red_brinstar_final_skree_boost_final
    dw #presets_routeb_red_brinstar_final_below_spazer_final
    dw #$0000
    %cm_header("RED BRINSTAR FINAL")

presets_submenu_routeb_maridia:
    dw #presets_routeb_maridia_breaking_tube
    dw #presets_routeb_maridia_fish_tank
    dw #presets_routeb_maridia_mt_everest
    dw #presets_routeb_maridia_crab_shaft
    dw #presets_routeb_maridia_aqueduct
    dw #presets_routeb_maridia_botwoon_hallway
    dw #presets_routeb_maridia_botwoon
    dw #presets_routeb_maridia_botwoon_etank
    dw #presets_routeb_maridia_halfie_setup
    dw #presets_routeb_maridia_draygon
    dw #presets_routeb_maridia_reverse_halfie_spikesuit
    dw #presets_routeb_maridia_womple_jump
    dw #presets_routeb_maridia_cac_alley_east
    dw #presets_routeb_maridia_cac_alley_west
    dw #presets_routeb_maridia_plasma_spark
    dw #presets_routeb_maridia_plasma_climb
    dw #presets_routeb_maridia_plasma_beam
    dw #presets_routeb_maridia_plasma_spark_revisit
    dw #presets_routeb_maridia_toilet
    dw #presets_routeb_maridia_sewers
    dw #presets_routeb_maridia_lower_maridia_gate
    dw #$0000
    %cm_header("MARIDIA")

presets_submenu_routeb_upper_norfair_revisit:
    dw #presets_routeb_upper_norfair_revisit_ice_beam_gates
    dw #presets_routeb_upper_norfair_revisit_ice_maze_up
    dw #presets_routeb_upper_norfair_revisit_ice_maze_down
    dw #presets_routeb_upper_norfair_revisit_ice_escape
    dw #presets_routeb_upper_norfair_revisit_purple_shaft_upper
    dw #presets_routeb_upper_norfair_revisit_magdollite_tunnel_upper
    dw #presets_routeb_upper_norfair_revisit_kronic_boost_upper
    dw #presets_routeb_upper_norfair_revisit_croc_speedway_lower
    dw #presets_routeb_upper_norfair_revisit_spiky_acid_snakes_lower
    dw #presets_routeb_upper_norfair_revisit_kronic_boost_lower
    dw #$0000
    %cm_header("UPPER NORFAIR REVISIT")

presets_submenu_routeb_lower_norfair:
    dw #presets_routeb_lower_norfair_ln_main_hall
    dw #presets_routeb_lower_norfair_prepillars
    dw #presets_routeb_lower_norfair_worst_room_in_the_game
    dw #presets_routeb_lower_norfair_amphitheatre
    dw #presets_routeb_lower_norfair_kihunter_stairs_down
    dw #presets_routeb_lower_norfair_wasteland
    dw #presets_routeb_lower_norfair_metal_ninja_pirates
    dw #presets_routeb_lower_norfair_plowerhouse
    dw #presets_routeb_lower_norfair_ridley
    dw #presets_routeb_lower_norfair_leaving_ridley
    dw #presets_routeb_lower_norfair_reverse_plowerhouse
    dw #presets_routeb_lower_norfair_wasteland_revisit
    dw #presets_routeb_lower_norfair_kihunter_stairs_up
    dw #presets_routeb_lower_norfair_fire_flea_room
    dw #presets_routeb_lower_norfair_springball_maze
    dw #presets_routeb_lower_norfair_three_musketeers
    dw #presets_routeb_lower_norfair_single_chamber_final
    dw #presets_routeb_lower_norfair_bubble_mountain_final
    dw #presets_routeb_lower_norfair_business_center_final
    dw #$0000
    %cm_header("LOWER NORFAIR")

presets_submenu_routeb_backtracking:
    dw #presets_routeb_backtracking_maridia_tube_revisit
    dw #presets_routeb_backtracking_fish_tank_revisit
    dw #presets_routeb_backtracking_mt_everest_revisit_revisit
    dw #presets_routeb_backtracking_red_brinstar_green_gate
    dw #presets_routeb_backtracking_crateria_kihunters_final
    dw #presets_routeb_backtracking_parlor_spacejump
    dw #presets_routeb_backtracking_terminator_revisit
    dw #presets_routeb_backtracking_green_pirate_shaft_revisit
    dw #$0000
    %cm_header("BACKTRACKING")

presets_submenu_routeb_tourian:
    dw #presets_routeb_tourian_metroids_1
    dw #presets_routeb_tourian_metroids_2
    dw #presets_routeb_tourian_metroids_3
    dw #presets_routeb_tourian_metroids_4
    dw #presets_routeb_tourian_giant_hoppers
    dw #presets_routeb_tourian_baby_skip
    dw #presets_routeb_tourian_gedora_room
    dw #presets_routeb_tourian_zeb_skip
    dw #presets_routeb_tourian_escape_room_3
    dw #presets_routeb_tourian_climb_spark
    dw #presets_routeb_tourian_escape_parlor
    dw #$0000
    %cm_header("TOURIAN")

; Crateria
presets_routeb_crateria_ship:
    %cm_preset("Ship", #preset_routeb_crateria_ship)

presets_routeb_crateria_parlor:
    %cm_preset("Parlor", #preset_routeb_crateria_parlor)

presets_routeb_crateria_parlor_downback:
    %cm_preset("Parlor Downback", #preset_routeb_crateria_parlor_downback)

presets_routeb_crateria_climb_down:
    %cm_preset("Climb Down", #preset_routeb_crateria_climb_down)

presets_routeb_crateria_pit_room:
    %cm_preset("Pit Room", #preset_routeb_crateria_pit_room)

presets_routeb_crateria_morph:
    %cm_preset("Morph", #preset_routeb_crateria_morph)

presets_routeb_crateria_construction_zone:
    %cm_preset("Construction Zone", #preset_routeb_crateria_construction_zone)

presets_routeb_crateria_construction_zone_revisit:
    %cm_preset("Construction Zone Revisit", #preset_routeb_crateria_construction_zone_revisit)

presets_routeb_crateria_pit_room_revisit:
    %cm_preset("Pit Room Revisit", #preset_routeb_crateria_pit_room_revisit)

presets_routeb_crateria_climb_up:
    %cm_preset("Climb Up", #preset_routeb_crateria_climb_up)

presets_routeb_crateria_parlor_revisit:
    %cm_preset("Parlor Revisit", #preset_routeb_crateria_parlor_revisit)

presets_routeb_crateria_flyway:
    %cm_preset("Flyway", #preset_routeb_crateria_flyway)

presets_routeb_crateria_bomb_torizo:
    %cm_preset("Bomb Torizo", #preset_routeb_crateria_bomb_torizo)

presets_routeb_crateria_alcatraz:
    %cm_preset("Alcatraz", #preset_routeb_crateria_alcatraz)

presets_routeb_crateria_terminator:
    %cm_preset("Terminator", #preset_routeb_crateria_terminator)

presets_routeb_crateria_green_pirate_shaft:
    %cm_preset("Green Pirate Shaft", #preset_routeb_crateria_green_pirate_shaft)


; Brinstar
presets_routeb_brinstar_green_brinstar_elevator:
    %cm_preset("Green Brinstar Elevator", #preset_routeb_brinstar_green_brinstar_elevator)

presets_routeb_brinstar_early_supers:
    %cm_preset("Early Supers", #preset_routeb_brinstar_early_supers)

presets_routeb_brinstar_dachora_room:
    %cm_preset("Dachora Room", #preset_routeb_brinstar_dachora_room)

presets_routeb_brinstar_big_pink:
    %cm_preset("Big Pink", #preset_routeb_brinstar_big_pink)

presets_routeb_brinstar_green_hill_zone:
    %cm_preset("Green Hill Zone", #preset_routeb_brinstar_green_hill_zone)

presets_routeb_brinstar_noob_bridge:
    %cm_preset("Noob Bridge", #preset_routeb_brinstar_noob_bridge)

presets_routeb_brinstar_red_tower:
    %cm_preset("Red Tower", #preset_routeb_brinstar_red_tower)

presets_routeb_brinstar_skree_boost:
    %cm_preset("Skree Boost", #preset_routeb_brinstar_skree_boost)

presets_routeb_brinstar_below_spazer:
    %cm_preset("Below Spazer", #preset_routeb_brinstar_below_spazer)

presets_routeb_brinstar_entering_kraids_lair:
    %cm_preset("Entering Kraids Lair", #preset_routeb_brinstar_entering_kraids_lair)

presets_routeb_brinstar_kraid_kihunters:
    %cm_preset("Kraid Kihunters", #preset_routeb_brinstar_kraid_kihunters)

presets_routeb_brinstar_mini_kraid:
    %cm_preset("Mini Kraid", #preset_routeb_brinstar_mini_kraid)

presets_routeb_brinstar_kraid:
    %cm_preset("Kraid", #preset_routeb_brinstar_kraid)

presets_routeb_brinstar_leaving_varia:
    %cm_preset("Leaving Varia", #preset_routeb_brinstar_leaving_varia)

presets_routeb_brinstar_mini_kraid_revisit:
    %cm_preset("Mini Kraid Revisit", #preset_routeb_brinstar_mini_kraid_revisit)

presets_routeb_brinstar_kraid_kihunters_revisit:
    %cm_preset("Kraid Kihunters Revisit", #preset_routeb_brinstar_kraid_kihunters_revisit)

presets_routeb_brinstar_kraid_etank:
    %cm_preset("Kraid E-tank", #preset_routeb_brinstar_kraid_etank)


; Upper Norfair
presets_routeb_upper_norfair_business_center:
    %cm_preset("Business Center", #preset_routeb_upper_norfair_business_center)

presets_routeb_upper_norfair_hi_jump_etank:
    %cm_preset("Hi Jump E-tank", #preset_routeb_upper_norfair_hi_jump_etank)

presets_routeb_upper_norfair_leaving_hi_jump:
    %cm_preset("Leaving Hi Jump", #preset_routeb_upper_norfair_leaving_hi_jump)

presets_routeb_upper_norfair_business_center_2:
    %cm_preset("Business Center 2", #preset_routeb_upper_norfair_business_center_2)

presets_routeb_upper_norfair_precathedral:
    %cm_preset("Pre-Cathedral", #preset_routeb_upper_norfair_precathedral)

presets_routeb_upper_norfair_cathedral:
    %cm_preset("Cathedral", #preset_routeb_upper_norfair_cathedral)

presets_routeb_upper_norfair_rising_tide:
    %cm_preset("Rising Tide", #preset_routeb_upper_norfair_rising_tide)

presets_routeb_upper_norfair_bubble_mountain:
    %cm_preset("Bubble Mountain", #preset_routeb_upper_norfair_bubble_mountain)

presets_routeb_upper_norfair_bat_cave:
    %cm_preset("Bat Cave", #preset_routeb_upper_norfair_bat_cave)

presets_routeb_upper_norfair_single_chamber:
    %cm_preset("Single Chamber", #preset_routeb_upper_norfair_single_chamber)

presets_routeb_upper_norfair_double_chamber:
    %cm_preset("Double Chamber", #preset_routeb_upper_norfair_double_chamber)

presets_routeb_upper_norfair_double_chamber_revisit:
    %cm_preset("Double Chamber Revisit", #preset_routeb_upper_norfair_double_chamber_revisit)

presets_routeb_upper_norfair_single_chamber_revisit:
    %cm_preset("Single Chamber Revisit", #preset_routeb_upper_norfair_single_chamber_revisit)

presets_routeb_upper_norfair_bubble_mountain_revisit:
    %cm_preset("Bubble Mountain Revisit", #preset_routeb_upper_norfair_bubble_mountain_revisit)

presets_routeb_upper_norfair_frog_speedway:
    %cm_preset("Frog Speedway", #preset_routeb_upper_norfair_frog_speedway)

presets_routeb_upper_norfair_business_center_3:
    %cm_preset("Business Center 3", #preset_routeb_upper_norfair_business_center_3)


; Red Brinstar
presets_routeb_red_brinstar_alpha_spark:
    %cm_preset("Alpha Spark", #preset_routeb_red_brinstar_alpha_spark)

presets_routeb_red_brinstar_reverse_skree_boost:
    %cm_preset("Reverse Skree Boost", #preset_routeb_red_brinstar_reverse_skree_boost)

presets_routeb_red_brinstar_red_tower_climb:
    %cm_preset("Red Tower Climb", #preset_routeb_red_brinstar_red_tower_climb)

presets_routeb_red_brinstar_hellway:
    %cm_preset("Hellway", #preset_routeb_red_brinstar_hellway)

presets_routeb_red_brinstar_caterpillars_down:
    %cm_preset("Caterpillars Down", #preset_routeb_red_brinstar_caterpillars_down)

presets_routeb_red_brinstar_alpha_power_bombs:
    %cm_preset("Alpha Power Bombs", #preset_routeb_red_brinstar_alpha_power_bombs)

presets_routeb_red_brinstar_caterpillars_up:
    %cm_preset("Caterpillars Up", #preset_routeb_red_brinstar_caterpillars_up)


; Wrecked Ship
presets_routeb_wrecked_ship_crateria_kihunters:
    %cm_preset("Crateria Kihunters", #preset_routeb_wrecked_ship_crateria_kihunters)

presets_routeb_wrecked_ship_oceanfly_setup:
    %cm_preset("Oceanfly Setup", #preset_routeb_wrecked_ship_oceanfly_setup)

presets_routeb_wrecked_ship_ocean_spark:
    %cm_preset("Ocean Spark", #preset_routeb_wrecked_ship_ocean_spark)

presets_routeb_wrecked_ship_entering_wrecked_ship:
    %cm_preset("Entering Wrecked Ship", #preset_routeb_wrecked_ship_entering_wrecked_ship)

presets_routeb_wrecked_ship_basement:
    %cm_preset("Basement", #preset_routeb_wrecked_ship_basement)

presets_routeb_wrecked_ship_phantoon:
    %cm_preset("Phantoon", #preset_routeb_wrecked_ship_phantoon)

presets_routeb_wrecked_ship_leaving_phantoon:
    %cm_preset("Leaving Phantoon", #preset_routeb_wrecked_ship_leaving_phantoon)

presets_routeb_wrecked_ship_shaft_to_supers:
    %cm_preset("Shaft to Supers", #preset_routeb_wrecked_ship_shaft_to_supers)

presets_routeb_wrecked_ship_wrecked_ship_shaft:
    %cm_preset("Wrecked Ship Shaft", #preset_routeb_wrecked_ship_wrecked_ship_shaft)

presets_routeb_wrecked_ship_attic:
    %cm_preset("Attic", #preset_routeb_wrecked_ship_attic)

presets_routeb_wrecked_ship_upper_west_ocean:
    %cm_preset("Upper West Ocean", #preset_routeb_wrecked_ship_upper_west_ocean)

presets_routeb_wrecked_ship_pancakes_and_wavers:
    %cm_preset("Pancakes and Wavers", #preset_routeb_wrecked_ship_pancakes_and_wavers)

presets_routeb_wrecked_ship_bowling_spark:
    %cm_preset("Bowling Spark", #preset_routeb_wrecked_ship_bowling_spark)

presets_routeb_wrecked_ship_leaving_gravity:
    %cm_preset("Leaving Gravity", #preset_routeb_wrecked_ship_leaving_gravity)

presets_routeb_wrecked_ship_moat_ball:
    %cm_preset("Moat Ball", #preset_routeb_wrecked_ship_moat_ball)

presets_routeb_wrecked_ship_crateria_kihunters_return:
    %cm_preset("Crateria Kihunters Return", #preset_routeb_wrecked_ship_crateria_kihunters_return)


; Red Brinstar Final
presets_routeb_red_brinstar_final_red_tower_elevator:
    %cm_preset("Red Tower Elevator", #preset_routeb_red_brinstar_final_red_tower_elevator)

presets_routeb_red_brinstar_final_hellway_revisit:
    %cm_preset("Hellway Revisit", #preset_routeb_red_brinstar_final_hellway_revisit)

presets_routeb_red_brinstar_final_red_tower_down:
    %cm_preset("Red Tower Down", #preset_routeb_red_brinstar_final_red_tower_down)

presets_routeb_red_brinstar_final_skree_boost_final:
    %cm_preset("Skree Boost Final", #preset_routeb_red_brinstar_final_skree_boost_final)

presets_routeb_red_brinstar_final_below_spazer_final:
    %cm_preset("Below Spazer Final", #preset_routeb_red_brinstar_final_below_spazer_final)


; Maridia
presets_routeb_maridia_breaking_tube:
    %cm_preset("Breaking Tube", #preset_routeb_maridia_breaking_tube)

presets_routeb_maridia_fish_tank:
    %cm_preset("Fish Tank", #preset_routeb_maridia_fish_tank)

presets_routeb_maridia_mt_everest:
    %cm_preset("Mt Everest", #preset_routeb_maridia_mt_everest)

presets_routeb_maridia_crab_shaft:
    %cm_preset("Crab Shaft", #preset_routeb_maridia_crab_shaft)

presets_routeb_maridia_aqueduct:
    %cm_preset("Aqueduct", #preset_routeb_maridia_aqueduct)

presets_routeb_maridia_botwoon_hallway:
    %cm_preset("Botwoon Hallway", #preset_routeb_maridia_botwoon_hallway)

presets_routeb_maridia_botwoon:
    %cm_preset("Botwoon", #preset_routeb_maridia_botwoon)

presets_routeb_maridia_botwoon_etank:
    %cm_preset("Botwoon E-tank", #preset_routeb_maridia_botwoon_etank)

presets_routeb_maridia_halfie_setup:
    %cm_preset("Halfie Setup", #preset_routeb_maridia_halfie_setup)

presets_routeb_maridia_draygon:
    %cm_preset("Draygon", #preset_routeb_maridia_draygon)

presets_routeb_maridia_reverse_halfie_spikesuit:
    %cm_preset("Reverse Halfie (Spikesuit)", #preset_routeb_maridia_reverse_halfie_spikesuit)

presets_routeb_maridia_womple_jump:
    %cm_preset("Womple Jump", #preset_routeb_maridia_womple_jump)

presets_routeb_maridia_cac_alley_east:
    %cm_preset("Cac Alley East", #preset_routeb_maridia_cac_alley_east)

presets_routeb_maridia_cac_alley_west:
    %cm_preset("Cac Alley West", #preset_routeb_maridia_cac_alley_west)

presets_routeb_maridia_plasma_spark:
    %cm_preset("Plasma Spark", #preset_routeb_maridia_plasma_spark)

presets_routeb_maridia_plasma_climb:
    %cm_preset("Plasma Climb", #preset_routeb_maridia_plasma_climb)

presets_routeb_maridia_plasma_beam:
    %cm_preset("Plasma Beam", #preset_routeb_maridia_plasma_beam)

presets_routeb_maridia_plasma_spark_revisit:
    %cm_preset("Plasma Spark Revisit", #preset_routeb_maridia_plasma_spark_revisit)

presets_routeb_maridia_toilet:
    %cm_preset("Toilet", #preset_routeb_maridia_toilet)

presets_routeb_maridia_sewers:
    %cm_preset("Sewers", #preset_routeb_maridia_sewers)

presets_routeb_maridia_lower_maridia_gate:
    %cm_preset("Lower Maridia Gate", #preset_routeb_maridia_lower_maridia_gate)


; Upper Norfair Revisit
presets_routeb_upper_norfair_revisit_ice_beam_gates:
    %cm_preset("Ice Beam Gates", #preset_routeb_upper_norfair_revisit_ice_beam_gates)

presets_routeb_upper_norfair_revisit_ice_maze_up:
    %cm_preset("Ice Maze Up", #preset_routeb_upper_norfair_revisit_ice_maze_up)

presets_routeb_upper_norfair_revisit_ice_maze_down:
    %cm_preset("Ice Maze Down", #preset_routeb_upper_norfair_revisit_ice_maze_down)

presets_routeb_upper_norfair_revisit_ice_escape:
    %cm_preset("Ice Escape", #preset_routeb_upper_norfair_revisit_ice_escape)

presets_routeb_upper_norfair_revisit_purple_shaft_upper:
    %cm_preset("Purple Shaft (Upper)", #preset_routeb_upper_norfair_revisit_purple_shaft_upper)

presets_routeb_upper_norfair_revisit_magdollite_tunnel_upper:
    %cm_preset("Magdollite Tunnel (Upper)", #preset_routeb_upper_norfair_revisit_magdollite_tunnel_upper)

presets_routeb_upper_norfair_revisit_kronic_boost_upper:
    %cm_preset("Kronic Boost (Upper)", #preset_routeb_upper_norfair_revisit_kronic_boost_upper)

presets_routeb_upper_norfair_revisit_croc_speedway_lower:
    %cm_preset("Croc Speedway (Lower)", #preset_routeb_upper_norfair_revisit_croc_speedway_lower)

presets_routeb_upper_norfair_revisit_spiky_acid_snakes_lower:
    %cm_preset("Spiky Acid Snakes (Lower)", #preset_routeb_upper_norfair_revisit_spiky_acid_snakes_lower)

presets_routeb_upper_norfair_revisit_kronic_boost_lower:
    %cm_preset("Kronic Boost (Lower)", #preset_routeb_upper_norfair_revisit_kronic_boost_lower)


; Lower Norfair
presets_routeb_lower_norfair_ln_main_hall:
    %cm_preset("LN Main Hall", #preset_routeb_lower_norfair_ln_main_hall)

presets_routeb_lower_norfair_prepillars:
    %cm_preset("Pre-Pillars", #preset_routeb_lower_norfair_prepillars)

presets_routeb_lower_norfair_worst_room_in_the_game:
    %cm_preset("Worst Room in the Game", #preset_routeb_lower_norfair_worst_room_in_the_game)

presets_routeb_lower_norfair_amphitheatre:
    %cm_preset("Amphitheatre", #preset_routeb_lower_norfair_amphitheatre)

presets_routeb_lower_norfair_kihunter_stairs_down:
    %cm_preset("Kihunter Stairs Down", #preset_routeb_lower_norfair_kihunter_stairs_down)

presets_routeb_lower_norfair_wasteland:
    %cm_preset("Wasteland", #preset_routeb_lower_norfair_wasteland)

presets_routeb_lower_norfair_metal_ninja_pirates:
    %cm_preset("Metal Ninja Pirates", #preset_routeb_lower_norfair_metal_ninja_pirates)

presets_routeb_lower_norfair_plowerhouse:
    %cm_preset("Plowerhouse", #preset_routeb_lower_norfair_plowerhouse)

presets_routeb_lower_norfair_ridley:
    %cm_preset("Ridley", #preset_routeb_lower_norfair_ridley)

presets_routeb_lower_norfair_leaving_ridley:
    %cm_preset("Leaving Ridley", #preset_routeb_lower_norfair_leaving_ridley)

presets_routeb_lower_norfair_reverse_plowerhouse:
    %cm_preset("Reverse Plowerhouse", #preset_routeb_lower_norfair_reverse_plowerhouse)

presets_routeb_lower_norfair_wasteland_revisit:
    %cm_preset("Wasteland Revisit", #preset_routeb_lower_norfair_wasteland_revisit)

presets_routeb_lower_norfair_kihunter_stairs_up:
    %cm_preset("Kihunter Stairs Up", #preset_routeb_lower_norfair_kihunter_stairs_up)

presets_routeb_lower_norfair_fire_flea_room:
    %cm_preset("Fire Flea Room", #preset_routeb_lower_norfair_fire_flea_room)

presets_routeb_lower_norfair_springball_maze:
    %cm_preset("Springball Maze", #preset_routeb_lower_norfair_springball_maze)

presets_routeb_lower_norfair_three_musketeers:
    %cm_preset("Three Musketeers", #preset_routeb_lower_norfair_three_musketeers)

presets_routeb_lower_norfair_single_chamber_final:
    %cm_preset("Single Chamber Final", #preset_routeb_lower_norfair_single_chamber_final)

presets_routeb_lower_norfair_bubble_mountain_final:
    %cm_preset("Bubble Mountain Final", #preset_routeb_lower_norfair_bubble_mountain_final)

presets_routeb_lower_norfair_business_center_final:
    %cm_preset("Business Center Final", #preset_routeb_lower_norfair_business_center_final)


; Backtracking
presets_routeb_backtracking_maridia_tube_revisit:
    %cm_preset("Maridia Tube Revisit", #preset_routeb_backtracking_maridia_tube_revisit)

presets_routeb_backtracking_fish_tank_revisit:
    %cm_preset("Fish Tank Revisit", #preset_routeb_backtracking_fish_tank_revisit)

presets_routeb_backtracking_mt_everest_revisit_revisit:
    %cm_preset("Mt Everest Revisit Revisit", #preset_routeb_backtracking_mt_everest_revisit_revisit)

presets_routeb_backtracking_red_brinstar_green_gate:
    %cm_preset("Red Brinstar Green Gate", #preset_routeb_backtracking_red_brinstar_green_gate)

presets_routeb_backtracking_crateria_kihunters_final:
    %cm_preset("Crateria Kihunters Final", #preset_routeb_backtracking_crateria_kihunters_final)

presets_routeb_backtracking_parlor_spacejump:
    %cm_preset("Parlor Spacejump", #preset_routeb_backtracking_parlor_spacejump)

presets_routeb_backtracking_terminator_revisit:
    %cm_preset("Terminator Revisit", #preset_routeb_backtracking_terminator_revisit)

presets_routeb_backtracking_green_pirate_shaft_revisit:
    %cm_preset("Green Pirate Shaft Revisit", #preset_routeb_backtracking_green_pirate_shaft_revisit)


; Tourian
presets_routeb_tourian_metroids_1:
    %cm_preset("Metroids 1", #preset_routeb_tourian_metroids_1)

presets_routeb_tourian_metroids_2:
    %cm_preset("Metroids 2", #preset_routeb_tourian_metroids_2)

presets_routeb_tourian_metroids_3:
    %cm_preset("Metroids 3", #preset_routeb_tourian_metroids_3)

presets_routeb_tourian_metroids_4:
    %cm_preset("Metroids 4", #preset_routeb_tourian_metroids_4)

presets_routeb_tourian_giant_hoppers:
    %cm_preset("Giant Hoppers", #preset_routeb_tourian_giant_hoppers)

presets_routeb_tourian_baby_skip:
    %cm_preset("Baby Skip", #preset_routeb_tourian_baby_skip)

presets_routeb_tourian_gedora_room:
    %cm_preset("Gedora Room", #preset_routeb_tourian_gedora_room)

presets_routeb_tourian_zeb_skip:
    %cm_preset("Zeb Skip", #preset_routeb_tourian_zeb_skip)

presets_routeb_tourian_escape_room_3:
    %cm_preset("Escape Room 3", #preset_routeb_tourian_escape_room_3)

presets_routeb_tourian_climb_spark:
    %cm_preset("Climb Spark", #preset_routeb_tourian_climb_spark)

presets_routeb_tourian_escape_parlor:
    %cm_preset("Escape Parlor", #preset_routeb_tourian_escape_parlor)


