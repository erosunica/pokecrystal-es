MomPhoneGreetingText:
	text "¿Dígame?"

	para "¡Hola, <PLAYER>!"
	line "¿Trabajando mucho?"
	done

MomPhoneLandmarkText:
	text "Oh, estás en"
	line "@"
	text_ram wStringBuffer3
	text "…"

	para "¿Ahí no está"
	line "@"
	text_ram wStringBuffer4
	text "?"

	para "¿Has ido a echar"
	line "un vistazo?"
	done

MomPhoneGenericAreaText:
	text "¿Sí? ¿Estás en"
	line "@"
	text_ram wStringBuffer3
	text "?"

	para "Nunca he estado"
	line "allí. ¡Genial,"
	cont "<PLAYER>!"
	done

MomPhoneNewBarkText:
	text "¿Qué? ¿Estás en"
	line "@"
	text_ram wStringBuffer3
	text "?"

	para "¡Ven a verme"
	line "cuando quieras!"
	done

MomPhoneCherrygroveText:
	text "¿Estás visitando a"
	line "@"
	text_ram wStringBuffer3
	text "?"

	para "¿Por qué no vienes"
	line "un rato a casa?"
	done

MomOtherAreaText:
	text "¡Uau! ¿Estás en"
	line "@"
	text_ram wStringBuffer3
	text "?"

	para "¡Suerte en tu"
	line "aventura #MON!"
	done

MomDeterminedText:
	text "Eso parece"
	line "bastante duro."

	para "Pero, <PLAYER>, sé"
	line "que puedes hacerlo"

	para "y que te irá bien,"
	line "¿de acuerdo?"
	done

MomCheckBalanceText:
	text "Por cierto, has"
	line "ahorrado @"
	text_ram wStringBuffer3
	text "¥."

	para "¿Quieres seguir"
	line "ahorrando dinero?"
	done

MomImportantToSaveText:
	text "Es importante que"
	line "ahorres dinero."
	done

MomYoureNotSavingText:
	text "¡Oh, <PLAYER>!"
	line "No estás ahorrando"

	para "dinero. ¿Quieres"
	line "ahorrar?"
	done

MomYouveSavedText:
	text "Por cierto, has"
	line "ahorrado @"
	text_ram wStringBuffer3
	text "¥."

	para "¿Quieres seguir"
	line "ahorrando?"
	done

MomOKIllSaveText:
	text "Vale. Te guardaré"
	line "el dinero."
	done

MomPhoneWontSaveMoneyText:
	text "Vale. Dejaré de"
	line "guardarte dinero."
	done

MomPhoneHangUpText:
	text "¡Sigue así,"
	line "<PLAYER>!"
	cont "¡Estoy contigo!"
	done

MomPhoneNoPokemonText:
	text "¿Diga?"

	para "Oh, hola, <PLAYER>."

	para "¿No te estaba"
	line "esperando el"
	cont "PROF. ELM?"
	done

MomPhoneNoPokedexText:
	text "¿Diga?"

	para "Oh, hola, <PLAYER>."

	para "¿Estás en una gran"
	line "misión para el"
	cont "PROF. ELM?"

	para "¡Pórtate bien!"
	done

MomPhoneNoGymQuestText:
	text "¿Diga?"

	para "Oh, hola, <PLAYER>."

	para "Cuando acabes tu"
	line "recado ven a casa."
	done

MomPhoneLectureText:
	text "¿Diga?"

	para "…"
	line "¿<PLAYER>…?"

	para "Me ha dicho el"
	line "PROF. ELM que te"

	para "has ido para hacer"
	line "un largo viaje."

	para "Me hubiera gustado"
	line "que me lo dijeras…"

	para "Tu dinero…"
	line "¿Quieres que te lo"
	cont "guarde?"
	done
