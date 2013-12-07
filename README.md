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
