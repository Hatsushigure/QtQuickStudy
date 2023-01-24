//可以在项目选项卡中的 Build Environment 添加 QT_FILE_SELECTORS 环境变量
//并将其值设置为 android 来启用移动版界面
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QFileSelector>
#include <QQuickStyle>

int main(int argc, char *argv[])
{
	QGuiApplication app(argc, argv);
	QQmlApplicationEngine engine;
	QFileSelector selector;

	const QUrl url(selector.select("Application-ShareCommonCode/ImageViewerWindow.qml"));

	if (url.toString().contains("+android"))
	{
		QQuickStyle::setStyle("Material");
	}

	QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
					 &app, [url](QObject *obj, const QUrl &objUrl) {
		if (!obj && url == objUrl)
			QCoreApplication::exit(-1);
	}, Qt::QueuedConnection);
	engine.load(url);

	return app.exec();
}
