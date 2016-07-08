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
    property string url

    Connections {
        target: plasmoid.configuration
    }

    Component.onCompleted: {
        url = "http://" + root.ip +"/YamahaRemoteControl/ctrl"
        sync()
    }

    Timer {
        interval: 5 * 60 * 1000 // 5 minutes
        running: true
        repeat: true
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
                    status = "On"
                } else {
                    status =  "Standby"
                }

                request('<YAMAHA_AV cmd="PUT"><Main_Zone><Power_Control><Power>' + status + '</Power></Power_Control></Main_Zone></YAMAHA_AV>')
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
