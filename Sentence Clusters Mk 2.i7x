Sentence Clusters Mk 2 by Philip Riley begins here.

Include Trees by Philip Riley.

Volume 1 - Definitions

To placehold is a verb.

A preposition is a kind of object.
with is a preposition.

A cluster type is a kind of value. The cluster types are no cluster, verb type, dobj type, iobj type, verbdobj type, verbiobj type, dobjiobj type.

Table of Clusters
id (a number)	parent id (a number)	child ids (a list of numbers)	order (a number)	depth (a number)	leaf (a truth state)	verbiage (a verb)	dobj (an object)	prep (a preposition)	iobj (an object)	success (a truth state)	negative (a truth state)	ctype (a cluster type)	cluster verb (a verb)	cluster dobj (an object)	cluster iobj (an object)
with 20 blank rows.

sentence-cluster is an insertion strategy.

Current cluster is a tree cursor. The table of Current cluster is (Table of Clusters). The insertion-strategy is sentence-cluster. The traversal-strategy is postorder.
Current location is a tree cursor. The table of Current location is (Table of Clusters). The insertion-strategy is sentence-cluster. The traversal-strategy is postorder.


A sentence is a kind of object. A sentence has a verb called the verbiage. A sentence has an object called the dobj. A sentence has a preposition called prep. A sentence has an object called iobj. A sentence has a truth state called success. A sentence has a truth state called negative. A sentence has a cluster type called ctype. A sentence has a verb called cluster verb. A sentence has an object called cluster dobj. A sentence has an object called cluster iobj.

Current sentence is a sentence.

A verbprop is a kind of value. The verbprops are collapsibility

Exhibition relates verbs to verbprops. The verb to exhibit means the exhibition relation.

Volume 2 - Rules

Tree-setting rule for a sentence (called S):
	choose row with id of (node id of the cursor in question) from the table of the cursor in question;
	now verbiage entry is the verbiage of S;
	now dobj entry is the dobj of S;
	now prep entry is the prep of S;
	now iobj entry is the iobj of S;
	now success entry is the success of S;
	now negative entry is the negative of S;
	now ctype entry is the ctype of S;
	now cluster verb entry is the cluster verb of S;
	now cluster dobj is the cluster dobj of S;
	now cluster iobj is the cluster iobj of S;
	
To decide which sentence is the sentence from (CS - a tree cursor):
	choose row with id of (node id of the cursor in question) from the table of the cursor in question;
	now verbiage of current sentence is verbiage entry;
	now dobj of current sentence is dobj entry;
	now prep of current sentence is prep entry;
	now iobj of current sentence is iobj entry;
	now success of current sentence is success entry;
	now negative of current sentence is negative entry;
	now ctype of current sentence is ctype entry;
	now cluster verb of current sentence is cluster verb entry;
	now cluster dobj of current sentence is cluster dobj entry;
	now cluster iobj of current sentence is cluster iobj entry;
	
Tree-reading rule for current cluster:
	rule succeeds with result sentence from current cluster;
	
Tree-reading rule for current location:
	rule succeeds with result sentence from current location;
	
Node-comparing rule for a sentence (called S):
	let t1 be "[verbiage of S] [dobj of S] [prep of S] [iobj of S]";
	let t2 be "[verbiage of the object in question] [dobj of the object in question] [prep of the object in question] [iobj of the object in question]"; 
	rule succeeds with result whether or not t1 > t2;
	
To create cluster node at (cursor - a tree cursor) of type (new cluster type - a cluster type):
	let existing id be node id of cursor;
	let new id be (the number of filled rows in table of cursor) + 1;
	choose blank row in table of cursor;
	now id entry is new id;
	now parent id entry is existing id;
	now child ids entry is {};
	now order entry is 1;
	now depth entry is depth at cursor + 1;
	now verbiage entry is verbiage at cursor;
	now dobj entry is dobj at cursor;
	now prep entry is prep at cursor;
	now iobj entry is iobj at cursor;
	now success entry is whether or not success at cursor;
	now negative entry is whether or not negative at cursor;
	choose row with id of existing id in table of cursor;
	now ctype entry is new cluster type;	
	now verbiage entry is verb placehold;	
	
[id (a number)	parent id (a number)	child ids (a list of numbers)	order (a number)	depth (a number)	leaf (a truth state)	verbiage (a verb)	dobj (an object)	prep (a preposition)	iobj (an object)	success (a truth state)	negative (a truth state)	ctype (a cluster type)	cluster verb (a verb)	cluster dobj (an object)	cluster iobj (an object)]

To move (cursor - a tree cursor) to next insertion point for verb (v - a verb) dobj (dobj - an object) prep (prep - a preposition) iobj (iobj - an object) success (success - a truth state) negative (negative - a truth state):
	DBG "moving cluster to next insertion point.";
	DBG "starting at [node id of cursor].";
	while ctype at cursor is no cluster and cursor is not childless:
		DBG "recursing down right side.";
		let child ids be children of cursor;
		if child ids is not empty:
			let last id be entry (number of entries in child ids) of child ids;
			move cursor to last id;	
	DBG "recursion finished.";
	let ctype be ctype at cursor;
	let cverbiage be verbiage at cursor;
	let cdobj be dobj at cursor;
	let ciobj be iobj at cursor;
	let new cluster type be no cluster;
	let uncluster be false;
	if cverbiage is not verb placehold:
		[this is a sentence node]
		DBG "this is a sentence node";
		push cursor;
		move cursor to parent;
		let parent ctype be ctype at cursor;
		pop cursor;
		if parent ctype is no cluster:
			[no clustering, so check for new clustering]
			let cluster verb be verb placehold;
			let cluster dobj be nothing;
			let cluster iobj be nothing;
			if cverbiage is v:
				if cdobj is dobj and dobj is not nothing:
					now new cluster type is verbdobj type;
					now cluster verb is v;
					now cluster dobj is dobj;
				otherwise if ciobj is iobj and iobj is not nothing:
					now new cluster type is verbiobj type;
					now cluster verb is v;
					now cluster iobj is iobj;
				otherwise:
					now new cluster type is verb type;
					now cluster verb is v;
			otherwise if cdobj is dobj and dobj is not nothing:
				if ciobj is iobj and iobj is not nothing:
					now new cluster type is dobjiobj type;
					now cluster dobj is dobj;
					now cluster iobj is iobj;
				otherwise:
					now new cluster type is dobj type;
					now cluster dobj is dobj;
			otherwise if ciobj is iobj and iobj is not nothing:
				now new cluster type is iobj type;
				now cluster iobj is iobj;
			if new cluster type is not no cluster:
				create cluster node at cursor of type new cluster type;
				choose row with id of (node id of cursor) from table of cursor;
				DBG "cluster node id [node id of cursor] [cluster verb] [cluster dobj] [cluster iobj]";
				now cluster verb entry is cluster verb;
				now cluster dobj entry is cluster dobj;
				now cluster iobj entry is cluster iobj;
		otherwise:
			[check for compatible clustering]
			DBG "check for compatible clustering";
			if parent ctype is:
				-- verb type:
					DBG "checking unclustering for verb [cverbiage]";
					let uncluster be whether or not cverbiage is not v;
				-- dobj type:
					let uncluster be whether or not cdobj is not dobj;
				-- iobj type:
					let uncluster be whether or not ciobj is not iobj;
				-- verbdobj type:
					let uncluster be whether or not (cverbiage is not v or cdobj is not dobj);
				-- verbiobj type:
					let uncluster be whether or not (cverbiage is not v or ciobj is not iobj);
				-- dobjiobj type:
					let uncluster be whether or not (cdobj is not dobj or ciobj is not iobj);
			if uncluster is true:
				move cursor to parent;
	otherwise:
		DBG "id: [node id of cursor]";
		if node id of cursor is not 1:
			move cursor to parent;
	DBG "cluster moved.";
		
	
	 
Node-inserting rule for an object (called X) when the insertion-strategy of the cursor in question is sentence-cluster:
	Insert phrase with verbiage of X dobj dobj of X prep prep of X iobj iobj of X success success of X into the cursor in question;
	
The sentence built is a text that varies. Sentence segments is a list of texts that varies. Phrase segments is a list of texts that varies.

The final word is an object that varies. The penultimate word is an object that varies.

To record (W - an object):
	now the penultimate word is the final word;
	now the final word is W;
	
To decide whether (V - a verb) is collapsible:
	yes;

This is the sentence-building rule:
	DBG "sentence building rule";
	let c be the cursor in question;
	if the ctype at the cursor in question is not no cluster:
		if ctype at the cursor in question is:
			-- verb type:
				add the substituted form of "[regarding the player][adapt the cluster verb at the cursor in question] [phrase segments]" to sentence segments;
			-- dobj type:
				add the substituted form of "[phrase segments] [the cluster dobj at the cursor in question]" to sentence segments;
				record the cluster dobj at the cursor in question;
			-- iobj type:
				do nothing;
			-- verbdobj type:
				do nothing;
			-- verbiobj type:
				do nothing;
			-- dobjiobj type:
				do nothing; 
		DBG "ss = [sentence segments]";
		remove phrase segments from phrase segments;
	otherwise if node id of the cursor in question is not 1:
		DBG "emitting phrase";
		push the cursor in question;
		move the cursor in question to parent;
		let parent ctype be the ctype at the cursor in question;
		pop the cursor in question;
		DBG "parent ctype = [parent ctype]";
		if parent ctype is:
			-- verb type:
				if iobj at the cursor in question is nothing:
					add the substituted form of "[the dobj at the cursor in question]" to phrase segments;
				otherwise:				
					add the substituted form of "[the dobj at the cursor in question] [prep at the cursor in question] [the iobj at the cursor in question ]" to phrase segments;
			-- dobj type:
				add the substituted form of "[regarding the player][adapt the verbiage at the cursor in question]" to phrase segments;
			-- iobj type:
				do nothing;
			-- verbdobj type:
				do nothing;
			-- verbiobj type:
				do nothing;
			-- dobjiobj type:				
				do nothing; 
			-- otherwise:
				if iobj at the cursor in question is nothing:
					add the substituted form of "[regarding the player][adapt the verbiage at the cursor in question] [the dobj at the cursor in question]" to sentence segments;
				otherwise:
					if the verbiage at the cursor in question exhibits collapsibility:
						add the substituted form of "[regarding the player][adapt the verbiage at the cursor in question] them" to sentence segments;
					otherwise:
						add the substituted form of "[regarding the player][adapt the verbiage at the cursor in question] [the dobj at the cursor in question] [prep at the cursor in question] [the iobj at the cursor in question]" to sentence segments;
				DBG "ss = [sentence segments]";
		DBG "ps = [phrase segments]";

Volume 3 - Getters

To decide which verb is the verbiage at (cursor - a tree cursor):
	if there is a verbiage corresponding to an id of (node id of cursor) in table of cursor:
		decide on the verbiage corresponding to an id of (node id of cursor) in table of cursor;
	decide on verb placehold;

To decide which object is the dobj at (cursor - a tree cursor):
	if there is a dobj corresponding to an id of (node id of cursor) in table of cursor:
		decide on the dobj corresponding to an id of (node id of cursor) in table of cursor;
	decide on nothing;

To decide which preposition is the prep at (cursor - a tree cursor):
	if there is a prep corresponding to an id of (node id of cursor) in table of cursor:
		decide on the prep corresponding to an id of (node id of cursor) in table of cursor;
	decide on with;

To decide which object is the iobj at (cursor - a tree cursor):
	if there is a iobj corresponding to an id of (node id of cursor) in table of cursor:
		decide on the iobj corresponding to an id of (node id of cursor) in table of cursor;
	decide on nothing;

To decide if success at (cursor - a tree cursor):
	if there is a success corresponding to an id of (node id of cursor) in table of cursor:
		decide on the success corresponding to an id of (node id of cursor) in table of cursor;
	decide on false;

To decide if negative at (cursor - a tree cursor):
	if there is a negative corresponding to an id of (node id of cursor) in table of cursor:
		decide on the negative corresponding to an id of (node id of cursor) in table of cursor;
	decide on false;
	
To decide which cluster type is the ctype at (cursor - a tree cursor):
	If there is a ctype corresponding to an id of (node id of cursor) in table of cursor:
		decide on the ctype corresponding to an id of (node id of cursor) in table of cursor;
	decide on no cluster;
	
To decide which verb is the cluster verb at (cursor - a tree cursor):
	If there is a cluster verb corresponding to an id of (node id of cursor) in table of cursor:
		decide on the cluster verb corresponding to an id of (node id of cursor) in table of cursor;
	decide on verb placehold;
	
To decide which object is the cluster dobj at (cursor - a tree cursor):
	If there is a cluster dobj corresponding to an id of (node id of cursor) in table of cursor:
		decide on the cluster dobj corresponding to an id of (node id of cursor) in table of cursor;
	decide on nothing;
	
Definition: a tree cursor is childless if it has no children.

To decide whether (cursor - a tree cursor) has no children:
	let child ids be the child ids corresponding to an id of (node id of cursor) in table of cursor;
	decide on whether or not child ids is empty;

Volume 4 - More Phrases

To insert new child number (N - a number) at (CS - a tree cursor):
	DBG "insert new child number.";
	DBG "cluster id = [node id of CS]";
	let child ids be children of CS;
	DBG "child ids = '[child ids]'.";
	add N to child ids;
	DBG "child ids = '[child ids]'.";
	DBG "cluster id = [node id of CS]";
	choose the row with id of (node id of CS) in the table of CS;
	DBG "row chosen";
	now child ids entry is child ids;
	DBG "inserted.";

[To move (CS - a tree cursor) to next insertion point for verb (v - a verb) dobj (dobj - an object) prep (prep - a preposition) iobj (iobj - an object) success (success - a truth state):
	do nothing;
]
To insert phrase with (v - a verb) dobj (dobj - an object) prep (prep - a preposition) iobj (iobj - an object) success (success - a truth state) into (CS - a tree cursor):
	push CS;
	move CS to next insertion point for verb v dobj dobj prep prep iobj iobj success success negative false;
	DBG "look up cluster properties";
	let new id be the number of filled rows in the table of CS + 1;
	let current parent child count be the number of entries of the children of CS;
	let parent depth be depth at CS;
	DBG "looked up cluster properties.";
	insert new child number (new id) at CS;
	DBG "create new row";
	choose a blank row in the table of CS;
	now id entry is new id;
	now parent id entry is (node id of CS);
	now child ids entry is {};
	now order entry is current parent child count + 1;
	now depth entry is parent depth + 1;
	now verbiage entry is v;
	now dobj entry is dobj;
	now prep entry is prep;
	now iobj entry is iobj;
	now leaf entry is true;
	now success entry is success;
	if DEBUG is true:
		showme the contents of the table of CS;
	pop cluster;
	
To decide which text is the sentence derived from (cursor - a tree cursor) with excuse (excuse - a text):
	do nothing;  
	
To decide which text is the sentence derived from (cursor - a tree cursor):
	now the sentence built is "";
	now the final word is nothing;
	now the penultimate word is nothing;
	remove phrase segments from phrase segments;
	remove sentence segments from sentence segments;
	visit cursor with the sentence-building rule;
	decide on "[We] [sentence segments]";

To reset sentences:
	DBG "reset sentences";
	blank out the whole of Table of Clusters;
	choose a blank row in the Table of Clusters;
	now id entry is 1;
	now parent id entry is 0;
	now child ids entry is { };
	now order entry is 1;
	now depth entry is 1;
	now leaf entry is false;
	now success entry is false;
	move current location to 1;
	move current cluster to 1;

Sentence Clusters Mk 2 ends here.
