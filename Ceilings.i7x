Version 1 of Ceilings by Philip Riley begins here.

Include PBR Common by Philip Riley.

The ceiling is a backdrop.
The ceiling is everywhere.

Understand "sky" as the ceiling when the location is outdoors and the location is not ceilinged.

Table of Ceilings
locale (a room)	has ceiling (a truth state)	ceiling description (a text)	touch description (a text)	low ceiling (a truth state)
with 1 blank row.

Definition: a room is ceiling-defined if there is a locale of it in the Table of Ceilings.
Definition: a room is ceilinged:
	if it is ceiling-defined:
		choose row with a locale of it in the Table of Ceilings;
		if it is indoors and (there is no has ceiling entry or the has ceiling entry is true):
			decide yes;
		otherwise if (it is outdoors or it is floating) and (there is a has ceiling entry and the has ceiling entry is true):
			decide yes;
		otherwise:
			decide no;
	otherwise if it is indoors:
		decide yes;
	decide no;
Definition: a room is low-ceilinged:
	if it is ceiling-defined:
		choose row with a locale of it in the Table of Ceilings;
		if there is a low ceiling entry and the low ceiling entry is true:
			decide yes;
	decide no;
Definition: a room is ceiling-touchable if it is ceilinged and it is low-ceilinged.


The ceiling description rules is a room based rulebook producing texts.

Ceiling description of a room (called R) (this is the standard ceiling description rule):
	if R is ceiling-defined:
		choose row with a locale of R in the Table of Ceilings;
		if there is a ceiling description entry:
			rule succeeds with result ceiling description entry;
	if R is ceilinged:
		rule succeeds with result "[We] [see] nothing special about the ceiling." (A);
	if location is outdoors:
		rule succeeds with result "There's nothing up there but sky." (B);
	rule succeeds with result "There is no ceiling to see." (C);		

To decide what text is the ceiling description for (R - a room):
	decide on the text produced by the ceiling description rules for R;
	
Instead of examining Ceiling (this is the standard examine ceiling rule):
	say "[ceiling description for location][line break]" (A);


The ceiling touch description rules is a room based rulebook producing texts.

Ceiling touch description of a room (called R) (this is the standard ceiling touch description rule):
	if R is ceiling-defined:
		choose row with a locale of R in the Table of Ceilings;
		if there is a touch description entry:
			rule succeeds with result touch description entry;
	if location is not low-ceilinged and the location is ceilinged:
		rule succeeds with result "[We] [can't] reach the ceiling." (A);
	if location is ceilinged:
		rule succeeds with result "[We] [feel] nothing special about the ceiling." (B);
	if location is outdoors:
		rule succeeds with result "[We] [can't] touch the sky." (C);
	rule succeeds with result "There is no ceiling to feel." (D);

To decide what text is the ceiling touch description for (R - a room):
	decide on the text produced by the ceiling touch description rules for R;

Instead of touching Ceiling (this is the standard touch ceiling rule):
	say "[ceiling touch description for location][line break]";
	

Check rubbing Ceiling (this is the standard check rubbing the ceiling rule):
	if the location is ceilinged:
		if the location is not low-ceilinged:
	 		say "[We] can't reach the ceiling." (A) instead;
	otherwise:
		say "There is no ceiling." (B) instead;
	
Check attacking the Ceiling when the location is ceilinged (this is the block attacking the Ceiling rule):
	say "[We] would just embarrass [ourselves]." (A) instead;
	
Check attacking the ceiling when the location is not ceilinged (this is the block attacking no ceiling rule):
	say "There is no ceiling." (A) instead;
	
Check cutting the Ceiling when the location is ceilinged (this is the block cutting the Ceiling rule):
	say "That's just daft." (A) instead;
	
Check cutting the Ceiling when the location is not ceilinged (this is the block cutting no Ceiling rule):
	say "There is no ceiling." (A) instead;
	
Check taking the ceiling when the location is not ceilinged (this is the block taking non-existent ceiling rule):
	say "There is no ceiling." (A) instead;
	
Check examining up (this is the standard looking up rule):
	try examining the ceiling instead;


Ceilings ends here.

---- DOCUMENTATION ----

Provides a global backdrop for ceilings. Descriptions of ceilings can be set for each room via a table interface. Rooms can be specified as not having ceilings. Ceilings are by default too high to touch, but can be made low-ceilinged. Examining, Touching, and Rubbing walls all produce intelligent messages. 'look up' is remapped to 'examing ceiling'.

Custom messages are defined in the Table of Ceilings as below

Table of Ceilings (continued)
locale (a room)	has ceiling (a truth state)	ceiling description (a text)	touch description (a text)	low ceiling (a truth state)
Quiet Glade	--	"Sunlight filters down through the branches."
Damp Cave	--	"The low ceiling of the cave drips moisture."	"The ceiling is rough and wet."	true
	
Indoor rooms (defined in the extension PBR Common by Philip Riley) have ceilings by default, where outdoor and floating rooms do not. One can still define messages for rooms without ceilings, and they will be displayed. This is useful for explaining the lack of ceilings, for instance.

Example: A quiet glade by a cave

	*: "A quiet glade by a cave"
	
	Include Ceilings by Philip Riley.
	Include PBR Common by Philip Riley.
	
	The Quiet Glade is room.
	"[We] [are] in a clearing in the woods, surrounded by softly whispering pines. A cave entrance gapes to the north."
	It is outdoors.
	
	The Damp Cave is north of the Quiet Glade.
	"Water pools in the back of this shallow cave. The drip, drip, drip of water into the pool is the only sound. You can leave the cave to the south. There is a portal to a cloud dimension to the east." 
	
	The Cloud Dimension is east of the Damp Cave. It is floating.
	"You are floating in a space filled with clouds. There is a portal home to the west."
	
	To run is a verb.
	
	Table of Ceilings (continued)
	locale (a room)	has ceiling (a truth state)	ceiling description (a text)	touch description (a text)	low ceiling (a truth state)
	Quiet Glade	--	"Sunlight filters down through the branches."
	Damp Cave	--	"The low ceiling of the cave drips moisture."	"The ceiling is rough and wet."	true
	
	Test me with "x wall/touch wall/rub wall/take wall/n/x wall/touch wall/rub wall/take wall";