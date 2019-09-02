#include "datastore.h"
#include <QTcpSocket>
#include <QDebug>
#include <QString>
#include <QHostInfo>
#include <QVariant> //strings and conversion
#include <QUrl>
#include <QBluetoothSocket> // dont forget QT += bluetooth on .pro file
#include <QSerialPort> // don't forget QT += serialport add to .pro file

// class constructor
DataStore::DataStore()
{

}

/*
 *
 * QSerialPort serialPort;
    QString serialPortName = argumentList.at(1);
    serialPort.setPortName(serialPortName);

    int serialPortBaudRate = (argumentCount > 2) ? argumentList.at(2).toInt() : QSerialPort::Baud9600;
    serialPort.setBaudRate(serialPortBaudRate);

    if (!serialPort.open(QIODevice::ReadOnly)) {
        standardOutput << QObject::tr("Failed to open port %1, error: %2").arg(serialPortName).arg(serialPort.errorString()) << endl;
        return 1;
    }
 *
 * */


QString DataStore::call_serial_port_IsOpen( QString index ) {
    qDebug() << " C++: DataStore::call_serial_port_IsOpen using COMM port index: " << index ;
    const auto infos = QSerialPortInfo::availablePorts();
        qDebug() << " C++: DataStore::call_serial_port_IsOpen()" ;
        //QString s;
        int count = 0;
        QString t;
        for (const QSerialPortInfo &info : infos) {
            /*s = QObject::tr(" Port: ") + info.portName()+ "\n"
                        + QObject::tr("Location: ") + info.systemLocation() + "\n"
                        + QObject::tr("Description: ") + info.description() + "\n"
                        + QObject::tr("Manufacturer: ") + info.manufacturer() + "\n"
                        + QObject::tr("Serial number: ") + info.serialNumber() + "\n"
                        + QObject::tr("Vendor Identifier: ") + (info.hasVendorIdentifier() ? QString::number(info.vendorIdentifier(), 16) : QString()) + "\n"
                        + QObject::tr("Product Identifier: ") + (info.hasProductIdentifier() ? QString::number(info.productIdentifier(), 16) : QString()) + "\n"
                        + QObject::tr("Busy: ") + (info.isBusy() ? QObject::tr("Yes") : QObject::tr("No")) + "\n";
            qDebug() << " s-> " << s;

            t +="\t";
            t +=s;
            qDebug() << " t-> " << t; */
            //int i = 42;
            //QString s = QString::number(i);
            //t = QString::number(count);
        if ( count == index.toInt() ) {// is the index port info that was asked for, return the string of info
            // Example use open QSerialPort
            QSerialPort serial;
            serial.setPort(info);
            if (serial.open(QIODevice::ReadWrite)) {
                qDebug() << "call_serial_port_IsOpen() Serial Port OK"; //serial.close(); // close it
                return ""; }
            else {
                qDebug() << "call_serial_port_IsOpen() Serial Port ERROR";
                 return "Port CLOSED";
            } // end infos QSerialPortInfo::availablePorts();
        }
        count +=1;
    }
    // return empty string if port is open - no error, if closed or not open send back CLOSED ? string
}


QString DataStore::call_serial_port_init( QString InitSerPortIndex )
{
    qDebug() << " C++: DataStore::call_serial_port_init using COMM port index: " << InitSerPortIndex ;
    const auto infos = QSerialPortInfo::availablePorts();
        //qDebug() << " C++: DataStore::call_serial_port_init " ;
        //QString s;
        int count = 0;
        QString t;
        for (const QSerialPortInfo &info : infos) {
            /*s = QObject::tr(" Port: ") + info.portName()+ "\n"
                        + QObject::tr("Location: ") + info.systemLocation() + "\n"
                        + QObject::tr("Description: ") + info.description() + "\n"
                        + QObject::tr("Manufacturer: ") + info.manufacturer() + "\n"
                        + QObject::tr("Serial number: ") + info.serialNumber() + "\n"
                        + QObject::tr("Vendor Identifier: ") + (info.hasVendorIdentifier() ? QString::number(info.vendorIdentifier(), 16) : QString()) + "\n"
                        + QObject::tr("Product Identifier: ") + (info.hasProductIdentifier() ? QString::number(info.productIdentifier(), 16) : QString()) + "\n"
                        + QObject::tr("Busy: ") + (info.isBusy() ? QObject::tr("Yes") : QObject::tr("No")) + "\n";
            qDebug() << " s-> " << s;

            t +="\t";
            t +=s;
            qDebug() << " t-> " << t; */
            //int i = 42;
            //QString s = QString::number(i);
            //t = QString::number(count);
        if ( count == InitSerPortIndex.toInt() ) {// is the index port info that was asked for, return the string of info
            t = QObject::tr(" PortName: ") + info.portName()+ "  PortDevPath:"+ info.systemLocation() ;
            qDebug() << " C++: DataStore::call_serial_port_init "<<t ;
            // Example use open QSerialPort
            QSerialPort serial;
            serial.setPort(info);
            if (serial.open(QIODevice::ReadWrite))
                serial.close();
        } // end infos QSerialPortInfo::availablePorts();
        count +=1;
       }

    return ""; // return port if inited Ok or else empty QString
}


QString DataStore::call_total_serial_ports( void ) // returns number of ports a s a string
{
    // return a QString with enumerated serial ports returned by QSerialPortInfo::availablePorts()
    const auto infos = QSerialPortInfo::availablePorts();
        qDebug() << " C++: DataStore::call_total_serial_ports()" ;
        //QString s;
        int count = 0;
        QString t;
        for (const QSerialPortInfo &info : infos) {
            /*s = QObject::tr(" Port: ") + info.portName()+ "\n"
                        + QObject::tr("Location: ") + info.systemLocation() + "\n"
                        + QObject::tr("Description: ") + info.description() + "\n"
                        + QObject::tr("Manufacturer: ") + info.manufacturer() + "\n"
                        + QObject::tr("Serial number: ") + info.serialNumber() + "\n"
                        + QObject::tr("Vendor Identifier: ") + (info.hasVendorIdentifier() ? QString::number(info.vendorIdentifier(), 16) : QString()) + "\n"
                        + QObject::tr("Product Identifier: ") + (info.hasProductIdentifier() ? QString::number(info.productIdentifier(), 16) : QString()) + "\n"
                        + QObject::tr("Busy: ") + (info.isBusy() ? QObject::tr("Yes") : QObject::tr("No")) + "\n";
            qDebug() << " s-> " << s;
            t +="\t";
            t +=s;
            qDebug() << " t-> " << t; */
            //int i = 42;
            //QString s = QString::number(i);

            count +=1;
            t = QString::number(count);
            }
        qDebug() << "DataStore::call_total_serial_ports() TOTALserPorts " << count;
        return t;
}


QString DataStore::call_get_serial_port_name( QString index ) // "Location in info" info.systemLocation()
{
    // return a QString with enumerated serial ports returned by QSerialPortInfo::availablePorts()
    const auto infos = QSerialPortInfo::availablePorts();
        qDebug() << " C++: DataStore::call_RS232_FromQml call_get_serial_port_info(Qstring index):" << index ;
        int count = 0;
        QString s;
        for (const QSerialPortInfo &info : infos) {
            s = QObject::tr("") + info.systemLocation(); // + "\n";
            /*s = QObject::tr(" Port: ") + info.portName()+ "\n"
                        + QObject::tr("Location: ") + info.systemLocation() + "\n"
                        + QObject::tr("Description: ") + info.description() + "\n"
                        + QObject::tr("Manufacturer: ") + info.manufacturer() + "\n"
                        + QObject::tr("Serial number: ") + info.serialNumber() + "\n"
                        + QObject::tr("Vendor Identifier: ") + (info.hasVendorIdentifier() ? QString::number(info.vendorIdentifier(), 16) : QString()) + "\n"
                        + QObject::tr("Product Identifier: ") + (info.hasProductIdentifier() ? QString::number(info.productIdentifier(), 16) : QString()) + "\n"
                        + QObject::tr("Busy: ") + (info.isBusy() ? QObject::tr("Yes") : QObject::tr("No")) + "\n";
            qDebug() << " portinfo-> " << s; */
            //t +="\t";
            //t +=s;
            //qDebug() << " t-> " << t;
            //count +=1;
            //t = QString::number(count);


            if ( count == index.toInt() ) // is the index port info that was asked for, return the string of info
                return s;
            count +=1;
            }
        return ""; // return blank string if no match
}

QString DataStore::call_get_serial_port_info( QString index )
{
    // return a QString with enumerated serial ports returned by QSerialPortInfo::availablePorts()
    const auto infos = QSerialPortInfo::availablePorts();
        qDebug() << " C++: DataStore::call_RS232_FromQml call_get_serial_port_info(Qstring index):" << index ;
        int count = 0;
        QString s;
        for (const QSerialPortInfo &info : infos) {
            s = QObject::tr(" Port: ") + info.portName()+ "\n"
                        + QObject::tr("Location: ") + info.systemLocation() + "\n"
                        + QObject::tr("Description: ") + info.description() + "\n"
                        + QObject::tr("Manufacturer: ") + info.manufacturer() + "\n"
                        + QObject::tr("Serial number: ") + info.serialNumber() + "\n"
                        + QObject::tr("Vendor Identifier: ") + (info.hasVendorIdentifier() ? QString::number(info.vendorIdentifier(), 16) : QString()) + "\n"
                        + QObject::tr("Product Identifier: ") + (info.hasProductIdentifier() ? QString::number(info.productIdentifier(), 16) : QString()) + "\n"
                        + QObject::tr("Busy: ") + (info.isBusy() ? QObject::tr("Yes") : QObject::tr("No")) + "\n";
            qDebug() << " portinfo-> " << s;
            if ( count == index.toInt() ) // is the index port info that was asked for, return the string of info
                return s;
            count +=1;
            }
        return "";
}


QString DataStore::call_enumerate_serial_ports()
{
    // return a QString with enumerated serial ports returned by QSerialPortInfo::availablePorts()
    const auto infos = QSerialPortInfo::availablePorts();
        qDebug() << " C++: DataStore::call_RS232_FromQml Enumerate COMM ports:" ;
        QString s;
        QString t;
        for (const QSerialPortInfo &info : infos) {
            s = QObject::tr(" Port: ") + info.portName()+ "\n"
                        + QObject::tr("Location: ") + info.systemLocation() + "\n"
                        + QObject::tr("Description: ") + info.description() + "\n"
                        + QObject::tr("Manufacturer: ") + info.manufacturer() + "\n"
                        + QObject::tr("Serial number: ") + info.serialNumber() + "\n"
                        + QObject::tr("Vendor Identifier: ") + (info.hasVendorIdentifier() ? QString::number(info.vendorIdentifier(), 16) : QString()) + "\n"
                        + QObject::tr("Product Identifier: ") + (info.hasProductIdentifier() ? QString::number(info.productIdentifier(), 16) : QString()) + "\n"
                        + QObject::tr("Busy: ") + (info.isBusy() ? QObject::tr("Yes") : QObject::tr("No")) + "\n";
            qDebug() << " s-> " << s;
            t +="\t";
            t +=s;
            qDebug() << " t-> " << t;
            }
        qDebug() << "->ALL " << t;
        return t;
}


QString DataStore::call_RS232_FromQml(QString index, QString val, QString host, QString port)
{   // send data out id port serial
    qDebug(" C++: DataStore::call_RS232_FromQml (id:"+ index.toLatin1() + " valstr):" + val.toLatin1() + " valint:" + val.toLocal8Bit() );
    qDebug() << " C++: DataStore::call_RS232_FromQml host() = " << host; // is always 0.0.0.0 for now unless relaying then ip of remote host
    qDebug() << " C++: DataStore::call_RS232_FromQml port() = " << port;
    int count = 0;
    QString t;
    const auto infos = QSerialPortInfo::availablePorts();
    for (const QSerialPortInfo &info : infos) {
        /*s = QObject::tr(" Port: ") + info.portName()+ "\n"
                    + QObject::tr("Location: ") + info.systemLocation() + "\n"
                    + QObject::tr("Description: ") + info.description() + "\n"
                    + QObject::tr("Manufacturer: ") + info.manufacturer() + "\n"
                    + QObject::tr("Serial number: ") + info.serialNumber() + "\n"
                    + QObject::tr("Vendor Identifier: ") + (info.hasVendorIdentifier() ? QString::number(info.vendorIdentifier(), 16) : QString()) + "\n"
                    + QObject::tr("Product Identifier: ") + (info.hasProductIdentifier() ? QString::number(info.productIdentifier(), 16) : QString()) + "\n"
                    + QObject::tr("Busy: ") + (info.isBusy() ? QObject::tr("Yes") : QObject::tr("No")) + "\n";
        qDebug() << " s-> " << s;

        t +="\t";
        t +=s;
        qDebug() << " t-> " << t; */
        //int i = 42;
        //QString s = QString::number(i);
        //t = QString::number(count);



    if ( count == index.toInt() ) {// is the index port info that was asked for, return the string of info
        // format data na send
            char bankID = 0xB0; /// bank x=0 $Bx
            int length=0, length2=0;
            // Byte 1 hex 80 - hex FF = Channels 1 - 128  Byte 2:  Channel Level Character: x00-x7F -75db to +20.25db
            char channel = 0x2A; //chan0 =x80 chan128=xFF
            // add the channel
            /*QString str1="1005",str2="1006";
            if(str1.compare(str2)==0)
            {
                qDebug(" C++: true");
                //return true;
            }*/

            char level = 0xFF;   //val.toLocal8Bit(); //0xFF; // 0x00; //min 0x00 max 0x7F
            QByteArray data("   "); //3 chars are the message byte0
            /*VCM-88 RS-232 Protocol

            Port Settings:  9600bps, 8 data bits, no parity, 1 stop bit, no flow control

            Message Format: $Bn  $xx  $yy               ($ denotes Hexadecimal)
            n = device id (based on units' bank select jumpers - refer to page 10 of manual)
            xx = control number: $2A-$31 = VCM-88 channels 1-8 respectively
            yy = channel level (below in Hexadecimal format)

            ex) To set Channel-2, of  a VCM-88 assigned to Bank/Device-0, to 0dB transmit: $B0 $2B $64
             * */

            float a = QVariant(val).toFloat();
            QString num="123";
            int n = QVariant(a).toInt(); //num.toInt();
            int c =  QVariant(index).toUInt();
            channel += c;
            level = n;

            data[0] = bankID;
            data[1] =+ channel;
            data[2] = level;//val.toAscii().data();//level; //number(val[0]);  //)level; //val.toShort();//); //(val, 10); //val)*10;  //number(val)*100; //data[1] = level;
            qDebug("bankID:%d" , bankID);
            qDebug("channel:%d" ,channel);
            qDebug("level:%d"   ,level);
            qDebug() << " C++: QHostInfo::localHostName() = " << QHostInfo::localHostName();

        // Example use open QSerialPort
      QSerialPort serial;
        serial.setPort(info);
        if (serial.open(QIODevice::ReadWrite)) {
            qDebug() << "call_RS232_FromQml() Serial Port SEND OK"; //serial.close(); // close it
            // send data
            //serial.write(data);
            return ""; }
        else {
            qDebug() << "call_RS232_FromQml() Serial Port SEND ERROR";
             return "Port CLOSED";
        } // end infos QSerialPortInfo::availablePorts();

    } // infos for loop
    count +=1;
} //infos for loop
// return empty string if port is open - no error, if closed or not open send back CLOSED ? string


    /*// enumerate the ports available
    const auto infos = QSerialPortInfo::availablePorts();
        qDebug() << " C++: DataStore::call_RS232_FromQml Enumerate COMM ports:" ;
        for (const QSerialPortInfo &info : infos) {
            QString s = QObject::tr("Port: ") + info.portName() + "\n"
                        + QObject::tr("Location: ") + info.systemLocation() + "\n"
                        + QObject::tr("Description: ") + info.description() + "\n"
                        + QObject::tr("Manufacturer: ") + info.manufacturer() + "\n"
                        + QObject::tr("Serial number: ") + info.serialNumber() + "\n"
                        + QObject::tr("Vendor Identifier: ") + (info.hasVendorIdentifier() ? QString::number(info.vendorIdentifier(), 16) : QString()) + "\n"
                        + QObject::tr("Product Identifier: ") + (info.hasProductIdentifier() ? QString::number(info.productIdentifier(), 16) : QString()) + "\n"
                        + QObject::tr("Busy: ") + (info.isBusy() ? QObject::tr("Yes") : QObject::tr("No")) + "\n";
            qDebug() << "-> " << s;
            }*/
        QString r="";
         return r;
} // end call_RS232_FromQML()


void DataStore::call_TCP_FromQml(QString id, QString val, QString host, QString port)
{
    qDebug(" C++: DataStore::callMeFromQml (id:"+ id.toLatin1() + " valstr):" + val.toLatin1() + " valint:" + val.toLocal8Bit() );

    //qDebug(" C++: DataStore::callMeFromQml host, port: ",host, " ", port );
    qDebug() << " C++: DataStore::callMeFromQml host() = " << host;
    qDebug() << " C++: DataStore::callMeFromQml port() = " << port;

    char bankID = 0xB0; /// bank x=0 $Bx
    int length=0, length2=0;
    // Byte 1 hex 80 - hex FF = Channels 1 - 128  Byte 2:  Channel Level Character: x00-x7F -75db to +20.25db
    char channel = 0x2A; //chan0 =x80 chan128=xFF
    // add the channel
    /*QString str1="1005",str2="1006";
    if(str1.compare(str2)==0)
    {
        qDebug(" C++: true");
        //return true;
    }*/

    char level = 0xFF;   //val.toLocal8Bit(); //0xFF; // 0x00; //min 0x00 max 0x7F
    QByteArray data("   "); //3 chars are the message byte0
    /*VCM-88 RS-232 Protocol

    Port Settings:  9600bps, 8 data bits, no parity, 1 stop bit, no flow control

    Message Format: $Bn  $xx  $yy               ($ denotes Hexadecimal)
    n = device id (based on units' bank select jumpers - refer to page 10 of manual)
    xx = control number: $2A-$31 = VCM-88 channels 1-8 respectively
    yy = channel level (below in Hexadecimal format)

    ex) To set Channel-2, of  a VCM-88 assigned to Bank/Device-0, to 0dB transmit: $B0 $2B $64

     *
     *
     * */
    //data[0] = channel;
    //data[1] = level;//val.toAscii().data();//level; //number(val[0]);  //)level; //val.toShort();//); //(val, 10); //val)*10;  //number(val)*100; //data[1] = level;

    //QString num="123";
    //int n = val.toInt();

    float a = QVariant(val).toFloat();
    QString num="123";
    int n = QVariant(a).toInt(); //num.toInt();
    int c =  QVariant(id).toUInt();
    //qDebug("realval a:%f" , a);
   // qDebug("realval n:%d" , n);
    channel += c;
    level = n;

    /*
    * Message Format: $Bn  $xx  $yy               ($ denotes Hexadecimal)
    n = device id (based on units' bank select jumpers - refer to page 10 of manual)
    xx = control number: $2A-$31 = VCM-88 channels 1-8 respectively
    yy = channel level (below in Hexadecimal format)
    */
    data[0] = bankID;
    data[1] =+ channel;
    data[2] = level;//val.toAscii().data();//level; //number(val[0]);  //)level; //val.toShort();//); //(val, 10); //val)*10;  //number(val)*100; //data[1] = level;
    qDebug("bankID:%d" , bankID);
    qDebug("channel:%d" ,channel);
    qDebug("level:%d"   ,level);
    qDebug() << " C++: QHostInfo::localHostName() = " << QHostInfo::localHostName();

    // open tcp port and send the data
    QTcpSocket tcpSocket;
    //tcpSocket.connectToHost(host, parseInt(port) ); //tcpSocket.connectToHost("192.168.1.2", 2000);
    tcpSocket.connectToHost(QHostAddress(host), port.toShort() );
    if (tcpSocket.isOpen ()) {

    }

    /*
     * length = tcpSocket.write(data);
        length2 = tcpSocket.waitForBytesWritten();
        qDebug(" C++: len:%d %d",length, length2);
        tcpSocket.disconnectFromHost(); //close socket
        */
    if (tcpSocket.isOpen ())
       qDebug("C++: Socket opened");
    else
       qDebug("C++: Socket error: not opened");
    // send data to socekt here
    if (channel == 50) { // master slider 0-1 multiplied against 8 messages from the 8 sliders, mute =00 message anyway if mute all 8 always sent

        // don't send any message to vcm-88 device, if master, it has no number
        qDebug(" C++: Chan=50 no datat sent master bankID channel level: %d %d %d" , bankID , channel, level);
        // send upto 8 messages 1 for each vca channel if ON 1-8

    }
    else
    {
        //qDebug(" C++: data0 data1 data2: %d %d %d" , data[0] , data[1], data[2]);
        qDebug(" C++: data0 data1 data2: %d %d %d" , bankID , channel, level);
        length = tcpSocket.write(data);
        length2 = tcpSocket.waitForBytesWritten(); // before closing socket
        qDebug(" C++: write msg length: %d msg sent: %d ",length, length2);
        tcpSocket.disconnectFromHost(); //close socket
        qDebug("\n");
    }


} // end call_TCP_FromQML()


void DataStore::call_BT_FromQml(QString id, QString val, QString host, QString port)
{
    qDebug(" C++: DataStore::call_BT_FromQML (id:"+ id.toLatin1() + " valstr):" + val.toLatin1() + " valint:" + val.toLocal8Bit() );
} // end call_BT_FromQML()

/*void DataStore::callNETWORKFromQml(QString host, QString port)
{
    //qDebug(" C++: IP Host: %s",  host);
    //qDebug(" C++: IP Port: %s" , port);
    QUrl url("http://127.0.0.1:2000"); // local network loopback
    qDebug() << " C++: url.host() = " << url.host();
    qDebug() << " C++: url.port() = " << url.port();
    //qDebug( " C++: IP Host: ");
    //qDebug( url.host() );
    //qDebug( " C++: IP Port: %d ", url.port() );
    //
    //
    qDebug() << " C++: QHostInfo::localHostName() = " << QHostInfo::localHostName();
    //
}*/

//------------------------------------------------------ END ----------------------------------------
/* ASHLY VCM-88 RS232 DB9 9600 8-1-N or MIDI 31250 baud
 * Baud rate: 9600 bps
Start bit: logical 0 (current on)
Stop bit: logical 1 (current off)
Byte 1:  Channel ID Character:
hex 80 - hex FF = Channels 1 - 128
Byte 2:  Channel Level Character:
hex 7F = full on = +20.25dB
hex 64 = unity gain = 0dB
hex 00 = off = -75dB
(step size = 0.75dB)

 * */
/*
 * QHostInfo HI;
QHostAddress HA("192.168.1.1");
QList<QHostAddress> List;
List.append(HA);
HI.setAddresses(List);
ui->ledHostname->setText(HI.hostName());
*/
