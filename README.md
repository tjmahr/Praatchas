Praatchas: Praat Gotchas
========================

_An ongoing repository to help me remember some things about Praat scripting_

Whitespace
----------

Final whitespace can matter. In the example below, `·` represents a hidden space at the end of the line. We can guard against this gotcha by using `selectObject` and enclosing the object name in quotes.

```
select Sound Sound1
# Works

select Sound Sound1·
# Error: No object with that name. Object "Sound Sound1 " does not exist.

selectObject("Sound Sound1")
# Works
```



Procedures
----------

The names of variables used inside of procedures (i.e., local variables) should begin with `.`:

```
@listSpeaker("Bart", 38)
@listSpeaker("Katja", 24)

procedure listSpeaker(.name$, .age)
    appendInfoLine("Speaker ", .name$, " is ", .age, " years old.")
endproc
```

Procedures are not functions; they do not return values. But you can access the local variables inside of a procedure to "return" a value from the last invocation of that procedure. 

```
@squareNumber(5)
writeInfoLine("The square of 5 is ", squareNumber.result, ".")

procedure squareNumber(.number)
    .result = .number ^ 2
endproc
```

Forms
-----

### Simple Fields

Forms allow us to capture user input into variables for scripting. Here is the basic template for such a menu, where a user inputs values into fields.

```
form [Window Title]
    [Input Type] [Field_Description] [Default Value To Display]
    [Input Type] [Field_Description_Two] [Default Value To Display]
    # et cetera...
endform
```

Some gotchas to note already. The `[Field_Description]` is pretty-printed next to the input box as text with the underscores turned into spaces. The field description also serves as a variable name for the inputted value. You may want your the field description to start with a capital letter because that's how you like to write things. But **variable names in Praat cannot start with uppercase letters**. Or you may want to indicate a unit of measure in parentheses in the field description, but parentheses are also not allowed in variable names. Therefore, some care is required when determining the variable name that goes with a field description. Examples:

```
form Sink it
    sentence Name_of_the_ship Titanic
    real Distance_to_the_iceberg_(m) 500.0
endform

writeInfoLine(Name_of_the_ship$)
# Error: No such error (note: variables start with lower case)

writeInfoLine(name_of_the_ship$)
# "Titantic"

appendInfoLine(distance_to_the_iceberg_(m))
# Error: Unknown function <<distance_to_the_iceberg_>> in formula

appendInfoLine(distance_to_the_iceberg_)
# Error: Unknown variable

appendInfoLine(distance_to_the_iceberg)
# 500
```




Some Basics
-----------

### Info logging

* `writeInfo`
* `writeInfoLine`
* `appendInfo`
* `appendInfoLine`
* `clearinfo`

The commands starting with `write` clear the info log first. The commands ending with `Line` include an implicit  `newline$` (a special string constant like `tab$`). Technically, then, `writeInfoLine("hello")` is equivalent to `clearinfo; appendInfo("hello", newline$)`.

`writeInfoLine` is [the new](http://www.fon.hum.uva.nl/praat/manual/Scripting_9_2__Old_functions.html) `echo`. Don't use `echo`, `print` or `printline` anymore, I guess.

```
echo Hello, my name is 'name$' and I am 'age' years old.
writeInfoLine ("Hello, my name is ", name$, " and I am ", age, " years old.")
```

### Strings

```
length("internationalization")
# 20

## index of first occurence of substring: 
index("internationalization", "ation")  
# 7
index ("internationalization", "x")
# 0
```

#### Concatentation and Truncation

```
text$ = "hallo" + "dag"
appendInfoLine(text$)
# hallodag

sound_name$ = "hallo.aifc"
textgrid_name$ = sound_name$ - ".aifc" + ".TextGrid"
appendInfoLine(textgrid_name$)
# hallo.TextGrid
```




Control
-------

### Inline conditionals

```
.ext$ = if (macintosh or unix) then "WAV" else "wav" endif
appendInfoLine(.ext$)
# "wav" on a Windows computer
```























