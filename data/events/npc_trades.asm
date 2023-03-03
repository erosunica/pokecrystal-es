npctrade: MACRO
; dialog set, requested mon, offered mon, nickname, dvs, item, OT ID, OT name, gender requested
	db \1, \2, \3, \4, \5, \6, \7
	shift
	dw \7
	db \8, \9, 0
ENDM

NPCTrades:
; entries correspond to NPCTRADE_* constants
	npctrade TRADE_DIALOGSET_COLLECTOR, ABRA,       MACHOP,     "CACHAS@@@@@", $37, $66, GOLD_BERRY,   37460, "MIKI@@@@@@@", TRADE_GENDER_EITHER
	npctrade TRADE_DIALOGSET_COLLECTOR, BELLSPROUT, ONIX,       "ROCKY@@@@@@", $96, $66, BITTER_BERRY, 48926, "KEVIN@@@@@@", TRADE_GENDER_EITHER
	npctrade TRADE_DIALOGSET_HAPPY,     KRABBY,     VOLTORB,    "VOLTI@@@@@@", $98, $88, PRZCUREBERRY, 29189, "FALCÁN@@@@@", TRADE_GENDER_EITHER
	npctrade TRADE_DIALOGSET_GIRL,      DRAGONAIR,  DODRIO,     "VIDRI@@@@@@", $77, $66, SMOKE_BALL,   00283, "EMY@@@@@@@@", TRADE_GENDER_FEMALE
	npctrade TRADE_DIALOGSET_NEWBIE,    HAUNTER,    XATU,       "OMA@@@@@@@@", $96, $86, MYSTERYBERRY, 15616, "GABI@@@@@@@", TRADE_GENDER_EITHER
	npctrade TRADE_DIALOGSET_GIRL,      CHANSEY,    AERODACTYL, "AERO@@@@@@@", $96, $66, GOLD_BERRY,   26491, "NORMA@@@@@@", TRADE_GENDER_EITHER
	npctrade TRADE_DIALOGSET_COLLECTOR, DUGTRIO,    MAGNETON,   "TATO@@@@@@@", $96, $66, METAL_COAT,   50082, "GREPPI@@@@@", TRADE_GENDER_EITHER
