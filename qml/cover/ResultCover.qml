import QtQuick 2.0
import Sailfish.Silica 1.0

CoverBackground {
    id: resultCoverPage
    anchors.fill: parent

    property int currentIndex: 0
    property int itemCount: freiModel.countRows()

    CoverActionList {
        id: coverEventSwitcher

        CoverAction {
            id: previousEvent
            iconSource: (currentIndex === 0) ? "" : "image://theme/icon-cover-previous"
            onTriggered: {
                if(currentIndex >0 ){currentIndex -= 1; updateCoverText()}
            }
        }
        CoverAction {
            id: nextEvent
            iconSource: (currentIndex < itemCount) ? "image://theme/icon-cover-next" : ""
            onTriggered: {
                if(currentIndex < itemCount){currentIndex += 1; updateCoverText()}
            }
        }
    }

    Component.onCompleted: {
        updateCoverText()
    }

    PageHeader {
        id: header
        //title: prepareText()
    }

    Label {
        id: date
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: header.bottom
        anchors.topMargin: Theme.paddingMedium

        //text: prepareDateText()
        font.pixelSize: Theme.fontSizeLarge
    }

    function updateCoverText() {
        header.title = prepareText()
        date.text = prepareDateText()
    }

    function prepareText() {

        var text = freiModel.getResult(currentIndex)[1]

        if(mainPage.bland_text === "Schulferien") {
            text = text.split(" ", 1)[0]
        }
        return text
    }

    function prepareDateText() {
        var text = freiModel.getResult(currentIndex)[0]
        var splited = text.split(" - ")

        if (splited.length === 2) {
            return splited[0]+"\n"+splited[1]
        }
        else if(splited.length === 1) {
            return splited[0]
        }
    }
}


