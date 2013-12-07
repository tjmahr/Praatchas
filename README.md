Praatchas: Praat Gotchas
========================

_An ongoing repository to help me remember some things about Praat scripting_

***

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

> [Manual](http://www.fon.hum.uva.nl/praat/manual/Scripting_5_5__Procedures.html): The Praat scripting language does not have the concept of a "function" like some other scripting languages do. A function is a procedure that returns a number or a string. For instance, you can imagine the function squareNumber which takes a number (e.g. 5) as an argument and returns the square of that number (e.g. 25). Here is an example of how you can do that, using the global availability of local variables:

```
@squareNumber(5)
writeInfoLine("The square of 5 is ", squareNumber.result, ".")

procedure squareNumber(.number)
    .result = .number ^ 2
endproc
```

[`writeInfoLine` is the new `echo`.](http://www.fon.hum.uva.nl/praat/manual/Scripting_9_2__Old_functions.html)

```
echo Hello, my name is 'name$' and I am 'age' years old.
writeInfoLine ("Hello, my name is ", name$, " and I am ", age, " years old.")
```
