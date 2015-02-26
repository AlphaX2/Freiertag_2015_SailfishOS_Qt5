#ifndef SETTINGS_H
#define SETTINGS_H

#include <QString>
#include <QVariant>
#include <QSettings>

class Settings : public QObject
{
    Q_OBJECT
    Q_PROPERTY( unsigned int p_land READ land WRITE setLand NOTIFY landChanged )
    Q_PROPERTY( unsigned int p_year READ year WRITE setYear NOTIFY yearChanged )
    Q_PROPERTY( unsigned int p_type READ type WRITE setType NOTIFY typeChanged )

public:
    Settings(QString organizationName, QString applicationName, QObject *parent = 0);

    unsigned int land();
    void setLand(unsigned int index);

    unsigned int year();
    void setYear(unsigned int index);

    unsigned int type();
    void setType(unsigned int index);

    ~Settings();

public slots:
    void loadSettings();
    void saveSettings();

signals:
    void landChanged();
    void yearChanged();
    void typeChanged();

private:
    unsigned int m_land;
    unsigned int m_year;
    unsigned int m_type;

    QString m_orgName;
    QString m_appName;
};

#endif // SETTINGS_H
