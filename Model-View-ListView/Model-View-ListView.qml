import QtQuick

Window {
	width: 640; height: 480
	visible: true
	title: "Model-View-ListView"

	ListView {	//有缓冲区, 不会一次性创建所有对象; 可以滚动, 没有滚动条
		anchors.centerIn: parent
		width: 80; height: 200
		//orientation: ListView.Horizontal	//指定水平还是竖直
		//layoutDirection: Qt.LeftToRight	//排列方向
		model: 100
		clip: true	//切割超出边界的项目, 隐藏动态创建和销毁的过程
		spacing: 4	//元素间距(为什么没有补全?)
		cacheBuffer: 90	//缓冲区(高度)

		delegate: Rectangle {
			width: 50; height: 50
			color: "#0ef116"
			border.color: Qt.lighter(color)

			Text {
				anchors.fill: parent
				horizontalAlignment: Text.AlignHCenter
				verticalAlignment: Text.AlignVCenter
				text: model.index
			}
		}
	}
}
