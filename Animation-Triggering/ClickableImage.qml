import QtQuick

Item {
	property alias source: image.source
	property alias text: label.text
	signal clicked

	id: root
	width: container.childrenRect.width
	height: container.childrenRect.height

	Column {
		id: container

		Image {
			id: image
		}

		Text {
			id: label
			width: image.width
			horizontalAlignment: Text.AlignHCenter
			wrapMode: Text.WordWrap
		}
	}

	MouseArea {
		anchors.fill: parent
		onClicked: root.clicked()
	}
}
