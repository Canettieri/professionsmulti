--[[
	Do you want help us translating to your language?
	Send me your translation in: https://www.curseforge.com/wow/addons/titan-panel-professions-multi
	Author: Canettieri
  German translator: pas06, Wavix, aniceto
	Last update: 07/04/2017
--]]

local _, L = ...;
if GetLocale() == "deDE" then
------ Professions pack
--- Profissions
L["alchemy"] = "Alchemie"
L["archaeology"] = "Archäologie"
L["blacksmithing"] = "Schmiedekunst"
L["cooking"] = "Kochkunst"
L["enchanting"] = "Verzauberkunst"
L["engineering"] = "Ingenieurskunst"
L["firstAid"] = "Erste Hilfe"
L["fishing"] = "Angeln"
L["herbalism"] = "Kräuterkunde"
L["herbalismskills"] = "Kräuterkundefähigkeiten"
L["inscription"] = "Inschriftenkunde"
L["jewelcrafting"] = "Juwelierskunst"
L["leatherworking"] = "Lederverarbeitung"
L["mining"] = "Bergbau"
L["miningskills"] = "Bergbaufertigkeiten"
L["skinning"] = "Kürschnerei"
L["skinningskills"] = "Kürschnerfertigkeiten"
L["tailoring"] = "Schneiderei"
--- Master
L["masterPlayer"] = "|cFFFFFFFFZeige ${player}s|r|cFFFFFFFF Berufe an.|r"
L["masterTutorialBar"] = "|cFF69FF69Bewege deinen Cursor hierher! :)|r"
L["masterTutorialIntro"] = "[EINFÜHRUNG]"
L["masterTutorialIntroText"] = "Dieses Plugin hat die Funktion, alle deine Berufe an einem Ort zusammenzufassen.\rIm Gegensatz zu den separaten Plugins wird diese in dieser Tooltip ALLES angezeigt."
L["masterTutorialHowTo"] = "[WIE BENUTZEN]"
L["masterTutorialHowToText"] = "Zum Starten klicken Sie mit der rechten Maustaste auf dieses Plugin und wählen Sie\rdie Option |cFFFFFFFF'Anleitung ausblenden'|r aus.\r\rKann auf der rechten Seite des Titan Panels angezeigt werden, um noch mehr optisch\rzu erfreuen!"
L["hideTutorial"] = "Anleitung ausblenden"
L["masterHint"] = "|cFFB4EEB4Hinweis:|r |cFFFFFFFFLinksklick öffnet das Fenster des ersten Berufs\rund ein Mittelklick das Fenster des zweiten Berufs.|r\r\r"
L["primprof"] = "Zeige Primäre Berufe an"

------ Reagents pack
--- Achaeology
L["ready"] = "|cFF69FF69Fertig!  "
L["archfragments"] = "Archäologie Fragmente"
L["fragments"] = "Fragmente"
L["fragtooltip"] = "|cFFB4EEB4Hinweis:|r |cFFFFFFFFRechtsklicke in das Plugin und\rwähle aus, welches Fragment in\rder Leiste angezeigt wird.|r\r"
L["hidehint"] = "Hinweis verstecken"
L["displaynofrag"] = "Völker ohne Fragmente anzeigen"
L["inprog"] = "\rWird bearbeitet:"
L["nofragments"] = "\nKeine Fragmente:\r"
L["noarchaeology"] = "|cFFFF2e2eDu hast Archäologie noch nicht erlernt\roder du besitzt keine Fragmente.|r\r\rGehe zu dem nächstgelegensten Lehrer\roder Ausgrabungsstätte."
--- Enchanting
L["arkhana"] = "|cFFFFFFFFArkhana|r"
L["leylight"] = "|cff0070ddLeylichsplitter|r"
L["chaosCrystal"] = "|cffa335eeChaoskristall|r"
--- Fishing
L["mackerel"] = "|cFFFFFFFFSilbermakrele|r"
L["queenfish"] = "|cFFFFFFFFVerfluchter Königinnenfisch|r"
L["salmon"] = "|cFFFFFFFFHochberglachs|r"
L["mossgill"] = "|cFFFFFFFFMooskiemenbarsch|r"
L["stormray"] = "|cFFFFFFFFSturmrochen|r"
L["koi"] = "|cFFFFFFFFRunenschuppenkoi|r"
L["barracuda"] = "|cFFFFFFFFSchwarzer Barrakuda|r"
--- Herbalism
L["yseralline"] = "|cFFFFFFFFYseralinensamen|r"
L["felwort"] = "|cff1eff00Teufelswurz|r"
L["starlight"] = "|cFFFFFFFFSternenlichrose|r"
L["fjarn"] = "|cFFFFFFFFFjarnskaggl|r"
L["foxflower"] = "|cFFFFFFFFFuchsblume|r"
L["dreamleaf"] = "|cFFFFFFFFTraumlaub|r"
L["aethril"] = "|cFFFFFFFFAethril|r"
--- Mining
L["leystone"] = "|cFFFFFFFFLeysteinerz|r"
L["felslate"] = "|cFFFFFFFFTeufelsschiefer|r"
L["brimstone"] = "|cff1eff00Infernoschwefel|r"
L["blood"] = "|cff0070ddBlut von Sargeras|r"
--- Skinning
L["stormscale"] = "|cFFFFFFFFSturmschuppe|r"
L["stonehide"] = "|cFFFFFFFFSteinbalgleder|r"
L["felhide"] = "|cff1eff00Teufelsbalg|r"
L["tooth"] = "|cFFFFFFFFIntakter Zahn|r"
L["claw"] = "|cFFFFFFFFIntakte Kralle|r"
--- Tailoring
L["shaldorei"] = "|cFFFFFFFFShal'doreiseide|r"
L["silkweave"] = "|cFFFFFFFFMachtgetränktes Seidengewebe|r"

------ Shared with one or more
--- Shared
L["hint"] = "|cFFB4EEB4Hinweis:|r |cFFFFFFFFEin Linksklick öffnet dein\n|cFFFFFFFFBerufe Fenster."
L["maximum"] = "Max"
L["bonus"] = "(Bonus)"
L["hidemax"] = "Max. Werte verstecken"
L["session"] = "In dieser Sitzung erlernt: "
L["noskill"] = "|cFFFF2e2eDu hast diesen Beruf noch nicht erlernt.|r\r\rGehe zu dem nächstgelegensten Lehrer,\rum ihn zu erlernen. Du kannst auch\rjeden Hauptberuf wieder verlernen,\rfalls du ihn ersetzen möchtest."
L["nosecskill"] = "|cFFFF2e2eDu hast diesen Beruf noch nicht erlernt.|r\r\rGehe zu dem nächstgelegensten Lehrer,\rum ihn zu erlernen."
L["showbb"] = "Sitzungsbalance in der Leiste anzeigen"
L["simpleb"] = "Vereinfachter Bonus"
L["craftsmanship"] = "Fähigkeit: "
L["goodwith"] = "|cFFFFFFFF[Kombinieren mit]|r"
L["info"] = "|cFFFFFFFF[Informationen]|r"
L["maxskill"] = "|rDu hast das höchste Fähigkeitenlevel erreicht!"
L["warning"] = "\r\r|cFFFF2e2e[Achtung!]|r\rSie haben die maximale Expertise\rerreicht und Lernen nicht mehr!\rGehen Sie zu einem Ausbilder\roder lernen Sie die lokale\rExpertise.." -- Not tested!
L["maxtext"] = "|rAktuelles Maximum: "
L["totalbag"] = "Insgesamt in Beutel: "
L["totalbank"] = "Insgesamt in Bank: "
L["reagents"] = "Komponenten"
L["noreagent"] = "Sie haben keine dieser Komponenten."
L["hide"] = "Ausblenden"
end
