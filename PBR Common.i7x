Version 2 of PBR Common by Philip Riley begins here.

[floating is as in airborne, in outer space, or swimming in open water.]
[underwater locales aren't handled separately. mark them as indoors, outdoors, or floating depending on their natures.]
A room can be indoors, outdoors, or floating. A room is usually indoors.

[
Can write something like:
	
For initializing my object:
	now the property of my object is the new value;

Good for setting up objects that can't be entirely defined before runtime.

Warning: these aren't constructors. Notably, they are executed from most specific to least specific, in contrast to constructors. If B is a instance or subkind of A, B's initializer will be run first. Generally constructors in an object-oriented language are chained in the opposite order. This means you can't have a kind set defaults and the subkind override them. Which is unfortunate.
]
initializing something is an activity on objects.
	
When play begins:
	repeat with X running through objects:
		carry out the initializing activity with X;

PBR Common ends here.

---- DOCUMENTATION ----

Just a repository for common bits of code needed by my other extensions.