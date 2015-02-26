#include "Settings.hpp"
#include <QDebug>

Settings::Settings(QString organizationName, QString applicationName, QObject *parent) {
    m_orgName = organizationName;
    m_appName = applicationName;
    this->loadSettings();
}

void Settings::loadSettings() {
    qDebug() << "load() in Settings";

    QSettings settings(m_orgName, m_appName);
    m_land = settings.value("settings/land").toInt();
    m_year = settings.value("settings/year").toInt();
    m_type = settings.value("settings/type").toInt();

    qDebug() << m_land << m_year << m_type;
}

void Settings::saveSettings() {
   qDebug() << "saving settings...";
   QSettings settings(m_orgName, m_appName);
   settings.setValue("settings/land", m_land);
   settings.setValue("settings/year", m_year);
   settings.setValue("settings/type", m_type);
   settings.sync();
}


unsigned int Settings::land() {
    qDebug() << "Get index of land";
    return m_land;
}
void Settings::setLand(unsigned int index) {
//    QSettings settings(m_orgName, m_appName);
//    settings.setValue("settings/land", index);
    m_land = index;
    qDebug() << "index of land is now: " << index;
}

unsigned int Settings::year() {
    qDebug() << "Get index of year";
    return m_year;
}
void Settings::setYear(unsigned int index) {
//    QSettings settings(m_orgName, m_appName);
//    settings.setValue("settings/year", index);
    m_year = index;
    qDebug() << "index of year is now: " << index;

}

unsigned int Settings::type() {
    qDebug() << "Get index of type";
    return m_type;
}
void Settings::setType(unsigned int index) {
//    QSettings settings(m_orgName, m_appName);
//    settings.setValue("settings/type", index);
    m_type = index;
    qDebug() << "index of type is now: " << index;
}

Settings::~Settings() {}
