# Current-Mode Control of a Distributed Buck Converter with a Lossy Transmission Line

This project contains the Scilab source files for the simulation of a distributed buck cenverter with a lossy transmission line.

Röbenack, K.; Gerbet, D.:   
*Current-Mode Control of a Distributed Buck Converter with a Lossy Transmission Line*.   
Submitted to MDPI Electronics, June 2024.

## Prerequisites

You need to install the open source software Scilab. This software for engineers and scientifsts is available for several operating systems:

https://www.scilab.org/

Our simulations were carried out with Scilab 2024.

## Contents

The [src](src) directory contains the source Scilab and Xcos files.

### Parameters and Constants

The file [context.sce](src/context.sce) contains the parameter values and constants for the simulation. It is called by the other script files.

### Step Response

The Scilab script file [sim-step.sce](src/sim-step.sce) calls the Xcos scheme [sim-step.zcos](src/sim-step.zcos). 

<img src="images/sim-step-zcos.png" alt="Zcos scheme for step response" width="85%">   

### PWM Excitation

The Scilab script file [sim-pwm.sce](src/sim-pwm.sce) calls the Xcos scheme [sim-pwm.zcos](src/sim-pwm.zcos).  

<img src="images/sim-pwm-zcos.png" alt="Zcos scheme for PWM excitation" width="85%">   

### Frequency Responses

The Scilab script file [amplitude1.sce](src/amplitude1.sce) visualizes the amplitude frequency responses for the different converter models:

<img src="src/amplitude1.png" alt="Amplitude response of the different converter models" width="85%">   

The Scilab script file [amplitude2.sce](src/amplitude2.sce) visualizes the open loop amplitude frequency responses for the conventional converter with and without controller:

<img src="src/amplitude2.png" alt="Amplitude response of the conventional converter with and without controller" width="85%">   

## Licence

This project is licensed under the GNU General Public License v3.0 - see the [LICENSE](LICENSE) file for details.

