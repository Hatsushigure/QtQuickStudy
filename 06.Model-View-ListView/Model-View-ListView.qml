import QtQuick

Window {
	width: 640; height: 480
	visible: true
	title: "Model-View-ListView"

	ListView {	//有缓冲区, 不会一次性创建所有对象; 可以滚动, 没有滚动条
		id: list1
		anchors.left: parent.left
		width: parent.width / 2; height: parent.height
		//orientation: ListView.Horizontal	//指定水平还是竖直
		//layoutDirection: Qt.LeftToRight	//排列方向
		model: 100
		clip: true	//切割超出边界的项目, 隐藏动态创建和销毁的过程
		spacing: 4	//元素间距(为什么没有补全?)
		leftMargin: 8; rightMargin: 8; topMargin: 8; bottomMargin: 8
		cacheBuffer: 90	//缓冲区(高度)

		delegate: Rectangle {
			width: list1.width - list1.leftMargin - list1.rightMargin; height: 50
			color: "#0ef116"
			border.color: Qt.lighter(color)
			radius: 8

			Text {
				anchors.fill: parent
				horizontalAlignment: Text.AlignHCenter
				verticalAlignment: Text.AlignVCenter
				text: model.index
			}
		}
	}
	ListView {	//有缓冲区, 不会一次性创建所有对象; 可以滚动, 没有滚动条
		id: list2
		anchors.right: parent.right
		width: parent.width / 2; height: parent.height
		model: 100
		clip: true	//切割超出边界的项目, 隐藏动态创建和销毁的过程
		spacing: 4	//元素间距(为什么没有补全?)
		leftMargin: 8; rightMargin: 8; topMargin: 8; bottomMargin: 8
		delegate: Rectangle {
			width: list2.width - list2.leftMargin - list2.rightMargin; height: 50
			color: "transparent"
			radius: 8
			border.color: "#8d8c8c"

			Text {
				anchors.fill: parent
				horizontalAlignment: Text.AlignHCenter
				verticalAlignment: Text.AlignVCenter
				text: model.index
			}
		}
		focus: true
		highlight:
			Rectangle {	//此组件位于 delegate 下一层
			id: highlighter
			width: list1.width - list1.leftMargin - list1.rightMargin; height: 50
			y: parent.currentItem.y
			color: "#0ef116"
			border.color: Qt.lighter(color)
			radius: 8
		}
	}
}
