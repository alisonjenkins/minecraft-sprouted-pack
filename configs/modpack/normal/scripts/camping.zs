////Imports


////Variables
val fireplace = <camping:campfireCook>;
val campfire = <camping:campfireWood>;
val sleepingBag = <camping:sleepingBag>;
val tent = <camping:tent:*>;
val ironStick = <camping:parts:1>;
val peg = <camping:parts:2>;
val pan = <camping:parts:3>;
val marshmallow = <camping:parts:5>;
val marshmallowStick = <camping:parts:6>;
val marshmallowStickCooked = <camping:marshmallowStickCooked>;
val kit = <camping:kit:*>;

val bearTrap = <camping:trap>;
val rodIron = <immersiveengineering:material:1>;
val ingotIron = <ore:ingotIron>;

//remove recipes
recipes.remove(fireplace);
recipes.remove(campfire);
recipes.remove(sleepingBag);
recipes.remove(tent);
recipes.remove(ironStick);
recipes.remove(peg);
recipes.remove(pan);
recipes.remove(marshmallow);
recipes.remove(marshmallowStick);
recipes.remove(marshmallowStickCooked);
recipes.remove(kit);


//change bear trap recipe to use IE iron sticks
recipes.remove(bearTrap);
recipes.addShaped(bearTrap, [[null, rodIron, null], [rodIron, ingotIron, rodIron], [null, rodIron, null]]);