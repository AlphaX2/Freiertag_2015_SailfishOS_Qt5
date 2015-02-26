import QtQuick 2.0
import Sailfish.Silica 1.0
import "../cover"

Page {
    id: pageMain

    function search() {
        // save selected options in settings
        settings.p_land = bundeslandSelect.currentIndex
        settings.p_year = jahrSelect.currentIndex
        settings.p_type = typeSelect.currentIndex
        settings.saveSettings()

        // get the selected values
        var bland = bundeslandSelect.value
        var jahr = jahrSelect.value
        var type = typeSelect.value

        /*
        replace "ü" and "-" is easier in QML, than in C++
         */
        bland = bland.replace("ü","ue")
        bland = bland.replace("-","_")

        /*
        parses the results and populates the model
        ResultPage will be loaded after parseFinished signal
        see Connections {} for Details.
        */
        frei.suche(bland, jahr, type)
    }

    // StartCover set's text via these property aliases
    property alias bland_text: bundeslandSelect.value
    property alias year_text: jahrSelect.value
    property alias type_text: typeSelect.value

    Connections {
        target: frei
        onParserFinished: {
            pageStack.push(Qt.resolvedUrl("ResultPage.qml"), {model: freiModel, headerTitle: jahrSelect.value+" | "+bundeslandSelect.value})
            appWindow.cover = Qt.resolvedUrl("../cover/ResultCover.qml")
        }
    }

    /*
    This is working as an switch: In the moment the MainPage is activ/shown - the cover switches back to
    the start cover.
    */
    onStatusChanged: {
        if(status === PageStatus.Active){appWindow.cover = Qt.resolvedUrl("../cover/StartCover.qml")}
    }
    
    // To enable PullDownMenu, place our content in a SilicaFlickable
    SilicaFlickable {
        anchors.fill: parent
        
        // PullDownMenu and PushUpMenu must be declared in SilicaFlickable, SilicaListView or SilicaGridView
        PullDownMenu {
            MenuItem {
                text: qsTr("Über")
                onClicked: pageStack.push("AboutDialog.qml")
            }
            MenuItem {
                text: qsTr("Suchen")
                onClicked: {
                        search()
                    }
                }
            }
        
        // Tell SilicaFlickable the height of its content.
        contentHeight: childrenRect.height
        
        // Place our content in a Column.  The PageHeader is always placed at the top
        // of the page, followed by our content.
        Column {
            width: pageMain.width
            spacing: Theme.paddingLarge
            PageHeader {
                title: "Freiertag"
            }

            ComboBox {
                id: bundeslandSelect

                width: parent.width
                label: qsTr("Bundesland:")
                currentIndex: settings.p_land

                menu: ContextMenu {
                    MenuItem {
                        text: qsTr("Baden-Württemberg")
                        onClicked: {bland_text = text}
                    }
                    MenuItem {
                        text: qsTr("Bayern")
                        onClicked: {bland_text = text}
                    }
                    MenuItem {
                        text: qsTr("Berlin")
                        onClicked: {bland_text = text}
                    }
                    MenuItem {
                        text: qsTr("Brandenburg")
                        onClicked: {bland_text = text}
                    }
                    MenuItem {
                        text: qsTr("Bremen")
                        onClicked: {bland_text = text}
                    }
                    MenuItem {
                        text: qsTr("Hamburg")
                        onClicked: {bland_text = text}
                    }
                    MenuItem {
                        text: qsTr("Hessen")
                        onClicked: {bland_text = text}
                    }
                    MenuItem {
                        text: qsTr("Mecklenburg-Vorpommern")
                        onClicked: {bland_text = text}
                    }
                    MenuItem {
                        text: qsTr("Niedersachsen")
                        onClicked: {bland_text = text}
                    }
                    MenuItem {
                        text: qsTr("Nordrhein-Westfalen")
                        onClicked: {bland_text = text}
                    }
                    MenuItem {
                        text: qsTr("Rheinland-Pfalz")
                        onClicked: {bland_text = text}
                    }
                    MenuItem {
                        text: qsTr("Saarland")
                        onClicked: {bland_text = text}
                    }
                    MenuItem {
                        text: qsTr("Sachsen")
                        onClicked: {bland_text = text}
                    }
                    MenuItem {
                        text: qsTr("Sachsen-Anhalt")
                        onClicked: {bland_text = text}
                    }
                    MenuItem {
                        text: qsTr("Schleswig-Holstein")
                        onClicked: {bland_text = text}
                    }
                    MenuItem {
                        text: qsTr("Thüringen")
                        onClicked: {bland_text = text}
                    }
                }
            }

            ComboBox {
                id: jahrSelect

                label: qsTr("Jahr:")
                currentIndex: settings.p_year

                menu: ContextMenu {
                    MenuItem {
                        text: "2015"
                        onClicked: {year_text = text}
                    }
                    MenuItem {
                        text: "2016"
                        onClicked: {year_text = text}
                    }
                    MenuItem {
                        text: "2017"
                        onClicked: {year_text = text}
                    }
                    MenuItem {
                        text: "2018"
                        onClicked: {year_text = text}
                    }
                }
            }

            ComboBox {
                id: typeSelect
                label: qsTr("Ferien:")
                currentIndex: settings.p_type

                menu: ContextMenu {
                    MenuItem {
                        text: qsTr("Schulferien")
                        onClicked: {type_text = text}
                    }
                    MenuItem {
                        text: qsTr("alle Feiertage")
                        onClicked: {type_text = text}
                    }
                    MenuItem {
                        text: qsTr("gesetzliche Feiertage")
                        onClicked: {type_text = text}
                    }
                }
            }
        }
    }
}


