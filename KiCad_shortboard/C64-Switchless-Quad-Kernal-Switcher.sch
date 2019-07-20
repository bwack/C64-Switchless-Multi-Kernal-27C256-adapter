EESchema Schematic File Version 4
LIBS:C64-Switchless-Quad-Kernal-Switcher-cache
EELAYER 29 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "C64 Switchless Quad Kernal Switcher - shortboard"
Date "2019-07-18"
Rev "1.0"
Comp "Bwack"
Comment1 "C64 Short motherboard version"
Comment2 "must include basic image at first 8k bank"
Comment3 "Ideas from Sven Petersen's switcher"
Comment4 ""
$EndDescr
$Comp
L Connector_Generic:Conn_02x14_Counter_Clockwise J3
U 1 1 5D2A3953
P 2350 4900
F 0 "J3" H 2350 5600 50  0000 C CNN
F 1 "27C256/512_28PDIP" H 2400 4100 50  0000 C CNN
F 2 "Package_DIP:DIP-28_W15.24mm_Socket" H 2350 4900 50  0001 C CNN
F 3 "~" H 2350 4900 50  0001 C CNN
	1    2350 4900
	1    0    0    -1  
$EndComp
Text Notes 1300 5100 1    50   ~ 0
bottom
Text Notes 3800 5150 1    50   ~ 0
bottom
Text Notes 2450 5050 1    50   ~ 0
top
$Comp
L power:VCC #PWR0102
U 1 1 5D2C04ED
P 2750 4000
F 0 "#PWR0102" H 2750 3850 50  0001 C CNN
F 1 "VCC" H 2767 4173 50  0000 C CNN
F 2 "" H 2750 4000 50  0001 C CNN
F 3 "" H 2750 4000 50  0001 C CNN
	1    2750 4000
	1    0    0    -1  
$EndComp
Text Label 6150 5350 0    50   ~ 0
MCU_A13
Text Label 6150 5250 0    50   ~ 0
MCU_A14
Text Label 6150 4950 0    50   ~ 0
~RESTORE~
$Comp
L power:GND #PWR0103
U 1 1 5D2DB3C2
P 5450 5850
F 0 "#PWR0103" H 5450 5600 50  0001 C CNN
F 1 "GND" H 5455 5677 50  0001 C CNN
F 2 "" H 5450 5850 50  0001 C CNN
F 3 "" H 5450 5850 50  0001 C CNN
	1    5450 5850
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0104
U 1 1 5D2DC7D8
P 5450 4650
F 0 "#PWR0104" H 5450 4500 50  0001 C CNN
F 1 "VCC" H 5467 4823 50  0000 C CNN
F 2 "" H 5450 4650 50  0001 C CNN
F 3 "" H 5450 4650 50  0001 C CNN
	1    5450 4650
	1    0    0    -1  
$EndComp
Text Label 6150 5150 0    50   ~ 0
~INTRST~
Text Label 6150 5450 0    50   ~ 0
~EXROM~
$Comp
L Connector:Conn_01x08_Female J4
U 1 1 5D2EA50E
P 9350 5550
F 0 "J4" H 9200 6150 50  0000 L CNN
F 1 "Wireconnections" H 9200 6050 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x08_P2.54mm_Horizontal" H 9350 5550 50  0001 C CNN
F 3 "~" H 9350 5550 50  0001 C CNN
	1    9350 5550
	1    0    0    -1  
$EndComp
Wire Wire Line
	9150 5450 9050 5450
Wire Wire Line
	9150 5650 9050 5650
Text Label 8800 5250 0    50   ~ 0
BLUE
Text Label 8800 5350 0    50   ~ 0
GREEN
Text Label 8800 5450 0    50   ~ 0
RED
$Comp
L power:GND #PWR0105
U 1 1 5D2F2BE7
P 8500 5550
F 0 "#PWR0105" H 8500 5300 50  0001 C CNN
F 1 "GND" H 8505 5377 50  0001 C CNN
F 2 "" H 8500 5550 50  0001 C CNN
F 3 "" H 8500 5550 50  0001 C CNN
	1    8500 5550
	1    0    0    -1  
$EndComp
Wire Wire Line
	8500 5550 9150 5550
Text Label 8800 5550 0    50   ~ 0
GND
Wire Wire Line
	9050 5450 9050 5650
Connection ~ 9050 5450
Text Label 8750 5950 0    50   ~ 0
~RESTORE~
Text Label 8750 5750 0    50   ~ 0
~INTRST~
Text Label 8750 5850 0    50   ~ 0
~EXROM~
$Comp
L Device:R_Small R1
U 1 1 5D2FA66C
P 8150 5250
F 0 "R1" V 8100 5050 50  0000 C CNN
F 1 "1k" V 8100 5400 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8150 5250 50  0001 C CNN
F 3 "~" H 8150 5250 50  0001 C CNN
	1    8150 5250
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R2
U 1 1 5D2FB56E
P 8150 5350
F 0 "R2" V 8100 5150 50  0000 C CNN
F 1 "3k3" V 8100 5500 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8150 5350 50  0001 C CNN
F 3 "~" H 8150 5350 50  0001 C CNN
	1    8150 5350
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R3
U 1 1 5D2FB77A
P 8150 5450
F 0 "R3" V 8100 5250 50  0000 C CNN
F 1 "560" V 8100 5600 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8150 5450 50  0001 C CNN
F 3 "~" H 8150 5450 50  0001 C CNN
	1    8150 5450
	0    1    1    0   
$EndComp
Wire Wire Line
	8250 5250 9150 5250
Wire Wire Line
	8250 5350 9150 5350
Wire Wire Line
	8250 5450 9050 5450
$Comp
L pspice:C C1
U 1 1 5D340530
P 4550 7150
F 0 "C1" H 4728 7196 50  0000 L CNN
F 1 "100nF" H 4728 7105 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4550 7150 50  0001 C CNN
F 3 "~" H 4550 7150 50  0001 C CNN
	1    4550 7150
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0106
U 1 1 5D341F04
P 4550 6900
F 0 "#PWR0106" H 4550 6750 50  0001 C CNN
F 1 "VCC" H 4567 7073 50  0000 C CNN
F 2 "" H 4550 6900 50  0001 C CNN
F 3 "" H 4550 6900 50  0001 C CNN
	1    4550 6900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0107
U 1 1 5D3432FD
P 4550 7400
F 0 "#PWR0107" H 4550 7150 50  0001 C CNN
F 1 "GND" H 4555 7227 50  0001 C CNN
F 2 "" H 4550 7400 50  0001 C CNN
F 3 "" H 4550 7400 50  0001 C CNN
	1    4550 7400
	1    0    0    -1  
$EndComp
Text Notes 6550 5150 0    50   ~ 0
SCK
Text Notes 6550 5050 0    50   ~ 0
MISO
Text Notes 6550 4950 0    50   ~ 0
MOSI
Text Notes 6450 5450 0    50   ~ 0
RESET
Wire Wire Line
	6050 5150 6800 5150
Wire Notes Line
	9350 5400 9450 5400
Wire Notes Line
	9450 5400 9450 5700
Wire Notes Line
	9450 5700 9350 5700
Text Notes 9500 5650 0    50   ~ 0
Original\nPower\nLED
Wire Notes Line
	9850 5600 9950 5600
Wire Notes Line
	9950 5600 9950 5200
Wire Notes Line
	9950 5200 9350 5200
Text Notes 10000 5500 0    50   ~ 0
RGB LED\nCommon\nCathode
Wire Notes Line
	9350 6000 10500 6000
Wire Notes Line
	10500 6000 10500 5400
Wire Notes Line
	10500 5400 10400 5400
Text Notes 10600 5750 1    50   ~ 0
ISP
Text Notes 10650 5850 0    50   ~ 0
RESET
Text Notes 10650 5550 0    50   ~ 0
GND
Text Notes 10650 5450 0    50   ~ 0
MISO
Text Notes 10650 5750 0    50   ~ 0
SCK
Text Notes 10650 5950 0    50   ~ 0
MOSI
Wire Wire Line
	6050 5450 6700 5450
Wire Wire Line
	6900 5450 6900 5050
Wire Wire Line
	6050 5050 6900 5050
$Comp
L MCU_Microchip_ATtiny:ATtiny85-20PU U1
U 1 1 5D2A0255
P 5450 5250
F 0 "U1" H 5050 5800 50  0000 R CNN
F 1 "ATtiny85-20PU" H 5200 6000 50  0000 R CNN
F 2 "Package_DIP:DIP-8_W7.62mm_Socket" H 5450 5250 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/atmel-2586-avr-8-bit-microcontroller-attiny25-attiny45-attiny85_datasheet.pdf" H 5450 5250 50  0001 C CNN
	1    5450 5250
	1    0    0    -1  
$EndComp
Text Notes 4650 4650 0    50   ~ 0
or ATtiny45
$Comp
L Connector:Conn_01x14_Male J2
U 1 1 5D3068AD
P 3700 5000
F 0 "J2" H 3900 4150 50  0000 R CNN
F 1 "01x14_precision_pinlist" H 3900 4050 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x14_P2.54mm_Vertical" H 3700 5000 50  0001 C CNN
F 3 "~" H 3700 5000 50  0001 C CNN
	1    3700 5000
	-1   0    0    1   
$EndComp
$Comp
L Connector:Conn_01x14_Male J1
U 1 1 5D311F83
P 1350 4900
F 0 "J1" H 1450 5650 50  0000 R CNN
F 1 "01x14_precision_pinlist" H 1700 5750 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x14_P2.54mm_Vertical" H 1350 4900 50  0001 C CNN
F 3 "~" H 1350 4900 50  0001 C CNN
	1    1350 4900
	1    0    0    -1  
$EndComp
Wire Wire Line
	2650 4300 2750 4300
Wire Wire Line
	2650 4600 3500 4600
Wire Wire Line
	2650 4700 3500 4700
Wire Wire Line
	2650 4800 3500 4800
Wire Wire Line
	2650 4900 3500 4900
Wire Wire Line
	2650 5000 3500 5000
Wire Wire Line
	2650 5200 3500 5200
Wire Wire Line
	2650 5300 3500 5300
Wire Wire Line
	2650 5400 3500 5400
Wire Wire Line
	2650 5500 3500 5500
Wire Wire Line
	2650 5600 3500 5600
Wire Wire Line
	2650 4500 3050 4500
Wire Wire Line
	1550 5300 2150 5300
Wire Wire Line
	1550 5400 2150 5400
Wire Wire Line
	1550 5500 2150 5500
Wire Wire Line
	1550 5600 1650 5600
Text Label 1900 5300 0    50   ~ 0
D0
Text Label 1900 5400 0    50   ~ 0
D1
Text Label 1900 5500 0    50   ~ 0
D2
Text Label 2750 5600 0    50   ~ 0
D3
Text Label 2750 5500 0    50   ~ 0
D4
Text Label 2750 5300 0    50   ~ 0
D6
Text Label 2750 5400 0    50   ~ 0
D5
Text Label 2750 5200 0    50   ~ 0
D7
$Comp
L power:GND #PWR0101
U 1 1 5D344AAB
P 1650 5750
F 0 "#PWR0101" H 1650 5500 50  0001 C CNN
F 1 "GND" H 1655 5577 50  0001 C CNN
F 2 "" H 1650 5750 50  0001 C CNN
F 3 "" H 1650 5750 50  0001 C CNN
	1    1650 5750
	1    0    0    -1  
$EndComp
Connection ~ 1650 5600
Wire Wire Line
	1650 5600 2150 5600
Wire Wire Line
	2750 4300 2750 4000
Connection ~ 2750 4300
Wire Wire Line
	2750 4300 3400 4300
Wire Wire Line
	1650 5750 1650 5600
Wire Wire Line
	2150 5200 1550 5200
Wire Wire Line
	1550 5100 2150 5100
Wire Wire Line
	2150 5000 1550 5000
Wire Wire Line
	1550 4900 2150 4900
Wire Wire Line
	2150 4800 1550 4800
Wire Wire Line
	1550 4700 2150 4700
Wire Wire Line
	2150 4600 1550 4600
Wire Wire Line
	1550 4500 2150 4500
Text Label 1900 5200 0    50   ~ 0
A0
Text Label 1900 5100 0    50   ~ 0
A1
Text Label 1900 5000 0    50   ~ 0
A2
Text Label 1900 4900 0    50   ~ 0
A3
Text Label 1900 4800 0    50   ~ 0
A4
Text Label 1900 4700 0    50   ~ 0
A5
Text Label 1900 4600 0    50   ~ 0
A6
Text Label 1900 4500 0    50   ~ 0
A7
NoConn ~ 1550 4300
Wire Wire Line
	2150 4300 1850 4300
Text Label 1900 4300 0    50   ~ 0
A15
Wire Wire Line
	2150 4400 1550 4400
Text Label 1900 4400 0    50   ~ 0
A12
$Comp
L power:GND #PWR0108
U 1 1 5D378E35
P 3350 5750
F 0 "#PWR0108" H 3350 5500 50  0001 C CNN
F 1 "GND" H 3355 5577 50  0001 C CNN
F 2 "" H 3350 5750 50  0001 C CNN
F 3 "" H 3350 5750 50  0001 C CNN
	1    3350 5750
	1    0    0    -1  
$EndComp
Connection ~ 3350 5100
Text Label 2750 4900 0    50   ~ 0
~CS~
Text Label 2750 4800 0    50   ~ 0
A11
Text Label 2750 5000 0    50   ~ 0
A10
Wire Wire Line
	3350 5100 3350 5750
Wire Wire Line
	3350 5100 3500 5100
Wire Wire Line
	2650 5100 3350 5100
Text Label 2750 4700 0    50   ~ 0
A9
Text Label 2750 4500 0    50   ~ 0
A13
Text Label 2750 4600 0    50   ~ 0
A8
Wire Wire Line
	3500 4400 3400 4400
Wire Wire Line
	3400 4400 3400 4300
Connection ~ 3400 4300
Wire Wire Line
	3400 4300 3500 4300
Wire Wire Line
	2650 4400 2950 4400
Text Label 2750 4400 0    50   ~ 0
A14
Wire Wire Line
	3250 4500 3250 3650
Wire Wire Line
	3250 4500 3500 4500
Text Label 3300 3650 0    50   ~ 0
~BASIC~_KERNAL
Text Notes 3350 4500 0    50   ~ 0
A13
Wire Wire Line
	1850 4300 1850 2600
Wire Wire Line
	2950 4400 2950 2950
Wire Wire Line
	3050 4500 3050 3300
Text Label 4050 2600 0    50   ~ 0
A15
Text Label 4050 2950 0    50   ~ 0
A14
Text Label 4050 3300 0    50   ~ 0
A13
$Comp
L 74xx:74LS08 U2
U 1 1 5D3FAEF7
P 4550 3300
F 0 "U2" H 4550 3350 50  0000 C CNN
F 1 "74LS08" H 4550 3250 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 4550 3300 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 4550 3300 50  0001 C CNN
	1    4550 3300
	-1   0    0    -1  
$EndComp
$Comp
L 74xx:74LS08 U2
U 2 1 5D40257B
P 4550 2950
F 0 "U2" H 4550 3000 50  0000 C CNN
F 1 "74LS08" H 4550 2900 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 4550 2950 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 4550 2950 50  0001 C CNN
	2    4550 2950
	-1   0    0    -1  
$EndComp
$Comp
L 74xx:74LS08 U2
U 3 1 5D418CB3
P 4550 2600
F 0 "U2" H 4550 2650 50  0000 C CNN
F 1 "74LS08" H 4550 2550 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 4550 2600 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 4550 2600 50  0001 C CNN
	3    4550 2600
	-1   0    0    -1  
$EndComp
$Comp
L 74xx:74LS08 U2
U 4 1 5D41E9EF
P 5600 7100
F 0 "U2" H 5600 7425 50  0000 C CNN
F 1 "74LS08" H 5600 7334 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 5600 7100 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 5600 7100 50  0001 C CNN
	4    5600 7100
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS08 U2
U 5 1 5D420021
P 6350 7100
F 0 "U2" H 6580 7146 50  0000 L CNN
F 1 "74LS08" H 6580 7055 50  0000 L CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 6350 7100 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 6350 7100 50  0001 C CNN
	5    6350 7100
	1    0    0    -1  
$EndComp
Wire Wire Line
	5300 7000 5300 7200
Connection ~ 5300 7200
Wire Wire Line
	5300 7200 5300 7350
$Comp
L power:GND #PWR0109
U 1 1 5D423F8E
P 5300 7350
F 0 "#PWR0109" H 5300 7100 50  0001 C CNN
F 1 "GND" H 5305 7177 50  0001 C CNN
F 2 "" H 5300 7350 50  0001 C CNN
F 3 "" H 5300 7350 50  0001 C CNN
	1    5300 7350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0110
U 1 1 5D428543
P 6350 7600
F 0 "#PWR0110" H 6350 7350 50  0001 C CNN
F 1 "GND" H 6355 7427 50  0001 C CNN
F 2 "" H 6350 7600 50  0001 C CNN
F 3 "" H 6350 7600 50  0001 C CNN
	1    6350 7600
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0111
U 1 1 5D42BD4F
P 6350 6600
F 0 "#PWR0111" H 6350 6450 50  0001 C CNN
F 1 "VCC" H 6367 6773 50  0000 C CNN
F 2 "" H 6350 6600 50  0001 C CNN
F 3 "" H 6350 6600 50  0001 C CNN
	1    6350 6600
	1    0    0    -1  
$EndComp
Wire Wire Line
	4900 3650 4900 3200
Wire Wire Line
	4900 2500 4850 2500
Wire Wire Line
	3250 3650 4900 3650
Wire Wire Line
	4850 3200 4900 3200
Connection ~ 4900 3200
Wire Wire Line
	4900 3200 4900 2850
Wire Wire Line
	4850 2850 4900 2850
Connection ~ 4900 2850
Wire Wire Line
	4900 2850 4900 2500
Wire Wire Line
	4250 3300 3050 3300
Wire Wire Line
	6700 5850 6700 5450
Wire Wire Line
	6800 5750 6800 5150
Wire Wire Line
	7000 5950 7000 4950
Wire Wire Line
	6050 4950 7000 4950
Text Label 6150 5050 0    50   ~ 0
MCU_A15
Wire Wire Line
	6800 5750 9150 5750
Wire Wire Line
	6700 5850 9150 5850
Wire Wire Line
	6050 5350 7350 5350
Wire Wire Line
	7000 5950 9150 5950
Wire Wire Line
	4850 3400 7350 3400
Wire Wire Line
	4850 3050 7400 3050
Wire Wire Line
	6900 5450 7450 5450
Connection ~ 7350 5350
Wire Wire Line
	7350 5350 8050 5350
Wire Wire Line
	7400 3050 7400 5250
Wire Wire Line
	6050 5250 7350 5250
Connection ~ 7400 5250
Wire Wire Line
	7400 5250 8050 5250
Wire Wire Line
	7350 5250 7400 5250
Wire Wire Line
	7350 3400 7350 5350
Wire Wire Line
	7450 2700 7450 5450
Wire Wire Line
	4850 2700 7450 2700
Connection ~ 7450 5450
Wire Wire Line
	7450 5450 8050 5450
Text Label 5000 2700 0    50   ~ 0
MCU_A15
Text Label 5000 3400 0    50   ~ 0
MCU_A13
Text Label 5000 3050 0    50   ~ 0
MCU_A14
Wire Wire Line
	1850 2600 4250 2600
Wire Wire Line
	2950 2950 4250 2950
$EndSCHEMATC
