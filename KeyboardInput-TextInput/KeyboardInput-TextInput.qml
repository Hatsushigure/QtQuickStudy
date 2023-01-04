import QtQuick

Window {
	width: 640; height: 480
	visible: true
	title: "KeyboardInput-TextInput"

	Rectangle {
		anchors.fill: parent

		//基本运用
		MyFramedTextInput {
			id: textInput1
			width: parent.width; height: 20
			border.width: 1
			text: "Text Input 1"	//指定预先显示的文本
		}

		MyFramedTextInput {
			width: parent.width; height: 20
			anchors.top: textInput1.bottom
			border.width: 1
			text: "Colored Text"
			color: "green"//指定颜色
			font.bold: true; font.pointSize: 12	//字体属性，以此为例
		}
	}
}
