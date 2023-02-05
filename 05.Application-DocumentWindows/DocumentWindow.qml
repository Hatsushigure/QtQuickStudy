import QtQuick
import QtQuick.Controls.Material
import QtQuick.Dialogs as Dialogs

ApplicationWindow {
	property string fileName
	property bool isDirty: true

	id: root
	width: 640; height: 480
	visible: true
	title: (fileName.length == 0 ? "无标题" : fileName) + (isDirty ? " *" : "")
	menuBar: MenuBar {
		Menu {
			title: "文件(&F)"

			MenuItem {
				text: "新建(&N)"
				onTriggered: root.newDocument()
			}

			MenuItem {
				text: "打开(&O)"
				onTriggered: root.openDocument()
			}

			MenuItem {
				text: "保存(&S)"
				onTriggered: root.saveDocument()
			}

			MenuItem {
				text: "另存为(&A)"
				onTriggered: root.saveAsDocument()
			}

			MenuSeparator {}

			MenuItem {
				text: "关闭窗口(&C)"
				onTriggered: root.close()
			}
		}
	}
	onClosing: (close)=>{
		if (!isDirty)
			return
		close.accepted = false
		closeConfirmDialog.open()
		return
	}

	Dialogs.FileDialog {
		id: openDialog
		modality: Qt.WindowModal
		nameFilters: ["所有文件(*)"]
		onAccepted: {
			root.fileName = selectedFile
		}
	}

	Dialog {
		id: closeConfirmDialog
		modal: true
		anchors.centerIn: parent
		footer: DialogButtonBox {
			onClicked: (button)=>{
				switch (button) {
				case okBtn:
					root.saveDocument()
					root.close()
					break
				case noBtn:
					root.isDirty = false
					root.close()
					break
				default:
					closeConfirmDialog.close()
					break
				}
			}

			Button {id: okBtn; text: "是(&Y)"}

			Button {id: noBtn; text: "否(&N)"}

			Button {id: cancelBtn; text: "取消(&C)"}
		}

		Text {
			anchors.fill: parent
			wrapMode: Text.WordWrap
			text: (fileName.length == 0 ? "无标题" : fileName) + " 中的内容已更改, 是否保存?"
		}
	}

	function newDocument() {
		createNewWindow()
	}

	function openDocument() {
		openDialog.open()
	}

	function createNewWindow() {
		var tmp = Qt.createComponent("DocumentWindow.qml");
		tmp.createObject();
		return tmp
	}

	function saveDocument() {
		isDirty = false
	}
}
