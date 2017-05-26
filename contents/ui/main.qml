/*
 * Copyright (C) 2016 by David Baum <david.baum@naraesk.eu>
 *
 * This file is part of plasma-yamaha.
 *
 * plasma-yamaha is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * plasma-codeship is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with plasma-codeship.  If not, see <http://www.gnu.org/licenses/>.
 */

import QtQuick 2.5
import QtQuick.Layouts 1.3
import QtQuick.Controls 1.4
import QtQuick.Dialogs 1.2
import QtQuick.Controls.Styles 1.2
import "functions.js" as Logic

Item {
    id: root
    property string ip: plasmoid.configuration.ip
    property string title: plasmoid.configuration.title
    property string input1_name: plasmoid.configuration.input1_name
    property string input1_type: plasmoid.configuration.input1_type
    property string input1_type2: plasmoid.configuration.input1_type2
    property string input2_name: plasmoid.configuration.input2_name
    property string input2_type: plasmoid.configuration.input2_type
    property string input2_type2: plasmoid.configuration.input2_type2

    // Scene 1
    property string s1_title: plasmoid.configuration.s1_title
    property string s1_fl_vol: plasmoid.configuration.s1_fl_vol
    property string s1_fl_dist: plasmoid.configuration.s1_fl_dist
    property string s1_fl_size: plasmoid.configuration.s1_fl_size
    property string s1_fr_vol: plasmoid.configuration.s1_fr_vol
    property string s1_fr_dist: plasmoid.configuration.s1_fr_dist
    property string s1_fr_size: plasmoid.configuration.s1_fr_size
    property string s1_center_vol: plasmoid.configuration.s1_center_vol
    property string s1_center_dist: plasmoid.configuration.s1_center_dist
    property string s1_center_size: plasmoid.configuration.s1_center_size
    property string s1_sl_vol: plasmoid.configuration.s1_sl_vol
    property string s1_sl_dist: plasmoid.configuration.s1_sl_dist
    property string s1_sl_size: plasmoid.configuration.s1_sl_size
    property string s1_sr_vol: plasmoid.configuration.s1_sr_vol
    property string s1_sr_dist: plasmoid.configuration.s1_sr_dist
    property string s1_sr_size: plasmoid.configuration.s1_sr_size
    property string s1_sbl_vol: plasmoid.configuration.s1_sbl_vol
    property string s1_sbl_dist: plasmoid.configuration.s1_sbl_dist
    property string s1_sbl_size: plasmoid.configuration.s1_sbl_size
    property string s1_sbr_vol: plasmoid.configuration.s1_sbr_vol
    property string s1_sbr_dist: plasmoid.configuration.s1_sbr_dist
    property string s1_sbr_size: plasmoid.configuration.s1_sbr_size
    property string s1_fpl_vol: plasmoid.configuration.s1_fpl_vol
    property string s1_fpl_dist: plasmoid.configuration.s1_fpl_dist
    property string s1_fpl_size: plasmoid.configuration.s1_fpl_size
    property string s1_fpr_vol: plasmoid.configuration.s1_fpr_vol
    property string s1_fpr_dist: plasmoid.configuration.s1_fpr_dist
    property string s1_fpr_size: plasmoid.configuration.s1_fpr_size
    property string s1_rpl_vol: plasmoid.configuration.s1_rpl_vol
    property string s1_rpl_dist: plasmoid.configuration.s1_rpl_dist
    property string s1_rpl_size: plasmoid.configuration.s1_rpl_size
    property string s1_rpr_vol: plasmoid.configuration.s1_rpr_vol
    property string s1_rpr_dist: plasmoid.configuration.s1_rpr_dist
    property string s1_rpr_size: plasmoid.configuration.s1_rpr_size
    property string s1_subwoofer_vol: plasmoid.configuration.s1_subwoofer_vol
    property string s1_subwoofer_dist: plasmoid.configuration.s1_subwoofer_dist
    property string s1_subwoofer_size: plasmoid.configuration.s1_subwoofer_size
    property string s1_subwoofer2_vol: plasmoid.configuration.s1_subwoofer2_vol
    property string s1_subwoofer2_dist: plasmoid.configuration.s1_subwoofer2_dist
    property string s1_subwoofer2_size: plasmoid.configuration.s1_subwoofer2_size

    // Scene 2
    property string s2_title: plasmoid.configuration.s2_title
    property string s2_fl_vol: plasmoid.configuration.s2_fl_vol
    property string s2_fl_dist: plasmoid.configuration.s2_fl_dist
    property string s2_fl_size: plasmoid.configuration.s2_fl_size
    property string s2_fr_vol: plasmoid.configuration.s2_fr_vol
    property string s2_fr_dist: plasmoid.configuration.s2_fr_dist
    property string s2_fr_size: plasmoid.configuration.s2_fr_size
    property string s2_center_vol: plasmoid.configuration.s2_center_vol
    property string s2_center_dist: plasmoid.configuration.s2_center_dist
    property string s2_center_size: plasmoid.configuration.s2_center_size
    property string s2_sl_vol: plasmoid.configuration.s2_sl_vol
    property string s2_sl_dist: plasmoid.configuration.s2_sl_dist
    property string s2_sl_size: plasmoid.configuration.s2_sl_size
    property string s2_sr_vol: plasmoid.configuration.s2_sr_vol
    property string s2_sr_dist: plasmoid.configuration.s2_sr_dist
    property string s2_sr_size: plasmoid.configuration.s2_sr_size
    property string s2_sbl_vol: plasmoid.configuration.s2_sbl_vol
    property string s2_sbl_dist: plasmoid.configuration.s2_sbl_dist
    property string s2_sbl_size: plasmoid.configuration.s2_sbl_size
    property string s2_sbr_vol: plasmoid.configuration.s2_sbr_vol
    property string s2_sbr_dist: plasmoid.configuration.s2_sbr_dist
    property string s2_sbr_size: plasmoid.configuration.s2_sbr_size
    property string s2_fpl_vol: plasmoid.configuration.s2_fpl_vol
    property string s2_fpl_dist: plasmoid.configuration.s2_fpl_dist
    property string s2_fpl_size: plasmoid.configuration.s2_fpl_size
    property string s2_fpr_vol: plasmoid.configuration.s2_fpr_vol
    property string s2_fpr_dist: plasmoid.configuration.s2_fpr_dist
    property string s2_fpr_size: plasmoid.configuration.s2_fpr_size
    property string s2_rpl_vol: plasmoid.configuration.s2_rpl_vol
    property string s2_rpl_dist: plasmoid.configuration.s2_rpl_dist
    property string s2_rpl_size: plasmoid.configuration.s2_rpl_size
    property string s2_rpr_vol: plasmoid.configuration.s2_rpr_vol
    property string s2_rpr_dist: plasmoid.configuration.s2_rpr_dist
    property string s2_rpr_size: plasmoid.configuration.s2_rpr_size
    property string s2_subwoofer_vol: plasmoid.configuration.s2_subwoofer_vol
    property string s2_subwoofer_dist: plasmoid.configuration.s2_subwoofer_dist
    property string s2_subwoofer_size: plasmoid.configuration.s2_subwoofer_size
    property string s2_subwoofer2_vol: plasmoid.configuration.s2_subwoofer2_vol
    property string s2_subwoofer2_dist: plasmoid.configuration.s2_subwoofer2_dist
    property string s2_subwoofer2_size: plasmoid.configuration.s2_subwoofer2_size

    Connections {
        target: plasmoid.configuration
    }

    Component.onCompleted: {
        musicButton.checked = true
        sync()
    }

    Timer {
        id: timer
        interval: 5 * 60 * 1000 // 5 minutes
        running: true
        repeat: true
        onTriggered: {
            sync()
        }
    }
    
    Timer {
        id: timer2
        interval: 10 * 1000
        running: false
        repeat: false
        onTriggered: {
            sync()
        }
    }
    
    GridLayout {
        anchors.rightMargin: 8
        anchors.bottomMargin: 8
        anchors.leftMargin: 12
        anchors.topMargin: 22
        columns: 2
        anchors.fill: parent
        anchors.top: heading.bottom

        Label {
            text: qsTr("Power")
            Layout.alignment: Qt.AlignRight
        }

        Switch {
            id: powerSwitch
            checked: true

            onClicked: {
                var status
                if (checked) {
                    var powerRequest = Logic.request('<YAMAHA_AV cmd="PUT"><Main_Zone><Power_Control><Power>On</Power></Power_Control></Main_Zone></YAMAHA_AV>', ip)
                    timer2.start()
//                 }
//                     powerRequest.onreadystatechange = function() {
//                         if (powerRequest.readyState == 4) {
//                             sync()
//                         }
//                     }
                } else {
                    Logic.request('<YAMAHA_AV cmd="PUT"><Main_Zone><Power_Control><Power>Standby</Power></Power_Control></Main_Zone></YAMAHA_AV>', ip)
                }
            }
        }

        Label {
            text: qsTr("Mute")
            Layout.alignment: Qt.AlignRight
        }

        Switch {
            id: muteSwitch
            checked: false

            onClicked: {
                var status
                if (checked) {
                    status = "On"
                } else {
                    status = "Off"
                }
                Logic.request('<YAMAHA_AV cmd="PUT"><Main_Zone><Volume><Mute>'
                        + status
                        + '</Mute></Volume></Main_Zone></YAMAHA_AV>', ip)

            }
        }

        Label {
            text: qsTr("Scene")
            Layout.alignment: Qt.AlignRight
        }

        RowLayout{
            id: row
            ExclusiveGroup { id: zoneGroup }
            RadioButton {
                id: musicButton
                text: s1_title
                exclusiveGroup: zoneGroup
                onClicked: {

                    if (checked) {
                        var commandDist = '<YAMAHA_AV cmd="PUT"><System><Speaker_Preout><Pattern_1><Distance><Meter>'
                        var commandVol = '<YAMAHA_AV cmd="PUT"><System><Speaker_Preout><Pattern_1><Lvl>'
                        if (s1_fl_size !== "0") {
                           commandDist += '<Front_L><Val>' + s1_fl_dist * 100 + '</Val><Exp>2</Exp><Unit>m</Unit></Front_L>'
                                    + '<Front_R><Val>' + s1_fr_dist * 100+ '</Val><Exp>2</Exp><Unit>m</Unit></Front_R>'

                            commandVol += '<Front_L><Val>' + s1_fl_vol * 10+ '</Val><Exp>1</Exp><Unit>dB</Unit></Front_L>'
                                       + '<Front_R><Val>' + s1_fr_vol * 10+ '</Val><Exp>1</Exp><Unit>dB</Unit></Front_R>'
                        }

                        if (s1_center_size !== "0") {
                            commandDist += '<Center><Val>' + s1_center_dist * 100+ '</Val><Exp>2</Exp><Unit>m</Unit></Center>'
                            commandVol += '<Center><Val>' + s1_center_vol * 10+ '</Val><Exp>1</Exp><Unit>dB</Unit></Center>'
                        }

                        if (s1_sl_size !== "0") {
                            commandDist += '<Sur_L><Val>' + s1_sl_dist * 100+ '</Val><Exp>2</Exp><Unit>m</Unit></Sur_L>'
                                        + '<Sur_R><Val>' + s1_sr_dist * 100+ '</Val><Exp>2</Exp><Unit>m</Unit></Sur_R>'
                            commandVol += '<Sur_L><Val>' + s1_sl_vol * 10 + '</Val><Exp>1</Exp><Unit>dB</Unit></Sur_L>'
                                        + '<Sur_R><Val>' + s1_sr_vol * 10+ '</Val><Exp>1</Exp><Unit>dB</Unit></Sur_R>'
                       }

                        if (s1_sbl_size !== "0") {
                            commandDist += '<Sur_Back_L><Val>' + s1_sbl_dist * 100+ '</Val><Exp>2</Exp><Unit>m</Unit></Sur_Back_L>'
                                        + '<Sur_Back_R><Val>' + s1_sbr_dist * 100+ '</Val><Exp>2</Exp><Unit>m</Unit></Sur_Back_R>'
                            commandVol += '<Sur_Back_L><Val>' + s1_sbl_vol * 10 + '</Val<Exp>1</Exp><Unit>dB</Unit></Sur_Back_L>'
                                        + '<Sur_Back_R><Val>' + s1_sbr_vol * 10 + '</Val<Exp>1</Exp><Unit>dB</Unit></Sur_Back_R>'
                        }

                        if (s1_fpl_size !== "0") {
                            commandDist += '<Front_Presence_L><Val>' + s1_fpl_dist * 100+ '</Val><Exp>2</Exp><Unit>m</Unit></Front_Presence_L>'
                                        + '<Front_Presence_R><Val>' + s1_fpr_dist * 100+ '</Val><Exp>2</Exp><Unit>m</Unit></Front_Presence_R>'
                            commandVol += '<Front_Presence_L><Val>' + s1_fpl_vol * 10 + '</Val<Exp>1</Exp><Unit>dB</Unit></Front_Presence_L>'
                                        + '<Front_Presence_R><Val>' + s1_fpr_vol * 10 + '</Val<Exp>1</Exp><Unit>dB</Unit></Front_Presence_R>'
                        }

                        if (s1_rpl_size !== "0") {
                            commandDist += '<Rear_Presence_L><Val>' + s1_rpl_dist * 100+ '</Val><Exp>2</Exp><Unit>m</Unit></Rear_Presence_L>'
                                        + '<Rear_Presence_R><Val>' + s1_rpr_dist * 100+ '</Val><Exp>2</Exp><Unit>m</Unit></Rear_Presence_R>'
                            commandVol += '<Rear_Presence_L><Val>' + s1_rpl_vol * 10 + '</Val<Exp>1</Exp><Unit>dB</Unit></Rear_Presence_L>'
                                        + '<Rear_Presence_R><Val>' + s1_rpr_vol * 10 + '</Val<Exp>1</Exp><Unit>dB</Unit></Rear_Presence_R>'
                        }

                        if (s1_subwoofer_size !== "0") {
                            commandDist += '<Subwoofer_1><Val>' + s1_subwoofer_dist * 100+ '</Val><Exp>2</Exp><Unit>m</Unit></Subwoofer_1>'
                            commandVol += '<Subwoofer_1><Val>' + s1_subwoofer_vol * 10 + '</Val><Exp>1</Exp><Unit>dB</Unit></Subwoofer_1>'
                        }

                        if (s1_subwoofer2_size !== "0") {
                            commandDist += '<Subwoofer_2><Val>' + s1_subwoofer2_dist * 100+ '</Val><Exp>2</Exp><Unit>m</Unit></Subwoofer_2>'
                            commandVol += '<Subwoofer_2><Val>' + s1_subwoofer2_vol * 10 + '</Val><Exp>1</Exp><Unit>dB</Unit></Subwoofer_2>'
                        }

                        commandDist += '</Meter></Distance></Pattern_1></Speaker_Preout></System></YAMAHA_AV>'
                        commandVol += '</Lvl></Pattern_1></Speaker_Preout></System></YAMAHA_AV>'

                        Logic.request(commandDist, ip)
                        Logic.request(commandVol, ip)
                    }
                 }
            }

            RadioButton {
                id: movieButton
                text: s2_title
                exclusiveGroup: zoneGroup
                onClicked: {
                    if (checked) {
                        var commandDist = '<YAMAHA_AV cmd="PUT"><System><Speaker_Preout><Pattern_1><Distance><Meter>'
                        var commandVol = '<YAMAHA_AV cmd="PUT"><System><Speaker_Preout><Pattern_1><Lvl>'
                        if (s2_fl_size !== "0") {
                           commandDist += '<Front_L><Val>' + s2_fl_dist * 100 + '</Val><Exp>2</Exp><Unit>m</Unit></Front_L>'
                                    + '<Front_R><Val>' + s2_fr_dist * 100+ '</Val><Exp>2</Exp><Unit>m</Unit></Front_R>'

                            commandVol += '<Front_L><Val>' + s2_fl_vol * 10 + '</Val><Exp>1</Exp><Unit>dB</Unit></Front_L>'
                                       + '<Front_R><Val>' + s2_fr_vol * 10 + '</Val><Exp>1</Exp><Unit>dB</Unit></Front_R>'
                        }

                        if (s2_center_size !== "0") {
                            commandDist += '<Center><Val>' + s2_center_dist * 100 + '</Val><Exp>2</Exp><Unit>m</Unit></Center>'
                            commandVol += '<Center><Val>' + s2_center_vol * 10 + '</Val><Exp>1</Exp><Unit>dB</Unit></Center>'
                        }

                        if (s2_sl_size !== "0") {
                            commandDist += '<Sur_L><Val>' + s2_sl_dist * 100 + '</Val><Exp>2</Exp><Unit>m</Unit></Sur_L>'
                                        + '<Sur_R><Val>' + s2_sr_dist * 100 + '</Val><Exp>2</Exp><Unit>m</Unit></Sur_R>'
                            commandVol += '<Sur_L><Val>' + s2_sl_vol * 10 + '</Val><Exp>1</Exp><Unit>dB</Unit></Sur_L>'
                                        + '<Sur_R><Val>' + s2_sr_vol * 10 + '</Val><Exp>1</Exp><Unit>dB</Unit></Sur_R>'
                       }

                        if (s2_sbl_size !== "0") {
                            commandDist += '<Sur_Back_L><Val>' + s2_sbl_dist * 100 + '</Val><Exp>2</Exp><Unit>m</Unit></Sur_Back_L>'
                                        + '<Sur_Back_R><Val>' + s2_sbr_dist * 100+ '</Val><Exp>2</Exp><Unit>m</Unit></Sur_Back_R>'
                            commandVol += '<Sur_Back_L><Val>' + s2_sbl_vol * 10 + '</Val<Exp>1</Exp><Unit>dB</Unit></Sur_Back_L>'
                                        + '<Sur_Back_R><Val>' + s2_sbr_vol * 10 + '</Val<Exp>1</Exp><Unit>dB</Unit></Sur_Back_R>'
                        }

                        if (s2_fpl_size !== "0") {
                            commandDist += '<Front_Presence_L><Val>' + s2_fpl_dist * 100+ '</Val><Exp>2</Exp><Unit>m</Unit></Front_Presence_L>'
                                        + '<Front_Presence_R><Val>' + s2_fpr_dist * 100 + '</Val><Exp>2</Exp><Unit>m</Unit></Front_Presence_R>'
                            commandVol += '<Front_Presence_L><Val>' + s2_fpl_vol * 10 + '</Val<Exp>1</Exp><Unit>dB</Unit></Front_Presence_L>'
                                        + '<Front_Presence_R><Val>' + s2_fpr_vol * 10 + '</Val<Exp>1</Exp><Unit>dB</Unit></Front_Presence_R>'
                        }

                        if (s2_rpl_size !== "0") {
                            commandDist += '<Rear_Presence_L><Val>' + s2_rpl_dist * 100+ '</Val><Exp>2</Exp><Unit>m</Unit></Rear_Presence_L>'
                                        + '<Rear_Presence_R><Val>' + s2_rpr_dist * 100 + '</Val><Exp>2</Exp><Unit>m</Unit></Rear_Presence_R>'
                            commandVol += '<Rear_Presence_L><Val>' + s2_rpl_vol * 10 + '</Val<Exp>1</Exp><Unit>dB</Unit></Rear_Presence_L>'
                                        + '<Rear_Presence_R><Val>' + s2_rpr_vol * 10 + '</Val<Exp>1</Exp><Unit>dB</Unit></Rear_Presence_R>'
                        }

                        if (s2_subwoofer_size !== "0") {
                            commandDist += '<Subwoofer_1><Val>' + s2_subwoofer_dist * 100+ '</Val><Exp>2</Exp><Unit>m</Unit></Subwoofer_1>'
                            commandVol += '<Subwoofer_1><Val>' + s2_subwoofer_vol * 10 + '</Val><Exp>1</Exp><Unit>dB</Unit></Subwoofer_1>'
                        }

                        if (s2_subwoofer2_size !== "0") {
                            commandDist += '<Subwoofer_2><Val>' + s2_subwoofer2_dist * 100+ '</Val><Exp>2</Exp><Unit>m</Unit></Subwoofer_2>'
                            commandVol += '<Subwoofer_2><Val>' + s2_subwoofer2_vol * 10 + '</Val><Exp>1</Exp><Unit>dB</Unit></Subwoofer_2>'
                        }

                        commandDist += '</Meter></Distance></Pattern_1></Speaker_Preout></System></YAMAHA_AV>'
                        commandVol += '</Lvl></Pattern_1></Speaker_Preout></System></YAMAHA_AV>'
                        Logic.request(commandDist, ip)
                        Logic.request(commandVol, ip)
                    }
                }
            }
        }
        
        Label {
            text: qsTr("Input")
            Layout.alignment: Qt.AlignRight
        }

        RowLayout{
            id: rowInput
            ExclusiveGroup { id: inputGroup }
            RadioButton {
                id: laptopButton
                text: input1_name
                exclusiveGroup: inputGroup
                onClicked: {
                    if (checked) {
                        Logic.request('<YAMAHA_AV cmd="PUT"><Main_Zone><Input><Input_Sel>' + input1_type2 + '</Input_Sel></Input></Main_Zone></YAMAHA_AV>', ip)
                    }
                 }
            }

            RadioButton {
                id: ps4Button
                text: input2_name
                exclusiveGroup: inputGroup
                onClicked: {
                    if (checked) {
                        Logic.request('<YAMAHA_AV cmd="PUT"><Main_Zone><Input><Input_Sel>' + input2_type2 + '</Input_Sel></Input></Main_Zone></YAMAHA_AV>', ip)
                    }
                }
            }
        }

        Label {
            text: qsTr("Volume")
            Layout.alignment: Qt.AlignRight
        }

        Slider {
            id: volumeSlider
            Layout.fillWidth: true
            maximumValue: 165
            minimumValue: -805
            stepSize: 5

            onValueChanged: {
                Logic.request('<YAMAHA_AV cmd="PUT"><Main_Zone><Volume><Lvl><Val>'
                        + value
                        + '</Val><Exp>1</Exp><Unit>dB</Unit></Lvl></Volume></Main_Zone></YAMAHA_AV>', ip)
            }
        }
    }

    function sync() {
        var powerRequest = Logic.request('<YAMAHA_AV cmd="GET"><Main_Zone><Power_Control><Power>GetParam</Power></Power_Control></Main_Zone></YAMAHA_AV>', ip)
        powerRequest.onreadystatechange = function() {
            if (powerRequest.readyState === 4) {
                powerSwitch.checked = ( powerRequest.responseText == '<YAMAHA_AV rsp="GET" RC="0"><Main_Zone><Power_Control><Power>On</Power></Power_Control></Main_Zone></YAMAHA_AV>')
            }
        }

        var volumeRequest = Logic.request('<YAMAHA_AV cmd="GET"><Main_Zone><Volume><Lvl>GetParam</Lvl></Volume></Main_Zone></YAMAHA_AV>', ip)
        volumeRequest.onreadystatechange = function() {
            if (volumeRequest.readyState === 4) {
                volumeSlider.value = /<Val>(.+?)<\/Val>/.exec(volumeRequest.responseText)[1]
            }
        }

        var muteRequest = Logic.request('<YAMAHA_AV cmd="GET"><Main_Zone><Volume><Mute>GetParam</Mute></Volume></Main_Zone></YAMAHA_AV>', ip)
        muteRequest.onreadystatechange = function() {
            if (muteRequest.readyState === 4) {
                muteSwitch.checked = (muteRequest.responseText === '<YAMAHA_AV rsp="GET" RC="0"><Main_Zone><Volume><Mute>On</Mute></Volume></Main_Zone></YAMAHA_AV>')
            }
        }
        
        var inputRequest = Logic.request('<YAMAHA_AV cmd="GET"><Main_Zone><Input><Input_Sel>GetParam</Input_Sel></Input></Main_Zone></YAMAHA_AV>', ip)
        inputRequest.onreadystatechange = function() {
            if(inputRequest.readyState === 4) {
                if(inputRequest.responseText === '<YAMAHA_AV rsp="GET" RC="0"><Main_Zone><Input><Input_Sel>' + input1_type2 + '</Input_Sel></Input></Main_Zone></YAMAHA_AV>') {
                    laptopButton.checked = true
                } else {
                    ps4Button.checked = true
                }
            }
        }
    }

    Label {
        id: heading
        width: parent.width
        text: title
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        font.pointSize : 14
        horizontalAlignment: "AlignHCenter"
    }
}
