import QtQuick
import QtQuick.Controls.Material as Controls

Controls.Page {
	title: "设置"

	Rectangle {
		anchors.fill: parent
		clip: true

		Controls.ScrollView {
			anchors.fill: parent
			contentWidth: availableWidth

			ListView {
				id: listView
				width: parent.contentWidth
				delegate:  Rectangle {
					width: listView.width; height: Math.max(theText.implicitHeight, theSwitch.implicitHeight)

					Text {
						id: theText
						anchors.left: parent.left; anchors.leftMargin: 8
						anchors.verticalCenter: parent.verticalCenter
						text: model.index + 1
						verticalAlignment: Text.AlignVCenter
					}
					Controls.Switch {
						id: theSwitch
						anchors.right: parent.right; anchors.rightMargin: 8
						anchors.verticalCenter: parent.verticalCenter
					}
				}
				model: 50
			}
		}
	}
}
