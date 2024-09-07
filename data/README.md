# Data Files

## Circuit simulation

| file name | description |
|-----------|-------------|
| [buck-converter-open-loop1.txt](buck-converter-open-loop1.txt)| open loop with 6V reference voltage|
| [buck-converter-open-loop2.txt](buck-converter-open-loop2.txt)| open loop with 6.144V reference voltage|
| [buck-converter-closed-loop1.txt](buck-converter-closed-loop1.txt)| closed loop with P controller|
| [buck-converter-closed-loop2.txt](buck-converter-closed-loop2.txt)| closed loop with PI controller|

These data files are ASCII files containing the results of transient simulations. The files have the same structure:

| structure | contents |
|-----------|----------|
| row 1 | description of the columns |
| column 1 | time in s|
| column 2 | output voltage `V(out1)-V(out2)`|
| column 3 | input current `I(V5)` |