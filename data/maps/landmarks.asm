landmark: MACRO
; x, y, name
	db \1 + 8, \2 + 16
	dw \3
ENDM

Landmarks:
; entries correspond to constants/landmark_constants.asm
	dbbw       0,   0, SpecialMapName
	landmark 140, 100, NewBarkTownName
	landmark 128, 100, Route29Name
	landmark 100, 100, CherrygroveCityName
	landmark 100,  80, Route30Name
	landmark  96,  60, Route31Name
	landmark  84,  60, VioletCityName
	landmark  85,  58, SproutTowerName
	landmark  84,  92, Route32Name
	landmark  76,  76, RuinsOfAlphName
	landmark  84, 124, UnionCaveName
	landmark  82, 124, Route33Name
	landmark  68, 124, AzaleaTownName
	landmark  70, 122, SlowpokeWellName
	landmark  52, 120, IlexForestName
	landmark  52, 112, Route34Name
	landmark  52,  92, GoldenrodCityName
	landmark  50,  92, RadioTowerName
	landmark  52,  76, Route35Name
	landmark  52,  60, NationalParkName
	landmark  64,  60, Route36Name
	landmark  68,  52, Route37Name
	landmark  68,  44, EcruteakCityName
	landmark  70,  42, TinTowerName
	landmark  66,  42, BurnedTowerName
	landmark  52,  44, Route38Name
	landmark  36,  48, Route39Name
	landmark  36,  60, OlivineCityName
	landmark  38,  62, LighthouseName
	landmark  28,  56, BattleTowerName
	landmark  28,  64, Route40Name
	landmark  28,  92, WhirlIslandsName
	landmark  28, 100, Route41Name
	landmark  20, 100, CianwoodCityName
	landmark  92,  44, Route42Name
	landmark  84,  44, MtMortarName
	landmark 108,  44, MahoganyTownName
	landmark 108,  36, Route43Name
	landmark 108,  28, LakeOfRageName
	landmark 120,  44, Route44Name
	landmark 130,  38, IcePathName
	landmark 132,  44, BlackthornCityName
	landmark 132,  36, DragonsDenName
	landmark 132,  64, Route45Name
	landmark 112,  72, DarkCaveName
	landmark 124,  88, Route46Name
	landmark 148,  68, SilverCaveName
	landmark  52, 108, PalletTownName
	landmark  52,  92, Route1Name
	landmark  52,  76, ViridianCityName
	landmark  52,  64, Route2Name
	landmark  52,  52, PewterCityName
	landmark  64,  52, Route3Name
	landmark  76,  52, MtMoonName
	landmark  88,  52, Route4Name
	landmark 100,  52, CeruleanCityName
	landmark 100,  44, Route24Name
	landmark 108,  36, Route25Name
	landmark 100,  60, Route5Name
	landmark 108,  76, UndergroundName
	landmark 100,  76, Route6Name
	landmark 100,  84, VermilionCityName
	landmark  88,  60, DiglettsCaveName
	landmark  88,  68, Route7Name
	landmark 116,  68, Route8Name
	landmark 116,  52, Route9Name
	landmark 132,  52, RockTunnelName
	landmark 132,  56, Route10Name
	landmark 132,  60, PowerPlantName
	landmark 132,  68, LavenderTownName
	landmark 140,  68, LavRadioTowerName
	landmark  76,  68, CeladonCityName
	landmark 100,  68, SaffronCityName
	landmark 116,  84, Route11Name
	landmark 132,  80, Route12Name
	landmark 124, 100, Route13Name
	landmark 116, 112, Route14Name
	landmark 104, 116, Route15Name
	landmark  68,  68, Route16Name
	landmark  68,  92, Route17Name
	landmark  80, 116, Route18Name
	landmark  92, 116, FuchsiaCityName
	landmark  92, 128, Route19Name
	landmark  76, 132, Route20Name
	landmark  68, 132, SeafoamIslandsName
	landmark  52, 132, CinnabarIslandName
	landmark  52, 120, Route21Name
	landmark  36,  68, Route22Name
	landmark  28,  52, VictoryRoadName
	landmark  28,  44, Route23Name
	landmark  28,  36, IndigoPlateauName
	landmark  28,  92, Route26Name
	landmark  20, 100, Route27Name
	landmark  12, 100, TohjoFallsName
	landmark  20,  68, Route28Name
	landmark 140, 116, FastShipName

NewBarkTownName:     db "PUEBLO¯PRIMAVERA@"
CherrygroveCityName: db "CIUDAD¯CEREZO@"
VioletCityName:      db "CIUDAD¯MALVA@"
AzaleaTownName:      db "PUEBLO¯AZALEA@"
GoldenrodCityName:   db "CIUDAD¯TRIGAL@"
EcruteakCityName:    db "CIUDAD¯IRIS@"
OlivineCityName:     db "CIUDAD¯OLIVO@"
CianwoodCityName:    db "CIUDAD¯ORQUÍDEA@"
MahoganyTownName:    db "PUEBLO¯CAOBA@"
BlackthornCityName:  db "CIUDAD¯ENDRINO@"
LakeOfRageName:      db "LAGO DE¯LA FURIA@"
SilverCaveName:      db "CUEVA¯PLATEADA@"
SproutTowerName:     db "TORRE¯BELLSPROUT@"
RuinsOfAlphName:     db "RUINAS¯ALFA@"
UnionCaveName:       db "CUEVA UNIÓN@"
SlowpokeWellName:    db "POZO¯SLOWPOKE@"
RadioTowerName:      db "TORRE RADIO@"
PowerPlantName:      db "CENTRAL¯ENERGÍA@"
NationalParkName:    db "PARQUE¯NACIONAL@"
TinTowerName:        db "TORRE¯HOJALATA@"
LighthouseName:      db "FARO@"
WhirlIslandsName:    db "ISLAS¯REMOLINO@"
MtMortarName:        db "MT. MORTERO@"
DragonsDenName:      db "GUARIDA¯DRAGÓN@"
IcePathName:         db "RUTA HELADA@"
NotApplicableName:   db "N/D@" ; "オバケやしき" ("HAUNTED HOUSE") in Japanese
PalletTownName:      db "PUEBLO¯PALETA@"
ViridianCityName:    db "CIUDAD¯VERDE@"
PewterCityName:      db "CIUDAD¯PLATEADA@"
CeruleanCityName:    db "CIUDAD¯CELESTE@"
LavenderTownName:    db "PUEBLO¯LAVANDA@"
VermilionCityName:   db "CIUDAD¯CARMÍN@"
CeladonCityName:     db "CIUDAD¯AZULONA@"
SaffronCityName:     db "CIUDAD¯AZAFRÁN@"
FuchsiaCityName:     db "CIUDAD¯FUCSIA@"
CinnabarIslandName:  db "ISLA¯CANELA@"
IndigoPlateauName:   db "MESETA¯AÑIL@"
VictoryRoadName:     db "CALLE¯VICTORIA@"
MtMoonName:          db "MT. MOON@"
RockTunnelName:      db "TÚNEL ROCA@"
LavRadioTowerName:   db "TORRE¯LAVANDA@"
SilphCoName:         db "SILPH S.A.@"
SafariZoneName:      db "ZONA SAFARI@"
SeafoamIslandsName:  db "ISLAS¯ESPUMA@"
PokemonMansionName:  db "MANSIÓN¯#MON@"
CeruleanCaveName:    db "CUEVA¯CELESTE@"
Route1Name:          db "RUTA 1@"
Route2Name:          db "RUTA 2@"
Route3Name:          db "RUTA 3@"
Route4Name:          db "RUTA 4@"
Route5Name:          db "RUTA 5@"
Route6Name:          db "RUTA 6@"
Route7Name:          db "RUTA 7@"
Route8Name:          db "RUTA 8@"
Route9Name:          db "RUTA 9@"
Route10Name:         db "RUTA 10@"
Route11Name:         db "RUTA 11@"
Route12Name:         db "RUTA 12@"
Route13Name:         db "RUTA 13@"
Route14Name:         db "RUTA 14@"
Route15Name:         db "RUTA 15@"
Route16Name:         db "RUTA 16@"
Route17Name:         db "RUTA 17@"
Route18Name:         db "RUTA 18@"
Route19Name:         db "RUTA 19@"
Route20Name:         db "RUTA 20@"
Route21Name:         db "RUTA 21@"
Route22Name:         db "RUTA 22@"
Route23Name:         db "RUTA 23@"
Route24Name:         db "RUTA 24@"
Route25Name:         db "RUTA 25@"
Route26Name:         db "RUTA 26@"
Route27Name:         db "RUTA 27@"
Route28Name:         db "RUTA 28@"
Route29Name:         db "RUTA 29@"
Route30Name:         db "RUTA 30@"
Route31Name:         db "RUTA 31@"
Route32Name:         db "RUTA 32@"
Route33Name:         db "RUTA 33@"
Route34Name:         db "RUTA 34@"
Route35Name:         db "RUTA 35@"
Route36Name:         db "RUTA 36@"
Route37Name:         db "RUTA 37@"
Route38Name:         db "RUTA 38@"
Route39Name:         db "RUTA 39@"
Route40Name:         db "RUTA 40@"
Route41Name:         db "RUTA 41@"
Route42Name:         db "RUTA 42@"
Route43Name:         db "RUTA 43@"
Route44Name:         db "RUTA 44@"
Route45Name:         db "RUTA 45@"
Route46Name:         db "RUTA 46@"
DarkCaveName:        db "CUEVA¯OSCURA@"
IlexForestName:      db "ENCINAR@"
BurnedTowerName:     db "TORRE¯QUEMADA@"
FastShipName:        db "FERRY@"
ViridianForestName:  db "BOSQUE¯VERDE@"
DiglettsCaveName:    db "CUEVA¯DIGLETT@"
TohjoFallsName:      db "CATARATAS¯TOHJO@"
UndergroundName:     db "SUBTERRÁNEO@"
BattleTowerName:     db "TORRE¯BATALLA@"
SpecialMapName:      db "ESPECIAL@"
