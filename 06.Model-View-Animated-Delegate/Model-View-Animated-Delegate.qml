import QtQuick
import QtQuick.Window
import QtQuick.Controls.Material
import QtQuick.Layouts

Window {
	width: 800; height: 480
	visible: true
	title: "Model-View-Animated-Delegate"

	GridLayout {
		anchors.fill: parent
		rows: 2; columns: 1

		GridView {
			id: view
			Layout.fillHeight: true; Layout.fillWidth: true
			cellWidth: 64; cellHeight: 64
			clip: true
			model: ListModel {
				id: theModel
				ListElement {}
				ListElement {}
				ListElement {}
			}
			delegate: Item {
				id: wrapper
				width: GridView.view.cellWidth; height: GridView.view.cellHeight

				Rectangle {
					anchors.centerIn: parent
					color: "lightgreen"
					width: 48; height: 48
					radius: 8

					MouseArea {
						anchors.fill: parent
						onClicked: theModel.remove(model.index)
					}
				}
			}
			add: Transition {
				NumberAnimation {
					easing.type: Easing.OutCubic
					duration: 400
					properties: "opacity, scale"
					from: 0; to: 1
				}
			}
			remove: Transition {
				NumberAnimation {
					easing.type: Easing.OutCubic
					duration: 400
					properties: "opacity, scale"
					from: 1; to: 0
				}
			}
			removeDisplaced: Transition {
				NumberAnimation {
					easing.type: Easing.OutBack
					duration: 200
					properties: "x, y"
				}
			}
		}

		RoundButton {
			radius: 16
			Layout.alignment: Qt.AlignHCenter
			Layout.preferredWidth: 200
			text: "Add"
			onClicked: theModel.append({})
		}
	}
}
