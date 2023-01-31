import QtQuick
import QtQuick.Controls.Material

Page {
	title: "关于"

	Text {
		id: aboutText
		text: "Copyright(C) 2023 初時雨. All rights reserved."
		wrapMode: Text.WordWrap
		anchors.centerIn: parent
	}

	Button {
		text: "回到主页"
		anchors.bottom: aboutText.top; anchors.bottomMargin: 4
		anchors.horizontalCenter: parent.horizontalCenter
		onClicked: swipeView.setCurrentIndex(0)
	}
}
