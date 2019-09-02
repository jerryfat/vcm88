#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext> // create Q_OBJECT datastore.h see Melardev on Youtube
#include "datastore.h" // create Q_OBJECT datastore.h see Melardev on Youtube
#include <QQuickStyle> // for setting overall style

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    /// Melardev example of adding an object and allowing QML to run the class
    QQmlContext* context = engine.rootContext();
    // create Q_OBJECT datastore.h see Melardev on Youtube
    DataStore dt;
    context->setContextProperty("dataStore", &dt);
    //
    // set overall style
    QQuickStyle::setStyle("Default"); // Material Universal Default = rect slider handle
    //
    //console.log("Page1.qml Qt.application.name:",Qt.application.name," Qt.application.organization:",Qt.application.organization," Qt.application.domain:",Qt.application.domain)
    //
    //qDebug("Page1.qml Qt.application.name:",Qt.application.name," Qt.application.organization:",Qt.application.organization," Qt.application.domain:",Qt.application.domain); //"\n");
    qDebug("Page1.qml Qt.application.name:");
    //qDebug(app.applicationName()); //," Qt.application.organization:",app.application.organization," Qt.application.domain:",app.application.domain); //"\n");

    //
    app.setOrganizationName("Some Company");
    app.setOrganizationDomain("somecompany.com");
    app.setApplicationName("Amazing Application");
    //qDebug("Page1.qml Qt.application.name:"); //,app.applicationName());
    //qDebug(app.applicationName());
    //

    engine.load(QUrl(QLatin1String("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
