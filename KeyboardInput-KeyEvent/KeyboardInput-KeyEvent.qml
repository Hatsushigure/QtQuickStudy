import QtQuick

Window {
	width: 640; height: 480
	visible: true
	title: "KeyboardInput-KeyEvent"

	Rectangle {
		anchors.fill: parent
		color: "#c5d5d2"

		Rectangle {
			id: smallBlock
			width: 80; height: 80
			color: "#44c468"
			x: 200; y: 150
			radius: 16

			Behavior on x {

				NumberAnimation {
					property: "x"
					duration: 200
					easing.type: Easing.OutQuad
				}
			}
		}

		//Keys 用于接受和处理键盘事件
	}
}
