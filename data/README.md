# Data Files

## Scilab data

These files contain the standard deviation of the transient simulation depending on the angular PWM frequency for different duty ratios:

Middle of operating regime:

| file name | duty ratio D |
|-----------|------------|
| `pwm-var4.dat` | D=0.4 |
| `pwm-var5.dat` | D=0.5 |
| `pwm-var6.dat` | D=0.6 |

Around the operating point:

| file name | duty ratio D |
|-----------|------------|
| `pwm-var510.dat` | D=0.510 |
| `pwm-var512.dat` | D=0.512 |
| `pwm-var514.dat` | D=0.514 |

## Circuit simulation

These data files are ASCII files containing the results of transient simulations:

| file name | description |
|-----------|-------------|
| [`buck-converter-open-loop1.txt`](buck-converter-open-loop1.txt)| open loop with 6V reference voltage|
| [buck-converter-open-loop2.txt](buck-converter-open-loop2.txt)| open loop with 6.144V reference voltage|
| [buck-converter-closed-loop1.txt](buck-converter-closed-loop1.txt)| closed loop with P controller|
| [buck-converter-closed-loop2.txt](buck-converter-closed-loop2.txt)| closed loop with PI controller|

The files have the same structure:

| structure | contents |
|-----------|----------|
| row 1 | description of the columns |
| column 1 | time in s|
| column 2 | output voltage `V(out1)-V(out2)`|
| column 3 | input current `I(V5)` |