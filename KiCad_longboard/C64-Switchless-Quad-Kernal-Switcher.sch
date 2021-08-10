EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "C64 Switchless Quad Kernal Switcher (SKS64)"
Date "2019-07-23"
Rev "1.21"
Comp "Bwack"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Connector:Conn_01x12_Male J1
U 1 1 5D27B1FF
P 8100 3900
F 0 "J1" H 8050 4450 50  0000 R CNN
F 1 "Pinlist_12pin" H 8550 4500 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x12_P2.54mm_Vertical" H 8100 3900 50  0001 C CNN
F 3 "~" H 8100 3900 50  0001 C CNN
	1    8100 3900
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x12_Male J2
U 1 1 5D27EF52
P 10050 4000
F 0 "J2" H 10200 3150 50  0000 R CNN
F 1 "Pinlist_12pin" H 10200 3250 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x12_P2.54mm_Vertical" H 10050 4000 50  0001 C CNN
F 3 "~" H 10050 4000 50  0001 C CNN
	1    10050 4000
	-1   0    0    1   
$EndComp
Wire Wire Line
	8800 3400 8300 3400
Wire Wire Line
	8800 3500 8300 3500
Wire Wire Line
	8800 3600 8300 3600
Wire Wire Line
	8800 3700 8300 3700
Wire Wire Line
	8800 3800 8300 3800
Wire Wire Line
	8800 3900 8300 3900
Wire Wire Line
	8800 4000 8300 4000
Wire Wire Line
	8800 4100 8300 4100
Wire Wire Line
	8800 4200 8300 4200
Wire Wire Line
	8800 4300 8300 4300
Wire Wire Line
	8800 4400 8300 4400
Wire Wire Line
	8800 4500 8700 4500
$Comp
L Connector_Generic:Conn_02x14_Counter_Clockwise J3
U 1 1 5D2A3953
P 9000 3800
F 0 "J3" H 9050 4617 50  0000 C CNN
F 1 "27C256/512_28PDIP" H 8850 4550 50  0000 C CNN
F 2 "Package_DIP:DIP-28_W15.24mm_Socket" H 9000 3800 50  0001 C CNN
F 3 "~" H 9000 3800 50  0001 C CNN
	1    9000 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	9300 4100 9850 4100
Wire Wire Line
	9300 4200 9850 4200
Wire Wire Line
	9300 4300 9850 4300
Wire Wire Line
	9300 4400 9850 4400
Wire Wire Line
	9300 4500 9850 4500
Wire Wire Line
	9300 3500 9850 3500
Wire Wire Line
	9300 3600 9850 3600
Wire Wire Line
	9300 3800 9850 3800
Wire Wire Line
	9300 3900 9850 3900
Wire Wire Line
	8700 4500 8700 4650
Wire Wire Line
	8700 4650 9350 4650
Wire Wire Line
	9350 4650 9350 4000
Wire Wire Line
	9350 4000 9300 4000
Connection ~ 8700 4500
Wire Wire Line
	8700 4500 8350 4500
Wire Wire Line
	8800 3300 8600 3300
Wire Wire Line
	8600 3300 8600 4750
Wire Wire Line
	8600 4750 9800 4750
Wire Wire Line
	9800 4750 9800 3700
Wire Wire Line
	9800 3700 9850 3700
Wire Wire Line
	9850 4000 9700 4000
Wire Wire Line
	9700 4000 9700 3700
Wire Wire Line
	9700 3700 9300 3700
Wire Wire Line
	9850 3400 9800 3400
Wire Wire Line
	9800 3400 9800 3200
Wire Wire Line
	9300 3300 9650 3300
Text Label 9400 3300 0    50   ~ 0
A14
Text Label 9400 3400 0    50   ~ 0
A13
Text Notes 8050 4050 1    50   ~ 0
bottom
Text Notes 10150 4050 1    50   ~ 0
bottom
Text Notes 9100 3950 1    50   ~ 0
top
$Comp
L power:GND #PWR0101
U 1 1 5D2B92DB
P 8350 4600
F 0 "#PWR0101" H 8350 4350 50  0001 C CNN
F 1 "GND" H 8355 4427 50  0001 C CNN
F 2 "" H 8350 4600 50  0001 C CNN
F 3 "" H 8350 4600 50  0001 C CNN
	1    8350 4600
	1    0    0    -1  
$EndComp
Wire Wire Line
	8350 4600 8350 4500
Connection ~ 8350 4500
Wire Wire Line
	8350 4500 8300 4500
Wire Wire Line
	9800 3200 9400 3200
Wire Wire Line
	9400 3100 9400 3200
Connection ~ 9400 3200
Wire Wire Line
	9400 3200 9300 3200
$Comp
L power:VCC #PWR0102
U 1 1 5D2C04ED
P 9400 3100
F 0 "#PWR0102" H 9400 2950 50  0001 C CNN
F 1 "VCC" H 9417 3273 50  0000 C CNN
F 2 "" H 9400 3100 50  0001 C CNN
F 3 "" H 9400 3100 50  0001 C CNN
	1    9400 3100
	1    0    0    -1  
$EndComp
Text Label 6500 5550 0    50   ~ 0
A13
Text Label 6500 5450 0    50   ~ 0
A14
Text Label 6500 5150 0    50   ~ 0
~RESTORE~
$Comp
L power:GND #PWR0103
U 1 1 5D2DB3C2
P 5800 6050
F 0 "#PWR0103" H 5800 5800 50  0001 C CNN
F 1 "GND" H 5805 5877 50  0001 C CNN
F 2 "" H 5800 6050 50  0001 C CNN
F 3 "" H 5800 6050 50  0001 C CNN
	1    5800 6050
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0104
U 1 1 5D2DC7D8
P 5800 4850
F 0 "#PWR0104" H 5800 4700 50  0001 C CNN
F 1 "VCC" H 5817 5023 50  0000 C CNN
F 2 "" H 5800 4850 50  0001 C CNN
F 3 "" H 5800 4850 50  0001 C CNN
	1    5800 4850
	1    0    0    -1  
$EndComp
Text Label 6500 5350 0    50   ~ 0
~INTRST~
Text Label 6500 5650 0    50   ~ 0
~EXROM~
$Comp
L Connector:Conn_01x08_Female J4
U 1 1 5D2EA50E
P 9350 5750
F 0 "J4" H 9200 6350 50  0000 L CNN
F 1 "Wireconnections" H 9200 6250 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x08_P2.54mm_Horizontal" H 9350 5750 50  0001 C CNN
F 3 "~" H 9350 5750 50  0001 C CNN
	1    9350 5750
	1    0    0    -1  
$EndComp
Wire Wire Line
	9150 5650 9050 5650
Wire Wire Line
	9150 5850 9050 5850
Text Label 8800 5450 0    50   ~ 0
BLUE
Text Label 8800 5550 0    50   ~ 0
GREEN
Text Label 8800 5650 0    50   ~ 0
RED
$Comp
L power:GND #PWR0105
U 1 1 5D2F2BE7
P 8500 5750
F 0 "#PWR0105" H 8500 5500 50  0001 C CNN
F 1 "GND" H 8505 5577 50  0001 C CNN
F 2 "" H 8500 5750 50  0001 C CNN
F 3 "" H 8500 5750 50  0001 C CNN
	1    8500 5750
	1    0    0    -1  
$EndComp
Wire Wire Line
	8500 5750 9150 5750
Text Label 8800 5750 0    50   ~ 0
GND
Wire Wire Line
	9050 5650 9050 5850
Connection ~ 9050 5650
Text Label 8750 6150 0    50   ~ 0
~RESTORE~
Text Label 8750 5950 0    50   ~ 0
~INTRST~
Text Label 8750 6050 0    50   ~ 0
~EXROM~
$Comp
L Device:R_Small R1
U 1 1 5D2FA66C
P 8150 5450
F 0 "R1" V 8100 5250 50  0000 C CNN
F 1 "1k" V 8100 5600 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" H 8150 5450 50  0001 C CNN
F 3 "~" H 8150 5450 50  0001 C CNN
	1    8150 5450
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R2
U 1 1 5D2FB56E
P 8150 5550
F 0 "R2" V 8100 5350 50  0000 C CNN
F 1 "3k3" V 8100 5700 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" H 8150 5550 50  0001 C CNN
F 3 "~" H 8150 5550 50  0001 C CNN
	1    8150 5550
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R3
U 1 1 5D2FB77A
P 8150 5650
F 0 "R3" V 8100 5450 50  0000 C CNN
F 1 "560" V 8100 5800 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" H 8150 5650 50  0001 C CNN
F 3 "~" H 8150 5650 50  0001 C CNN
	1    8150 5650
	0    1    1    0   
$EndComp
Wire Wire Line
	8250 5450 9150 5450
Wire Wire Line
	8250 5550 9150 5550
Wire Wire Line
	8250 5650 9050 5650
$Comp
L pspice:C C1
U 1 1 5D340530
P 6250 4400
F 0 "C1" H 6428 4446 50  0000 L CNN
F 1 "100nF" H 6428 4355 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D3.8mm_W2.6mm_P2.50mm" H 6250 4400 50  0001 C CNN
F 3 "~" H 6250 4400 50  0001 C CNN
	1    6250 4400
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0106
U 1 1 5D341F04
P 6250 4150
F 0 "#PWR0106" H 6250 4000 50  0001 C CNN
F 1 "VCC" H 6267 4323 50  0000 C CNN
F 2 "" H 6250 4150 50  0001 C CNN
F 3 "" H 6250 4150 50  0001 C CNN
	1    6250 4150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0107
U 1 1 5D3432FD
P 6250 4650
F 0 "#PWR0107" H 6250 4400 50  0001 C CNN
F 1 "GND" H 6255 4477 50  0001 C CNN
F 2 "" H 6250 4650 50  0001 C CNN
F 3 "" H 6250 4650 50  0001 C CNN
	1    6250 4650
	1    0    0    -1  
$EndComp
Text Notes 6900 5350 0    50   ~ 0
SCK
Text Notes 6900 5250 0    50   ~ 0
MISO
Text Notes 6900 5150 0    50   ~ 0
MOSI
Text Notes 6900 5650 0    50   ~ 0
RESET
Wire Wire Line
	8700 5950 9150 5950
Wire Wire Line
	6400 5350 7150 5350
Wire Wire Line
	8700 6050 9150 6050
Wire Wire Line
	6400 5150 7150 5150
Wire Wire Line
	8700 6150 9150 6150
Wire Wire Line
	9300 3400 9700 3400
Wire Notes Line
	9350 5600 9450 5600
Wire Notes Line
	9450 5600 9450 5900
Wire Notes Line
	9450 5900 9350 5900
Text Notes 9500 5850 0    50   ~ 0
Original\nPower\nLED
Wire Notes Line
	9850 5800 9950 5800
Wire Notes Line
	9950 5800 9950 5400
Wire Notes Line
	9950 5400 9350 5400
Text Notes 10000 5700 0    50   ~ 0
RGB LED\nCommon\nCathode
Wire Notes Line
	9350 6200 10500 6200
Wire Notes Line
	10500 6200 10500 5600
Wire Notes Line
	10500 5600 10400 5600
Text Notes 10600 5950 1    50   ~ 0
ISP
Text Notes 10650 6050 0    50   ~ 0
RESET
Text Notes 10650 5750 0    50   ~ 0
GND
Text Notes 10650 5650 0    50   ~ 0
MISO
Text Notes 10650 5950 0    50   ~ 0
SCK
Text Notes 10650 6150 0    50   ~ 0
MOSI
Wire Wire Line
	6400 5650 7150 5650
Wire Wire Line
	7400 5650 7400 5250
Wire Wire Line
	6400 5250 7400 5250
$Comp
L C64-Switchless-Quad-Kernal-Switcher-rescue:ATtiny85-20PU-MCU_Microchip_ATtiny U1
U 1 1 5D2A0255
P 5800 5450
F 0 "U1" H 5400 6000 50  0000 R CNN
F 1 "ATtiny85-20PU" H 5550 6200 50  0000 R CNN
F 2 "Package_DIP:DIP-8_W7.62mm" H 5800 5450 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/atmel-2586-avr-8-bit-microcontroller-attiny25-attiny45-attiny85_datasheet.pdf" H 5800 5450 50  0001 C CNN
	1    5800 5450
	1    0    0    -1  
$EndComp
Text Notes 5000 4850 0    50   ~ 0
or ATtiny45
Text Label 8550 3200 0    50   ~ 0
A15
Text Label 6500 5250 0    50   ~ 0
A15
Wire Wire Line
	9650 3300 9650 2850
Wire Wire Line
	9700 3400 9700 2800
Wire Wire Line
	6400 5450 7700 5450
Wire Wire Line
	6400 5550 7650 5550
Wire Wire Line
	7400 5650 7750 5650
Connection ~ 7750 5650
Wire Wire Line
	7750 5650 8050 5650
Wire Wire Line
	9650 2850 7700 2850
Wire Wire Line
	7700 2850 7700 5450
Connection ~ 7700 5450
Wire Wire Line
	7700 5450 8050 5450
Wire Wire Line
	9700 2800 7650 2800
Wire Wire Line
	7650 2800 7650 5550
Connection ~ 7650 5550
Wire Wire Line
	7650 5550 8050 5550
Wire Wire Line
	7750 3200 8800 3200
Wire Wire Line
	7750 5650 7750 3200
$EndSCHEMATC
