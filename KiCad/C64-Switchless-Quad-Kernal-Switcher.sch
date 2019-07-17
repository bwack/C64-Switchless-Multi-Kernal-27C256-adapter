EESchema Schematic File Version 4
LIBS:C64-Switchless-Quad-Kernal-Switcher-cache
EELAYER 29 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "C64 Switchless Quad Kernal Switcher (SKS64)"
Date "2019-07-15"
Rev "1.20"
Comp "Bwack"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Connector:Conn_01x12_Male J1
U 1 1 5D27B1FF
P 950 5000
F 0 "J1" H 900 5700 50  0000 R CNN
F 1 "Pinlist_12pin" H 1300 5600 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x12_P2.54mm_Vertical" H 950 5000 50  0001 C CNN
F 3 "~" H 950 5000 50  0001 C CNN
	1    950  5000
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x12_Male J2
U 1 1 5D27EF52
P 2900 5100
F 0 "J2" H 3050 4250 50  0000 R CNN
F 1 "Pinlist_12pin" H 3050 4350 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x12_P2.54mm_Vertical" H 2900 5100 50  0001 C CNN
F 3 "~" H 2900 5100 50  0001 C CNN
	1    2900 5100
	-1   0    0    1   
$EndComp
Wire Wire Line
	1650 4500 1150 4500
Wire Wire Line
	1650 4600 1150 4600
Wire Wire Line
	1650 4700 1150 4700
Wire Wire Line
	1650 4800 1150 4800
Wire Wire Line
	1650 4900 1150 4900
Wire Wire Line
	1650 5000 1150 5000
Wire Wire Line
	1650 5100 1150 5100
Wire Wire Line
	1650 5200 1150 5200
Wire Wire Line
	1650 5300 1150 5300
Wire Wire Line
	1650 5400 1150 5400
Wire Wire Line
	1650 5500 1150 5500
Wire Wire Line
	1650 5600 1550 5600
$Comp
L Connector_Generic:Conn_02x14_Counter_Clockwise J3
U 1 1 5D2A3953
P 1850 4900
F 0 "J3" H 1900 5717 50  0000 C CNN
F 1 "27C256_28PDIP" H 1900 5626 50  0000 C CNN
F 2 "Package_DIP:DIP-28_W15.24mm_Socket" H 1850 4900 50  0001 C CNN
F 3 "~" H 1850 4900 50  0001 C CNN
	1    1850 4900
	1    0    0    -1  
$EndComp
Wire Wire Line
	2150 5200 2700 5200
Wire Wire Line
	2150 5300 2700 5300
Wire Wire Line
	2150 5400 2700 5400
Wire Wire Line
	2150 5500 2700 5500
Wire Wire Line
	2150 5600 2700 5600
Wire Wire Line
	2150 4600 2700 4600
Wire Wire Line
	2150 4700 2700 4700
Wire Wire Line
	2150 4900 2700 4900
Wire Wire Line
	2150 5000 2700 5000
Wire Wire Line
	1550 5600 1550 5750
Wire Wire Line
	1550 5750 2200 5750
Wire Wire Line
	2200 5750 2200 5100
Wire Wire Line
	2200 5100 2150 5100
Connection ~ 1550 5600
Wire Wire Line
	1550 5600 1200 5600
Wire Wire Line
	1650 4400 1450 4400
Wire Wire Line
	1450 4400 1450 5850
Wire Wire Line
	1450 5850 2650 5850
Wire Wire Line
	2650 5850 2650 4800
Wire Wire Line
	2650 4800 2700 4800
Wire Wire Line
	2700 5100 2550 5100
Wire Wire Line
	2550 5100 2550 4800
Wire Wire Line
	2550 4800 2150 4800
Wire Wire Line
	2700 4500 2650 4500
Wire Wire Line
	2650 4500 2650 4300
Wire Wire Line
	2150 4400 2500 4400
Text Label 2250 4400 0    50   ~ 0
A14
Text Label 2250 4500 0    50   ~ 0
A13
Text Notes 900  5150 1    50   ~ 0
bottom
Text Notes 3000 5150 1    50   ~ 0
bottom
Text Notes 1950 5050 1    50   ~ 0
top
$Comp
L power:GND #PWR0101
U 1 1 5D2B92DB
P 1200 5700
F 0 "#PWR0101" H 1200 5450 50  0001 C CNN
F 1 "GND" H 1205 5527 50  0001 C CNN
F 2 "" H 1200 5700 50  0001 C CNN
F 3 "" H 1200 5700 50  0001 C CNN
	1    1200 5700
	1    0    0    -1  
$EndComp
Wire Wire Line
	1200 5700 1200 5600
Connection ~ 1200 5600
Wire Wire Line
	1200 5600 1150 5600
Wire Wire Line
	2650 4300 2250 4300
Wire Wire Line
	1650 4300 1550 4300
Wire Wire Line
	1550 4300 1550 4000
Wire Wire Line
	1550 4000 2250 4000
Wire Wire Line
	2250 4000 2250 4300
Connection ~ 2250 4300
Wire Wire Line
	2250 4300 2150 4300
$Comp
L power:VCC #PWR0102
U 1 1 5D2C04ED
P 2250 4000
F 0 "#PWR0102" H 2250 3850 50  0001 C CNN
F 1 "VCC" H 2267 4173 50  0000 C CNN
F 2 "" H 2250 4000 50  0001 C CNN
F 3 "" H 2250 4000 50  0001 C CNN
	1    2250 4000
	1    0    0    -1  
$EndComp
Connection ~ 2250 4000
Text Label 5600 5200 0    50   ~ 0
A13
Text Label 5600 5100 0    50   ~ 0
A14
Text Label 5600 4800 0    50   ~ 0
~RESTORE~
$Comp
L power:GND #PWR0103
U 1 1 5D2DB3C2
P 4900 5700
F 0 "#PWR0103" H 4900 5450 50  0001 C CNN
F 1 "GND" H 4905 5527 50  0001 C CNN
F 2 "" H 4900 5700 50  0001 C CNN
F 3 "" H 4900 5700 50  0001 C CNN
	1    4900 5700
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0104
U 1 1 5D2DC7D8
P 4900 4500
F 0 "#PWR0104" H 4900 4350 50  0001 C CNN
F 1 "VCC" H 4917 4673 50  0000 C CNN
F 2 "" H 4900 4500 50  0001 C CNN
F 3 "" H 4900 4500 50  0001 C CNN
	1    4900 4500
	1    0    0    -1  
$EndComp
Text Label 5600 5000 0    50   ~ 0
~INTRST~
Text Label 5600 4900 0    50   ~ 0
RED_LED
Text Label 5600 5300 0    50   ~ 0
~EXROM~
$Comp
L Connector:Conn_01x08_Female J4
U 1 1 5D2EA50E
P 8450 5400
F 0 "J4" H 8300 6000 50  0000 L CNN
F 1 "Wireconnections" H 8300 5900 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x08_P2.54mm_Horizontal" H 8450 5400 50  0001 C CNN
F 3 "~" H 8450 5400 50  0001 C CNN
	1    8450 5400
	1    0    0    -1  
$EndComp
Wire Wire Line
	8250 5300 8150 5300
Wire Wire Line
	8250 5500 8150 5500
Text Label 7900 5100 0    50   ~ 0
BLUE
Text Label 7900 5200 0    50   ~ 0
GREEN
Text Label 7900 5300 0    50   ~ 0
RED
$Comp
L power:GND #PWR0105
U 1 1 5D2F2BE7
P 7600 5400
F 0 "#PWR0105" H 7600 5150 50  0001 C CNN
F 1 "GND" H 7605 5227 50  0001 C CNN
F 2 "" H 7600 5400 50  0001 C CNN
F 3 "" H 7600 5400 50  0001 C CNN
	1    7600 5400
	1    0    0    -1  
$EndComp
Wire Wire Line
	7600 5400 8250 5400
Text Label 7900 5400 0    50   ~ 0
GND
Wire Wire Line
	8150 5300 8150 5500
Connection ~ 8150 5300
Text Label 7850 5800 0    50   ~ 0
~RESTORE~
Text Label 7850 5600 0    50   ~ 0
~INTRST~
Text Label 7850 5700 0    50   ~ 0
~EXROM~
$Comp
L Device:R_Small R1
U 1 1 5D2FA66C
P 7250 5100
F 0 "R1" V 7200 4900 50  0000 C CNN
F 1 "1k" V 7200 5250 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" H 7250 5100 50  0001 C CNN
F 3 "~" H 7250 5100 50  0001 C CNN
	1    7250 5100
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R2
U 1 1 5D2FB56E
P 7250 5200
F 0 "R2" V 7200 5000 50  0000 C CNN
F 1 "3k3" V 7200 5350 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" H 7250 5200 50  0001 C CNN
F 3 "~" H 7250 5200 50  0001 C CNN
	1    7250 5200
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R3
U 1 1 5D2FB77A
P 7250 5300
F 0 "R3" V 7200 5100 50  0000 C CNN
F 1 "560" V 7200 5450 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" H 7250 5300 50  0001 C CNN
F 3 "~" H 7250 5300 50  0001 C CNN
	1    7250 5300
	0    1    1    0   
$EndComp
Wire Wire Line
	7350 5100 8250 5100
Wire Wire Line
	7350 5200 8250 5200
Wire Wire Line
	7350 5300 8150 5300
$Comp
L pspice:C C1
U 1 1 5D340530
P 5350 4050
F 0 "C1" H 5528 4096 50  0000 L CNN
F 1 "100nF" H 5528 4005 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D3.8mm_W2.6mm_P2.50mm" H 5350 4050 50  0001 C CNN
F 3 "~" H 5350 4050 50  0001 C CNN
	1    5350 4050
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0106
U 1 1 5D341F04
P 5350 3800
F 0 "#PWR0106" H 5350 3650 50  0001 C CNN
F 1 "VCC" H 5367 3973 50  0000 C CNN
F 2 "" H 5350 3800 50  0001 C CNN
F 3 "" H 5350 3800 50  0001 C CNN
	1    5350 3800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0107
U 1 1 5D3432FD
P 5350 4300
F 0 "#PWR0107" H 5350 4050 50  0001 C CNN
F 1 "GND" H 5355 4127 50  0001 C CNN
F 2 "" H 5350 4300 50  0001 C CNN
F 3 "" H 5350 4300 50  0001 C CNN
	1    5350 4300
	1    0    0    -1  
$EndComp
Text Notes 6000 5000 0    50   ~ 0
SCK
Text Notes 6000 4900 0    50   ~ 0
MISO
Text Notes 6000 4800 0    50   ~ 0
MOSI
Text Notes 6000 5300 0    50   ~ 0
RESET
Wire Wire Line
	7800 5600 8250 5600
Wire Wire Line
	5500 5000 6250 5000
Wire Wire Line
	7800 5700 8250 5700
Wire Wire Line
	5500 4800 6250 4800
Wire Wire Line
	7800 5800 8250 5800
Wire Wire Line
	2150 4500 2550 4500
Wire Notes Line
	8450 5250 8550 5250
Wire Notes Line
	8550 5250 8550 5550
Wire Notes Line
	8550 5550 8450 5550
Text Notes 8600 5500 0    50   ~ 0
Original\nPower\nLED
Wire Notes Line
	8950 5450 9050 5450
Wire Notes Line
	9050 5450 9050 5050
Wire Notes Line
	9050 5050 8450 5050
Text Notes 9100 5350 0    50   ~ 0
RGB LED\nCommon\nCathode
Wire Notes Line
	8450 5850 9600 5850
Wire Notes Line
	9600 5850 9600 5250
Wire Notes Line
	9600 5250 9500 5250
Text Notes 9700 5600 1    50   ~ 0
ISP
Text Notes 9750 5700 0    50   ~ 0
RESET
Text Notes 9750 5400 0    50   ~ 0
GND
Text Notes 9750 5300 0    50   ~ 0
MISO
Text Notes 9750 5600 0    50   ~ 0
SCK
Text Notes 9750 5800 0    50   ~ 0
MOSI
Wire Wire Line
	5500 5100 7150 5100
Wire Wire Line
	5500 5200 7150 5200
Wire Wire Line
	5500 5300 6250 5300
Wire Wire Line
	7150 5300 6500 5300
Wire Wire Line
	6500 5300 6500 4900
Wire Wire Line
	5500 4900 6500 4900
$Comp
L MCU_Microchip_ATtiny:ATtiny85-20PU U1
U 1 1 5D2A0255
P 4900 5100
F 0 "U1" H 4500 5650 50  0000 R CNN
F 1 "ATtiny85-20PU" H 4650 5850 50  0000 R CNN
F 2 "Package_DIP:DIP-8_W7.62mm" H 4900 5100 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/atmel-2586-avr-8-bit-microcontroller-attiny25-attiny45-attiny85_datasheet.pdf" H 4900 5100 50  0001 C CNN
	1    4900 5100
	1    0    0    -1  
$EndComp
Text Notes 4100 4500 0    50   ~ 0
or ATtiny45
$EndSCHEMATC
