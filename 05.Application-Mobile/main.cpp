#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickStyle>

int main(int argc, char *argv[])
{
	QGuiApplication app(argc, argv);
	QQuickStyle::setStyle("Material");	//设置风格为 Material Design

	QQmlApplicationEngine engine;
	const QUrl url(u"qrc:/Application-Mobile/main.qml"_qs);
	QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
					 &app, [url](QObject *obj, const QUrl &objUrl) {
		if (!obj && url == objUrl)
			QCoreApplication::exit(-1);
	}, Qt::QueuedConnection);
	engine.load(url);

	return app.exec();
}
