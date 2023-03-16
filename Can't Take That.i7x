Version 1 of Can't Take That by Philip Riley begins here.

Table of Frustrated Taking
target (a thing)	message (a text)	move message (a text)
with 1 blank row.

The can't take that rules is a thing based rulebook producing texts.

can't take that of a thing (called T) (this is the standard can't take that rule):
	if there is a message corresponding to a target of T in the Table of Frustrated Taking:
		rule succeeds with result the message corresponding to a target of T in the Table of Frustrated Taking;
	rule succeeds with result "[We] [can't] take that." (A);
	
To decide what text is the can't take message of (T - a thing):
	decide on the text produced by the can't take that rules for T;
	

The can't move that rules is a thing based rulebook producing texts.

can't move that of a thing (called T) (this is the standard can't move that rule):
	if there is a move message corresponding to a target of T in the Table of Frustrated Taking:
		rule succeeds with result the move message corresponding to a target of T in the Table of Frustrated Taking;
	if there is a message corresponding to a target of T in the Table of Frustrated Taking:
		rule succeeds with result the message corresponding to a target of T in the Table of Frustrated Taking;
	rule succeeds with result "[We] [can't] move that." (A);
	
To decide what text is the can't move message of (T - a thing):
	decide on the text produced by the can't move that rules for T;


The can't take scenery rule response (A) is "[can't take message of the noun]".

The can't take what's fixed in place rule response (A) is "[can't take message of the noun]".

The can't pull scenery rule response (A) is "[can't move message of the noun]".

The can't pull what's fixed in place rule response (A) is "[can't move message of the noun]".

The can't push scenery rule response (A) is "[can't move message of the noun]".

The can't push what's fixed in place rule response (A) is "[can't move message of the noun]".

Can't Take That ends here.

---- DOCUMENTATION ----

This extension enables the easy specification of custom messages to substitute for "You can't take that."

Messages are specified in the Table of Frustrated Taking.
	
	Table of Frustrated Taking
	target (a thing)	message (a text)	move message (a text)
	with 1 blank row.
	
Example: Storeroom

	*: "Storeroom"

	Include Can't Take That by Philip Riley.
	
	The Storeroom is a room. "This room is filled with many shelves. A pool of water is on the floor."
	
	The 100 lb weight is in the storeroom. It is fixed in place. 
	The pool of water is scenery in the storeroom.
	
	Table of Frustrated Taking (continued)
	target (a thing)	message (a text)	move message (a text)
	(100 lb weight)	"It's just too heavy for [us]."	"[We] [manage] to shift it a fraction of an inch, but no more."
	pool of water	"[We] [don't] have anything to put the water in."	"[We] [splash] it around a little, but [we] [can't] significantly move it."
	
	To manage is a verb. To splash is a verb.
	
	test me with "take weight/move weight/take water/push water";  


