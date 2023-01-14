//带边框的文本编辑
import QtQuick

TextInput {
	property alias border: frameProvider.border

	id: root

	Rectangle {
		id: frameProvider
		color: "transparent"
		anchors.fill: parent
	}
}
