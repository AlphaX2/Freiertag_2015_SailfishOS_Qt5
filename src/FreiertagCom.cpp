#include "FreiertagCom.hpp"
#include "FreiListModel.hpp"

#include <QStringList>
#include <QStringRef>
#include <QFile>

#include <QDebug>


// class constructor
FreiertagCom::FreiertagCom(FreiListModel *model)
    : m_model(model)
{
}

bool FreiertagCom::suche(QString bland, QString jahr, QString typ)
{
	qDebug() << bland;
	qDebug() << jahr;
    qDebug() << typ;

    //delete all data from model
    m_model->resetModel();

	if(typ == "Schulferien")
	{
		qDebug() << "Suche Ferien!";
        QString path = QString("%1data/%2/ferien/Ferien_%3_%2.ics").arg("/usr/share/harbour-freiertag/").arg(jahr).arg(bland);
        qDebug() << "Try to open: " << path;
        this->parser(path, bland);
        return true;
	}
    else if(typ == "gesetzliche Feiertage")
	{
		qDebug() << "Suche gesetzliche Feiertage";
        QString path = QString("%1data/%2/feiertage/Feiertage_%3_%2.ics").arg("/usr/share/harbour-freiertag/").arg(jahr).arg(bland);
        qDebug() << "Try to open: " << path;
        this->parser(path, QString(""));
        return true;
	}
    else if(typ == "alle Feiertage")
	{
		qDebug() << "Suche alle Feiertage";
        QString path = QString("%1data/%2/feiertage/Feiertage_%2.ics").arg("/usr/share/harbour-freiertag/").arg(jahr);
        qDebug() << "Try to open: " << path;
        this->parser(path, QString(""));
        return true;
	}
    else
    {
        return false;
    }
}


bool FreiertagCom::parser(const QString &path, const QString &bland)
{
    qDebug() << "In der parser() Funktion!";


	QFile file(path);
	if(file.open(QIODevice::ReadOnly))
	{
		QTextStream in(&file);

        // Variablen werden in der while Schleife befüllt.
        QString event_name;

		QString start_date;
		QString end_date;

		// Fertiges von : bis Datum
		QString final_date;

		while(!in.atEnd())
		{
            // Aus dem File eingelesene Zeile
            QString line = in.readLine();

			if(line.startsWith("SUMMARY:"))
            {
                qDebug() << "Summary gefunden!";
                /*
				 * In den ICS Files starten die Termine mit "SUMMARY:" was 8 Zeichen
				 * ausmacht, darauf folgen die Namen der Termine und nochmals der Name
				 * des Bundeslandes, deswegen wird hier ein Substring gebildet der
				 * nach dem Doppelpunkt beginnt und soweit geht, dass das Bundesland
				 * nicht mit geparsed wird.
                 */
				QString summary = line.mid(8);
                if(bland != "")
                {
                    summary = line.mid(8, (summary.length()-bland.length()));
                    event_name = summary;
                }
                else
                {
                    qDebug() << "summary @ parser in else loop";
                    qDebug() << summary;
                    summary = line.mid(8, summary.length());
                    event_name = summary;
                }
			}

			else if(line.startsWith("DTSTART;VALUE=DATE:"))
			{
				QString date_start = line.mid(19, 27);

				QString ds = date_start.mid(6);
				QString ms = date_start.mid(4, 2);
				QString ys = date_start.mid(0, 4);

				start_date = QString("%1.%2.%3").arg(ds).arg(ms).arg(ys);
			}

			else if(line.startsWith("DTEND;VALUE=DATE:"))
			{
				QString date_end = line.mid(17, 25);

				QString de = date_end.mid(6);
				QString me = date_end.mid(4, 2);
				QString ye = date_end.mid(0, 4);

                end_date = QString("%4.%5.%6").arg(de).arg(me).arg(ye);

                // if not "" it means school holidays, with start/end
                if(bland != "")
                {
                    final_date = start_date+" - "+end_date;
                }
                else
                {
                    final_date = start_date;
                }                
                m_model->addEvent(event_name, final_date);
            }
        }
        // just sort non school holidays
        if(bland == "") {
            m_model->sort();
        }
        emit parserFinished();
        return true;
    }
	else
	{
		qDebug() << "Can't open file";
        return false;
    }
}

// class destructor
FreiertagCom::~FreiertagCom(void)
{
}
