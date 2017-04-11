#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Compile_Both=y  ;required for ImageSearch.au3
#AutoIt3Wrapper_UseX64=y  ;required for ImageSearch.au3
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****

#RequireAdmin
#include "ImageSearch.au3"
#include "FastFind.au3"
#include <File.au3>
#include <ButtonConstants.au3>
#include <ComboConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <TabConstants.au3>
#include <WindowsConstants.au3>
#include <ListViewConstants.au3>

#Region ### START Koda GUI section ### Form=c:\program files (x86)\autoit3\scite\koda\forms\newfish1.kxf
$CrayonCode = GUICreate("CrayonCode", 401, 401, 190, 321, -1, BitOR($WS_EX_TOPMOST, $WS_EX_WINDOWEDGE))
$Tab = GUICtrlCreateTab(0, 0, 400, 400)
$Tab_Main = GUICtrlCreateTabItem("Main")
$Group4 = GUICtrlCreateGroup("Stats", 32, 96, 329, 281)
$Label7 = GUICtrlCreateLabel("Status:", 48, 128, 37, 17)
$Edit1 = GUICtrlCreateEdit("", 112, 128, 233, 17, BitOR($ES_CENTER, $ES_NOHIDESEL, $ES_READONLY))
$Label6 = GUICtrlCreateLabel("Inventory:", 48, 176, 51, 17)
$Edit2 = GUICtrlCreateEdit("", 112, 176, 137, 17, BitOR($ES_CENTER, $ES_NOHIDESEL, $ES_READONLY))
GUICtrlSetTip(-1, "Number of looted items / Avaible Inventory Slots ( Reserved Slots). Stops fishing when limit is reached.")
$ButtonClear = GUICtrlCreateButton("Clear [F5]", 264, 168, 75, 33)
GUICtrlSetTip(-1, "Sets looted items to back zero.")
$ListView1 = GUICtrlCreateListView("Type|Session|Total", 48, 208, 298, 158, BitOR($GUI_SS_DEFAULT_LISTVIEW, $WS_VSCROLL), $LVS_EX_FULLROWSELECT)
GUICtrlSendMsg(-1, $LVM_SETCOLUMNWIDTH, 0, 100)
GUICtrlSendMsg(-1, $LVM_SETCOLUMNWIDTH, 1, 90)
GUICtrlSendMsg(-1, $LVM_SETCOLUMNWIDTH, 2, 100)
$ListView1_0 = GUICtrlCreateListViewItem("White", $ListView1)
$ListView1_1 = GUICtrlCreateListViewItem("Green", $ListView1)
$ListView1_2 = GUICtrlCreateListViewItem("Blue", $ListView1)
$ListView1_3 = GUICtrlCreateListViewItem("Gold", $ListView1)
$ListView1_4 = GUICtrlCreateListViewItem("Silver Key", $ListView1)
$ListView1_5 = GUICtrlCreateListViewItem("Ancient Relic", $ListView1)
$ListView1_6 = GUICtrlCreateListViewItem("Coelacanth", $ListView1)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Button1 = GUICtrlCreateButton("Start/Stop [F4]", 64, 40, 115, 49)
GUICtrlSetTip(-1, "Starts/Stops fishing. Shortcut is F4.")
$Button2 = GUICtrlCreateButton("Reset Session [F8]", 208, 40, 115, 49)
GUICtrlSetTip(-1, "Sets Inventory and Session stats back to zero. Shortcut is F8.")
$Tab_Settings = GUICtrlCreateTabItem("Settings")
$Loot_Settings = GUICtrlCreateGroup("Loot Settings", 16, 56, 177, 217)
$LSpecial = GUICtrlCreateLabel("Special Items:", 36, 151, 70, 17)
$LRarity = GUICtrlCreateLabel("Minimum Rarity:", 36, 87, 78, 17)
$CRarity = GUICtrlCreateCombo("", 44, 111, 82, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "Gold|Blue|Green|White|Specials Only", "Blue")
$CBSpecial1 = GUICtrlCreateCheckbox("Silver Key", 44, 175, 97, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
$CBSpecial2 = GUICtrlCreateCheckbox("Ancient Relic", 44, 207, 97, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
$CBSpecial3 = GUICtrlCreateCheckbox("Coelacanth", 44, 239, 97, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Inventory_Settings = GUICtrlCreateGroup("Inventory Settings", 208, 56, 177, 217)
$Label1 = GUICtrlCreateLabel("Free Inventory Slots:", 224, 80, 101, 17)
$Input1 = GUICtrlCreateInput("64", 232, 104, 81, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_NUMBER))
GUICtrlSetLimit(-1, 3)
GUICtrlSetTip(-1, "Avaible space for Loot specified by Loot Settings.")
$Label2 = GUICtrlCreateLabel("Reserved Slots:", 224, 144, 79, 17)
GUICtrlSetTip(-1, "When the free inventory slots are full, these slots will be reserved for Ancient Relics and Coelacanths.")
$Input2 = GUICtrlCreateInput("8", 232, 168, 81, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_NUMBER))
GUICtrlSetTip(-1, "Additional space restricted to selected Special Items.")
$Checkbox1 = GUICtrlCreateCheckbox("Discard", 232, 232, 97, 17)
GUICtrlSetTip(-1, "Throw away fishingrods with zero durability. ")
$Label3 = GUICtrlCreateLabel("Empty Rods:", 224, 208, 64, 17)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Group3 = GUICtrlCreateGroup("Buff Food", 16, 288, 265, 97)
$Checkbox2 = GUICtrlCreateCheckbox("Use Buff Food", 32, 336, 97, 17)
$Combo1 = GUICtrlCreateCombo("", 144, 336, 33, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "1|2|3|4|5|6|7|8|9|0", "0")
GUICtrlSetTip(-1, "Put your food on one of the hotkeys.")
$Label4 = GUICtrlCreateLabel("Hotkey:", 136, 312, 41, 17)
$Label5 = GUICtrlCreateLabel("Interval:", 216, 312, 42, 17)
$Input3 = GUICtrlCreateInput("30", 224, 336, 41, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_NUMBER))
GUICtrlSetLimit(-1, 3)
GUICtrlSetTip(-1, "Interval in minutes.")
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Button3 = GUICtrlCreateButton("Save", 304, 304, 75, 73)
$Tab_Info = GUICtrlCreateTabItem("Info")
$Credits = GUICtrlCreateEdit("", 32, 72, 337, 289, BitOR($ES_CENTER, $ES_READONLY))
GUICtrlSetData(-1, "Author: CrayonCode")
$Tab_Settings2 = GUICtrlCreateTabItem("Advanced")
$GRestock_Settings = GUICtrlCreateGroup("Restock Settings", 16, 40, 369, 233)
$CBSell = GUICtrlCreateCheckbox("Trade Fish", 32, 136, 113, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
$CBRepair = GUICtrlCreateCheckbox("Repair Inventory", 32, 160, 113, 17)
$CBBroker = GUICtrlCreateCheckbox("Auction Relics", 32, 184, 113, 17)
$CBBank = GUICtrlCreateCheckbox("Store Relics/Money", 32, 208, 113, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
$ISell = GUICtrlCreateInput("", 152, 136, 209, 21)
$IRepair = GUICtrlCreateInput("", 152, 160, 209, 21)
$IBroker = GUICtrlCreateInput("", 152, 184, 209, 21)
$IBank = GUICtrlCreateInput("", 152, 208, 209, 21)
$Input5 = GUICtrlCreateInput("Input5", 360, 88, 1, 21)
$RHorse = GUICtrlCreateRadio("Horse", 32, 88, 113, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
$RBoat = GUICtrlCreateRadio("Boat", 32, 104, 113, 17)
$LNPCName = GUICtrlCreateLabel("NPC Name (Leave empty for nearest):", 160, 112, 183, 17)
$LMount = GUICtrlCreateLabel("Walk back to mount:", 32, 72, 103, 17)
$BTestRestock = GUICtrlCreateButton("Test Restock", 132, 239, 115, 25)
$GRestock = GUICtrlCreateGroup("", 184, 56, 145, 41)
$CBRestock = GUICtrlCreateCheckbox("Enable Auto-Restock", 198, 70, 121, 17)
GUICtrlCreateGroup("", -99, -99, 1, 1)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$MiscSettings = GUICtrlCreateGroup("Misc Settings", 16, 280, 273, 113)
$CBWorker = GUICtrlCreateCheckbox("Enable Feed Worker", 32, 312, 121, 17)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$BSave = GUICtrlCreateButton("Save", 304, 307, 75, 73)
GUICtrlCreateTabItem("")
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

#Region - 1920x1080 Values for DetectState()
; Press 'Space' near a body of water to start fishing.
;~ 679, 57, 15000804, E4E4E4 ;P
;~ 1233, 59, 15000804, E4E4E4 ;g
;~ Local $R[5] = [679, 60, 1233, 64, 15000804] ; FishingStandby

; You are currently fishing. Please wait until you feel a bite.
;~ 642, 60, 15000804, E4E4E4 ; Y
;~ 1256, 64, 15000804, E4E4E4 ; t
;~ Local $C[5] = [642, 60, 1256, 64, 15000804] ; FishingCurrently

; You feel a bite. Press 'Space' bar to start.
;~ 733, 60, 15000804, E4E4E4
;~ 1179, 60, 15000804, E4E4E4
;~ Local $B[5] = [733, 60, 1179, 64, 15000804] ; FishingBite

; Press it at the right time
;~ 849, 368, 16777215, FFFFFF
;~ 1068, 372, 16777215, FFFFFF
;~ Local $P[5] = [849, 368, 1068, 372, 16777215]
#EndRegion - 1920x1080 Values for DetectState()

OnAutoItExitRegister(_ImageSearchShutdown)
Opt("MouseClickDownDelay", 100)
Opt("MouseClickDelay", 50)
Opt("SendKeyDelay", 50)
Global $Fish = False
Global $Bufftimer = TimerInit(), $FeedWorkertimer = TimerInit()
Global $Breaktimer


HotKeySet("{F9}", "_terminate")
HotKeySet("{F5}", "ClearInv")
HotKeySet("{F4}", "Fish")
HotKeySet("{F8}", "ResetSession")


Func _terminate()
	Exit (0)
EndFunc   ;==>_terminate

Func CoSe($key, $raw = 0)
	$hwnd = WinActive("BLACK DESERT -")
	If $hwnd = 0 Then $hwnd = WinActivate("BLACK DESERT -")

	If MouseGetPos(0) < 0 Or MouseGetPos(0) > 1920 Or MouseGetPos(1) < 0 Or MouseGetPos(1) > 1080 Then MouseMove(100, 100, 0)

	ControlSend($hwnd, "", "", $key, $raw)
EndFunc   ;==>CoSe

Func DetectState(ByRef $C)
	Local $SSN = 1
	FFSnapShot($C[0], $C[1], $C[2], $C[3], $SSN)

	For $i = 0 To 3 Step 1
		$FF = FFGetPixel($C[0], $C[1] + $i, $SSN)
		$FF2 = FFGetPixel($C[2], $C[3] - $i, $SSN)
		If $FF <> $C[4] Or $FF2 <> $C[4] Then Return False
	Next
	Return True
EndFunc   ;==>DetectState

Func GetState()
	Local $R[5] = [679, 60, 1233, 64, 15000804] ; FishingStandby
	Local $C[5] = [642, 60, 1256, 64, 15000804] ; FishingCurrently
	Local $B[5] = [733, 60, 1179, 64, 15000804] ; FishingBite

	If DetectState($B) = True Then Return (30)
	If DetectState($C) = True Then Return (20)
	If DetectState($R) = True Then Return (10)
	Return False
EndFunc   ;==>GetState

Func ReelIn()
	Local Const $C[5] = [1030, 405, 1095, 424, 5933000] ; left, top, right, bottom, color
	Local $P[5] = [849, 368, 1068, 372, 16777215]
	Local $SSN = 1, $NS
	Local $RandomSettings = IniReadSection("config/data.ini", "RandomSettings")
	Local $RandomSleep = Random($RandomSettings[3][1], $RandomSettings[4][1], 1)

	SetGUIStatus("Reeling in. (" & Round($RandomSleep / 1000, 0) & "s)")
	Sleep($RandomSleep)

	CoSe("{SPACE}")

	For $i = 0 To 40 Step 1 ; Sleep to prevent scanning before the bar appears
		Sleep(100)
		If DetectState($P) = True Then ExitLoop
		If $i = 21 Then CoSe("{SPACE}")
	Next

	Local $timer = TimerInit()
	While TimerDiff($timer) / 1000 <= 5 And $Fish
		FFSnapShot($C[0], $C[1], $C[2], $C[3], $SSN)
		$NS = FFNearestSpot(1, 1, ($C[0] + $C[2]) / 2, ($C[1] + $C[3]) / 2, $C[4], 30, True, $C[0], $C[1], $C[2], $C[3], $SSN)
		If Not @error Then
			CoSe("{SPACE}")
			Return True
		EndIf
	WEnd
	Return False
EndFunc   ;==>ReelIn

Func FindRiddleAnchor()
	Local $timer = TimerInit()
	Local $C[2] = [-1, -1]
	While TimerDiff($timer) / 1000 <= 4 And $Fish
		If _ImageSearchArea("res/reference_timeline.bmp", 0, 690, 300, 1150, 580, $C[0], $C[1], 0, 0) = 1 Then
			Return ($C)
		EndIf
	WEnd
	Return ($C)
EndFunc   ;==>FindRiddleAnchor

Func Riddle($iAnchorX, $iAnchorY, $AnchorColor, $SSN)
	Local Const $WordsX[8] = [-2, +3, +3, -2, -2, -2, +3, +3] ; SSWWDDAA
	Local Const $WordsY[8] = [-3, -3, +2, +2, +3, -3, +2, -2] ; SSWWDDAA
	Local $ai[8], $iL = 4

	For $i = 0 To 7 Step 1
		If FFGetPixel($iAnchorX + $WordsX[$i], $iAnchorY + $WordsY[$i], $SSN) = $AnchorColor Then
			$ai[$i] = 1
		Else
			$ai[$i] = 0
		EndIf
	Next

	For $j = 3 To 0 Step -1
		If $ai[$j * 2] + $ai[$j * 2 + 1] = 2 Then $iL = $j
	Next

	Return ($iL)
EndFunc   ;==>Riddle

Func Riddler()
	Local Const $COffset[2] = [60, 55] ; relative position to Anchor (pointing to center of the arrow beneath each letter)
	Local Const $L[5] = ["s", "w", "d", "a", "."] ; basic minigame letters ("." for unidentified)
	Local Const $Spacing = 35 ; Space between each Letter
	Local $SSN = 1
	Local $Word[10], $LetterColor, $Riddle, $Wordlength = 0
	Local $RandomSettings = IniReadSection("config/data.ini", "RandomSettings")

	Local $C = FindRiddleAnchor()
	If $C[0] = -1 Or $C[1] = -1 Then Return False
	FFSnapShot($C[0] - 90, $C[1] - 90, $C[0] + $Spacing * 10 + 90, $C[1], $SSN)
	$LetterColor = FFGetPixel($C[0] - 90 + $COffset[0], $C[1] - 90 + $COffset[1], $SSN)
	Local $AnchorC[2] = [$C[0] - 90 + $COffset[0], $C[1] - 90 + $COffset[1]]

	For $i = 0 To 9 Step 1
		$Riddle = Riddle($AnchorC[0] + $Spacing * $i, $AnchorC[1], $LetterColor, $SSN)
		If $Riddle = 4 Then ; If unidentified exit loop
			$Word[$i] = $L[$Riddle]
			ExitLoop
		Else
			$Word[$i] = $L[$Riddle]
			$Wordlength += 1
		EndIf
	Next

	If $Wordlength < 2 Then
		Return (False)
	Else
		For $i = 0 To 9 Step 1
			If $Word[$i] <> "." Then
				Sleep(Random($RandomSettings[1][1], $RandomSettings[2][1], 1))
				CoSe($Word[$i])
			EndIf
			Sleep(100)
		Next
		Return (True)
	EndIf
EndFunc   ;==>Riddler

Func DocLoot(ByRef $Loot)

	Local $TotalStats = IniReadSection("config/data.ini", "TotalStats")
	Local $SessionStats = IniReadSection("config/data.ini", "SessionStats")

	For $i = 0 To UBound($Loot) - 1 Step 1
		Switch $Loot[$i][0]
			Case -1 ; Empty
			Case 0 ; White
				$TotalStats[1][1] += 1
				$SessionStats[1][1] += 1
			Case 1 ; Green
				$TotalStats[2][1] += 1
				$SessionStats[2][1] += 1
			Case 2 ; Blue
				$TotalStats[3][1] += 1
				$SessionStats[3][1] += 1
			Case 3 ; Gold
				$TotalStats[4][1] += 1
				$SessionStats[4][1] += 1
		EndSwitch

		Switch $Loot[$i][1]
			Case 1 ; Silverkey
				$TotalStats[5][1] += 1
				$SessionStats[5][1] += 1
			Case 2 ; AncientRelic
				$TotalStats[6][1] += 1
				$SessionStats[6][1] += 1
			Case 3 ; Coelacanth
				$TotalStats[7][1] += 1
				$SessionStats[7][1] += 1
		EndSwitch

		If $Loot[$i][2] > 0 Then ; Event items
			$TotalStats[8][1] += 1
			$SessionStats[8][1] += 1
		EndIf
	Next
	IniWriteSection("config/data.ini", "TotalStats", $TotalStats)
	IniWriteSection("config/data.ini", "SessionStats", $SessionStats)

	GUICtrlSetData($ListView1_0, $SessionStats[1][0] & "|" & $SessionStats[1][1] & "|" & $TotalStats[1][1], "")
	GUICtrlSetData($ListView1_1, $SessionStats[2][0] & "|" & $SessionStats[2][1] & "|" & $TotalStats[2][1], "")
	GUICtrlSetData($ListView1_2, $SessionStats[3][0] & "|" & $SessionStats[3][1] & "|" & $TotalStats[3][1], "")
	GUICtrlSetData($ListView1_3, $SessionStats[4][0] & "|" & $SessionStats[4][1] & "|" & $TotalStats[4][1], "")
	GUICtrlSetData($ListView1_4, $SessionStats[5][0] & "|" & $SessionStats[5][1] & "|" & $TotalStats[5][1], "")
	GUICtrlSetData($ListView1_5, $SessionStats[6][0] & "|" & $SessionStats[6][1] & "|" & $TotalStats[6][1], "")
	GUICtrlSetData($ListView1_6, $SessionStats[7][0] & "|" & $SessionStats[7][1] & "|" & $TotalStats[7][1], "")
EndFunc   ;==>DocLoot

Func DetectLoot()
	Local Const $Rarity[4] = ["", 4486950, 3966379, 10651464] ; Green, Blue, Gold
	Local Const $SpecialLootIdentifier[4] = ["", "res/loot_silverkey.bmp", "res/loot_ancientrelic.bmp", "res/loot_coelacanth.bmp"]
	Local Const $EventIdentifier = _FileListToArray("res/event/", "*", 0)
	Local Const $LW[5] = [1538, 594, 1540, 638, 46] ; left, top, right, bottom, offset
	Local $Loot[4][3] = [[0, 0, 0], [0, 0, 0], [0, 0, 0], [0, 0, 0]]
	Local $FF, $x, $y, $SSN = 1
	Local $FFmean[3]

	For $j = 0 To 3 Step 1
		For $i = 1 To UBound($Rarity) - 1 Step 1
			$FF = FFColorCount($Rarity[$i], 20, True, $LW[0] + $LW[4] * $j, $LW[1], $LW[2] + $LW[4] * $j, $LW[3], $SSN)
			If $FF > 10 Then
				$Loot[$j][0] = $i
			EndIf
		Next
		If $Loot[$j][0] = 0 Then
			$IS = _ImageSearchArea("res/reference_empty.bmp", 0, $LW[0] + $LW[4] * $j, $LW[1], $LW[2] + 44 + $LW[4] * $j, $LW[3], $x, $y, 20, 0)
			If $IS Then $Loot[$j][0] = -1
		EndIf
		For $i = 1 To UBound($SpecialLootIdentifier) - 1 Step 1
			If _ImageSearchArea($SpecialLootIdentifier[$i], 0, $LW[0] + $LW[4] * $j, $LW[1], $LW[2] + 44 + $LW[4] * $j, $LW[3], $x, $y, 20, 0) = 1 Then
				$Loot[$j][1] = $i
			EndIf
		Next
		For $i = 1 To UBound($EventIdentifier) - 1 Step 1
			If _ImageSearchArea("res/event/" & $EventIdentifier[$i], 0, $LW[0] + $LW[4] * $j, $LW[1], $LW[2] + 44 + $LW[4] * $j, $LW[3], $x, $y, 25, 0) = 1 Then
				$Loot[$j][2] = $i
			EndIf
		Next
	Next


	Local $CWLoot = @CRLF & "Loot:"

	For $j = 0 To Ubound($Loot, 1) - 1 Step 1
		$CWLoot &= "["
		For $i = 0 To Ubound($Loot, 2) - 1 Step 1
			$CWLoot &= $Loot[$j][$i]
		Next
		$CWLoot &= "]"
	Next
	ConsoleWrite($CWLoot)

	Return $Loot
EndFunc   ;==>DetectLoot

Func HandleLoot()
	Local $Loot = DetectLoot()
	Local $Pick[4] = [0, 0, 0, 0]
	Local Const $LW[5] = [1538, 594, 1540, 638, 46] ; left, top, right, bottom, offset
	Local $LootSettings = IniReadSection("config/data.ini", "LootSettings")
	Local $PickedLoot = Int(IniRead("config/data.ini", "CurrentStats", "PickedLoot", 0))

	DocLoot($Loot)
	For $j = 0 To 3 Step 1
		If $Loot[$j][0] >= Int($LootSettings[1][1]) Then $Pick[$j] += 1 ; Rarity
		Switch $Loot[$j][1]
			Case 1 ; Silverkey
				If Int($LootSettings[2][1]) Then $Pick[$j] += 10
			Case 2 ; Ancient Relic
				If Int($LootSettings[3][1]) Then $Pick[$j] += 1
			Case 3 ; Coelacanth
				If Int($LootSettings[4][1]) Then $Pick[$j] += 1
		EndSwitch
		If $Loot[$j][2] > 0 And Int($LootSettings[5][1]) Then $Pick[$j] += 10 ; Event items
	Next

	CoSe("{LCTRL}")
	Sleep(50)

	ConsoleWrite($Pick[0] & $Pick[1] & $Pick[2] & $Pick[3])
	For $j = 3 To 0 Step -1
		If $Pick[$j] > 0 Then
			If $Pick[$j] < 10 Then $PickedLoot += 1
			MouseMove($LW[0] + 20 + $LW[4] * $j, $LW[1] + 20)
			Sleep(50)
			MouseClick("right", $LW[0] + 20 + $LW[4] * $j, $LW[1] + 20, 1)
			Sleep(50)
		EndIf
	Next
	CoSe("{LCTRL}")
	SetGUIInventory($PickedLoot)

	Return $PickedLoot
EndFunc   ;==>HandleLoot

Func SetGUIStatus($data)
	GUICtrlSetData($Edit1, $data, "")
EndFunc   ;==>SetGUIStatus

Func SetGUIInventory($PickedLoot, $overwritefreeslots = 0)
	Local $InventorySettings[3] = [Int(IniRead("config/data.ini", "InventorySettings", "FreeSlots", 16)), Int(IniRead("config/data.ini", "InventorySettings", "ReservedSlots", 8)), Int(IniRead("config/data.ini", "InventorySettings", "DiscardRods", 0))]

	If $overwritefreeslots > 0 Then
		GUICtrlSetData($Edit2, $PickedLoot & " / " & $overwritefreeslots - $InventorySettings[1] & " (" & $InventorySettings[0]& " - " &$InventorySettings[1] & ")", "")
	Else
		GUICtrlSetData($Edit2, $PickedLoot & " / " & $InventorySettings[0] - $InventorySettings[1] & " (" & $InventorySettings[0]& " - " &$InventorySettings[1] & ")", "")
	EndIf
	IniWrite("config/data.ini", "CurrentStats", "PickedLoot", $PickedLoot)
	Return ($PickedLoot)
EndFunc   ;==>SetGUIInventory

Func ResetSession()
	Local $SessionStats = IniReadSection("config/data.ini", "SessionStats")
	For $i = 1 To UBound($SessionStats) - 1 Step 1
		$SessionStats[$i][1] = 0
	Next
	IniWriteSection("config/data.ini", "SessionStats", $SessionStats)
	SetGUIInventory(0)
	InitGUI()
EndFunc   ;==>ResetSession

Func ClearInv()
	SetGUIInventory(0)
EndFunc   ;==>ClearInv

Func CBT($data) ; Transforms Checkbox values for ini
	Switch $data
		Case 1
			Return 1
		Case 4
			Return 0
		Case 0
			Return 4
	EndSwitch
EndFunc   ;==>CBT

Func InitGUI()

	; Loot Settings
	Local $LootSettings = IniReadSection("config/data.ini", "LootSettings")
	Switch $LootSettings[1][1]
		Case 0
			GUICtrlSetData($CRarity, "|Gold|Blue|Green|White|Specials Only", "White")
		Case 1
			GUICtrlSetData($CRarity, "|Gold|Blue|Green|White|Specials Only", "Green")
		Case 2
			GUICtrlSetData($CRarity, "|Gold|Blue|Green|White|Specials Only", "Blue")
		Case 3
			GUICtrlSetData($CRarity, "|Gold|Blue|Green|White|Specials Only", "Gold")
		Case 4
			GUICtrlSetData($CRarity, "|Gold|Blue|Green|White|Specials Only", "Specials Only")
	EndSwitch
	GUICtrlSetState($CBSpecial1, CBT($LootSettings[2][1]))
	GUICtrlSetState($CBSpecial2, CBT($LootSettings[3][1]))
	GUICtrlSetState($CBSpecial3, CBT($LootSettings[4][1]))

	; Inventory Settings
	Local $InventorySettings = IniReadSection("config/data.ini", "InventorySettings")
	GUICtrlSetData($Input1, $InventorySettings[1][1])
	GUICtrlSetData($Input2, $InventorySettings[2][1])
	GUICtrlSetState($Checkbox1, CBT($InventorySettings[3][1]))

	; Food Settings
	Local $FoodSettings = IniReadSection("config/data.ini", "FoodSettings")
	GUICtrlSetState($Checkbox2, CBT($FoodSettings[1][1]))
	GUICtrlSetData($Combo1, $FoodSettings[2][1])
	GUICtrlSetData($Input3, $FoodSettings[3][1])

	; Stats
	Local $SessionStats = IniReadSection("config/data.ini", "SessionStats")
	Local $TotalStats = IniReadSection("config/data.ini", "TotalStats")
	GUICtrlSetData($ListView1_0, $SessionStats[1][0] & "|" & $SessionStats[1][1] & "|" & $TotalStats[1][1], "")
	GUICtrlSetData($ListView1_1, $SessionStats[2][0] & "|" & $SessionStats[2][1] & "|" & $TotalStats[2][1], "")
	GUICtrlSetData($ListView1_2, $SessionStats[3][0] & "|" & $SessionStats[3][1] & "|" & $TotalStats[3][1], "")
	GUICtrlSetData($ListView1_3, $SessionStats[4][0] & "|" & $SessionStats[4][1] & "|" & $TotalStats[4][1], "")
	GUICtrlSetData($ListView1_4, $SessionStats[5][0] & "|" & $SessionStats[5][1] & "|" & $TotalStats[5][1], "")
	GUICtrlSetData($ListView1_5, $SessionStats[6][0] & "|" & $SessionStats[6][1] & "|" & $TotalStats[6][1], "")
	GUICtrlSetData($ListView1_6, $SessionStats[7][0] & "|" & $SessionStats[7][1] & "|" & $TotalStats[7][1], "")

	; Inventory Status
	Local $CurrentStats = IniReadSection("config/data.ini", "CurrentStats")
;~ 	GUICtrlSetData($Edit2, $CurrentStats[1][1] & " / " & $InventorySettings[1][1] + $InventorySettings[2][1] & " (" & $InventorySettings[2][1] & ")", "")
	GUICtrlSetData($Edit2, $CurrentStats[1][1] & " / " & $InventorySettings[1][1] - $InventorySettings[2][1] & " (" & $InventorySettings[1][1]& " - " &$InventorySettings[2][1] & ")", "")
	GUICtrlSetData($Edit1, "Please equip a fishing rod. Then start.", "")

	; Credits
	Local $data = "" & @CRLF & @CRLF
	$data &= "This project is specifically made for the english Black Desert EU/NA client." & @CRLF & @CRLF
	$data &= "Requirements are 1920x1080 Windowed Fullscreen and the default font." & @CRLF & @CRLF
	$data &= "" & @CRLF & @CRLF
	$data &= ""
	GUICtrlSetData($Credits, $data)

	; Restock Settings
	Local $RestockSettings = IniReadSection("config/data.ini", "RestockSettings")
	GUICtrlSetState($CBRestock, CBT($RestockSettings[1][1])) ; Enable Auto-Restock
	If $RestockSettings[2][1] = 0 Then ; Select Horse or Boat
		GUICtrlSetState($RHorse, 1)
	Else
		GUICtrlSetState($RBoat, 1)
	EndIf
	GUICtrlSetState($CBSell, CBT($RestockSettings[3][1])) ; Trade Fish
	GUICtrlSetData($ISell, $RestockSettings[4][1])
	GUICtrlSetState($CBRepair, CBT($RestockSettings[5][1])) ; Repair Inventory
	GUICtrlSetData($IRepair, $RestockSettings[6][1])
	GUICtrlSetState($CBBroker, CBT($RestockSettings[7][1])) ; Auction Relics
	GUICtrlSetData($IBroker, $RestockSettings[8][1])
	GUICtrlSetState($CBBank, CBT($RestockSettings[9][1])) ; Store Relics/Money
	GUICtrlSetData($IBank, $RestockSettings[10][1])

	; WorkerSettings
	Local $WorkerSettings = IniReadSection("config/data.ini", "WorkerSettings")
	GUICtrlSetState($CBWorker, CBT($WorkerSettings[1][1]))
EndFunc   ;==>InitGUI

Func StoreGUI()

	; Loot Settings
	Local $LootSettings = IniReadSection("config/data.ini", "LootSettings")
	Switch GUICtrlRead($CRarity)
		Case "White"
			$LootSettings[1][1] = 0
		Case "Green"
			$LootSettings[1][1] = 1
		Case "Blue"
			$LootSettings[1][1] = 2
		Case "Gold"
			$LootSettings[1][1] = 3
		Case "Specials Only"
			$LootSettings[1][1] = 4
	EndSwitch
	$LootSettings[2][1] = CBT(GUICtrlRead($CBSpecial1))
	$LootSettings[3][1] = CBT(GUICtrlRead($CBSpecial2))
	$LootSettings[4][1] = CBT(GUICtrlRead($CBSpecial3))
	IniWriteSection("config/data.ini", "LootSettings", $LootSettings)

	; Inventory Settings
	Local $InventorySettings = IniReadSection("config/data.ini", "InventorySettings")
	$InventorySettings[1][1] = Int(GUICtrlRead($Input1))
	$InventorySettings[2][1] = Int(GUICtrlRead($Input2))
	$InventorySettings[3][1] = CBT(GUICtrlRead($Checkbox1)) ; Discard Rods
	IniWriteSection("config/data.ini", "InventorySettings", $InventorySettings)

	; Food Settings
	Local $FoodSettings = IniReadSection("config/data.ini", "FoodSettings")
	$FoodSettings[1][1] = CBT(GUICtrlRead($Checkbox2))
	$FoodSettings[2][1] = GUICtrlRead($Combo1)
	$FoodSettings[3][1] = GUICtrlRead($Input3)
	IniWriteSection("config/data.ini", "FoodSettings", $FoodSettings)

	; Restock Settings
	Local $RestockSettings = IniReadSection("config/data.ini", "RestockSettings")
	$RestockSettings[1][1] = CBT(GUICtrlRead($CBRestock))
	If GUICtrlRead($RHorse) = 1 Then
		$RestockSettings[2][1] = 0
	Else
		$RestockSettings[2][1] = 1
	EndIf
	$RestockSettings[3][1] = CBT(GUICtrlRead($CBSell))
	$RestockSettings[4][1] = GUICtrlRead($ISell)
	$RestockSettings[5][1] = CBT(GUICtrlRead($CBRepair))
	$RestockSettings[6][1] = GUICtrlRead($IRepair)
	$RestockSettings[7][1] = CBT(GUICtrlRead($CBBroker))
	$RestockSettings[8][1] = GUICtrlRead($IBroker)
	$RestockSettings[9][1] = CBT(GUICtrlRead($CBBank))
	$RestockSettings[10][1] = GUICtrlRead($IBank)
	IniWriteSection("config/data.ini", "RestockSettings", $RestockSettings)

	; Worker Settings
	Local $WorkerSettings = IniReadSection("config/data.ini", "WorkerSettings")
	$WorkerSettings[1][1] = CBT(GUICtrlRead($CBWorker))
	IniWriteSection("config/data.ini", "WorkerSettings", $WorkerSettings)

	InitGUI()
EndFunc   ;==>StoreGUI

Func Fish()
	$Fish = Not $Fish
	If $Fish = False Then
		SetGUIStatus("Pausing.")
	Else
		SetGUIStatus("Starting.")
	EndIf
EndFunc   ;==>Fish

Func GUILoopSwitch()
	Switch GUIGetMsg()
		Case $GUI_EVENT_CLOSE
			Exit
		Case $Button3 ;Save
			StoreGUI()
		Case $Button2
			ResetSession()
		Case $Button1
			Fish()
		Case $ButtonClear
			ClearInv()
		Case $BSave
			StoreGUI()
		Case $BTestRestock
			Restock()
	EndSwitch
EndFunc   ;==>GUILoopSwitch

Func OCInventory($open = True)
	Local Const $InventoryRegion = [1095, 226, 1919, 855]
	Local $SRx, $SRy, $IS = False
	Local $timer = TimerInit()
	While Not $IS And $Fish
		Sleep(250)
		$IS = _ImageSearchArea("res/reference_inventory.bmp", 0, $InventoryRegion[0], $InventoryRegion[1], $InventoryRegion[2], $InventoryRegion[3], $SRx, $SRy, 10, 0)
		Sleep(250)
		If $IS = True Then
			If $open = True Then
				Return (True)
			ElseIf $open = False Then
				CoSe("i")
				Sleep(500)
			EndIf
		ElseIf $IS = False Then
			If $open = True Then
				CoSe("i")
				Sleep(500)
			ElseIf $open = True Then
				Return (True)
			EndIf
		EndIf
		If TimerDiff($timer) / 1000 >= 3 Then Return False
	WEnd
EndFunc   ;==>OCInventory

Func InspectFishingrod()
	Local Const $WeaponRegion = [1200, 584, 1250, 628]

	Local $SRx, $SRy, $IS = False

	OCInventory(True)
	If MouseGetPos(0) >= $WeaponRegion[0] And MouseGetPos(0) <= $WeaponRegion[2] And MouseGetPos(1) >= $WeaponRegion[1] And MouseGetPos(1) <= $WeaponRegion[3] Then MouseMove(10, 10) ; Keep mouse out of detection range
	$IS = _ImageSearchArea("res/rod_empty.bmp", 0, $WeaponRegion[0], $WeaponRegion[1], $WeaponRegion[2], $WeaponRegion[3], $SRx, $SRy, 50, 0)
	If $IS = True Then
		Return True
	ElseIf $IS = False Then
		OCInventory(False)
		Return False
	EndIf
EndFunc   ;==>InspectFishingrod

Func SwapFishingrod($discard = False)
	Local Const $InvS[3] = [1528, 350, 48] ; X,Y,OFFSET
	Local $SRx, $SRy, $IS = False
	Local $Fishingrods[5] = ["res/rod_default.bmp", "res/rod_balenos.bmp", "res/rod_calpheon.bmp", "res/rod_epheria.bmp", "res/rod_mediah.bmp"]

	OCInventory(False)
	OCInventory(True)

	For $L = 0 To 2 Step 1
		If MouseGetPos(0) >= $InvS[0] And MouseGetPos(0) <= $InvS[0] + 500 And MouseGetPos(1) >= $InvS[1] And MouseGetPos(1) <= $InvS[1] + 500 Then MouseMove($InvS[0] - 50, $InvS[1]) ; Keep mouse out of detection range
		For $j = 0 To 7 Step 1
			For $i = 0 To 7 Step 1
				For $k = 0 To UBound($Fishingrods) - 1 Step 1
					$IS = _ImageSearchArea($Fishingrods[$k], 0, $InvS[0] - 30 + $i * $InvS[2], $InvS[1] - 30 + $j * $InvS[2], $InvS[0] + 30 + $i * $InvS[2], $InvS[1] + 30 + $j * $InvS[2], $SRx, $SRy, 10, 0)
					If $IS = True Then
						MouseMove($InvS[0] + $i * $InvS[2], $InvS[1] + $j * $InvS[2])
						Sleep(50)
						MouseClick("right", $InvS[0] + $i * $InvS[2], $InvS[1] + $j * $InvS[2])
						If $discard = True Then DiscardEmptyRod()
						OCInventory(False)
						Return True
					EndIf
				Next
			Next
		Next
		If $L < 2 Then
			MouseMove($InvS[0], $InvS[1])
			Sleep(50)
			MouseWheel("down", 8)
		EndIf
		Sleep(150)
	Next
	If $discard = True Then DiscardEmptyRod()
	OCInventory(False)
	Return False
EndFunc   ;==>SwapFishingrod

Func DiscardEmptyRod()
	Local Const $InvS[3] = [1528, 350, 48] ; X,Y,OFFSET
	Local Const $TrashCan[2] = [1862, 780] ; X,Y
	Local $SRx, $SRy, $IS = False
	OCInventory(True)
	If MouseGetPos(0) >= $InvS[0] And MouseGetPos(0) <= $InvS[0] + 500 And MouseGetPos(1) >= $InvS[1] And MouseGetPos(1) <= $InvS[1] + 500 Then MouseMove(10, 10) ; Keep mouse out of detection range
	For $j = 0 To 7 Step 1
		For $i = 0 To 7 Step 1
			$IS = _ImageSearchArea("res/rod_default_discard.bmp", 0, $InvS[0] - 20 + $i * $InvS[2], $InvS[1] - 20 + $j * $InvS[2], $InvS[0] + 20 + $i * $InvS[2], $InvS[1] + 20 + $j * $InvS[2], $SRx, $SRy, 20, 0)
			If $IS = True Then
				MouseMove($InvS[0] + $i * $InvS[2], $InvS[1] + $j * $InvS[2])
				Sleep(150)
				MouseClickDrag("left", $InvS[0] + $i * $InvS[2], $InvS[1] + $j * $InvS[2], $InvS[0] + $i * $InvS[2] + 30, $InvS[1] + $j * $InvS[2], 500)
				MouseMove($TrashCan[0], $TrashCan[1])
				MouseClick("left", $TrashCan[0], $TrashCan[1])
				Sleep(350)
				CoSe("{SPACE}")
				Sleep(200)
				OCInventory(False)
				Return True
			EndIf
		Next
	Next
	OCInventory(False)
	Return False
EndFunc   ;==>DiscardEmptyRod

Func Cast()
	Local $C[5] = [642, 60, 1256, 64, 15000804] ; FishingCurrently
	If Buff($Bufftimer) = True Then $Bufftimer = TimerInit()
	If FeedWorker($FeedWorkertimer) = True Then $FeedWorkertimer = TimerInit()

	Sleep(1000)
	CoSe("{SPACE}")

	$timer = TimerInit()
	While DetectState($C) = False And $Fish
		Sleep(500)
		If TimerDiff($timer) / 1000 >= 12 Then Return False
	WEnd
	Return True
EndFunc   ;==>Cast

Func CheckClientResolution()
	Local $CCR = WinGetClientSize("BLACK DESERT -")
	If @error Then
		Return False
	ElseIf $CCR[0] = 1920 And $CCR[1] = 1080 Then
		Return True
	EndIf
	Return False
EndFunc   ;==>CheckClientResolution

Func UnequipRod()
	Local Const $WeaponRegion = [1200, 584, 1250, 628]
	Local $SRx, $SRy, $IS = False
	OCInventory(True)
	MouseClick("right", 1225, 600)
	OCInventory(False)
	Return True
EndFunc   ;==>UnequipRod

Func TrackNPC($npcname)
	Local Const $NPCSearchIcon[2] = [1556, 30]
	Local Const $Selected = 8960468
	Local Const $NPCs[4] = ["res/npc_bank.bmp", "res/npc_repair.bmp", "res/npc_trade.bmp", "res/npc_broker.bmp"]
	Local Const $Offset[2] = [515, 345]
	Local $FF, $x, $y, $IS, $counter = 3, $SSN = 1

	While $Fish
		UnequipRod()
		CoSe("{LCTRL}")
		Sleep(250)
		MouseClick("left", $NPCSearchIcon[0], $NPCSearchIcon[1])
		Sleep(250)

		$IS = _ImageSearchArea($NPCs[1], 1, 1175, 50, 1600, 676, $x, $y, 50, 0)
		If $IS = True Then
			MouseMove($x, $y + $Offset[0])
			MouseClick("left")
			Sleep(250)
			Send($npcname) ; Send instead of CoSe because of trouble with > key
			CoSe("{ENTER}")
			For $i = 0 To 2 Step 1
				Sleep(100)
				MouseClick("left", $x, $y + $Offset[1])
				Sleep(250)
				$FF = FFColorCount($Selected, 30, True, $x - 40, $y + $Offset[1] - 10, $x + 80, $y + $Offset[1] + 10, $SSN) ; Check if the text is highlighted
				If $FF > 3 Then
					CoSe("t")
					CoSe("{ESC}")
					CoSe("{LCTRL}")
					Sleep(50)
					Return True
				EndIf
			Next
			Return False
		Else
			$counter -= 1
			If $counter <= 0 Then Return False
		EndIf
	WEnd
EndFunc   ;==>TrackNPC

Func NearbyNPC($npc_type) ; 0 = bank, 1 = repair, 2 = trader, 3 = broker
	Local Const $NPCSearchIcon[2] = [1556, 30]
	Local Const $Selected = 15983484
	Local Const $NPCs[4] = ["res/npc_bank.bmp", "res/npc_repair.bmp", "res/npc_trade.bmp", "res/npc_broker.bmp"]
	Local $FF, $x, $y, $IS, $counter = 3, $SSN = 1

	While $Fish
		UnequipRod()
		CoSe("{LCTRL}")
		Sleep(250)
		MouseClick("left", $NPCSearchIcon[0], $NPCSearchIcon[1])
		Sleep(250)

		$IS = _ImageSearchArea($NPCs[$npc_type], 1, 1175, 50, 1600, 676, $x, $y, 50, 0)
		If $IS = True Then
			For $i = 0 To 2 Step 1
				MouseMove($x, $y)
				Sleep(50)
				MouseClick("left", $x, $y)
				Sleep(50)
				$FF = FFColorCount($Selected, 30, True, $x + 10, $y - 10, $x + 80, $y + 10, $SSN) ; Check if the text is yellow
				If $FF > 3 Then
					CoSe("t")
					Sleep(50)
					ExitLoop
				EndIf
			Next

			CoSe("{ESC}")
			CoSe("{LCTRL}")
			Return True
		Else
			$counter -= 1
			If $counter <= 0 Then Return False
		EndIf
	WEnd
EndFunc   ;==>NearbyNPC

Func MapMovement()
	Local Const $MapRegion = [1815, 48, 1830, 50]
	Local $FF[6][2]
	Local $dif = 0, $SSN = 1
	Local $timer = TimerInit()

	SetGUIStatus("Autopathing...")
	While TimerDiff($timer) / 1000 <= 180 And $Fish
		Sleep(250)
		FFSnapShot($MapRegion[0], $MapRegion[1], $MapRegion[2], $MapRegion[3], $SSN)
		For $i = 0 To UBound($FF) - 1 Step 1
			$FF[$i][0] = FFGetPixel($MapRegion[0] + 2 * $i, $MapRegion[1], $SSN)
		Next
		Sleep(500)
		FFSnapShot($MapRegion[0], $MapRegion[1], $MapRegion[2], $MapRegion[3], $SSN)
		For $i = 0 To UBound($FF) - 1 Step 1
			$FF[$i][1] = FFGetPixel($MapRegion[0] + 2 * $i, $MapRegion[1], $SSN)
			If $FF[$i][0] = $FF[$i][1] Then $dif += 1
		Next
		If $dif >= 3 Then
			Return True
		Else
			$dif = 0
			Sleep(4000)
			MouseMove(MouseGetPos(0) + 10, MouseGetPos(1)) ; Stop Screensaver
			MouseMove(MouseGetPos(0) - 10, MouseGetPos(1))
			Sleep(1000)
		EndIf
	WEnd
	ConsoleWrite("MapMovement failed.")
	Return False
EndFunc   ;==>MapMovement

Func NPCType($type, $npcname) ; bank, repair, trade, broker
	Local Const $ButtonRegion = [431, 822, 1522, 906]
	Local Const $NPCs[4][2] = [["res/npc_bank.bmp", "res/npc_bank_button.bmp"], ["res/npc_repair.bmp", "res/npc_repair_button.bmp"], ["res/npc_trade.bmp", "res/npc_trade_button.bmp"], ["res/npc_broker.bmp", "res/npc_broker_button.bmp"]]
	Local $IS, $x, $y, $SSN = 1, $counter = 10

	If $npcname <> "" Then
		TrackNPC($npcname)
	Else
		NearbyNPC($type)
	EndIf

	MapMovement()
	While $counter >= 0
		CoSe("r") ; Talk to NPC
		Sleep(750)
		$IS = _ImageSearchArea($NPCs[$type][1], 1, $ButtonRegion[0], $ButtonRegion[1], $ButtonRegion[2], $ButtonRegion[3], $x, $y, 20, 0)
		If $IS = True Then ; Check for correct dialogue
			MouseClick("left", $x, $y, 2)
			Sleep(500)
			Return True
		Else
			; Close dialog and slowly pan camera to the right in case multiple npcs are overlapping
			CoSe("{ESC}")
			Sleep(500)
			MouseMove(MouseGetPos(0) + 500, MouseGetPos(1), 50)
		EndIf
		$counter -= 1
		If $counter <= 0 Then Return False
	WEnd
EndFunc   ;==>NPCType

Func BankRelics($npcname = "")
	Local Const $Relic = "res/loot_ancientrelic.bmp"
	Local Const $InvS[3] = [1528, 350, 48] ; X,Y,OFFSET
	Local Const $Money[2] = [1534, 795]
	Local $IS, $x, $y

	If NPCType(0, $npcname) = True Then
		SetGUIStatus("Storing Relics & Money.")
		For $k = 0 To 2 Step 1
			If MouseGetPos(0) >= $InvS[0] And MouseGetPos(0) <= $InvS[0] + 500 And MouseGetPos(1) >= $InvS[1] And MouseGetPos(1) <= $InvS[1] + 500 Then MouseMove($InvS[0] - 50, $InvS[1]) ; Keep mouse out of detection range
			For $i = 0 To 7 Step 1
				For $j = 0 To 7 Step 1
					$IS = _ImageSearchArea($Relic, 0, $InvS[0] - 30 + $i * $InvS[2], $InvS[1] - 30 + $j * $InvS[2], $InvS[0] + 30 + $i * $InvS[2], $InvS[1] + 30 + $j * $InvS[2], $x, $y, 20, 0)
					If $IS = True Then MouseClick("right", $x, $y, 2)
				Next
			Next
			If $k < 2 Then
				MouseMove($InvS[0], $InvS[1])
				Sleep(50)
				MouseWheel("down", 8)
			EndIf
			Sleep(150)
		Next
		MouseClick("left", $Money[0], $Money[1], 2)
		Sleep(150)
		CoSe("f")
		CoSe("{SPACE}")
		Sleep(250)
		CoSe("{ESC}")
		CoSe("{ESC}")
		Return True
	Else
		Return False
		; TODO ERROR HANDLING
	EndIf
EndFunc   ;==>BankRelics

Func RepairInv($npcname = "")
	Local Const $RepairInven[3] = [1151, 1036, 10569571]

	If NPCType(1, $npcname) = True Then
		SetGUIStatus("Repairing.")
		MouseClick("left", $RepairInven[0], $RepairInven[1], 2)
		Sleep(250)
		CoSe("{SPACE}")
		Sleep(250)
		CoSe("{ESC}")
		CoSe("{ESC}")
		Return True
	Else
		Return False
		; TODO ERROR HANDLING
	EndIf
EndFunc   ;==>RepairInv

Func BrokerRelics($npcname = "")
	Local Const $MyListingsButton[3] = [819, 1039, 460812]
	Local Const $RegisterItemButton[2] = [1314, 304]
	Local Const $ConfirmButton[2] = [1212, 399]
	Local $InvS[3] = [1528, 350, 48] ; X,Y,OFFSET
	Local Const $Relic = "res/broker_ancientrelic.bmp"
	Local $IS, $x, $y

	If NPCType(3, $npcname) = True Then
		SetGUIStatus("Auctioning Relics.")
		MouseClick("left", $MyListingsButton[0], $MyListingsButton[1], 2)
		Sleep(500)
		MouseClick("left", $RegisterItemButton[0], $RegisterItemButton[1], 2)
		Sleep(500)
		For $k = 0 To 2 Step 1
			If MouseGetPos(0) >= $InvS[0] And MouseGetPos(0) <= $InvS[0] + 500 And MouseGetPos(1) >= $InvS[1] And MouseGetPos(1) <= $InvS[1] + 500 Then MouseMove($InvS[0] - 50, $InvS[1]) ; Keep mouse out of detection range
			For $i = 0 To 7 Step 1
				For $j = 0 To 7 Step 1
					$IS = _ImageSearchArea($Relic, 0, $InvS[0] - 30 + $i * $InvS[2], $InvS[1] - 30 + $j * $InvS[2], $InvS[0] + 30 + $i * $InvS[2], $InvS[1] + 30 + $j * $InvS[2], $x, $y, 20, 0)
					If $IS = True Then
						MouseClick("right", $x, $y, 2)
						Sleep(250)
						MouseClick("left", $ConfirmButton[0], $ConfirmButton[1], 2)
						Sleep(250)
						CoSe("{SPACE}")
						CoSe("{SPACE}")
					EndIf
				Next
			Next
			If $k < 2 Then
				MouseMove($InvS[0], $InvS[1])
				Sleep(50)
				MouseWheel("down", 8)
			EndIf
			Sleep(150)
		Next
		CoSe("{ESC}")
		CoSe("{ESC}")
		CoSe("{ESC}")
		Return True
	Else
		Return False
		; TODO ERROR HANDLING
	EndIf
EndFunc   ;==>BrokerRelics

Func SellFish($npcname = "")
	Local Const $SellAllButton[2] = [1782, 753]

	If NPCType(2, $npcname) = True Then
		SetGUIStatus("Selling Fish.")
		MouseClick("left", $SellAllButton[0], $SellAllButton[1])
		Sleep(500)
		CoSe("{SPACE}")
		Sleep(500)
		CoSe("{ESC}")
		CoSe("{ESC}")
		Sleep(500)
		Return True
	Else
		Return False
		; TODO ERROR HANDLING
	EndIf
EndFunc   ;==>SellFish

Func BackToMount($Boat = 0) ; TODO find reliable way to detect if path is selected
	Local Const $Mount[2][2] = [[39, 128], [98, 122]]
	Sleep(500)
	NearbyNPC(2)
	CoSe("{LCTRL}")
	Sleep(50)
	MouseMove($Mount[$Boat][0], $Mount[$Boat][1])
	Sleep(250)
	MouseClick("right", $Mount[$Boat][0], $Mount[$Boat][1])
	Sleep(250)
	MouseClick("right", $Mount[$Boat][0], $Mount[$Boat][1])
	Sleep(500)
	CoSe("t")
	CoSe("{ESC}")
	CoSe("{LCTRL}")
	MapMovement()
	Return True
EndFunc   ;==>BackToMount

Func Restock()
	Local $RestockSettings = IniReadSection("config/data.ini", "RestockSettings")

	If $RestockSettings[1][1] = 0 Then Return False
	SetGUIStatus("Restocking...")
	WinActivate("BLACK DESERT - ")
	Sleep(500)
	$Fish = True


	If $RestockSettings[5][1] = 1 Then
		SetGUIStatus("Repairing.")
		RepairInv($RestockSettings[6][1])
	EndIf ;Repair first
	
	If $RestockSettings[3][1] = 1 Then
		SetGUIStatus("Selling Fish.")
		If SellFish($RestockSettings[4][1]) = True Then SetGUIInventory(0)
	EndIf

	If $RestockSettings[7][1] = 1 Then
		SetGUIStatus("Auctioning Relics.")
		BrokerRelics($RestockSettings[6][1])
	EndIf
	If $RestockSettings[9][1] = 1 Then
		SetGUIStatus("Storing Relics & Money.")
		If BankRelics($RestockSettings[6][1]) = True Then SetGUIInventory(0)
	EndIf
	SetGUIStatus("Autopathing to mount.")
	BackToMount($RestockSettings[2][1])
	SetGUIStatus("Autopath to mount complete.")
	Return True
EndFunc   ;==>Restock

Func Buff($timer)
	Local $FoodSettings = IniReadSection("config/data.ini", "FoodSettings")
	If $FoodSettings[1][1] = 1 And TimerDiff($timer) / 1000 / 60 > Int($FoodSettings[3][1]) Then
		CoSe($FoodSettings[2][1])
		Return True
	EndIf
	Return False
EndFunc   ;==>Buff

Func FeedWorker($timer)
	Local Const $FeedWorker[5][2] = [ _
			[192, 84], _ ; Worker Icon
			[1489, 830], _ ; Recover All
			[1224, 363], _ ; Select food
			[1274, 489], _ ; Confirm
			[1580, 832]] ; Repeat All

	Local $WorkerSettings = IniReadSection("config/data.ini", "WorkerSettings")
	If $WorkerSettings[1][1] = 1 And TimerDiff($timer) / 1000 / 60 > Int($WorkerSettings[2][1]) Then
		OCInventory(True)
		For $i = 0 To UBound($FeedWorker) - 1 Step 1
			Sleep(250)
			MouseClick("left", $FeedWorker[$i][0], $FeedWorker[$i][1])
			Sleep(250)
		Next
		CoSe("{ESC}")
		Return True
	EndIf
	Return False
EndFunc   ;==>FeedWorker

Func ObfuscateTitle($length = 5)
	Local $newtitle = ""
	If $length > 0 Then
		For $i = 1 To $length
			Switch Random(1, 3, 1)
				Case 1
					$newtitle &= Chr(Random(65, 90, 1)) ; small letter
				Case 2
					$newtitle &= Chr(Random(97, 122, 1)) ; big letter
				Case 3
					$newtitle &= Random(0, 9, 1) ; number
			EndSwitch
		Next
	EndIf
	$newtitle &= @HOUR & @MIN & @SEC
	WinSetTitle("QQ", "", $newtitle)
	Return True
EndFunc   ;==>ObfuscateTitle

Func DryFish()
	Local $DryingSettings = IniReadSection("config/data.ini", "DryingSettings")
	If Not Int($DryingSettings[1][1]) Then Return 0
	Local Const $weather[3] = [1636, 10, "res/weather_clear.bmp"]
	Local Const $InvS[3] = [1528, 350, 48] ; X,Y,OFFSET
	Local Const $processing[2] = ["res/reference_highlight.bmp", "res/processing_check.bmp"]
	Local Const $Rarity[4] = ["", 7184194, 6596799, 13742692] ; Green, Blue, Gold
	Local Const $DryFish[5][2] = [ _
			[843, 683], _ ; Dry Fish
			[919, 453], _ ; Start
			[851, 421]] ; Process all identical

	Local $IS, $x, $y, $FF, $SSN = 1
	Local $timer = TimerInit()

	SetGUIStatus("Drying fish")

	$IS = _ImageSearchArea($weather[2], 1, $weather[0] - 8, $weather[1] - 8, $weather[0] + 8, $weather[1] + 8, $x, $y, 50, 0)
	If $IS = True Then
		UnequipRod()
		CoSe("d")
		CoSe("a")
		CoSe("l")
		Sleep(250)
		MouseClick("left", $DryFish[0][0], $DryFish[0][1])
		Sleep(500)
		For $L = 0 To 2 Step 1
			If MouseGetPos(0) >= $InvS[0] And MouseGetPos(0) <= $InvS[0] + 500 And MouseGetPos(1) >= $InvS[1] And MouseGetPos(1) <= $InvS[1] + 500 Then MouseMove($InvS[0] - 50, $InvS[1]) ; Keep mouse out of detection range
			For $j = 0 To 7 Step 1
				For $i = 0 To 7 Step 1
					$IS = _ImageSearchArea($processing[0], 0, $InvS[0] - 24 + $i * $InvS[2], $InvS[1] - 24 + $j * $InvS[2], $InvS[0] + 24 + $i * $InvS[2], $InvS[1] + 24 + $j * $InvS[2], $x, $y, 55, 0)
					If $IS = True Then
						ConsoleWrite(@CRLF & "found a fish to dry ")
						For $k = $DryingSettings[2][1] To UBound($Rarity) - 1 Step 1
							$FF = FFColorCount($Rarity[$k], 20, True, $InvS[0] - 20 + $i * $InvS[2], $InvS[1] - 15 + $j * $InvS[2], $InvS[0] - 19 + $i * $InvS[2], $InvS[1] + 15 + $j * $InvS[2], $SSN)
							If $FF > 10 Then
								If $k > Int($DryingSettings[2][1]) Then
									ConsoleWrite("DID NOT DRY BECAUSE" & $k & " > " & $DryingSettings[2][1])
									ExitLoop(2)
								EndIf
							EndIf
						Next
						Sleep(250)
						MouseClick("right", $InvS[0] + $i * $InvS[2], $InvS[1] + $j * $InvS[2], 2)
						Sleep(250)
						MouseClick("left", $DryFish[2][0] + 50, $DryFish[2][1])
						Sleep(100)
						$IS = _ImageSearchArea($processing[1], 0, $DryFish[2][0] - 10, $DryFish[2][1] - 10, $DryFish[2][0] + 10, $DryFish[2][1] + 10, $x, $y, 50, 0) ; Process all identical items?
						MouseClick("left", $DryFish[1][0], $DryFish[1][1])
						Sleep(100)
						If $IS = True Then CoSe("{SPACE}")
						Sleep(100)
						ProductionActivityCheck()
						Return 1
					EndIf
				Next
			Next
			If $L < 2 Then
				MouseMove($InvS[0], $InvS[1])
				Sleep(50)
				MouseWheel("down", 8)
			EndIf
			Sleep(150)
		Next
		Return 2
	Else
		SetGUIStatus("Wrong Weather")
		ConsoleWrite("WRONG WEATHER")
		Return 0
	EndIf
EndFunc   ;==>DryFish

Func ProductionActivityCheck()
	Local Const $processing = "res/processing_activity.bmp"
	Local $IS, $x, $y
	Sleep(500)
	While True
		CoSe("l") ; reopen incase of interupt
		Sleep(500)
		$IS = _ImageSearchArea($processing, 1, 0, 0, 1920, 1080, $x, $y, 50, 0)
		If $IS = True Then Return True
		Sleep(1500)
	WEnd
	Return False
EndFunc   ;==>ProductionActivityCheck

Func DetectFreeInventory()
	Local Const $InvS[3] = [1528, 350, 48] ; X,Y,OFFSET
	Local $Free, $IS, $x, $y
	SetGUIStatus("Detecting free inventory space")
	OCInventory(False)
	OCInventory(True)
	For $L = 0 To 2 Step 1
		If MouseGetPos(0) >= $InvS[0] And MouseGetPos(0) <= $InvS[0] + 500 And MouseGetPos(1) >= $InvS[1] And MouseGetPos(1) <= $InvS[1] + 500 Then MouseMove($InvS[0] - 50, $InvS[1]) ; Keep mouse out of detection range
		For $j = 0 To 7 Step 1
			For $i = 0 To 7 Step 1
				$IS = _ImageSearchArea("res/reference_empty.bmp", 0, $InvS[0] - 24 + $i * $InvS[2], $InvS[1] - 24 + $j * $InvS[2], $InvS[0] + 24 + $i * $InvS[2], $InvS[1] + 24 + $j * $InvS[2], $x, $y, 20, 0)
				If $IS Then
					$Free += 1
				EndIf
			Next
		Next
		If $L < 2 Then
			MouseMove($InvS[0], $InvS[1])
			Sleep(50)
			MouseWheel("down", 8)
		EndIf
		Sleep(150)
	Next
	OCInventory(False)
	SetGUIStatus($Free & " empty slots")
	Return($Free)
EndFunc

Func Main()
	ObfuscateTitle()
	Local $InventorySettings[3] = [Int(IniRead("config/data.ini", "InventorySettings", "FreeSlots", 16)), Int(IniRead("config/data.ini", "InventorySettings", "ReservedSlots", 8)), Int(IniRead("config/data.ini", "InventorySettings", "DiscardRods", 0))]
	$DryingSettings = IniReadSection("config/data.ini", "DryingSettings")
	Global $PickedLoot = Int(IniRead("config/data.ini", "CurrentStats", "PickedLoot", 0))
	Global $SwappedRods = 0
	Local $fishingtimer = 0, $dryingtimeout = 0
	Local $freedetectedslots = 0
	Local $Reserved = False
	Local $CorrectRes = False
	Local $ScreenSaver = TimerInit()
	$Fish = False
	InitGUI()

	While True
		GUILoopSwitch()
		While $Fish
			If $CorrectRes = False Then $CorrectRes = CheckClientResolution()
			If $CorrectRes = False Then
				SetGUIStatus("E: must be 1920x1080 Windowed Fullscreen")
				$Fish = False
				ExitLoop
			EndIf
			GUILoopSwitch()
			Switch GetState()
				Case 30 ; You feel a bite. Press 'Space' bar to start.
					$Breaktimer = 0
					SetGUIStatus("Reeling in.")
					If ReelIn() = True Then
						SetGUIStatus("Solving riddle.")
						Riddler()

						SetGUIStatus("Evaluating loot.")
						Sleep(3000)

						$PickedLoot = HandleLoot()

						$InventorySettings[0] = Int(IniRead("config/data.ini", "InventorySettings", "FreeSlots", 16))
						If $freedetectedslots > 0 Then $InventorySettings[0] = $freedetectedslots
						$InventorySettings[1] = Int(IniRead("config/data.ini", "InventorySettings", "ReservedSlots", 8))
						$InventorySettings[2] = Int(IniRead("config/data.ini", "InventorySettings", "DiscardRods", 0))
						SetGUIInventory($PickedLoot, $freedetectedslots)
						If $InventorySettings[0] - $InventorySettings[1] - $PickedLoot <= 0 Then
							If $InventorySettings[1] > 0 Then
								$Reserved = True
								$DryingSettings = IniReadSection("config/data.ini", "DryingSettings")
								If Int($DryingSettings[1][1]) And TimerDiff($dryingtimeout)/1000/60 > 10 Then
									For $i = 0 To 6
										Switch DryFish()
											Case 0 ; Wrong weather
												$dryingtimeout = TimerInit()
												ExitLoop
											Case 1 ; Completed one cycle
												$dryingtimeout = TimerInit()
											Case 2 ; No fish meets requirements
												$freedetectedslots = DetectFreeInventory()
												$dryingtimeout = TimerInit()
												SetGUIInventory($PickedLoot, $freedetectedslots)
												ExitLoop
										EndSwitch
									Next
								EndIf
							EndIf
							If $InventorySettings[0] + $InventorySettings[1] - $PickedLoot <= 0 Then
								SetGUIStatus("Inventory full. Stopping.")
								$Fish = False
								If IniRead("config/data.ini", "RestockSettings", "EnableRestock", 0) Then Restock() ; EXPERIMENTAL
								ExitLoop
							EndIf
						EndIf
					EndIf
				Case 20 ; You are currently fishing. Please wait until you feel a bite.
					If TimerDiff($ScreenSaver) / 1000 / 60 >= 2 Then ; To fix ScreenSaver messing up
						MouseMove(MouseGetPos(0) + 10, MouseGetPos(1))
						MouseMove(MouseGetPos(0) - 10, MouseGetPos(1))
						$ScreenSaver = TimerInit()
					EndIf
					$Breaktimer = 0
					If $fishingtimer <> 0 Then
						SetGUIStatus("Currently fishing. (" & Round(TimerDiff($fishingtimer) / 1000, 0) & "s)")
					Else
						SetGUIStatus("Currently fishing.")
					EndIf
				Case 10 ; Press 'Space' near a body of water to start fishing.
					$Breaktimer = 0
					SetGUIStatus("Ready for fishing.")
					If Cast() = False Then
						SetGUIStatus("Cast failed. Inspecting equipped fishingrod.")
						If InspectFishingrod() = True Then
							SetGUIStatus("Swapping fishingrods.")
							If SwapFishingrod($InventorySettings[2]) = True Then
								$SwappedRods += 1
							Else
								SetGUIStatus("No fishingrods found. Stopping.")
								$Fish = False
								If IniRead("config/data.ini", "RestockSettings", "EnableRestock", 0) Then Restock() ; EXPERIMENTAL
								ExitLoop
							EndIf
						EndIf
					EndIf
					$fishingtimer = TimerInit()
				Case Else
					SetGUIStatus("Unidentified state.")
					If $Breaktimer = 0 Then
						$Breaktimer = TimerInit()
					ElseIf TimerDiff($Breaktimer) / 1000 > 10 Then
						SetGUIStatus("Unidentified state. Trying to equip fishingrod.")
						If SwapFishingrod() = False Then
							SetGUIStatus("Detection Error. UI Scale must be at 100%")
							$Fish = False
							ExitLoop
						Else
							Sleep(3000)
						EndIf
					EndIf
			EndSwitch
			Sleep(100)
			If $Fish = False Then
				SetGUIStatus("Fishing stopped.")
				$fishingtimer = 0
			EndIf
		WEnd

	WEnd
EndFunc   ;==>Main


Main()




