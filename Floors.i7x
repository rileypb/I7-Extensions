Floors by Philip Riley begins here.

Include PBR Common by Philip Riley.

The floor is a backdrop.
The floor is everywhere.

Understand "ground" as the floor when the location is outdoors.

Table of Floors
locale (a room)	has floor (a truth state)	floor description (a text)	touch description (a text)
with 1 blank row.

Definition: a room is floor-defined if there is a locale of it in the Table of Floors.
Definition: a room is floored:
	if it is floor-defined:
		choose row with a locale of it in the Table of Floors;
		if (it is indoors or it is outdoors) and (there is no has floor entry or the has floor entry is true):
			decide yes;
		otherwise if it is floating and (there is a has floor entry and the has floor entry is true):
			decide yes;
		otherwise:
			decide no;
	otherwise if it is indoors or it is outdoors:
		decide yes;
	decide no; 

The floor description rules is a room based rulebook producing texts.

Floor description of a room (called R) (this is the standard floor description rule):
	if R is floor-defined:
		choose row with a locale of R in the Table of Floors;
		if there is a floor description entry:
			rule succeeds with result floor description entry;
	if R is floored:
		rule succeeds with result "[We] [see] nothing special about the [if the location is indoors]floor[otherwise]ground[end if]." (A);
	rule succeeds with result "There is no floor to see." (B);		

To decide what text is the floor description for (R - a room):
	decide on the text produced by the floor description rules for R;
	
Instead of examining Floor (this is the standard examine floor rule):
	say "[floor description for location][line break]" (A);


The floor touch description rules is a room based rulebook producing texts.

Floor touch description of a room (called R) (this is the standard floor touch description rule):
	if R is floor-defined:
		choose row with a locale of R in the Table of Floors;
		if there is a touch description entry:
			rule succeeds with result touch description entry;
	if R is floored:
		rule succeeds with result "[We] [feel] nothing special about the floor." (A);
	rule succeeds with result "There is no floor to feel." (B);	

To decide what text is the floor touch description for (R - a room):
	decide on the text produced by the floor touch description rules for R;

Instead of touching Floor (this is the standard touch floor rule):
	say "[floor touch description for location][line break]";

Check rubbing Floor (this is the standard check rubbing the floor rule):
	unless the location is floored:
		say "There is no floor." (B) instead;
	
Check attacking the Floor (this is the block attacking the Floor rule):
	say "[We] would just look like a nutcase." (A) instead;
	
Check cutting the Floor (this is the block cutting the Floor rule):
	say "That isn't possible." (A) instead;
	
Check taking the floor when the location is not floored (this is the block taking non-existent floor rule):
	say "There is no floor." (A) instead;
	
Check examining down (this is the standard looking down rule):
	try examining the floor instead;	

Floors ends here.

---- DOCUMENTATION ----

Provides a global backdrop for floors. Descriptions of floors can be set for each room via a table interface. Rooms can be specified as not having floors. Examining, Touching, and Rubbing floors all produce intelligent messages. "look down" is remapped to "examine floor". In an outdoor room, "ground" is understood as the floor, and is preferred in descriptions.

Custom messages are defined in the Table of Ceilings as below

	Table of Floors (continued)
	locale (a room)	has floor (a truth state)	floor description (a text)	touch description (a text)
	with 1 blank row.

	
Indoor rooms (defined in the extension PBR Common by Philip Riley) have ceilings by default, where outdoor and floating rooms do not. One can still define messages for rooms without ceilings, and they will be displayed. This is useful for explaining the lack of ceilings, for instance.

Example: A quiet glade by a cave

	*: "A quiet glade by a cave"

	Include Floors by Philip Riley.
	Include PBR Common by Philip Riley.
	
	The Quiet Glade is room.
	"[We] [are] in a clearing in the woods, surrounded by softly whispering pines. A cave entrance gapes to the north."
	It is outdoors.
	Understand "grass" as the floor when the location is the Quiet Glade.
	
	The Damp Cave is north of the Quiet Glade.
	"Water pools in the back of this shallow cave. The drip, drip, drip of water into the pool is the only sound. You can leave the cave to the south. There is a portal to a cloud dimension to the east." 
	
	The Cloud Dimension is east of the Damp Cave. It is floating.
	"You are floating in a space filled with clouds. There is a portal home to the west."
	
	To run is a verb. 
	
	Table of Floors (continued)
	locale (a room)	has floor (a truth state)	floor description (a text)	touch description (a text)
	Quiet Glade	--	"The brown needles of the forest give way to green grass here."	"The softness of the grass is welcome on [our] skin."
	Damp Cave	--	--	"The floor is rough and stony."
	
	
	
	Test me with "x floor/touch floor/feel grass/rub floor/take floor/n/x floor/touch floor/rub floor/take floor/e/look down";

