import QtQuick
import QtQuick.Controls.Material
import "." as App

ApplicationWindow {
	width: 324; height: 576
	visible: true
	title: "并排页面"
	header: ToolBar {
		Text {
			color: "#ffffff"
			anchors.centerIn: parent
			text: swipeView.currentItem.title
			font.pointSize: 12
		}
	}

	SwipeView {
		id: swipeView
		anchors.fill: parent

		App.HomePage {}

		App.SettingsPage {}

		App.AboutPage {}
	}

	PageIndicator {
		count: swipeView.count
		currentIndex: swipeView.currentIndex
		anchors.horizontalCenter: swipeView.horizontalCenter
		anchors.bottom: swipeView.bottom
	}
}
