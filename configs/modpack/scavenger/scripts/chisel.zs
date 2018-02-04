////Imports
import mods.chisel.Groups;

//Variables
val marbleQuark = <quark:marble>;
val marbleQuarkBrick = <quark:world_stone_bricks:4>;
val marbleQuarkPolished = <quark:marble:1>;
val marbleAstral = <astralsorcery:BlockMarble>;
val marbleAstralBricks = <astralsorcery:BlockMarble:1>;
val marbleAstralPillar = <astralsorcery:BlockMarble:2>;
val marbleAstralArch = <astralsorcery:BlockMarble:3>;
val marbleAstralChiseled = <astralsorcery:BlockMarble:4>;
val marbleAstralEngraved = <astralsorcery:BlockMarble:5>;
val marbleAstralRuned = <astralsorcery:BlockMarble:6>;


//Add marbles to Chisel
Groups.addVariation("marble", marbleQuark);
Groups.addVariation("marble", marbleQuarkBrick);
Groups.addVariation("marble", marbleQuarkPolished);
Groups.addVariation("marble", marbleAstral);
Groups.addVariation("marble", marbleAstralBricks);
Groups.addVariation("marble", marbleAstralPillar);
Groups.addVariation("marble", marbleAstralArch);
Groups.addVariation("marble", marbleAstralChiseled);
Groups.addVariation("marble", marbleAstralEngraved);
Groups.addVariation("marble", marbleAstralRuned);