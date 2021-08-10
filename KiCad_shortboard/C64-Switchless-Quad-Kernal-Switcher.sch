EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "C64 Switchless Quad Kernal Switcher - shortboard"
Date "2021-08-10"
Rev "1.1"
Comp "Bwack"
Comment1 "C64 Short motherboard version. 28-28pin board."
Comment2 "Ideas from Sven Petersen's switcher."
Comment3 "C64 shortboard: Add U2, and include BASIC image at bank0 in a *256 or *512 ROM."
Comment4 "1541C/1541-II mode: Do not add U2. Add solder to JP1, JP2 and JP4. Use *256 ROM."
$EndDescr
$Comp
L Connector_Generic:Conn_02x14_Counter_Clockwise J3
U 1 1 5D2A3953
P 9450 4200
F 0 "J3" H 9450 4900 50  0000 C CNN
F 1 "27C256/512_28PDIP" H 9500 3400 50  0000 C CNN
F 2 "Package_DIP:DIP-28_W15.24mm_Socket" H 9450 4200 50  0001 C CNN
F 3 "~" H 9450 4200 50  0001 C CNN
	1    9450 4200
	1    0    0    -1  
$EndComp
Text Notes 8400 4400 1    50   ~ 0
bottom
Text Notes 10900 4450 1    50   ~ 0
bottom
Text Notes 9550 4350 1    50   ~ 0
top
$Comp
L power:VCC #PWR0102
U 1 1 5D2C04ED
P 10500 3500
F 0 "#PWR0102" H 10500 3350 50  0001 C CNN
F 1 "VCC" H 10517 3673 50  0000 C CNN
F 2 "" H 10500 3500 50  0001 C CNN
F 3 "" H 10500 3500 50  0001 C CNN
	1    10500 3500
	1    0    0    -1  
$EndComp
Text Label 6000 5650 0    50   ~ 0
MCU_A13
Text Label 6000 5550 0    50   ~ 0
MCU_A14
Text Label 6000 5250 0    50   ~ 0
~RESTORE~
$Comp
L power:GND #PWR0103
U 1 1 5D2DB3C2
P 5300 6150
F 0 "#PWR0103" H 5300 5900 50  0001 C CNN
F 1 "GND" H 5305 5977 50  0001 C CNN
F 2 "" H 5300 6150 50  0001 C CNN
F 3 "" H 5300 6150 50  0001 C CNN
	1    5300 6150
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0104
U 1 1 5D2DC7D8
P 5300 4950
F 0 "#PWR0104" H 5300 4800 50  0001 C CNN
F 1 "VCC" H 5317 5123 50  0000 C CNN
F 2 "" H 5300 4950 50  0001 C CNN
F 3 "" H 5300 4950 50  0001 C CNN
	1    5300 4950
	1    0    0    -1  
$EndComp
Text Label 6000 5450 0    50   ~ 0
~INTRST~
Text Label 6000 5750 0    50   ~ 0
~EXROM~
$Comp
L Connector:Conn_01x08_Female J4
U 1 1 5D2EA50E
P 9200 5850
F 0 "J4" H 9050 6450 50  0000 L CNN
F 1 "Wireconnections" H 9050 6350 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x08_P2.54mm_Horizontal" H 9200 5850 50  0001 C CNN
F 3 "~" H 9200 5850 50  0001 C CNN
	1    9200 5850
	1    0    0    -1  
$EndComp
Wire Wire Line
	9000 5750 8900 5750
Wire Wire Line
	9000 5950 8900 5950
Text Label 8650 5550 0    50   ~ 0
BLUE
Text Label 8650 5650 0    50   ~ 0
GREEN
Text Label 8650 5750 0    50   ~ 0
RED
$Comp
L power:GND #PWR0105
U 1 1 5D2F2BE7
P 8350 5850
F 0 "#PWR0105" H 8350 5600 50  0001 C CNN
F 1 "GND" H 8355 5677 50  0001 C CNN
F 2 "" H 8350 5850 50  0001 C CNN
F 3 "" H 8350 5850 50  0001 C CNN
	1    8350 5850
	1    0    0    -1  
$EndComp
Wire Wire Line
	8350 5850 9000 5850
Text Label 8650 5850 0    50   ~ 0
GND
Wire Wire Line
	8900 5750 8900 5950
Connection ~ 8900 5750
Text Label 8600 6250 0    50   ~ 0
~RESTORE~
Text Label 8600 6050 0    50   ~ 0
~INTRST~
Text Label 8600 6150 0    50   ~ 0
~EXROM~
$Comp
L Device:R_Small R1
U 1 1 5D2FA66C
P 8000 5550
F 0 "R1" V 7950 5350 50  0000 C CNN
F 1 "1k" V 7950 5700 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8000 5550 50  0001 C CNN
F 3 "~" H 8000 5550 50  0001 C CNN
	1    8000 5550
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R2
U 1 1 5D2FB56E
P 8000 5650
F 0 "R2" V 7950 5450 50  0000 C CNN
F 1 "3k3" V 7950 5800 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8000 5650 50  0001 C CNN
F 3 "~" H 8000 5650 50  0001 C CNN
	1    8000 5650
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R3
U 1 1 5D2FB77A
P 8000 5750
F 0 "R3" V 7950 5550 50  0000 C CNN
F 1 "560" V 7950 5900 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8000 5750 50  0001 C CNN
F 3 "~" H 8000 5750 50  0001 C CNN
	1    8000 5750
	0    1    1    0   
$EndComp
Wire Wire Line
	8100 5550 9000 5550
Wire Wire Line
	8100 5650 9000 5650
Wire Wire Line
	8100 5750 8900 5750
$Comp
L pspice:C C1
U 1 1 5D340530
P 5250 3800
F 0 "C1" H 5428 3846 50  0000 L CNN
F 1 "100nF" H 5428 3755 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5250 3800 50  0001 C CNN
F 3 "~" H 5250 3800 50  0001 C CNN
	1    5250 3800
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0106
U 1 1 5D341F04
P 5250 3550
F 0 "#PWR0106" H 5250 3400 50  0001 C CNN
F 1 "VCC" H 5267 3723 50  0000 C CNN
F 2 "" H 5250 3550 50  0001 C CNN
F 3 "" H 5250 3550 50  0001 C CNN
	1    5250 3550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0107
U 1 1 5D3432FD
P 5250 4050
F 0 "#PWR0107" H 5250 3800 50  0001 C CNN
F 1 "GND" H 5255 3877 50  0001 C CNN
F 2 "" H 5250 4050 50  0001 C CNN
F 3 "" H 5250 4050 50  0001 C CNN
	1    5250 4050
	1    0    0    -1  
$EndComp
Text Notes 6400 5450 0    50   ~ 0
SCK
Text Notes 6400 5350 0    50   ~ 0
MISO
Text Notes 6400 5250 0    50   ~ 0
MOSI
Text Notes 6300 5750 0    50   ~ 0
RESET
Wire Wire Line
	5900 5450 6650 5450
Wire Notes Line
	9200 5700 9300 5700
Wire Notes Line
	9300 5700 9300 6000
Wire Notes Line
	9300 6000 9200 6000
Text Notes 9350 5950 0    50   ~ 0
Original\nPower\nLED
Wire Notes Line
	9700 5900 9800 5900
Wire Notes Line
	9800 5900 9800 5500
Wire Notes Line
	9800 5500 9200 5500
Text Notes 9850 5800 0    50   ~ 0
RGB LED\nCommon\nCathode
Wire Notes Line
	9200 6300 10350 6300
Wire Notes Line
	10350 6300 10350 5700
Wire Notes Line
	10350 5700 10250 5700
Text Notes 10450 6050 1    50   ~ 0
ISP
Text Notes 10500 6150 0    50   ~ 0
RESET
Text Notes 10500 5850 0    50   ~ 0
GND
Text Notes 10500 5750 0    50   ~ 0
MISO
Text Notes 10500 6050 0    50   ~ 0
SCK
Text Notes 10500 6250 0    50   ~ 0
MOSI
Wire Wire Line
	5900 5750 6550 5750
Wire Wire Line
	6750 5750 6750 5350
Wire Wire Line
	5900 5350 6750 5350
$Comp
L C64-Switchless-Quad-Kernal-Switcher-rescue:ATtiny85-20PU-MCU_Microchip_ATtiny U1
U 1 1 5D2A0255
P 5300 5550
F 0 "U1" H 4900 6100 50  0000 R CNN
F 1 "ATtiny85-20PU" H 5050 6300 50  0000 R CNN
F 2 "Package_DIP:DIP-8_W7.62mm_Socket" H 5300 5550 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/atmel-2586-avr-8-bit-microcontroller-attiny25-attiny45-attiny85_datasheet.pdf" H 5300 5550 50  0001 C CNN
	1    5300 5550
	1    0    0    -1  
$EndComp
Text Notes 4500 4950 0    50   ~ 0
or ATtiny45
$Comp
L Connector:Conn_01x14_Male J2
U 1 1 5D3068AD
P 10800 4300
F 0 "J2" H 11000 3450 50  0000 R CNN
F 1 "01x14_precision_pinlist" V 10700 4000 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x14_P2.54mm_Vertical" H 10800 4300 50  0001 C CNN
F 3 "~" H 10800 4300 50  0001 C CNN
	1    10800 4300
	-1   0    0    1   
$EndComp
$Comp
L Connector:Conn_01x14_Male J1
U 1 1 5D311F83
P 8450 4200
F 0 "J1" H 8550 4950 50  0000 R CNN
F 1 "01x14_precision_pinlist" V 8350 5300 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x14_P2.54mm_Vertical" H 8450 4200 50  0001 C CNN
F 3 "~" H 8450 4200 50  0001 C CNN
	1    8450 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	9750 3900 10600 3900
Wire Wire Line
	9750 4000 10600 4000
Wire Wire Line
	9750 4100 10600 4100
Wire Wire Line
	9750 4200 10600 4200
Wire Wire Line
	9750 4300 10600 4300
Wire Wire Line
	9750 4500 10600 4500
Wire Wire Line
	9750 4600 10600 4600
Wire Wire Line
	9750 4700 10600 4700
Wire Wire Line
	9750 4800 10600 4800
Wire Wire Line
	9750 4900 10600 4900
Wire Wire Line
	9750 3800 10000 3800
Wire Wire Line
	8650 4600 9250 4600
Wire Wire Line
	8650 4700 9250 4700
Wire Wire Line
	8650 4800 9250 4800
Wire Wire Line
	8650 4900 8750 4900
Text Label 9000 4600 0    50   ~ 0
D0
Text Label 9000 4700 0    50   ~ 0
D1
Text Label 9000 4800 0    50   ~ 0
D2
Text Label 9850 4900 0    50   ~ 0
D3
Text Label 9850 4800 0    50   ~ 0
D4
Text Label 9850 4600 0    50   ~ 0
D6
Text Label 9850 4700 0    50   ~ 0
D5
Text Label 9850 4500 0    50   ~ 0
D7
$Comp
L power:GND #PWR0101
U 1 1 5D344AAB
P 8750 5050
F 0 "#PWR0101" H 8750 4800 50  0001 C CNN
F 1 "GND" H 8755 4877 50  0001 C CNN
F 2 "" H 8750 5050 50  0001 C CNN
F 3 "" H 8750 5050 50  0001 C CNN
	1    8750 5050
	1    0    0    -1  
$EndComp
Connection ~ 8750 4900
Wire Wire Line
	8750 4900 9250 4900
Wire Wire Line
	8750 5050 8750 4900
Wire Wire Line
	9250 4500 8650 4500
Wire Wire Line
	8650 4400 9250 4400
Wire Wire Line
	9250 4300 8650 4300
Wire Wire Line
	8650 4200 9250 4200
Wire Wire Line
	9250 4100 8650 4100
Wire Wire Line
	8650 4000 9250 4000
Wire Wire Line
	9250 3900 8650 3900
Wire Wire Line
	8650 3800 9250 3800
Text Label 9000 4500 0    50   ~ 0
A0
Text Label 9000 4400 0    50   ~ 0
A1
Text Label 9000 4300 0    50   ~ 0
A2
Text Label 9000 4200 0    50   ~ 0
A3
Text Label 9000 4100 0    50   ~ 0
A4
Text Label 9000 4000 0    50   ~ 0
A5
Text Label 9000 3900 0    50   ~ 0
A6
Text Label 9000 3800 0    50   ~ 0
A7
NoConn ~ 8650 3600
Wire Wire Line
	9250 3600 8800 3600
Wire Wire Line
	9250 3700 8650 3700
Text Label 9000 3700 0    50   ~ 0
A12
$Comp
L power:GND #PWR0108
U 1 1 5D378E35
P 10450 5050
F 0 "#PWR0108" H 10450 4800 50  0001 C CNN
F 1 "GND" H 10455 4877 50  0001 C CNN
F 2 "" H 10450 5050 50  0001 C CNN
F 3 "" H 10450 5050 50  0001 C CNN
	1    10450 5050
	1    0    0    -1  
$EndComp
Connection ~ 10450 4400
Text Label 9850 4200 0    50   ~ 0
~CS~
Text Label 9850 4100 0    50   ~ 0
A11
Text Label 9850 4300 0    50   ~ 0
A10
Wire Wire Line
	10450 4400 10450 5050
Wire Wire Line
	10450 4400 10600 4400
Wire Wire Line
	9750 4400 10450 4400
Text Label 9850 4000 0    50   ~ 0
A9
Text Label 9850 3900 0    50   ~ 0
A8
Wire Wire Line
	10600 3700 10500 3700
Wire Wire Line
	10500 3700 10500 3600
Connection ~ 10500 3600
Wire Wire Line
	10500 3600 10600 3600
Wire Wire Line
	10350 3800 10600 3800
Text Label 10600 3050 1    50   ~ 0
~BASIC~_KERNAL
Text Notes 10450 3800 0    50   ~ 0
A13
Text Label 8800 3450 1    50   ~ 0
A15
Text Label 9850 3450 1    50   ~ 0
A14
Text Label 10000 3450 1    50   ~ 0
A13
$Comp
L 74xx:74LS08 U2
U 1 1 5D3FAEF7
P 10000 2750
F 0 "U2" H 10000 2800 50  0000 C CNN
F 1 "74LS08" H 10000 2700 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 10000 2750 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 10000 2750 50  0001 C CNN
	1    10000 2750
	0    -1   1    0   
$EndComp
$Comp
L 74xx:74LS08 U2
U 2 1 5D40257B
P 9400 2750
F 0 "U2" H 9400 2800 50  0000 C CNN
F 1 "74LS08" H 9400 2700 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 9400 2750 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 9400 2750 50  0001 C CNN
	2    9400 2750
	0    -1   1    0   
$EndComp
$Comp
L 74xx:74LS08 U2
U 4 1 5D41E9EF
P 5300 2950
F 0 "U2" H 5300 3275 50  0000 C CNN
F 1 "74LS08" H 5300 3184 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 5300 2950 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 5300 2950 50  0001 C CNN
	4    5300 2950
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS08 U2
U 5 1 5D420021
P 6000 3350
F 0 "U2" H 6230 3396 50  0000 L CNN
F 1 "74LS08" H 6230 3305 50  0000 L CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 6000 3350 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 6000 3350 50  0001 C CNN
	5    6000 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	5000 2850 5000 3050
Connection ~ 5000 3050
Wire Wire Line
	5000 3050 5000 3200
$Comp
L power:GND #PWR0109
U 1 1 5D423F8E
P 5000 3200
F 0 "#PWR0109" H 5000 2950 50  0001 C CNN
F 1 "GND" H 5005 3027 50  0001 C CNN
F 2 "" H 5000 3200 50  0001 C CNN
F 3 "" H 5000 3200 50  0001 C CNN
	1    5000 3200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0110
U 1 1 5D428543
P 6000 3850
F 0 "#PWR0110" H 6000 3600 50  0001 C CNN
F 1 "GND" H 6005 3677 50  0001 C CNN
F 2 "" H 6000 3850 50  0001 C CNN
F 3 "" H 6000 3850 50  0001 C CNN
	1    6000 3850
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0111
U 1 1 5D42BD4F
P 6000 2850
F 0 "#PWR0111" H 6000 2700 50  0001 C CNN
F 1 "VCC" H 6017 3023 50  0000 C CNN
F 2 "" H 6000 2850 50  0001 C CNN
F 3 "" H 6000 2850 50  0001 C CNN
	1    6000 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	6550 6150 6550 5750
Wire Wire Line
	6650 6050 6650 5450
Wire Wire Line
	6850 6250 6850 5250
Wire Wire Line
	5900 5250 6850 5250
Text Label 6000 5350 0    50   ~ 0
MCU_A15
Wire Wire Line
	6650 6050 9000 6050
Wire Wire Line
	6550 6150 9000 6150
Wire Wire Line
	5900 5650 7200 5650
Wire Wire Line
	6850 6250 9000 6250
Wire Wire Line
	6750 5750 7300 5750
Connection ~ 7200 5650
Wire Wire Line
	7200 5650 7900 5650
Connection ~ 7250 5550
Wire Wire Line
	7250 5550 7900 5550
Connection ~ 7300 5750
Wire Wire Line
	7300 5750 7900 5750
Text Label 9750 2000 0    50   ~ 0
MCU_A13
Text Label 9150 2100 0    50   ~ 0
MCU_A14
Wire Wire Line
	9400 3250 9400 3100
Wire Wire Line
	10000 3050 10000 3100
Wire Wire Line
	9300 2450 9300 2350
Connection ~ 9300 2350
Wire Wire Line
	9900 2450 9900 2350
Connection ~ 9900 2350
Wire Wire Line
	9900 2350 9300 2350
Wire Wire Line
	7250 2100 9500 2100
Wire Wire Line
	9500 2100 9500 2450
Wire Wire Line
	7200 2000 10100 2000
Wire Wire Line
	10100 2000 10100 2450
Wire Wire Line
	7300 2200 7300 5750
Wire Wire Line
	7250 2100 7250 5550
Wire Wire Line
	7200 2000 7200 5550
Wire Wire Line
	7200 5550 7200 5650
Wire Wire Line
	5900 5550 7250 5550
$Comp
L Jumper:SolderJumper_2_Open JP4
U 1 1 61108399
P 10200 3800
F 0 "JP4" H 10200 3913 50  0000 C CNN
F 1 "SolderJumper_2_Open" H 10200 3914 50  0001 C CNN
F 2 "pkl_jumpers:J_0402" H 10200 3800 50  0001 C CNN
F 3 "~" H 10200 3800 50  0001 C CNN
	1    10200 3800
	1    0    0    -1  
$EndComp
Connection ~ 10350 3800
Wire Wire Line
	10050 3800 10000 3800
Connection ~ 10000 3800
Wire Wire Line
	10500 3600 10500 3500
Wire Wire Line
	9750 3600 10500 3600
Text Label 8550 2200 0    50   ~ 0
MCU_A15
Wire Wire Line
	7300 2200 8900 2200
Wire Wire Line
	9300 2350 8700 2350
Wire Wire Line
	8700 2350 8700 2450
Wire Wire Line
	8800 3600 8800 3100
Wire Wire Line
	8900 2200 8900 2450
$Comp
L 74xx:74LS08 U2
U 3 1 5D418CB3
P 8800 2750
F 0 "U2" H 8800 2800 50  0000 C CNN
F 1 "74LS08" H 8800 2700 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 8800 2750 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 8800 2750 50  0001 C CNN
	3    8800 2750
	0    -1   1    0   
$EndComp
Wire Wire Line
	9850 3250 9400 3250
Wire Wire Line
	9750 3700 9850 3700
Wire Wire Line
	9850 3700 9850 3250
$Comp
L Jumper:SolderJumper_2_Open JP1
U 1 1 611634FF
P 8950 3100
F 0 "JP1" H 8950 3213 50  0000 C CNN
F 1 "SolderJumper_2_Open" H 8950 3214 50  0001 C CNN
F 2 "pkl_jumpers:J_0402" H 8950 3100 50  0001 C CNN
F 3 "~" H 8950 3100 50  0001 C CNN
	1    8950 3100
	1    0    0    -1  
$EndComp
Connection ~ 8800 3100
Wire Wire Line
	8800 3100 8800 3050
Wire Wire Line
	9100 3100 9100 2450
Wire Wire Line
	9100 2450 8900 2450
Connection ~ 8900 2450
$Comp
L Jumper:SolderJumper_2_Open JP2
U 1 1 611BCCC7
P 9550 3100
F 0 "JP2" H 9550 3213 50  0000 C CNN
F 1 "SolderJumper_2_Open" H 9550 3214 50  0001 C CNN
F 2 "pkl_jumpers:J_0402" H 9550 3100 50  0001 C CNN
F 3 "~" H 9550 3100 50  0001 C CNN
	1    9550 3100
	1    0    0    -1  
$EndComp
Connection ~ 9400 3100
Wire Wire Line
	9400 3100 9400 3050
Wire Wire Line
	9700 3100 9700 2450
Wire Wire Line
	9700 2450 9500 2450
Connection ~ 9500 2450
Wire Wire Line
	10350 3250 10600 3250
Wire Wire Line
	10600 3250 10600 2350
Wire Wire Line
	10350 3250 10350 3800
Wire Wire Line
	9900 2350 10600 2350
$Comp
L Jumper:SolderJumper_2_Open JP3
U 1 1 611C8E9A
P 10150 3100
F 0 "JP3" H 10150 3213 50  0000 C CNN
F 1 "SolderJumper_2_Open" H 10150 3214 50  0001 C CNN
F 2 "pkl_jumpers:J_0402" H 10150 3100 50  0001 C CNN
F 3 "~" H 10150 3100 50  0001 C CNN
	1    10150 3100
	1    0    0    -1  
$EndComp
Connection ~ 10000 3100
Wire Wire Line
	10000 3100 10000 3800
Wire Wire Line
	10300 3100 10300 2450
Wire Wire Line
	10300 2450 10100 2450
Connection ~ 10100 2450
Text Notes 9600 1400 0    50   ~ 0
JP1  JP2  JP3  JP4  U2
Text Notes 8850 1500 0    50   ~ 0
C64 shortboard
Text Notes 9650 1600 0    50   ~ 0
x
Text Notes 9850 1600 0    50   ~ 0
x
Text Notes 10300 1600 0    50   ~ 0
x
Wire Notes Line style solid
	10650 1300 10650 1600
Wire Notes Line style solid
	8750 1600 8750 1300
Wire Notes Line style solid
	8750 1300 10650 1300
Wire Notes Line style solid
	8750 1400 10650 1400
Wire Notes Line style solid
	9550 1300 9550 1600
Wire Notes Line style solid
	8750 1600 10650 1600
Text Notes 9050 1400 0    50   ~ 0
Mode
Text Notes 8800 1600 0    50   ~ 0
1541C/1541II 16K
Text Notes 10500 1500 0    50   ~ 0
x
Wire Notes Line
	10650 1500 8750 1500
$EndSCHEMATC
