_NoPhotoText::
	text "¿No quieres una"
	line "fotografía? Vuelve"
	cont "cuando quieras."
	done

_EggPhotoText::
	text "¿Un HUEVO? Mi ta-"
	line "lento vale más"
	cont "que eso…"
	done

_NameRaterHelloText::
	text "¡Hola a todos!"
	line "Soy el INSPECTOR"

	para "de los motes."
	line "Evalúo los nombres"
	cont "de los #MON."

	para "¿Quieres evaluar"
	line "el nombre de"
	cont "algún #MON?"
	done

_NameRaterWhichMonText::
	text "¿Qué nombre de"
	line "#MON debería"
	cont "evaluar?"
	prompt

_NameRaterBetterNameText::
	text_ram wStringBuffer1
	text "…"
	line "Es un nombre"
	cont "bastante bueno."

	para "Pero, ¿qué te"
	line "parece mejorarlo"
	cont "un poco?"

	para "¿Quieres que le dé"
	line "otro nombre?"
	done

_NameRaterWhatNameText::
	text "Muy bien."
	line "¿Cómo podríamos"
	cont "llamarlo?"
	prompt

_NameRaterFinishedText::
	text "¡Ese nombre es"
	line "mejor que el"
	cont "anterior!"

	para "¡Bien hecho!"
	done

_NameRaterComeAgainText::
	text "Muy bien. Vuelve"
	line "cuando quieras."
	done

_NameRaterPerfectNameText::
	text "¿@"
	text_ram wStringBuffer1
	text "?"
	line "¡Qué buen nombre!"
	cont "Es perfecto."

	para "Trata a"
	line "@"
	text_ram wStringBuffer1
	text_start
	cont "con mucho cariño."
	done

_NameRaterEggText::
	text "¡Uauu…! Eso es"
	line "un HUEVO."
	done

_NameRaterSameNameText::
	text "¡Se parece al"
	line "anterior, pero"

	para "este nombre es"
	line "mucho mejor!"

	para "¡Bien hecho!"
	done

_NameRaterNamedText::
	text "Muy bien. Ahora"
	line "este #MON se"
	cont "llama @"
	text_ram wStringBuffer1
	text "."
	prompt

Text_Gained::
	text "¡@"
	text_ram wStringBuffer1
	text " ganó@"
	text_end

_BoostedExpPointsText::
	text_start
	line "un total de"
	cont "@"
	text_decimal wStringBuffer2, 2, 5
	text " Puntos EXP.!"
	prompt

_ExpPointsText::
	text_start
	line "@"
	text_decimal wStringBuffer2, 2, 5
	text " Puntos EXP.!"
	prompt

Text_GoMon::
	text "¡Adelante,"
	line "@"
	text_end

Text_DoItMon::
	text "¡Hazlo,"
	line "@"
	text_end

Text_GoForItMon::
	text "¡Adelante,"
	line "@"
	text_end

Text_YourFoesWeakGetmMon::
	text "¡Tu enemigo está"
	line "débil! ¡A por él,"
	cont "@"
	text_end

_BattleMonNicknameText::
	text_ram wBattleMonNick
	text "!"
	done

Text_BattleMonNickComma::
	text "¡@"
	text_ram wBattleMonNick
	text ",@"
	text_end

_ThatsEnoughComeBackText::
	text " bien"
	line "hecho! ¡Vuelve!@"
	text_end

_OKComeBackText::
	text " bien!"
	line "¡Vuelve!@"
	text_end

_GoodComeBackText::
	text " bien!"
	line "¡Vuelve!@"
	text_end

_ComeBackText::
	text_start
	line "vuelve!"
	done

_BootedTMText::
	text "Elegida una MT."
	prompt

_BootedHMText::
	text "Elegida una MO."
	prompt

_ContainedMoveText::
	text "Ésta contiene"
	line "@"
	text_ram wStringBuffer2
	text "."

	para "¿Enseñas"
	line "@"
	text_ram wStringBuffer2
	text_start
	cont "a un #MON?"
	done

_TMHMNotCompatibleText::
	text_ram wStringBuffer2
	text_start
	line "no es compatible"
	cont "con @"
	text_ram wStringBuffer1
	text "."

	para "No puede aprender"
	line "@"
	text_ram wStringBuffer2
	text "."
	prompt

_NoRoomTMHMText::
	text "No tienes sitio"
	line "para más"
	cont "@"
	text_ram wStringBuffer1
	text "."
	prompt

_ReceivedTMHMText::
	text "¡Recibiste"
	line "@"
	text_ram wStringBuffer1
	text "!"
	prompt

_MysteryGiftCanceledText::
	text "La conexión ha"
	line "sido cancelada."
	prompt

_MysteryGiftCommErrorText::
	text "Error de"
	line "comunicación."
	prompt

_RetrieveMysteryGiftText::
	text "Debes recoger el"
	line "REGALO en el"
	cont "CENTRO #MON."
	prompt

_YourFriendIsNotReadyText::
	text "Tu amigo/a no está"
	line "preparado/a."
	prompt

_MysteryGiftFiveADayText::
	text "Lo siento. Sólo"
	line "5 REGALOS al día."
	prompt

_MysteryGiftOneADayText::
	text "Lo siento. Sólo un"
	line "REGALO al día por"
	cont "persona."
	prompt

_MysteryGiftSentText::
	text_ram wMysteryGiftPartnerName
	text_start
	line "envió"
	cont "@"
	text_ram wStringBuffer1
	text "."
	prompt

_MysteryGiftSentHomeText::
	text_ram wMysteryGiftPartnerName
	text_start
	line "envió"

	para "@"
	text_ram wStringBuffer1
	text_start
	line "a casa de"
	cont "@"
	text_ram wMysteryGiftPlayerName
	text "."
	prompt

_MysteryGiftReceivedCardText::
	text "Recibida TARJETA"
	line "de @"
	text_ram wc850
	text "."
	prompt

_MysteryGiftListedCardText::
	text "La tarjeta de"
	line "@"
	text_ram wc850
	text " fue"
	cont "la n.° @"
	text_decimal wDeciramBuffer, 1, 2
	text "."
	prompt

_MysteryGiftNotRegisteredCardText::
	text "La TARJETA no fue"
	line "registrada."
	prompt

_MysteryGiftLinkCancelledText::
	text "La conexión ha"
	line "sido cancelada."
	prompt

_MysteryGiftLinkCommErrorText::
	text "Error de"
	line "comunicación."
	prompt

_BadgeRequiredText::
	text "Necesitas una"
	line "nueva MEDALLA."
	prompt

_CantUseItemText::
	text "Aquí no puedes"
	line "usar eso."
	prompt

_UseCutText::
	text "¡@"
	text_ram wStringBuffer2
	text_start
	line "usó CORTE!"
	prompt

_CutNothingText::
	text "Aquí no hay nada"
	line "que CORTAR."
	prompt

_BlindingFlashText::
	text "¡Un DESTELLO"
	line "ilumina la zona!@"
	text_waitbutton
	text_end

	text_end ; unused

_UsedSurfText::
	text "¡@"
	text_ram wStringBuffer2
	text_start
	line "usó SURF!"
	done

_CantSurfText::
	text "Aquí no puedes"
	line "hacer SURF."
	prompt

_AlreadySurfingText::
	text "Ya estás"
	line "haciendo SURF."
	prompt

_AskSurfText::
	text "El agua está en"
	line "calma. ¿Quieres"
	cont "hacer SURF?"
	done

_UseWaterfallText::
	text "¡@"
	text_ram wStringBuffer2
	text_start
	line "usó CASCADA!"
	done

_HugeWaterfallText::
	text "¡Uauu! Es una"
	line "enorme cascada."
	done

_AskWaterfallText::
	text "¿Quieres usar"
	line "CASCADA?"
	done

_UseDigText::
	text "¡@"
	text_ram wStringBuffer2
	text_start
	line "usó EXCAVAR!"
	done

_UseEscapeRopeText::
	text "<PLAYER>"
	line "usó CUERDA HUIDA."
	done

_CantUseDigText::
	text "Aquí no puedes"
	line "usar eso."
	done

_TeleportReturnText::
	text "Vuelta al último"
	line "CENTRO #MON."
	done

_CantUseTeleportText::
	text "Aquí no puedes"
	line "usar eso."
	prompt

_AlreadyUsingStrengthText::
	text "Ya hay un #MON"
	line "usando FUERZA."
	prompt

_UseStrengthText::
	text "¡@"
	text_ram wStringBuffer2
	text_start
	line "usó FUERZA!"
	done

_MoveBoulderText::
	text_ram wStringBuffer1
	text_start
	line "puede mover las"
	cont "piedras."
	prompt

_AskStrengthText::
	text "Un #MON podría"
	line "moverla."

	para "¿Quieres usar"
	line "FUERZA?"
	done

_BouldersMoveText::
	text "¡Ahora se pueden"
	line "mover las piedras!"
	done

_BouldersMayMoveText::
	text "Un #MON podría"
	line "moverla."
	done

_UseWhirlpoolText::
	text "¡@"
	text_ram wStringBuffer2
	text_start
	line "usó TORBELLINO!"
	prompt

_MayPassWhirlpoolText::
	text "¡Un horrible"
	line "torbellino!"

	para "Un #MON"
	line "podría cruzarlo."
	done

_AskWhirlpoolText::
	text "Hay un torbellino"
	line "en el camino."

	para "¿Quieres usar"
	line "TORBELLINO?"
	done

_UseHeadbuttText::
	text "¡@"
	text_ram wStringBuffer2
	text_start
	line "usó GOLPE CABEZA!"
	prompt

_HeadbuttNothingText::
	text "No. Nada…"
	done

_AskHeadbuttText::
	text "En este árbol"
	line "podría haber un"
	cont "#MON."

	para "¿Quieres usar"
	line "GOLPE CABEZA?"
	done

_UseRockSmashText::
	text "¡@"
	text_ram wStringBuffer2
	text_start
	line "usó GOLPE ROCA!"
	prompt

_MaySmashText::
	text "Un #MON"
	line "podría romperla."
	done

_AskRockSmashText::
	text "Esta roca se puede"
	line "romper."

	para "¿Quieres usar el"
	line "GOLPE ROCA?"
	done

_RodBiteText::
	text "¡Oh!"
	line "¡Han picado!"
	prompt

_RodNothingText::
	text "¡No pican!"
	prompt

; unused
_UnusedNothingHereText::
	text "Parece que aquí no"
	line "hay nada."
	prompt

_CantGetOffBikeText::
	text "¡Aquí no puedes"
	line "bajarte!"
	done

_GotOnBikeText::
	text "<PLAYER>"
	line "se montó en la"
	cont "@"
	text_ram wStringBuffer2
	text "."
	done

_GotOffBikeText::
	text "<PLAYER>"
	line "se bajó de la"
	cont "@"
	text_ram wStringBuffer2
	text "."
	done

_AskCutText::
	text "¡Este árbol se"
	line "puede CORTAR!"

	para "¿Utilizas CORTE?"
	done

_CanCutText::
	text "¡Este árbol se"
	line "puede CORTAR!"
	done

_FoundItemText::
	text "¡<PLAYER> encontró"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

_CantCarryItemText::
	text "¡Pero <PLAYER> no"
	line "puede llevar más"
	cont "objetos!"
	done

_WhitedOutText::
	text "¡A <PLAYER> no le"
	line "quedan #MON!"

	para "¡<PLAYER> perdió"
	line "el conocimiento!"
	done

_ItemfinderItemNearbyText::
	text "El BUSCAOBJETOS"
	line "indica que hay un"
	cont "objeto cerca."
	prompt

_ItemfinderNopeText::
	text "El BUSCAOBJETOS"
	line "no responde."
	prompt

_PoisonFaintText::
	text "¡@"
	text_ram wStringBuffer3
	text_start
	line "debilitado!"
	prompt

_PoisonWhiteoutText::
	text "¡A <PLAYER> no le"
	line "quedan #MON!"

	para "¡<PLAYER> perdió"
	line "el conocimiento!"
	prompt

_UseSweetScentText::
	text "¡@"
	text_ram wStringBuffer3
	text_start
	line "usó DULCE AROMA!"
	done

_SweetScentNothingText::
	text "Parece que aquí no"
	line "hay nada…"
	done

_SquirtbottleNothingText::
	text "<PLAYER> lo regó."

	para "Pero no pasó nada…"
	done

_UseSacredAshText::
	text "¡Todos los #MON"
	line "de <PLAYER> fueron"
	cont "curados!"
	done

_AnEggCantHoldAnItemText::
	text "Un HUEVO no puede"
	line "llevar un objeto."
	prompt

_PackNoItemText::
	text "No hay objetos."
	done

_AskThrowAwayText::
	text "¿Cuántos quieres"
	line "tirar?"
	done

_AskQuantityThrowAwayText::
	text "¿Tirar @"
	text_decimal wItemQuantityChangeBuffer, 1, 2
	text_start
	line "unidad/es de"
	cont "@"
	text_ram wStringBuffer2
	text "?"
	done

_ThrewAwayText::
	text "Tiró"
	line "@"
	text_ram wStringBuffer2
	text "."
	prompt

_OakThisIsntTheTimeText::
	text "OAK: ¡<PLAYER>!"
	line "¡Éste no es el"
	cont "momento de usarlo!"
	prompt

_YouDontHaveAMonText::
	text "¡No tienes"
	line "ningún #MON!"
	prompt

_RegisteredItemText::
	text_ram wStringBuffer2
	text_start
	line "asig. a SELECT."
	prompt

_CantRegisterText::
	text "Ese objeto no se"
	line "puede registrar."
	prompt

_AskItemMoveText::
	text "¿Adónde quieres"
	line "moverlo?"
	done

_PackEmptyText::
	text_start
	done

_YouCantUseItInABattleText::
	text "No puedes usarlo"
	line "en un combate."
	prompt

_AreYouABoyOrAreYouAGirlText::
	text "¿Eres un chico?"
	line "¿O eres una chica?"
	done

Text_BattleEffectActivate::
	text "¡@"
	text_ram wStringBuffer2
	text " de"
	line "<USER>@"
	text_end

_BattleStatWentWayUpText::
	text_pause
	text "<SCROLL>subió mucho!"
	prompt

_BattleStatWentUpText::
	text_start
	cont "subió!"
	prompt

Text_BattleFoeEffectActivate::
	text "¡@"
	text_ram wStringBuffer2
	text " de"
	line "<TARGET>@"
	text_end

_BattleStatSharplyFellText::
	text_pause
	text "<SCROLL>bajó mucho!"
	prompt

_BattleStatFellText::
	text_start
	cont "bajó!"
	prompt

Text_BattleUser::
	text "<USER>@"
	text_end

_BattleMadeWhirlwindText::
	text_start
	line "hizo un remolino."
	prompt

_BattleTookSunlightText::
	text_start
	line "tomó luz solar."
	prompt

_BattleLoweredHeadText::
	text_start
	line "bajó su cabeza."
	prompt

_BattleGlowingText::
	text_start
	line "está brillando."
	prompt

_BattleFlewText::
	text_start
	line "voló muy alto."
	prompt

_BattleDugText::
	text_start
	line "excavó un agujero."
	prompt

_ActorNameText::
	text "¡<USER>@"
	text_end

_UsedMove1Text::
	text_start
	line "usó @"
	text_end

_UsedMove2Text::
	text_start
	line "usó @"
	text_end

_UsedInsteadText::
	text "otro ataque,"
	cont "@"
	text_end

_MoveNameText::
	text_ram wStringBuffer2
	text_end

	text_end ; unused

_EndUsedMove1Text::
	text "!"
	done

_EndUsedMove2Text::
	text "!"
	done

_EndUsedMove3Text::
	text "!"
	done

_EndUsedMove4Text::
	text "!"
	done

_EndUsedMove5Text::
	text "!"
	done

Text_BreedHuh::
	text "¿Qué?"

	para "@"
	text_end

_BreedClearboxText::
	text_start
	done

_BreedEggHatchText::
	text "¡@"
	text_ram wStringBuffer1
	text_start
	line "salió del"
	cont "HUEVO!@"
	sound_caught_mon
	text_waitbutton
	text_end

	text_end ; unused

_BreedAskNicknameText::
	text "¿Quieres darle"
	line "un mote a"
	cont "@"
	text_ram wStringBuffer1
	text "?"
	done

_LeftWithDayCareLadyText::
	text "Es el @"
	text_ram wBreedMon2Nick
	text_start
	line "que dejé con la"

	para "ENCARGADA de la"
	line "GUARDERÍA."
	done

_LeftWithDayCareManText::
	text "Es el @"
	text_ram wBreedMon1
	text_start
	line "que dejé con el"

	para "ENCARGADO de la"
	line "GUARDERÍA."
	done

_BreedBrimmingWithEnergyText::
	text "Está rebosante"
	line "de energía."
	prompt

_BreedNoInterestText::
	text "No está interesado"
	line "en @"
	text_ram wStringBuffer1
	text "."
	prompt

_BreedAppearsToCareForText::
	text "Está interesado"
	line "en @"
	text_ram wStringBuffer1
	text "."
	prompt

_BreedFriendlyText::
	text "Es agradable con"
	line "@"
	text_ram wStringBuffer1
	text "."
	prompt

_BreedShowsInterestText::
	text "Muestra interés"
	line "por @"
	text_ram wStringBuffer1
	text "."
	prompt

_EmptyMailboxText::
	text "Aquí no hay"
	line "ninguna CARTA."
	prompt

_MailClearedPutAwayText::
	text "La CARTA fue"
	line "enviada."
	prompt

_MailPackFullText::
	text "¡MOCHILA llena!"
	prompt

_MailMessageLostText::
	text "Perderás el"
	line "mensaje de la"
	cont "CARTA. ¿Vale?"
	done

_MailAlreadyHoldingItemText::
	text "Ya lleva un"
	line "objeto."
	prompt

_MailEggText::
	text "Un HUEVO no puede"
	line "llevar CARTAS."
	prompt

_MailMovedFromBoxText::
	text "La CARTA fue"
	line "sacada del BUZÓN."
	prompt

; unused
_YesPromptText::
	text "Sí"
	prompt

; unused
_NoPromptText::
	text "No"
	prompt

; unused
_AnimationTypeText::
	text_decimal wcf64, 1, 3
	text " @"
	text_ram wStringBuffer1
	text_start
	line "Tipo animación @"
	text_ram wStringBuffer2
	text_end

	text_end ; unused

; unused
_MonNumberText::
	text "¿N.° de #MON?"
	done

_WasSentToBillsPCText::
	text_ram wStringBuffer1
	text_start
	line "fue enviado al"
	cont "PC de BILL."
	prompt

_PCGottaHavePokemonText::
	text "¡Necesitas #MON"
	line "a los que llamar!"
	prompt

_PCWhatText::
	text "¿Qué quieres"
	line "hacer?"
	done

_PCMonHoldingMailText::
	text "Hay un #MON que"
	line "lleva una CARTA."

	para "Por favor, quita"
	line "la CARTA."
	prompt

_PCNoSingleMonText::
	text "¡No tienes ni un"
	line "solo #MON!"
	prompt

_PCCantDepositLastMonText::
	text "¡No puedes dejar"
	line "tu último #MON!"
	prompt

_PCCantTakeText::
	text "No puedes recoger"
	line "más #MON."
	prompt

_ContestCaughtMonText::
	text "¡@"
	text_ram wStringBuffer1
	text_start
	line "atrapado!"
	prompt

_ContestAskSwitchText::
	text "¿Cambiar #MON?"
	done

_ContestAlreadyCaughtText::
	text "Ya tienes un"
	line "@"
	text_ram wStringBuffer1
	text "."
	prompt

_ContestJudging_FirstPlaceText::
	text "El ganador de este"
	line "Concurso de"

	para "Captura de Bichos"
	line "es@"
	text_pause
	text "…"

	para "¡@"
	text_ram wBugContestWinnerName
	text ","
	line "que atrapó un"
	cont "@"
	text_ram wStringBuffer1
	text "!@"
	text_end

_ContestJudging_FirstPlaceScoreText::
	text_start

	para "¡La puntuación"
	line "ganadora fue de"
	cont "@"
	text_decimal wBugContestFirstPlaceScore, 2, 3
	text " puntos!"
	prompt

_ContestJudging_SecondPlaceText::
	text "¡El segundo lugar"
	line "fue para"

	para "@"
	text_ram wBugContestWinnerName
	text ","
	line "que atrapó un"
	cont "@"
	text_ram wStringBuffer1
	text "!@"
	text_end

_ContestJudging_SecondPlaceScoreText::
	text_start

	para "¡La puntuación"
	line "fue de"
	cont "@"
	text_decimal wBugContestSecondPlaceScore, 2, 3
	text " puntos!"
	prompt

_ContestJudging_ThirdPlaceText::
	text "¡El tercer lugar"
	line "fue para"

	para "@"
	text_ram wBugContestWinnerName
	text ","
	line "que atrapó un"
	cont "@"
	text_ram wStringBuffer1
	text "!@"
	text_end

_ContestJudging_ThirdPlaceScoreText::
	text_start

	para "¡La puntuación"
	line "fue de"
	cont "@"
	text_decimal wBugContestThirdPlaceScore, 2, 3
	text " puntos!"
	prompt

_MagikarpGuruMeasureText::
	text "Déjame que mida a"
	line "ese MAGIKARP."

	para "¡Mmmmm…! Mide"
	line "@"
	text_ram wStringBuffer1
	text " cm."
	prompt

_KarpGuruRecordText::
	text "RÉCORD ACTUAL"

	para "@"
	text_ram wStringBuffer1
	text " cm,"
	line "fue atrapado por"
	cont "@"
	text_ram wMagikarpRecordHoldersName
	text_linkwaitbutton
	text_end

	text_end ; unused

_LuckyNumberMatchPartyText::
	text "¡Enhorabuena!"

	para "Coincide con el"
	line "número ID de"

	para "@"
	text_ram wStringBuffer1
	text_start
	line "de tu equipo."
	prompt

_LuckyNumberMatchPCText::
	text "¡Enhorabuena!"

	para "Coincide con el"
	line "número ID de"

	para "@"
	text_ram wStringBuffer1
	text_start
	line "de tu CAJA del PC."
	prompt

_CaughtAskNicknameText::
	text "¿Le das un mote al"
	line "@"
	text_ram wStringBuffer1
	text " que"
	cont "has recibido?"
	done

_PokecenterPCCantUseText::
	text "¡Bzzzz! ¡Para usar"
	line "esto necesitas un"
	cont "#MON!"
	prompt

_PlayersPCTurnOnText::
	text "<PLAYER> encendió"
	line "el PC."
	prompt

_PlayersPCAskWhatDoText::
	text "¿Qué quieres"
	line "hacer?"
	done

_PlayersPCHowManyWithdrawText::
	text "¿Cuántos quieres"
	line "sacar?"
	done

_PlayersPCWithdrewItemsText::
	text "Sacaste @"
	text_decimal wItemQuantityChangeBuffer, 1, 2
	text_start
	line "unidad/es de"
	cont "@"
	text_ram wStringBuffer2
	text "."
	prompt

_PlayersPCNoRoomWithdrawText::
	text "No hay sitio para"
	line "más objetos."
	prompt

_PlayersPCNoItemsText::
	text "¡No tienes"
	line "objetos!"
	prompt

_PlayersPCHowManyDepositText::
	text "¿Cuántos quieres"
	line "dejar?"
	done

_PlayersPCDepositItemsText::
	text "Dejaste @"
	text_decimal wItemQuantityChangeBuffer, 1, 2
	text_start
	line "unidad/es de"
	cont "@"
	text_ram wStringBuffer2
	text "."
	prompt

_PlayersPCNoRoomDepositText::
	text "No hay sitio donde"
	line "guardar objetos."
	prompt

_PokecenterPCTurnOnText::
	text "<PLAYER> encendió"
	line "el PC."
	prompt

_PokecenterPCWhoseText::
	text "¿Acceder a qué PC?"
	done

_PokecenterBillsPCText::
	text "Accedes al PC de"
	line "BILL."

	para "Accedes al Sistema"
	line "de Almacenamiento"
	cont "de los #MON."
	prompt

_PokecenterPlayersPCText::
	text "Accedes a tu PC."

	para "Accedes al Sistema"
	line "de Almacenamiento"
	cont "de Objetos."
	prompt

_PokecenterOaksPCText::
	text "Accedes al PC del"
	line "PROF. OAK."

	para "Accedes al Sistema"
	line "de Evaluación de"
	cont "la #DEX."
	prompt

_PokecenterPCOaksClosedText::
	text "Conexión cerrada."
	done

_OakPCText1::
	text "¿Quieres evaluar"
	line "tu #DEX?"
	done

_OakPCText2::
	text "Nivel actual de"
	line "la #DEX:"
	prompt

_OakPCText3::
	text "Viste: @"
	text_ram wStringBuffer3
	text " #MON"
	line "Tuyos: @"
	text_ram wStringBuffer4
	text " #MON"

	para "Evaluación del"
	line "PROF. OAK:"
	done

_OakRating01::
	text "¡Busca #MON en"
	line "zonas de hierba!"
	done

_OakRating02::
	text "Bien. Ya veo que"
	line "sabes cómo usar"
	cont "las # BALL."
	done

_OakRating03::
	text "Lo estás haciendo"
	line "bien, pero tienes"

	para "un largo camino"
	line "por recorrer."
	done

_OakRating04::
	text "Debes completar la"
	line "#DEX. Atrapa"

	para "diferentes tipos"
	line "de #MON."
	done

_OakRating05::
	text "Ya veo que te"
	line "estás esforzando."

	para "Tu #DEX empieza"
	line "a llenarse."
	done

_OakRating06::
	text "Para evolucionar,"
	line "algunos #MON"

	para "crecen y otros"
	line "usan las PIEDRAS."
	done

_OakRating07::
	text "¿Tienes una CAÑA?"
	line "Puedes atrapar"

	para "algunos #MON"
	line "pescando."
	done

_OakRating08::
	text "¡Excelente!"
	line "¡Parece que te"

	para "gusta coleccionar"
	line "cosas!"
	done

_OakRating09::
	text "Algunos #MON"
	line "sólo aparecen a"

	para "ciertas horas del"
	line "día."
	done

_OakRating10::
	text "Tu #DEX se"
	line "está llenando."
	cont "¡Sigue así!"
	done

_OakRating11::
	text "¡Impresionante!"
	line "No sólo atrapas"

	para "#MON, también"
	line "evolucionan."
	done

_OakRating12::
	text "¿Conoces a CÉSAR?"
	line "Sus # BALL"

	para "personalizadas son"
	line "de gran ayuda."
	done

_OakRating13::
	text "¡Uauu! Tienes más"
	line "#MON que en"

	para "la #DEX"
	line "anterior."
	done

_OakRating14::
	text "¿Estás cambiando"
	line "tus #MON?"

	para "¡Es duro hacerlo"
	line "en solitario!"
	done

_OakRating15::
	text "¡Uau! ¡Tienes 200!"
	line "¡Tu #DEX es"
	cont "estupenda!"
	done

_OakRating16::
	text "¡Tienes tantos"
	line "#MON! ¡Me"

	para "has ayudado mucho"
	line "en mis estudios!"
	done

_OakRating17::
	text "¡Genial! ¡Podrías"
	line "convertirte en un"

	para "profesor #MON"
	line "ahora mismo!"
	done

_OakRating18::
	text "¡Tu #DEX es"
	line "increíble!"

	para "¡Eres muy"
	line "profesional!"
	done

_OakRating19::
	text "¡Uau! ¡Una #DEX"
	line "perfecta! ¡Mi"

	para "sueño cumplido!"
	line "¡Enhorabuena!"
	done

_OakPCText4::
	text "Cerrado enlace al"
	line "PC del PROF. OAK."
	done

; unused
_TrainerRankingExplanationText::
	text "¡Ranking triple de"
	line "entrenadores!"

	para "¡El fichero que"
	line "acabas de enviar"

	para "generará las"
	line "posiciones!"
	prompt

; unused
_TrainerRankingNoDataText::
	text "No hay datos de"
	line "posiciones."

	para "Conectando para"
	line "obtener datos."
	prompt

_DummyGameYeahText::
	text ", ¡sí!"
	done

_DummyGameDarnText::
	text "Maldición…"
	done

_StartMenuContestEndText::
	text "¿Salir del"
	line "Concurso?"
	done

_ItemsTossOutHowManyText::
	text "¿Cuántas unidades"
	line "de @"
	text_ram wStringBuffer2
	text_start
	cont "quieres tirar?"
	done

_ItemsThrowAwayText::
	text "¿Tirar @"
	text_decimal wItemQuantityChangeBuffer, 1, 2
	text_start
	line "unidad/es de"
	cont "@"
	text_ram wStringBuffer2
	text "?"
	done

_ItemsDiscardedText::
	text "Tiraste"
	line "@"
	text_ram wStringBuffer1
	text "."
	prompt

_ItemsTooImportantText::
	text "¡Es demasiado"
	line "importante para"
	cont "tirarlo!"
	prompt

_ItemsOakWarningText::
	text "OAK: ¡<PLAYER>!"
	line "¡Éste no es el"
	cont "momento de usarlo!"
	done

_PokemonSwapItemText::
	text "Quitaste"
	line "@"
	text_ram wStringBuffer1
	text_start
	cont "de @"
	text_ram wMonOrItemNameBuffer
	text_start

	para "y le diste"
	line "@"
	text_ram wStringBuffer2
	text "."
	prompt

_PokemonHoldItemText::
	text "Equipar a"
	line "@"
	text_ram wMonOrItemNameBuffer
	text_start
	cont "con @"
	text_ram wStringBuffer2
	text "."
	prompt

_PokemonRemoveMailText::
	text "Primero quita"
	line "la CARTA."
	prompt

_PokemonNotHoldingText::
	text_ram wMonOrItemNameBuffer
	text_start
	line "no lleva nada."
	prompt

_ItemStorageFullText::
	text "Caja de objetos"
	line "llena."
	prompt

_PokemonTookItemText::
	text "Quitaste"
	line "@"
	text_ram wStringBuffer1
	text_start
	cont "de @"
	text_ram wMonOrItemNameBuffer
	text "."
	prompt

_PokemonAskSwapItemText::
	text_ram wMonOrItemNameBuffer
	text_start
	line "ya va equipado con"

	para "@"
	text_ram wStringBuffer1
	text "."
	line "¿Cambiar objetos?"
	done

_ItemCantHeldText::
	text "Este objeto no"
	line "puede ser llevado."
	prompt

_MailLoseMessageText::
	text "¿O prefieres"
	line "borrar el mensaje?"
	done

_MailDetachedText::
	text "Quitada CARTA de"
	line "@"
	text_ram wStringBuffer1
	text "."
	prompt

_MailNoSpaceText::
	text "No hay bastante"
	line "espacio para"
	cont "quitar la CARTA."
	prompt

_MailAskSendToPCText::
	text "¿Enviar la"
	line "CARTA a tu PC?"
	done

_MailboxFullText::
	text "El BUZÓN de tu"
	line "PC está lleno."
	prompt

_MailSentToPCText::
	text "La CARTA fue"
	line "enviada a tu PC."
	prompt

_PokemonNotEnoughHPText::
	text "¡PS insuficientes!"
	prompt

_MayRegisterItemText::
	text "Puedes asignar un"
	line "objeto de tu"

	para "MOCHILA al botón"
	line "SELECT."
	done

_OakText1::
	text "¡Hola! ¡Perdona"
	line "por la espera!"

	para "¡Estás en el"
	line "mundo de los"
	cont "#MON!"

	para "Me llamo OAK."

	para "Pero me llaman"
	line "PROFESOR #MON."
	prompt

_OakText2::
	text "Este mundo está"
	line "habitado por unas"

	para "criaturas llamadas"
	line "#MON.@"
	text_end

_OakText3::
	text_waitbutton
	text_end

	text_end ; unused

_OakText4::
	text "La gente y los"
	line "#MON conviven"

	para "ayudándose unos"
	line "a otros."

	para "Algunos juegan con"
	line "los #MON, otros"
	cont "luchan con ellos."
	prompt

_OakText5::
	text "Pero aún hay"
	line "muchas cosas que"
	cont "no sabemos."

	para "Quedan muchos"
	line "misterios por"
	cont "resolver. Por eso"

	para "estudio a diario"
	line "a los #MON."
	prompt
