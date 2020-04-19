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

SOURCES += src/harbour-freiertag.cpp \
    src/FreiertagCom.cpp \
    src/FreiListModel.cpp \
    src/Settings.cpp

DISTFILES += qml/harbour-freiertag.qml \
    qml/cover/CoverPage.qml \
    rpm/harbour-freiertag.changes.run.in \
    rpm/harbour-freiertag.spec \
    rpm/harbour-freiertag.yaml \
    translations/*.ts \
    harbour-freiertag.desktop \
    data/2015/feiertage/*.ics \
    data/2015/ferien/*.ics \
    data/2016/feiertage/*.ics \
    data/2016/ferien/*.ics \
    data/2017/feiertage/*.ics \
    data/2017/ferien/*.ics \
    data/2018/feiertage/*.ics \
    data/2018/ferien/*.ics \
    data/2019/feiertage/*.ics \
    data/2019/ferien/*.ics \
    data/2020/feiertage/*.ics \
    data/2020/ferien/*.ics \
    rpm/harbour-freiertag.changes

SAILFISHAPP_ICONS = 86x86 108x108 128x128

# to disable building translations every time, comment out the
# following CONFIG line
CONFIG += sailfishapp_i18n

# German translation is enabled as an example. If you aren't
# planning to localize your app, remember to comment out the
# following TRANSLATIONS line. And also do not forget to
# modify the localized app name in the the .desktop file.
TRANSLATIONS += translations/harbour-freiertag-de.ts

HEADERS += \
    src/FreiertagCom.hpp \
    src/FreiListModel.hpp \
    src/Settings.hpp

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

# define data for 2019
ferien2019.path = /usr/share/harbour-freiertag/data/2019/ferien
ferien2019.files += data/2019/ferien/*.ics
feiertage2019.path = /usr/share/harbour-freiertag/data/2019/feiertage
feiertage2019.files += data/2019/feiertage/*.ics


# define data for 2020
ferien2020.path = /usr/share/harbour-freiertag/data/2020/ferien
ferien2020.files += data/2020/ferien/*.ics
feiertage2020.path = /usr/share/harbour-freiertag/data/2020/feiertage
feiertage2020.files += data/2020/feiertage/*.ics


INSTALLS += ferien2015
INSTALLS += feiertage2015

INSTALLS += ferien2016
INSTALLS += feiertage2016

INSTALLS += ferien2017
INSTALLS += feiertage2017

INSTALLS += ferien2018
INSTALLS += feiertage2018

INSTALLS += ferien2019
INSTALLS += feiertage2019

INSTALLS += ferien2020
INSTALLS += feiertage2020
