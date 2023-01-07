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
			focus: true	//只有拥有焦点才可以接受键盘事件

			//一点动画，可以忽略
			Behavior on x {NumberAnimation {duration: 250;easing.type: Easing.InOutQuad}}
			Behavior on y {NumberAnimation {duration: 250;easing.type: Easing.InOutQuad}}
			Behavior on scale {NumberAnimation { easing.overshoot: 5; easing.type: Easing.OutBack}}

			//Keys 用于接受和处理键盘事件
			Keys.onLeftPressed: x -= 50	//这些为预置的事件处理程序
			Keys.onRightPressed: x += 50
			Keys.onUpPressed: y -= 50
			Keys.onDownPressed: y += 50

			Keys.onPressed: (event)=>{	//也可以自己写事件处理程序
								switch (event.key) {
									case Qt.Key_Plus: {
										scale += 0.1;
										break;
									}
									case Qt.Key_Minus: {
										scale -= 0.1;
										break;
									}
								}
							}
		}
	}
}
