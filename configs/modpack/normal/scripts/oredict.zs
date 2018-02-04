////Imports
import minetweaker.data.IData;
import minetweaker.item.IItemStack;

////Variables
///Meats
//Chicken
val chickenRawOrpington = <animania:raw_orpington_chicken>;
val chickenRawPlymouthRock = <animania:raw_plymouth_rock_chicken>;
val chickenRawWyandotte = <animania:raw_wyandotte_chicken>;
val chickenRawRhodeIslandRed = <animania:raw_rhode_island_red_chicken>;
val chickenRawVanilla = <minecraft:chicken>;
val chickenRawPrime = <animania:raw_prime_chicken>;
val chickenCookedOrpington = <animania:cooked_orpington_chicken>;
val chickenCookedPlymouthRock = <animania:cooked_plymouth_rock_chicken>;
val chickenCookedWyandotte = <animania:cooked_wyandotte_chicken>;
val chickenCookedRhodeIslandRed = <animania:cooked_rhode_island_red_chicken>;
val chickenCookedVanilla = <minecraft:cooked_chicken>;
val chickenCookedPrime = <animania:cooked_prime_chicken>;
//Beef
val beefRawHereford = <animania:raw_hereford_beef>;
val beefRawLonghorn = <animania:raw_longhorn_beef>;
val beefRawAngus = <animania:raw_angus_beef>;
val beefRawVanilla = <minecraft:beef>;
val beefRawPrime = <animania:raw_prime_beef>;
val beefCookedHereford = <animania:cooked_hereford_roast>;
val beefCookedLonghorn = <animania:cooked_longhorn_roast>;
val beefCookedAngus = <animania:cooked_angus_roast>;
val beefCookedVanilla = <minecraft:cooked_beef>;
val beefCookedPrime = <animania:cooked_prime_beef>;
val steakRawHereford = <animania:raw_hereford_steak>;
val steakRawLonghorn = <animania:raw_longhorn_steak>;
val steakRawAngus = <animania:raw_angus_steak>;
val steakRawPrime = <animania:raw_prime_steak>;
val steakCookedHereford = <animania:cooked_hereford_steak>;
val steakCookedLonghorn = <animania:cooked_longhorn_steak>;
val steakCookedAngus = <animania:cooked_angus_steak>;
val steakCookedPrime = <animania:cooked_prime_steak>;
//Pork
val porkRawLargeBlack = <animania:raw_large_black_pork>;
val porkRawDuroc = <animania:raw_duroc_pork>;
val porkRawOldSpot = <animania:raw_old_spot_pork>;
val porkRawHampshire = <animania:raw_hampshire_pork>;
val porkRawVanilla = <minecraft:porkchop>;
val porkRawPrime = <animania:raw_prime_pork>;
val porkCookedLargeBlack = <animania:cooked_large_black_roast>;
val porkCookedDuroc = <animania:cooked_duroc_roast>;
val porkCookedOldSpot = <animania:cooked_old_spot_roast>;
val porkCookedHampshire = <animania:cooked_hampshire_roast>;
val porkCookedVanilla = <minecraft:cooked_porkchop>;
val porkCookedPrime = <animania:cooked_prime_pork>;
val baconRawLargeBlack = <animania:raw_large_black_bacon>;
val baconRawDuroc = <animania:raw_duroc_bacon>;
val baconRawOldSpot = <animania:raw_old_spot_bacon>;
val baconRawHampshire = <animania:raw_hampshire_bacon>;
val baconRawPrime = <animania:raw_prime_bacon>;
val baconCookedLargeBlack = <animania:cooked_large_black_bacon>;
val baconCookedDuroc = <animania:cooked_duroc_bacon>;
val baconCookedOldSpot = <animania:cooked_old_spot_bacon>;
val baconCookedHampshire = <animania:cooked_hampshire_bacon>;
val baconCookedPrime = <animania:cooked_prime_bacon>;
//Other
val frogRaw = <animania:raw_frog_legs>;
val frogCooked = <animania:cooked_frog_legs>;
val frogRawFished = <aquaculture:food:7>;
val frogCookedFished = <aquaculture:food:8>;
val horseRaw = <imc:item_raw_horse>;
val horseCooked = <imc:item_cooked_horse>;
val muttonRawPrime = <animania:raw_prime_mutton>;
val muttonCookedPrime = <animania:cooked_prime_mutton>;
val rabbitRawPrime = <animania:raw_prime_rabbit>;
val rabbitCookedPrime = <animania:cooked_prime_rabbit>;
val chevonRawBasic = <animania:raw_chevon>;
val chevonCookedBasic = <animania:cooked_chevon>;
val chevonRawPrime = <animania:raw_prime_chevon>;
val chevonCookedPrime = <animania:cooked_prime_chevon>;

//Swords
val swordGoldDT = <dungeontactics:golden_cutlass>;
val swordGoldMC = <minecraft:golden_sword>;
val swordWoodDT = <dungeontactics:wooden_cutlass>;
val swordWoodMC = <minecraft:wooden_sword>;
val swordIronDT = <dungeontactics:iron_cutlass>;
val swordIronMC = <minecraft:iron_sword>;
val swordStoneDT = <dungeontactics:stone_cutlass>;
val swordStoneMC = <minecraft:stone_sword>;
val swordDiamondDT = <dungeontactics:diamond_cutlass>;
val swordDiamondMC = <minecraft:diamond_sword>;

//Clusters
val clusterIron = <dungeontactics:cluster_iron>;
val clusterGold = <dungeontactics:cluster_gold>;
val clusterCopper = <dungeontactics:cluster_copper>;
val clusterTin = <dungeontactics:cluster_tin>;
val clusterLead = <dungeontactics:cluster_lead>;
val clusterSilver = <dungeontactics:cluster_silver>;
//Ingots
val ingotIron = <minecraft:iron_ingot>;
val ingotGold = <minecraft:gold_ingot>;
val ingotCopper = <immersiveengineering:metal>;
val ingotTin = <railcraft:ingot:2>;
val ingotLead = <immersiveengineering:metal:2>;
val ingotSilver = <immersiveengineering:metal:3>;

////Other
val runeRed = <arsmagica2:rune:1>;
val flickerButcher = <arsmagica2:flicker_focus:1>;
val evilBook = <arsmagica2:evil_book>;
val flickerLife = <arsmagica2:flicker_jar:9>;
val flickerFire = <arsmagica2:flicker_jar:3>;
val uncookedMeatStew = <silentgems:Food:3>;
val potato = <minecraft:potato>;
val carrot = <minecraft:carrot>;
val bowl = <minecraft:bowl>;
val gemAll = <silentgems:Gem:*>;
val rawhideBone = <silentgems:CraftingMaterial:23>;
val summonPuppy = <silentgems:PetSummoner:1>;
val bloodStainedBlock = <railcraft:brick_bloodstained:2>;
val sandstoneSmooth = <minecraft:sandstone:2>;
val focusCreature = <arsmagica2:creature_focus>;
val focusStandard = <arsmagica2:standard_focus>;
val wool = <minecraft:wool:*>;
val featherPeacockBlue = <animania:blue_peacock_feather>;
val featherPeacockWhite = <animania:white_peacock_feather>;
val featherPeacockPurple = <animania:purple_peacock_feather>;
val featherPeacockCharcoal = <animania:charcoal_peacock_feather>;
val featherPeacockOpal = <animania:opal_peacock_feather>;
val featherPeacockPeach = <animania:peach_peacock_feather>;
val featherPeacockTaupe = <animania:taupe_peacock_feather>;
val nest = <animania:block_nest>;
val trough = <animania:block_trough>;
val stick = <minecraft:stick>;
val fishPie = <grimoireofgaia:item.FoodPieMeat>;
val fishVanilla = <minecraft:fish:*>;
val fishVanillaCooked = <minecraft:cooked_fish:*>;
val rawFish = <aquaculture:food:3>;
val cookedFish = <aquaculture:food:4>;
val fishNChips = <actuallyadditions:itemFood:3>;
val paperCone = <actuallyadditions:itemMisc>;
val frenchFry = <actuallyadditions:itemFood:5>;
val fishSwift = <dungeontactics:fish_swift>;
val fishFlying = <dungeontactics:fish_flying>;
val fishLava = <dungeontactics:fish_lava>;
val fishMuscle = <dungeontactics:fish_muscle>;
val fishLung = <dungeontactics:fish_lung>;
val fishObsidian = <dungeontactics:fish_obsidian>;
val whaleRaw = <aquaculture:food:2>;
val whaleCooked = <aquaculture:food:5>;
val sugar = <minecraft:sugar>;
//Seeds
val seedPumpkin = <minecraft:pumpkin_seeds>;
val seedMelon = <minecraft:melon_seeds>;
val seedBeetroot = <minecraft:beetroot_seeds>;
val seedCoffee = <actuallyadditions:itemCoffeeSeed>;
val seedRice = <actuallyadditions:itemRiceSeed>;
val seedFlax = <actuallyadditions:itemFlaxSeed>;
val seedCanola = <actuallyadditions:itemCanolaSeed>;
val seedHemp = <immersiveengineering:seed>;
val seedOkra = <plants:okra_seed>;
val seedPineapple = <plants:pineapple_seed>;
val seedRagweed = <plants:ambrosia_a>;
val seedCotton = <plants:apocynum_c>;
val seedPrincesFeather = <plants:amaranthus_h_seed>;
val seedChocolate = <plants:akebia_q>;
val seedFluffyPuff = <silentgems:FluffyPuffSeeds>;
//Plates
val plateIronRC = <railcraft:plate>;
val plateSteelRC = <railcraft:plate:1>;
val plateNickelRC = <railcraft:plate:8>;
val plateCopperRC = <railcraft:plate:3>;
val plateLeadRC = <railcraft:plate:4>;
val plateSilverRC = <railcraft:plate:5>;
val plateGoldRC = <railcraft:plate:7>;

//Arrays
val foodMeatRaw = [
	chickenRawOrpington, chickenRawPlymouthRock, chickenRawRhodeIslandRed, chickenRawWyandotte, chickenRawPrime,
	beefRawAngus, beefRawHereford, beefRawLonghorn, beefRawPrime,
	steakRawAngus, steakRawHereford, steakRawLonghorn, steakRawPrime,
	porkRawDuroc, porkRawHampshire, porkRawLargeBlack, porkRawOldSpot, porkRawPrime,
	baconRawDuroc, baconRawHampshire, baconRawLargeBlack, baconRawOldSpot, baconRawPrime,
	frogRaw, frogRawFished, horseRaw, muttonRawPrime, rabbitRawPrime, chevonRawBasic, chevonRawPrime
] as IItemStack[];
val foodMeatCooked = [
	chickenCookedOrpington, chickenCookedPlymouthRock, chickenCookedRhodeIslandRed, chickenCookedWyandotte, chickenCookedPrime,
	beefCookedAngus, beefCookedHereford, beefCookedLonghorn, beefCookedPrime,
	steakCookedAngus, steakCookedHereford, steakCookedLonghorn, steakCookedPrime,
	porkCookedDuroc, porkCookedHampshire, porkCookedLargeBlack, porkCookedOldSpot, porkCookedPrime,
	baconCookedDuroc, baconCookedHampshire, baconCookedLargeBlack, baconCookedOldSpot, baconCookedPrime,
	frogCooked, frogCookedFished, horseCooked, muttonCookedPrime, rabbitCookedPrime, chevonCookedBasic, chevonCookedPrime
] as IItemStack[];
val fishArray = [
	fishVanilla, fishSwift, fishFlying, fishLava, fishLung, fishObsidian
] as IItemStack[];
val seedArray = [
	seedPumpkin, seedMelon, seedBeetroot, seedCoffee, seedRice, seedFlax, seedCanola, seedHemp,
	seedOkra, seedPineapple, seedRagweed, seedCotton, seedPrincesFeather, seedChocolate, seedFluffyPuff
] as IItemStack[];

//Dictionary
val foodMeat = <ore:foodMeat>;
val listAllchickenraw = <ore:listAllchickenraw>;
val listAllbeefraw = <ore:listAllbeefraw>;
val listAllporkraw = <ore:listAllporkraw>;
val listAllchickencooked = <ore:listAllchickencooked>;
val listAllbeefcooked = <ore:listAllbeefcooked>;
val listAllporkcooked = <ore:listAllporkcooked>;
val listAllmeatraw = <ore:listAllmeatraw>;
val listAllmeatcooked = <ore:listAllmeatcooked>;
val listAllfishraw = <ore:listAllfishraw>;
val listAllfishcooked = <ore:listAllfishcooked>;
val swordGold = <ore:swordGold>;
val swordWood = <ore:swordWood>;
val swordStone = <ore:swordStone>;
val swordIron = <ore:swordIron>;
val swordDiamond = <ore:swordDiamond>;
val feather = <ore:feather>;
val planks = <ore:plankWood>;
val leaves = <ore:treeLeaves>;
val egg = <ore:egg>;
val seedAll = <ore:listAllseed>;
val plateIron = <ore:plateIron>;
val plateGold = <ore:plateGold>;
val plateSteel = <ore:plateSteel>;
val plateNickel = <ore:plateNickel>;
val plateCopper = <ore:plateCopper>;
val plateLead = <ore:plateLead>;
val plateSilver = <ore:plateSilver>;


//add animania meats to foodMeat oredict
for j, raw in foodMeatRaw {
	foodMeat.add(raw);
}
for k, cooked in foodMeatCooked {
	foodMeat.add(cooked);
}

//add vanilla meats to respective type oredicts
listAllbeefraw.add(beefRawVanilla);
listAllchickenraw.add(chickenRawVanilla);
listAllporkraw.add(porkRawVanilla);
listAllbeefcooked.add(beefCookedVanilla);
listAllchickencooked.add(chickenCookedVanilla);
listAllporkcooked.add(porkCookedVanilla);

//add extra meats to listAllX
for j, rawAll in foodMeatRaw {
	listAllmeatraw.add(rawAll);
}
for k, cookedAll in foodMeatCooked {
	listAllmeatcooked.add(cookedAll);
}

//oredict DT and Vanilla swords
swordGold.add(swordGoldDT);
swordGold.add(swordGoldMC);
swordIron.add(swordIronDT);
swordIron.add(swordIronMC);
swordWood.add(swordWoodDT);
swordWood.add(swordWoodMC);
swordStone.add(swordStoneDT);
swordStone.add(swordStoneMC);
swordDiamond.add(swordDiamondDT);
swordDiamond.add(swordDiamondMC);

//feathers oredict
feather.add(featherPeacockBlue);
feather.add(featherPeacockWhite);
feather.add(featherPeacockCharcoal);
feather.add(featherPeacockOpal);
feather.add(featherPeacockPeach);
feather.add(featherPeacockPurple);
feather.add(featherPeacockTaupe);

//Seeds oredict
for j, seed in seedArray {
	seedAll.add(seed);
}

//Plates oredict
plateIron.add(plateIronRC);
plateGold.add(plateGoldRC);
plateSteel.add(plateSteelRC);
plateNickel.add(plateNickelRC);
plateCopper.add(plateCopperRC);
plateLead.add(plateLeadRC);
plateSilver.add(plateSilverRC);

//Allow ore dict meats in butchery flicker recipe
recipes.remove(flickerButcher);
recipes.addShaped(flickerButcher, [[listAllporkraw, listAllbeefraw, listAllchickenraw], [flickerFire, swordGold, flickerLife], [runeRed, evilBook, runeRed]]);

//oredict friendly meaty stew recipe
recipes.addShapeless(uncookedMeatStew, [bowl, listAllmeatraw, carrot, potato]);

//oredict friendly puppy summon
recipes.remove(summonPuppy);
recipes.addShapeless(summonPuppy, [gemAll, listAllmeatraw, rawhideBone]);

//oredict friendly bloodstone recipe
recipes.addShapeless(bloodStainedBlock, [sandstoneSmooth, listAllbeefraw]);

//oredict friendly creature focus
recipes.remove(focusCreature);
recipes.addShaped(focusCreature, [[null, listAllporkraw, null], [null, focusStandard, feather], [null, wool, null]]);

//oredict friendly trough recipe
recipes.remove(trough);
recipes.addShaped(trough, [[planks, null, planks], [planks, ingotIron, planks], [stick, null, stick]]);

//oredict friendly nest recipe
recipes.remove(nest);
recipes.addShapeless(nest, [wool, stick, leaves]);

//add fillet recipes for vanilla/DT Fish and add listAll ore dict
for k, fish in fishArray {
	recipes.addShapeless(rawFish, [fish]);
	listAllfishraw.add(fish);
}
recipes.addShapeless(rawFish * 2, [fishMuscle]);
listAllfishraw.add(fishMuscle);
listAllfishraw.add(whaleRaw);
listAllfishcooked.add(fishVanillaCooked);
listAllfishcooked.add(whaleCooked);

//change fish pie recipe to use fillets
recipes.remove(fishPie);
recipes.addShapeless(fishPie, [rawFish, rawFish, egg, sugar]);

//tweak F'n'C recipe to use fillets
recipes.remove(fishNChips);
recipes.addShaped(fishNChips, [[frenchFry, cookedFish, frenchFry], [null, paperCone, null]]);


//Cluster management
//Iron
furnace.addRecipe(ingotIron, clusterIron, 0.5);
//Gold
furnace.addRecipe(ingotGold, clusterGold, 0.5);
//Tin
furnace.addRecipe(ingotTin, clusterTin, 0.5);
//Copper
furnace.addRecipe(ingotCopper, clusterCopper, 0.5);
//Lead
furnace.addRecipe(ingotLead, clusterLead, 0.5);
//Silver
furnace.addRecipe(ingotSilver, clusterSilver, 0.5);
