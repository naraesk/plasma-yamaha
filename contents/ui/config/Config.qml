/*
 * Copyright (C) 2018 by David Baum <david.baum@naraesk.eu>
 *
 * This file is part of plasma-yamaha.
 *
 * plasma-yamaha is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * plasma-yamaha is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with plasma-yamaha.  If not, see <http://www.gnu.org/licenses/>.
 */

import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.3

Item {
    property alias cfg_ip: ip.text
    property alias cfg_title: title.text
    property alias cfg_input1_name: input1_name.text
    property alias cfg_input1_type: input1_type.currentIndex
    property alias cfg_input1_type2: input1_type.currentText
    property alias cfg_input2_name: input2_name.text
    property alias cfg_input2_type: input2_type.currentIndex
    property alias cfg_input2_type2: input2_type.currentText

    id: root
    width: parent.width
    height: parent.height

    GridLayout {
        id: layout
        columns: 3
        rows: 1
        Layout.fillWidth: true
        width: parent.width

        Label {
            text: qsTr("IP address")
            Layout.alignment: Qt.AlignRight
        }

        TextField {
            id: ip
            Layout.fillWidth: true
            placeholderText: qsTr("Enter IP")
            Layout.columnSpan: 2
        }

        Label {
            text: qsTr("Title")
            Layout.alignment: Qt.AlignRight
        }

        TextField {
            id: title
            Layout.fillWidth: true
            placeholderText: qsTr("Enter Title")
            Layout.columnSpan: 2
        }

        Label {
            text: qsTr("Input 1")
            Layout.alignment: Qt.AlignRight
        }

        ComboBox {
            id: input1_type
            model: model
            Layout.alignment: Qt.AlignLeft
        }

        TextField {
            id: input1_name
            Layout.fillWidth: true
            placeholderText: qsTr("Name of Input 1")
        }

        Label {
            text: qsTr("Input 2")
            Layout.alignment: Qt.AlignRight
        }

        ComboBox {
            id: input2_type
            model: model
            Layout.alignment: Qt.AlignLeft
        }

        TextField {
            id: input2_name
            Layout.fillWidth: true
            placeholderText: qsTr("Name of Input 2")
        }

    }

    ListModel {
            id: model
            ListElement { text: "SIRIUS"}
            ListElement { text:  "TUNER"}
            ListElement { text: "MULTI CH"}
            ListElement { text: "PHONO"}
            ListElement { text: "HDMI1"}
            ListElement { text: "HDMI2"}
            ListElement { text: "HDMI3"}
            ListElement { text: "HDMI4"}
            ListElement { text: "HDMI5"}
            ListElement { text: "HDMI6"}
            ListElement { text: "HDMI7"}
            ListElement { text: "AV1"}
            ListElement { text: "AV2"}
            ListElement { text: "AV3"}
            ListElement { text: "AV4"}
            ListElement { text: "AV5"}
            ListElement { text: "AV6"}
            ListElement { text: "AV7"}
            ListElement { text: "V-AUX"}
            ListElement { text: "AUDIO1"}
            ListElement { text: "AUDIO2"}
            ListElement { text: "AUDIO3"}
            ListElement { text: "AUDIO4"}
            ListElement { text: "DOCK"}
            ListElement { text: "iPod"}
            ListElement { text: "Bluetooth"}
            ListElement { text: "UAW"}
            ListElement { text: "NET"}
            ListElement { text: "Rhapsody"}
            ListElement { text: "SIRIUS InternetRadio"}
            ListElement { text: "Pandora"}
            ListElement { text: "Napster"}
            ListElement { text: "PC"}
            ListElement { text: "NET RADIO"}
            ListElement { text: "USB"}
            ListElement { text: "iPod (USB)"}
       }
}
