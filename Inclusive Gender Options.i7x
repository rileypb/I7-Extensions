Version 4.1.230326 of Inclusive Gender Options by Philip Riley begins here.

"More broad-minded English language gender/number model where male, female, non-conforming, and neuter are four separate true-false properties.  Allows for objects to respond to any specified combination of HE, SHE, IT, and THEY.  As fast as the Standard Rules.  Tested with Inform v10.1.0."

[We replace very, very specific bits of the standard rules. This is based on Inform v10.1.0]

Include Standard Rules by Graham Nelson.

Volume - Enhanced Gender and Number Model

[Make male, female, and neuter independent.]

Chapter - Replace Standard Rules Elements Always

Section 11 - People and things with gender (in place of Section 11 - People in Standard Rules by Graham Nelson)

[These must overrride all other definitions.]
A thing can be neuter.  A thing is usually neuter.
A thing can be male.  A thing is usually not male.
A thing can be female.  A thing is usually not female.
A thing can be non-conforming. A thing is usually not non-conforming.

The non-conforming property translates into I6 as "non_conforming".

Include (-
Attribute non_conforming;
-)


[Ambiguously plural is defined in Basic Inform.  It isn't fully implemented, however.  It allows for "ambiguously plural" nouns like "a pair of shoes".  We need this line but it's in Basic Inform.i7x so we don't need it here:]
[An object can be ambiguously plural.]

[Beginning of text from original Section 11.]

The specification of person is "Despite the name, not necessarily
a human being, but anything animate enough to envisage having a
conversation with, or bartering with."

A person has a number called carrying capacity.
The carrying capacity of a person is usually 100.

[Standard Rules says "A person is always transparent", which is an unnecessary restriction on the story writer.]
A person can be transparent.  A person is usually transparent.

The yourself is an undescribed person. The yourself is proper-named.

The yourself is privately-named.
Understand "your former self" or "my former self" or "former self" or "former" as yourself when the player is not yourself.

The yourself object translates into Inter as "selfobj".

Section SR2.3.11A - Assumptions about people

[This section is separated out in case someone wants to replace it.  Sadly, Section is the smallest heading, so we can't embed this into the existing structure]

A person is usually not neuter.

A person is usually female.
A person is usually male.
A person is usually non-conforming.
[* This is less weird than it appears.  If you make a generic, unnamed person, the player can refer to said person as "him" or "her", interchangably.]

Section 12 - Animals, men and women revised (in place of Section 12 - Animals, men and women in Standard Rules by Graham Nelson)

The plural of man is men. The plural of woman is women. The plural of nonbinary is nonbinaries.

A man is a kind of person.
The specification of man is "Represents a man or boy."
A man is usually male.
A man is usually not female.
A man is usually not neuter.
A man is usually not non-conforming.

A woman is a kind of person.
The specification of woman is "Represents a woman or girl."
A woman is usually female.
A woman is usually not male.
A woman is usually not neuter.
A woman is usually not non-conforming.

A nonbinary is a kind of person.
The specification of nonbinary is "Represents a person who identifies as a gender other than male or female."
A nonbinary is usually non-conforming.
A nonbinary is usually not male.
A nonbinary is usually not female.
A nonbinary is usually not neuter.

An animal is a kind of person.
An animal is usually not male.
An animal is usually not female.
An animal is usually neuter.
An animal is usually not non-conforming.
[By default, refer to an animal as "it".]

The specification of animal is "Represents an animal, or at any rate a
non-human living creature reasonably large and possible to interact with: a
giant Venus fly-trap might qualify, but not a patch of lichen."

Section SR2.3.12A  - Inform 6 equivalent for male

[This saves a property since Inform 6 already has an unused male property.  This is actually only *required* for compatibility with Original Parser, which uses the term 'linguistically male' for what has to be the same property.  Several other properties must also have Inter translations but the ones in Standard Rules will do fine for our purposes.]
The male property translates into Inter as "male".

Chapter - Yourself Description - Standard

Section SR2.3.11B - Yourself Description 

[ this is (for use without Neutral Standard Responses by Nathanael Nerode) ]

The description of yourself is usually "As good-looking as ever."

Chapter - Yourself Description (for use with Neutral Standard Responses by Nathanael Nerode)

[We do it this way so that we can handle other extensions which interfere with the same text in the same way.  Which is likely.]

Section SR2.3.11B - Deleted Yourself Description (in place of Section SR2.3.11B - Yourself Description in Gender Options by Nathanael Nerode)

[ We don't need to give a description, because Neutral Standard Responses does. ]
[ In Inform version 6M62 (9.3) and earlier, there must be something, not a comment, in every section or bug 0001841 causes a compiler crash.  This is the smallest possible dummy we can create, occupying between 1 bit and 1 byte.  this is unnecessary in Inform v10.]
[ dummy_variable_1234567890 is a truth state that varies. ]

Volume - Parser Modifications for Pronoun Handling

[Make pronouns behave properly.]

Book - Additions by Zed Lopez in support of singular they

most-recent-reference-value is a kind of value.
The most-recent-reference-values are nominal and pronominal.
An object has a most-recent-reference-value called most recent reference.
The most recent reference property translates into i6 as "most_recent_reference".
The most recent reference of a thing is usually nominal.
Before printing the name of a thing (called item): now the most recent reference of the item is nominal.

Special third person mode is a truth state that varies.

Include (-

[ PNToVP ; ! gna;
    if (prior_named_list >= 2) return 6;
    if (prior_named_noun) {
      if ((prior_named_noun provides most_recent_reference) && prior_named_noun.most_recent_reference  == (+ pronominal +)) {
        if (prior_named_noun.third_singular_pronoun && prior_named_noun.third_singular_pronoun has pluralname) return 6;
        return 3;
      }
      if (prior_named_noun has pluralname) return 6;
    }
	return 3;
];

-) replacing "PNToVP".

A pronoun is a kind of object.

[ singular-named vs. plural-named:
  determines what grammatical number is used to conjugate corresponding verbs ]
A pronoun is usually singular-named. 

[ 1, 2, or 3. Only 3s' accusatives go into accusative-list ]
A pronoun has a number called the grammatical-person.

A third-person-personal-pronoun is a kind of pronoun.
The grammatical-person of third-person-personal-pronoun is usually 3.

[ corresponding to grammatical cases as defined in English Language and extended by Grammar Tests [TODO rename]:
  nominative, accusative, possessive, reflexive, tpossessive adjective,
  e.g., { "I", "me", "mine", "myself", "my" }. ]
A pronoun has a list of texts called the declensions. 

[ set neuter if antecedent can/should be referred to as "that"]
A pronoun can be neuter.

[To decide what narrative viewpoint is the viewpoint of (p - a pronoun):
    let gnum be gn-singular;
    if p is plural-named, now gnum is gn-plural;
    decide on the viewpoint of grammatical-person of p and gnum.]

I-pronoun is a pronoun.
The grammatical-person of I-pronoun is 1.
The declensions of I-pronoun are { "I", "me", "mine", "myself", "my" }.

We-pronoun is a pronoun.
The grammatical-person of we-pronoun is 1.
We-pronoun is plural-named.
The declensions of we-pronoun are { "we", "us", "ours", "ourselves", "our" }.

It-pronoun is a pronoun.
It-pronoun is neuter.
The grammatical-person of it-pronoun is 3.
The declensions of it-pronoun are { "it", "it", "its", "itself", "its" }.

He-pronoun is a pronoun.
The grammatical-person of he-pronoun is 3.
The declensions of he-pronoun are { "he", "him", "his", "himself", "his" }.

She-pronoun is a pronoun.
The grammatical-person of she-pronoun is 3.
The declensions of she-pronoun are { "she", "her", "hers", "herself", "her" }.

Singular-you-pronoun is a pronoun.
The grammatical-person of singular-you-pronoun is 2.
The declensions of singular-you-pronoun are { "you", "you", "yours", "yourself", "your" }.

Plural-you-pronoun is a pronoun.
The grammatical-person of plural-you-pronoun is 2.
Plural-you-pronoun is plural-named.
The declensions of plural-you-pronoun are { "you", "you", "yours", "yourselves", "our" }.

They-pronoun is a pronoun.
The grammatical-person of they-pronoun is 3.
They-pronoun is plural-named.
The declensions of They-pronoun are { "they", "them", "theirs", "themselves", "their" }.

Singular-they-pronoun is a pronoun.
The grammatical-person of singular-they-pronoun is 3.
Singular-they-pronoun is plural-named.
The declensions of singular-they-pronoun are { "they", "them", "theirs", "themself", "their" }.

An object has a pronoun called the third singular pronoun.
The third singular pronoun property translates into i6 as "third_singular_pronoun".
The third singular pronoun of an object is usually it-pronoun.

A thing has a pronoun called the third-plural-pronoun.
The third-plural-pronoun of a thing is usually they-pronoun.

A person has a pronoun called the first-singular-pronoun.
The first-singular-pronoun of a person is usually I-pronoun.
A person has pronoun called the first-plural-pronoun.
The first-plural-pronoun of a person is usually we-pronoun.
A person has pronoun called the second-singular-pronoun.
The second-singular-pronoun of a person is usually singular-you-pronoun.
A person has pronoun called the second-plural-pronoun.
The second-plural-pronoun of a person is usually plural-you-pronoun.
The third singular pronoun of a person is usually singular-they-pronoun.

[ These are defaults and can be over-ridden as desired ]
The third singular pronoun of a man is usually he-pronoun.
The third singular pronoun of a woman is usually she-pronoun.


Part - Universal Fix

Chapter - Fix Pronoun Bitmask Table

[Aw heck.  After all that work below it turns out there's a conceptual error in the bitmask table --
it thinks all inanimate objects are neuter.  Drop down to I6 and fix it.  There may be a cleaner
method, but this is the least invasive, unbelievably.]

Include (-

! ==== ==== ==== ==== ==== ==== ==== ==== ==== ====
! Gender Options replacement for Language.i6t: Pronouns
! ==== ==== ==== ==== ==== ==== ==== ==== ==== ====

Array LanguagePronouns table

  ! word        possible GNAs                   connected
  !             to follow:                      to:
  !             a       i  
  !             s   p   s   p 
  !             mfnbmfnbmfnbmfnb

    'it'         	$$0010000000100000                    NULL
    'him'    	$$1000000010000000                    NULL
    'her'     	$$0100000001000000                    NULL
    'them'    	$$0001111100011111                    NULL;

-) replacing "LanguagePronouns".

Part - Core i6 Parser Fix (for use without Original Parser by Ron Newcomb)

Chapter - Revisions Not Made

[Oddly, it turns out we don't need to alter the Gender section of the parser, which defines GetGender and GetGNAOfObject.

We could and should remove GetGender, which will give bad info.  It is dead code.

GetGNAOfObject is used in four places: two in ListWriter.i6t, and one each in Printing.i6t and Parser.i6t.

ListWriter applies GetGNAOfObject mod 3 to track prior_named_list_gender, but prior_named_list_gender is a write-only variable (dead code).

Printing uses GetGNAOfObject, then applies LanguageGNAsToArticles, which strips out the gender and gives only the plural status.
This is used only to match articles (the / an / some), so it checks only for pluralname, not for ambigpluralname, which is correct.
(An ambiguous plural name like 'pair of shoes' should have a 'the'/'an'.)

ListWriter applies (GetGNAOfObject mod 6 / 3) in PNToVP, which is called by the autogenerated verb conjugation code.  It's only checking for plurals, again.  This could be patched.
There is a suggestion to patch it to allow for "singular they".  "The shadowy figure lurks; they look angry."

Parser only uses GetGNAOfObject in 'best guess', which is a 1 point disambiguator and not very important.
It does unfortunately check gender, using the old method.
We could fix it by replacing the ENTIRE ScoreMatchL section of the parser, but it's not worth the sheer level of invasiveness.

To work with foreign languages which have gendered plurals, it would be necessary to:
(a) use GetGNABitfield in Parser
(b) rewrite GetGNAOfObject to check the preferred printing genders for the other calls.

Summary: new code should not use GetGender or GetGNAOfObject, but we don't need to edit the old code.
]

Chapter - Pronoun Handling Revised

[The change to PronounNotice should actually work for all languages and new pronouns;
but a new language or new pronouns would require a different GetGNABitfield implementation. ]

Section - SetProunoun bugfix

[ SetPronoun is obsolete but we fix its runtime error number anyway, since it should be fixed ]

Include (-
[ SetPronoun dword value x;
    for (x=1 : x<=LanguagePronouns-->0 : x=x+3)
        if (LanguagePronouns-->x == dword) {
            LanguagePronouns-->(x+2) = value; return;
        }
    RunTimeError(12);
];
-) replacing "SetPronoun".

Section - GetGNABitfield

[This is the primary logic change, allowing male, female, and neuter to be three separate bits, properly.]

[This is harder than it should be because the (+ +) notation completely stopped working in Inform 10.
Thankfully, we have named I6/Inter attributes for everything (from Definitions.i6t in the BasicInformKit).
Some of the Inter translations are specified in Standard Rules; "male" is specified earlier in this file.]

Include (-
[ GetGNABitfield obj g gn;
	! First calculate three-bit gender field
	g = 0;
	if ( obj has neuter ) {
		g = g + 2;	! bit position 0
		}
	if ( obj has female ) {
		g = g + 4;	! bit position 1
		}
	if ( obj has male ) {
		g = g + 8;	! bit position 2
		}
	if ( obj has non_conforming ) {
		g = g + 1;	! bit position 3
		}
	gn = 0;
	if ( obj has ambigpluralname  ) {
		gn = g * 17;	 ! plural in low significant digits, plus singular shifted four to the left
	} else if ( obj has pluralname ) {
		gn = gn + g;	! plural is in low significant digits
	} else {	! obj is singular-named
		gn = gn + g * 16;	! singular is shifted 4 to the left
	}
	if ( obj has animate ) {
		return gn * 256;	! shift 8 to the left for animate objects
		}
	return gn;	! shift 0];
];
-)

Section - PronounNotice

[Replace GetGNAOfObject call with GetGNABitfield call.  This is the main hook.]

Include (-
[ PronounNotice obj x bm;
    if (obj == player) return;

    bm = GetGNABitfield(obj);  ! This is the change made by Gender Options by Nathanael Nerode.

    for (x=1 : x<=LanguagePronouns-->0 : x=x+3)
        if (bm & (LanguagePronouns-->(x+1)) ~= 0)
            LanguagePronouns-->(x+2) = obj;
];
-) replacing "PronounNotice".

Section - Unset pronouns from

[Per default, if you are changing the gender of characters, it doesn't change any pronoun referents already set.  So if "him" is referring to Ned, and Ned stops being male, "him" will continue to refer to Ned until the player looks at another male character.  Under some circumstances, this satisfies "principle of least surprise" -- but under others it doesn't.  If you want to make sure that Ned is no longer referred to as him, "unset pronouns from Ned". ]

Include (-
[ PronounUnNotice obj x bm;
    if (obj == player) return;

    bm = GetGNABitfield(obj);
    for (x=1 : x < (LanguagePronouns-->0 - 2) : x=x+3)
        if ((bm & (LanguagePronouns-->(x+1)) == 0) && (LanguagePronouns-->(x+2) == obj))
            LanguagePronouns-->(x+2) = NULL;
];
-)

to unset pronouns from (O - an object):
	(- PronounUnNotice({O}); -)


Part - Original Parser Fix (for use with Original Parser by Ron Newcomb)

Chapter - Pronoun Handling Revised ( in place of Chapter - Pronoun Handling in Original Parser by Ron Newcomb )

[Most of this is the same as in the original.  However, "To decide which word usage is the gender-animation usages for " is *completely* different.]

[To reset vague words with (obj - an object) (this is ResetVagueWords): set pronouns from the obj.]

To change (pronoun - an understood word) to (obj - an object) (this is SetPronoun):
	if the pronoun is listed as one of the pronouns in the language's pronoun list:
		now chosen antecedent element is obj;
		stop;
	issue the 14th run-time message "** Library error 14 (0,0) **[line break]** (unexplained) **[line break]".

[ Returns 'nothing' if the inputted word isn't one of the four pronouns.  Returns the 'used-up object' (NULL) if it's an unset pronoun. ]
To decide which object is what (pronoun - an understood word) stands for (this is PronounValue):
	if the pronoun is listed as one of the pronouns in the language's pronoun list:
		decide on the antecedent element.

[We're handling the gender rules differently from standard Inform and differently from Ron's extension.

The key is that an object can have multiple gender matches and multiple singular/plural matches, and they're all handled correctly.

In Original Parser, the GNA/ grammatical case should be a separate type from the word usage, but it isn't.  Yet. 

This is a super-tedious way of dealing with the translation between I7 and I6 without fighting too much with I7's type system.  It cannot possibly be efficient.

The acronyms stand for:
"Animate" or "Inanimate"
"Singular" or "Plural"
"Male", "Female", "Neuter", or "nonBinary"
]
To decide what word usage is
	the empty bitfield:	(- $$000000000000 -).
To decide what word usage is 
	_a_s_m: (- $$1000000000000000 -).
To decide what word usage is
	_a_s_f: (- $$0100000000000000 -).
To decide what word usage is
	_a_s_n: (- $$0010000000000000 -).
To decide what word usage is
	_a_s_b: (- $$0001000000000000 -).
To decide what word usage is 
	_a_p_m: (- $$0000100000000000 -).
To decide what word usage is 
	_a_p_f: (- $$0000010000000000 -).
To decide what word usage is 
	_a_p_n: (- $$0000001000000000 -).
To decide what word usage is 
	_a_p_b: (- $$0000000100000000 -).
To decide what word usage is 
	_i_s_m:	(- $$0000000100000000 -).
To decide what word usage is 
	_i_s_f:	(- $$0000000010000000 -).
To decide what word usage is 
	_i_s_n: (- $$0000000001000000 -).
To decide what word usage is 
	_i_s_b: (- $$0000000000100000 -).
To decide what word usage is 
	_i_p_m: (- $$0000000000010000 -).
To decide what word usage is 
	_i_p_f: (- $$0000000000001000 -).
To decide what word usage is 
	_i_p_n:	(- $$0000000000000100 -).
To decide what word usage is 
	_i_p_b:	(- $$0000000000000010 -).

[This pulls up the matching pronoun types for an object.

It has been modified to account for ambiguously plural objects and multi-gendered things and people.

Note: the animate-handling is wrong; it makes it hard to call a ship "her".]
	
To decide which word usage is the gender-animation usages for (obj - object):
	Let GNAbits be a word usage;
	Let GNAbits be the empty bitfield;
	Let animated be a truth state;
	if obj is a person:
		now animated is true;
	otherwise:
		now animated is false;
	if animated is true:
		if obj is singular-named or obj is ambiguously plural:
			if obj is male, include _a_s_m in GNAbits;
			if obj is female, include _a_s_f in GNAbits;
			if obj is non-conforming, include _a_s_b in GNAbits;
			if obj is neuter, include _a_s_n in GNAbits;
		if obj is plural-named or obj is ambiguously plural:
			if obj is male, include _a_p_m in GNAbits;
			if obj is female, include _a_p_f in GNAbits;
			if obj is non-conforming, include _a_p_b in GNAbits;
			if obj is neuter, include _a_p_n in GNAbits;
	otherwise:
		if obj is singular-named or obj is ambiguously plural:
			if obj is male, include _i_s_m in GNAbits;
			if obj is female, include _i_s_f in GNAbits;
			if obj is non-conforming, include _i_s_b in GNAbits;
			if obj is neuter, include _i_s_n in GNAbits;
		if obj is plural-named or obj is ambiguously plural:
			if obj is male, include _i_p_m in GNAbits;
			if obj is female, include _i_p_f in GNAbits;
			if obj is non-conforming, include _i_p_b in GNAbits;
			if obj is neuter, include _i_p_n in GNAbits;
	decide on GNAbits.
	
[This will correctly match if you give it a combination of multiple pronoun options.  Test this with androgynes and ambiguously plural nouns.]

[This eliminates the use of GetGNAOfObject in the parser, but unfortunately it's still used in an exported capacity by Language.i6t.]

To set pronouns from (obj - an object) (this is PronounNotice):
	if the obj is the player, stop;  [ even in 3rd person, the player wouldn't refer to his avatar as him/her. ]
	repeat through all three columns of the language's pronoun list:
		if the gender-animation element includes any of the gender-animation usages for the obj:
			now chosen antecedent element is obj.

Chapter - English Pronoun Names For I7

[This allows statements like "now 'he' is Alan".  Poorly tested.]

To decide what understood word is 'he': (- 'he' -).
To decide what understood word is 'she': (- 'she' -).
To decide what understood word is 'it': (- 'it' -).
To decide what understood word is 'them': (- 'them' -).

Volume - English Language (for use with English Language by Graham Nelson)

[It proved necessary to replace practically the entire extension. Modal verbs and contractions and Grammatical definitions are unchanged.]

Section - Preferred Gender

A grammatical gender is a kind of value. The grammatical genders are
neuter gender, masculine gender, feminine gender.
The neitherine gender is a grammatical gender.

Prefer neuter gender is a truth state that varies.
Prefer neuter gender is usually true.
The preferred animate gender is a grammatical gender which varies.
The preferred animate gender is usually masculine gender.  [Matches old-fashioned English.]

To decide which grammatical gender is the printing gender for (o - an object):
	[not male or female, always use "it"]
	if o is not male and o is not female and o is not non-conforming:
		decide on neuter gender;
	[neuter and prefer neuter gender, always use "it"]
	if o is neuter and prefer neuter gender is true:
		decide on neuter gender;
	[female and male, use preferred animate gender]
	if o is female and o is male:
		decide on preferred animate gender;
	[classic male; and non-neuter or male overrrides neuter]
	if o is male:
		decide on masculine gender;
	[classic female; and non-neuter or female overrrides neuter]
	if o is female:
		decide on feminine gender;
	[classic non-conforming; and non-neuter or non-conforming overrrides neuter]
	if o is non-conforming:
		decide on neitherine gender.

Section - Viewpoint pronouns (in place of Section 2 - Saying pronouns in English Language by Graham Nelson)



Last person referenced is an object that varies. last person referenced is initially nothing.

Before reading a command (this is the clear LPR rule):
	now last person referenced is nothing;

Before printing the name of a person (called P):
	if not expanding text for comparison purposes:
		now most recent reference of P is nominal;
		now last person referenced is P;	
		
To reset LPR:
	if not expanding text for comparison purposes:
		now last person referenced is nothing;

To say we:
	if the last person referenced is not the player and special third person mode is true:
		say "[player]";
	otherwise:
		now the prior named object is the player;
		now the most recent reference of the prior named object is pronominal;
		if the story viewpoint is:
			-- first person singular: say "I";
			-- second person singular: say "you";
			-- third person singular:
				if printing gender for the player is:
					-- the masculine gender: say "he";
					-- the feminine gender: say "she";
					-- the neuter gender: say "it";
					-- the neitherine gender: say entry 1 in the declensions of the third singular pronoun of the player;;
			-- first person plural: say "we";
			-- second person plural: say "you";
			-- third person plural: say "they";

To say we're:
	if the last person referenced is not the player and special third person mode is true:
		say "[player]'s";
	otherwise:
		now the prior named object is the player;
		now the most recent reference of the prior named object is pronominal;
		if the story viewpoint is:
			-- first person singular: say "I'm";
			-- second person singular: say "you're";
			-- third person singular:
				if printing gender for the player is:
					-- the masculine gender: say "he's";
					-- the feminine gender: say "she's";
					-- the neuter gender: say "it's";
					-- the neitherine gender: say "[entry 1 in the declensions of the third singular pronoun of the player][']re";
			-- first person plural: say "we're";
			-- second person plural: say "you're";
			-- third person plural: say "they're";

To say we've:	
	if last person referenced is not the player and special third person mode is true:
		say "[player]'s";
	otherwise:
		now the prior named object is the player;
		now the most recent reference of the prior named object is pronominal;
		if the story viewpoint is:
			-- first person singular: say "I've";
			-- second person singular: say "you've";
			-- third person singular:
				if printing gender for the player is:
					-- the masculine gender: say "he's";
					-- the feminine gender: say "she's";
					-- the neuter gender: say "it's";
					-- the neitherine gender: say "[entry 1 in the declensions of the third singular pronoun of the player]'ve";
			-- first person plural: say "we've";
			-- second person plural: say "you've";
			-- third person plural: say "they've";

To say us:
	if the last person referenced is not the player and special third person mode is true:
		say "[player]";
	otherwise:
		now the prior named object is the player;
		if the story viewpoint is:
			-- first person singular: say "me";
			-- second person singular: say "you";
			-- third person singular:
				if printing gender for the player is:
					-- the masculine gender: say "him";
					-- the feminine gender: say "her";
					-- the neuter gender: say "it";
					-- the neitherine gender: say entry 2 in the declensions of the third singular pronoun of the player;
			-- first person plural: say "us";
			-- second person plural: say "you";
			-- third person plural: say "them";

To say ours:
	if the last person referenced is not the player and special third person mode is true:
		say "[player]'s";
	otherwise:
		now the prior named object is the player;
		if the story viewpoint is:
			-- first person singular: say "mine";
			-- second person singular: say "yours";
			-- third person singular:
				if printing gender for the player is:
					-- the masculine gender: say "his";
					-- the feminine gender: say "hers";
					-- the neuter gender: say "its";
					-- the neitherine gender: say entry 3 in the declensions of the third singular pronoun of the player;
			-- first person plural: say "ours";
			-- second person plural: say "yours";
			-- third person plural: say "theirs";

To say ourselves:
	now the prior named object is the player;
	if the story viewpoint is:
		-- first person singular: say "myself";
		-- second person singular: say "yourself";
		-- third person singular:
			if printing gender for the player is:
				-- the masculine gender: say "himself";
				-- the feminine gender: say "herself";
				-- the neuter gender: say "itself";
				-- the neitherine gender: say entry 4 in the declensions of the third singular pronoun of the player;
		-- first person plural: say "ourselves";
		-- second person plural: say "yourselves";
		-- third person plural: say "themselves";

To say our:
	if the last person referenced is not the player and special third person mode is true:
		say "[player]'s";
	otherwise:
		now the prior named object is the player;
		if the story viewpoint is:
			-- first person singular: say "my";
			-- second person singular: say "your";
			-- third person singular:
				if printing gender for the player is:
					-- the masculine gender: say "his";
					-- the feminine gender: say "her";
					-- the neuter gender: say "its";
					-- the neitherine gender: say entry 5 in the declensions of the third singular pronoun of the player;
			-- first person plural: say "our";
			-- second person plural: say "your";
			-- third person plural: say "their";

To say We:	
	if last person referenced is not the player and special third person mode is true:
		say "[player]";
	otherwise:
		now the prior named object is the player;
		now the most recent reference of the prior named object is pronominal;
		if the story viewpoint is:
			-- first person singular: say "I";
			-- second person singular: say "You";
			-- third person singular:
				if printing gender for the player is:
					-- the masculine gender: say "He";
					-- the feminine gender: say "She";
					-- the neuter gender: say "It";
					-- the neitherine gender: say "[entry 1 in the declensions of the third singular pronoun of the player in title case]";
			-- first person plural: say "We";
			-- second person plural: say "You";
			-- third person plural: say "They";

To say We're:	
	if last person referenced is not the player and special third person mode is true:
		say "[player]'s";
	otherwise:
		now the prior named object is the player;
		now the most recent reference of the prior named object is pronominal;
		if the story viewpoint is:
			-- first person singular: say "I'm";
			-- second person singular: say "You're";
			-- third person singular:
				if printing gender for the player is:
					-- the masculine gender: say "He's";
					-- the feminine gender: say "She's";
					-- the neuter gender: say "It's";
					-- the neitherine gender: say "[entry 1 in the declensions of the third singular pronoun of the player in title case]'re";
			-- first person plural: say "We're";
			-- second person plural: say "You're";
			-- third person plural: say "They're";

To say We've:	
	if last person referenced is not the player and special third person mode is true:
		say "[player]'s";
	otherwise:
		now the prior named object is the player;
		now the most recent reference of the prior named object is pronominal;
		if the story viewpoint is:
			-- first person singular: say "I've";
			-- second person singular: say "You've";
			-- third person singular:
				if printing gender for the player is:
					-- the masculine gender: say "He's";
					-- the feminine gender: say "She's";
					-- the neuter gender: say "It's";
					-- the neitherine gender: say "[entry 1 in the declensions of the third singular pronoun of the player in title case]'ve";
			-- first person plural: say "We've";
			-- second person plural: say "You've";
			-- third person plural: say "They've";

To say Us:
	if the last person referenced is not the player and special third person mode is true:
		say "[player]";
	otherwise:
		now the prior named object is the player;
		if the story viewpoint is:
			-- first person singular: say "Me";
			-- second person singular: say "You";
			-- third person singular:
				if printing gender for the player is:
					-- the masculine gender: say "Him";
					-- the feminine gender: say "Her";
					-- the neuter gender: say "It";
					-- the neitherine gender: say "[entry 2 in the declensions of the third singular pronoun of the player in title case]";
			-- first person plural: say "Us";
			-- second person plural: say "You";
			-- third person plural: say "Them";

To say Ours:
	if the last person referenced is not the player and special third person mode is true:
		say "[player]'s";
	otherwise:
		now the prior named object is the player;
		if the story viewpoint is:
			-- first person singular: say "Mine";
			-- second person singular: say "Yours";
			-- third person singular:
				if printing gender for the player is:
					-- the masculine gender: say "His";
					-- the feminine gender: say "Hers";
					-- the neuter gender: say "Its";
					-- the neitherine gender: say "[entry 3 in the declensions of the third singular pronoun of the player in title case]";
			-- first person plural: say "Ours";
			-- second person plural: say "Yours";
			-- third person plural: say "Theirs";

To say Ourselves:
	now the prior named object is the player;
	if the story viewpoint is:
		-- first person singular: say "Myself";
		-- second person singular: say "Yourself";
		-- third person singular:
			if printing gender for the player is:
				-- the masculine gender: say "Himself";
				-- the feminine gender: say "Herself";
				-- the neuter gender: say "Itself";
				-- the neitherine gender: say "[entry 4 in the declensions of the third singular pronoun of the player in title case]";
		-- first person plural: say "Ourselves";
		-- second person plural: say "Yourselves";
		-- third person plural: say "Themselves";

To say Our:
	if the last person referenced is not the player and special third person mode is true:
		say "[player]'s";
	otherwise:
		now the prior named object is the player;
		if the story viewpoint is:
			-- first person singular: say "My";
			-- second person singular: say "Your";
			-- third person singular:
				if printing gender for the player is:
					-- the masculine gender: say "His";
					-- the feminine gender: say "Her";
					-- the neuter gender: say "Its";
					-- the neitherine gender: say "[entry 5 in the declensions of the third singular pronoun of the player in title case]";
			-- first person plural: say "Our";
			-- second person plural: say "Your";
			-- third person plural: say "Their";

Section - Further pronouns (in place of Section 3 - Further pronouns in English Language by Graham Nelson)

To say those:
	say those in the accusative.

To say Those:
	say Those in the nominative.

To say those in (case - grammatical case):
	if the case is nominative:
		let the item be the prior named object;
		now the most recent reference of the prior named object is pronominal;
		if the prior naming context is plural:
			say "those";
		otherwise if the item is the player:
			say "[we]";
		otherwise:
			if printing gender for the item is:
				-- the masculine gender: say "he";
				-- the feminine gender: say "she";
				-- the neuter gender: say "that";
				-- the neitherine gender: say entry 1 in the declensions of the third singular pronoun of the player;
	otherwise:
		let the item be the prior named object;
		if the prior naming context is plural:
			say "those";
		otherwise if the item is the player:
			say "[we]";
		otherwise:
			if printing gender for the item is:
				-- the masculine gender: say "him";
				-- the feminine gender: say "her";
				-- the neuter gender: say "that";
				-- the neitherine gender: say entry 2 in the declensions of the third singular pronoun of the player;;

To say Those in (case - grammatical case):
	if the case is nominative:
		let the item be the prior named object;
		now the most recent reference of the prior named object is pronominal;
		if the prior naming context is plural:
			say "Those";
		otherwise if the item is the player:
			say "[We]";
		otherwise:
			if printing gender for the item is:
				-- the masculine gender: say "He";
				-- the feminine gender: say "She";
				-- the neuter gender: say "That";
				-- the neitherine gender: say "[entry 1 in the declensions of the third singular pronoun of the item in title case]";
	otherwise:
		let the item be the prior named object;
		if the prior naming context is plural:
			say "Those";
		otherwise if the item is the player:
			say "[We]";
		otherwise:
			if printing gender for the item is:
				-- the masculine gender: say "Him";
				-- the feminine gender: say "Her";
				-- the neuter gender: say "That";
				-- the neitherine gender: say "[entry 2 in the declensions of the third singular pronoun of the item in title case]";

To say they:
	let the item be the prior named object;
	now the most recent reference of the prior named object is pronominal;
	if the prior naming context is plural:
		say "they";
	otherwise if the item is the player:
		say "[we]";
	otherwise:
		if printing gender for the item is:
			-- the masculine gender: say "he";
			-- the feminine gender: say "she";
			-- the neuter gender: say "it";
			-- the neitherine gender: say entry 1 in the declensions of the third singular pronoun of the item;
 
To say They:
	let the item be the prior named object;
	now the most recent reference of the prior named object is pronominal;
	if the prior naming context is plural:
		say "They";
	otherwise if the item is the player:
		say "[We]";
	otherwise:
		if printing gender for the item is:
			-- the masculine gender: say "He";
			-- the feminine gender: say "She";
			-- the neuter gender: say "It";
			-- the neitherine gender: say "[entry 1 in the declensions of the third singular pronoun of the item in title case]";

To say their:
	let the item be the prior named object;
	now the most recent reference of the prior named object is pronominal;
	if the prior naming context is plural:
		say "their";
	otherwise if the item is the player:
		say "[our]";
	otherwise:
		if printing gender for the item is:
			-- the masculine gender: say "his";
			-- the feminine gender: say "her";
			-- the neuter gender: say "its";
			-- the neitherine gender: say entry 5 in the declensions of the third singular pronoun of the item;

To say Their:
	let the item be the prior named object;
	now the most recent reference of the prior named object is pronominal;
	if the prior naming context is plural:
		say "Their";
	otherwise if the item is the player:
		say "[Our]";
	otherwise:
		if printing gender for the item is:
			-- the masculine gender: say "His";
			-- the feminine gender: say "Her";
			-- the neuter gender: say "Its";
			-- the neitherine gender: say "[entry 5 in the declensions of the third singular pronoun of the item in title case]";

To say them:
	let the item be the prior named object;
	now the most recent reference of the prior named object is pronominal;
	if the prior naming context is plural:
		say "them";
	otherwise if the item is the player:
		say "[us]";
	otherwise:
		if printing gender for the item is:
			-- the masculine gender: say "him";
			-- the feminine gender: say "her";
			-- the neuter gender: say "it";
			-- the neitherine gender: say entry 2 in the declensions of the third singular pronoun of the item;

To say Them:
	let the item be the prior named object;
	now the most recent reference of the prior named object is pronominal;
	if the prior naming context is plural:
		say "Them";
	otherwise if the item is the player:
		say "[Us]";
	otherwise:
		if printing gender for the item is:
			-- the masculine gender: say "Him";
			-- the feminine gender: say "Her";
			-- the neuter gender: say "It";
			-- the neitherine gender: say "[entry 2 in the declensions of the third singular pronoun of the item in title case]";

To say theirs:
	let the item be the prior named object;
	now the most recent reference of the prior named object is pronominal;
	if the prior naming context is plural:
		say "theirs";
	otherwise if the item is the player:
		say "[ours]";
	otherwise:
		if printing gender for the item is:
			-- the masculine gender: say "his";
			-- the feminine gender: say "hers";
			-- the neuter gender: say "its";
			-- the neitherine gender: say entry 3 in the declensions of the third singular pronoun of the item;

To say Theirs:
	let the item be the prior named object;
	now the most recent reference of the prior named object is pronominal;
	if the prior naming context is plural:
		say "Theirs";
	otherwise if the item is the player:
		say "[Ours]";
	otherwise:
		if printing gender for the item is:
			-- the masculine gender: say "His";
			-- the feminine gender: say "Hers";
			-- the neuter gender: say "Its";
			-- the neitherine gender: say "[entry 2 in the declensions of the third singular pronoun of the item in title case]";

To say themselves:
	let the item be the prior named object;
	now the most recent reference of the prior named object is pronominal;
	if the prior naming context is plural:
		say "themselves";
	otherwise if the item is the player:
		say "[ourselves]";
	otherwise:
		if printing gender for the item is:
			-- the masculine gender: say "himself";
			-- the feminine gender: say "herself";
			-- the neuter gender: say "itself";
			-- the neitherine gender: say entry 4 in the declensions of the third singular pronoun of the item;

To say Themselves:
	let the item be the prior named object;
	now the most recent reference of the prior named object is pronominal;
	if the prior naming context is plural:
		say "Themselves";
	otherwise if the item is the player:
		say "[Ourselves]";
	otherwise:
		if printing gender for the item is:
			-- the masculine gender: say "Himself";
			-- the feminine gender: say "Herself";
			-- the neuter gender: say "Itself";
			-- the neitherine gender: say "[entry 24 in the declensions of the third singular pronoun of the item in title case]";

[English Language used /they're/ to do "that's" which is counterintuitive, but preserved.
 /they/ /'re/ gives the expected behavior.
]
To say they're:
	let the item be the prior named object;
	now the most recent reference of the prior named object is pronominal;
	if the prior naming context is plural:
		say "they";
	otherwise if the item is the player:
		say "[we]";
	otherwise:
		if printing gender for the item is:
			-- the masculine gender: say "he";
			-- the feminine gender: say "she";
			-- the neuter gender: say "that";
			-- the neitherine gender: say entry 1 in the declensions of the third singular pronoun of the item;
	say "['re]".

To say They're:
	let the item be the prior named object;
	now the most recent reference of the prior named object is pronominal;
	if the prior naming context is plural:
		say "They";
	otherwise if the item is the player:
		say "[We]";
	otherwise:
		if printing gender for the item is:
			-- the masculine gender: say "He";
			-- the feminine gender: say "She";
			-- the neuter gender: say "That";
			-- the neitherine gender: say "[entry 1 in the declensions of the third singular pronoun of the item in title case]";
	say "['re]".

To say It:
	say "[regarding nothing]It".

To say There:
	say "[regarding nothing]There".

To say it:
	say "[regarding nothing]it".

To say there:
	say "[regarding nothing]there".

To say It's:
	say "[regarding nothing]It['re]".

To say There's:
	say "[regarding nothing]There['re]".

To say it's:
	say "[regarding nothing]it['re]".

To say there's:
	say "[regarding nothing]there['re]".

To say possessive:
	let the item be the prior named object;
	if the item is the player:
		say "[our]";
	otherwise if the prior naming context is plural:
		say "[the item][apostrophe]";
	otherwise:
		say "[the item][apostrophe]s";

To say Possessive:
	let the item be the prior named object;
	if the item is the player:
		say "[Our]";
	otherwise if the prior naming context is plural:
		say "[The item][apostrophe]";
	otherwise:
		say "[The item][apostrophe]s".


Volume - Compatibility with Plurality (for use with Plurality by Emily Short)

Section - Deleted (in place of Section 4 - Enumeration in Plurality by Emily Short)

[The function of this section of Plurality was incorporated into the main pronoun rewrite, above.]

Section - Backward Compatibility for Plurality

[Both usages are deprecated.]

To have the parser notice (o - an object): 
	set pronouns from o.

To notice (o - an object) boringly:
	set pronouns from o.
	
Inclusive Gender Options ends here.

---- DOCUMENTATION ----

Section - Summary

Gender Options makes male, female, non-conforming, and neuter into independent on-off properties, each of which determines respectively whether "HE", "SHE", "THEY", or "IT" can be used to refer to the thing.  It additionally makes "THEY" refer to any plural-named or ambiguously plural thing.  It also allows some authorial choices over which pronoun to print for things with multiple valid genders or numbers.  It should be just as fast and efficient as the standard rules.

I (Nathanael Nerode) have a taste for writing stuff with odd gender behavior, and so I decided to do this in a general-purpose manner.  There are several purposes most of which are shown in the Cinoty Park example.

Section - Gender/Number Model and Pronouns

In the new model, male, female, non-conforming, and neuter are each separate properties, so that a thing is "male" or "not male", "female" or "not female", "non-conforming" or "not non-conforming", and "neuter" or "not neuter".  

The gender is primarily for pronoun purposes. 
When the player types "HE", anything male will match.
When the player types, "SHE", anything female will match.
When the player types "THEY", anything non-conforming will match. 
When the player types "IT", anything neuter will match.  
Something which is none of the four will never match any singular pronoun, which is not usually desirable, but may occasionally be useful (e.g. "The Exalted One shall not be referred to by pronouns!").

If you define a "man" or "men", it will by default be male, and not female, non-conforming, or neuter.
If you define a "woman" or "women", it will by default be female, and not male, non-conforming, or neuter.
If you define a "nonbinary" or "nonbinaries", it will by default be non-conforming, and not male, female, or neuter.
If you define a "person" or "people", it will by default be male, female, and non-conforming, but not neuter.  This makes more sense than it might at first appear; a person of unknown gender can be referred to as "he", "she", or "they" by the player.
If you define a "thing" or an "animal", it will by default be neuter, and not male, female, or non-conforming.

All of these can be overrriden and changed by specifying things like:
	Tracy is not male.
	Tracy is not female.
	Tracy is not non-conforming.
	Tracy is neuter.

The parser will update and recognize the appropriate pronouns when used by the player.  So a character who is both male and female can be referred to as "he" or "she" by the player, a ship can be referred to as "it" or "she", etc.

A similarly flexible model is implemented for number.  Any object which is plural-named or ambiguously plural can be referred to as "THEY".  Any object which is ambiguously plural can additionally be referred to using the singular pronouns -- whichever ones apply according to its gender.

So an ambiguously plural, male, female, non-conforming, neuter thing can be referred to by any of the pronouns THEY, HE, SHE, IT.  Even if it's singular-named.
	The jumble is an ambiguously plural, male, female, non-conforming, neuter thing.  
	The description of the jumble is "Things and people, all in a jumble! [They] [are] quite something."

The concept of "ambiguously plural" items is present in the Standard Rules but is not fully implemented.  (A singular-named ambiguously plural item will not match "they" in the Standard Rules.  It will match with Gender Options active.)

Section - Advice on the gender model

This is designed to be a plug-in extension which requires no change in existing code and keeps the same behavior if you have been using "man", "woman", or "animal".  If you have been using "person" to refer to generic non-gendered people and using "ambiguously plural" appropriately, this should simply improve the pronoun behavior with no code changes necessary.   But there may be some changes required if you have been using explicit gender adjectives.

This is because now male, female, non-conforming, and neuter are entirely separate traits; setting one does not set another.  Consider this code:
	Tracy is a person.
	Tracy is male.
	
Because the default for "person" is male, female, and non-conforming, responding to "him", "her", and "them", this makes Tracy male, female, and non-conforming; the "male" adjective does nothing.  If you want to make Tracy a man (male and not female or non-conforming), you would have to do this:
	Now Tracy is not female.
	Now Tracy is non non-conforming.

Now suppose you want to change Tracy from a man to a woman (female and not male).  You'll have to make two statements:
	Now Tracy is female.
	Now Tracy is not male.

Now you want to make Tracy respond to "it".
	Now Tracy is neuter.
	
Tracy is still female.  If you want Tracy to stop responding to "her":
	Now Tracey is not female.

Similarly, if you make an animal female, the player can refer to the animal as both "it" and "her" (unless you also make the animal not neuter):
	Peppy is a female animal.
	
This is usually desirable.

Section - Unsetting pronouns

By default, if you are changing the gender of characters, it doesn't change any pronoun referents already set by the player.  So if "him" is currently referring to Alex, and Alex stops being male, "him" will continue to refer to Alex until the player looks at another male character.  Under some circumstances, this satisfies "principle of least surprise" -- but under others it doesn't.  If you want to make sure that Alex can not be referenced as him:

	unset pronouns from Alex

Section - Gender in output messages

Gender and number is used for a second purpose other than recognizing pronouns in the English Language extension, and we must fix this up too.
It shows up in message substitutions such as [those].
For this, each object must have a single preferred grammatical gender, even when it has multiple genders which match player input.

We define two variables for this purpose: "prefer neuter gender" and "default animate gender".  These are variables so that they can be changed at runtime (for effect).

	Prefer neuter gender is a truth state which varies.
	Prefer neuter gender is usually true.
If you have a dog or a ship which can be referred to as "it" or "her", this will print "it".
If you would rather have "she" printed, use this:
	Prefer neuter gender is false.

	The preferred animate gender is a grammatical gender which varies.
	The preferred animate gender is usually the masculine gender.
If you have person who identifies as both male and female, this will print "him".
If you would rather have "her" printed, use this:
	The preferred animate gender is the feminine gender.
	
Prefer neuter gender is checked first; if it is false, then the preferred animate gender is checked.  An object will never be printed with a pronoun which isn't valid for it, unless it is not male, not female, *and* not neuter -- not responding to any pronouns from the player -- in which case "it" will be used.

Note that these use values of a different kind from the genders of objects for parsing purposes; the phrase "masculine gender", "feminine gender", and "neuter gender" must be specifically used.

This is all implemented with the following decide phrase.  If you don't like these rules and want to do something even more complicated (perhaps a per-object choice), override the decide phrase.

	To decide which grammatical gender is the printing gender for (o - an object):

Section - Number in output messages

Ambiguously plural items (like "pair of shoes") will be treated as plural or singular by output messages depending on whether they are "plural-named" or "singular-named"  This is standard behavior.  This does not affect the ability to refer to them by pronouns (you can always use both "they" and the singular pronouns for their gender).

The plural-named property is also used for the items like "the trees" which are always plural.  This is standard behavior.

Please note that for a thing which is ambiguously plural but singular-named, such as "pair of dice", the substitution "[they're]" will produce "that's", while "[they]['re]" will produce "it's".  Choose wisely!

Section - Printing differences from standard behavior

For reference, this is the procedure currently used in the Standard Rules as of the time of writing:

	For non-people:
	If person is plural, the plural form ("they") is used.
	Otherwise, neuter form ("it") is used.

	For people (including animals)
	If person is the player, the pronoun appropriate to the story viewpoint is used.
	If person is plural, plural form ("they") is used.
	Otherwise, if person is female, female form ("her") is used.
	Otherwise, if person is non-conforming, non-conforming form ("them") is used.
	Otherwise, if person is neuter, neuter form ("it") is used.
	Otherwise, male form ("him") is used.

In contrast, this was the procedure in Emily Short's Plurality:

	If the thing/person is plural, plural form ("they") is used.
	Otherwise, if the thing/person is the player, "you" is used.
	Otherwise, if the thing/person is neuter, neuter form ("it") is used.
	Otherwise, if the thing/person is male, male form ("he") is used.
	Otherwise, if the thing/person is female, female form ("she") is used.

Changing the gender model causes these to be two different procedures, which is why I (Nathanael Nerode) wrote an entirely new and more versatile procedure.

Section - Miscellaneous Changes

In Standard Rules, a person is always transparent -- their contents can be seen and interacted with.
This is perfectly reasonable as a baseline but can be restrictive for some story authors, so instead,
with this extension, a person is usually transparent.  Which changes nothing unless you as the story
author decide to create a non-transparent person.

Section - Interaction with Other Extensions

[Good for version Gender Options 4.0.220530 -- needs to be verified for Inclusive Gender Options]

Gender Options replaces parts of Standard Rules by Graham Nelson and should be included after it.
Gender Options replaces most of English Language by Graham Nelson and should be included after it.

Gender Options is compatible with Neutral Standard Responses by Nathanael Nerode.
Gender Options is incompatible with Neutral Library Messages by Aaron Reed, which predates the "responses" system.  Neutral Standard Responses is intended as a replacement.

Gender Options includes fixes for the gender handling in Original Parser by Ron Newcomb.  However, Original Parser is broken on the current version of Inform, so don't use it.  As a result this is untested and Gender Options probably doesn't work as well with Original Parser as it does with the standard parser.  I have retained this code in hopes of reviving Original Parser some day.

Gender Options is compatible with Plurality by Emily Short in that it is safe to include both.  But they will probably not interact well due to conflicting gender assumptions.  Plurality is largely obsolete due to incorporation of most of its features in the Standard Rules as of Inform 6M62; please use the Standard Rules features in preference to the features in Plurality.

Gender Options is incompatible with Second Gender by Felix Larsson.  The two do very similar things, but IMO Gender Options does so in a cleaner and more comprehensive fashion.  It was developed completely independently.

Section - Changelog

Inclusive Gender Options by Philip Riley:
	4.1 - Added the non-conforming gender, nonbinary person, and the singular they pronoun. 
	
Gender Options by Nathanael Nerode:
	4.0.220530 - Section number removal in documentation to accommodate automatic section numbering
	4.0.220529 - Example fixes to accommodate automated testing of examples
	4.0.220527 - Example fixes to accommodate automated testing of examples
	4.0.220524 - Format Changelog!
	4.0.220523 - Eliminate now-unnecessary dummy variable.
	4.0.220521 - Update for Inform v10.1.0, which restructured Standard Rules and the I6T code and the method of replacing I6T code.
	- Implement "unset pronouns from" in order to solve an issue noted on the forum without restricting options.
	- Many whitespace fixes.
	- New example game.
	- Make opaque persons possible.
	- Apply my Style Guide principles -- don't number the headings!
	3/210331 - Fix example / testsuite.
	3/170818 - Small documentation and comment tweaks.
	3/170816 - Replaced "always" with "usually" for man and woman.
	- Eliminated implications which didn't work.
	- Moved "person is usually not neuter" into correct section.
	- Removed androgyne kind and collective noun property for efficiency (they were syntactic sugar).
	- Revised documentation, comments, and City Park exmaple.  Added "It for All" example.
	2/170815 - First public release for gamma testing.

Example: * City Park - This consists of a room with items featuring most of the combinations of gender and number options which seemed plausible.  Take special note of the toy ship (you can call it "she").  This is also the test suite for the extension.

	*: "Everyone Comes To City Park"

	Include Inclusive Gender Options by Philip Riley.
	The release number is 5. [Fifth released version of this test suite]
	Include Gender Options by Nathanael Nerode.
	City Park is a room.
	The description of City Park is "Everyone comes to City Park!"
	
	The shadow is a person in the park.  "Someone skulks in the shadow."
	Understand "skulker" as the shadow.
	Understand "someone" as the shadow.
	The description of the shadow is "[We] [can't get] a good look at [regarding the shadow][them]."
	The shadow is neuter.
	
	John is a man in the park.
	The description of John is "John is a dapper man."
	Understand "dapper man" as John.
	
	Jane is a woman in the park.
	The description of Jane is "Jane is an elegant woman."
	Understand "elegant woman" as Jane.
	
	November is a nonbinary in the park.
	The description of November is "November is a striking person."
	Understand "striking person" as November.
	
	A deity is a person in the park.
	Understand "Hermaphroditus" as deity.
	Description of deity is "A deity with both male and female characteristics."
	Deity is male.
	Deity is female.
	
	A couple of girls are women in the park.
	Description of couple of girls is "Two girls who clutch each other inseparably."
	A couple of girls is ambiguously plural.
	A couple of girls is plural-named.
	A couple of girls has indefinite article "a".
		
	A bunch of boys are men in the park.
	Description of bunch of boys is "A bunch of boys wander around."
	A bunch of boys is ambiguously plural.
	A bunch of boys is plural-named.
	A bunch of boys has indefinite article "a".
	
	Some sunbathers are people in the park.
	Description of the sunbathers is "A mixed-gender group is out bathing in the sun."
	Sunbathers are male.
	Sunbathers are female.
	Sunbathers are non-conforming.
	Sunbathers are ambiguously plural.
	Sunbathers are plural-named.
	Sunbathers are not proper-named.
	Sunbathers have indefinite article "a few".
	Understand "few sunbathers" as sunbathers.
	Understand "group" as sunbathers.
	Understand "mixed-gender group" as sunbathers.
	
	A deer-animal is a kind of animal.
	Deer-animal usually have printed plural name "deer".
	
	A group of does are deer-animal in the park.
	Description of the does is "A group of does are grazing in the park."
	Does are female.
	Does are ambiguously plural.
	Does are plural-named.
	Does have indefinite article "a".
	Understand "deer" as does.
	
	A buck is an deer-animal in the park.
	Description of the buck is "The buck is watching the does."
	Buck is male.
	Understand "deer" as buck.
	
	A cute puppy is an animal in the park.
	Description of the puppy is "There's a cute puppy running around."
	Puppy is female.
	Puppy is neuter.
	
	A plastic banana is a thing in the park.
	Description of banana is "It's a plastic banana.  I don't know why it exists, either."
	
	A pair of dice is a thing in the park.  "A pair of dice lie abandoned on the ground."
	Description of pair of dice is "A pair of casino-style dice."
	A pair of dice is ambiguously plural.
	A pair of dice is not plural-named.
	
	A toy ship is a thing in the park.  "A toy ship lies abandoned to one side."
	Description of ship is "A toy ship called the 'Santa Maria'."
	Ship is female.
	Understand "Santa Maria" as ship.
	
	A large cardboard box is a container in the park.
	Description of cardboard box is "A large cardboard box is lying out in the sun."
	Cardboard box is enterable.
	Cardboard box is openable.
	
	The jumble is an ambiguously plural, male, female, neuter thing in the park.
	The description of the jumble is "Things and people, all in a jumble! [They] [are] quite something.".
	
	The Unpronounable One is a thing in the park.
	The description of the Unpronounable One is "[We] [may] not refer to the Unpronounable One by pronouns."
	The Unpronounable One is not neuter.
	
	Analyzing is an action applying to one thing.
	Understand "gender [something]" as analyzing.
	Carry out analyzing:
		say "[A noun] [are] here; [regarding the noun][they]['re] here." 
		
	setting female default is an action applying to nothing.
	Understand "matriarchy" as setting female default.
	Carry out setting female default:
		now preferred animate gender is feminine gender.
	
	setting male default is an action applying to nothing.
	Understand "patriarchy" as setting male default.
	Carry out setting male default:
		now preferred animate gender is masculine gender.
	
	setting gendered default is an action applying to nothing.
	Understand "anthropomorphize" as setting gendered default.	
	Carry out setting gendered default:
		now prefer neuter gender is false.
		
	setting neuter default is an action applying to nothing.
	Understand "objectify" as setting neuter default.
	Carry out setting neuter default:
		now prefer neuter gender is true.
	
	test pronouns with "pronouns / x john / pronouns / x jane / pronouns / x november / pronouns/ x deity / pronouns / x girls / pronouns / x boys / pronouns / x sunbathers / pronouns / x does / pronouns / x buck  / pronouns  / x dice / pronouns / x ship / pronouns / x unpronounable one / pronouns / x jumble / pronouns"  in City Park.
	
	test gender with "anthropomorphize / gender buck / gender puppy / gender shadow / objectify / gender buck / gender puppy / gender shadow / anthropomorphize / matriarchy / gender deity  / gender shadow  / x shadow / patriarchy / gender deity / gender shadow / x shadow" in City Park.
	
	test number with "gender girls / gender boys / gender sunbathers / gender dice" in City Park.

Example: ** It for All - Some authors have requested that "it" apply to anything, plural or singular, of any gender, for the convenience of their players.

	*: "It for All"

	Include Inclusive Gender Options by Philip Riley.
	
	A person is neuter. A man is neuter.  A woman is neuter.  A nonbinary is neuter. [Overrides "usually not neuter", makes people respond to IT]
	A plural-named thing is ambiguously plural. [Makes all plural-named objects respond to IT]
	Prefer neuter gender is false. [Printed text shouldn't refer to characters as "it" if they're male or female.]
	
	Marching Grounds is a room.  "The place for marching!"
	
	to march is a verb. to watch is a verb. to command is a verb.
	
	The soldiers are plural-named men in Marching Grounds. 
	The description of the soldiers is "[Regarding the soldiers][They] [march] up and down."
	
	An observer is a improper-named woman in Marching Grounds.
	The description of the observer is "[Regarding the observer][They] [watch] the soldiers."
	
	A commander is a improper-named nonbinary in Marching Grounds.
	The description of the commander is "[Regarding the observer][They] [command] the soldiers."
	
	test pronouns with "x soldiers / pronouns / x observer / pronouns / x commander / pronouns".

Example: * No0neman's Test - No0neman wanted to make sure that Alex would no longer be able to be referred to by the old gender, not even for a little while.

	*: "No0neman's Test"

	Include Inclusive Gender Options by Philip Riley.

	The starting room is a room.

	The player is in the starting room. The player is not female. The player is not non-conforming. The player is not neuter.

	Alex is a person. Alex is not male. Alex is not female. Alex is not non-conforming.

	Alex is in the starting room.

	Feminizing is an action applying to one thing.

	Masculinizing is an action applying to one thing.

	Ungendering is an action applying to one thing.

	Neuterizing is an action applying to one thing.	

	Understand "feminize [person]" as feminizing.

	Understand "masculinize [person]" as masculinizing.

	Understand "ungender [person]" as ungendering.

	Understand "neuter [person]" as neuterizing.

	Carry out feminizing:
		now the noun is not neuter;
		now the noun is not male;
		now the noun is not non-conforming;
		now the noun is female;
		set pronouns from the noun;
		unset pronouns from the noun;

	Carry out masculinizing:
		now the noun is not neuter;
		now the noun is not female;
		now the noun is not non-conforming;
		now the noun is male;
		set pronouns from the noun;
		unset pronouns from the noun;

	Carry out ungendering:
		now the noun is not neuter;
		now the noun is not female;
		now the noun is non-conforming;
		set pronouns from the noun;
		unset pronouns from the noun;

	Carry out neuterizing:
		now the noun is neuter;
		now the noun is not female;
		now the noun is not male;
		now the noun is not non-conforming;
		set pronouns from the noun;
		unset pronouns from the noun;

	test unsetting with "masculinize alex / x him / x her / x them / x it / feminize alex / x him / x her / x them / x it / ungender alex / x him / x her / x them / x it"
	
	