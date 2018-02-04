////Imports
import mods.actuallyadditions.Empowerer;
import mods.botania.RuneAltar;
import mods.bloodmagic.SoulForge;
import minetweaker.data.IData;
import minetweaker.item.IItemStack;
import minetweaker.item.IIngredient;

////Variables
//regular gems
val gems = <silentgems:Gem:*>;
val ruby = <ore:gemRuby>;
val garnet = <ore:gemGarnet>;
val topaz = <ore:gemTopa>;
val amber = <ore:gemAmber>;
val heliodor = <ore:gemHeliodor>;
val peridot = <ore:gemPeridot>;
val beryl = <ore:gemBeryl>;
val indicolite = <ore:gemIndicolite>;
val aquamarine = <ore:gemAquamarine>;
val sapphire = <ore:gemSapphire>;
val iolite = <ore:gemIolite>;
val amethyst = <ore:gemAmethyst>;
val agate = <ore:gemAgate>;
val morganite = <ore:gemMorganite>;
val onyx = <ore:gemOnyx>;
val opal = <ore:gemOpal>;
val carnelian = <ore:gemCarnelian>;
val spinel = <ore:gemSpinel>;
val citrine = <ore:gemCitrine>;
val jasper = <ore:gemJasper>;
val goldenBeryl = <ore:gemGoldenBeryl>;
val moldavite = <ore:gemMoldavite>;
val malachite = <ore:gemMalachite>;
val turquoise = <ore:gemTurquoise>;
val moonstone = <ore:gemMoonstone>;
val blueTopaz = <ore:gemBlueTopaz>;
val tanzanite = <ore:gemTanzanite>;
val violetSapphire = <ore:gemVioletSapphire>;
val lepidolite = <ore:gemLepidolite>;
val ametrine = <ore:gemAmetrine>;
val blackDiamond = <ore:gemBlackDiamond>;
val alexandrite = <ore:gemAlexandrite>;
val gemRegular = [
	ruby, garnet, topaz, amber, heliodor, peridot, beryl, indicolite, aquamarine, sapphire, iolite, amethyst, agate, morganite, onyx,
	opal, carnelian, spinel, citrine, jasper, goldenBeryl, moldavite, malachite, turquoise, moonstone, blueTopaz, tanzanite, violetSapphire,
	lepidolite, ametrine, blackDiamond, alexandrite
	] as IIngredient[];
//regular gem blocks
val rubyBlock = <silentgems:gemblock:0>;
val garnetBlock = <silentgems:gemblock:1>;
val topazBlock = <silentgems:gemblock:2>;
val amberBlock = <silentgems:gemblock:3>;
val heliodorBlock = <silentgems:gemblock:4>;
val peridotBlock = <silentgems:gemblock:5>;
val berylBlock = <silentgems:gemblock:6>;
val indicoliteBlock = <silentgems:gemblock:7>;
val aquamarineBlock = <silentgems:gemblock:8>;
val sapphireBlock = <silentgems:gemblock:9>;
val ioliteBlock = <silentgems:gemblock:10>;
val amethystBlock = <silentgems:gemblock:11>;
val agateBlock = <silentgems:gemblock:12>;
val morganiteBlock = <silentgems:gemblock:13>;
val onyxBlock = <silentgems:gemblock:14>;
val opalBlock = <silentgems:gemblock:15>;
val carnelianBlock = <silentgems:gemblockdark:0>;
val spinelBlock = <silentgems:gemblockdark:1>;
val citrineBlock = <silentgems:gemblockdark:2>;
val jasperBlock = <silentgems:gemblockdark:3>;
val goldenBerylBlock = <silentgems:gemblockdark:4>;
val moldaviteBlock = <silentgems:gemblockdark:5>;
val malachiteBlock = <silentgems:gemblockdark:6>;
val turquoiseBlock = <silentgems:gemblockdark:7>;
val moonstoneBlock = <silentgems:gemblockdark:8>;
val blueTopazBlock = <silentgems:gemblockdark:9>;
val tanzaniteBlock = <silentgems:gemblockdark:10>;
val violetSapphireBlock = <silentgems:gemblockdark:11>;
val lepidoliteBlock = <silentgems:gemblockdark:12>;
val ametrineBlock = <silentgems:gemblockdark:13>;
val blackDiamondBlock = <silentgems:gemblockdark:14>;
val alexandriteBlock = <silentgems:gemblockdark:15>;
val gemBlockRegular = [
	rubyBlock, garnetBlock, topazBlock, amberBlock, heliodorBlock, peridotBlock, berylBlock, indicoliteBlock, aquamarineBlock, 
	sapphireBlock, ioliteBlock, amethystBlock, agateBlock, morganiteBlock, onyxBlock, opalBlock, carnelianBlock, spinelBlock, 
	citrineBlock, jasperBlock, goldenBerylBlock, moldaviteBlock, malachiteBlock, turquoiseBlock, moonstoneBlock, blueTopazBlock, 
	tanzaniteBlock, violetSapphireBlock, lepidoliteBlock, ametrineBlock, blackDiamondBlock, alexandriteBlock
	] as IItemStack[];
//Super Gems
val rubySuper = <silentgems:Gem:32>;
val garnetSuper = <silentgems:Gem:33>;
val topazSuper = <silentgems:Gem:34>;
val amberSuper = <silentgems:Gem:35>;
val heliodorSuper = <silentgems:Gem:36>;
val peridotSuper = <silentgems:Gem:37>;
val berylSuper = <silentgems:Gem:38>;
val indicoliteSuper = <silentgems:Gem:39>;
val aquamarineSuper = <silentgems:Gem:40>;
val sapphireSuper = <silentgems:Gem:41>;
val ioliteSuper = <silentgems:Gem:42>;
val amethystSuper = <silentgems:Gem:43>;
val agateSuper = <silentgems:Gem:44>;
val morganiteSuper = <silentgems:Gem:45>;
val onyxSuper = <silentgems:Gem:46>;
val opalSuper = <silentgems:Gem:47>;
val carnelianSuper = <silentgems:Gem:48>;
val spinelSuper = <silentgems:Gem:49>;
val citrineSuper = <silentgems:Gem:50>;
val jasperSuper = <silentgems:Gem:51>;
val goldenBerylSuper = <silentgems:Gem:52>;
val moldaviteSuper = <silentgems:Gem:53>;
val malachiteSuper = <silentgems:Gem:54>;
val turquoiseSuper = <silentgems:Gem:55>;
val moonstoneSuper = <silentgems:Gem:56>;
val blueTopazSuper = <silentgems:Gem:57>;
val tanzaniteSuper = <silentgems:Gem:58>;
val violetSapphireSuper = <silentgems:Gem:59>;
val lepidoliteSuper = <silentgems:Gem:60>;
val ametrineSuper = <silentgems:Gem:61>;
val blackDiamondSuper = <silentgems:Gem:62>;
val alexandriteSuper = <silentgems:Gem:63>;
val gemSuper = [
	rubySuper, garnetSuper, topazSuper, amberSuper, heliodorSuper, peridotSuper, berylSuper, indicoliteSuper, aquamarineSuper, sapphireSuper, 
	ioliteSuper, amethystSuper, agateSuper, morganiteSuper, onyxSuper, opalSuper, carnelianSuper, spinelSuper, citrineSuper, jasperSuper, 
	goldenBerylSuper, moldaviteSuper, malachiteSuper, turquoiseSuper, moonstoneSuper, blueTopazSuper, tanzaniteSuper, violetSapphireSuper,
	lepidoliteSuper, ametrineSuper, blackDiamondSuper, alexandriteSuper
	] as IItemStack[];
//Chaos
val chaosEssence = <silentgems:CraftingMaterial>;
val chaosBlock = <silentgems:miscblock>;
val chaosEnriched = <silentgems:CraftingMaterial:1>;
val chaosEnrichedBlock = <silentgems:miscblock:1>;
//Glowstone
val glowstoneDust = <ore:dustGlowstone>;
val glowstoneBlock = <minecraft:glowstone>;
//Redstone
val redstoneDust = <minecraft:redstone>;
val redstoneBlock = <minecraft:redstone_block>;
val redstoneBlockOre = <ore:blockRedstone>;
//LIT upgrades
val upgradeSpeed = <lit:FurnaceUpgradeItem>;
val upgradeEfficiency = <lit:FurnaceUpgradeItem:1>;
val upgradeCapacity = <lit:FurnaceUpgradeItem:2>;
//misc
val ingotGold = <minecraft:gold_ingot>;
val diamond = <minecraft:diamond>;
val lapisDust = <minecraft:dye:4>;
val lapisBlock = <ore:blockLapis>;
val blazeRod = <minecraft:blaze_rod>;
val blazePowder = <minecraft:blaze_powder>;
val improvedFurnace = <lit:ImprovedFurnaceBlock>;
val chaosCore = <silentgems:CraftingMaterial:14>;

//Superpowering gems
for j, gem in gemSuper {
	recipes.remove(gem);
	Empowerer.addRecipe(gemBlockRegular[j], gem * 5, chaosBlock, chaosBlock, chaosBlock, glowstoneBlock, 25000, 50);
	RuneAltar.addRecipe(gem, [gemRegular[j], gemRegular[j], chaosEssence, chaosEssence, chaosEssence, chaosEssence, chaosEssence, chaosEssence, glowstoneDust], 10000);
	SoulForge.addRecipe(gem * 4, 260, 25, [gemBlockRegular[j], chaosBlock, chaosBlock, chaosBlock]);
}

//Enriching Chaos
recipes.remove(chaosEnriched);
Empowerer.addRecipe(chaosBlock, chaosEnriched * 4, chaosBlock, redstoneBlock, redstoneBlock, glowstoneBlock, 32000, 100);
RuneAltar.addRecipe(chaosEnriched, [chaosEssence, chaosEssence, chaosEssence, chaosEssence, redstoneDust, redstoneDust, redstoneDust, redstoneDust, glowstoneDust], 15000);
SoulForge.addRecipe(chaosEnriched * 2, 260, 50, [chaosBlock, redstoneBlock, glowstoneDust, glowstoneDust]);

//remove non-gem LIT upgrade recipes
recipes.remove(upgradeSpeed);
recipes.addShaped(upgradeSpeed, [[gems, redstoneDust, gems], [redstoneDust, chaosCore, redstoneDust], [gems, lapisDust, gems]]);
recipes.remove(upgradeEfficiency);
recipes.addShaped(upgradeEfficiency, [[gems, blazePowder, gems], [blazePowder, chaosCore, blazePowder], [gems, lapisDust, gems]]);
recipes.remove(upgradeCapacity);
recipes.addShaped(upgradeCapacity, [[gems, improvedFurnace, gems], [improvedFurnace, chaosCore, improvedFurnace], [gems, lapisDust, gems]]);