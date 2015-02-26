# NOTICE:
#
# Application name defined in TARGET has a corresponding QML filename.
# If name defined in TARGET is changed, the following needs to be done
# to match new name:
#   - corresponding QML filename must be changed
#   - desktop icon filename must be changed
#   - desktop filename must be changed
#   - icon definition filename in desktop file must be changed
#   - translation filenames have to be changed

# The name of your application
TARGET = harbour-freiertag

CONFIG += sailfishapp

HEADERS += \
    src/FreiListModel.hpp \
    src/FreiertagCom.hpp \
    src/Settings.hpp

SOURCES += src/harbour-freiertag.cpp \
    src/FreiertagCom.cpp \
    src/FreiListModel.cpp \
    src/Settings.cpp

OTHER_FILES += qml/harbour-freiertag.qml \
    qml/cover/CoverPage.qml \
    qml/pages/FirstPage.qml \
    qml/pages/SecondPage.qml \
    rpm/harbour-freiertag.changes.in \
    rpm/harbour-freiertag.spec \
    rpm/harbour-freiertag.yaml \
    translations/*.ts \
    harbour-freiertag.desktop \
    data/2015/feiertage/* \
    data/2015/ferien/* \
    data/2016/feiertage/* \
    data/2016/ferien/* \
    data/2017/feiertage/* \
    data/2017/ferien/* \
    data/2018/feiertage/* \
    data/2018/ferien/* \
    qml/pages/MainPage.qml \
    qml/pages/ResultPage.qml \
    qml/pages/AboutDialog.qml \
    qml/cover/ResultCover.qml \
    qml/cover/StartCover.qml \
    translations/harbour-freiertag-en.ts

# to disable building translations every time, comment out the
# following CONFIG line
CONFIG += sailfishapp_i18n
TRANSLATIONS += translations/harbour-freiertag-de.ts
TRANSLATIONS += translations/harbour-freiertag-en.ts

# define data for 2015
ferien2015.path = /usr/share/harbour-freiertag/data/2015/ferien
ferien2015.files += data/2015/ferien/*.ics
feiertage2015.path = /usr/share/harbour-freiertag/data/2015/feiertage
feiertage2015.files += data/2015/feiertage/*.ics

# define data for 2016
ferien2016.path = /usr/share/harbour-freiertag/data/2016/ferien
ferien2016.files += data/2016/ferien/*.ics
feiertage2016.path = /usr/share/harbour-freiertag/data/2016/feiertage
feiertage2016.files += data/2016/feiertage/*.ics

# define data for 2017
ferien2017.path = /usr/share/harbour-freiertag/data/2017/ferien
ferien2017.files += data/2017/ferien/*.ics
feiertage2017.path = /usr/share/harbour-freiertag/data/2017/feiertage
feiertage2017.files += data/2017/feiertage/*.ics

# define data for 2018
ferien2018.path = /usr/share/harbour-freiertag/data/2018/ferien
ferien2018.files += data/2018/ferien/*.ics
feiertage2018.path = /usr/share/harbour-freiertag/data/2018/feiertage
feiertage2018.files += data/2018/feiertage/*.ics

INSTALLS += ferien2015
INSTALLS += feiertage2015

INSTALLS += ferien2016
INSTALLS += feiertage2016

INSTALLS += ferien2017
INSTALLS += feiertage2017

INSTALLS += ferien2018
INSTALLS += feiertage2018
