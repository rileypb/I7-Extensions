Can't Go That Way by Philip Riley begins here.

Include Floors by Philip Riley.

Table of Excuses
source room (a room)	dirs (a list of directions)	excuse (a text)
with 1 blank row.

The room you tried to leave is a room that varies.

The excuse text rules is a direction based rulebook producing texts.

excuse text for a direction (called dir) (this is the standard excuse text rule):
	let source be the room you tried to leave;
	repeat through the Table of Excuses:
		if there is a dirs entry:
			if (source room entry is source) and (dir is listed in dirs entry):
				rule succeeds with result excuse entry;
	if dir is up:
		rule succeeds with result "[We] [can] neither climb walls nor fly." (A);
	if dir is down:
		if source is floored:			
			rule succeeds with result "[regarding the player][Are] [we] going to burrow downward?" (B) in sentence case;
		otherwise:
			rule succeeds with result "[We] [can't] go that way." (C);
	if dir is inside:
		rule succeeds with result "What [regarding the player][do] [we] want to enter?" (D);
	if dir is outside:
		rule succeeds with result "[text of the can't exit when not inside anything rule response (A)]";
	repeat through the Table of Excuses:		
		if there is no dirs entry:
			if source room entry is source:
				rule succeeds with result excuse entry;
	rule succeeds with result "[We] [can't] go that way." (E);

To decide which text is the excuse for (source - a room) to (dir - a direction):
	now the room you tried to leave is source;
	decide on the text produced by the excuse text rules for dir;

Instead of going nowhere:
	let ex be the excuse for location to the noun;
	say "[ex][paragraph break]";

The can't exit when not inside anything rule does nothing.

Check an actor exiting (this is the new can't exit when not inside anything rule):
	let the local room be the location of the actor;
	if the container exited from is the local room:
		if the player is the actor:
			say "[excuse for local room to outside][line break]" (A);
		stop the action.

Can't Go That Way ends here.


---- DOCUMENTATION ----

This extension allows for custom "can't go that way" messages depending on location and direction.

Example: Prison Cell

	*: "Prison Cell"

	Include Can't Go That Way by Philip Riley.
	
	The prison cell is a room. "You are in prison. The barred cell door is to the south."
	
	Table of Excuses (continued)
	source room (a room)	dirs (a list of directions)	excuse (a text)
	prison cell	--	"Nothing that way but cold cinderblock walls."
	prison cell	{ south }	"You can't squeeze through the bars!"
	prison cell	{outside}	"Escaping isn't that easy."
	
	test me with "n/e/s/d/u/out/in";
	
Note the the dirs column is a list of directions, so the same message may apply to multiple directions.

The can't exit when not inside anything rule is replaced so that it uses custom text when it exists.


