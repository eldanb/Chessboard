EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 4
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text HLabel 1650 1600 0    50   Input ~ 0
SwR1
$Comp
L Switch:SW_Reed SW1
U 1 1 5F4A4CBA
P 2050 850
F 0 "SW1" H 2050 1072 50  0000 C CNN
F 1 "SW_Reed" H 2050 981 50  0000 C CNN
F 2 "eldan_imported_footprints:ReedSw20mm" H 2050 850 50  0001 C CNN
F 3 "~" H 2050 850 50  0001 C CNN
	1    2050 850 
	1    0    0    -1  
$EndComp
$Comp
L Diode:1N4148 D65
U 1 1 5F4A56AD
P 2400 850
F 0 "D65" H 2400 633 50  0000 C CNN
F 1 "1N4148" H 2400 724 50  0000 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 2400 675 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/1N4148_1N4448.pdf" H 2400 850 50  0001 C CNN
	1    2400 850 
	-1   0    0    1   
$EndComp
$Comp
L Switch:SW_Reed SW9
U 1 1 5F4A85E2
P 3000 850
F 0 "SW9" H 3000 1072 50  0000 C CNN
F 1 "SW_Reed" H 3000 981 50  0000 C CNN
F 2 "eldan_imported_footprints:ReedSw20mm" H 3000 850 50  0001 C CNN
F 3 "~" H 3000 850 50  0001 C CNN
	1    3000 850 
	1    0    0    -1  
$EndComp
$Comp
L Diode:1N4148 D73
U 1 1 5F4A85EC
P 3350 850
F 0 "D73" H 3350 633 50  0000 C CNN
F 1 "1N4148" H 3350 724 50  0000 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 3350 675 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/1N4148_1N4448.pdf" H 3350 850 50  0001 C CNN
	1    3350 850 
	-1   0    0    1   
$EndComp
Wire Wire Line
	1850 850  1850 1000
Wire Wire Line
	1850 1000 2800 1000
Wire Wire Line
	2800 1000 2800 850 
$Comp
L Switch:SW_Reed SW17
U 1 1 5F4AE11A
P 3950 850
F 0 "SW17" H 3950 1072 50  0000 C CNN
F 1 "SW_Reed" H 3950 981 50  0000 C CNN
F 2 "eldan_imported_footprints:ReedSw20mm" H 3950 850 50  0001 C CNN
F 3 "~" H 3950 850 50  0001 C CNN
	1    3950 850 
	1    0    0    -1  
$EndComp
$Comp
L Diode:1N4148 D81
U 1 1 5F4AE124
P 4300 850
F 0 "D81" H 4300 633 50  0000 C CNN
F 1 "1N4148" H 4300 724 50  0000 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 4300 675 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/1N4148_1N4448.pdf" H 4300 850 50  0001 C CNN
	1    4300 850 
	-1   0    0    1   
$EndComp
$Comp
L Switch:SW_Reed SW25
U 1 1 5F4AE12E
P 4900 850
F 0 "SW25" H 4900 1072 50  0000 C CNN
F 1 "SW_Reed" H 4900 981 50  0000 C CNN
F 2 "eldan_imported_footprints:ReedSw20mm" H 4900 850 50  0001 C CNN
F 3 "~" H 4900 850 50  0001 C CNN
	1    4900 850 
	1    0    0    -1  
$EndComp
$Comp
L Diode:1N4148 D89
U 1 1 5F4AE138
P 5250 850
F 0 "D89" H 5250 633 50  0000 C CNN
F 1 "1N4148" H 5250 724 50  0000 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 5250 675 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/1N4148_1N4448.pdf" H 5250 850 50  0001 C CNN
	1    5250 850 
	-1   0    0    1   
$EndComp
Wire Wire Line
	3750 850  3750 1000
Wire Wire Line
	3750 1000 4700 1000
Wire Wire Line
	4700 1000 4700 850 
Wire Wire Line
	2800 1000 3750 1000
Connection ~ 2800 1000
Connection ~ 3750 1000
$Comp
L Switch:SW_Reed SW33
U 1 1 5F4B5B30
P 5900 850
F 0 "SW33" H 5900 1072 50  0000 C CNN
F 1 "SW_Reed" H 5900 981 50  0000 C CNN
F 2 "eldan_imported_footprints:ReedSw20mm" H 5900 850 50  0001 C CNN
F 3 "~" H 5900 850 50  0001 C CNN
	1    5900 850 
	1    0    0    -1  
$EndComp
$Comp
L Diode:1N4148 D97
U 1 1 5F4B5B3A
P 6250 850
F 0 "D97" H 6250 633 50  0000 C CNN
F 1 "1N4148" H 6250 724 50  0000 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 6250 675 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/1N4148_1N4448.pdf" H 6250 850 50  0001 C CNN
	1    6250 850 
	-1   0    0    1   
$EndComp
$Comp
L Switch:SW_Reed SW41
U 1 1 5F4B5B44
P 6850 850
F 0 "SW41" H 6850 1072 50  0000 C CNN
F 1 "SW_Reed" H 6850 981 50  0000 C CNN
F 2 "eldan_imported_footprints:ReedSw20mm" H 6850 850 50  0001 C CNN
F 3 "~" H 6850 850 50  0001 C CNN
	1    6850 850 
	1    0    0    -1  
$EndComp
$Comp
L Diode:1N4148 D105
U 1 1 5F4B5B4E
P 7200 850
F 0 "D105" H 7200 633 50  0000 C CNN
F 1 "1N4148" H 7200 724 50  0000 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 7200 675 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/1N4148_1N4448.pdf" H 7200 850 50  0001 C CNN
	1    7200 850 
	-1   0    0    1   
$EndComp
Wire Wire Line
	5700 1000 6650 1000
Wire Wire Line
	6650 1000 6650 850 
$Comp
L Switch:SW_Reed SW49
U 1 1 5F4B5B5B
P 7800 850
F 0 "SW49" H 7800 1072 50  0000 C CNN
F 1 "SW_Reed" H 7800 981 50  0000 C CNN
F 2 "eldan_imported_footprints:ReedSw20mm" H 7800 850 50  0001 C CNN
F 3 "~" H 7800 850 50  0001 C CNN
	1    7800 850 
	1    0    0    -1  
$EndComp
$Comp
L Diode:1N4148 D113
U 1 1 5F4B5B65
P 8150 850
F 0 "D113" H 8150 633 50  0000 C CNN
F 1 "1N4148" H 8150 724 50  0000 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 8150 675 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/1N4148_1N4448.pdf" H 8150 850 50  0001 C CNN
	1    8150 850 
	-1   0    0    1   
$EndComp
$Comp
L Switch:SW_Reed SW57
U 1 1 5F4B5B6F
P 8750 850
F 0 "SW57" H 8750 1072 50  0000 C CNN
F 1 "SW_Reed" H 8750 981 50  0000 C CNN
F 2 "eldan_imported_footprints:ReedSw20mm" H 8750 850 50  0001 C CNN
F 3 "~" H 8750 850 50  0001 C CNN
	1    8750 850 
	1    0    0    -1  
$EndComp
$Comp
L Diode:1N4148 D121
U 1 1 5F4B5B79
P 9100 850
F 0 "D121" H 9100 633 50  0000 C CNN
F 1 "1N4148" H 9100 724 50  0000 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 9100 675 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/1N4148_1N4448.pdf" H 9100 850 50  0001 C CNN
	1    9100 850 
	-1   0    0    1   
$EndComp
Wire Wire Line
	7600 850  7600 1000
Wire Wire Line
	7600 1000 8550 1000
Wire Wire Line
	8550 1000 8550 850 
Wire Wire Line
	6650 1000 7600 1000
Connection ~ 6650 1000
Connection ~ 7600 1000
Wire Wire Line
	5700 850  5700 1000
Wire Wire Line
	4700 1000 5700 1000
Connection ~ 4700 1000
Connection ~ 5700 1000
Wire Wire Line
	1650 1000 1850 1000
Connection ~ 1850 1000
$Comp
L Switch:SW_Reed SW2
U 1 1 5F4E73F1
P 2050 1450
F 0 "SW2" H 2050 1672 50  0000 C CNN
F 1 "SW_Reed" H 2050 1581 50  0000 C CNN
F 2 "eldan_imported_footprints:ReedSw20mm" H 2050 1450 50  0001 C CNN
F 3 "~" H 2050 1450 50  0001 C CNN
	1    2050 1450
	1    0    0    -1  
$EndComp
$Comp
L Diode:1N4148 D66
U 1 1 5F4E73FB
P 2400 1450
F 0 "D66" H 2400 1233 50  0000 C CNN
F 1 "1N4148" H 2400 1324 50  0000 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 2400 1275 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/1N4148_1N4448.pdf" H 2400 1450 50  0001 C CNN
	1    2400 1450
	-1   0    0    1   
$EndComp
$Comp
L Switch:SW_Reed SW10
U 1 1 5F4E7405
P 3000 1450
F 0 "SW10" H 3000 1672 50  0000 C CNN
F 1 "SW_Reed" H 3000 1581 50  0000 C CNN
F 2 "eldan_imported_footprints:ReedSw20mm" H 3000 1450 50  0001 C CNN
F 3 "~" H 3000 1450 50  0001 C CNN
	1    3000 1450
	1    0    0    -1  
$EndComp
$Comp
L Diode:1N4148 D74
U 1 1 5F4E740F
P 3350 1450
F 0 "D74" H 3350 1233 50  0000 C CNN
F 1 "1N4148" H 3350 1324 50  0000 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 3350 1275 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/1N4148_1N4448.pdf" H 3350 1450 50  0001 C CNN
	1    3350 1450
	-1   0    0    1   
$EndComp
Wire Wire Line
	1850 1450 1850 1600
Wire Wire Line
	1850 1600 2800 1600
Wire Wire Line
	2800 1600 2800 1450
$Comp
L Switch:SW_Reed SW18
U 1 1 5F4E741C
P 3950 1450
F 0 "SW18" H 3950 1672 50  0000 C CNN
F 1 "SW_Reed" H 3950 1581 50  0000 C CNN
F 2 "eldan_imported_footprints:ReedSw20mm" H 3950 1450 50  0001 C CNN
F 3 "~" H 3950 1450 50  0001 C CNN
	1    3950 1450
	1    0    0    -1  
$EndComp
$Comp
L Diode:1N4148 D82
U 1 1 5F4E7426
P 4300 1450
F 0 "D82" H 4300 1233 50  0000 C CNN
F 1 "1N4148" H 4300 1324 50  0000 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 4300 1275 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/1N4148_1N4448.pdf" H 4300 1450 50  0001 C CNN
	1    4300 1450
	-1   0    0    1   
$EndComp
$Comp
L Switch:SW_Reed SW26
U 1 1 5F4E7430
P 4900 1450
F 0 "SW26" H 4900 1672 50  0000 C CNN
F 1 "SW_Reed" H 4900 1581 50  0000 C CNN
F 2 "eldan_imported_footprints:ReedSw20mm" H 4900 1450 50  0001 C CNN
F 3 "~" H 4900 1450 50  0001 C CNN
	1    4900 1450
	1    0    0    -1  
$EndComp
$Comp
L Diode:1N4148 D90
U 1 1 5F4E743A
P 5250 1450
F 0 "D90" H 5250 1233 50  0000 C CNN
F 1 "1N4148" H 5250 1324 50  0000 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 5250 1275 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/1N4148_1N4448.pdf" H 5250 1450 50  0001 C CNN
	1    5250 1450
	-1   0    0    1   
$EndComp
Wire Wire Line
	3750 1450 3750 1600
Wire Wire Line
	3750 1600 4700 1600
Wire Wire Line
	4700 1600 4700 1450
Wire Wire Line
	2800 1600 3750 1600
Connection ~ 2800 1600
Connection ~ 3750 1600
$Comp
L Switch:SW_Reed SW34
U 1 1 5F4E744A
P 5900 1450
F 0 "SW34" H 5900 1672 50  0000 C CNN
F 1 "SW_Reed" H 5900 1581 50  0000 C CNN
F 2 "eldan_imported_footprints:ReedSw20mm" H 5900 1450 50  0001 C CNN
F 3 "~" H 5900 1450 50  0001 C CNN
	1    5900 1450
	1    0    0    -1  
$EndComp
$Comp
L Diode:1N4148 D98
U 1 1 5F4E7454
P 6250 1450
F 0 "D98" H 6250 1233 50  0000 C CNN
F 1 "1N4148" H 6250 1324 50  0000 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 6250 1275 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/1N4148_1N4448.pdf" H 6250 1450 50  0001 C CNN
	1    6250 1450
	-1   0    0    1   
$EndComp
$Comp
L Switch:SW_Reed SW42
U 1 1 5F4E745E
P 6850 1450
F 0 "SW42" H 6850 1672 50  0000 C CNN
F 1 "SW_Reed" H 6850 1581 50  0000 C CNN
F 2 "eldan_imported_footprints:ReedSw20mm" H 6850 1450 50  0001 C CNN
F 3 "~" H 6850 1450 50  0001 C CNN
	1    6850 1450
	1    0    0    -1  
$EndComp
$Comp
L Diode:1N4148 D106
U 1 1 5F4E7468
P 7200 1450
F 0 "D106" H 7200 1233 50  0000 C CNN
F 1 "1N4148" H 7200 1324 50  0000 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 7200 1275 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/1N4148_1N4448.pdf" H 7200 1450 50  0001 C CNN
	1    7200 1450
	-1   0    0    1   
$EndComp
Wire Wire Line
	5700 1600 6650 1600
Wire Wire Line
	6650 1600 6650 1450
$Comp
L Switch:SW_Reed SW50
U 1 1 5F4E7474
P 7800 1450
F 0 "SW50" H 7800 1672 50  0000 C CNN
F 1 "SW_Reed" H 7800 1581 50  0000 C CNN
F 2 "eldan_imported_footprints:ReedSw20mm" H 7800 1450 50  0001 C CNN
F 3 "~" H 7800 1450 50  0001 C CNN
	1    7800 1450
	1    0    0    -1  
$EndComp
$Comp
L Diode:1N4148 D114
U 1 1 5F4E747E
P 8150 1450
F 0 "D114" H 8150 1233 50  0000 C CNN
F 1 "1N4148" H 8150 1324 50  0000 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 8150 1275 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/1N4148_1N4448.pdf" H 8150 1450 50  0001 C CNN
	1    8150 1450
	-1   0    0    1   
$EndComp
$Comp
L Switch:SW_Reed SW58
U 1 1 5F4E7488
P 8750 1450
F 0 "SW58" H 8750 1672 50  0000 C CNN
F 1 "SW_Reed" H 8750 1581 50  0000 C CNN
F 2 "eldan_imported_footprints:ReedSw20mm" H 8750 1450 50  0001 C CNN
F 3 "~" H 8750 1450 50  0001 C CNN
	1    8750 1450
	1    0    0    -1  
$EndComp
$Comp
L Diode:1N4148 D122
U 1 1 5F4E7492
P 9100 1450
F 0 "D122" H 9100 1233 50  0000 C CNN
F 1 "1N4148" H 9100 1324 50  0000 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 9100 1275 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/1N4148_1N4448.pdf" H 9100 1450 50  0001 C CNN
	1    9100 1450
	-1   0    0    1   
$EndComp
Wire Wire Line
	7600 1450 7600 1600
Wire Wire Line
	7600 1600 8550 1600
Wire Wire Line
	8550 1600 8550 1450
Wire Wire Line
	6650 1600 7600 1600
Connection ~ 6650 1600
Connection ~ 7600 1600
Wire Wire Line
	5700 1450 5700 1600
Wire Wire Line
	4700 1600 5700 1600
Connection ~ 4700 1600
Connection ~ 5700 1600
Wire Wire Line
	1650 1600 1850 1600
Connection ~ 1850 1600
Wire Wire Line
	2550 850  2550 1450
Wire Wire Line
	3500 850  3500 1450
Wire Wire Line
	4450 850  4450 1450
Wire Wire Line
	5400 850  5400 1450
Wire Wire Line
	6400 850  6400 1450
Wire Wire Line
	7350 850  7350 1450
Wire Wire Line
	8300 850  8300 1450
Wire Wire Line
	9250 850  9250 1450
Text HLabel 1650 2900 0    50   Input ~ 0
SwR3
$Comp
L Switch:SW_Reed SW3
U 1 1 5F52F7C3
P 2050 2150
F 0 "SW3" H 2050 2372 50  0000 C CNN
F 1 "SW_Reed" H 2050 2281 50  0000 C CNN
F 2 "eldan_imported_footprints:ReedSw20mm" H 2050 2150 50  0001 C CNN
F 3 "~" H 2050 2150 50  0001 C CNN
	1    2050 2150
	1    0    0    -1  
$EndComp
$Comp
L Diode:1N4148 D67
U 1 1 5F52F7CD
P 2400 2150
F 0 "D67" H 2400 1933 50  0000 C CNN
F 1 "1N4148" H 2400 2024 50  0000 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 2400 1975 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/1N4148_1N4448.pdf" H 2400 2150 50  0001 C CNN
	1    2400 2150
	-1   0    0    1   
$EndComp
$Comp
L Switch:SW_Reed SW11
U 1 1 5F52F7D7
P 3000 2150
F 0 "SW11" H 3000 2372 50  0000 C CNN
F 1 "SW_Reed" H 3000 2281 50  0000 C CNN
F 2 "eldan_imported_footprints:ReedSw20mm" H 3000 2150 50  0001 C CNN
F 3 "~" H 3000 2150 50  0001 C CNN
	1    3000 2150
	1    0    0    -1  
$EndComp
$Comp
L Diode:1N4148 D75
U 1 1 5F52F7E1
P 3350 2150
F 0 "D75" H 3350 1933 50  0000 C CNN
F 1 "1N4148" H 3350 2024 50  0000 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 3350 1975 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/1N4148_1N4448.pdf" H 3350 2150 50  0001 C CNN
	1    3350 2150
	-1   0    0    1   
$EndComp
Wire Wire Line
	1850 2150 1850 2300
Wire Wire Line
	1850 2300 2800 2300
Wire Wire Line
	2800 2300 2800 2150
$Comp
L Switch:SW_Reed SW19
U 1 1 5F52F7EE
P 3950 2150
F 0 "SW19" H 3950 2372 50  0000 C CNN
F 1 "SW_Reed" H 3950 2281 50  0000 C CNN
F 2 "eldan_imported_footprints:ReedSw20mm" H 3950 2150 50  0001 C CNN
F 3 "~" H 3950 2150 50  0001 C CNN
	1    3950 2150
	1    0    0    -1  
$EndComp
$Comp
L Diode:1N4148 D83
U 1 1 5F52F7F8
P 4300 2150
F 0 "D83" H 4300 1933 50  0000 C CNN
F 1 "1N4148" H 4300 2024 50  0000 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 4300 1975 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/1N4148_1N4448.pdf" H 4300 2150 50  0001 C CNN
	1    4300 2150
	-1   0    0    1   
$EndComp
$Comp
L Switch:SW_Reed SW27
U 1 1 5F52F802
P 4900 2150
F 0 "SW27" H 4900 2372 50  0000 C CNN
F 1 "SW_Reed" H 4900 2281 50  0000 C CNN
F 2 "eldan_imported_footprints:ReedSw20mm" H 4900 2150 50  0001 C CNN
F 3 "~" H 4900 2150 50  0001 C CNN
	1    4900 2150
	1    0    0    -1  
$EndComp
$Comp
L Diode:1N4148 D91
U 1 1 5F52F80C
P 5250 2150
F 0 "D91" H 5250 1933 50  0000 C CNN
F 1 "1N4148" H 5250 2024 50  0000 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 5250 1975 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/1N4148_1N4448.pdf" H 5250 2150 50  0001 C CNN
	1    5250 2150
	-1   0    0    1   
$EndComp
Wire Wire Line
	3750 2150 3750 2300
Wire Wire Line
	3750 2300 4700 2300
Wire Wire Line
	4700 2300 4700 2150
Wire Wire Line
	2800 2300 3750 2300
Connection ~ 2800 2300
Connection ~ 3750 2300
$Comp
L Switch:SW_Reed SW35
U 1 1 5F52F81C
P 5900 2150
F 0 "SW35" H 5900 2372 50  0000 C CNN
F 1 "SW_Reed" H 5900 2281 50  0000 C CNN
F 2 "eldan_imported_footprints:ReedSw20mm" H 5900 2150 50  0001 C CNN
F 3 "~" H 5900 2150 50  0001 C CNN
	1    5900 2150
	1    0    0    -1  
$EndComp
$Comp
L Diode:1N4148 D99
U 1 1 5F52F826
P 6250 2150
F 0 "D99" H 6250 1933 50  0000 C CNN
F 1 "1N4148" H 6250 2024 50  0000 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 6250 1975 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/1N4148_1N4448.pdf" H 6250 2150 50  0001 C CNN
	1    6250 2150
	-1   0    0    1   
$EndComp
$Comp
L Switch:SW_Reed SW43
U 1 1 5F52F830
P 6850 2150
F 0 "SW43" H 6850 2372 50  0000 C CNN
F 1 "SW_Reed" H 6850 2281 50  0000 C CNN
F 2 "eldan_imported_footprints:ReedSw20mm" H 6850 2150 50  0001 C CNN
F 3 "~" H 6850 2150 50  0001 C CNN
	1    6850 2150
	1    0    0    -1  
$EndComp
$Comp
L Diode:1N4148 D107
U 1 1 5F52F83A
P 7200 2150
F 0 "D107" H 7200 1933 50  0000 C CNN
F 1 "1N4148" H 7200 2024 50  0000 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 7200 1975 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/1N4148_1N4448.pdf" H 7200 2150 50  0001 C CNN
	1    7200 2150
	-1   0    0    1   
$EndComp
Wire Wire Line
	5700 2300 6650 2300
Wire Wire Line
	6650 2300 6650 2150
$Comp
L Switch:SW_Reed SW51
U 1 1 5F52F846
P 7800 2150
F 0 "SW51" H 7800 2372 50  0000 C CNN
F 1 "SW_Reed" H 7800 2281 50  0000 C CNN
F 2 "eldan_imported_footprints:ReedSw20mm" H 7800 2150 50  0001 C CNN
F 3 "~" H 7800 2150 50  0001 C CNN
	1    7800 2150
	1    0    0    -1  
$EndComp
$Comp
L Diode:1N4148 D115
U 1 1 5F52F850
P 8150 2150
F 0 "D115" H 8150 1933 50  0000 C CNN
F 1 "1N4148" H 8150 2024 50  0000 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 8150 1975 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/1N4148_1N4448.pdf" H 8150 2150 50  0001 C CNN
	1    8150 2150
	-1   0    0    1   
$EndComp
$Comp
L Switch:SW_Reed SW59
U 1 1 5F52F85A
P 8750 2150
F 0 "SW59" H 8750 2372 50  0000 C CNN
F 1 "SW_Reed" H 8750 2281 50  0000 C CNN
F 2 "eldan_imported_footprints:ReedSw20mm" H 8750 2150 50  0001 C CNN
F 3 "~" H 8750 2150 50  0001 C CNN
	1    8750 2150
	1    0    0    -1  
$EndComp
$Comp
L Diode:1N4148 D123
U 1 1 5F52F864
P 9100 2150
F 0 "D123" H 9100 1933 50  0000 C CNN
F 1 "1N4148" H 9100 2024 50  0000 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 9100 1975 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/1N4148_1N4448.pdf" H 9100 2150 50  0001 C CNN
	1    9100 2150
	-1   0    0    1   
$EndComp
Wire Wire Line
	7600 2150 7600 2300
Wire Wire Line
	7600 2300 8550 2300
Wire Wire Line
	8550 2300 8550 2150
Wire Wire Line
	6650 2300 7600 2300
Connection ~ 6650 2300
Connection ~ 7600 2300
Wire Wire Line
	5700 2150 5700 2300
Wire Wire Line
	4700 2300 5700 2300
Connection ~ 4700 2300
Connection ~ 5700 2300
Wire Wire Line
	1650 2300 1850 2300
Connection ~ 1850 2300
Text HLabel 1650 3500 0    50   Input ~ 0
SwR4
$Comp
L Switch:SW_Reed SW4
U 1 1 5F52F87B
P 2050 2750
F 0 "SW4" H 2050 2972 50  0000 C CNN
F 1 "SW_Reed" H 2050 2881 50  0000 C CNN
F 2 "eldan_imported_footprints:ReedSw20mm" H 2050 2750 50  0001 C CNN
F 3 "~" H 2050 2750 50  0001 C CNN
	1    2050 2750
	1    0    0    -1  
$EndComp
$Comp
L Diode:1N4148 D68
U 1 1 5F52F885
P 2400 2750
F 0 "D68" H 2400 2533 50  0000 C CNN
F 1 "1N4148" H 2400 2624 50  0000 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 2400 2575 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/1N4148_1N4448.pdf" H 2400 2750 50  0001 C CNN
	1    2400 2750
	-1   0    0    1   
$EndComp
$Comp
L Switch:SW_Reed SW12
U 1 1 5F52F88F
P 3000 2750
F 0 "SW12" H 3000 2972 50  0000 C CNN
F 1 "SW_Reed" H 3000 2881 50  0000 C CNN
F 2 "eldan_imported_footprints:ReedSw20mm" H 3000 2750 50  0001 C CNN
F 3 "~" H 3000 2750 50  0001 C CNN
	1    3000 2750
	1    0    0    -1  
$EndComp
$Comp
L Diode:1N4148 D76
U 1 1 5F52F899
P 3350 2750
F 0 "D76" H 3350 2533 50  0000 C CNN
F 1 "1N4148" H 3350 2624 50  0000 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 3350 2575 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/1N4148_1N4448.pdf" H 3350 2750 50  0001 C CNN
	1    3350 2750
	-1   0    0    1   
$EndComp
Wire Wire Line
	1850 2750 1850 2900
Wire Wire Line
	1850 2900 2800 2900
Wire Wire Line
	2800 2900 2800 2750
$Comp
L Switch:SW_Reed SW20
U 1 1 5F52F8A6
P 3950 2750
F 0 "SW20" H 3950 2972 50  0000 C CNN
F 1 "SW_Reed" H 3950 2881 50  0000 C CNN
F 2 "eldan_imported_footprints:ReedSw20mm" H 3950 2750 50  0001 C CNN
F 3 "~" H 3950 2750 50  0001 C CNN
	1    3950 2750
	1    0    0    -1  
$EndComp
$Comp
L Diode:1N4148 D84
U 1 1 5F52F8B0
P 4300 2750
F 0 "D84" H 4300 2533 50  0000 C CNN
F 1 "1N4148" H 4300 2624 50  0000 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 4300 2575 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/1N4148_1N4448.pdf" H 4300 2750 50  0001 C CNN
	1    4300 2750
	-1   0    0    1   
$EndComp
$Comp
L Switch:SW_Reed SW28
U 1 1 5F52F8BA
P 4900 2750
F 0 "SW28" H 4900 2972 50  0000 C CNN
F 1 "SW_Reed" H 4900 2881 50  0000 C CNN
F 2 "eldan_imported_footprints:ReedSw20mm" H 4900 2750 50  0001 C CNN
F 3 "~" H 4900 2750 50  0001 C CNN
	1    4900 2750
	1    0    0    -1  
$EndComp
$Comp
L Diode:1N4148 D92
U 1 1 5F52F8C4
P 5250 2750
F 0 "D92" H 5250 2533 50  0000 C CNN
F 1 "1N4148" H 5250 2624 50  0000 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 5250 2575 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/1N4148_1N4448.pdf" H 5250 2750 50  0001 C CNN
	1    5250 2750
	-1   0    0    1   
$EndComp
Wire Wire Line
	3750 2750 3750 2900
Wire Wire Line
	3750 2900 4700 2900
Wire Wire Line
	4700 2900 4700 2750
Wire Wire Line
	2800 2900 3750 2900
Connection ~ 2800 2900
Connection ~ 3750 2900
$Comp
L Switch:SW_Reed SW36
U 1 1 5F52F8D4
P 5900 2750
F 0 "SW36" H 5900 2972 50  0000 C CNN
F 1 "SW_Reed" H 5900 2881 50  0000 C CNN
F 2 "eldan_imported_footprints:ReedSw20mm" H 5900 2750 50  0001 C CNN
F 3 "~" H 5900 2750 50  0001 C CNN
	1    5900 2750
	1    0    0    -1  
$EndComp
$Comp
L Diode:1N4148 D100
U 1 1 5F52F8DE
P 6250 2750
F 0 "D100" H 6250 2533 50  0000 C CNN
F 1 "1N4148" H 6250 2624 50  0000 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 6250 2575 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/1N4148_1N4448.pdf" H 6250 2750 50  0001 C CNN
	1    6250 2750
	-1   0    0    1   
$EndComp
$Comp
L Switch:SW_Reed SW44
U 1 1 5F52F8E8
P 6850 2750
F 0 "SW44" H 6850 2972 50  0000 C CNN
F 1 "SW_Reed" H 6850 2881 50  0000 C CNN
F 2 "eldan_imported_footprints:ReedSw20mm" H 6850 2750 50  0001 C CNN
F 3 "~" H 6850 2750 50  0001 C CNN
	1    6850 2750
	1    0    0    -1  
$EndComp
$Comp
L Diode:1N4148 D108
U 1 1 5F52F8F2
P 7200 2750
F 0 "D108" H 7200 2533 50  0000 C CNN
F 1 "1N4148" H 7200 2624 50  0000 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 7200 2575 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/1N4148_1N4448.pdf" H 7200 2750 50  0001 C CNN
	1    7200 2750
	-1   0    0    1   
$EndComp
Wire Wire Line
	5700 2900 6650 2900
Wire Wire Line
	6650 2900 6650 2750
$Comp
L Switch:SW_Reed SW52
U 1 1 5F52F8FE
P 7800 2750
F 0 "SW52" H 7800 2972 50  0000 C CNN
F 1 "SW_Reed" H 7800 2881 50  0000 C CNN
F 2 "eldan_imported_footprints:ReedSw20mm" H 7800 2750 50  0001 C CNN
F 3 "~" H 7800 2750 50  0001 C CNN
	1    7800 2750
	1    0    0    -1  
$EndComp
$Comp
L Diode:1N4148 D116
U 1 1 5F52F908
P 8150 2750
F 0 "D116" H 8150 2533 50  0000 C CNN
F 1 "1N4148" H 8150 2624 50  0000 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 8150 2575 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/1N4148_1N4448.pdf" H 8150 2750 50  0001 C CNN
	1    8150 2750
	-1   0    0    1   
$EndComp
$Comp
L Switch:SW_Reed SW60
U 1 1 5F52F912
P 8750 2750
F 0 "SW60" H 8750 2972 50  0000 C CNN
F 1 "SW_Reed" H 8750 2881 50  0000 C CNN
F 2 "eldan_imported_footprints:ReedSw20mm" H 8750 2750 50  0001 C CNN
F 3 "~" H 8750 2750 50  0001 C CNN
	1    8750 2750
	1    0    0    -1  
$EndComp
$Comp
L Diode:1N4148 D124
U 1 1 5F52F91C
P 9100 2750
F 0 "D124" H 9100 2533 50  0000 C CNN
F 1 "1N4148" H 9100 2624 50  0000 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 9100 2575 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/1N4148_1N4448.pdf" H 9100 2750 50  0001 C CNN
	1    9100 2750
	-1   0    0    1   
$EndComp
Wire Wire Line
	7600 2750 7600 2900
Wire Wire Line
	7600 2900 8550 2900
Wire Wire Line
	8550 2900 8550 2750
Wire Wire Line
	6650 2900 7600 2900
Connection ~ 6650 2900
Connection ~ 7600 2900
Wire Wire Line
	5700 2750 5700 2900
Wire Wire Line
	4700 2900 5700 2900
Connection ~ 4700 2900
Connection ~ 5700 2900
Wire Wire Line
	1650 2900 1850 2900
Connection ~ 1850 2900
Wire Wire Line
	2550 2150 2550 2750
Wire Wire Line
	3500 2150 3500 2750
Wire Wire Line
	4450 2150 4450 2750
Wire Wire Line
	5400 2150 5400 2750
Wire Wire Line
	6400 2150 6400 2750
Wire Wire Line
	7350 2150 7350 2750
Wire Wire Line
	8300 2150 8300 2750
Wire Wire Line
	2550 1450 2550 2150
Connection ~ 2550 1450
Connection ~ 2550 2150
Wire Wire Line
	3500 1450 3500 2150
Connection ~ 3500 1450
Connection ~ 3500 2150
Wire Wire Line
	4450 1450 4450 2150
Connection ~ 4450 1450
Connection ~ 4450 2150
Wire Wire Line
	5400 1450 5400 2150
Connection ~ 5400 1450
Connection ~ 5400 2150
Wire Wire Line
	6400 1450 6400 2150
Connection ~ 6400 1450
Connection ~ 6400 2150
Wire Wire Line
	7350 1450 7350 2150
Connection ~ 7350 1450
Connection ~ 7350 2150
Wire Wire Line
	8300 1450 8300 2150
Connection ~ 8300 1450
Connection ~ 8300 2150
Wire Wire Line
	9250 1450 9250 2150
Connection ~ 9250 1450
Connection ~ 9250 2150
$Comp
L Switch:SW_Reed SW5
U 1 1 5F5DFAAF
P 2050 3350
F 0 "SW5" H 2050 3572 50  0000 C CNN
F 1 "SW_Reed" H 2050 3481 50  0000 C CNN
F 2 "eldan_imported_footprints:ReedSw20mm" H 2050 3350 50  0001 C CNN
F 3 "~" H 2050 3350 50  0001 C CNN
	1    2050 3350
	1    0    0    -1  
$EndComp
$Comp
L Diode:1N4148 D69
U 1 1 5F5DFAB9
P 2400 3350
F 0 "D69" H 2400 3133 50  0000 C CNN
F 1 "1N4148" H 2400 3224 50  0000 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 2400 3175 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/1N4148_1N4448.pdf" H 2400 3350 50  0001 C CNN
	1    2400 3350
	-1   0    0    1   
$EndComp
$Comp
L Switch:SW_Reed SW13
U 1 1 5F5DFAC3
P 3000 3350
F 0 "SW13" H 3000 3572 50  0000 C CNN
F 1 "SW_Reed" H 3000 3481 50  0000 C CNN
F 2 "eldan_imported_footprints:ReedSw20mm" H 3000 3350 50  0001 C CNN
F 3 "~" H 3000 3350 50  0001 C CNN
	1    3000 3350
	1    0    0    -1  
$EndComp
$Comp
L Diode:1N4148 D77
U 1 1 5F5DFACD
P 3350 3350
F 0 "D77" H 3350 3133 50  0000 C CNN
F 1 "1N4148" H 3350 3224 50  0000 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 3350 3175 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/1N4148_1N4448.pdf" H 3350 3350 50  0001 C CNN
	1    3350 3350
	-1   0    0    1   
$EndComp
Wire Wire Line
	1850 3350 1850 3500
Wire Wire Line
	1850 3500 2800 3500
Wire Wire Line
	2800 3500 2800 3350
$Comp
L Switch:SW_Reed SW21
U 1 1 5F5DFADA
P 3950 3350
F 0 "SW21" H 3950 3572 50  0000 C CNN
F 1 "SW_Reed" H 3950 3481 50  0000 C CNN
F 2 "eldan_imported_footprints:ReedSw20mm" H 3950 3350 50  0001 C CNN
F 3 "~" H 3950 3350 50  0001 C CNN
	1    3950 3350
	1    0    0    -1  
$EndComp
$Comp
L Diode:1N4148 D85
U 1 1 5F5DFAE4
P 4300 3350
F 0 "D85" H 4300 3133 50  0000 C CNN
F 1 "1N4148" H 4300 3224 50  0000 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 4300 3175 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/1N4148_1N4448.pdf" H 4300 3350 50  0001 C CNN
	1    4300 3350
	-1   0    0    1   
$EndComp
$Comp
L Switch:SW_Reed SW29
U 1 1 5F5DFAEE
P 4900 3350
F 0 "SW29" H 4900 3572 50  0000 C CNN
F 1 "SW_Reed" H 4900 3481 50  0000 C CNN
F 2 "eldan_imported_footprints:ReedSw20mm" H 4900 3350 50  0001 C CNN
F 3 "~" H 4900 3350 50  0001 C CNN
	1    4900 3350
	1    0    0    -1  
$EndComp
$Comp
L Diode:1N4148 D93
U 1 1 5F5DFAF8
P 5250 3350
F 0 "D93" H 5250 3133 50  0000 C CNN
F 1 "1N4148" H 5250 3224 50  0000 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 5250 3175 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/1N4148_1N4448.pdf" H 5250 3350 50  0001 C CNN
	1    5250 3350
	-1   0    0    1   
$EndComp
Wire Wire Line
	3750 3350 3750 3500
Wire Wire Line
	3750 3500 4700 3500
Wire Wire Line
	4700 3500 4700 3350
Wire Wire Line
	2800 3500 3750 3500
Connection ~ 2800 3500
Connection ~ 3750 3500
$Comp
L Switch:SW_Reed SW37
U 1 1 5F5DFB08
P 5900 3350
F 0 "SW37" H 5900 3572 50  0000 C CNN
F 1 "SW_Reed" H 5900 3481 50  0000 C CNN
F 2 "eldan_imported_footprints:ReedSw20mm" H 5900 3350 50  0001 C CNN
F 3 "~" H 5900 3350 50  0001 C CNN
	1    5900 3350
	1    0    0    -1  
$EndComp
$Comp
L Diode:1N4148 D101
U 1 1 5F5DFB12
P 6250 3350
F 0 "D101" H 6250 3133 50  0000 C CNN
F 1 "1N4148" H 6250 3224 50  0000 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 6250 3175 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/1N4148_1N4448.pdf" H 6250 3350 50  0001 C CNN
	1    6250 3350
	-1   0    0    1   
$EndComp
$Comp
L Switch:SW_Reed SW45
U 1 1 5F5DFB1C
P 6850 3350
F 0 "SW45" H 6850 3572 50  0000 C CNN
F 1 "SW_Reed" H 6850 3481 50  0000 C CNN
F 2 "eldan_imported_footprints:ReedSw20mm" H 6850 3350 50  0001 C CNN
F 3 "~" H 6850 3350 50  0001 C CNN
	1    6850 3350
	1    0    0    -1  
$EndComp
$Comp
L Diode:1N4148 D109
U 1 1 5F5DFB26
P 7200 3350
F 0 "D109" H 7200 3133 50  0000 C CNN
F 1 "1N4148" H 7200 3224 50  0000 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 7200 3175 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/1N4148_1N4448.pdf" H 7200 3350 50  0001 C CNN
	1    7200 3350
	-1   0    0    1   
$EndComp
Wire Wire Line
	5700 3500 6650 3500
Wire Wire Line
	6650 3500 6650 3350
$Comp
L Switch:SW_Reed SW53
U 1 1 5F5DFB32
P 7800 3350
F 0 "SW53" H 7800 3572 50  0000 C CNN
F 1 "SW_Reed" H 7800 3481 50  0000 C CNN
F 2 "eldan_imported_footprints:ReedSw20mm" H 7800 3350 50  0001 C CNN
F 3 "~" H 7800 3350 50  0001 C CNN
	1    7800 3350
	1    0    0    -1  
$EndComp
$Comp
L Diode:1N4148 D117
U 1 1 5F5DFB3C
P 8150 3350
F 0 "D117" H 8150 3133 50  0000 C CNN
F 1 "1N4148" H 8150 3224 50  0000 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 8150 3175 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/1N4148_1N4448.pdf" H 8150 3350 50  0001 C CNN
	1    8150 3350
	-1   0    0    1   
$EndComp
$Comp
L Switch:SW_Reed SW61
U 1 1 5F5DFB46
P 8750 3350
F 0 "SW61" H 8750 3572 50  0000 C CNN
F 1 "SW_Reed" H 8750 3481 50  0000 C CNN
F 2 "eldan_imported_footprints:ReedSw20mm" H 8750 3350 50  0001 C CNN
F 3 "~" H 8750 3350 50  0001 C CNN
	1    8750 3350
	1    0    0    -1  
$EndComp
$Comp
L Diode:1N4148 D125
U 1 1 5F5DFB50
P 9100 3350
F 0 "D125" H 9100 3133 50  0000 C CNN
F 1 "1N4148" H 9100 3224 50  0000 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 9100 3175 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/1N4148_1N4448.pdf" H 9100 3350 50  0001 C CNN
	1    9100 3350
	-1   0    0    1   
$EndComp
Wire Wire Line
	7600 3350 7600 3500
Wire Wire Line
	7600 3500 8550 3500
Wire Wire Line
	8550 3500 8550 3350
Wire Wire Line
	6650 3500 7600 3500
Connection ~ 6650 3500
Connection ~ 7600 3500
Wire Wire Line
	5700 3350 5700 3500
Wire Wire Line
	4700 3500 5700 3500
Connection ~ 4700 3500
Connection ~ 5700 3500
Wire Wire Line
	1650 3500 1850 3500
Connection ~ 1850 3500
Text HLabel 1650 4800 0    50   Input ~ 0
SwR6
$Comp
L Switch:SW_Reed SW6
U 1 1 5F5DFB67
P 2050 3950
F 0 "SW6" H 2050 4172 50  0000 C CNN
F 1 "SW_Reed" H 2050 4081 50  0000 C CNN
F 2 "eldan_imported_footprints:ReedSw20mm" H 2050 3950 50  0001 C CNN
F 3 "~" H 2050 3950 50  0001 C CNN
	1    2050 3950
	1    0    0    -1  
$EndComp
$Comp
L Diode:1N4148 D70
U 1 1 5F5DFB71
P 2400 3950
F 0 "D70" H 2400 3733 50  0000 C CNN
F 1 "1N4148" H 2400 3824 50  0000 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 2400 3775 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/1N4148_1N4448.pdf" H 2400 3950 50  0001 C CNN
	1    2400 3950
	-1   0    0    1   
$EndComp
$Comp
L Switch:SW_Reed SW14
U 1 1 5F5DFB7B
P 3000 3950
F 0 "SW14" H 3000 4172 50  0000 C CNN
F 1 "SW_Reed" H 3000 4081 50  0000 C CNN
F 2 "eldan_imported_footprints:ReedSw20mm" H 3000 3950 50  0001 C CNN
F 3 "~" H 3000 3950 50  0001 C CNN
	1    3000 3950
	1    0    0    -1  
$EndComp
$Comp
L Diode:1N4148 D78
U 1 1 5F5DFB85
P 3350 3950
F 0 "D78" H 3350 3733 50  0000 C CNN
F 1 "1N4148" H 3350 3824 50  0000 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 3350 3775 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/1N4148_1N4448.pdf" H 3350 3950 50  0001 C CNN
	1    3350 3950
	-1   0    0    1   
$EndComp
Wire Wire Line
	1850 3950 1850 4100
Wire Wire Line
	1850 4100 2800 4100
Wire Wire Line
	2800 4100 2800 3950
$Comp
L Switch:SW_Reed SW22
U 1 1 5F5DFB92
P 3950 3950
F 0 "SW22" H 3950 4172 50  0000 C CNN
F 1 "SW_Reed" H 3950 4081 50  0000 C CNN
F 2 "eldan_imported_footprints:ReedSw20mm" H 3950 3950 50  0001 C CNN
F 3 "~" H 3950 3950 50  0001 C CNN
	1    3950 3950
	1    0    0    -1  
$EndComp
$Comp
L Diode:1N4148 D86
U 1 1 5F5DFB9C
P 4300 3950
F 0 "D86" H 4300 3733 50  0000 C CNN
F 1 "1N4148" H 4300 3824 50  0000 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 4300 3775 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/1N4148_1N4448.pdf" H 4300 3950 50  0001 C CNN
	1    4300 3950
	-1   0    0    1   
$EndComp
$Comp
L Switch:SW_Reed SW30
U 1 1 5F5DFBA6
P 4900 3950
F 0 "SW30" H 4900 4172 50  0000 C CNN
F 1 "SW_Reed" H 4900 4081 50  0000 C CNN
F 2 "eldan_imported_footprints:ReedSw20mm" H 4900 3950 50  0001 C CNN
F 3 "~" H 4900 3950 50  0001 C CNN
	1    4900 3950
	1    0    0    -1  
$EndComp
$Comp
L Diode:1N4148 D94
U 1 1 5F5DFBB0
P 5250 3950
F 0 "D94" H 5250 3733 50  0000 C CNN
F 1 "1N4148" H 5250 3824 50  0000 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 5250 3775 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/1N4148_1N4448.pdf" H 5250 3950 50  0001 C CNN
	1    5250 3950
	-1   0    0    1   
$EndComp
Wire Wire Line
	3750 3950 3750 4100
Wire Wire Line
	3750 4100 4700 4100
Wire Wire Line
	4700 4100 4700 3950
Wire Wire Line
	2800 4100 3750 4100
Connection ~ 2800 4100
Connection ~ 3750 4100
$Comp
L Switch:SW_Reed SW38
U 1 1 5F5DFBC0
P 5900 3950
F 0 "SW38" H 5900 4172 50  0000 C CNN
F 1 "SW_Reed" H 5900 4081 50  0000 C CNN
F 2 "eldan_imported_footprints:ReedSw20mm" H 5900 3950 50  0001 C CNN
F 3 "~" H 5900 3950 50  0001 C CNN
	1    5900 3950
	1    0    0    -1  
$EndComp
$Comp
L Diode:1N4148 D102
U 1 1 5F5DFBCA
P 6250 3950
F 0 "D102" H 6250 3733 50  0000 C CNN
F 1 "1N4148" H 6250 3824 50  0000 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 6250 3775 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/1N4148_1N4448.pdf" H 6250 3950 50  0001 C CNN
	1    6250 3950
	-1   0    0    1   
$EndComp
$Comp
L Switch:SW_Reed SW46
U 1 1 5F5DFBD4
P 6850 3950
F 0 "SW46" H 6850 4172 50  0000 C CNN
F 1 "SW_Reed" H 6850 4081 50  0000 C CNN
F 2 "eldan_imported_footprints:ReedSw20mm" H 6850 3950 50  0001 C CNN
F 3 "~" H 6850 3950 50  0001 C CNN
	1    6850 3950
	1    0    0    -1  
$EndComp
$Comp
L Diode:1N4148 D110
U 1 1 5F5DFBDE
P 7200 3950
F 0 "D110" H 7200 3733 50  0000 C CNN
F 1 "1N4148" H 7200 3824 50  0000 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 7200 3775 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/1N4148_1N4448.pdf" H 7200 3950 50  0001 C CNN
	1    7200 3950
	-1   0    0    1   
$EndComp
Wire Wire Line
	5700 4100 6650 4100
Wire Wire Line
	6650 4100 6650 3950
$Comp
L Switch:SW_Reed SW54
U 1 1 5F5DFBEA
P 7800 3950
F 0 "SW54" H 7800 4172 50  0000 C CNN
F 1 "SW_Reed" H 7800 4081 50  0000 C CNN
F 2 "eldan_imported_footprints:ReedSw20mm" H 7800 3950 50  0001 C CNN
F 3 "~" H 7800 3950 50  0001 C CNN
	1    7800 3950
	1    0    0    -1  
$EndComp
$Comp
L Diode:1N4148 D118
U 1 1 5F5DFBF4
P 8150 3950
F 0 "D118" H 8150 3733 50  0000 C CNN
F 1 "1N4148" H 8150 3824 50  0000 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 8150 3775 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/1N4148_1N4448.pdf" H 8150 3950 50  0001 C CNN
	1    8150 3950
	-1   0    0    1   
$EndComp
$Comp
L Switch:SW_Reed SW62
U 1 1 5F5DFBFE
P 8750 3950
F 0 "SW62" H 8750 4172 50  0000 C CNN
F 1 "SW_Reed" H 8750 4081 50  0000 C CNN
F 2 "eldan_imported_footprints:ReedSw20mm" H 8750 3950 50  0001 C CNN
F 3 "~" H 8750 3950 50  0001 C CNN
	1    8750 3950
	1    0    0    -1  
$EndComp
$Comp
L Diode:1N4148 D126
U 1 1 5F5DFC08
P 9100 3950
F 0 "D126" H 9100 3733 50  0000 C CNN
F 1 "1N4148" H 9100 3824 50  0000 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 9100 3775 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/1N4148_1N4448.pdf" H 9100 3950 50  0001 C CNN
	1    9100 3950
	-1   0    0    1   
$EndComp
Wire Wire Line
	7600 3950 7600 4100
Wire Wire Line
	7600 4100 8550 4100
Wire Wire Line
	8550 4100 8550 3950
Wire Wire Line
	6650 4100 7600 4100
Connection ~ 6650 4100
Connection ~ 7600 4100
Wire Wire Line
	5700 3950 5700 4100
Wire Wire Line
	4700 4100 5700 4100
Connection ~ 4700 4100
Connection ~ 5700 4100
Wire Wire Line
	1650 4100 1850 4100
Connection ~ 1850 4100
Wire Wire Line
	2550 3350 2550 3950
Text HLabel 1650 5400 0    50   Input ~ 0
SwR7
$Comp
L Switch:SW_Reed SW7
U 1 1 5F5DFC27
P 2050 4650
F 0 "SW7" H 2050 4872 50  0000 C CNN
F 1 "SW_Reed" H 2050 4781 50  0000 C CNN
F 2 "eldan_imported_footprints:ReedSw20mm" H 2050 4650 50  0001 C CNN
F 3 "~" H 2050 4650 50  0001 C CNN
	1    2050 4650
	1    0    0    -1  
$EndComp
$Comp
L Diode:1N4148 D71
U 1 1 5F5DFC31
P 2400 4650
F 0 "D71" H 2400 4433 50  0000 C CNN
F 1 "1N4148" H 2400 4524 50  0000 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 2400 4475 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/1N4148_1N4448.pdf" H 2400 4650 50  0001 C CNN
	1    2400 4650
	-1   0    0    1   
$EndComp
$Comp
L Switch:SW_Reed SW15
U 1 1 5F5DFC3B
P 3000 4650
F 0 "SW15" H 3000 4872 50  0000 C CNN
F 1 "SW_Reed" H 3000 4781 50  0000 C CNN
F 2 "eldan_imported_footprints:ReedSw20mm" H 3000 4650 50  0001 C CNN
F 3 "~" H 3000 4650 50  0001 C CNN
	1    3000 4650
	1    0    0    -1  
$EndComp
$Comp
L Diode:1N4148 D79
U 1 1 5F5DFC45
P 3350 4650
F 0 "D79" H 3350 4433 50  0000 C CNN
F 1 "1N4148" H 3350 4524 50  0000 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 3350 4475 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/1N4148_1N4448.pdf" H 3350 4650 50  0001 C CNN
	1    3350 4650
	-1   0    0    1   
$EndComp
Wire Wire Line
	1850 4650 1850 4800
Wire Wire Line
	1850 4800 2800 4800
Wire Wire Line
	2800 4800 2800 4650
$Comp
L Switch:SW_Reed SW23
U 1 1 5F5DFC52
P 3950 4650
F 0 "SW23" H 3950 4872 50  0000 C CNN
F 1 "SW_Reed" H 3950 4781 50  0000 C CNN
F 2 "eldan_imported_footprints:ReedSw20mm" H 3950 4650 50  0001 C CNN
F 3 "~" H 3950 4650 50  0001 C CNN
	1    3950 4650
	1    0    0    -1  
$EndComp
$Comp
L Diode:1N4148 D87
U 1 1 5F5DFC5C
P 4300 4650
F 0 "D87" H 4300 4433 50  0000 C CNN
F 1 "1N4148" H 4300 4524 50  0000 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 4300 4475 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/1N4148_1N4448.pdf" H 4300 4650 50  0001 C CNN
	1    4300 4650
	-1   0    0    1   
$EndComp
$Comp
L Switch:SW_Reed SW31
U 1 1 5F5DFC66
P 4900 4650
F 0 "SW31" H 4900 4872 50  0000 C CNN
F 1 "SW_Reed" H 4900 4781 50  0000 C CNN
F 2 "eldan_imported_footprints:ReedSw20mm" H 4900 4650 50  0001 C CNN
F 3 "~" H 4900 4650 50  0001 C CNN
	1    4900 4650
	1    0    0    -1  
$EndComp
$Comp
L Diode:1N4148 D95
U 1 1 5F5DFC70
P 5250 4650
F 0 "D95" H 5250 4433 50  0000 C CNN
F 1 "1N4148" H 5250 4524 50  0000 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 5250 4475 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/1N4148_1N4448.pdf" H 5250 4650 50  0001 C CNN
	1    5250 4650
	-1   0    0    1   
$EndComp
Wire Wire Line
	3750 4650 3750 4800
Wire Wire Line
	3750 4800 4700 4800
Wire Wire Line
	4700 4800 4700 4650
Wire Wire Line
	2800 4800 3750 4800
Connection ~ 2800 4800
Connection ~ 3750 4800
$Comp
L Switch:SW_Reed SW39
U 1 1 5F5DFC80
P 5900 4650
F 0 "SW39" H 5900 4872 50  0000 C CNN
F 1 "SW_Reed" H 5900 4781 50  0000 C CNN
F 2 "eldan_imported_footprints:ReedSw20mm" H 5900 4650 50  0001 C CNN
F 3 "~" H 5900 4650 50  0001 C CNN
	1    5900 4650
	1    0    0    -1  
$EndComp
$Comp
L Diode:1N4148 D103
U 1 1 5F5DFC8A
P 6250 4650
F 0 "D103" H 6250 4433 50  0000 C CNN
F 1 "1N4148" H 6250 4524 50  0000 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 6250 4475 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/1N4148_1N4448.pdf" H 6250 4650 50  0001 C CNN
	1    6250 4650
	-1   0    0    1   
$EndComp
$Comp
L Switch:SW_Reed SW47
U 1 1 5F5DFC94
P 6850 4650
F 0 "SW47" H 6850 4872 50  0000 C CNN
F 1 "SW_Reed" H 6850 4781 50  0000 C CNN
F 2 "eldan_imported_footprints:ReedSw20mm" H 6850 4650 50  0001 C CNN
F 3 "~" H 6850 4650 50  0001 C CNN
	1    6850 4650
	1    0    0    -1  
$EndComp
$Comp
L Diode:1N4148 D111
U 1 1 5F5DFC9E
P 7200 4650
F 0 "D111" H 7200 4433 50  0000 C CNN
F 1 "1N4148" H 7200 4524 50  0000 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 7200 4475 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/1N4148_1N4448.pdf" H 7200 4650 50  0001 C CNN
	1    7200 4650
	-1   0    0    1   
$EndComp
Wire Wire Line
	5700 4800 6650 4800
Wire Wire Line
	6650 4800 6650 4650
$Comp
L Switch:SW_Reed SW55
U 1 1 5F5DFCAA
P 7800 4650
F 0 "SW55" H 7800 4872 50  0000 C CNN
F 1 "SW_Reed" H 7800 4781 50  0000 C CNN
F 2 "eldan_imported_footprints:ReedSw20mm" H 7800 4650 50  0001 C CNN
F 3 "~" H 7800 4650 50  0001 C CNN
	1    7800 4650
	1    0    0    -1  
$EndComp
$Comp
L Diode:1N4148 D119
U 1 1 5F5DFCB4
P 8150 4650
F 0 "D119" H 8150 4433 50  0000 C CNN
F 1 "1N4148" H 8150 4524 50  0000 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 8150 4475 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/1N4148_1N4448.pdf" H 8150 4650 50  0001 C CNN
	1    8150 4650
	-1   0    0    1   
$EndComp
$Comp
L Switch:SW_Reed SW63
U 1 1 5F5DFCBE
P 8750 4650
F 0 "SW63" H 8750 4872 50  0000 C CNN
F 1 "SW_Reed" H 8750 4781 50  0000 C CNN
F 2 "eldan_imported_footprints:ReedSw20mm" H 8750 4650 50  0001 C CNN
F 3 "~" H 8750 4650 50  0001 C CNN
	1    8750 4650
	1    0    0    -1  
$EndComp
$Comp
L Diode:1N4148 D127
U 1 1 5F5DFCC8
P 9100 4650
F 0 "D127" H 9100 4433 50  0000 C CNN
F 1 "1N4148" H 9100 4524 50  0000 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 9100 4475 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/1N4148_1N4448.pdf" H 9100 4650 50  0001 C CNN
	1    9100 4650
	-1   0    0    1   
$EndComp
Wire Wire Line
	7600 4650 7600 4800
Wire Wire Line
	7600 4800 8550 4800
Wire Wire Line
	8550 4800 8550 4650
Wire Wire Line
	6650 4800 7600 4800
Connection ~ 6650 4800
Connection ~ 7600 4800
Wire Wire Line
	5700 4650 5700 4800
Wire Wire Line
	4700 4800 5700 4800
Connection ~ 4700 4800
Connection ~ 5700 4800
Wire Wire Line
	1650 4800 1850 4800
Connection ~ 1850 4800
Text HLabel 1650 1000 0    50   Input ~ 0
SwR0
$Comp
L Switch:SW_Reed SW8
U 1 1 5F5DFCDF
P 2050 5250
F 0 "SW8" H 2050 5472 50  0000 C CNN
F 1 "SW_Reed" H 2050 5381 50  0000 C CNN
F 2 "eldan_imported_footprints:ReedSw20mm" H 2050 5250 50  0001 C CNN
F 3 "~" H 2050 5250 50  0001 C CNN
	1    2050 5250
	1    0    0    -1  
$EndComp
$Comp
L Diode:1N4148 D72
U 1 1 5F5DFCE9
P 2400 5250
F 0 "D72" H 2400 5033 50  0000 C CNN
F 1 "1N4148" H 2400 5124 50  0000 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 2400 5075 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/1N4148_1N4448.pdf" H 2400 5250 50  0001 C CNN
	1    2400 5250
	-1   0    0    1   
$EndComp
$Comp
L Switch:SW_Reed SW16
U 1 1 5F5DFCF3
P 3000 5250
F 0 "SW16" H 3000 5472 50  0000 C CNN
F 1 "SW_Reed" H 3000 5381 50  0000 C CNN
F 2 "eldan_imported_footprints:ReedSw20mm" H 3000 5250 50  0001 C CNN
F 3 "~" H 3000 5250 50  0001 C CNN
	1    3000 5250
	1    0    0    -1  
$EndComp
$Comp
L Diode:1N4148 D80
U 1 1 5F5DFCFD
P 3350 5250
F 0 "D80" H 3350 5033 50  0000 C CNN
F 1 "1N4148" H 3350 5124 50  0000 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 3350 5075 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/1N4148_1N4448.pdf" H 3350 5250 50  0001 C CNN
	1    3350 5250
	-1   0    0    1   
$EndComp
Wire Wire Line
	1850 5250 1850 5400
Wire Wire Line
	1850 5400 2800 5400
Wire Wire Line
	2800 5400 2800 5250
$Comp
L Switch:SW_Reed SW24
U 1 1 5F5DFD0A
P 3950 5250
F 0 "SW24" H 3950 5472 50  0000 C CNN
F 1 "SW_Reed" H 3950 5381 50  0000 C CNN
F 2 "eldan_imported_footprints:ReedSw20mm" H 3950 5250 50  0001 C CNN
F 3 "~" H 3950 5250 50  0001 C CNN
	1    3950 5250
	1    0    0    -1  
$EndComp
$Comp
L Diode:1N4148 D88
U 1 1 5F5DFD14
P 4300 5250
F 0 "D88" H 4300 5033 50  0000 C CNN
F 1 "1N4148" H 4300 5124 50  0000 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 4300 5075 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/1N4148_1N4448.pdf" H 4300 5250 50  0001 C CNN
	1    4300 5250
	-1   0    0    1   
$EndComp
$Comp
L Switch:SW_Reed SW32
U 1 1 5F5DFD1E
P 4900 5250
F 0 "SW32" H 4900 5472 50  0000 C CNN
F 1 "SW_Reed" H 4900 5381 50  0000 C CNN
F 2 "eldan_imported_footprints:ReedSw20mm" H 4900 5250 50  0001 C CNN
F 3 "~" H 4900 5250 50  0001 C CNN
	1    4900 5250
	1    0    0    -1  
$EndComp
$Comp
L Diode:1N4148 D96
U 1 1 5F5DFD28
P 5250 5250
F 0 "D96" H 5250 5033 50  0000 C CNN
F 1 "1N4148" H 5250 5124 50  0000 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 5250 5075 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/1N4148_1N4448.pdf" H 5250 5250 50  0001 C CNN
	1    5250 5250
	-1   0    0    1   
$EndComp
Wire Wire Line
	3750 5250 3750 5400
Wire Wire Line
	3750 5400 4700 5400
Wire Wire Line
	4700 5400 4700 5250
Wire Wire Line
	2800 5400 3750 5400
Connection ~ 2800 5400
Connection ~ 3750 5400
$Comp
L Switch:SW_Reed SW40
U 1 1 5F5DFD38
P 5900 5250
F 0 "SW40" H 5900 5472 50  0000 C CNN
F 1 "SW_Reed" H 5900 5381 50  0000 C CNN
F 2 "eldan_imported_footprints:ReedSw20mm" H 5900 5250 50  0001 C CNN
F 3 "~" H 5900 5250 50  0001 C CNN
	1    5900 5250
	1    0    0    -1  
$EndComp
$Comp
L Diode:1N4148 D104
U 1 1 5F5DFD42
P 6250 5250
F 0 "D104" H 6250 5033 50  0000 C CNN
F 1 "1N4148" H 6250 5124 50  0000 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 6250 5075 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/1N4148_1N4448.pdf" H 6250 5250 50  0001 C CNN
	1    6250 5250
	-1   0    0    1   
$EndComp
$Comp
L Switch:SW_Reed SW48
U 1 1 5F5DFD4C
P 6850 5250
F 0 "SW48" H 6850 5472 50  0000 C CNN
F 1 "SW_Reed" H 6850 5381 50  0000 C CNN
F 2 "eldan_imported_footprints:ReedSw20mm" H 6850 5250 50  0001 C CNN
F 3 "~" H 6850 5250 50  0001 C CNN
	1    6850 5250
	1    0    0    -1  
$EndComp
$Comp
L Diode:1N4148 D112
U 1 1 5F5DFD56
P 7200 5250
F 0 "D112" H 7200 5033 50  0000 C CNN
F 1 "1N4148" H 7200 5124 50  0000 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 7200 5075 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/1N4148_1N4448.pdf" H 7200 5250 50  0001 C CNN
	1    7200 5250
	-1   0    0    1   
$EndComp
Wire Wire Line
	5700 5400 6650 5400
Wire Wire Line
	6650 5400 6650 5250
$Comp
L Switch:SW_Reed SW56
U 1 1 5F5DFD62
P 7800 5250
F 0 "SW56" H 7800 5472 50  0000 C CNN
F 1 "SW_Reed" H 7800 5381 50  0000 C CNN
F 2 "eldan_imported_footprints:ReedSw20mm" H 7800 5250 50  0001 C CNN
F 3 "~" H 7800 5250 50  0001 C CNN
	1    7800 5250
	1    0    0    -1  
$EndComp
$Comp
L Diode:1N4148 D120
U 1 1 5F5DFD6C
P 8150 5250
F 0 "D120" H 8150 5033 50  0000 C CNN
F 1 "1N4148" H 8150 5124 50  0000 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 8150 5075 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/1N4148_1N4448.pdf" H 8150 5250 50  0001 C CNN
	1    8150 5250
	-1   0    0    1   
$EndComp
$Comp
L Switch:SW_Reed SW64
U 1 1 5F5DFD76
P 8750 5250
F 0 "SW64" H 8750 5472 50  0000 C CNN
F 1 "SW_Reed" H 8750 5381 50  0000 C CNN
F 2 "eldan_imported_footprints:ReedSw20mm" H 8750 5250 50  0001 C CNN
F 3 "~" H 8750 5250 50  0001 C CNN
	1    8750 5250
	1    0    0    -1  
$EndComp
$Comp
L Diode:1N4148 D128
U 1 1 5F5DFD80
P 9100 5250
F 0 "D128" H 9100 5033 50  0000 C CNN
F 1 "1N4148" H 9100 5124 50  0000 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 9100 5075 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/1N4148_1N4448.pdf" H 9100 5250 50  0001 C CNN
	1    9100 5250
	-1   0    0    1   
$EndComp
Wire Wire Line
	7600 5250 7600 5400
Wire Wire Line
	7600 5400 8550 5400
Wire Wire Line
	8550 5400 8550 5250
Wire Wire Line
	6650 5400 7600 5400
Connection ~ 6650 5400
Connection ~ 7600 5400
Wire Wire Line
	5700 5250 5700 5400
Wire Wire Line
	4700 5400 5700 5400
Connection ~ 4700 5400
Connection ~ 5700 5400
Wire Wire Line
	1650 5400 1850 5400
Connection ~ 1850 5400
Wire Wire Line
	2550 4650 2550 5250
Wire Wire Line
	3500 4650 3500 5250
Wire Wire Line
	4450 4650 4450 5250
Wire Wire Line
	5400 4650 5400 5250
Wire Wire Line
	6400 4650 6400 5250
Wire Wire Line
	7350 4650 7350 5250
Wire Wire Line
	8300 4650 8300 5250
Wire Wire Line
	9250 4650 9250 5250
Wire Wire Line
	2550 3950 2550 4650
Connection ~ 2550 3950
Connection ~ 2550 4650
Wire Wire Line
	3500 3950 3500 4650
Connection ~ 3500 3950
Connection ~ 3500 4650
Wire Wire Line
	4450 3950 4450 4650
Connection ~ 4450 3950
Connection ~ 4450 4650
Wire Wire Line
	5400 3950 5400 4650
Connection ~ 5400 3950
Connection ~ 5400 4650
Wire Wire Line
	6400 3950 6400 4650
Connection ~ 6400 3950
Connection ~ 6400 4650
Wire Wire Line
	7350 3950 7350 4650
Connection ~ 7350 3950
Connection ~ 7350 4650
Wire Wire Line
	8300 3950 8300 4650
Connection ~ 8300 3950
Connection ~ 8300 4650
Wire Wire Line
	9250 3950 9250 4650
Connection ~ 9250 3950
Connection ~ 9250 4650
Wire Wire Line
	2550 2750 2550 3350
Connection ~ 2550 2750
Connection ~ 2550 3350
Wire Wire Line
	3500 2750 3500 3350
Connection ~ 3500 2750
Connection ~ 3500 3350
Wire Wire Line
	3500 3350 3500 3950
Wire Wire Line
	4450 2750 4450 3350
Connection ~ 4450 2750
Connection ~ 4450 3350
Wire Wire Line
	4450 3350 4450 3950
Wire Wire Line
	5400 2750 5400 3350
Connection ~ 5400 2750
Connection ~ 5400 3350
Wire Wire Line
	5400 3350 5400 3950
Wire Wire Line
	6400 2750 6400 3350
Connection ~ 6400 2750
Connection ~ 6400 3350
Wire Wire Line
	6400 3350 6400 3950
Wire Wire Line
	7350 2750 7350 3350
Connection ~ 7350 2750
Connection ~ 7350 3350
Wire Wire Line
	7350 3350 7350 3950
Wire Wire Line
	8300 2750 8300 3350
Connection ~ 8300 2750
Connection ~ 8300 3350
Wire Wire Line
	8300 3350 8300 3950
Wire Wire Line
	9250 2150 9250 2750
Connection ~ 9250 2750
Wire Wire Line
	9250 2750 9250 3350
Connection ~ 9250 3350
Wire Wire Line
	9250 3350 9250 3950
Text HLabel 3500 6200 3    50   Input ~ 0
SwC1
Text HLabel 4450 6200 3    50   Input ~ 0
SwC2
Text HLabel 5400 6200 3    50   Output ~ 0
SwC3
Text HLabel 6400 6200 3    50   Input ~ 0
SwC4
Text HLabel 7350 6200 3    50   Input ~ 0
SwC5
Text HLabel 8300 6200 3    50   Input ~ 0
SwC6
Text HLabel 9250 6200 3    50   Input ~ 0
SwC7
Text HLabel 2550 6200 3    50   Input ~ 0
SwC0
$Comp
L Device:R R1
U 1 1 5F78E619
P 2700 6150
F 0 "R1" V 2493 6150 50  0000 C CNN
F 1 "10K" V 2584 6150 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 2630 6150 50  0001 C CNN
F 3 "~" H 2700 6150 50  0001 C CNN
	1    2700 6150
	0    1    1    0   
$EndComp
Connection ~ 2550 6150
Wire Wire Line
	2550 6150 2550 6200
$Comp
L power:GND #PWR0103
U 1 1 5F794552
P 2850 6150
F 0 "#PWR0103" H 2850 5900 50  0001 C CNN
F 1 "GND" H 2855 5977 50  0000 C CNN
F 2 "" H 2850 6150 50  0001 C CNN
F 3 "" H 2850 6150 50  0001 C CNN
	1    2850 6150
	1    0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 5F79DE1A
P 3650 6150
F 0 "R2" V 3443 6150 50  0000 C CNN
F 1 "10K" V 3534 6150 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 3580 6150 50  0001 C CNN
F 3 "~" H 3650 6150 50  0001 C CNN
	1    3650 6150
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0104
U 1 1 5F79DE24
P 3800 6150
F 0 "#PWR0104" H 3800 5900 50  0001 C CNN
F 1 "GND" H 3805 5977 50  0000 C CNN
F 2 "" H 3800 6150 50  0001 C CNN
F 3 "" H 3800 6150 50  0001 C CNN
	1    3800 6150
	1    0    0    -1  
$EndComp
Connection ~ 3500 6150
Wire Wire Line
	3500 6150 3500 6200
$Comp
L Device:R R3
U 1 1 5F7B7CA7
P 4600 6150
F 0 "R3" V 4393 6150 50  0000 C CNN
F 1 "10K" V 4484 6150 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 4530 6150 50  0001 C CNN
F 3 "~" H 4600 6150 50  0001 C CNN
	1    4600 6150
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0105
U 1 1 5F7B7CB1
P 4750 6150
F 0 "#PWR0105" H 4750 5900 50  0001 C CNN
F 1 "GND" H 4755 5977 50  0000 C CNN
F 2 "" H 4750 6150 50  0001 C CNN
F 3 "" H 4750 6150 50  0001 C CNN
	1    4750 6150
	1    0    0    -1  
$EndComp
Connection ~ 4450 6150
Wire Wire Line
	4450 6150 4450 6200
$Comp
L Device:R R4
U 1 1 5F7CFC43
P 5550 6150
F 0 "R4" V 5343 6150 50  0000 C CNN
F 1 "10K" V 5434 6150 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 5480 6150 50  0001 C CNN
F 3 "~" H 5550 6150 50  0001 C CNN
	1    5550 6150
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0106
U 1 1 5F7CFC4D
P 5700 6150
F 0 "#PWR0106" H 5700 5900 50  0001 C CNN
F 1 "GND" H 5705 5977 50  0000 C CNN
F 2 "" H 5700 6150 50  0001 C CNN
F 3 "" H 5700 6150 50  0001 C CNN
	1    5700 6150
	1    0    0    -1  
$EndComp
Connection ~ 5400 6150
Wire Wire Line
	5400 6150 5400 6200
$Comp
L Device:R R5
U 1 1 5F7E7FB5
P 6550 6150
F 0 "R5" V 6343 6150 50  0000 C CNN
F 1 "10K" V 6434 6150 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 6480 6150 50  0001 C CNN
F 3 "~" H 6550 6150 50  0001 C CNN
	1    6550 6150
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0107
U 1 1 5F7E7FBF
P 6700 6150
F 0 "#PWR0107" H 6700 5900 50  0001 C CNN
F 1 "GND" H 6705 5977 50  0000 C CNN
F 2 "" H 6700 6150 50  0001 C CNN
F 3 "" H 6700 6150 50  0001 C CNN
	1    6700 6150
	1    0    0    -1  
$EndComp
Connection ~ 6400 6150
Wire Wire Line
	6400 6150 6400 6200
$Comp
L Device:R R6
U 1 1 5F816133
P 7500 6150
F 0 "R6" V 7293 6150 50  0000 C CNN
F 1 "10K" V 7384 6150 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 7430 6150 50  0001 C CNN
F 3 "~" H 7500 6150 50  0001 C CNN
	1    7500 6150
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0108
U 1 1 5F81613D
P 7650 6150
F 0 "#PWR0108" H 7650 5900 50  0001 C CNN
F 1 "GND" H 7655 5977 50  0000 C CNN
F 2 "" H 7650 6150 50  0001 C CNN
F 3 "" H 7650 6150 50  0001 C CNN
	1    7650 6150
	1    0    0    -1  
$EndComp
Connection ~ 7350 6150
Wire Wire Line
	7350 6150 7350 6200
$Comp
L Device:R R7
U 1 1 5F841FE2
P 8450 6150
F 0 "R7" V 8243 6150 50  0000 C CNN
F 1 "10K" V 8334 6150 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 8380 6150 50  0001 C CNN
F 3 "~" H 8450 6150 50  0001 C CNN
	1    8450 6150
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0109
U 1 1 5F841FEC
P 8600 6150
F 0 "#PWR0109" H 8600 5900 50  0001 C CNN
F 1 "GND" H 8605 5977 50  0000 C CNN
F 2 "" H 8600 6150 50  0001 C CNN
F 3 "" H 8600 6150 50  0001 C CNN
	1    8600 6150
	1    0    0    -1  
$EndComp
Connection ~ 8300 6150
Wire Wire Line
	8300 6150 8300 6200
$Comp
L Device:R R8
U 1 1 5F851562
P 9400 6150
F 0 "R8" V 9193 6150 50  0000 C CNN
F 1 "10K" V 9284 6150 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 9330 6150 50  0001 C CNN
F 3 "~" H 9400 6150 50  0001 C CNN
	1    9400 6150
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0110
U 1 1 5F85156C
P 9550 6150
F 0 "#PWR0110" H 9550 5900 50  0001 C CNN
F 1 "GND" H 9555 5977 50  0000 C CNN
F 2 "" H 9550 6150 50  0001 C CNN
F 3 "" H 9550 6150 50  0001 C CNN
	1    9550 6150
	1    0    0    -1  
$EndComp
Connection ~ 9250 6150
Wire Wire Line
	9250 6150 9250 6200
Text HLabel 1650 2300 0    50   Input ~ 0
SwR2
Text HLabel 1650 4100 0    50   Input ~ 0
SwR5
Text HLabel 1650 6000 0    50   Input ~ 0
SwRC
$Comp
L Diode:1N4148 D129
U 1 1 5F076FBF
P 2400 5850
F 0 "D129" H 2400 5633 50  0000 C CNN
F 1 "1N4148" H 2400 5724 50  0000 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 2400 5675 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/1N4148_1N4448.pdf" H 2400 5850 50  0001 C CNN
	1    2400 5850
	-1   0    0    1   
$EndComp
$Comp
L Diode:1N4148 D130
U 1 1 5F076FD3
P 3350 5850
F 0 "D130" H 3350 5633 50  0000 C CNN
F 1 "1N4148" H 3350 5724 50  0000 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 3350 5675 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/1N4148_1N4448.pdf" H 3350 5850 50  0001 C CNN
	1    3350 5850
	-1   0    0    1   
$EndComp
Wire Wire Line
	1850 5850 1850 6000
Wire Wire Line
	1850 6000 2800 6000
Wire Wire Line
	2800 6000 2800 5850
$Comp
L Diode:1N4148 D131
U 1 1 5F076FEA
P 4300 5850
F 0 "D131" H 4300 5633 50  0000 C CNN
F 1 "1N4148" H 4300 5724 50  0000 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 4300 5675 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/1N4148_1N4448.pdf" H 4300 5850 50  0001 C CNN
	1    4300 5850
	-1   0    0    1   
$EndComp
$Comp
L Diode:1N4148 D132
U 1 1 5F076FFE
P 5250 5850
F 0 "D132" H 5250 5633 50  0000 C CNN
F 1 "1N4148" H 5250 5724 50  0000 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 5250 5675 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/1N4148_1N4448.pdf" H 5250 5850 50  0001 C CNN
	1    5250 5850
	-1   0    0    1   
$EndComp
Wire Wire Line
	3750 5850 3750 6000
Wire Wire Line
	3750 6000 4700 6000
Wire Wire Line
	4700 6000 4700 5850
Wire Wire Line
	2800 6000 3750 6000
Connection ~ 2800 6000
Connection ~ 3750 6000
$Comp
L Diode:1N4148 D133
U 1 1 5F077018
P 6250 5850
F 0 "D133" H 6250 5633 50  0000 C CNN
F 1 "1N4148" H 6250 5724 50  0000 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 6250 5675 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/1N4148_1N4448.pdf" H 6250 5850 50  0001 C CNN
	1    6250 5850
	-1   0    0    1   
$EndComp
$Comp
L Diode:1N4148 D134
U 1 1 5F07702C
P 7200 5850
F 0 "D134" H 7200 5633 50  0000 C CNN
F 1 "1N4148" H 7200 5724 50  0000 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 7200 5675 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/1N4148_1N4448.pdf" H 7200 5850 50  0001 C CNN
	1    7200 5850
	-1   0    0    1   
$EndComp
Wire Wire Line
	5700 6000 6650 6000
Wire Wire Line
	6650 6000 6650 5850
Wire Wire Line
	5700 5850 5700 6000
Wire Wire Line
	4700 6000 5700 6000
Connection ~ 4700 6000
Connection ~ 5700 6000
Wire Wire Line
	1650 6000 1850 6000
Connection ~ 1850 6000
Connection ~ 2550 5250
Connection ~ 3500 5250
Connection ~ 4450 5250
Connection ~ 5400 5250
Connection ~ 6400 5250
Connection ~ 7350 5250
Connection ~ 8300 5250
Connection ~ 9250 5250
Connection ~ 2550 5850
Wire Wire Line
	2550 5850 2550 6150
Connection ~ 3500 5850
Wire Wire Line
	3500 5850 3500 6150
Connection ~ 4450 5850
Wire Wire Line
	4450 5850 4450 6150
Connection ~ 5400 5850
Wire Wire Line
	5400 5850 5400 6150
Connection ~ 6400 5850
Wire Wire Line
	6400 5850 6400 6150
Connection ~ 7350 5850
Wire Wire Line
	7350 5850 7350 6150
Wire Wire Line
	2550 5700 2550 5850
Wire Wire Line
	3500 5700 3500 5850
Wire Wire Line
	4450 5700 4450 5850
Wire Wire Line
	5400 5700 5400 5850
Wire Wire Line
	6400 5700 6400 5850
Wire Wire Line
	7350 5700 7350 5850
Wire Wire Line
	2550 5250 2550 5850
Wire Wire Line
	3500 5250 3500 5850
Wire Wire Line
	4450 5250 4450 5850
Wire Wire Line
	5400 5250 5400 5850
Wire Wire Line
	6400 5250 6400 5850
Wire Wire Line
	7350 5250 7350 5850
Wire Wire Line
	8300 5250 8300 6150
Wire Wire Line
	9250 5250 9250 6150
$Comp
L Switch:SW_Push_Dual SW65
U 1 1 5F1A213E
P 2050 5850
F 0 "SW65" H 2050 6135 50  0000 C CNN
F 1 "SW_Push_Dual" H 2050 6044 50  0000 C CNN
F 2 "Button_Switch_THT:SW_PUSH-12mm" H 2050 6050 50  0001 C CNN
F 3 "~" H 2050 6050 50  0001 C CNN
	1    2050 5850
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push_Dual SW66
U 1 1 5F1A6295
P 3000 5850
F 0 "SW66" H 3000 6135 50  0000 C CNN
F 1 "SW_Push_Dual" H 3000 6044 50  0000 C CNN
F 2 "Button_Switch_THT:SW_PUSH-12mm" H 3000 6050 50  0001 C CNN
F 3 "~" H 3000 6050 50  0001 C CNN
	1    3000 5850
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push_Dual SW67
U 1 1 5F1A92AF
P 3950 5850
F 0 "SW67" H 3950 6135 50  0000 C CNN
F 1 "SW_Push_Dual" H 3950 6044 50  0000 C CNN
F 2 "Button_Switch_THT:SW_PUSH-12mm" H 3950 6050 50  0001 C CNN
F 3 "~" H 3950 6050 50  0001 C CNN
	1    3950 5850
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push_Dual SW68
U 1 1 5F1AA72F
P 4900 5850
F 0 "SW68" H 4900 6135 50  0000 C CNN
F 1 "SW_Push_Dual" H 4900 6044 50  0000 C CNN
F 2 "Button_Switch_THT:SW_PUSH-12mm" H 4900 6050 50  0001 C CNN
F 3 "~" H 4900 6050 50  0001 C CNN
	1    4900 5850
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push_Dual SW69
U 1 1 5F1ACB2E
P 5900 5850
F 0 "SW69" H 5900 6135 50  0000 C CNN
F 1 "SW_Push_Dual" H 5900 6044 50  0000 C CNN
F 2 "Button_Switch_THT:SW_PUSH-12mm" H 5900 6050 50  0001 C CNN
F 3 "~" H 5900 6050 50  0001 C CNN
	1    5900 5850
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push_Dual SW70
U 1 1 5F1B0339
P 6850 5850
F 0 "SW70" H 6850 6135 50  0000 C CNN
F 1 "SW_Push_Dual" H 6850 6044 50  0000 C CNN
F 2 "Button_Switch_THT:SW_PUSH-12mm" H 6850 6050 50  0001 C CNN
F 3 "~" H 6850 6050 50  0001 C CNN
	1    6850 5850
	1    0    0    -1  
$EndComp
$EndSCHEMATC
