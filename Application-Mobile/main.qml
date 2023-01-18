import QtQuick
import QtQuick.Controls as Controls
import QtQuick.Dialogs as Dialogs

Controls.ApplicationWindow {
	id: root
	width: 324; height: 576
	visible: true
	title: "Application-Mobile"

	Controls.Drawer {
		id: drawer
		width: Math.min(root.width, root.height) * 2 / 3; height: root.height

		ListView {
			id: theMenu
			anchors.fill: parent
			model: ListModel {
				ListElement {
					text: "打开..."
					trigger: function() {
						openDialog.open()
					}
				}

				ListElement {
					text: "关于"
					trigger: function() {
						aboutDial.open()
					}
				}
			}
			delegate: Controls.ItemDelegate {
				width: parent.width
				text: model.text
				onClicked: {
					drawer.close()
					model.trigger()
				}
			}
		}
	}

	Controls.Dialog {
		id: aboutDial
		title: "关于"
		standardButtons: Controls.Dialog.Ok
		modal: true
		anchors.centerIn: parent

		Text {
			anchors.fill: parent
			wrapMode: Text.WordWrap
			text: "Copyright(c) 2023 Hatsushigure, all rights reserved."
		}
	}

	Dialogs.FileDialog {
		id: openDialog
		nameFilters: ["图片文件(*.png *.jpg *.bmp)", "所有文件(*)"]
	}
}
