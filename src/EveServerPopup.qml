/*
 * SPDX-License-Identifier: Apache-2.0
 * Copyright (C) 2025 ZEDEDA, Inc.
 */

import QtQuick 2.15
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.15
import QtQuick.Controls.Material 2.2
import "qmlcomponents"

import RpiImager

ImPopup {
    id: root
    closePolicy: Popup.CloseOnEscape
    focus: true

    property string eveServerDefault: "zedcloud.zededa.net"
    property string eveServer: ""

    title: qsTr("EVE-OS Image Customization")

    signal accepted()

    height: chkOverrideServer.checked ? 250 : 190

    // These children go into ImPopup's ColumnLayout

    ImCheckBox {
        id: chkOverrideServer
        text: qsTr("Override EVE server")
        checked: false
        Layout.leftMargin: 20
        Layout.topMargin: 10
        onCheckedChanged: {
            if (checked) {
                fieldEveServer.forceActiveFocus()
            }
        }
    }

    RowLayout {
        visible: chkOverrideServer.checked
        Layout.leftMargin: 50
        Layout.rightMargin: 25
        Layout.fillWidth: true
        spacing: 10

        Text {
            text: qsTr("Server:")
            color: Style.formLabelColor
            font.family: Style.fontFamily
        }

        TextField {
            id: fieldEveServer
            text: root.eveServerDefault
            selectByMouse: true
            maximumLength: 253
            Layout.fillWidth: true
            validator: RegularExpressionValidator { regularExpression: /[a-zA-Z0-9]([a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(\.[a-zA-Z0-9]([a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)+/ }
            property bool indicateError: false
            color: indicateError ? "red" : Style.formLabelColor
            onTextEdited: {
                indicateError = false
            }
        }
    }

    Item {
        Layout.fillHeight: true
    }

    RowLayout {
        Layout.alignment: Qt.AlignRight
        Layout.rightMargin: 25
        Layout.bottomMargin: 10
        spacing: 10

        ImButton {
            text: qsTr("SKIP")
            onClicked: {
                root.eveServer = ""
                root.close()
                root.accepted()
            }
        }

        ImButtonRed {
            text: qsTr("OK")
            onClicked: {
                if (chkOverrideServer.checked) {
                    if (!fieldEveServer.acceptableInput) {
                        fieldEveServer.indicateError = true
                        fieldEveServer.forceActiveFocus()
                        return
                    }
                    if (fieldEveServer.text !== root.eveServerDefault) {
                        root.eveServer = fieldEveServer.text
                    } else {
                        root.eveServer = ""
                    }
                } else {
                    root.eveServer = ""
                }
                root.close()
                root.accepted()
            }
        }
    }

    function openPopup() {
        chkOverrideServer.checked = false
        fieldEveServer.text = eveServerDefault
        eveServer = ""
        open()
    }
}
