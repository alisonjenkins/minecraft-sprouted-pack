////Imports
import minetweaker.data.IData;
import minetweaker.item.IItemStack;
import mods.actuallyadditions.Crusher;
import mods.actuallyadditions.AtomicReconstructor;

////Variables
//CNPC Crates and Barrels
val crateOak = <customnpcs:npcCrate>;
val crateSpruce = <customnpcs:npcCrate:1>;
val crateBirch = <customnpcs:npcCrate:2>;
val crateJungle = <customnpcs:npcCrate:3>;
val crateAcacia = <customnpcs:npcCrate:4>;
val crateDarkOak = <customnpcs:npcCrate:5>;
val barrelOak = <customnpcs:npcBarrel>;
val barrelSpruce = <customnpcs:npcBarrel:1>;
val barrelBirch = <customnpcs:npcBarrel:2>;
val barrelJungle = <customnpcs:npcBarrel:3>;
val barrelAcacia = <customnpcs:npcBarrel:4>;
val barrelDarkOak = <customnpcs:npcBarrel:5>;

//CNPC Banners
val bannerWood = <customnpcs:npcBanner>;
val bannerStone = <customnpcs:npcBanner:1>;
val bannerIron = <customnpcs:npcBanner:2>;
val bannerGold = <customnpcs:npcBanner:3>;
val bannerDiamond = <customnpcs:npcBanner:4>;
val bannerWallWood = <customnpcs:npcWallBanner>;
val bannerWallStone = <customnpcs:npcWallBanner:1>;
val bannerWallIron = <customnpcs:npcWallBanner:2>;
val bannerWallGold = <customnpcs:npcWallBanner:3>;
val bannerWallDiamond = <customnpcs:npcWallBanner:4>;

//CNPC Lamps
val lampWood = <customnpcs:npcTallLamp>;
val lampStone = <customnpcs:npcTallLamp:1>;
val lampIron = <customnpcs:npcTallLamp:2>;
val lampGold = <customnpcs:npcTallLamp:3>;
val lampDiamond = <customnpcs:npcTallLamp:4>;

//CNPC chairs
val chairOak = <customnpcs:npcChair>;
val chairSpruce = <customnpcs:npcChair:1>;
val chairBirch = <customnpcs:npcChair:2>;
val chairJungle = <customnpcs:npcChair:3>;
val chairAcacia = <customnpcs:npcChair:4>;
val chairDarkOak = <customnpcs:npcChair:5>;

//CNPC weapon racks
val rackOak = <customnpcs:npcWeaponRack>;
val rackSpruce = <customnpcs:npcWeaponRack:1>;
val rackBirch = <customnpcs:npcWeaponRack:2>;
val rackJungle = <customnpcs:npcWeaponRack:3>;
val rackAcacia = <customnpcs:npcWeaponRack:4>;
val rackDarkOak = <customnpcs:npcWeaponRack:5>;

//Misc
val planksOak = <minecraft:planks>;
val planksSpruce = <minecraft:planks:1>;
val planksBirch = <minecraft:planks:2>;
val planksJungle = <minecraft:planks:3>;
val planksAcacia = <minecraft:planks:4>;
val planksDarkOak = <minecraft:planks:5>;
val planks = <ore:plankWood>;
val slab = <ore:slabWood>;
val stick = <ore:stickWood>;
val chest = <ore:chest>;
val woolBlack = <minecraft:wool:15>;
val woolRed = <minecraft:wool:14>;
val woolGreen = <minecraft:wool:13>;
val woolBrown = <minecraft:wool:12>;
val woolBlue = <minecraft:wool:11>;
val woolAll = <minecraft:wool:*>;
val ingotIron = <ore:ingotIron>;
val ingotGold = <ore:ingotGold>;
val diamond = <ore:gemDiamond>;
val stone = <ore:stone>;
val flint = <minecraft:flint>;
val wormWS = <waterstrainer:worm>;
val wormAA = <actuallyadditions:itemWorm>;
val upgradeNesting = <ironbackpacks:upgrade:5>;
val upgradeNestingAdv = <ironbackpacks:upgrade:6>;
val upgradeBase = <ironbackpacks:crafting>;
val egg = <ore:egg>;
val chickenNest = <animania:block_nest>;
val birdsnest = <birdsnests:birdsnest>;
val nest = <ore:nest>;
val redstone = <minecraft:redstone>;
val tinCan = <aquaculture:loot:2>;
val ingotTin = <railcraft:ingot:2>;
val ingotBronzeRC = <railcraft:ingot:5>;
val soulVialVillager = <enderio:itemSoulVessel:1>.withTag({entityId: "Villager"});
val soulVialSnowVillager = <enderio:itemSoulVessel:1>.onlyWithTag({entityId: "iceandfire.snowvillager"});
val crateAASmall = <actuallyadditions:blockGiantChest>;
val chestFlint = <lit:ImprovedChestBlock>;
val woodCasing = <actuallyadditions:blockMisc:4>;
val grappleBasic = <grapplemod:grapplinghook>;
val grappleMotorized = <grapplemod:hookshot>;
val motor = <supermultidrills:DrillMotor:*>;
val carvingWood = <literalascension:wood_carving_tool:*>;
val carvingStone = <literalascension:stone_carving_tool:*>;
val carvingIron = <literalascension:iron_carving_tool:*>;
val carvingGold = <literalascension:gold_carving_tool:*>;
val carvingDiamond = <literalascension:diamond_carving_tool:*>;
val chiselIron = <chisel:chisel_iron:*>;
val chiselDiamond = <chisel:chisel_diamond:*>;
val chiselBitStone = <chiselsandbits:chisel_stone:*>;
val chiselBitIron = <chiselsandbits:chisel_iron:*>;
val chiselBitGold = <chiselsandbits:chisel_gold:*>;
val chiselBitDiamond = <chiselsandbits:chisel_diamond:*>;
val carvingTools = [carvingWood, carvingStone, carvingIron, carvingGold, carvingDiamond, chiselIron, chiselDiamond] as IItemStack[];
val blankRune = <arsmagica2:blank_rune>;
val arcaneEssence = <arsmagica2:essence:1>;
val cobble = <ore:cobblestone>;
val sharpFlint = <flintmod:toolPartFlint>;
val present = <imc:item_present>;
val pigFat = <arsmagica2:item_ore:8>;
val primeBaconRaw = <animania:raw_prime_bacon>;
val carvingKnife = <animania:carving_knife:*>;
val doorIron = <minecraft:iron_door>;
val cloth = <quadrum:cloth>;
val clothMerino = <quadrum:clothMerino>;
val rodIron = <immersiveengineering:material:1>;
val itemString = <minecraft:string>;
val needleThread = <quadrum:needleThread>;
val silk = <customnpcs:npcSilk>;
val manaweaveCloth = <botania:manaResource:22>;
val manaString = <botania:manaResource:16>;
val woolMerino = <ore:woolMerino>;
val woolCloth = <ore:woolCloth>;
val woolMerinoBrown = <animania:wool_merino_brown>;
val woolMerinoWhite = <animania:wool_merino_white>;
val woolSuffolkBrown = <animania:wool_suffolk_brown>;
val woolDorsetBrown = <animania:wool_dorset_brown>;
val woolFriesianBlack = <animania:wool_friesian_black>;
val woolFriesianBrown = <animania:wool_friesian_brown>;
val woolJacob = <animania:wool_jacob>;
val woolWhite = <minecraft:wool>;
val mageHead = <arsmagica2:helmet_mage>;
val mageChest = <arsmagica2:chest_mage>;
val mageLegs = <arsmagica2:legs_mage>;
val mageBoots = <arsmagica2:boots_mage>;
val leather = <minecraft:leather>;
val bottleWater = <minecraft:potion>.onlyWithTag({Potion: "minecraft:water"});
val coal = <minecraft:coal>;
val gunpowder = <minecraft:gunpowder>;
val feather = <ore:feather>;
val runePurple = <arsmagica2:rune:5>;
val runeWhite = <arsmagica2:rune:15>;
val runeYellow = <arsmagica2:rune:11>;
val runeBlack = <arsmagica2:rune:0>;
val lensMana = <botania:lens>;
val lensPaintslinger = <botania:lens:14>;
val ingotElementium = <botania:manaResource:7>;
val bedBrown = <quark:colored_bed_item:12>;
val bedBlack = <quark:colored_bed_item:14>;
val bedWhite = <quark:colored_bed_item>;
val bedLightGrey = <quark:colored_bed_item:8>;
val buildingTool = <minecolonies:scepterGold>;
val scanTool = <minecolonies:scepterSteel>;
val dyeYellow = <ore:dyeYellow>;
val dyeWhite = <ore:dyeWhite>;
val restoniaCrystal = <actuallyadditions:itemCrystal>;
val blackQuartz = <actuallyadditions:itemMisc:5>;
val casingIron = <actuallyadditions:blockMisc:9>;
val portableCraftingAA = <actuallyadditions:itemCrafterOnAStick>;
val SGTip = <silentgems:TipUpgrade>;
val drillHead = <supermultidrills:DrillHead:*>;
val drillMotor = <supermultidrills:DrillMotor>;
val drillBattery = <supermultidrills:DrillBattery>;
val drillChassis = <supermultidrills:DrillChassis>;
val guideBook = <gbook:guidebook>.withTag({Book: "gbook:xml/guidebook.xml"});
val jellyfish = <aquaculture:fish:16>;
val slimeball = <minecraft:slime_ball>;
val leech = <aquaculture:fish:19>;
val lifeFruit = <terraqueous:multifood:12>;
val deathFruit = <terraqueous:multifood:13>;
val sugar = <minecraft:sugar>;
val goldenCarrot = <minecraft:golden_carrot>;
val improvedFurnace = <lit:ImprovedFurnaceBlock>;
val blazestone = <silentgems:CraftingMaterial:27>;
val enderEssence = <silentgems:CraftingMaterial:4>;
val enderEssenceShard = <silentgems:CraftingMaterial:5>;
val dustEndimium = <terraqueous:item_main:253>;
val dustDiamond = <ore:dustDiamond>;
val dustEnder = <ore:dustEnder>;
val gemAlexandrite = <silentgems:Gem:31>;
val gemMorganite = <silentgems:Gem:13>;
val gemAmber = <silentgems:Gem:3>;
val gemOnyx = <silentgems:Gem:14>;
val gemHeliodor = <silentgems:Gem:4>;
val gemOpal = <silentgems:Gem:15>;
val gemCitrine = <silentgems:Gem:18>;
val gemSapphire = <silentgems:Gem:9>;
val gemJasper = <silentgems:Gem:19>;
val gemCarnelian = <silentgems:Gem:16>;
val heartBottle = <dungeontactics:heart_jar>;
val heartDrop = <dungeontactics:heart_drop>;
val bottleEmpty = <minecraft:glass_bottle>;
//Tokens
val tokenBlank = <silentgems:EnchantmentToken:256>;
val tokenNightVision = <silentgems:EnchantmentToken>.withTag({TokenEnchantments: [{lvl: 1 as short, name: "astralsorcery:enchantment.as.nightvision"}]});
val tokenTechnophobic = <silentgems:EnchantmentToken>.withTag({TokenEnchantments: [{lvl: 1 as short, name: "wired:technophobic"}]});
val tokenRuned = <silentgems:EnchantmentToken>.withTag({TokenEnchantments: [{lvl: 1 as short, name: "dungeontactics:runed"}]});
val tokenHealthBonus = <silentgems:EnchantmentToken>.withTag({TokenEnchantments: [{lvl: 1 as short, name: "imc:enchantment_health_bonus"}]});
val tokenMagicResist = <silentgems:EnchantmentToken>.withTag({TokenEnchantments: [{lvl: 1 as short, name: "arsmagica2:magicResist"}]});
val tokenSmelting = <silentgems:EnchantmentToken>.withTag({TokenEnchantments: [{lvl: 1 as short, name: "dungeontactics:smelting"}]});
val tokenBerserking = <silentgems:EnchantmentToken>.withTag({TokenEnchantments: [{lvl: 1 as short, name: "dungeontactics:berserking"}]});
val tokenSoulbound = <silentgems:EnchantmentToken>.withTag({TokenEnchantments: [{lvl: 1 as short, name: "arsmagica2:soulbound"}]});
val tokenHealthDraining = <silentgems:EnchantmentToken>.withTag({TokenEnchantments: [{lvl: 1 as short, name: "imc:enchantment_health_draining"}]});
val tokenSpeed = <silentgems:EnchantmentToken>.withTag({TokenEnchantments: [{lvl: 1 as short, name: "imc:enchantment_speed"}]});
val tokenLifeSteal = <silentgems:EnchantmentToken>.withTag({TokenEnchantments: [{lvl: 1 as short, name: "silentgems:LifeSteal"}]});
//farmers
val cloche = <immersiveengineering:metalDevice1:13>;
val farmerAA = <actuallyadditions:blockFarmer>;
val farmingStation = <enderio:blockFarmStation>;
val hoeJewelled = <dungeontactics:jewelled_hoe>;
val ingotElectricalSteel = <enderio:itemAlloy>;
val machineChassis = <enderio:itemMachinePart>;
val pulsatingCrystal = <enderio:itemMaterial:5>;
val zLogicController = <enderio:itemFrankenSkull:1>;
var seedAll = <ore:listAllseed>;
val blockEnori = <actuallyadditions:blockCrystal:5>;
val glass = <ore:blockGlass>;
val woodTreated = <ore:plankTreatedWood>;
val mechanicalComponentIron = <immersiveengineering:material:8>;
val lantern = <immersiveengineering:metalDecoration2:4>;
val farmingComponent = <quadrum:farmingComponent>;
val saplings = <ore:treeSapling>;
val gearBasic = <enderio:itemMachinePart:1>;
val plateIron = <ore:plateIron>;
val brokenFarmer = <quadrum:brokenFarmer>;
val capacitorDamaged = <quadrum:damagedCapacitor>;
val capacitorBasic = <enderio:itemBasicCapacitor>;
val petals = <botania:petal:*>;
val runicStaff = <runesofwizardry:runic_staff>;
val machineBlockRFT = <rftools:machine_frame>;
val palis = <actuallyadditions:itemCrystal:1>;
val gemGoldenBeryl = <silentgems:Gem:20>;
val gemGarnet = <silentgems:Gem:1>;
val crystalBurnium = <terraqueous:item_main:50>;
val gemBlackDiamondS = <silentgems:Gem:62>;
val dimensionalShard = <rftools:dimensional_shard>;
val machineInfuser = <rftools:machine_infuser>;
//bags
val goldenBag = <extrautils2:bagofholding>;
val runeBag = <arsmagica2:rune_bag>;
val essenceBag = <arsmagica2:essence_bag>;
val flowerPouch = <botania:flowerBag>;
val shiniesBag = <gemulation:GemBagItem:*>;
val dustPouch = <runesofwizardry:dust_pouch>;
//basic tools
val starterAxe = <imc:item_flint_hatchet:50>;
//Heart crystal
val heartContainer = <scalinghealth:HeartContainer>;
val heartCrystalShard = <scalinghealth:CrystalShard>;

//Add recipe for basic hatchet
recipes.addShaped(starterAxe, [[flint, stick], [null, stick]]);

//recipe for exchanging worm types
recipes.addShapeless(wormAA, [wormWS]);
recipes.addShapeless(wormWS, [wormAA]);
//recipe for usage for leeches
recipes.addShapeless(wormWS, [leech]);

//remove heart container recipe
recipes.remove(heartContainer);
heartContainer.addTooltip(format.gold("Made by someone"));
heartCrystalShard.addTooltip(format.gold("Maybe someone knows what to do with these..?"));

//cloth recipes
woolCloth.add(woolDorsetBrown);
woolCloth.add(woolSuffolkBrown);
woolCloth.add(woolJacob);
woolMerino.add(woolMerinoBrown);
woolMerino.add(woolMerinoWhite);
woolDorsetBrown.addTooltip(format.blue("Can be made into Cloth"));
woolSuffolkBrown.addTooltip(format.blue("Can be made into Cloth"));
woolJacob.addTooltip(format.blue("Can be made into Cloth"));
woolMerinoBrown.addTooltip(format.blue("Can be made into Cloth"));
woolMerinoWhite.addTooltip(format.blue("Can be made into Cloth"));
woolWhite.addTooltip(format.blue("Shorn from Friesian, Suffolk, Dorper and Dorset Sheep, Angora Goats"));
recipes.addShapeless(needleThread, [rodIron, itemString]);
recipes.addShapeless(cloth, [woolCloth, needleThread.reuse()]);
recipes.addShapeless(clothMerino, [woolMerino, needleThread.reuse()]);

//tweak magerobe recipes
recipes.remove(mageHead);
recipes.remove(mageChest);
recipes.remove(mageLegs);
recipes.remove(mageBoots);
recipes.addShaped(mageHead, [[clothMerino, leather, clothMerino], [clothMerino, runePurple, clothMerino], [null, bottleWater, null]]);
recipes.addShaped(mageChest, [[runeWhite, coal, runeWhite], [clothMerino, leather, clothMerino], [clothMerino, clothMerino, clothMerino]]);
recipes.addShaped(mageLegs, [[clothMerino, runeYellow, clothMerino] ,[clothMerino, gunpowder, clothMerino], [leather, null, leather]]);
recipes.addShaped(mageBoots, [[runeBlack, null, runeBlack], [leather, null, leather], [clothMerino, feather, clothMerino]]);

//Extra bed recipes
recipes.addShaped(bedBlack, [[woolFriesianBlack, woolFriesianBlack, woolFriesianBlack], [planks, planks, planks]]);
recipes.addShaped(bedBrown, [[woolFriesianBrown, woolFriesianBrown, woolFriesianBrown], [planks, planks, planks]]);
recipes.addShaped(bedBrown, [[woolSuffolkBrown, woolSuffolkBrown, woolSuffolkBrown], [planks, planks, planks]]);
recipes.addShaped(bedBrown, [[woolDorsetBrown, woolDorsetBrown, woolDorsetBrown], [planks, planks, planks]]);
recipes.addShaped(bedBrown, [[woolMerinoBrown, woolMerinoBrown, woolMerinoBrown], [planks, planks, planks]]);
recipes.addShaped(bedWhite, [[woolMerinoWhite, woolMerinoWhite, woolMerinoWhite], [planks, planks, planks]]);
recipes.addShaped(bedLightGrey, [[woolJacob, woolJacob, woolJacob], [planks, planks, planks]]);

//tweak paintslinger lens recipe
recipes.remove(lensPaintslinger);
recipes.addShaped(lensPaintslinger, [[null, ingotElementium, null] , [woolJacob, lensMana, woolJacob], [null, ingotElementium, null]]);

//tweak manaweave cloth recipe
recipes.remove(manaweaveCloth);
recipes.addShaped(manaweaveCloth, [[null, manaString, null], [manaString, cloth, manaString], [null, manaString, null]]);

//Rune Bag
recipes.remove(runeBag);
recipes.addShaped(runeBag, [[itemString, null, itemString], [clothMerino, blankRune, clothMerino], [clothMerino, clothMerino, clothMerino]]);

//Essence Bag
recipes.remove(essenceBag);
recipes.addShaped(essenceBag, [[itemString, null, itemString], [clothMerino, arcaneEssence, clothMerino], [clothMerino, clothMerino, clothMerino]]);

//Flower Pouch
recipes.remove(flowerPouch);
recipes.addShaped(flowerPouch, [[cloth, petals, cloth], [cloth, null, cloth], [null, cloth, null]]);

//Dust Pouch
recipes.remove(dustPouch);
recipes.addShaped(dustPouch, [[null, itemString, null], [clothMerino, runicStaff, clothMerino], [null, clothMerino, null]]);

//change nesting upgrade recipe to incorporate actual nests
nest.add(chickenNest);
nest.add(birdsnest);
recipes.remove(upgradeNesting);
recipes.remove(upgradeNestingAdv);
recipes.addShaped(upgradeNesting, [[redstone, nest, redstone], [egg, upgradeBase, egg], [redstone, nest, redstone]]);
recipes.addShaped(upgradeNestingAdv, [[redstone, nest, redstone], [egg, upgradeNesting, egg], [redstone, nest, redstone]]);

//change tin can smelting to give tin rather than iron
furnace.remove(<*>, tinCan);
furnace.addRecipe(ingotTin, tinCan, 0.7);

//remove rc bronze recipe
recipes.remove(ingotBronzeRC);

//AM2 blank rune crafted using carvingtools
recipes.remove(blankRune);
for k, carver in carvingTools {
	recipes.addShapeless(blankRune, [carver.transformDamage(), cobble, cobble, cobble]);
}

//tweak AA crate recipe a bit
recipes.remove(crateAASmall);
recipes.addShaped(crateAASmall, [[chestFlint, planks, chestFlint], [chestFlint, woodCasing, chestFlint], [chestFlint, planks, chestFlint]]);

//Tweak motorized grapple recipe
recipes.remove(grappleMotorized);
recipes.addShapeless(grappleMotorized, [grappleBasic, motor]);

//remove recipe for sharpened flint
recipes.remove(sharpFlint);

//tooltip for presents
present.addTooltip(format.gold("Hold Right-Click to unwrap!"));

//tooltip for Silk
silk.addTooltip(format.gold("Purchased from Weaver"));

//add recipe to craft pig fat from raw bacon
recipes.addShapeless(pigFat, [primeBaconRaw, carvingKnife]);

//reduce iron doors recipe back down to give 1
recipes.remove(doorIron);
recipes.addShaped(doorIron, [[ingotIron, ingotIron], [ingotIron, ingotIron], [ingotIron, ingotIron]]);

//change recipe for building tool
recipes.remove(buildingTool);
recipes.addShaped(buildingTool, [[null, dyeYellow, cobble], [null, stick, dyeYellow], [stick, null, null]]);

//change recipe for scan tool
recipes.remove(scanTool);
recipes.addShaped(scanTool, [[null, dyeWhite, cobble], [null, stick, dyeWhite], [stick, null, null]]);

//Iron casing recipe
recipes.remove(casingIron);
recipes.addShaped(casingIron, [[ingotIron, gemGarnet, ingotIron], [restoniaCrystal, blackQuartz, restoniaCrystal], [ingotIron, gemGarnet, ingotIron]]);
restoniaCrystal.addTooltip(format.gold("Purchased from Mad Scientist"));

//Machine Frame recipe
recipes.remove(machineBlockRFT);
recipes.addShaped(machineBlockRFT, [[ingotIron, palis, ingotIron], [gemGoldenBeryl, null, gemGoldenBeryl], [ingotIron, palis, ingotIron]]);

//machine infuser recipe
recipes.remove(machineInfuser);
recipes.addShaped(machineInfuser, [[dimensionalShard, crystalBurnium, dimensionalShard], [gemBlackDiamondS, machineBlockRFT, gemBlackDiamondS], [dimensionalShard, crystalBurnium, dimensionalShard]]);

//Autofarm recipe tweaks
recipes.addShaped(farmingComponent, [[null, saplings, null], [gearBasic, plateIron, gearBasic], [null, seedAll, null]]);
recipes.remove(farmerAA);
recipes.addShaped(farmerAA, [[blockEnori, hoeJewelled, blockEnori], [farmingComponent, casingIron, farmingComponent], [blockEnori, seedAll, blockEnori]]);
recipes.remove(farmingStation);
recipes.addShaped(farmingStation, [[ingotElectricalSteel, hoeJewelled, ingotElectricalSteel], [farmingComponent, machineChassis, farmingComponent], [pulsatingCrystal, zLogicController, pulsatingCrystal]]);
recipes.remove(cloche);
recipes.addShaped(cloche, [[farmingComponent, lantern, farmingComponent], [glass, hoeJewelled, glass], [woodTreated, mechanicalComponentIron, woodTreated]]);

//Add recipes for crates
recipes.addShaped(crateOak, [[planksOak, stick, planksOak], [stick, chest, stick], [planksOak, stick, planksOak]]);
recipes.addShaped(crateSpruce, [[planksSpruce, stick, planksSpruce], [stick, chest, stick], [planksSpruce, stick, planksSpruce]]);
recipes.addShaped(crateBirch, [[planksBirch, stick, planksBirch], [stick, chest, stick], [planksBirch, stick, planksBirch]]);
recipes.addShaped(crateJungle, [[planksJungle, stick, planksJungle], [stick, chest, stick], [planksJungle, stick, planksJungle]]);
recipes.addShaped(crateAcacia, [[planksAcacia, stick, planksAcacia], [stick, chest, stick], [planksAcacia, stick, planksAcacia]]);
recipes.addShaped(crateDarkOak, [[planksDarkOak, stick, planksDarkOak], [stick, chest, stick], [planksDarkOak, stick, planksDarkOak]]);
//recipes.addShaped(crateOak, [[planks, stick, planks], [stick, chest, stick], [planks, stick, planks]]);

//Add recipes for barrels
recipes.addShaped(barrelOak, [[planksOak, slab, planksOak], [planksOak, chest, planksOak], [planksOak, slab, planksOak]]);
recipes.addShaped(barrelOak, [[planks, slab, planks], [planks, chest, planks], [planks, slab, planks]]);
recipes.addShaped(barrelSpruce, [[planksSpruce, slab, planksSpruce], [planksSpruce, chest, planksSpruce], [planksSpruce, slab, planksSpruce]]);
recipes.addShaped(barrelBirch, [[planksBirch, slab, planksBirch], [planksBirch, chest, planksBirch], [planksBirch, slab, planksBirch]]);
recipes.addShaped(barrelJungle, [[planksJungle, slab, planksJungle], [planksJungle, chest, planksJungle], [planksJungle, slab, planksJungle]]);
recipes.addShaped(barrelAcacia, [[planksAcacia, slab, planksAcacia], [planksAcacia, chest, planksAcacia], [planksAcacia, slab, planksAcacia]]);
recipes.addShaped(barrelDarkOak, [[planksDarkOak, slab, planksDarkOak], [planksDarkOak, chest, planksDarkOak], [planksDarkOak, slab, planksDarkOak]]);
//recipes.addShaped(barrelOak, [[planks, slab, planks], [planks, chest, planks], [planks, slab, planks]]);

//Add recipes for banners
recipes.addShaped(bannerWood, [[woolBlack], [woolBlack], [planks]]);
recipes.addShaped(bannerWallWood, [[planks], [woolBlack], [woolBlack]]);
recipes.addShaped(bannerStone, [[woolRed], [woolRed], [stone]]);
recipes.addShaped(bannerWallStone, [[stone], [woolRed], [woolRed]]);
recipes.addShaped(bannerIron, [[woolGreen], [woolGreen], [ingotIron]]);
recipes.addShaped(bannerWallIron, [[ingotIron], [woolGreen], [woolGreen]]);
recipes.addShaped(bannerGold, [[woolBrown], [woolBrown], [ingotGold]]);
recipes.addShaped(bannerWallGold, [[ingotGold], [woolBrown], [woolBrown]]);
recipes.addShaped(bannerDiamond, [[woolBlue], [woolBlue], [diamond]]);
recipes.addShaped(bannerWallDiamond, [[diamond], [woolBlue], [woolBlue]]);

//Add recipes for lamps
recipes.addShaped(lampWood, [[woolBlack], [stick], [planks]]);
recipes.addShaped(lampStone, [[woolRed], [stick], [stone]]);
recipes.addShaped(lampIron, [[woolGreen], [stick], [ingotIron]]);
recipes.addShaped(lampGold, [[woolBrown], [stick], [ingotGold]]);
recipes.addShaped(lampDiamond, [[woolBlue], [stick], [diamond]]);

//add recipes for chairs
recipes.addShaped(chairOak, [[planksOak, null], [planksOak, planksOak], [stick, stick]]);
recipes.addShaped(chairSpruce, [[planksSpruce, null], [planksSpruce, planksSpruce], [stick, stick]]);
recipes.addShaped(chairBirch, [[planksBirch, null], [planksBirch, planksBirch], [stick, stick]]);
recipes.addShaped(chairJungle, [[planksJungle, null], [planksJungle, planksJungle], [stick, stick]]);
recipes.addShaped(chairAcacia, [[planksAcacia, null], [planksAcacia, planksAcacia], [stick, stick]]);
recipes.addShaped(chairDarkOak, [[planksDarkOak, null], [planksDarkOak, planksDarkOak], [stick, stick]]);

//recipes for weapon racks
recipes.addShaped(rackOak, [[stick, stick, stick], [stick, null, stick], [stick, planksOak, stick]]);
recipes.addShaped(rackSpruce, [[stick, stick, stick], [stick, null, stick], [stick, planksSpruce, stick]]);
recipes.addShaped(rackBirch, [[stick, stick, stick], [stick, null, stick], [stick, planksBirch, stick]]);
recipes.addShaped(rackJungle, [[stick, stick, stick], [stick, null, stick], [stick, planksJungle, stick]]);
recipes.addShaped(rackAcacia, [[stick, stick, stick], [stick, null, stick], [stick, planksAcacia, stick]]);
recipes.addShaped(rackDarkOak, [[stick, stick, stick], [stick, null, stick], [stick, planksDarkOak, stick]]);

//remove AA portable crafting table
recipes.remove(portableCraftingAA);

//add crusher recipe for breaking down brokenFarmer
Crusher.addRecipe(brokenFarmer, farmingComponent * 2, capacitorDamaged, 30);
mods.immersiveengineering.Crusher.addRecipe(farmingComponent * 2, brokenFarmer, 40000, capacitorDamaged, 0.7);

//repairing damaged capacitors
AtomicReconstructor.addRecipe(capacitorDamaged, capacitorBasic, 2000);

//tooltip for tool tips
SGTip.addTooltip(format.gold("Craft with SG tool to apply"));

//tooltips for multidrills
drillHead.addTooltip(format.gold("Craft with Drill Motor, Battery and Chassis"));
drillMotor.addTooltip(format.gold("Craft with Drill Head, Battery and Chassis"));
drillBattery.addTooltip(format.gold("Craft with Drill Head, Motor and Chassis"));
drillChassis.addTooltip(format.gold("Craft with Drill Head, Motor and Battery"));

//remove irrelevant recipe for guidebook
recipes.remove(guideBook);

//give use to jellyfish
recipes.addShapeless(slimeball, [jellyfish]);

//tweak endimium recipe
recipes.remove(dustEndimium);
recipes.addShapeless(dustEndimium, [dustEnder, dustDiamond, enderEssenceShard, enderEssenceShard, enderEssenceShard]);

////token recipe tweaks
//give use to leech by tweaking life steal recipe
recipes.remove(tokenLifeSteal);
recipes.addShaped(tokenLifeSteal, [[gemMorganite, null, gemMorganite], [null, tokenBlank, null], [leech, leech, leech]]);
//Health Bonus
recipes.addShaped(tokenHealthBonus, [[gemAmber, null, gemAmber], [lifeFruit, tokenBlank, lifeFruit], [lifeFruit, null, lifeFruit]]);
//Health Draining
recipes.addShaped(tokenHealthDraining, [[gemOnyx, null, gemOnyx], [deathFruit, tokenBlank, deathFruit], [deathFruit, null, deathFruit]]);
//Speed
recipes.addShaped(tokenSpeed, [[gemHeliodor, null, gemHeliodor], [sugar, tokenBlank, sugar], [sugar, sugar, sugar]]);
//Night Vision
recipes.addShaped(tokenNightVision, [[gemOpal, null, gemOpal], [null, tokenBlank, null], [goldenCarrot, goldenCarrot, goldenCarrot]]);
//Technophobic
recipes.addShaped(tokenTechnophobic, [[gemCitrine, null, gemCitrine], [null, tokenBlank, null], [capacitorDamaged, null, capacitorDamaged]]);
//Runed
recipes.addShaped(tokenRuned, [[gemMorganite, null, gemMorganite], [blankRune, tokenBlank, blankRune], [blankRune, blankRune, blankRune]]);
//Magic Resistance
recipes.addShaped(tokenMagicResist, [[gemSapphire, null, gemSapphire], [null, tokenBlank, null], [manaweaveCloth, manaweaveCloth, manaweaveCloth]]);
//Smelting
recipes.addShaped(tokenSmelting, [[gemJasper, null, gemJasper], [null, tokenBlank, null], [improvedFurnace, null, improvedFurnace]]);
//Berserking
recipes.addShaped(tokenBerserking, [[gemCarnelian, null, gemCarnelian], [blazestone, tokenBlank, blazestone], [blazestone, null, blazestone]]);
//Soulbound
recipes.addShaped(tokenSoulbound, [[gemAlexandrite, null, gemAlexandrite], [enderEssence, tokenBlank, enderEssence], [enderEssence, null, enderEssence]]);

//Make annoying heart drops usable if they're collected by mob farms
recipes.addShapeless(heartBottle, [bottleEmpty, heartDrop]);