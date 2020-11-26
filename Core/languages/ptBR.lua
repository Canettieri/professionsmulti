--[[
  Oi para você que é brasileiro e está vindo até aqui ler as traduções! HAHA! Se encontrar algum erro, me avise, tá bem?
  Esse aplicativo foi feito por um cara que não manja nada de programação... Brasileiro é foda, né? Quer se meter em tudo... Um marqueteiro querendo desenvolver addon, vê se pode!
  Mas enfim, aproveite minhas gambiarras, HAHA, foram feitas com amor para você.
	Tudo aqui neste arquivo foi traduzido por mim, Paulo Canettieri! (com ajuda do wowhead, ninguém é de ferro!)
--]]

local _, L = ...;
if GetLocale() == "ptBR" then
------ Professions pack
--- Profissions
L["alchemy"] = "Alquimia"
L["archaeology"] = "Arqueologia"
L["blacksmithing"] = "Ferraria"
L["cooking"] = "Culinária"
L["enchanting"] = "Encantamento"
L["engineering"] = "Engenharia"
L["firstAid"] = "Primeiros Socorros"
L["fishing"] = "Pesca"
L["herbalism"] = "Herborismo"
L["herbalismskills"] = "Perícias de Herborismo"
L["inscription"] = "Escrivania"
L["jewelcrafting"] = "Joalheria"
L["leatherworking"] = "Couraria"
L["mining"] = "Mineração"
L["miningskills"] = "Perícia em Mineração"
L["skinning"] = "Esfolamento"
L["skinningskills"] = "Habilidades em Esfolamento"
L["tailoring"] = "Alfaiataria"
--- Master
L["masterPlayer"] = "|cFFFFFFFFExibindo todas profissões de ${player}|cFFFFFFFF.|r"
L["masterTutorialBar"] = "|cFF69FF69Passe o cursor aqui! :)|r"
L["masterTutorial"] = TitanUtils_GetHighlightText("\r[INTRODUÇÃO]").."\r\rEste plugin tem a função de resumir todas suas profissões\rem um único lugar. Diferentemente dos plugins avulsos,\reste exibirá TUDO nesta tooltip.\r\r"..TitanUtils_GetHighlightText("[COMO USAR]").."\r\rPara começar, clique com o botão direito no plugin e\rselecione a opção"..TitanUtils_GetHighlightText(" 'Esconder Tutorial'")..".\r\rVocê poderá coloca-lo no canto direito do Painel Titan\rpara ficar ainda mais agradável visualmente!"
L["hideTutorial"] = "Esconder Tutorial"
L["masterHint"] = "|cFFB4EEB4Dica:|r |cFFFFFFFFClique esquerdo abre a janela da\rprofissão nº1 e com o botão do meio\rabre a janela da profissão nº2.|r\r\r"
L["primprof"] = "Mostrar Profissões Primárias"

------ Reagents pack
--- Achaeology
L["ready"] = "|cFF69FF69Pronto!  "
L["archfragments"] = "Fragmentos de Arqueologia"
L["fragments"] = "Fragmentos"
L["fragtooltip"] = "|cFFB4EEB4Dica:|r |cFFFFFFFFClique com o botão direito no\rplugin e escolha quais fragmentos\rserão mostrados na barra.|r\r"
L["hidehint"] = "Esconder Dica"
L["displaynofrag"] = "Exibir Raças Sem Fragmentos"
L["inprog"] = "\rEm progresso:"
L["nofragments"] = "Sem fragmentos"
L["noarchaeology"] = "|cFFFF2e2eVocê ainda não aprendeu arqueologia\rou não tem fragmentos.|r\r\rVá ao treinador mais próximo para aprender\rou visite um campo de escavação."

--- Cooking (Shadowlands)
L["aetherealMeat"] = "|cFFFFFFFFCarne Aetérea|r"
L["cCrawlerMeat"] = "|cFFFFFFFFCarne de Rastejante Sinistro|r"
L["phantasmalHaunch"] = "|cFFFFFFFFPernil Fantasmagórico|r"
L["rSeraphicWing"] = "|cFFFFFFFFAsa Seráfica Crua|r"
L["sinhadowyShank"] = "|cFFFFFFFFMocotó Sombrio|r"
L["tenebrousRibs"] = "|cFFFFFFFFCostela Tenebrosa|r"

--- Enchanting (Legião)
L["arkhana"] = "|cFFFFFFFFArkhana|r"
L["leylight"] = "|cff0070ddEstilhaço de Luz Meridiana|r"
L["chaosCrystal"] = "|cffa335eeCristal do Caos|r"
--- Enchanting (BfA)
L["gdust"] = "|cFFFFFFFFPó Tenebroso|r"
L["umbrashard"] = "|cff0070ddEstilhaço da Umbra|r"
L["veiledcrystal"] = "|cffa335eeCristal Velado|r"
--- Enchanting (Shadowlands)
L["soulDust"] = "|cFFFFFFFFPó d'Alma|r"
L["sacredShard"] = "|cff0070ddEstilhaço Sagrado|r"
L["eternalCrystal"] = "|cffa335eeCristal Eterno|r"

--- Fishing (Legião)
L["mackerel"] = "|cFFFFFFFFCavala Prateada|r"
L["queenfish"] = "|cFFFFFFFFPeixe-rainha Amaldiçoado|r"
L["salmon"] = "|cFFFFFFFFSalmão Altamontês|r"
L["mossgill"] = "|cFFFFFFFFNinho de Pinalimo|r"
L["stormray"] = "|cFFFFFFFFTrovarraia|r"
L["koi"] = "|cFFFFFFFFCarpa escama rúnica|r"
L["barracuda"] = "|cFFFFFFFFBarracuda Negra|r"
--- Fishing (BfA)
L["gscatfish"] = "|cFFFFFFFFBagre do Grande Oceano|r"
L["redtaill"] = "|cFFFFFFFFBótia Caudarrubra|r"
L["smackerel"] = "|cFFFFFFFFCavala Viscosa|r"
L["sshifter"] = "|cFFFFFFFFCisca-areia|r"
L["tperch"] = "|cFFFFFFFFPerca de Tiragarde|r"
L["lsnapper"] = "|cFFFFFFFFCioba|r"
L["ffangtooth"] = "|cFFFFFFFFPresadente Frenético|r"
L["msalmon"] = "|cff1eff00Salmão da Meia-noite|r"
--- Fishing (Shadowlands)
L["lostSole"] = "|cFFFFFFFFLinguado Perdido|r"
L["silvergillPike"] = "|cFFFFFFFFLúcio Guelraprata|r"
L["pockedBonefish"] = "|cFFFFFFFFPeixe-esqueleto Esburacado|r"
L["iridescentAmberjack"] = "|cFFFFFFFFOlho-de-tauren Iridescente|r"
L["spinefinPiranha"] = "|cFFFFFFFFPiranha Espinhapinar"
L["elysianThade"] = "|cff1eff00Thade Elísio|r"

--- Herbalism (Legião)
L["yseralline"] = "|cFFFFFFFFSemente de Yseralina|r"
L["felwort"] = "|cff1eff00Maltevil|r"
L["starlight"] = "|cFFFFFFFFRosa-da-luz-estelar|r"
L["fjarn"] = "|cFFFFFFFFFjarnskaggl|r"
L["foxflower"] = "|cFFFFFFFFFlor-de-raposa|r"
L["dreamleaf"] = "|cFFFFFFFFFolha-de-sonho|r"
L["aethril"] = "|cFFFFFFFFAethril|r"
--- Herbalism (BfA)
L["zinanthid"] = "|cFFFFFFFFZin'antida|r"
L["riverbud"] = "|cFFFFFFFFBroto-do-rio|r"
L["seastalk"] = "|cFFFFFFFFTalo-marinho|r"
L["starmoss"] = "|cFFFFFFFFMusgo-estrela|r"
L["akunda"] = "|cFFFFFFFFMordida-de-akunda|r"
L["wkiss"] = "|cFFFFFFFFBeijo-do-inverno|r"
L["spollen"] = "|cFFFFFFFFPólen de Sirena|r"
L["aweed"] = "|cff1eff00Erva-ancorina|r"
--- Herbalism (Shadowlands)
L["risingGlory"] = "|cFFFFFFFFGlória-da-ascenção|r"
L["marrowroot"] = "|cFFFFFFFFRadicerne|r"
L["vigilsTorch"] = "|cFFFFFFFFTocha-da-vigília|r"
L["widowbloom"] = "|cFFFFFFFFBroto-de-viúva|r"
L["deathBlossom"] = "|cFFFFFFFFBotão-da-morte|r"
L["nightshade"] = "|cff1eff00Beladona|r"

--- Inscription (Shadowlands)
L["luminousInk"] = "|cFFFFFFFFTinta Luminosa|r"
L["umbralInk"] = "|cFFFFFFFFTinta Umbrática|r"
L["tranquilInk"] = "|cff1eff00Tinta Tranquila|r"
L["luminousPigment"] = "|cFFFFFFFFPigmento Luminoso|r"
L["umbralPigment"] = "|cFFFFFFFFPigmento Umbrático|r"
L["tranquilPigment"] = "|cff1eff00Corante Plácido|r"
L["ardenwood"] = "|cFFFFFFFFArdeneiro|r"
L["darkParchment"] = "|cFFFFFFFFPergaminho Escuro|r"

--- Jewelcrafting (Shadowlands)
L["angerseye"] = "|cff1eff00Olho-da-ira|r"
L["oriblase"] = "|cff1eff00Oriblase|r"
L["umbryl"] = "|cff1eff00Umbryl|r"

--- Mining (Legião)
L["leystone"] = "|cFFFFFFFFMinério de Pedra de Meridiano|r"
L["felslate"] = "|cFFFFFFFFVilardósia|r"
L["brimstone"] = "|cff1eff00Enxofre Infernal|r"
L["blood"] = "|cff0070ddSangue de Sargeras|r"
--- Mining (BfA)
L["monelite"] = "|cFFFFFFFFMinério de Monelita|r"
L["stormSilver"] = "|cFFFFFFFFMinério de Prata Procelosa|r"
L["platinumOre"] = "|cff1eff00Minério de Platina|r"
L["osmeniteOre"] = "|cFFFFFFFFMinério de Osmenita|r"
--- Mining (Shadowlands)
L["laestriteOre"] = "|cFFFFFFFFMinério de Laestrita|r"
L["elethiumOre"] = "|cff0070ddMinério de Elétio|r"
L["soleniumOre"] = "|cff1eff00Minério de Solênio|r"
L["oxxeinOre"] = "|cff1eff00Minério de Oxxeína|r"
L["phaedrumOre"] = "|cff1eff00Minério de Faedro|r"
L["sinvyrOre"] = "|cff1eff00Minério de Pecavyr|r"
L["porousStone"] = "|cFFFFFFFFPedra Porosa|r"
L["shadedStone"] = "|cFFFFFFFFPedra Penumbral|r"
L["twilightBark"] = "|cFFFFFFFFCasca Crepuscular|r"

--- Skinning (Legião)
L["stormscale"] = "|cFFFFFFFFEscamarraio|r"
L["stonehide"] = "|cFFFFFFFFCouro Pétreo|r"
L["felhide"] = "|cff1eff00Couro Vil|r"
L["tooth"] = "|cFFFFFFFFDente Inteiro|r"
L["claw"] = "|cFFFFFFFFGarra Inteira|r"
--- Skinning (BfA)
L["cbone"] = "|cff1eff00Osso Calcificado|r"
L["bloodstained"] = "|cFFFFFFFFOsso Manchado de Sangue|r"
L["mistscale"] = "|cff1eff00Brumescama|r"
L["shimmerscale"] = "|cFFFFFFFFBrilhescama|r"
L["tempesth"] = "|cff1eff00Pelego da Tempestade|r"
L["coarsel"] = "|cFFFFFFFFCouro Grosseiro|r"
L["dredgedl"] = "|cFFFFFFFFCouro Desencavado|r"
L["cragscale"] = "|cFFFFFFFFEscama Pétrea|r"
--- Skinning (Shadowlands)
L["desolateLeather"] = "|cFFFFFFFFCouro Desolado|r"
L["callousHide"] = "|cff1eff00Pelego Calejado|r"
L["pallidBone"] = "|cFFFFFFFFOsso Pálido|r"
L["gauntSinew"] = "|cff1eff00Tendão Esquálido|r"
L["hDesolateLeather"] = "|cff1eff00Couro Desolado Pesado|r"
L["hCallousHide"] = "|cff0070ddPelego Calejado Pesado|r"
L["purifiedLeather"] = "|cFFFFFFFFCouro Purificado|r"
L["necroticLeather"] = "|cFFFFFFFFCouro Necrótico|r"
L["unseelieLeather"] = "|cFFFFFFFFCouro Malévolo|r"
L["sinfulLeather"] = "|cFFFFFFFFCouro Pecaminoso|r"

--- Tailoring (Legião)
L["shaldorei"] = "|cFFFFFFFFSeda Shal'dorei|r"
L["silkweave"] = "|cFFFFFFFFTramasseda Imbuída|r"
--- Tailoring (BfA)
L["tidespray"] = "|cFFFFFFFFLinho Borrifado pela Maré|r"
L["nylonthread"] = "|cFFFFFFFFFio de Nylon|r"
L["deepseasatin"] = "|cff1eff00Seda do Mar Profundo|r"
L["embroideredsatin"] = "|cff0070ddSeda do Mar Profundo Bordada|r"
L["gseaweave"] = "|cff1eff00Seda-marinha Dourada|r"
--- Tailoring (Shadowlands)
L["shroudedCloth"] = "|cFFFFFFFFTecido Amortalhado|r"
L["lightlessSilk"] = "|cff1eff00Seda Desluminada|r"
L["enLightlessSilk"] = "|cff1eff00Seda Desluminada Encantada|r"
L["penumbraThread"] = "|cFFFFFFFFFio da Penumbra|r"

------ Shared with one or more
--- Shared
L["hint"] = "|cFFB4EEB4Dica:|r |cFFFFFFFFClique para abrir a janela\n|cFFFFFFFFda profissão."
L["maximum"] = "Máx"
L["noprof"] = "!?"
L["bonus"] = "(Bônus)"
L["hidemax"] = "Esconder Valores Máximos"
L["session"] = "Aprendido na sessão:"
L["noskill"] = "|cFFFF2e2eVocê não aprendeu esta profissão.|r\r\rVá ao treinador mais próximo\rpara aprende-la.\r\rSe precisar, poderá esquecer\rqualquer profissão primária."
L["nosecskill"] = "|cFFFF2e2eVocê não aprendeu esta profissão.|r\r\rVá ao treinador mais próximo\rpara aprende-la."
L["showbb"] = "Exibir Saldo da Sessão na Barra"
L["simpleb"] = "Bônus Simplificado"
L["craftsmanship"] = "Perícia Atual:"
L["goodwith"] = TitanUtils_GetHighlightText("[Combina com]")
L["info"] = TitanUtils_GetHighlightText("[Informações]")
L["maxskill"] = "|rVocê chegou ao potencial máximo!"
L["warning"] = "\r\r|cFFFF2e2e[Atenção!]|r\rVocê chegou ao máximo de\rperícia e precisa treinar\rpara continuar aprendendo."
L["maxtext"] = "Valor Máximo:"
L["bonustext"] = "Bônus Ativo:"
L["totalbag"] = "Total na Bolsa: "
L["totalbank"] = "Total no Banco: "
L["reagents"] = "Reagentes"
L["rLegion"] = "Reagentes - Legion"
L["rBfA"] = "Reagentes - BfA"
L["rShadowlands"] = "Reagentes - Shadowlands"
L["rSL"] = "Reagentes - SL"
L["noreagent"] = "Você ainda não obteve\rnenhum destes reagentes."
L["hide"] = "Esconder"
L["totalSkill"] = "Perícia Total:"
L["hideCombination"] = "Esconder Combinações"
L["buttonText"] = "Texto da Barra"
L["tooltip"] = "Texto de Ajuda"
end
