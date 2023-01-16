import QtQuick
import QtQuick.Controls
import QtQuick.Dialogs as Dialogs
//import Qt.labs.platform as Platform	//原生对话框不再处于试验阶段, 可引入 Dialogs 命名空间

ApplicationWindow {	//具有菜单栏、工具栏的标准窗口
	width: 640; height: 480
	visible: true
	title: "Application-Desktop"
	header: ToolBar {	//工具栏
		Flow {
			anchors.fill: parent
			ToolButton {
				text: "打开"
				icon.source: "images/icons/opened-folder.png"
				onClicked: openDialog.open()
			}
		}
	}
	menuBar:	//菜单栏
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

	Dialogs.FileDialog {	//打开文件对话框(各平台不一样)
		id: openDialog
		nameFilters: ["png 文件(*.png)", "所有文件(*)"]
		onAccepted: theImage.source = file
	}

	Dialog {	//普通对话框(全平台统一)
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

//	Platform.MessageDialog {	//此对话框需要 Qt Widgets 库
//		id: aboutDial2
//	}
}
