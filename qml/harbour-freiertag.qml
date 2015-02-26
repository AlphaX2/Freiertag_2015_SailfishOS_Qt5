import QtQuick 2.0
import Sailfish.Silica 1.0
import "pages"
import "cover"

ApplicationWindow
{
    id: appWindow

    MainPage {id: mainPage}
    //ResultPage {id: resultPage}

    initialPage: mainPage
    cover: Qt.resolvedUrl("../cover/StartCover.qml")
}


