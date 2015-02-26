#include "FreiListModel.hpp"
#include <QDate>
#include <QDebug>

// This constructor is just used to prepare the QList
FreiEvent::FreiEvent()
{
}


// Event object will hold the event and it's date
// this constructor is called in the model via addEvent()
FreiEvent::FreiEvent(QString event, QString date)
{
    eventName = QString(event);
    eventDate = QString(date);

    int day = eventDate.left(2).toInt();
    int month = eventDate.mid(3,2).toInt();
    int year = eventDate.mid(6).toInt();

    eventQDate = QDate(year, month, day);

}

bool FreiEvent::operator<(const FreiEvent &passedItem) const {

//    int pass_day = passedItem.eventDate.left(2).toInt();
//    int pass_month = passedItem.eventDate.mid(3,2).toInt();
//    int pass_year = passedItem.eventDate.mid(6).toInt();

//    int this_day = eventDate.left(2).toInt();
//    int this_month = eventDate.mid(3,2).toInt();
//    int this_year = eventDate.mid(6).toInt();

//    qDebug() << pass_day << pass_month << pass_year;
//    qDebug() << this_day << this_month << this_year;

//    QDate passed_date = QDate(pass_year, pass_month, pass_day);
//    QDate this_date = QDate(this_year, this_month, this_day);

//    return (this_date < passed_date);

    return (this->eventQDate < passedItem.eventQDate);
}


FreiEvent::~FreiEvent()
{
}


FreiListModel::FreiListModel() : QAbstractListModel()
{
    //QHash<int, QByteArray> roles;
    roles[EventRole] = "holidayEvent";
    roles[DateRole] = "holidayDate";
}

QHash<int, QByteArray> FreiListModel::roleNames() const
{
    qDebug() << "roleNames is called";
    return roles;
}

void FreiListModel::addEvent(QString event, QString date)
{
	qDebug() << "addEvent() is called";
	FreiEvent newEvent = FreiEvent(event, date);

	qDebug() << newEvent.eventName;
	qDebug() << newEvent.eventDate;

    QModelIndex index = QModelIndex();

    this->beginInsertRows(index, 0, resultList.length());
	resultList.append(newEvent);
    this->endInsertRows();
}


void FreiListModel::resetModel()
{
    this->beginResetModel();
    resultList.clear();
    this->endResetModel();
}

QStringList FreiListModel::getResult(int index)
{
    QStringList list;
    if(resultList.length() > 0)
    {
        list.append(resultList.value(index).eventDate);
        list.append(resultList.value(index).eventName);
        return list;
    }

    return list;
}

int FreiListModel::countRows()
{
    // -1 to start with 0
    return resultList.length()-1;
}


void FreiListModel::printInfo()
{
	qDebug() << "Länge der Liste: " << resultList.length();
	qDebug() << resultList.value(0).eventName;
	qDebug() << resultList.value(0).eventDate;
}


int FreiListModel::rowCount(const QModelIndex &parent = QModelIndex()) const
{
    qDebug() << "rowCount() is called";
	return resultList.length();
}


QVariant FreiListModel::data(const QModelIndex &index, int role) const
{

	qDebug() << "data() is called";

	if(index.isValid() && role==EventRole)
	{
		int i = index.row();
		return resultList.value(i).eventName;
	}
	else if(index.isValid() && role==DateRole)
	{
		int i = index.row();
		return resultList.value(i).eventDate;
	}
	else
	{
		return QVariant();
	}
}

void FreiListModel::sort() {
    qSort(resultList.begin(), resultList.end());
}


FreiListModel::~FreiListModel()
{
}
