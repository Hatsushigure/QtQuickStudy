import QtQuick
import QtQuick.Controls
import Qt.labs.platform as Platform

ApplicationWindow {
	width: 640; height: 480
	visible: true
	title: "Application-Desktop"
	header: ToolBar {
		Flow {
			anchors.fill: parent
			ToolButton {
				text: "打开"
				icon.source: "images/icons/opened-folder.png"
				onClicked: openDialog.open()
			}
		}
	}
	menuBar:
		MenuBar {
		Menu{
			title: "文件(&F)"
			MenuItem {
				text: "打开(&O)"
				icon.source: "images/icons/opened-folder"
				onTriggered: openDialog.open()
			}
		}
		Menu{
			title: "帮助(&H)"
			MenuItem {
				text: "关于(&A)"
				onTriggered: aboutDial.open()
			}
		}
	}

	Image {
		id: theImage
		anchors.fill: parent
		asynchronous: true
		antialiasing: true
		fillMode: Image.PreserveAspectFit
	}

	Platform.FileDialog {
		id: openDialog
		nameFilters: ["png 文件(*.png)", "所有文件(*)"]
		onAccepted: theImage.source = file
	}

	Dialog {
		id: aboutDial
		width: 300; height: 180
		anchors.centerIn: parent
		modal: true
		title: "关于"
		Text {
			y: (parent.height - height) / 2
			width: parent.width
			text: "Copyright(C) 2023 Hatsushigure, all rights reserved."
			horizontalAlignment: Text.AlignHCenter
			verticalAlignment: Text.AlignVCenter
			wrapMode: Text.WordWrap
		}

		standardButtons: Dialog.Ok
	}
}
