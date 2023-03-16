Walls by Philip Riley begins here.

Include PBR Common by Philip Riley.

The Walls is a backdrop. it is privately-named. The printed name is "wall". Understand "wall/walls" as walls.
The walls is everywhere.

Table of Walls
locale (a room)	has walls (a truth state)	wall description (a text)	touch description (a text)
with 1 blank row.

Definition: a room is wall-defined if there is a locale of it in the Table of Walls.
Definition: a room is walled:
	if it is wall-defined:
		choose row with a locale of it in the Table of Walls;
		if it is indoors and (there is no has walls entry or the has walls entry is true):
			decide yes;
		otherwise if (it is outdoors or it is floating) and (there is a has walls entry and the has walls entry is true):
			decide yes;
		otherwise:
			decide no;
	otherwise if it is indoors:
		decide yes;
	decide no;

The wall description rules is a room based rulebook producing texts.

Wall description of a room (called R) (this is the standard wall description rule):
	if R is wall-defined:
		choose row with a locale of R in the Table of Walls;
		if there is a wall description entry:
			rule succeeds with result wall description entry;
	if R is walled:
		rule succeeds with result "[We] [see] nothing special about the walls." (A);
	rule succeeds with result "There are no walls to see." (B);

To decide what text is the wall description for (R - a room):
	decide on the text produced by the wall description rules for R;

Instead of examining walls (this is the standard examine wall rule):
	say "[wall description for location][line break]" (A);


The wall touch description rules is a room based rulebook producing texts.

Wall touch description of a room (called R) (this is the standard wall touch description rule):
	if R is wall-defined:
		choose row with a locale of R in the Table of Walls;
		if there is a touch description entry:
			rule succeeds with result touch description entry; 
	if the location is walled:
		rule succeeds with result "[We] [feel] nothing special about the walls." (A);
	rule succeeds with result "There are no walls to feel." (B);

To decide what text is the wall touch description for (R - a room):
	decide on the text produced by the wall touch description rules for R;

Instead of touching walls (this is the standard touch walls rule):
	say "[wall touch description for location][line break]" (A);
	

Check rubbing walls (this is the standard check rubbing the walls rule):
	unless the location is walled:
		say "There are no walls." (B) instead;
	
Check attacking the walls when the location is walled (this is the block attacking the walls rule):
	say "[We] would just embarrass [ourselves]." (A) instead;
	
Check attacking the walls when the location is not walled (this is the block attacking no walls rule):
	say "There are no walls." (A) instead;
	
Check cutting the walls when the location is walled (this is the block cutting the walls rule):
	say "That's just daft." (A) instead;
	
Check cutting the walls when the location is not walled (this is the block cutting no walls rule):
	say "There are no walls." (A) instead;
	
Check taking the walls when the location is not walled (this is the block taking non-existent walls rule):
	say "There are no walls." (A) instead;
	
	
Walls ends here.

---- DOCUMENTATION ----

Provides a global backdrop for walls. Descriptions of walls can be set for each room via a table interface. Rooms can be specified as not having walls. Examining, Touching, and Rubbing walls all produce intelligent messages.

Custom messages are defined in the Table of Walls as below

	Table of Walls (continued)
	locale (a room)		has walls (a truth state)		wall description (a text)		touch description
	Cave		--		"The rocky walls of the cave bleed moisture."		"[We] [run] [our] hand across the rough surface of the cave wall."
	
Indoor rooms (defined in the extension PBR Common by Philip Riley) have walls by default, where outdoor and floating rooms do not. One can still define messages for rooms without walls, and they will be displayed. This is useful for explaining the lack of walls, for instance.

Example: A shady glen by a cave

	*: "A shady glen by a cave"

	Include Walls by Philip Riley.
	Include PBR Common by Philip Riley.
	
	The Quiet Glade is room.
	"[We] [are] in a clearing in the woods, surrounded by softly whispering pines. A cave entrance gapes to the north."
	It is outdoors.
	
	The Damp Cave is north of the Quiet Glade.
	"Water pools in the back of this shallow cave. The drip, drip, drip of water into the pool is the only sound. You can leave the cave to the south. There is a portal to a cloud dimension to the east." 
	
	The Cloud Dimension is east of the Damp Cave. It is floating.
	"You floating in a space filled with clouds. There is a portal home to the west."
	
	To run is a verb.
	
	Table of Walls (continued)
	locale (a room)	has walls (a truth state)	wall description (a text)	touch description (a text)
	Quiet Glade	--	"Only the trees surround [us]."	--
	Damp Cave	--	"The rocky walls of the cave bleed moisture."	"[We] [run] [our] hand across the rough surface of the cave wall."
	
	Test me with "x wall/touch wall/rub wall/take wall/n/x wall/touch wall/rub wall/take wall";
