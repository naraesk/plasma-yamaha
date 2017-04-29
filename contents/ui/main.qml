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

Item {
    id: root
    property string ip: plasmoid.configuration.ip

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
                    var powerRequest = request('<YAMAHA_AV cmd="PUT"><Main_Zone><Power_Control><Power>On</Power></Power_Control></Main_Zone></YAMAHA_AV>')
                    timer2.start()
//                 }
//                     console.log("done")
//                     powerRequest.onreadystatechange = function() {
//                         console.log("naja")
//                         if (powerRequest.readyState == 4) {
//                             sync()
//                             console.log("fertig")
//                         }
//                     }
                } else {
                    request('<YAMAHA_AV cmd="PUT"><Main_Zone><Power_Control><Power>Standby</Power></Power_Control></Main_Zone></YAMAHA_AV>')
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
                request('<YAMAHA_AV cmd="PUT"><Main_Zone><Volume><Mute>'
                        + status
                        + '</Mute></Volume></Main_Zone></YAMAHA_AV>')

            }
        }

//        Label {
//            text: qsTr("Zone")
//            Layout.alignment: Qt.AlignRight
//        }

//        Switch {
//            id: zoneSwitch
//            checked: false

//            onClicked: {
//              // var status
//                if (checked) {
//                  var abc =  request('<YAMAHA_AV cmd="PUT"><System><Speaker_Preout><Pattern_1><Distance><Meter>'
//                            + '<Front_L><Val>100</Val><Exp>2</Exp><Unit>m</Unit></Front_L>'
//                            + '<Front_R><Val>100</Val><Exp>2</Exp><Unit>m</Unit></Front_R>'
//                            + '<Center><Val>100</Val><Exp>2</Exp><Unit>m</Unit></Center>'
//                            + '<Sur_L><Val>100</Val><Exp>2</Exp><Unit>m</Unit></Sur_L>'
//                            + '<Sur_R><Val>100</Val><Exp>2</Exp><Unit>m</Unit></Sur_R>'
//                            + '<Subwoofer_1><Val>100</Val><Exp>2</Exp><Unit>m</Unit></Subwoofer_1>'
//                            + '</Meter></Distance></Pattern_1></Speaker_Preout></System></YAMAHA_AV>')
//                    abc.onreadystatechange = function() {
//                        if (abc.readyState == 4) {
//                            //powerSwitch.checked = ( powerRequest.responseText == '<YAMAHA_AV rsp="GET" RC="0"><Main_Zone><Power_Control><Power>On</Power></Power_Control></Main_Zone></YAMAHA_AV>')
//                            console.log("yeah")
//                            console.log(abc.responseText)

//                           // <YAMAHA_AV rsp="GET" RC="0"><System><Speaker_Preout><Pattern_1><Distance>
//                           //        <Unit_of_Distance>Meter</Unit_of_Distance>
//                           //         <Meter>
//                           //         <Front_L><Val>205</Val><Exp>2</Exp><Unit>m</Unit></Front_L>
//                           //         <Front_R><Val>535</Val><Exp>2</Exp><Unit>m</Unit></Front_R>
//                           //         <Center><Val>215</Val><Exp>2</Exp><Unit>m</Unit></Center>
//                           //         <Sur_L><Val>260</Val><Exp>2</Exp><Unit>m</Unit></Sur_L>
//                           //         <Sur_R><Val>305</Val><Exp>2</Exp><Unit>m</Unit></Sur_R>
//                           //         <Subwoofer_1><Val>460</Val><Exp>2</Exp><Unit>m</Unit></Subwoofer_1>
//                           //         </Meter>
//                           //         <Feet><Front_L><Val>68</Val><Exp>1</Exp><Unit>ft</Unit></Front_L><Front_R><Val>176</Val><Exp>1</Exp><Unit>ft</Unit></Front_R><Center><Val>72</Val><Exp>1</Exp><Unit>ft</Unit></Center><Sur_L><Val>86</Val><Exp>1</Exp><Unit>ft</Unit></Sur_L><Sur_R><Val>100</Val><Exp>1</Exp><Unit>ft</Unit></Sur_R><Subwoofer_1><Val>152</Val><Exp>1</Exp><Unit>ft</Unit></Subwoofer_1></Feet></Distance></Pattern_1></Speaker_Preout></System></YAMAHA_AV>

//                        }
//                    }

//                } else {
//                    request('<YAMAHA_AV cmd="PUT"><System><Speaker_Preout><Pattern_1><Distance><Meter><Front_L><Val>'
//                            + 2400
//                            + '</Val></Front_L></Meter></Distance></Pattern_1></Speaker_Preout></System></YAMAHA_AV>')
//                }

//            }
//        }
        
        Label {
            text: qsTr("Scene")
            Layout.alignment: Qt.AlignRight
        }

        RowLayout{
            id: row
            ExclusiveGroup { id: zoneGroup }
            RadioButton {
                id: musicButton
                text: qsTr("Desk")
                exclusiveGroup: zoneGroup
                onClicked: {

                    if (checked) {
                        request('<YAMAHA_AV cmd="PUT"><System><Speaker_Preout><Pattern_1><Distance><Meter>'
                            + '<Front_L><Val>210</Val><Exp>2</Exp><Unit>m</Unit></Front_L>'
                            + '<Front_R><Val>515</Val><Exp>2</Exp><Unit>m</Unit></Front_R>'
                            + '<Center><Val>205</Val><Exp>2</Exp><Unit>m</Unit></Center>'
                            + '<Sur_L><Val>250</Val><Exp>2</Exp><Unit>m</Unit></Sur_L>'
                            + '<Sur_R><Val>275</Val><Exp>2</Exp><Unit>m</Unit></Sur_R>'
                            + '<Subwoofer_1><Val>250</Val><Exp>2</Exp><Unit>m</Unit></Subwoofer_1>'
                            + '</Meter></Distance></Pattern_1></Speaker_Preout></System></YAMAHA_AV>')

                         request('<YAMAHA_AV cmd="PUT"><System><Speaker_Preout><Pattern_1><Lvl>'
                            + '<Front_L><Val>0</Val><Exp>1</Exp><Unit>dB</Unit></Front_L>'
                            + '<Front_R><Val>25</Val><Exp>1</Exp><Unit>dB</Unit></Front_R>'
                            + '<Center><Val>5</Val><Exp>1</Exp><Unit>dB</Unit></Center>'
                            + '<Sur_L><Val>35</Val><Exp>1</Exp><Unit>dB</Unit></Sur_L>'
                            + '<Sur_R><Val>25</Val><Exp>1</Exp><Unit>dB</Unit></Sur_R>'
                            + '<Subwoofer_1><Val>-40</Val><Exp>1</Exp><Unit>dB</Unit></Subwoofer_1>'
                            + '</Lvl></Pattern_1></Speaker_Preout></System></YAMAHA_AV>')
                    }
                 }


            }

            RadioButton {
                id: movieButton
                text: qsTr("Sofa")
                exclusiveGroup: zoneGroup
                onClicked: {
                    if (checked) {
                        request('<YAMAHA_AV cmd="PUT"><System><Speaker_Preout><Pattern_1><Distance><Meter>'
                            + '<Front_L><Val>385</Val><Exp>2</Exp><Unit>m</Unit></Front_L>'
                            + '<Front_R><Val>465</Val><Exp>2</Exp><Unit>m</Unit></Front_R>'
                            + '<Center><Val>365</Val><Exp>2</Exp><Unit>m</Unit></Center>'
                            + '<Sur_L><Val>155</Val><Exp>2</Exp><Unit>m</Unit></Sur_L>'
                            + '<Sur_R><Val>150</Val><Exp>2</Exp><Unit>m</Unit></Sur_R>'
                            + '<Subwoofer_1><Val>370</Val><Exp>2</Exp><Unit>m</Unit></Subwoofer_1>'
                            + '</Meter></Distance></Pattern_1></Speaker_Preout></System></YAMAHA_AV>')

                        request('<YAMAHA_AV cmd="PUT"><System><Speaker_Preout><Pattern_1><Lvl>'
                                + '<Front_L><Val>0</Val><Exp>1</Exp><Unit>dB</Unit></Front_L>'
                                + '<Front_R><Val>5</Val><Exp>1</Exp><Unit>dB</Unit></Front_R>'
                                + '<Center><Val>-5</Val><Exp>1</Exp><Unit>dB</Unit></Center>'
                                + '<Sur_L><Val>5</Val><Exp>1</Exp><Unit>dB</Unit></Sur_L>'
                                + '<Sur_R><Val>0</Val><Exp>1</Exp><Unit>dB</Unit></Sur_R>'
                                + '<Subwoofer_1><Val>20</Val><Exp>1</Exp><Unit>dB</Unit></Subwoofer_1>'
                                + '</Lvl></Pattern_1></Speaker_Preout></System></YAMAHA_AV>')

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
                text: qsTr("Laptop")
                exclusiveGroup: inputGroup
                onClicked: {

                    if (checked) {
                        request('<YAMAHA_AV cmd="PUT"><Main_Zone><Input><Input_Sel>HDMI1</Input_Sel></Input></Main_Zone></YAMAHA_AV>')
                    }
                 }


            }

            RadioButton {
                id: ps4Button
                text: qsTr("PS4")
                exclusiveGroup: inputGroup
                onClicked: {
                    if (checked) {
                        request('<YAMAHA_AV cmd="PUT"><Main_Zone><Input><Input_Sel>HDMI2</Input_Sel></Input></Main_Zone></YAMAHA_AV>')
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
                request('<YAMAHA_AV cmd="PUT"><Main_Zone><Volume><Lvl><Val>'
                        + value
                        + '</Val><Exp>1</Exp><Unit>dB</Unit></Lvl></Volume></Main_Zone></YAMAHA_AV>')
            }
        }
    }

    function request(command) {
        var url = "http://" + root.ip +"/YamahaRemoteControl/ctrl"
        var http = new XMLHttpRequest();
        http.open("POST", url, true);
        http.setRequestHeader("Content-type", "text/xml; charset=UTF-8");
        http.setRequestHeader("Content-length", command.length);
        http.setRequestHeader("Connection", "close");
        http.send("data="+command)

        return http
    }

    function sync() {
        var powerRequest = request('<YAMAHA_AV cmd="GET"><Main_Zone><Power_Control><Power>GetParam</Power></Power_Control></Main_Zone></YAMAHA_AV>')
        powerRequest.onreadystatechange = function() {
            if (powerRequest.readyState == 4) {
                powerSwitch.checked = ( powerRequest.responseText == '<YAMAHA_AV rsp="GET" RC="0"><Main_Zone><Power_Control><Power>On</Power></Power_Control></Main_Zone></YAMAHA_AV>')
            }
        }

        var volumeRequest = request('<YAMAHA_AV cmd="GET"><Main_Zone><Volume><Lvl>GetParam</Lvl></Volume></Main_Zone></YAMAHA_AV>')
        volumeRequest.onreadystatechange = function() {
            if (volumeRequest.readyState == 4) {
                volumeSlider.value = /<Val>(.+?)<\/Val>/.exec(volumeRequest.responseText)[1]
            }
        }

        var muteRequest = request('<YAMAHA_AV cmd="GET"><Main_Zone><Volume><Mute>GetParam</Mute></Volume></Main_Zone></YAMAHA_AV>')
        muteRequest.onreadystatechange = function() {
            if (muteRequest.readyState == 4) {
                muteSwitch.checked = (muteRequest.responseText == '<YAMAHA_AV rsp="GET" RC="0"><Main_Zone><Volume><Mute>On</Mute></Volume></Main_Zone></YAMAHA_AV>')
            }
        }
        
        var inputRequest = request('<YAMAHA_AV cmd="GET"><Main_Zone><Input><Input_Sel>GetParam</Input_Sel></Input></Main_Zone></YAMAHA_AV>')
        inputRequest.onreadystatechange = function() {
            if(inputRequest.readyState == 4) {
                if(inputRequest.responseText == '<YAMAHA_AV rsp="GET" RC="0"><Main_Zone><Input><Input_Sel>HDMI1</Input_Sel></Input></Main_Zone></YAMAHA_AV>') {
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
        text: "Yamaha AV-Reciever"
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        font.pointSize : 14
        horizontalAlignment: "AlignHCenter"
    }
}
