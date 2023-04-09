Trees by Philip Riley begins here.

Volume 1 - Definitions

DEBUG is a truth state that varies. DEBUG is usually true.
To DBG (txt - a text):
	if DEBUG is true:
		say "DBG: [txt][line break]";

Table of Sample Tree
id (a number)	parent id (a number)	child ids (a list of numbers)	order (a number)	depth (a number)	leaf (a truth state)
with 1 blank row.

An insertion strategy is a kind of value.
The insertion strategies are add child and sorted binary.

A traversal strategy is a kind of value.
The traversal strategies are level-order, preorder, postorder, and in-order.

A tree cursor is a kind of object. A tree cursor has a table name called the table.
A tree cursor has a number called the node id. The node id of a tree cursor is usually 1.
A tree cursor has an insertion strategy called the insertion-strategy. The insertion-strategy of a tree cursor is usually add child.
A tree cursor has a traversal strategy called the traversal-strategy. The traversal-strategy of a tree cursor is usually level-order.
A tree cursor has a list of numbers called the node stack.

To push (cursor - a tree cursor):
	DBG "push [node id of cursor]";
	add node id of cursor at entry 1 in the node stack of cursor;
	DBG "node stack = [node stack of cursor]";

To pop (cursor - a tree cursor):
	let previous node id be entry 1 of the node stack of cursor;
	DBG "pop [previous node id]";
	remove entry 1 from the node stack of cursor;
	move cursor to previous node id;
	DBG "node stack = [node stack of cursor]";

Volume 2 - Phrases

To decide what number is the parent id at (cursor - a tree cursor):
	if there is a parent id corresponding to an id of (node id of cursor) in the table of cursor:
		decide on the parent id corresponding to an id of (node id of cursor) in the table of cursor;
	decide on 0;
	
To move (cursor - a tree cursor) to parent:
	DBG "move to [parent id at cursor]";
	now node id of cursor is the parent id at cursor;
	
To move (cursor - a tree cursor) to home:
	DBG "move to 1";
	now node id of cursor is 1;
	
To move (cursor - a tree cursor) to (N - a number):
	DBG "move to [N]";
	now node id of cursor is N;
	
To say (cursor - a tree cursor):
	say "[node id of cursor]: ([parent id at cursor])";

The cursor in question is a tree cursor that varies.	

To set (cursor - a tree cursor) to (obj - an object):
	DBG "set node [node id of cursor] to [obj].";
	now the cursor in question is cursor;
	follow the tree-setting rules for obj;
	
To decide what object is the value at (cursor - a tree cursor):
	decide on the object produced by the tree-reading rules for cursor;
	
To decide what number is the depth at (cursor - a tree cursor):
	decide on the depth corresponding to an id of (node id of cursor) in table of cursor;
	
To decide what list of numbers is the children of (cursor - a tree cursor):
	sort table of cursor in order order;
	sort table of cursor in parent id order;
	let R be a list of numbers;
	repeat through table of cursor:
		if parent id entry is node id of cursor:
			add id entry to R;
	decide on R;
	[decide on the child ids corresponding to an id of (node id of cursor) in the table of cursor;]
	
To choose (cursor - a tree cursor) row:
	choose row with id of (node id of cursor) from the table of cursor;

The object in question is an object that varies.	

To decide whether (X - an object) beats (Y - an object):
	now the object in question is Y;
	decide on whether or not the truth state produced by the node-comparing rules for X is true;
	
To decide what number is child number (N - a number) of (cursor - a tree cursor):
	repeat through the table of cursor:
		if parent id entry is node id of cursor and order entry is N:
			decide on id entry;
	decide on -1;

To simply insert (X - an object) into (cursor - a tree cursor) as child (N - a number):
	DBG "simply insert [X] as child [N]";
	let new id be number of filled rows in table of cursor + 1;
	choose row with id of (node id of cursor) from table of cursor;
	let child ids be child ids entry;
	let parent depth be the depth entry;
	add new id to child ids;
	now child ids entry is child ids;	
	choose a blank row in the table of cursor;
	now id entry is new id;
	now parent id entry is node id of cursor;
	now order entry is N;
	now depth entry is parent depth;
	now child ids entry is { };
	DBG "now set node to [X].";
	move cursor to id entry;
	set cursor to X;

Node-inserting rule for an object (called X) when the insertion-strategy of the cursor in question is add child:
	DBG "inserting into tree: [X]";
	let c be the cursor in question;
	let child ids be children of c;
	simply insert X into c as child (number of entries of child ids + 1);
	
Node-inserting rule for an object (called X) when the insertion-strategy of the cursor in question is sorted binary:
	DBG "inserting into sorted binary tree: [X]";
	let c be the cursor in question;
	while 1 is 1:
		if X beats value at c:
			let right child be child number 2 of c;
			if right child is -1:
				simply insert X into c as child 2;
				break;
			otherwise:
				move c to right child;
		otherwise:
			let left child be child number 1 of c;
			if left child is -1:
				simply insert X into c as child 1;
				break;
			otherwise:
				move c to left child;
			
To insert (X - an object) into (cursor - a tree cursor):
	now the cursor in question is cursor;
	DBG "starting node-inserting rules for [X]";
	follow the node-inserting rules for X;
	
To visit (cursor - a tree cursor) with (R - a rule):
	DBG "visit [node id of cursor]";
	let T be the list of numbers produced by the traversal rules for the cursor;
	now the cursor in question is cursor;
	DBG "traverse over ids: [T]";
	repeat with i running through T:
		move cursor to i;
		follow R;
	
To visit binary (cursor - a tree cursor) with (R - a rule):
	DBG "traverse the binary tree.";
	visit cursor with R;
	
Volume 3 - Rulebooks

Tree-setting is an object based rulebook.

Tree-reading is an object based rulebook producing objects.

Node-comparing is an object based rulebook producing truth states.

Node-inserting is an object based rulebook.

Traversal is a tree cursor based rulebook producing lists of numbers. 

Volume 4 - Individual Rules

Traversal rule for a tree cursor (called cursor) when the traversal-strategy of cursor is level-order (this is the level-order rule):
	DBG "level-order traversal rule";
	push cursor;
	let R be a list of numbers;
	add node id of cursor to R;
	let frontier be a list of numbers;
	add children of cursor to frontier;
	DBG "frontier = [frontier]";
	while frontier is not empty:
		let N be entry 1 of frontier;
		remove entry 1 from frontier;
		add N to R;
		move cursor to N;
		add children of cursor to frontier;
	pop cursor;
	rule succeeds with result R;

Traversal rule for a tree cursor (called cursor) when the traversal-strategy of cursor is in-order (this is the in-order rule):
	DBG "in-order traversal rule";
	push cursor;
	DBG "cursor = [node id of cursor]";
	let R be a list of numbers;	
	let c1 be child number 1 of cursor;
	DBG "c1 = [c1]";
	if c1 is not -1:
		move cursor to c1;
		let R1 be the list of numbers produced by the traversal rules for cursor;
		DBG "R1 = [R1]";
		add R1 to R;
		move cursor to parent;
	add node id of cursor to R;	
	let c2 be child number 2 of cursor;
	DBG "c2 = [c2]";
	if c2 is not -1:
		move cursor to c2;
		let R2 be the list of numbers produced by the traversal rules for cursor;
		DBG "R2 = [R2]";
		add R2 to R;
		move cursor to parent;
	pop cursor;
	rule succeeds with result R;
	
Traversal rule for a tree cursor (called cursor) when the traversal-strategy of cursor is preorder (this is the preorder rule):
	DBG "preorder traversal rule";
	push cursor;
	DBG "cursor = [node id of cursor]";
	let R be a list of numbers;	
	add node id of cursor to R;
	repeat with child running through children of cursor:
		DBG "child = [child]";
		move cursor to child;
		let R1 be the list of numbers produced by the traversal rules for cursor;
		DBG "R1 = [R1]";
		add R1 to R;
	pop cursor;
	rule succeeds with result R;
	
Traversal rule for a tree cursor (called cursor) when the traversal-strategy of cursor is postorder (this is the postorder rule):
	DBG "postorder traversal rule";
	push cursor;
	DBG "cursor = [node id of cursor]";
	let R be a list of numbers;	
	repeat with child running through children of cursor:
		DBG "child = [child]";
		move cursor to child;
		let R1 be the list of numbers produced by the traversal rules for cursor;
		DBG "R1 = [R1]";
		add R1 to R;
	pop cursor;
	add node id of cursor to R;
	rule succeeds with result R;

Trees ends here.
