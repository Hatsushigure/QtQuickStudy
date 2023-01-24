import QtQuick
import QtQuick.Controls.Material as Controls

Controls.Page {
	signal copyButtonClicked

	title: "设置"

	Controls.Button {
		id: copyButton
		text: "套娃"
		anchors.horizontalCenter: parent.horizontalCenter
		anchors.top: parent.top; anchors.topMargin: 8
		onClicked: {
			parent.parent.parent.push(Qt.createComponent("./SettingsPage.qml", parent.parent.parent))
		}
	}

	Rectangle {
		anchors.top: copyButton.bottom; anchors.topMargin: 4
		anchors.bottom: parent.bottom
		width: parent.width
		clip: true

		Controls.ScrollView {
			anchors.fill: parent
			contentWidth: availableWidth

			ListView {
				width: parent.availableWidth
				delegate:  Rectangle {
					width: parent.width; height: Math.max(theText.implicitHeight, theSwitch.implicitHeight)

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
