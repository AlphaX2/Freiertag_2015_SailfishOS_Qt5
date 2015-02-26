import QtQuick 2.0
import Sailfish.Silica 1.0

CoverBackground {
    id: coverPage
    anchors.fill: parent

    CoverActionList {
        id: coverActionsList
        CoverAction {
            id: searchAction
            iconSource: "image://theme/icon-cover-search"
            onTriggered: {
                mainPage.search()
                appWindow.activate()
            }
        }
    }

    PageHeader {
        id: header
        title: mainPage.bland_text
    }

    Label {
        id: jahr
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: header.bottom
        anchors.topMargin: Theme.spacingLarge
        font.pixelSize: Theme.fontSizeLarge
        color: Theme.primaryColor
        text: mainPage.year_text
    }
    Label {
        id: type
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: jahr.bottom
        anchors.topMargin: Theme.spacingLarge
        color: Theme.highlightColor
        font.pixelSize: Theme.fontSizeExtraSmall
        text: mainPage.type_text
    }
}


