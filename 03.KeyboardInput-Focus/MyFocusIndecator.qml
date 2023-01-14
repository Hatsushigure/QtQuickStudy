import QtQuick

Item {
	Rectangle {
		id: colorBlock
		anchors.fill:parent
		color: "green"
	}
	onFocusChanged: {
		if (focus == true) {
			colorBlock.color = "red"
		}
		else {
			colorBlock.color = "green"
		}
	}
}
