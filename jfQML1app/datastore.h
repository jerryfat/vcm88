#ifndef DATASTORE_H
#define DATASTORE_H


/*class DataStore
{
public:
    DataStore();
};*/


// example from Melardev on Youtube
#include <QObject>

// include serial port enumeration via
#include <QtSerialPort/QtSerialPort> // don't forget QT += serialport add to .pro file

class DataStore : public QObject
{
        Q_OBJECT
   public:
        DataStore();
   public slots:
        void call_TCP_FromQml(QString, QString, QString, QString);// for transferring (whichslider, val) from QML
        QString call_RS232_FromQml(QString, QString, QString, QString);// for transferring (whichslider, val) from QML//void callNETWORKFromQml(QString, QString);// for transferring (whichslider, val) from QML
        void call_BT_FromQml(QString, QString, QString, QString);// for transferring (whichslider, val) from QML
        QString call_total_serial_ports(void); // return total avail serial ports as Qstring
        QString call_enumerate_serial_ports(void); // return all serial port(s) info seperated by tab
        QString call_get_serial_port_info( QString ); // return all the settings in a string
        QString call_get_serial_port_name( QString ); // return just the "Location:
        QString call_serial_port_init( QString ); // QString contains serial port index from info array to init
        QString call_serial_port_IsOpen( QString ); // returns true if opened false if not opened index into port info list
};

#endif // DATASTORE_H
