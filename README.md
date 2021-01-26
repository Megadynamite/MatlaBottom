# Bottom-Matlab
An implementation of the bottom spec in MATLAB. It's basically the antithesis of the entire language and just about every line has made my life miserable at some point or another.
So therefore this readme is a rant devoted to this entire process.

# Emoji
You cannot store a non-ASCII emoji in a .m file.

You cannot convert to a codepoint from its value greater than 65536.

The hugging emote has a value of 129730.

You cannot import the characters from a file or export to a file.

### Solution?
Well first, give up on anything reasonable. This step took me two days.

Default to something useful that we can store. This ended up being the discord emoji names. Force the user to input the unicode themselves.
Note this does actually have the benefit of hotswappable charsets, so while I'm at it, allow the user to modify the character palette size.

Decoding is a lost cause by this note, anything over the 65k limit is going to decode to the same max character and short of requiring the user to go look up unicode and paste them in, this isn't happening.

# Miscellaneous
### Quorem
MATLAB has a function to return remainder and quotient. Great, so lets try that. Oh, it only accepts symbolics and is 10x slower than making one myself. Not a big deal, but who thought "symbolic functions need remainder and quotient, but nobody would ever use that for actual math"
## UINT8
When decoding UTF-8, the function returns a number in the format uint8. That seems reasonable and shouldn't pose an issue. After all, double(104) == uint8(104), so I'm sure they act the same. And they do! Except if you try to remainder 104/200, you get 4. 
This distinction took me a long time as I'd get a wrong value, I print the number and it shows up normally, I check if it's equal to 104, it is. It took me longer than I'd like to admit to class() the object and discover what it was.
This was an incredibly hard bug to track down. Of course if I had read the docs a little harder I might have come up with this sooner.

# Thoughts
MATLAB was never designed for this level of string manipulation and barring circumstances as odd as these I'm currently in, I will not be attempting anything like this in the future. 
The implementation may not be the best but every time I thought I knew how something would work, it functioned differently or not at all and I spent so much time trying to work around things that bikeshedding the implementation was overlooked.
I'm writing this before the decoder or the GUI, I have no idea what the decoder will bring, but I've worked with MATLAB GUIs before and all I remember was spending hours trying to figure out why OOP wasn't working to realize that I was trying to keep a handle on it incorrectly.
## Also if someone comes along with far more knowledge than I have, please do share.
