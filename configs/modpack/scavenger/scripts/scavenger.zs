////Imports
import mods.botania.Apothecary;
import minetweaker.data.IData;
import minetweaker.item.IItemStack;

////Variables
//misc
val pureDaisy = <botania:specialFlower>.withTag({type: "puredaisy"});
val enchanter = <enderio:blockEnchanter>;
val drillCore = <actuallyadditions:itemMisc:16>;
val abilityBottle = <everlastingabilities:abilityBottle>;
val displayStand = <actuallyadditions:blockDisplayStand>;
val empowerer = <actuallyadditions:blockEmpowerer>;
val snare = <bloodmagic:ItemSoulSnare>;
val grappleBasic = <grapplemod:grapplinghook:*>;
val spawnPreventor = <grimoireofgaia:spawnguard>;
val bearTrap = <camping:trap>;
val capacitorBasic = <enderio:itemBasicCapacitor>;
val spellbindingCloth = <botania:spellCloth>;
val enderBook = <terraqueous:item_main:109>;
//bags
val goldenBag = <extrautils2:bagofholding>;
val runeBag = <arsmagica2:rune_bag>;
val essenceBag = <arsmagica2:essence_bag>;
val flowerPouch = <botania:flowerBag>;
val shiniesBag = <gemulation:GemBagItem:*>;
val dustPouch = <runesofwizardry:dust_pouch>;
//flight
val chaosRuneFlight = <silentgems:ChaosRune>.withTag({chaos_buff: "silentgems:flight"});
val angelRing = <extrautils2:angelring:*>;
val batWings = <actuallyadditions:itemWingsOfTheBats>;
//farmers
val farmingComponent = <quadrum:farmingComponent>;
val cloche = <immersiveengineering:metalDevice1:13>;
val farmerAA = <actuallyadditions:blockFarmer>;
val farmingStation = <enderio:blockFarmStation>;
val autoFarmers = <ore:autoFarmers>;
val brokenFarmer = <quadrum:brokenFarmer>;
val damagedCapacitor = <quadrum:damagedCapacitor>;

//blueprints
val paper = <minecraft:paper>;
val blueprintPureDaisy = <quadrum:blueprintPureDaisy>;
val blueprintEnchanter = <quadrum:blueprintEnchanter>;
val blueprintDrillCore = <quadrum:blueprintDrillCore>;
val blueprintDisplayStand = <quadrum:blueprintDisplayStand>;
val blueprintGrappleBasic = <quadrum:blueprintGrapplingHook>;
val blueprintFarmingComponent = <quadrum:blueprintFarmingComponent>;

//Traps
val trapBoom = <dungeontactics:trap_boom>;
val trapFire = <dungeontactics:trap_fire>;
val trapSlime = <dungeontactics:trap_slime>;
val trapFume = <dungeontactics:trap_foul>;
val trapAiling = <dungeontactics:trap_ailment>;
val trapPort = <dungeontactics:trap_port>;
val trapSpectral = <dungeontactics:trap_spectral>;

var traps = [
	trapBoom, trapFire, trapSlime, trapFume, trapAiling, trapPort, trapSpectral
] as IItemStack[];

//Armour
val ironHelmet = <minecraft:iron_helmet>;
val ironChest = <minecraft:iron_chestplate>;
val ironLegs = <minecraft:iron_leggings>;
val ironBoots = <minecraft:iron_boots>;
val leatherHelmet = <minecraft:leather_helmet>;
val leatherChest = <minecraft:leather_chestplate>;
val leatherLegs = <minecraft:leather_leggings>;
val leatherBoots = <minecraft:leather_boots>;
val goldHelmet = <minecraft:golden_helmet>;
val goldChest = <minecraft:golden_chestplate>;
val goldLegs = <minecraft:golden_leggings>;
val goldBoots = <minecraft:golden_boots>;
val diamondHelmet = <minecraft:diamond_helmet>;
val diamondChest = <minecraft:diamond_chestplate>;
val diamondLegs = <minecraft:diamond_leggings>;
val diamondBoots = <minecraft:diamond_boots>;
val chainHelmet = <minecraft:chainmail_helmet>;
val chainChest = <minecraft:chainmail_chestplate>;
val chainLegs = <minecraft:chainmail_leggings>;
val chainBoots = <minecraft:chainmail_boots>;
val blackQuartzHelmet = <actuallyadditions:itemHelmQuartz>;
val blackQuartzChest = <actuallyadditions:itemChestQuartz>;
val blackQuartzLegs = <actuallyadditions:itemPantsQuartz>;
val blackQuartzBoots = <actuallyadditions:itemBootsQuartz>;
val emeraldHelmet = <actuallyadditions:itemHelmEmerald>;
val emeraldChest = <actuallyadditions:itemChestEmerald>;
val emeraldLegs = <actuallyadditions:itemPantsEmerald>;
val emeraldBoots = <actuallyadditions:itemBootsEmerald>;
val obsidianHelmet = <actuallyadditions:itemHelmObsidian>;
val obsidianChest = <actuallyadditions:itemChestObsidian>;
val obsidianLegs = <actuallyadditions:itemPantsObsidian>;
val obsidianBoots = <actuallyadditions:itemBootsObsidian>;
val redstoniaHelmet = <actuallyadditions:itemHelmCrystalRed>;
val redstoniaChest = <actuallyadditions:itemChestCrystalRed>;
val redstoniaLegs = <actuallyadditions:itemPantsCrystalRed>;
val redstoniaBoots = <actuallyadditions:itemBootsCrystalRed>;
val palisHelmet = <actuallyadditions:itemHelmCrystalBlue>;
val palisChest = <actuallyadditions:itemChestCrystalBlue>;
val palisLegs = <actuallyadditions:itemPantsCrystalBlue>;
val palisBoots = <actuallyadditions:itemBootsCrystalBlue>;
val diamatineHelmet = <actuallyadditions:itemHelmCrystalLightBlue>;
val diamatineChest = <actuallyadditions:itemChestCrystalLightBlue>;
val diamatineLegs = <actuallyadditions:itemPantsCrystalLightBlue>;
val diamatineBoots = <actuallyadditions:itemBootsCrystalLightBlue>;
val voidHelmet = <actuallyadditions:itemHelmCrystalBlack>;
val voidChest = <actuallyadditions:itemChestCrystalBlack>;
val voidLegs = <actuallyadditions:itemPantsCrystalBlack>;
val voidBoots = <actuallyadditions:itemBootsCrystalBlack>;
val emeradicHelmet = <actuallyadditions:itemHelmCrystalGreen>;
val emeradicChest = <actuallyadditions:itemChestCrystalGreen>;
val emeradicLegs = <actuallyadditions:itemPantsCrystalGreen>;
val emeradicBoots = <actuallyadditions:itemBootsCrystalGreen>;
val enoriHelmet = <actuallyadditions:itemHelmCrystalWhite>;
val enoriChest = <actuallyadditions:itemChestCrystalWhite>;
val enoriLegs = <actuallyadditions:itemPantsCrystalWhite>;
val enoriBoots = <actuallyadditions:itemBootsCrystalWhite>;
val manasteelHelmet = <botania:manasteelHelm>;
val manasteelChest = <botania:manasteelChest>;
val manasteelLegs = <botania:manasteelLegs>;
val manasteelBoots = <botania:manasteelBoots>;
val manaweaveHelmet = <botania:manaweaveHelm>;
val manaweaveChest = <botania:manaweaveChest>;
val manaweaveLegs = <botania:manaweaveLegs>;
val manaweaveBoots = <botania:manaweaveBoots>;
val elementiumHelmet = <botania:elementiumHelm>;
val elementiumChest = <botania:elementiumChest>;
val elementiumLegs = <botania:elementiumLegs>;
val elementiumBoots = <botania:elementiumBoots>;
val terrasteelHelmet = <botania:terrasteelHelm>;
val terrasteelChest = <botania:terrasteelChest>;
val terrasteelLegs = <botania:terrasteelLegs>;
val terrasteelBoots = <botania:terrasteelBoots>;
val studdedHelmet = <dungeontactics:studded_helmet>;
val studdedChest = <dungeontactics:studded_chestplate>;
val studdedLegs = <dungeontactics:studded_leggings>;
val studdedBoots = <dungeontactics:studded_boots>;
val gildedHelmet = <dungeontactics:gilded_helmet>;
val gildedChest = <dungeontactics:gilded_chestplate>;
val gildedLegs = <dungeontactics:gilded_leggings>;
val gildedBoots = <dungeontactics:gilded_boots>;
val jewelledHelmet = <dungeontactics:jewelled_helmet>;
val jewelledChest = <dungeontactics:jewelled_chestplate>;
val jewelledLegs = <dungeontactics:jewelled_leggings>;
val jewelledBoots = <dungeontactics:jewelled_boots>;
val flightGoggles = <dungeontactics:flight_goggles>;
val battleHarness = <dungeontactics:battle_harness>;
val engineersDungarees = <dungeontactics:engineer_dungarees>;
val engineersDoorag = <dungeontactics:engineer_doorag>;
val darkSteelHelmet = <enderio:darkSteel_helmet>;
val darkSteelChest = <enderio:darkSteel_chestplate>;
val darkSteelLegs = <enderio:darkSteel_leggings>;
val darkSteelBoots = <enderio:darkSteel_boots>;
val faradayHelmet = <immersiveengineering:faradaySuit_head>;
val faradayChest = <immersiveengineering:faradaySuit_chest>;
val faradayLegs = <immersiveengineering:faradaySuit_legs>;
val faradayBoots = <immersiveengineering:faradaySuit_feet>;
val adamantiumHelmet = <imc:item_adamantium_helmet>;
val adamantiumChest = <imc:item_adamantium_chestplate>;
val adamantiumLegs = <imc:item_adamantium_leggings>;
val adamantiumBoots = <imc:item_adamantium_boots>;
val steelHelmet = <railcraft:armor_helmet_steel>;
val steelChest = <railcraft:armor_chestplate_steel>;
val steelLegs = <railcraft:armor_leggings_steel>;
val steelBoots = <railcraft:armor_boots_steel>;
val sylvanHelmet = <roots:druidRobesHead>;
val sylvanChest = <roots:druidRobesChest>;
val sylvanLegs = <roots:druidRobesLegs>;
val sylvanBoots = <roots:druidRobesBoots>;
val defenderHelmet = <roots:druidArmorHead>;
val defenderChest = <roots:druidArmorChest>;
val defenderLegs = <roots:druidArmorLegs>;
val defenderBoots = <roots:druidArmorBoots>;
val mageHelmet = <arsmagica2:helmet_mage>;
val mageChest = <arsmagica2:chest_mage>;
val mageLegs = <arsmagica2:legs_mage>;
val mageBoots = <arsmagica2:boots_mage>;
val battlemageHelmet = <arsmagica2:helmet_battlemage>;
val battlemageChest = <arsmagica2:chest_battlemage>;
val battlemageLegs = <arsmagica2:legs_battlemage>;
val battlemageBoots = <arsmagica2:boots_battlemage>;
val frame1Helmet = <silentgems:ArmorFrame>;
val frame1Chest = <silentgems:ArmorFrame:1>;
val frame1Legs = <silentgems:ArmorFrame:2>;
val frame1Boots = <silentgems:ArmorFrame:3>;
val frame1Lattice = <silentgems:CraftingMaterial:24>;
val frame2Helmet = <silentgems:ArmorFrame:4>;
val frame2Chest = <silentgems:ArmorFrame:5>;
val frame2Legs = <silentgems:ArmorFrame:6>;
val frame2Boots = <silentgems:ArmorFrame:7>;
val frame2Lattice = <silentgems:CraftingMaterial:25>;
val frame3Helmet = <silentgems:ArmorFrame:8>;
val frame3Chest = <silentgems:ArmorFrame:9>;
val frame3Legs = <silentgems:ArmorFrame:10>;
val frame3Boots = <silentgems:ArmorFrame:11>;
val frame3Lattice = <silentgems:CraftingMaterial:26>;
val silverHelmet = <iceandfire:armor_silverMetal_helmet>;
val silverChest = <iceandfire:armor_silverMetal_chestplate>;
val silverLegs = <iceandfire:armor_silverMetal_leggings>;
val silverBoots = <iceandfire:armor_silverMetal_boots>;
val scaleRedHelmet = <iceandfire:armor_red_helmet>;
val scaleRedChest = <iceandfire:armor_red_chestplate>;
val scaleRedLegs = <iceandfire:armor_red_leggings>;
val scaleRedBoots = <iceandfire:armor_red_boots>;
val scaleBronzeHelmet = <iceandfire:armor_bronze_helmet>;
val scaleBronzeChest = <iceandfire:armor_bronze_chestplate>;
val scaleBronzeLegs = <iceandfire:armor_bronze_leggings>;
val scaleBronzeBoots = <iceandfire:armor_bronze_boots>;
val scaleGreenHelmet = <iceandfire:armor_green_helmet>;
val scaleGreenChest = <iceandfire:armor_green_chestplate>;
val scaleGreenLegs = <iceandfire:armor_green_leggings>;
val scaleGreenBoots = <iceandfire:armor_green_boots>;
val scaleGrayHelmet = <iceandfire:armor_gray_helmet>;
val scaleGrayChest = <iceandfire:armor_gray_chestplate>;
val scaleGrayLegs = <iceandfire:armor_gray_leggings>;
val scaleGrayBoots = <iceandfire:armor_gray_boots>;
val scaleBlueHelmet = <iceandfire:armor_blue_helmet>;
val scaleBlueChest = <iceandfire:armor_blue_chestplate>;
val scaleBlueLegs = <iceandfire:armor_blue_leggings>;
val scaleBlueBoots = <iceandfire:armor_blue_boots>;
val scaleWhiteHelmet = <iceandfire:armor_white_helmet>;
val scaleWhiteChest = <iceandfire:armor_white_chestplate>;
val scaleWhiteLegs = <iceandfire:armor_white_leggings>;
val scaleWhiteBoots = <iceandfire:armor_white_boots>;
val scaleSilverHelmet = <iceandfire:armor_silver_helmet>;
val scaleSilverChest = <iceandfire:armor_silver_chestplate>;
val scaleSilverLegs = <iceandfire:armor_silver_leggings>;
val scaleSilverBoots = <iceandfire:armor_silver_boots>;
val scaleSapphireHelmet = <iceandfire:armor_sapphire_helmet>;
val scaleSapphireChest = <iceandfire:armor_sapphire_chestplate>;
val scaleSapphireLegs = <iceandfire:armor_sapphire_leggings>;
val scaleSapphireBoots = <iceandfire:armor_sapphire_boots>;
val dragonIron = <iceandfire:dragonarmor_iron:*>;
val dragonGold = <iceandfire:dragonarmor_gold:*>;
val dragonDiamond = <iceandfire:dragonarmor_diamond:*>;

var armour = [
	ironHelmet, ironChest, ironLegs, ironBoots,
	leatherHelmet, leatherChest, leatherLegs, leatherBoots,
	goldHelmet, goldChest, goldLegs, goldBoots,
	diamondHelmet, diamondChest, diamondLegs, diamondBoots,
	chainHelmet, chainChest, chainLegs, chainBoots,
	blackQuartzHelmet, blackQuartzChest, blackQuartzLegs, blackQuartzBoots,
	emeraldHelmet, emeraldChest, emeraldLegs, emeraldBoots,
	obsidianHelmet, obsidianChest, obsidianLegs, obsidianBoots,
	redstoniaHelmet, redstoniaChest, redstoniaLegs, redstoniaBoots,
	palisHelmet, palisChest, palisLegs, palisBoots,
	diamatineHelmet, diamatineChest, diamatineLegs, diamatineBoots,
	voidHelmet, voidChest, voidLegs, voidBoots,
	emeradicHelmet, emeradicChest, emeradicLegs, emeradicBoots,
	enoriHelmet, enoriChest, enoriLegs, enoriBoots,
	manasteelHelmet, manasteelChest, manasteelLegs, manasteelBoots,
	manaweaveHelmet, manaweaveChest, manaweaveLegs, manaweaveBoots,
	elementiumHelmet, elementiumChest, elementiumLegs, elementiumBoots,
	terrasteelHelmet, terrasteelChest, terrasteelLegs, terrasteelBoots,
	studdedHelmet, studdedChest, studdedLegs, studdedBoots,
	gildedHelmet, gildedChest, gildedLegs, gildedBoots,
	jewelledHelmet, jewelledChest, jewelledLegs, jewelledBoots,
	flightGoggles, battleHarness, engineersDungarees, engineersDoorag,
	sylvanHelmet, sylvanChest, sylvanLegs, sylvanBoots,
	defenderHelmet, defenderChest, defenderLegs, defenderBoots,
	darkSteelHelmet, darkSteelChest, darkSteelLegs, darkSteelBoots,
	faradayHelmet, faradayChest, faradayLegs, faradayBoots,
	adamantiumHelmet, adamantiumChest, adamantiumLegs, adamantiumBoots,
	steelHelmet, steelChest, steelLegs, steelBoots,
	mageHelmet, mageChest, mageLegs, mageBoots,
	battlemageHelmet, battlemageChest, battlemageLegs, battlemageBoots,
	frame1Helmet, frame1Chest, frame1Legs, frame1Boots, frame1Lattice,
	frame2Helmet, frame2Chest, frame2Legs, frame2Boots, frame2Lattice,
	frame3Helmet, frame3Chest, frame3Legs, frame3Boots, frame3Lattice,
	silverHelmet, silverChest, silverLegs, silverBoots,
	scaleRedHelmet, scaleRedChest, scaleRedLegs, scaleRedBoots,
	scaleBronzeHelmet, scaleBronzeChest, scaleBronzeLegs, scaleBronzeBoots,
	scaleGreenHelmet, scaleGreenChest, scaleGreenLegs, scaleGreenBoots,
	scaleGrayHelmet, scaleGrayChest, scaleGrayLegs, scaleGrayBoots,
	scaleBlueHelmet, scaleBlueChest, scaleBlueLegs, scaleBlueBoots,
	scaleWhiteHelmet, scaleWhiteChest, scaleWhiteLegs,scaleWhiteBoots,
	scaleSilverHelmet, scaleSilverChest, scaleSilverLegs, scaleSilverBoots,
	scaleSapphireHelmet, scaleSapphireChest, scaleSapphireLegs, scaleSapphireBoots,
	dragonIron, dragonGold, dragonDiamond
	] as IItemStack[];

//Remove Pure Daisy recipe
Apothecary.removeRecipe(pureDaisy);
pureDaisy.addTooltip(format.gold("Scavenged"));
recipes.addShapeless(blueprintPureDaisy, [pureDaisy.reuse(), paper]);
recipes.addShapeless(blueprintPureDaisy, [blueprintPureDaisy.reuse(), paper]);
blueprintPureDaisy.addTooltip(format.gold("Crafting only consumes paper"));

//Remove Enchanter recipe
recipes.remove(enchanter);
enchanter.addTooltip(format.gold("Scavenged"));
recipes.addShapeless(blueprintEnchanter, [enchanter.reuse(), paper]);
recipes.addShapeless(blueprintEnchanter, [blueprintEnchanter.reuse(), paper]);
blueprintEnchanter.addTooltip(format.gold("Crafting only consumes paper"));

//AA Drill core
recipes.remove(drillCore);
drillCore.addTooltip(format.gold("Scavenged"));
recipes.addShapeless(blueprintDrillCore, [drillCore.reuse(), paper]);
recipes.addShapeless(blueprintDrillCore, [blueprintDrillCore.reuse(), paper]);
blueprintDrillCore.addTooltip(format.gold("Crafting only consumes paper"));

//AA display stand
recipes.remove(displayStand);
displayStand.addTooltip(format.gold("Scavenged"));
recipes.addShapeless(blueprintDisplayStand, [displayStand.reuse(), displayStand.reuse(), displayStand.reuse(), displayStand.reuse(), empowerer.reuse(), paper]);
recipes.addShapeless(blueprintDisplayStand, [blueprintDisplayStand.reuse(), paper]);
blueprintDisplayStand.addTooltip(format.gold("Crafting only consumes paper"));

//Ability bottle
recipes.remove(abilityBottle);
abilityBottle.addTooltip(format.gold("Purchased from Archaeologist"));

//BM Snare
recipes.remove(snare);
snare.addTooltip(format.gold("Purchased from Hunter"));

//Farming Component
recipes.remove(farmingComponent);
brokenFarmer.addTooltip(format.gold("Scavenged"));
autoFarmers.add(cloche);
autoFarmers.add(farmerAA);
autoFarmers.add(farmingStation);
recipes.addShapeless(blueprintFarmingComponent, [autoFarmers.reuse(), paper]);
recipes.addShapeless(blueprintFarmingComponent, [blueprintFarmingComponent.reuse(), paper]);
blueprintFarmingComponent.addTooltip(format.gold("Crafting only consumes paper"));

//remove all the armour recipes
for i, armours in armour {
	recipes.remove(armours);
	armours.addTooltip(format.gold("Scavenged"));
}

//remove all the trap recipes
for j, trap in traps {
	recipes.remove(trap);
	trap.addTooltip(format.gold("Scavenged"));
}

//Grapple hook
recipes.remove(grappleBasic);
grappleBasic.addTooltip(format.gold("Scavenged"));
recipes.addShapeless(blueprintGrappleBasic, [grappleBasic.reuse(), paper]);
recipes.addShapeless(blueprintGrappleBasic, [blueprintGrappleBasic.reuse(), paper]);
blueprintGrappleBasic.addTooltip(format.gold("Crafting only consumes paper"));

//flight methods
recipes.remove(chaosRuneFlight);
chaosRuneFlight.addTooltip(format.red("Currently Unavailable"));
recipes.remove(angelRing);
angelRing.addTooltip(format.red("Currently Unavailable"));
recipes.remove(batWings);
batWings.addTooltip(format.red("Currently Unavailable"));

//Protection Talisman
recipes.remove(spawnPreventor);
spawnPreventor.addTooltip(format.gold("Slayer Contract Reward"));

//Bear trap
recipes.remove(bearTrap);
bearTrap.addTooltip(format.gold("Purchased from Hunter"));

//Basic Capacitor
recipes.remove(capacitorBasic);
capacitorBasic.addTooltip(format.gold("Purchased from Mad Scientist"));

//Spellbinding Cloth
recipes.remove(spellbindingCloth);
spellbindingCloth.addTooltip(format.gold("Purchased from Weaver"));

//Golden Bag
recipes.remove(goldenBag);
goldenBag.addTooltip(format.gold("Purchased from Weaver"));

//Rune Bag
recipes.remove(runeBag);
runeBag.addTooltip(format.gold("Purchased from Weaver"));

//Essence Bag
recipes.remove(essenceBag);
essenceBag.addTooltip(format.gold("Purchased from Weaver"));

//Flower Pouch
recipes.remove(flowerPouch);
flowerPouch.addTooltip(format.gold("Purchased from Weaver"));

//Shinies Bag
recipes.remove(shiniesBag);
shiniesBag.addTooltip(format.gold("Purchased from Weaver"));

//Dust Pouch
recipes.remove(dustPouch);
dustPouch.addTooltip(format.gold("Purchased from Weaver"));

//Ender Book
recipes.remove(enderBook);
enderBook.addTooltip(format.gold("Purchased from Librarian"));