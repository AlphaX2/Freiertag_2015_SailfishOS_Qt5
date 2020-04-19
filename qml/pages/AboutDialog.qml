import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    anchors.fill: parent

    Column {
        anchors.top: header.bottom
        width: parent.width
        spacing: Theme.paddingMedium

        PageHeader {
            title: qsTr("Über")
        }

        Image {
            anchors.horizontalCenter: parent.horizontalCenter
            source: "/usr/share/icons/hicolor/86x86/apps/harbour-freiertag.png"
        }

        Label {
            x: Theme.paddingMedium
            text: qsTr("Autor:")
            color: Theme.highlightColor

            font.pixelSize: Theme.fontSizeMedium
        }
        Label {
            x: Theme.paddingLarge
            text: "Christian Güssmer/Gabriel Berkigt"
            color: Theme.primaryColor

            font.pixelSize: Theme.fontSizeSmall
        }
        Label {
            x: Theme.paddingMedium
            text: qsTr("Lizenz:")
            color: Theme.highlightColor

            font.pixelSize: Theme.fontSizeMedium
        }
        Label {
            x: Theme.paddingLarge
            text: "GNU General Public Licence 3.0"
            color: Theme.primaryColor

            font.pixelSize: Theme.fontSizeSmall
        }
        Label {
            x: Theme.paddingMedium
            text: "Version:"
            color: Theme.highlightColor

            font.pixelSize: Theme.fontSizeMedium
        }
        Label {
            x: Theme.paddingLarge
            text: "2.0.18"
            color: Theme.primaryColor

            font.pixelSize: Theme.fontSizeSmall
        }
        Label {
            x: Theme.paddingMedium
            text: qsTr("Kontakt:")
            color: Theme.highlightColor

            font.pixelSize: Theme.fontSizeMedium
        }
        Button {
            //x: Theme.paddingMedium
            anchors.horizontalCenter: parent.horizontalCenter
            text: qsTr("Mail senden")
            color: Theme.primaryColor
            onClicked: {
                Qt.openUrlExternally(qsTr("mailto: m.gabrielboehme@googlemail.com" +
                                      "?subject=Feedback zu Freiertag"))
            }
        }
        Button {
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Code ansehen"
            onClicked: Qt.openUrlExternally("http://www.github.com/AlphaX2/Freiertag_2015_SailfishOS_Qt5")
        }
    }
}


