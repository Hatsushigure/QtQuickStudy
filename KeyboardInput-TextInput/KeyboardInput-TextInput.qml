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
			id: textInput2
			width: parent.width; height: 20
			anchors.top: textInput1.bottom
			border.width: 1; border.color: "lightgreen"
			text: "Colored Text"
			color: "green"//指定颜色
			font.bold: true; font.pointSize: 12	//字体属性，以此为例
		}

		MyFramedTextInput {
			id: textInput3
			width: parent.width; height: 20
			border.width: 1
			validator: DoubleValidator {}	//用 validator属性规定输入格式, 可选 IntValidator, DoubleValidator, RegularExpressionValidator
			anchors.top: textInput2.bottom
		}

		MyFramedTextInput {
			id: textInput4
			width: parent.width; height: 20
			border.width: 1
			inputMask: ">AAAAA-AAAAA-AAAAA-AAAAA-AAAAA;#"	//相当于更加高级的 validator
			anchors.top: textInput3.bottom
		}

		MyFramedTextInput {
			id: textInput5
			width: parent.width; height: 20
			border.width: 1
			anchors.top: textInput4.bottom
			echoMode: TextInput.PasswordEchoOnEdit	//指定输入的显示方式，可用于输入密码, 可选 TextInput.Normal, TextInput.Password, TextInput.NoEcho, TextInput.PasswordEchoOnEdit
		}
	}
}
