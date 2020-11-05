--[[
	Do you want help us translating to your language?
	Send me your translation in: https://www.curseforge.com/wow/addons/titan-panel-professions-multi
	Author: Canettieri
--]]

local _, L = ...;
------ Professions pack
--- Profissions (default)
L["alchemy"] = "Alchemy"
L["archaeology"] = "Archaeology"
L["blacksmithing"] = "Blacksmithing"
L["cooking"] = "Cooking"
L["enchanting"] = "Enchanting"
L["engineering"] = "Engineering"
L["firstAid"] = "First Aid"
L["fishing"] = "Fishing"
L["herbalism"] = "Herbalism"
L["herbalismskills"] = "Herbalism Skills"
L["inscription"] = "Inscription"
L["jewelcrafting"] = "Jewelcrafting"
L["leatherworking"] = "Leatherworking"
L["mining"] = "Mining"
L["miningskills"] = "Mining Skills"
L["skinning"] = "Skinning"
L["skinningskills"] = "Skinning Skills"
L["tailoring"] = "Tailoring"
--- Master (default)
L["masterPlayer"] = "|cFFFFFFFFDisplaying all ${player}|r|cFFFFFFFF's professions.|r"
L["masterTutorialBar"] = "|cFF69FF69Point your cursor here! :)|r"
L["masterTutorial"] = TitanUtils_GetHighlightText("\r[INTRODUCTION]").."\r\rThis plugin has the function to summarize all your\rprofessions in one place. Unlike the separate plugins,\rthis one will display EVERYTHING in this tooltip.\r\r"..TitanUtils_GetHighlightText("[HOW TO USE]").."\r\rTo start, right click on this plugin and select the\roption"..TitanUtils_GetHighlightText(" 'Hide Tutorial'")..".\r\rCan be displayed in the right side of the Titan Panel\rto become even more visually pleasing!"
L["hideTutorial"] = "Hide Tutorial"
L["masterHint"] = "|cFFB4EEB4Hint:|r |cFFFFFFFFLeft click opens the profession #1 window\rand middle click opens the profession #2 window.|r\r\r"
L["primprof"] = "Show Primary Professions"

------ Reagents pack
--- Achaeology (default)
L["ready"] = "|cFF69FF69Ready!  "
L["archfragments"] = "Archaeology Fragments"
L["fragments"] = "Fragments"
L["fragtooltip"] = "|cFFB4EEB4Hint:|r |cFFFFFFFFRight-click in the plugin and\rselect which fragment will be\rdisplayed in the bar.|r\r"
L["hidehint"] = "Hide Hint"
L["displaynofrag"] = "Display Races Without Fragments"
L["inprog"] = "\rIn progress:"
L["nofragments"] = "No fragments"
L["noarchaeology"] = "|cFFFF2e2eYou didn't learn archaeology yet\ror don't have fragments.|r\r\rGo to the closest trainer to learn it\ror visit an excavation field."

--- Cooking (Shadowlands)
L["aetherealMeat"] = "|cFFFFFFFFAethereal Meat|r"
L["cCrawlerMeat"] = "|cFFFFFFFFCreeping Crawler Meat|r"
L["phantasmalHaunch"] = "|cFFFFFFFFPhantasmal Haunch|r"
L["rSeraphicWing"] = "|cFFFFFFFFRaw Seraphic Wing|r"
L["sinhadowyShank"] = "|cFFFFFFFFShadowy Shank|r"
L["tenebrousRibs"] = "|cFFFFFFFFTenebrous Ribs|r"

--- Enchanting (Legion)
L["arkhana"] = "|cFFFFFFFFArkhana|r"
L["leylight"] = "|cff0070ddLeylight Shard|r"
L["chaosCrystal"] = "|cffa335eeChaos Crystal|r"
--- Enchanting (BfA)
L["gdust"] = "|cFFFFFFFFGloom Dust|r"
L["umbrashard"] = "|cff0070ddUmbra Shard|r"
L["veiledcrystal"] = "|cffa335eeVeiled Crystal|r"
--- Enchanting (Shadowlands)
L["soulDust"] = "|cFFFFFFFFSoul Dust|r"
L["sacredShard"] = "|cff0070ddSacred Shard|r"
L["eternalCrystal"] = "|cffa335eeEternal Crystal|r"


--- Fishing (Legion)
L["mackerel"] = "|cFFFFFFFFSilver Mackerel|r"
L["queenfish"] = "|cFFFFFFFFCursed Queenfish|r"
L["salmon"] = "|cFFFFFFFFHighmountain Salmon|r"
L["mossgill"] = "|cFFFFFFFFMossgill Perch|r"
L["stormray"] = "|cFFFFFFFFStormray|r"
L["koi"] = "|cFFFFFFFFRunescale Koi|r"
L["barracuda"] = "|cFFFFFFFFBlack Barracuda|r"
--- Fishing (BfA)
L["gscatfish"] = "|cFFFFFFFFGreat Sea Catfish|r"
L["redtaill"] = "|cFFFFFFFFRedtail Loach|r"
L["smackerel"] = "|cFFFFFFFFSlimy Mackerel|r"
L["sshifter"] = "|cFFFFFFFFSand Shifter|r"
L["tperch"] = "|cFFFFFFFFTiragarde Perch|r"
L["lsnapper"] = "|cFFFFFFFFLane Snapper|r"
L["ffangtooth"] = "|cFFFFFFFFFrenzied Fangtooth|r"
L["msalmon"] = "|cff1eff00Midnight Salmon|r"
--- Fishing (Shadowlands)
L["lostSole"] = "|cFFFFFFFFLost Sole|r"
L["silvergillPike"] = "|cFFFFFFFFSilvergill Pike|r"
L["pockedBonefish"] = "|cFFFFFFFFPocked Bonefish|r"
L["iridescentAmberjack"] = "|cFFFFFFFFIridescent Amberjack|r"
L["spinefinPiranha"] = "|cFFFFFFFFSpinefin Piranha|r"
L["elysianThade"] = "|cff1eff00Elysian Thade|r"

--- Herbalism (Legion)
L["yseralline"] = "|cFFFFFFFFYseralline Seed|r"
L["felwort"] = "|cff1eff00Felwort|r"
L["starlight"] = "|cFFFFFFFFStarlight Rose|r"
L["fjarn"] = "|cFFFFFFFFFjarnskaggl|r"
L["foxflower"] = "|cFFFFFFFFFoxflower|r"
L["dreamleaf"] = "|cFFFFFFFFDreamleaf|r"
L["aethril"] = "|cFFFFFFFFAethril|r"
--- Herbalism (BfA)
L["zinanthid"] = "|cFFFFFFFFZin'anthid|r"
L["riverbud"] = "|cFFFFFFFFRiverbud|r"
L["seastalk"] = "|cFFFFFFFFSea Stalk|r"
L["starmoss"] = "|cFFFFFFFFStar Moss|r"
L["akunda"] = "|cFFFFFFFFAkunda's Bite|r"
L["wkiss"] = "|cFFFFFFFFWinter's Kiss|r"
L["spollen"] = "|cFFFFFFFFSiren's Pollen|r"
L["aweed"] = "|cff1eff00Anchor Weed|r"
--- Herbalism (Shadowlands)
L["risingGlory"] = "|cFFFFFFFFRising Glory|r"
L["marrowroot"] = "|cFFFFFFFFMarrowroot|r"
L["vigilsTorch"] = "|cFFFFFFFFVigil's Torch|r"
L["widowbloom"] = "|cFFFFFFFFWidowbloom|r"
L["deathBlossom"] = "|cFFFFFFFFDeath Blossom|r"
L["nightshade"] = "|cff1eff00Nightshade|r"

--- Inscription (Shadowlands)
L["luminousInk"] = "|cFFFFFFFFLuminous Ink|r"
L["umbralInk"] = "|cFFFFFFFFUmbral Ink|r"
L["tranquilInk"] = "|cff1eff00Tranquil Ink|r"
L["luminousPigment"] = "|cFFFFFFFFLuminous Pigment|r"
L["umbralPigment"] = "|cFFFFFFFFUmbral Pigment|r"
L["tranquilPigment"] = "|cff1eff00Tranquil Pigment|r"
L["ardenwood"] = "|cFFFFFFFFArdenwood|r"
L["darkParchment"] = "|cFFFFFFFFDark Parchment|r"

--- Jewelcrafting (Shadowlands)
L["angerseye"] = "|cff1eff00Angerseye|r"
L["oriblase"] = "|cff1eff00Oriblase|r"
L["umbryl"] = "|cff1eff00Umbryl|r"

--- Mining (Legion)
L["leystone"] = "|cFFFFFFFFLeystone Ore|r"
L["felslate"] = "|cFFFFFFFFFelslate|r"
L["brimstone"] = "|cff1eff00Infernal Brimstone|r"
L["blood"] = "|cff0070ddBlood of Sargeras|r"
--- Mining (BfA)
L["monelite"] = "|cFFFFFFFFMonelite Ore|r"
L["stormSilver"] = "|cFFFFFFFFStorm Silver Ore|r"
L["platinumOre"] = "|cff1eff00Platinum Ore|r"
L["osmeniteOre"] = "|cFFFFFFFFOsmenite Ore|r"
--- Mining (Shadowlands)
L["laestriteOre"] = "|cFFFFFFFFLaestrite Ore|r"
L["elethiumOre"] = "|cff0070ddElethium Ore|r"
L["soleniumOre"] = "|cff1eff00Solenium Ore|r"
L["oxxeinOre"] = "|cff1eff00Oxxein Ore|r"
L["phaedrumOre"] = "|cff1eff00Phaedrum Ore|r"
L["sinvyrOre"] = "|cff1eff00Sinvyr Ore|r"
L["porousStone"] = "|cFFFFFFFFPorous Stone|r"
L["shadedStone"] = "|cFFFFFFFFShaded Stone|r"
L["twilightBark"] = "|cFFFFFFFFTwilight Bark|r"

--- Skinning (Legion)
L["stormscale"] = "|cFFFFFFFFStormscale|r"
L["stonehide"] = "|cFFFFFFFFStonehide Leather|r"
L["felhide"] = "|cff1eff00Felhide|r"
L["tooth"] = "|cFFFFFFFFUnbroken Tooth|r"
L["claw"] = "|cFFFFFFFFUnbroken Claw|r"
--- Skinning (BfA)
L["cbone"] = "|cff1eff00Calcified Bone|r"
L["bloodstained"] = "|cFFFFFFFFBlood-Stained Bone|r"
L["mistscale"] = "|cff1eff00Mistscale|r"
L["shimmerscale"] = "|cFFFFFFFFShimmerscale|r"
L["tempesth"] = "|cff1eff00Tempest Hide|r"
L["coarsel"] = "|cFFFFFFFFCoarse Leather|r"
L["dredgedl"] = "|cFFFFFFFFDredged Leather|r"
L["cragscale"] = "|cFFFFFFFFCragscale|r"
--- Skinning (Shadowlands)
L["desolateLeather"] = "|cFFFFFFFFDesolate Leather|r"
L["callousHide"] = "|cff1eff00Callous Hide|r"
L["pallidBone"] = "|cFFFFFFFFPallid Bone|r"
L["gauntSinew"] = "|cff1eff00Gaunt Sinew|r"
L["hDesolateLeather"] = "|cff1eff00Heavy Desolate Leather|r"
L["hCallousHide"] = "|cff0070ddHeavy Callous Hide|r"
L["purifiedLeather"] = "|cFFFFFFFFPurified Leather|r"
L["necroticLeather"] = "|cFFFFFFFFNecrotic Leather|r"
L["unseelieLeather"] = "|cFFFFFFFFUnseelie Leather|r"
L["sinfulLeather"] = "|cFFFFFFFFSinful Leather|r"

--- Tailoring (Legion)
L["shaldorei"] = "|cFFFFFFFFShal'dorei Silk|r"
L["silkweave"] = "|cFFFFFFFFImbued Silkweave|r"
--- Tailoring (BfA)
L["tidespray"] = "|cFFFFFFFFTidespray Linen|r"
L["nylonthread"] = "|cFFFFFFFFNylon Thread|r"
L["deepseasatin"] = "|cff1eff00Deep Sea Satin|r"
L["embroideredsatin"] = "|cff0070ddEmbroidered Deep Sea Satin|r"
L["gseaweave"] = "|cff1eff00Gilded Seaweave|r"
--- Tailoring (Shadowlands)
L["shroudedCloth"] = "|cFFFFFFFFShrouded Cloth|r"
L["lightlessSilk"] = "|cff1eff00Lightless Silk|r"
L["enLightlessSilk"] = "|cff1eff00Enchanted Lightless Silk|r"
L["penumbraThread"] = "|cFFFFFFFFPenumbra Thread|r"

------ Shared with one or more
--- Shared (default)
L["hint"] = "|cFFB4EEB4Hint:|r |cFFFFFFFFLeft-click opens your\n|cFFFFFFFFprofession window."
L["maximum"] = "Max"
L["noprof"] = "!?"
L["bonus"] = "(Bonus)"
L["hidemax"] = "Hide Maximum Values"
L["session"] = "Learned this session:"
L["noskill"] = "|cFFFF2e2eYou didn't learn this profession.|r\r\rGo to the closest trainer to learn\rit. If you need, you can forget\rany primary profession."
L["nosecskill"] = "|cFFFF2e2eYou didn't learn this profession.|r\r\rGo to the closest trainer to learn it."
L["showbb"] = "Display Session Balance in Bar"
L["simpleb"] = "Simplified Bonus"
L["craftsmanship"] = "Total Skill:"
L["goodwith"] = TitanUtils_GetHighlightText("[Combine with]")
L["info"] = TitanUtils_GetHighlightText("[Information]")
L["maxskill"] = "|rYou have reached maximum potential!"
L["warning"] = "\r\r|cFFFF2e2e[Attention!]|r\rYou have reached the maximum\rexpertise and is not learning\ranymore! Go to a trainer or learn\rthe local expertise."
L["maxtext"] = "Max. Value:"
L["bonustext"] = "Active Bonus:"
L["totalbag"] = "Total in Bag: "
L["totalbank"] = "Total in Bank: "
L["reagents"] = "Reagents"
L["rLegion"] = "Reagents - Legion"
L["rBfA"] = "Reagents - BfA"
L["rShadowlands"] = "Reagents - Shadowlands"
L["rSL"] = "Reagents - SL"
L["noreagent"] = "You have not got any of\rthese reagents."
L["hide"] = "Hide"
L["totalSkill"] = "Total Skill:"
L["hideCombination"] = "Hide Combination"
L["buttonText"] = "Bar Text"
L["tooltip"] = "Tooltip"
