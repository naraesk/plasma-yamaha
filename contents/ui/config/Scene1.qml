import QtQuick 2.1
import QtQuick.Controls 1.0
import QtQuick.Layouts 1.3
import "../" as Main
import "../functions.js" as Logic

Item {
    property alias cfg_s1_title: title.text
    property alias cfg_s1_fl_vol: fl_vol.value
    property alias cfg_s1_fl_dist: fl_dist.value
    property alias cfg_s1_fl_size: fl_size.currentIndex
    property alias cfg_s1_fr_vol: fr_vol.value
    property alias cfg_s1_fr_dist: fr_dist.value
    property alias cfg_s1_fr_size: fr_size.currentIndex
    property alias cfg_s1_center_vol: center_vol.value
    property alias cfg_s1_center_dist: center_dist.value
    property alias cfg_s1_center_size: center_size.currentIndex
    property alias cfg_s1_sl_vol: sl_vol.value
    property alias cfg_s1_sl_dist: sl_dist.value
    property alias cfg_s1_sl_size: sl_size.currentIndex
    property alias cfg_s1_sr_vol: sr_vol.value
    property alias cfg_s1_sr_dist: sr_dist.value
    property alias cfg_s1_sr_size: sr_size.currentIndex
    property alias cfg_s1_sbl_vol: sbl_vol.value
    property alias cfg_s1_sbl_dist: sbl_dist.value
    property alias cfg_s1_sbl_size: sbl_size.currentIndex
    property alias cfg_s1_sbr_vol: sbr_vol.value
    property alias cfg_s1_sbr_dist: sbr_dist.value
    property alias cfg_s1_sbr_size: sbr_size.currentIndex
    property alias cfg_s1_fpl_vol: fpl_vol.value
    property alias cfg_s1_fpl_dist: fpl_dist.value
    property alias cfg_s1_fpl_size: fpl_size.currentIndex
    property alias cfg_s1_fpr_vol: fpr_vol.value
    property alias cfg_s1_fpr_dist: fpr_dist.value
    property alias cfg_s1_fpr_size: fpr_size.currentIndex
    property alias cfg_s1_rpl_vol: rpl_vol.value
    property alias cfg_s1_rpl_dist: rpl_dist.value
    property alias cfg_s1_rpl_size: rpl_size.currentIndex
    property alias cfg_s1_rpr_vol: rpr_vol.value
    property alias cfg_s1_rpr_dist: rpr_dist.value
    property alias cfg_s1_rpr_size: rpr_size.currentIndex
    property alias cfg_s1_subwoofer_vol: subwoofer_vol.value
    property alias cfg_s1_subwoofer_dist: subwoofer_dist.value
    property alias cfg_s1_subwoofer_size: subwoofer_size.currentIndex
    property alias cfg_s1_subwoofer2_vol: subwoofer2_vol.value
    property alias cfg_s1_subwoofer2_dist: subwoofer2_dist.value
    property alias cfg_s1_subwoofer2_size: subwoofer2_size.currentIndex
    property string ip: plasmoid.configuration.ip

    GridLayout {
        columns: 4
        rows: 14
        id: layout

        Label {
            text: qsTr("Name")
            Layout.alignment: Qt.AlignRight
        }

        TextField {
            id: title
            placeholderText: "Scene 1"
            Layout.columnSpan: 3
            Layout.fillWidth: true
        }

        /*
         * Front Left
         */

        Label {
            id: fl_label
            text: qsTr("Front Left")
            Layout.alignment: Qt.AlignRight
        }

        SpinBox {
            id: fl_vol
            decimals: 1
            minimumValue: -99
            suffix: " dB"
            stepSize: 0.1
        }

        SpinBox {
            id: fl_dist
            decimals: 1
            suffix: " m"
            Layout.alignment: Qt.AlignLeft
        }

        ComboBox {
            id: fl_size
            model: model
            Layout.alignment: Qt.AlignLeft
            onCurrentTextChanged: {
                if (currentText == "None") {
                    fl_vol.enabled = false
                    fl_dist.enabled = false
                    fl_label.enabled = false
                } else {
                    fl_vol.enabled = true
                    fl_dist.enabled = true
                    fl_label.enabled = true
                }
            }
        }

        /*
         * Front Right
         */

        Label {
            id: fr_label
            text: qsTr("Front Right")
            Layout.alignment: Qt.AlignRight
        }

        SpinBox {
            id: fr_vol
            decimals: 1
            minimumValue: -99
            stepSize: 0.1
            suffix: " dB"
            Layout.alignment: Qt.AlignRight
        }

        SpinBox {
            id: fr_dist
            decimals: 1
            suffix: " m"
            Layout.alignment: Qt.AlignLeft
        }

        ComboBox {
            id: fr_size
            model: model
            Layout.alignment: Qt.AlignLeft
            onCurrentTextChanged: {
                if (currentText == "None") {
                    fr_vol.enabled = false
                    fr_dist.enabled = false
                    fr_label.enabled = false
                } else {
                    fr_vol.enabled = true
                    fr_dist.enabled = true
                    fr_label.enabled = true
                }
            }
        }

        /*
         * Center
         */

        Label {
            id: center_label
            text: qsTr("Center")
            Layout.alignment: Qt.AlignRight
        }

        SpinBox {
            id: center_vol
            decimals: 1
            minimumValue: -99
            stepSize: 0.1
            suffix: " dB"
            Layout.alignment: Qt.AlignRight
        }

        SpinBox {
            id: center_dist
            decimals: 1
            suffix: " m"
            Layout.alignment: Qt.AlignLeft
        }

        ComboBox {
            id: center_size
            model: model
            Layout.alignment: Qt.AlignLeft
            onCurrentTextChanged: {
                if (currentText == "None") {
                    center_vol.enabled = false
                    center_dist.enabled = false
                    center_label.enabled = false
                } else {
                    center_vol.enabled = true
                    center_dist.enabled = true
                    center_label.enabled = true
                }
            }
        }

        /*
         * Surround left
         */

        Label {
            id: sl_label
            text: qsTr("Surround Left")
            Layout.alignment: Qt.AlignRight
        }

        SpinBox {
            id: sl_vol
            decimals: 1
            minimumValue: -99
            stepSize: 0.1
            suffix: " dB"
            Layout.alignment: Qt.AlignRight
        }

        SpinBox {
            id: sl_dist
            decimals: 1
            suffix: " m"
            Layout.alignment: Qt.AlignLeft
        }

        ComboBox {
            id: sl_size
            model: model
            Layout.alignment: Qt.AlignLeft
            onCurrentTextChanged: {
                if (currentText == "None") {
                    sl_vol.enabled = false
                    sl_dist.enabled = false
                    sl_label.enabled = false
                } else {
                    sl_vol.enabled = true
                    sl_dist.enabled = true
                    sl_label.enabled = true
                }
            }
        }

        /*
         * Surround Right
         */

        Label {
            id: sr_label
            text: qsTr("Surround Right")
            Layout.alignment: Qt.AlignRight
        }

        SpinBox {
            id: sr_vol
            decimals: 1
            minimumValue: -99
            stepSize: 0.1
            suffix: " dB"
            Layout.alignment: Qt.AlignRight
        }

        SpinBox {
            id: sr_dist
            decimals: 1
            suffix: " m"
            Layout.alignment: Qt.AlignLeft
        }

        ComboBox {
            id: sr_size
            model: model
            Layout.alignment: Qt.AlignLeft
            onCurrentTextChanged: {
                if (currentText == "None") {
                    sr_vol.enabled = false
                    sr_dist.enabled = false
                    sr_label.enabled = false
                } else {
                    sr_vol.enabled = true
                    sr_dist.enabled = true
                    sr_label.enabled = true
                }
            }
        }

        /*
         * Surround Back left
         */

        Label {
            id: sbl_label
            text: qsTr("Surround Back Left")
            Layout.alignment: Qt.AlignRight
        }

        SpinBox {
            id: sbl_vol
            decimals: 1
            minimumValue: -99
            stepSize: 0.1
            suffix: " dB"
            Layout.alignment: Qt.AlignRight
        }

        SpinBox {
            id: sbl_dist
            decimals: 1
            suffix: " m"
            Layout.alignment: Qt.AlignLeft
        }

        ComboBox {
            id: sbl_size
            model: model
            Layout.alignment: Qt.AlignLeft
            onCurrentTextChanged: {
                if (currentText == "None") {
                    sbl_vol.enabled = false
                    sbl_dist.enabled = false
                    sbl_label.enabled = false
                } else {
                    sbl_vol.enabled = true
                    sbl_dist.enabled = true
                    sbl_label.enabled = true
                }
            }
        }

        /*
         * Surround Back Right
         */

        Label {
            id: sbr_label
            text: qsTr("Surround Back Right")
            Layout.alignment: Qt.AlignRight
        }

        SpinBox {
            id: sbr_vol
            decimals: 1
            minimumValue: -99
            stepSize: 0.1
            suffix: " dB"
            Layout.alignment: Qt.AlignRight
        }

        SpinBox {
            id: sbr_dist
            decimals: 1
            suffix: " m"
            Layout.alignment: Qt.AlignLeft
        }

        ComboBox {
            id: sbr_size
            model: model
            Layout.alignment: Qt.AlignLeft
            onCurrentTextChanged: {
                if (currentText == "None") {
                    sbr_vol.enabled = false
                    sbr_dist.enabled = false
                    sbr_label.enabled = false
                } else {
                    sbr_vol.enabled = true
                    sbr_dist.enabled = true
                    sbr_label.enabled = true
                }
            }
        }

        /*
         * Front Presence Left
         */

        Label {
            id: fpl_label
            text: qsTr("Front Presence Left")
            Layout.alignment: Qt.AlignRight
        }

        SpinBox {
            id: fpl_vol
            decimals: 1
            minimumValue: -99
            suffix: " dB"
            stepSize: 0.1
        }

        SpinBox {
            id: fpl_dist
            decimals: 1
            suffix: " m"
            Layout.alignment: Qt.AlignLeft
        }

        ComboBox {
            id: fpl_size
            model: model
            Layout.alignment: Qt.AlignLeft
            onCurrentTextChanged: {
                if (currentText == "None") {
                    fpl_vol.enabled = false
                    fpl_dist.enabled = false
                    fpl_label.enabled = false
                } else {
                    fpl_vol.enabled = true
                    fpl_dist.enabled = true
                    fpl_label.enabled = true
                }
            }
        }

        /*
         * Front Presence Right
         */

        Label {
            id: fpr_label
            text: qsTr("Front Presence Right")
            Layout.alignment: Qt.AlignRight
        }

        SpinBox {
            id: fpr_vol
            decimals: 1
            minimumValue: -99
            stepSize: 0.1
            suffix: " dB"
            Layout.alignment: Qt.AlignRight
        }

        SpinBox {
            id: fpr_dist
      //  value: s1
            decimals: 1
            suffix: " m"
            Layout.alignment: Qt.AlignLeft
        }

        ComboBox {
            id: fpr_size
            model: model
            Layout.alignment: Qt.AlignLeft
            onCurrentTextChanged: {
                if (currentText == "None") {
                    fpr_vol.enabled = false
                    fpr_dist.enabled = false
                    fpr_label.enabled = false
                } else {
                    fpr_vol.enabled = true
                    fpr_dist.enabled = true
                    fpr_label.enabled = true
                }
            }
        }

        /*
         * Rear Presence Left
         */

        Label {
            id: rpl_label
            text: qsTr("Rear Presence Left")
            Layout.alignment: Qt.AlignRight
        }

        SpinBox {
            id: rpl_vol
            decimals: 1
            minimumValue: -99
            suffix: " dB"
            stepSize: 0.1
        }

        SpinBox {
            id: rpl_dist
            decimals: 1
            suffix: " m"
            Layout.alignment: Qt.AlignLeft
        }

        ComboBox {
            id: rpl_size
            model: model
            Layout.alignment: Qt.AlignLeft
            onCurrentTextChanged: {
                if (currentText == "None") {
                    rpl_vol.enabled = false
                    rpl_dist.enabled = false
                    rpl_label.enabled = false
                } else {
                    rpl_vol.enabled = true
                    rpl_dist.enabled = true
                    rpl_label.enabled = true
                }
            }
        }

        /*
         * Rear Presence Right
         */

        Label {
            id: rpr_label
            text: qsTr("Rear Presence Right")
            Layout.alignment: Qt.AlignRight
        }

        SpinBox {
            id: rpr_vol
            decimals: 1
            minimumValue: -99
            stepSize: 0.1
            suffix: " dB"
            Layout.alignment: Qt.AlignRight
        }

        SpinBox {
            id: rpr_dist
      //  value: s1
            decimals: 1
            suffix: " m"
            Layout.alignment: Qt.AlignLeft
        }

        ComboBox {
            id: rpr_size
            model: model
            Layout.alignment: Qt.AlignLeft
            onCurrentTextChanged: {
                if (currentText == "None") {
                    rpr_vol.enabled = false
                    rpr_dist.enabled = false
                    rpr_label.enabled = false
                } else {
                    rpr_vol.enabled = true
                    rpr_dist.enabled = true
                    rpr_label.enabled = true
                }
            }
        }

        /*
         * Subwoofer 1
         */

        Label {
            id: subwoofer_label
            text: qsTr("Subwoofer 1")
            Layout.alignment: Qt.AlignRight
        }

        SpinBox {
            id: subwoofer_vol
            decimals: 1
            minimumValue: -99
            stepSize: 0.1
            suffix: " dB"
            Layout.alignment: Qt.AlignRight
        }

        SpinBox {
            id: subwoofer_dist
            decimals: 1
            suffix: " m"
            Layout.alignment: Qt.AlignLeft
        }

        ComboBox {
            id: subwoofer_size
            model: subwooferModel
            Layout.alignment: Qt.AlignLeft
            onCurrentTextChanged: {
                if (currentText == "None") {
                    subwoofer_vol.enabled = false
                    subwoofer_dist.enabled = false
                    subwoofer_label.enabled = false
                } else {
                    subwoofer_vol.enabled = true
                    subwoofer_dist.enabled = true
                    subwoofer_label.enabled = true
                }
            }
        }

        /*
         * Subwoofer 2
         */

        Label {
            id: subwoofer2_label
            text: qsTr("Subwoofer 2")
            Layout.alignment: Qt.AlignRight
        }

        SpinBox {
            id: subwoofer2_vol
            decimals: 1
            minimumValue: -99
            stepSize: 0.1
            suffix: " dB"
            Layout.alignment: Qt.AlignRight
        }

        SpinBox {
            id: subwoofer2_dist
            decimals: 1
            suffix: " m"
            Layout.alignment: Qt.AlignLeft
        }

        ComboBox {
            id: subwoofer2_size
            model: subwooferModel
            Layout.alignment: Qt.AlignLeft
            onCurrentTextChanged: {
                if (currentText == "None") {
                    subwoofer2_vol.enabled = false
                    subwoofer2_dist.enabled = false
                    subwoofer2_label.enabled = false
                } else {
                    subwoofer2_vol.enabled = true
                    subwoofer2_dist.enabled = true
                    subwoofer2_label.enabled = true
                }
            }
        }
    }

    Button {
        anchors.top: layout.bottom
        anchors.topMargin: 10
        anchors.right: layout.right
        text: qsTr("Fetch settings")
        onClicked: {

            /*
             * Fetch size of speakers
             */

            Logic.sizeRequest("Front", ip, fl_size)
            fr_size.currentIndex = fl_size.currentIndex
            Logic.sizeRequest("Center", ip, center_size)
            Logic.sizeRequest("Sur", ip, sl_size)
            sr_size.currentIndex = sl_size.currentIndex
            Logic.sizeRequest("Sur_Back", ip, sbl_size)
            sbr_size.currentIndex = sbl_size.currentIndex
            Logic.sizeRequest("Front_Presence", ip, fpl_size)
            fpr_size.currentIndex = fpl_size.currentIndex
            Logic.sizeRequest("Rear_Presence", ip, rpl_size)
            rpr_size.currentIndex = rpl_size.currentIndex
            Logic.subwooferRequest("Subwoofer_1", ip, subwoofer_size)
            Logic.subwooferRequest("Subwoofer_2", ip, subwoofer2_size)

            //var powerRequest = Logic.request('<YAMAHA_AV cmd="GET"><Main_Zone><Power_Control><Power>GetParam</Power></Power_Control></Main_Zone></YAMAHA_AV>', ip)

            /*
             * Fetch distance of all used speakers
             */

            var distRequest = Logic.request('<YAMAHA_AV cmd="GET"><System><Speaker_Preout><Pattern_1><Distance>'
                                            + 'GetParam'
                                            + '</Distance></Pattern_1></Speaker_Preout></System></YAMAHA_AV>', ip)
            distRequest.onreadystatechange = function() {
                if (distRequest.readyState === 4) {
                    if (fl_size.currentText != "None") {
                        fl_dist.value = /<Front_L><Val>(.+?)<\/Val>/.exec(distRequest.responseText)[1]/100
                        fr_dist.value = /<Front_R><Val>(.+?)<\/Val>/.exec(distRequest.responseText)[1]/100
                    }
                    if (center_size.currentText != "None") {
                        center_dist.value = /<Center><Val>(.+?)<\/Val>/.exec(distRequest.responseText)[1]/100
                    }
                    if (sl_size.currentText != "None") {
                        sl_dist.value = /<Sur_L><Val>(.+?)<\/Val>/.exec(distRequest.responseText)[1]/100
                        sr_dist.value = /<Sur_R><Val>(.+?)<\/Val>/.exec(distRequest.responseText)[1]/100
                    }

                    if (sbl_size.currentText != "None") {
                        sbl_dist.value = /<Sur_Back_L><Val>(.+?)<\/Val>/.exec(distRequest.responseText)[1]/100
                        sbr_dist.value = /<Sur_Back_R><Val>(.+?)<\/Val>/.exec(distRequest.responseText)[1]/100
                    }

                    if (fpl_size.currentText != "None") {
                        fpl_dist.value = /<Front_Presence_L><Val>(.+?)<\/Val>/.exec(distRequest.responseText)[1]/100
                        fpr_dist.value = /<Front_Presence_R><Val>(.+?)<\/Val>/.exec(distRequest.responseText)[1]/100
                    }
                    if (rpl_size.currentText != "None") {
                        rpl_dist.value = /<Rear_Presence_L><Val>(.+?)<\/Val>/.exec(distRequest.responseText)[1]/100
                        rpr_dist.value = /<Rear_Presence_R><Val>(.+?)<\/Val>/.exec(distRequest.responseText)[1]/100
                    }

                    if (subwoofer_size.currentText != "None") {
                        subwoofer_dist.value = /<Subwoofer_1><Val>(.+?)<\/Val>/.exec(distRequest.responseText)[1]/100
                    }

                    if (subwoofer2_size.currentText != "None") {
                        subwoofer2_dist.value = /<Subwoofer_2><Val>(.+?)<\/Val>/.exec(distRequest.responseText)[1]/100
                    }
                }
            }

            /*
             * Fetch level of all used speakers
             */

            var lvlRequest = Logic.request('<YAMAHA_AV cmd="GET"><System><Speaker_Preout><Pattern_1><Lvl>'
                                        + 'GetParam'
                                        + '</Lvl></Pattern_1></Speaker_Preout></System></YAMAHA_AV>', ip)
            lvlRequest.onreadystatechange = function() {
                if(lvlRequest.readyState === 4) {
                    if (fl_size.currentText != "None") {
                        fl_vol.value = /<Front_L><Val>(.+?)<\/Val>/.exec(lvlRequest.responseText)[1]/10
                        fr_vol.value = /<Front_R><Val>(.+?)<\/Val>/.exec(lvlRequest.responseText)[1]/10
                    }

                    if (center_size.currentText != "None") {
                        center_vol.value = /<Center><Val>(.+?)<\/Val>/.exec(lvlRequest.responseText)[1]/10
                    }

                    if (sl_size.currentText != "None") {
                        sl_vol.value = /<Sur_L><Val>(.+?)<\/Val>/.exec(lvlRequest.responseText)[1]/10
                        sr_vol.value = /<Sur_R><Val>(.+?)<\/Val>/.exec(lvlRequest.responseText)[1]/10
                    }

                    if (sbl_size.currentText != "None") {
                        sbl_vol.value = /<Sur_Back_L><Val>(.+?)<\/Val>/.exec(lvlRequest.responseText)[1]/10
                        sbr_vol.value = /<Sur_Back_R><Val>(.+?)<\/Val>/.exec(lvlRequest.responseText)[1]/10
                    }

                    if (fpl_size.currentText != "None") {
                        fpl_vol.value = /<Front_Presence_L><Val>(.+?)<\/Val>/.exec(lvlRequest.responseText)[1]/10
                        fpr_vol.value = /<Front_Presence_R><Val>(.+?)<\/Val>/.exec(lvlRequest.responseText)[1]/10
                    }

                    if (rpl_size.currentText != "None") {
                        rpl_vol.value = /<Rear_Presence_L><Val>(.+?)<\/Val>/.exec(lvlRequest.responseText)[1]/10
                        rpr_vol.value = /<Rear_Presence_R><Val>(.+?)<\/Val>/.exec(lvlRequest.responseText)[1]/10
                    }

                    if (subwoofer_size.currentText != "None") {
                        subwoofer_vol.value = /<Subwoofer_1><Val>(.+?)<\/Val>/.exec(lvlRequest.responseText)[1]/10
                    }

                    if (subwoofer2_size.currentText != "None") {
                        subwoofer2_vol.value = /<Subwoofer_2><Val>(.+?)<\/Val>/.exec(lvlRequest.responseText)[1]/10
                    }
                }
            }
        }
    }

    ListModel {
        id: model
        ListElement { text: qsTr("None")}
        ListElement { text: qsTr("Small")}
        ListElement { text: qsTr("Large")}
   }

    ListModel {
        id: subwooferModel
        ListElement { text: qsTr("None")}
        ListElement { text: qsTr("Use")}
   }
}


