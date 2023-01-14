import QtQuick

Window {
	width: 640; height: 480
	visible: true
	title: "AnchorsLayout"

	//left, right, top, buttom 等比较简单，略去

	Rectangle {
		id: root
		anchors.fill: parent

		Rectangle {
			id: rect1
			color: "#2fe07c"
			anchors.left: parent.left; anchors.verticalCenter: parent.verticalCenter; anchors.leftMargin: 10;
			width: 100; height: 100
		}

		Rectangle {
			width: 40; height: 40
			color: "#e028d1"
			anchors.baseline: rect1.top	//当所选对象为非文本时, baseline 与 top 重合
			anchors.horizontalCenter: rect1.horizontalCenter
		}

		Rectangle {
			id: rect2
			color: "#53afd3"
			anchors.right: parent.right; anchors.verticalCenter: parent.verticalCenter; anchors.rightMargin: 10
			width: 100; height: 100
		}

		Text {
			text: "你是一个一个一个文本哼哼哼啊啊啊啊啊"
			color: "#d933d3"
			font.pointSize: 10
			anchors.baseline: rect2.top	//文本基准线
			anchors.horizontalCenter: rect2.horizontalCenter
		}

		Rectangle {
			id: rect3
			color: "#c02594"
			anchors.centerIn: parent
			width: 120; height: 120
		}

		Rectangle {
			width: 40; height: 40
			color: "#ddff00"
			anchors.centerIn: rect3
			anchors.horizontalCenterOffset: -20; anchors.verticalCenterOffset: 30	//可用 Offset更改对其位置, 右下为正
		}
	}
}
