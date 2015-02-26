#ifndef FREILISTMODEL_HPP_
#define FREILISTMODEL_HPP_

#include <QAbstractListModel>
#include <QVariant>
#include <QList>
#include <QStringList>
#include <QString>
#include <QDate>

class FreiEvent
{
public:
    QString eventName;
    QString eventDate;
    QDate eventQDate;

    FreiEvent();
    FreiEvent(QString event, QString date);
    bool operator<(const FreiEvent &passedItem) const;

    ~FreiEvent();
};


class FreiListModel : public QAbstractListModel
{
    Q_OBJECT

    enum ModelRoles {
        EventRole = Qt::UserRole + 1,
        DateRole = Qt::UserRole +2
    };

public:
    FreiListModel();

    QHash<int, QByteArray> roles;

    //overwritten functions
    int rowCount(const QModelIndex &parent) const;
    QVariant data(const QModelIndex &parent, int role=Qt::DisplayRole) const;
    QHash<int, QByteArray> roleNames() const;

    //self written functions
    Q_INVOKABLE void resetModel();
    Q_INVOKABLE QStringList getResult(int index);
    Q_INVOKABLE int countRows();

    void sort();
    void addEvent(QString event, QString date);
    void printInfo();

    ~FreiListModel();

private:
    QList<FreiEvent> resultList;

};
#endif /* FREILISTMODEL_HPP_ */
