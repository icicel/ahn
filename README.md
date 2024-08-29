
# ĀĤN

Āĥn is a cypher supporting English, Swedish or German text.
It is also a separate language.
At least, it kind of looks like one.

This repo contains the source RegEx to the LingoJam translator that Āĥn was born out of.
It also contains the AHK script I use to edit Āĥn text.

[Link to the translator](https://lingojam.com/TexttoA%CC%84h%CC%82n)

## Name

"Āĥn" translates to "nykod", which is "newcode" in Swedish.
It was a placeholder name that stuck.

# Grammar (WIP)

DISCLAIMER: plenty of pseudo-linguistics nonsense and borrowed terms below.
Beware!

Āĥn is, at its core, a simple substitution cypher.
The complexity comes from the multiple, overly complicated formatting rules used to make Āĥn text look, read (and even be pronounced!) more like an actual language, while still just being a cypher.

Keep in mind that due to the complicated contexts in which they apply, certain rules cannot be applied automatically in the LingoJam translator (yet), and must be done manually (or not at all, if you're lazy). These are currently:
- Proper word formatting (including titles and measurement units)
- Capitalization (kinda? it's broken, at least)

## SUBSTITUTIONS

### Consonants

### Vowels

### Other characters

## SYMBOLS

Sometimes, it happens that text contains characters which don't have a proper substitution from the tables above.
These are called "symbols", and include things such as punctuation, brackets, math symbols, slashes and more.
The way these characters are handled is that they simply are left unsubstituted.
- many, symbols! - r̈ā, ōrĝwo!
- (brackets) - (gëth́ȷo)
- math + stuff =‌ true - r̈ıs + oı̃m̧ =‌ ȷẽ́
- slashes/too - oẅośo/ı̂̂ 

### Numbers and number formatting

By the above definition, numbers are also considered symbols.
This is, of course, not the case with number words, which can be translated as usual as they are composed of regular letters.
- we 3 bears - ṕ 3 ǵ̈eo
- we three bears - ṕ ısé́ ǵ̈eo

Numbers are formatted in different ways depending on how they are used.
Ordinal numbers are represented with the ordinal sign, a period, like in German.
- 1st - 1.
- 2nd - 2.
- 3rd - 3.
- 674138th - 674138.
- 0th - 0.

And like regular numbers, spelled-out ordinals are translated by regular means.
- first - m̀eoı
- second - ót̂an
- third - ıs̀en
- sixhundredandseventyfourthousandonehundredandthirtyeighth - òfs̃anén̈anóĺaı̄m̂̃eıŝ̃öan̂ás̃anén̈anıs̀eı̄́̀dsıs
- zeroth - b́êıs

Numbers that are paired up with a month to form a date should be converted to the numerical D/M format instead, along with the month.
This is done regardless of whether it's spelled-out or not.
- March 15th - 15/3
- March 15 - 15/3
- 15th of March - 15/3
- fifteenth of March - 15/3
- fifteenth of the third - 15/3

This is *not* done if the date is entirely numerical.
- 15-03-2021 - 15-03-2021
- 2021-03-15 - 2021-03-15

Unless it's the objectively inferior M/D format.
Sorry, not sorry.
- 9/11 2001 - 11/9 2001

### Units of measurement

## CARRYBACKS

When using the above substitutions naïvely, one quickly runs into problems when faced with words that start with a vowel.
The problem is that combining characters are designed to "latch on" to regular letters, not whitespace. A vowel that isn't preceded by a consonant is left hanging, literally.
- super agile - õḱe ̈d̀ú (looks weird)

A simple solution is to skip the whitespace, letting the combining character latch on the first available letter to the left.
However, this can lead to confusion, as the character is now part of another word.
- super agile - õḱë d̀ú (reads as "supera gile")

This is where carrybacks come in.
A carryback is, at its simplest, a substitution for a vowel at the start of a word, that tells us that the last vowel of the previous word belongs there instead - the carryback "carries the vowel back" from the previous word to the current word.
The regular "single carryback" is represented with an apostrophe.
- super agile - õḱë 'd̀ú (no confusion!)

If there already are vowel characters on the relevant consonant, the carrybacked vowel sits on top.
- very agile - ĺē̈ 'd̀ú

In practice, any whitespace between a carryback and its vowel is removed.
This process is somewhat misleadingly called "kerning", and is done in order to increase text density and disguise the shorter words of Āĥn.
- super agile - õḱë'd̀ú

### Symbol interaction

For the purposes of carrybacking, symbols don't count as letters and carrybacks can skip over them.
- for/ever - m̂é/'ĺe
- pe$os - ḱ̂$'o

This also means that kerning is effectively cancelled if there is a symbol in the way.
- "super" agile - «õḱë» 'd̀ú
- they & us - ıś̄̃ & 'o

A common exception is for numbers, which do allow the kerning to take place (assuming there's whitespace that can be kerned).
This includes the ordinal sign or percent sign.
- my 12 oranges - r̄̂ 12'ëad́o
- 5th avenue - 5.'ĺ̈ã́
- murder is 100% illegal - r̃eńè'ò 100%'ú̧d̈u

Note that the above exception causes loss of spacing information.
Context should be sufficient in most cases, though.
- my 12oranges - r̄̂ 12'ëad́o

### Paragraph-initially

At the start of a paragraph, there is no consonant to the left that the vowel can latch on to.
In that case, you simply choose the first consonant to the right.
- algae - 'üd̈́

Carrybacked vowels are still put on top of any preexisting vowels, just like before, but in this case they are also put on top of any *normally* carrybacked vowels that are carried from the right.
- icier - 't̀́̀e
- icy er - 't̄́̀'e

Any symbols before the first vowel still act as space, and are ignored accordingly except for kerning purposes.
- (enclosed) - ('átûón)
- ← over here - ← 'ĺ̂e śé
- 2+2 is 4 - 2+2'ò 4

### Multiple carrybacks

Of course, some words start with more than one vowel.
In those cases, you could just use several carrybacks in a row.
(The vowels are parsed in reading order, so the rightmost vowel will be at the top of the stack.)
- super easy - õḱé̈''ō
- super young - õḱē̂̃'''ad

This looks fine, but for convenience, they are combined into double and triple carrybacks, represented by quote marks and asterisks.
- super easy - õḱé̈"ō
- super young - õḱē̂̃*ad

For words that start with more than three vowels, you simply keep going with the already existing carrybacks.
A quadruple carryback is just a triple carryback and a single carryback combined, for example.
A sextuple carryback is two triple carrybacks.
- super eeeasy - õḱé́́̈*'ō
- super eeeeasy - õḱé́́́̈*"ō
- super eeeeeasy - õḱé́́́́̈**ō

When having multiple carrybacks at the start of a paragraph, remember that vowels are parsed in reading order.
In this example the E will be parsed before the A, and therefore the A sign is above the E sign in the resulting stack.
Another way to think about it is that there's a "ghost letter" at the start of the paragraph, that vowels latch on to as usual, but the ghost letter then travels rightwards and places its vowel stack on the first available letter.
- easier - "ò́́̈e

### Lonely carrybacks

Words consisting of only vowels are translated to just a carryback.
This is called a "lonely" carryback since it's not next to a letter by default.
These always force kerning to happen if it can, even with symbols (but not with other carrybacks, of course).
- here I stand - śé̀' oȷ̈an
- here I am - śé̀̈' 'r
- look, a bird - û̂ḧ,' g̀en
- me, & I - ŕ̀, &'

If a lonely single carryback can't be kerned for any reason, such as being next to another carryback or at the start of a paragraph, the kerning may be attempted in the other direction.
This is done in a special process called "commafication", where, along with the reverse-kerning, the carryback is also replaced with a comma.
- a fool moon night - ,m̂̂̈u r̂̂a àdsı
- I purchase (I think) - ,k̃̀ets̈ó̀ (,ıs̀ah)
- but Y U sad - g̃ı̄̃' ,ön

The difference between commafication and regular kerning, apart from being done to the right, is that the kerning can happen with other, non-lonely, carrybacks.
- u are mean - ,'é̃̈ ŕ̈a
- I ain't smart - ,"a͛̀̈̀ı or̈eı

If commafication fails too, the carryback remains unkerned.
- ay caramba - " ẗ̈̄ërg̈
- but Y U - g̃ı̄̃' '
- but Y U a sad person - g̃ı̄̃̈' ' ,ön ḱeôa

### Edge cases

There are no limits on the amount of vowels that can be carrybacked.
Eventually, things could get messy.
Use vowels responsibly!
- yo, IOU a yoyo eye error, yea - ",* ' *' * 'ȩ̂̍̄́̈̄̂̀̂̃̈̄̂̄̂́̄́́,\*
- eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeasy - ************"ṓ́́́́́́́́́́́́́́́́́́́́́́́́́́́́́́́́́́́́̈ 

When there are no consonants *at all*, add a dummy Y for the vowels to latch on to.
It should be placed right before the first vowel.
- aeiou - ÿ́̀̂̃
- a.e.i.o.u. - ÿ́̀̂̃.'.'.'.'.
- *[aeiou] - ^[ÿ́̀̂̃]

## FORMATTING

### Dotless I

### Y insertion

### I/U conversion

To further aid in pronouncability, Is and Us in large groups of vowels are "converted" to their respective consonant "forms", J and W.
The standard method for doing this is as follows (taking into account the changes of one step for the next step):
1. Convert all Us that are surrounded by vowels to Ws
2. Convert all Is that are surrounded by vowels to Js
3. Convert all Us that are in front of another vowel to Ws
4. Convert all Is that are in front of another vowel to Js
5. Convert all Us that are after another vowel to Ws

The converted Js are dotless, like the Is.
- beast - ǵ̈oı
- beasts - ǵ̈oȷo
- telltale - ı́w̧ȷ̈ú

### Duplets

A "duplet" is when there are two consonants in a row.
Depending on the consonant, the resulting translation could look quite strange.
Therefore a shorthand is used, where the second consonant is converted to a duplet mark (a cedilla).
- fuss - m̃o̧
- apple - 'ķ̈ú
- zucchini - b̃yţs̀à

Notice that if the two consonants are separated by vowels, there will still be two *letters* in a row in the resulting translation, ignoring the diacritics.
This is a "separated duplet", and in order to clarify where the surrounding vowels go, the duplet mark is moved above the letter.
In practice, this is done by replacing it with a vertical line.
- bearer - ǵ̈é̍
- caucasian - ẗ̃̍̈ò̈a

This system still works intuitively even when there are more than two letters in a row.
- passes - k̈ó̧̍
- institution - 'àoȷ̀̍̃̍̀̂a

There are also symbols for the rare cases of double and triple separated duplet marks, similarly to carrybacks.
These are the double vertical line and the vertical tilde respectively.
- lollipop - û̎̀k̂̍
- pizzazz - k̀yb̧̈̎
- lulllull - ũ̾̃̎
- hmmmmm - syŗ̾

Note that, for some reason, putting a cedilla on the lowercase G automatically places it above it in most fonts.
For consistency's sake, an ogonek can be used instead,
or you can just place a zero-width non-joiner character (ZWNJ) between the G and the cedilla.
- kibble - h̀yģú (cedilla)
- kibble - h̀yg̨ú (ogonek)
- kibble - h̀yg‌̧ú (ZWNJ + cedilla)

### Shorthand

### Letters with diacritics

## CAPITALIZATION

(This is more of a style guideline than a rule.)

The only allowed capitalization apart from in symbols is at the very first letter of a sentence.
Other than that, capitalization is ignored and the translated word is written in all lowercase.
This is done in order to distinguish text from proper nouns.
- WHAT do you MEAN!? - Ps̈ı n̂ ¤ ŕ̈a!?
- oOPS I PRESSED CAPS LOCK - "K̂̂ò' kéó̧n ẗyko ûth
- capitalization is still optional - ẗyk̀ȷ̈ùb̈ȷ̀̂à'o oȷ̀û̧'kȷ̀̂äw

## NAMES AND PROPER WORDS

Names, or proper nouns, are treated as symbols.
That is, they are written as-is, without any standard formatting such as I/U conversion, carrybacking skips over them, and carrybacks can kern to them.
- My name is Adam - R̄ äŕ̀'o Adam
- Sweden is a good place - Sweden'ö̀' d̂̂yn küt́

There are many proper nouns that are not names (noting that the definition of "name" is loose and can vary according to the translator's wishes).
Non-names are translated as normally.
- Cold November weather - T̂un âĺryǵe ṕ̈ıśe
- Spread of Christianity - Oké̈n̂'m tsèoȷ̀̈àı̄

### Noun suffixes

The main two noun suffixes in English are the possessive suffix (-'s) and the plural suffix (-s).
When used on proper nouns, they are translated into '-a' and '-o' respectively.
- Adam's steak - Adama oı́̈h
- Several Volkswagens - Óĺëw Volkswageno
- The Johnsons' opinions - Iś̂ Johnsonoa'k̀à̂̍o

The contraction of 'has' also counts as a possessive suffix.
- Evelyn's gone away - Evelyna d̂á̈'p̈̄

Should the proper noun end in a vowel, that vowel is replaced with the new suffix vowel(s).
If it ends in several vowels, they're all replaced.
- My collection of Ferraris - R̄ t̂ú̧tȷ̀̂â'm Ferraro
- Da Vinci's Mona Lisa - Da Vinca Mona Lisa
- Many Colombias' worth of gold - R̈ā Colomboa p̂eıŝ'm d̂un

Sometimes the proper noun and its suffixed form are identical.
To distinguish in these cases, the alternative suffix '-e' is used instead.
- It's Canada's fault - 'J͛̀o Canade m̈̃wı

For the sake of legibility, the ending vowel should not be replaced in short names.
- Xi's bargain - Xia g̈ed̈̀a

### Dropping the article

Some proper nouns are often used along with the definite article, 'the' (these are also called "weak proper names").
When translating them, the article should be dropped if present.
- Waters of the Nile - P̈ȷ́eô'm Nile
- Blue Nile waters - Gṹ Nile p̈ȷ́eo
- The Nile's waters - Nila p̈ȷ́eo

Regular proper nouns are unaffected, as are weak proper nouns in noun phrases.
- The Addams family - Iś Addams m̈yr̀ū
- The Nile of the east - Iś̂ Nile'm ıś́̈"oı

Any potential plural suffix is not converted to '-o', assuming the noun is referred to with its article.
Otherwise, conversion takes place as usual.
- Life in the Philippines - Ùḿ̀'a Philippines
- Too many Philippines - Î̂ r̈ā Philippino

### Name phrases

Whether proper noun phrases count as proper nouns in their own right varies depending on the context.
In most cases, they don't count and are broken up into sub-words.
These sub-words may include proper nouns but are otherwise treated as common words.
- The White House - Iś ps̀ı́ ŝ̃ó
- Yangtze River Valley - Yangtze èĺe l̈ú̧̄

Common exceptions are cases where the name in question also has a commonly used acronym, for example the full names of organizations, companies, or some countries.
- The National Security Agency of the United States - National Security Agency 'm̂ United States

### Proper modifiers

Many name phrases contain certain adjectives or prepositions in them that describe the location or context of the head noun of the phrase.
These are termed "proper modifiers" and are sometimes shortened.
The modifier is translated, stripped of diacritics, and prepended to the following part of the name as if it were a prefix.
- Papua New Guinea - Papua Apguinea
- Upper Himalayas - Kehimalaye

Dotless Is and Js are re-dotted.
- South Africa - Oisafrica

Consecutive vowels are handled by inserting apostrophes, much like 'la' before words starting with vowels in French.
- Upper Egypt - K'egypt

In rare cases, nouns are also treated as modifiers.
- Saint George - Oaigeorge
- Mount Everest - Rajeverest

### Proper adjectives

Proper adjectives, such as demonyms, are usually derived from a proper noun, and are translated by suffixing '-i' to that noun.
The suffix is applied in the same way as noun suffixes above.
- Jovian moons - Jupiteri r̂̂ao
- The French revolution - Iś Franci él̂ũȷ̀̂a
- Freudian philosophy - Freudi ks̀ŵôks̄

The suffix can be converted to '-j' according to normal rules.
- Not enough Swedes - Âı́'ẫds Swedenjo

If the base noun is unclear or too different, the word itself can be used as a proper noun.
- Gagauz language - Gagauz ẅad̃̈̍́

Other words derived from proper nouns are translated as common words.
- The spread of Buddhism - Iś oké̈n̂'m g̃yņs̀or

## TITLES

Titles are treated like proper nouns.
- Let's read Pride and Prejudice today - Úȷ͛o é̈n Pride and Prejudice ı̂n̈̄

Note that if a title begins with 'The', it should not be dropped as it is part of the proper noun itself.
- A review of The Shining -' É̈l̀́p̂'m The Shining

## ABBREVIATIONS

Abbreviations and contractions are translated as usual, but any full stops are removed.
Also, the Y insertion rules are ignored.
- That's Mr. Anderson - Is̈ȷ͛o re Anderson
- This USB is mine - Is̀õ'og̀'o r̀á
- He has multiple Ph.D.s - Ś s̈ö' ksno
- I'm a SaaS-based fintech sales analyst - "R̈̀͛' ö̈̍-g̈ón m̀aı́ts öẃö'äw̄oı

### Proper abbreviations

Abbreviations of proper nouns are not modified apart from removing the full stop if it's included.
- James R. Smith - James R Smith
- Born in the USA - Ĝeà'a USA

Additionally and specifically in the case of names, several abbrevations in a row are merged.
- The works of J. R. R. Tolkien - Iś p̂ehô'm JRR Tolkien

Abbreviated proper modifiers are unabbreviated and then handled as usual.
- W. Jefferson - Poijefferson
- Mt. Blanc - Raiblanc

Noun suffixes don't replace the ending vowels and are just appended.
If there would be duplets as a result of this, the final vowel is replaced anyway.
- SÄPO's mission - SÄPOa r̀ò̧̂a
- NASA's mission - NASa r̀ò̧̂a

### Units of measurement

When abbreviated, units of measurement count as symbols and are translated as such.
Unabbreviated units don't count.
- Only 5 km to Paris - 'Âw̄ 5 km ı̂ Paris
- Only 5 kilometers to Paris - 'Âw̄ 5 h̀ûŕȷ́eo ı̂ Paris
- 3V battery - 3V g̈ȷ̧́ē
- 3 volt battery - 3 l̂wı g̈ȷ̧́ē

# Explanation of the RegEx
