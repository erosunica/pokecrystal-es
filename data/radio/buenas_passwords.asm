BuenasPasswordTable:
; there are NUM_PASSWORD_CATEGORIES entries
	dw .JohtoStarters
	dw .Beverages
	dw .HealingItems
	dw .Balls
	dw .Pokemon1
	dw .Pokemon2
	dw .JohtoTowns
	dw .Types
	dw .Moves
	dw .XItems
	dw .RadioStations

               ; string type, points, option 1, option 2, option 3
.JohtoStarters: db BUENA_MON,     9, CYNDAQUIL, TOTODILE, CHIKORITA
.Beverages:     db BUENA_ITEM,   11, FRESH_WATER, SODA_POP, LEMONADE
.HealingItems:  db BUENA_ITEM,   11, POTION, ANTIDOTE, PARLYZ_HEAL
.Balls:         db BUENA_ITEM,   10, POKE_BALL, GREAT_BALL, ULTRA_BALL
.Pokemon1:      db BUENA_MON,     7, PIKACHU, RATTATA, GEODUDE
.Pokemon2:      db BUENA_MON,     8, HOOTHOOT, SPINARAK, DROWZEE
.JohtoTowns:    db BUENA_STRING, 16, "PUEBLO PRIMAVERA@", "CIUDAD CEREZO@", "PUEBLO AZALEA@"
.Types:         db BUENA_STRING,  7, "VOLADOR@", "BICHO@", "PLANTA@"
.Moves:         db BUENA_MOVE,   12, TACKLE, GROWL, MUD_SLAP
.XItems:        db BUENA_ITEM,   11, X_ATTACK, X_DEFEND, X_SPEED
.RadioStations: db BUENA_STRING, 14, "La Hora de OAK@", "Música #MON@", "Canal Suerte@"
