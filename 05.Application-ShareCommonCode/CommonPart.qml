import QtQuick
import QtQuick.Dialogs as Dialogs
import QtQuick.Controls as Controls

Item {
	property alias openFileDialog: openFileDialog
	property alias aboutDial: aboutDial

	id: root

	Image {
		id: theImage
		asynchronous: true
		anchors.fill: parent
		fillMode: Image.PreserveAspectFit
	}

	Controls.Dialog {
		id: aboutDial
		modal: true
		anchors.centerIn: parent
		standardButtons: Controls.Dialog.Ok
		title: "关于"

		Text {
			text: "Copyright(C) Hatsushigure 2023. All rights reserved."
			horizontalAlignment: Text.AlignHCenter
			verticalAlignment: Text.AlignVCenter
			anchors.fill: parent
			wrapMode: Text.WordWrap
		}
	}

	Dialogs.FileDialog {
		id: openFileDialog
		nameFilters: ["Image Files(*.png *.jpg *.bmp *.gif)", "All Files(*)"]
		onAccepted: theImage.source = selectedFile
	}
}
