_OakText6::
	text "¿Cómo has dicho"
	line "que te llamas?"
	prompt

_OakText7::
	text "<PLAYER>,"
	line "prepárate."

	para "Tu propia historia"
	line "#MON está a"
	cont "punto de empezar."

	para "Te divertirás y"
	line "te enfrentarás a"
	cont "duros desafíos."

	para "¡Te espera un"
	line "mundo de sueños y"

	para "aventuras con"
	line "#MON! ¡Vamos!"

	para "¡Nos vemos!"
	done

_ClockTimeMayBeWrongText::
	text "La hora del reloj"
	line "podría estar mal."

	para "Por favor, vuelve"
	line "a ponerlo en hora."
	prompt

_ClockSetWithControlPadText::
	text "Cambia la hora con"
	line "el Panel Control."

	para "Confirmar: Botón A"
	line "Cancelar:  Botón B"
	done

_ClockIsThisOKText::
	text "¿Estás de acuerdo?"
	done

_ClockHasResetText::
	text "Reloj puesto en"
	line "hora otra vez."
	done

_LinkTimeoutText::
	text "Ha pasado mucho"
	line "tiempo. Por favor,"
	cont "vuelve a probar."
	prompt

_LinkTradeCantBattleText::
	text "Si cambias ese"
	line "#MON, no"
	cont "podrás luchar."
	prompt

_LinkAbnormalMonText::
	text "¡El @"
	text_ram wStringBuffer1
	text_start
	line "de tu amigo/a no"
	cont "parece estar bien!"
	prompt

_LinkAskTradeForText::
	text "¿Cambiar"
	line "@"
	text_ram wd004
	text_start
	cont "por @"
	text_ram wStringBuffer1
	text "?"
	done

UnknownText_0x1c422a::
	text "Para entrar en una"
	line "batalla móvil,"

	para "debes tener un"
	line "equipo de tres"
	cont "#MON."

	para "¿De acuerdo?"
	done

UnknownText_0x1c4275::
	text "¿Necesitas más"
	line "información acerca"

	para "de las batallas"
	line "móviles?"
	done

UnknownText_0x1c4298::
	text "Para una batalla"
	line "móvil, elige tres"
	cont "#MON."

	para "Sólo se pueden"
	line "jugar diez minutos"

	para "por día por cada"
	line "jugador conectado."

	para "Si una batalla no"
	line "se termina dentro"

	para "del límite de"
	line "tiempo, el jugador"

	para "con menos #MON"
	line "debilitados, gana."

	para "Si hay empate, el"
	line "equipo que haya"

	para "perdido menos PS,"
	line "gana."
	done

UnknownText_0x1c439c::
	text "El tiempo restante"
	line "de hoy es de"
	cont "@"
	text_decimal wStringBuffer2, 1, 2
	text " min."

	para "¿Quieres luchar?"
	done

UnknownText_0x1c43dc::
	text "Sólo quedan @"
	text_decimal wStringBuffer2, 1, 2
	text_start
	line "min. hoy."

	para "¿Quieres una lucha"
	line "rápida?"
	done

UnknownText_0x1c4419::
	text "¡Sólo queda 1 min."
	line "hoy!"

	para "¿Quieres entrar en"
	line "una batalla?"
	done

UnknownText_0x1c445a::
	text "¡Apenas dispones"
	line "de un minuto!"

	para "Por favor, intén-"
	line "talo mañana."
	done

UnknownText_0x1c449c::
	text "¿Lo intentas otra"
	line "vez con los mismos"
	cont "parámetros?"
	done

_MobileBattleLessThanOneMinuteLeftText::
	text "¡Apenas dispones"
	line "de un minuto!"
	done

_MobileBattleNoTimeLeftForLinkingText::
	text "Hoy no queda tiem-"
	line "po de conexión."
	done

UnknownText_0x1c4508::
	text "Elige tres #MON"
	line "para luchar."
	done

UnknownText_0x1c4525::
	text "Hoy quedan todavía"
	line "@"
	text_decimal wStringBuffer2, 1, 2
	text " min."
	done

_WouldYouLikeToSaveTheGameText::
	text "¿Quieres guardar"
	line "el juego?"
	done

_SavingDontTurnOffThePowerText::
	text "GUARDANDO… NO"
	line "APAGAR LA CONSOLA."
	done

_SavedTheGameText::
	text "<PLAYER> guardó"
	line "el juego."
	done

_AlreadyASaveFileText::
	text "Ya existe un"
	line "archivo guardado."
	cont "¿Sobrescribirlo?"
	done

_AnotherSaveFileText::
	text "Hay otro archivo"
	line "guardado."
	cont "¿Sobrescribirlo?"
	done

_SaveFileCorruptedText::
	text "¡El archivo"
	line "guardado está"
	cont "corrupto!"
	prompt

_ChangeBoxSaveText::
	text "Cuando cambies una"
	line "CAJA de #MON,"

	para "los datos se"
	line "guardarán. ¿Vale?"
	done

_MoveMonWOMailSaveText::
	text "Cuando muevas un"
	line "#MON, los datos"

	para "se guardarán."
	line "¿Estás de acuerdo?"
	done

; unused
_WindowAreaExceededErrorText::
	text "Se excedió el área"
	line "de guardar de la"
	cont "ventana."
	done

_WindowPoppingErrorText::
	text "No hay ventanas"
	line "emergentes."
	done

; unused
_CorruptedEventErrorText::
	text "¡Evento corrupto!"
	prompt

_ObjectEventText::
	text "Evento de objeto."
	done

_BGEventText::
	text "Evento BG"
	done

_CoordinatesEventText::
	text "Coordenadas evento"
	done

_ReceivedItemText::
	text "<PLAYER> recibió"
	line "@"
	text_ram wStringBuffer4
	text "."
	done

_PutItemInPocketText::
	text "<PLAYER> puso"
	line "@"
	text_ram wStringBuffer1
	text " en"
	cont "@"
	text_ram wStringBuffer3
	text "."
	prompt

_PocketIsFullText::
	text "La @"
	text_ram wStringBuffer3
	text_start
	line "está llena…"
	prompt

_SeerSeeAllText::
	text "He visto todo."
	line "Lo sé todo…"

	para "¡Ciertamente,"
	line "conozco tus"
	cont "#MON!"
	done

_SeerCantTellAThingText::
	text "¿Cómoooo? ¡No"
	line "puedo decir nada!"

	para "¿Cómo es posible"
	line "que no sepa esto?"
	done

_SeerNameLocationText::
	text "Mmm… Veo que"
	line "conociste a"

	para "@"
	text_ram wSeerNickname
	text " aquí:"
	line "¡@"
	text_ram wSeerCaughtLocation
	text "!"
	prompt

_SeerTimeLevelText::
	text "¡Fue de"
	line "@"
	text_ram wSeerTimeOfDay
	text "!"

	para "¡Su nivel era @"
	text_ram wSeerCaughtLevelString
	text "!"

	para "¿Soy buena o no?"
	prompt

_SeerTradeText::
	text "Mmm… ¿@"
	text_ram wSeerNickname
	text_start
	line "te lo intercambió"
	cont "@"
	text_ram wSeerOTName
	text "?"

	para "¡@"
	text_ram wSeerOTName
	text " conoció"
	line "a @"
	text_ram wSeerNickname
	text " en"
	cont "@"
	text_ram wSeerCaughtLocation
	text "!"
	prompt

_SeerNoLocationText::
	text "¿Qué? ¡Increíble!"

	para "¡No entiendo el"
	line "porqué, pero eres"

	para "increíble!"
	line "Eres especial."

	para "No puedo decirte"
	line "dónde lo conocis-"
	cont "te, pero tenía"
	cont "el nivel @"
	text_ram wSeerCaughtLevelString
	text "."

	para "¿Soy buena o no?"
	prompt

_SeerEggText::
	text "¡Eh!"

	para "¡Eso es un HUEVO!"

	para "Todavía no puedes"
	line "decir que le"
	cont "conoces…"
	done

_SeerDoNothingText::
	text "¡Fufufu! ¡Veo que"
	line "no has hecho nada!"
	done

_SeerMoreCareText::
	text "A propósito…"

	para "Estaría bien que"
	line "trataras a tus"

	para "#MON con un"
	line "poco más de"
	cont "cuidado."
	done

_SeerMoreConfidentText::
	text "A propósito…"

	para "Parece que ha"
	line "crecido un poco."

	para "¡A @"
	text_ram wSeerNickname
	text_start
	line "se le ve más"
	cont "seguro!"
	done

_SeerMuchStrengthText::
	text "A propósito…"

	para "@"
	text_ram wSeerNickname
	text " ha"
	line "crecido. Ha ganado"
	cont "mucha fuerza."
	done

_SeerMightyText::
	text "A propósito…"

	para "¡Ciertamente"
	line "es enorme!"

	para "Este @"
	text_ram wSeerNickname
	text_start
	line "debe de haber lu-"
	cont "chado en numerosos"
	cont "combates #MON."

	para "Se le ve muy"
	line "seguro."
	done

_SeerImpressedText::
	text "A propósito…"

	para "Estoy impresionada"
	line "con tu dedicación."

	para "Hacía mucho desde"
	line "la última vez que"

	para "vi a un #MON"
	line "tan poderoso como"
	cont "este @"
	text_ram wSeerNickname
	text "."

	para "Estoy segura de"
	line "que ver luchar a"

	para "@"
	text_ram wSeerNickname
	text " debe de"
	line "ser emocionante."
	done

_CongratulationsYourPokemonText::
	text "¡Enhorabuena!"
	line "¡Tu @"
	text_ram wStringBuffer2
	text_end

	text_end ; unused

_EvolvedIntoText::
	text_start

	para "evolucionó en"
	line "@"
	text_ram wStringBuffer1
	text "!"
	done

_StoppedEvolvingText::
	text "¡@"
	text_ram wStringBuffer2
	text_start
	line "no evolucionó!"
	prompt

_EvolvingText::
	text "¡@"
	text_ram wStringBuffer2
	text " está"
	line "evolucionando!"
	done

_MartHowManyText::
	text "¿Cuántas unidades?"
	done

_MartFinalPriceText::
	text_decimal wItemQuantityChangeBuffer, 1, 2
	text " unidad/es"
	line "de @"
	text_ram wStringBuffer2
	text_start
	cont "serán @"
	text_decimal hMoneyTemp, 3, 6
	text "¥."
	done

_HerbShopLadyIntroText::
	text "Hola, joven."

	para "Vendo hierbas"
	line "medicinales."

	para "Son buenas, pero"
	line "un poco amargas."

	para "Quizá tus #MON"
	line "no las quieran."

	para "¡Je, je, je…!"
	done

_HerbalLadyHowManyText::
	text "¿Cuántas unidades?"
	done

_HerbalLadyFinalPriceText::
	text_decimal wItemQuantityChangeBuffer, 1, 2
	text " unidad/es"
	line "de @"
	text_ram wStringBuffer2
	text_start
	cont "serán @"
	text_decimal hMoneyTemp, 3, 6
	text "¥."
	done

_HerbalLadyThanksText::
	text "Gracias, joven."
	line "¡Je, je, je…!"
	done

_HerbalLadyPackFullText::
	text "¡Oh! Tu MOCHILA"
	line "está llena, joven."
	done

_HerbalLadyNoMoneyText::
	text "¡Je, je…! No"
	line "tienes ese dinero."
	done

_HerbalLadyComeAgainText::
	text "Vuelve otra vez."
	line "¡Je, je, je…!"
	done

_BargainShopIntroText::
	text "¡Oye! ¿Quieres ver"
	line "unas gangas?"

	para "Vendo objetos que"
	line "nadie posee, pero"

	para "sólo un objeto de"
	line "cada tipo."
	done

_BargainShopFinalPriceText::
	text_ram wStringBuffer2
	text_start
	line "cuesta @"
	text_decimal hMoneyTemp, 3, 6
	text "¥."
	cont "¿Lo quieres?"
	done

_BargainShopThanksText::
	text "Gracias."
	done

_BargainShopPackFullText::
	text "¡Oh! Tu MOCHILA"
	line "está a tope."
	done

_BargainShopSoldOutText::
	text "Eso ya lo has"
	line "comprado. No me"
	cont "quedan más."
	done

_BargainShopNoFundsText::
	text "¡Oh! No tienes"
	line "suficiente dinero."
	done

_BargainShopComeAgainText::
	text "Vuelve en otra"
	line "ocasión."
	done

_PharmacyIntroText::
	text "¿Qué quieres?"
	line "¿Alguna medicina?"
	done

_PharmacyHowManyText::
	text "¿Cuántas unidades?"
	done

_PharmacyFinalPriceText::
	text_decimal wItemQuantityChangeBuffer, 1, 2
	text " unidad/es"
	line "de @"
	text_ram wStringBuffer2
	text_start
	cont "serán @"
	text_decimal hMoneyTemp, 3, 6
	text "¥."
	done

_PharmacyThanksText::
	text "¡Muchas gracias!"
	done

_PharmacyPackFullText::
	text "No te queda sitio."
	done

_PharmacyNoMoneyText::
	text "¿Eh? No tienes"
	line "bastante dinero."
	done

_PharmacyComeAgainText::
	text "De acuerdo."
	line "Hasta luego."
	done

; unused
_NothingToSellText::
	text "No tienes nada"
	line "para vender."
	prompt

_MartSellHowManyText::
	text "¿Cuántas unidades?"
	done

_MartSellPriceText::
	text "Puedo pagarte"
	line "@"
	text_decimal hMoneyTemp, 3, 6
	text "¥."

	para "¿Te parece bien?"
	done

_MartWelcomeText::
	text "¡Hola!"
	line "¿Qué deseas?"
	done

_MartThanksText::
	text "Aquí tienes."
	line "¡Gracias!"
	done

_MartNoMoneyText::
	text "No tienes"
	line "suficiente dinero."
	done

_MartPackFullText::
	text "No puedes llevar"
	line "más objetos."
	done

_MartCantBuyText::
	text "Lo siento, no"
	line "puedo comprártelo."
	prompt

_MartComeAgainText::
	text "¡Vuelve cuando"
	line "quieras!"
	done

_MartAskMoreText::
	text "¿Puedo ayudarte"
	line "en algo más?"
	done

_MartBoughtText::
	text "Recibiste @"
	text_decimal hMoneyTemp, 3, 6
	text " ¥"
	line "por @"
	text_ram wStringBuffer2
	text "."
	done

_SlotsBetHowManyCoinsText::
	text "¿Cuántas"
	line "fichas?"
	done

_SlotsStartText::
	text "¡Adelante!"
	done

_SlotsNotEnoughCoinsText::
	text "No tienes"
	line "bastantes fichas."
	prompt

_SlotsRanOutOfCoinsText::
	text "¡Vaya…! No me"
	line "quedan fichas…"
	done

_SlotsPlayAgainText::
	text "¿Vuelves a"
	line "jugar?"
	done

_SlotsLinedUpText::
	text "¡Línea! ¡Has"
	line "ganado @"
	text_ram wStringBuffer2
	text " fichas!"
	done

_SlotsDarnText::
	text "¡Fallaste!"
	done

_MobileStadiumEntryText::
	text "Los datos para"
	line "utilizar en el"

	para "#MON STADIUM 2"
	line "de Nintendo 64"

	para "pueden leerse"
	line "aquí."

	para "¿Lees los datos?"
	done

_MobileStadiumSuccessText::
	text "Datos"
	line "transferidos."

	para "Esperamos que"
	line "disfrutes con los"

	para "combates en"
	line "#MON STADIUM 2"
	cont "de N64."

	para ""
	done

_MainMenuTimeUnknownText::
	text "Hora desconocida"
	done

; unused mobile
_DeleteSavedLoginPasswordText::
	text "¿Borras la CONTRA-"
	line "SEÑA de ACCESO?"
	done

; unused mobile
_DeletedTheLoginPasswordText::
	text "CONTRASEÑA de"
	line "ACCESO borrada."
	done

; unused mobile
_MobilePickThreeMonForBattle::
	text "Elige tres #MON"
	line "para luchar."
	prompt

; unused mobile
_MobileUseTheseThreeMonText::
	text_ram wMobileParticipant1Nickname
	text ","
	line "@"
	text_ram wMobileParticipant2Nickname
	text " y"
	cont "@"
	text_ram wMobileParticipant3Nickname
	text "."

	para "¿Usas estos tres?"
	done

; unused mobile
_MobileOnlyThreeMonMayEnterText::
	text "Sólo pueden entrar"
	line "tres #MON."
	prompt

; unused mobile
_MobileCardFolderIntro1Text::
	text "El TARJETERO"
	line "guarda tus"

	para "TARJETAS y las de"
	line "tus amigos/as."

	para "Una TARJETA con-"
	line "tiene información,"

	para "como el nombre de"
	line "la persona, su"

	para "número de teléfono"
	line "y su perfil."
	prompt

; unused mobile
_MobileCardFolderIntro2Text::
	text "Ésta es tu"
	line "TARJETA."

	para "Una vez hayas in-"
	line "troducido tu núme-"
	cont "ro de teléfono,"
	cont "podrás cambiar"

	para "TARJETAS con tus"
	line "amigos/as."
	prompt

; unused mobile
_MobileCardFolderIntro3Text::
	text "Si tienes la"
	line "TARJETA de un/a"

	para "amigo/a, podrás"
	line "usarla para llamar"

	para "a un teléfono"
	line "móvil desde el 2°"

	para "piso de los"
	line "CENTROS #MON."
	prompt

; unused mobile
_MobileCardFolderIntro4Text::
	text "Para guardar tu"
	line "colección de"

	para "TARJETAS de manera"
	line "segura, asigna una"

	para "CONTRASEÑA a tu"
	line "TARJETERO."
	prompt

; unused mobile
_MobileCardFolderAskDeleteText::
	text "Si se borra el"
	line "TARJETERO, todas"

	para "las TARJETAS y la"
	line "CONTRASEÑA también"
	cont "se borrarán."

	para "¡Cuidado! Un TAR-"
	line "JETERO borrado no"
	cont "puede recuperarse."

	para "¿Quieres borrar"
	line "tu TARJETERO?"
	done

; unused mobile
_MobileCardFolderDeleteAreYouSureText::
	text "¿Seguro que"
	line "quieres borrarlo?"
	done

; unused mobile
_MobileCardFolderDeletedText::
	text "El TARJETERO"
	line "ha sido borrado."
	prompt

; unused mobile
_MobileCardFolderAskOpenOldText::
	text "Hay un TARJETERO"
	line "antiguo de un"
	cont "viaje anterior."

	para "¿Quieres abrirlo?"
	done

; unused mobile
_MobileCardFolderAskDeleteOldText::
	text "¿Borras el TARJE-"
	line "TERO antiguo?"
	done

; unused mobile
_MobileCardFolderFinishRegisteringCardsText::
	text "¿Acabas de regis-"
	line "trar TARJETAS?"
	done

_PhoneWrongNumberText::
	text "¿Eh? Perdona,"
	line "n.° equivocado."
	done

_PhoneClickText::
	text "¡Clic!"
	done

_PhoneEllipseText::
	text "<……>"
	done

_PhoneOutOfAreaText::
	text "Ese número no es"
	line "de esta zona."
	done

_PhoneJustTalkToThemText::
	text "¡No es necesario"
	line "llamar, está muy"
	cont "cerca!"
	done

_PhoneThankYouText::
	text "¡Gracias!"
	done

; unused
UnknownText_0x1c55d6::
	text "  :"
	done

_PasswordAskResetText::
	text "Contraseña válida."
	line "Elige CONTINUAR"

	para "y cambia las"
	line "opciones."
	prompt

_PasswordWrongText::
	text "¡Contraseña"
	line "no válida!"
	prompt

_PasswordAskResetClockText::
	text "¿Cambias la hora?"
	done

_PasswordAskEnterText::
	text "Introduce la"
	line "contraseña."
	done

_ClearAllSaveDataText::
	text "¿Borras todos los"
	line "datos guardados?"
	done

_LearnedMoveText::
	text "¡@"
	text_ram wMonOrItemNameBuffer
	text_start
	line "ha aprendido"
	cont "@"
	text_ram wStringBuffer2
	text "!@"
	sound_dex_fanfare_50_79
	text_waitbutton
	text_end

	text_end ; unused

_MoveAskForgetText::
	text "¿Qué movimiento"
	next "debería olvidar?"
	done

_StopLearningMoveText::
	text "¿Deja de aprender"
	line "@"
	text_ram wStringBuffer2
	text "?"
	done

_DidNotLearnMoveText::
	text_ram wMonOrItemNameBuffer
	text_start
	line "no aprendió"
	cont "@"
	text_ram wStringBuffer2
	text "."
	prompt

_AskForgetMoveText::
	text_ram wMonOrItemNameBuffer
	text_start
	line "intenta aprender"
	cont "@"
	text_ram wStringBuffer2
	text "."

	para "Pero"
	line "@"
	text_ram wMonOrItemNameBuffer
	text_start

	para "no puede aprender"
	line "más de cuatro"
	cont "movimientos."

	para "¿Borras movimiento"
	line "anterior para"

	para "dejar sitio a"
	line "@"
	text_ram wStringBuffer2
	text "?"
	done

Text_MoveForgetCount::
	text "1, 2 y…@"
	text_pause
	text_end

	text_end ; unused

_MoveForgotText::
	text " ¡Puf!@"
	text_pause
	text_start

	para "@"
	text_ram wMonOrItemNameBuffer
	text_start
	line "olvidó"
	cont "@"
	text_ram wStringBuffer1
	text "."

	para "Y…"
	prompt

_MoveCantForgetHMText::
	text "Los movimientos MO"
	line "no se pueden"
	cont "olvidar ahora."
	prompt

_CardFlipPlayWithThreeCoinsText::
	text "¿Quieres apostar"
	line "tres?"
	done

_CardFlipNotEnoughCoinsText::
	text "Faltan fichas."
	prompt

_CardFlipChooseACardText::
	text "Elige una carta."
	done

_CardFlipPlaceYourBetText::
	text "Haz tu apuesta."
	done

_CardFlipPlayAgainText::
	text "¿Vuelves a"
	line "jugar?"
	done

_CardFlipShuffledText::
	text "Has barajado el"
	line "mazo."
	prompt

_CardFlipYeahText::
	text "¡Sí!"
	done

_CardFlipDarnText::
	text "¡Fallaste…!"
	done

_GearTodayText::
	text_today
	text_end

	text_end ; unused

_GearEllipseText::
	text "<……>"
	done

_GearOutOfServiceText::
	text "Estás fuera de"
	line "cobertura."
	prompt

_PokegearAskWhoCallText::
	text "¿A quién quieres"
	line "llamar?"
	done

_PokegearPressButtonText::
	text "Pulsa un botón"
	line "para salir."
	done

_PokegearAskDeleteText::
	text "¿Borras este"
	line "n.° de teléfono?"
	done

_BuenaAskWhichPrizeText::
	text "¿Qué premio"
	line "quieres?"
	done

_BuenaIsThatRightText::
	text "¿@"
	text_ram wStringBuffer1
	text "?"
	line "¿Vale?"
	done

_BuenaHereYouGoText::
	text "¡Vale!"
	prompt

_BuenaNotEnoughPointsText::
	text "No tienes puntos"
	line "suficientes."
	prompt

_BuenaNoRoomText::
	text "No tienes sitio"
	line "para esto."
	prompt

_BuenaComeAgainText::
	text "Oh. ¡Por favor,"
	line "vuelve en otra"
	cont "ocasión!"
	done

_BTExcuseMeText::
	text "¡Disculpa!"
	prompt

_ExcuseMeYoureNotReadyText::
	text "Discúlpame."
	line "No estás a punto."
	prompt

_BattleTowerReturnWhenReadyText::
	text "Por favor, vuelve"
	line "cuando estés a"
	cont "punto."
	done

_NeedAtLeastThreeMonText::
	text "Necesitas al menos"
	line "tres #MON."
	prompt

_EggDoesNotQualifyText::
	text "Lo siento."
	line "Un HUEVO no vale."
	prompt

_OnlyThreeMonMayBeEnteredText::
	text "Sólo puedes usar"
	line "tres #MON."
	prompt

_TheMonMustAllBeDifferentKindsText::
	text "Los @"
	text_ram wStringBuffer2
	text " #MON"
	line "deben ser diferen-"
	cont "tes."

	para ""
	done

_TheMonMustNotHoldTheSameItemsText::
	text "Los @"
	text_ram wStringBuffer2
	text " #MON no"
	line "pueden llevar los"
	cont "mismos objetos."

	para ""
	done

_YouCantTakeAnEggText::
	text "¡No puedes llevar"
	line "un HUEVO!"
	prompt

_BallDodgedText::
	text "¡Esquivó la BALL!"

	para "¡Imposible atrapar"
	line "a este #MON!"
	prompt

_BallMissedText::
	text "¡Has perdido al"
	line "#MON!"
	prompt

_BallBrokeFreeText::
	text "¡No! ¡El #MON"
	line "se ha escapado!"
	prompt

_BallAppearedCaughtText::
	text "¡Parecía que lo"
	line "habías atrapado!"
	prompt

_BallAlmostHadItText::
	text "¡Vaya!"
	line "¡Te faltó poco!"
	prompt

_BallSoCloseText::
	text "¡Caray! ¡Casi"
	line "lo consigues!"
	prompt

Text_BallCaught::
	text "¡Ya está!"
	line "¡@"
	text_ram wEnemyMonNick
	text_start
	cont "atrapado!@"
	sound_caught_mon
	text_end

	text_end ; unused

_WaitButtonText::
	text_waitbutton
	text_end

	text_end ; unused

_BallSentToPCText::
	text_ram wMonOrItemNameBuffer
	text_start
	line "fue enviado al PC"
	cont "de BILL."
	prompt

_NewDexDataText::
	text "Registrados en la"
	line "#DEX los datos"

	para "de @"
	text_ram wEnemyMonNick
	text "."
	line "@"
	sound_slot_machine_start
	text_waitbutton
	text_end

	text_end ; unused

_AskGiveNicknameText::
	text "¿Quieres darle"
	line "un mote a"
	cont "@"
	text_ram wStringBuffer1
	text "?"
	done

_ItemStatRoseText::
	text_ram wStringBuffer2
	text " de"
	line "@"
	text_ram wStringBuffer1
	text " creció."
	prompt

_ItemCantUseOnMonText::
	text "Eso no se puede"
	line "usar con este"
	cont "#MON."
	prompt

_RepelUsedEarlierIsStillInEffectText::
	text "Todavía funciona"
	line "el REPELENTE que"
	cont "usaste antes."
	prompt

_PlayedFluteText::
	text "Escuchaste la"
	line "# FLAUTA."

	para "¡Es una canción"
	line "muy pegadiza!"
	prompt

_FluteWakeUpText::
	text "Se han despertado"
	line "todos los #MON."
	prompt

Text_PlayedPokeFlute::
	text "<PLAYER> sintonizó"
	line "el canal FLAUTA"
	cont "#MON.@"
	text_waitbutton
	text_end

	text_end ; unused

_BlueCardBalanceText::
	text "Ahora tienes"
	line "@"
	text_decimal wBlueCardBalance, 1, 2
	text " punto/s."
	done

_CoinCaseCountText::
	text "Fichas:"
	line "@"
	text_decimal wCoins, 2, 4
	text_end

	text_end ; unused

_RaiseThePPOfWhichMoveText::
	text "¿A qué movimiento"
	line "quieres añadir PP?"
	done

_RestoreThePPOfWhichMoveText::
	text "¿Restaurar los PP"
	line "de qué movimiento?"
	done

_PPIsMaxedOutText::
	text "Los PP de"
	line "@"
	text_ram wStringBuffer2
	text_start
	cont "están al máximo."
	prompt

_PPsIncreasedText::
	text "Los PP de"
	line "@"
	text_ram wStringBuffer2
	text_start
	cont "han aumentado."
	prompt

_PPRestoredText::
	text "PP restaurados."
	prompt

_SentTrophyHomeText::
	text "¡Había un trofeo"
	line "dentro!@"
	sound_dex_fanfare_50_79
	text_start

	para "@"
	text_ram wPlayerName
	text " envió"
	line "el trofeo a casa."
	prompt

_ItemLooksBitterText::
	text "Parece amarga…"
	prompt

_ItemCantUseOnEggText::
	text "Eso no se puede"
	line "usar con un HUEVO."
	prompt

_ItemOakWarningText::
	text "OAK: ¡<PLAYER>!"
	line "¡Éste no es el"
	cont "momento de usarlo!"
	prompt

_ItemBelongsToSomeoneElseText::
	text "¡Eso pertenece"
	line "a alguien!"
	prompt

_ItemWontHaveEffectText::
	text "No tendrá"
	line "ningún efecto."
	prompt

_BallBlockedText::
	text "¡El entrenador"
	line "bloqueó la BALL!"
	prompt

_BallDontBeAThiefText::
	text "¡No robes #MON!"
	prompt

_NoCyclingText::
	text "Aquí no se permite"
	line "ir en bici."
	prompt

_ItemCantGetOnText::
	text "No puedes subir a"
	line "tu @"
	text_ram wStringBuffer1
	text "."
	prompt

_BallBoxFullText::
	text "La CAJA de #MON"
	line "está llena. Ahora"
	cont "no puedes usarla."
	prompt

_ItemUsedText::
	text "<PLAYER> usó"
	line "@"
	text_ram wStringBuffer2
	text "."
	done

_ItemGotOnText::
	text "<PLAYER> se montó@"
	text_low
	text "en la @"
	text_ram wStringBuffer2
	text "."
	prompt

_ItemGotOffText::
	text "<PLAYER> se bajó de@"
	text_low
	text "la @"
	text_ram wStringBuffer2
	text "."
	prompt

_KnowsMoveText::
	text_ram wStringBuffer1
	text_start
	line "ya conoce"
	cont "@"
	text_ram wStringBuffer2
	text "."
	prompt

_MoveKnowsOneText::
	text "Ese #MON"
	line "sólo conoce un"
	cont "movimiento."
	done

_AskDeleteMoveText::
	text "¿Le haces olvidar"
	line "@"
	text_ram wStringBuffer1
	text "?"
	done

_DeleterForgotMoveText::
	text "¡Hecho! Tu #MON"
	line "olvidó el movi-"
	cont "miento."
	done

_DeleterEggText::
	text "¡Los HUEVOS no"
	line "saben movimientos!"
	done

_DeleterNoComeAgainText::
	text "¿No? Vuelve"
	line "cuando quieras."
	done

_DeleterAskWhichMoveText::
	text "¿Qué movimiento"
	line "debería olvidar?"
	prompt

_DeleterIntroText::
	text "Soy el QUITA-"
	line "MOVIMIENTOS. Hago"

	para "olvidar movimien-"
	line "tos a los #MON."

	para "¿Quieres que"
	line "olviden algún"
	cont "movimiento?"
	done

_DeleterAskWhichMonText::
	text "¿Qué #MON?"
	prompt

_DSTIsThatOKText::
	text "."
	line "¿Correcto?"
	done

_TimeAskOkayText::
	text "."
	line "¿Correcto?"
	done

_TimesetAskDSTText::
	text "¿Quieres cambiar"
	line "el reloj al"
	cont "horario de verano?"
	done

_TimesetDSTText::
	text "He adelantado el"
	line "reloj una hora."
	prompt

_TimesetAskNotDSTText::
	text "¿Terminó el"
	line "horario de verano?"
	done

_TimesetNotDSTText::
	text "He atrasado el"
	line "reloj una hora."
	prompt

_TimesetAskAdjustDSTText::
	text "¿Quieres cambiar"
	line "el reloj al"
	cont "horario de verano?"
	done

_MomLostGearBookletText::
	text "He perdido las"
	line "instrucciones del"

	para "#GEAR."
	line "Vuelve dentro de"
	cont "un rato."
	prompt
