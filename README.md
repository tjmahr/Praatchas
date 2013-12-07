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

Procedures are not functions; they do not return values. But you can access the local variables inside of a procedure to "return" a value from the last invocation of that procedure. 

```
@squareNumber(5)
writeInfoLine("The square of 5 is ", squareNumber.result, ".")

procedure squareNumber(.number)
    .result = .number ^ 2
endproc
```



Etc.
----

`writeInfoLine` is [the new](http://www.fon.hum.uva.nl/praat/manual/Scripting_9_2__Old_functions.html) `echo`.

```
echo Hello, my name is 'name$' and I am 'age' years old.
writeInfoLine ("Hello, my name is ", name$, " and I am ", age, " years old.")
```
