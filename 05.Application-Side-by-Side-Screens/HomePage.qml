import QtQuick
import QtQuick.Controls.Material as Controls

Controls.Page {
	title: "主页"

	Text {
		property int clickCount : 0

		id: theText
		text: "这里什么都没有..."
		verticalAlignment: Text.AlignVCenter
		horizontalAlignment: Text.AlignHCenter
		font.pointSize: 10
		anchors.fill: parent
		onClickCountChanged: {
			if (clickCount == 1) {
				text = "真的什么都没有"
			}
			else if (clickCount == 2) {
				text = "没有就是没有!"
			}
			else if (clickCount == 3) {
				text = "本当に何もないよ！"
			}
			else if (clickCount == 4) {
				text = "你烦不烦啊"
			}
			else if (clickCount < 100) {
				text = clickCount
			}
			else {
				egg.start()
			}
		}

		MouseArea {
			onClicked: theText.clickCount++
			anchors.fill: parent
		}

		PropertyAnimation {
			id: egg
			from: 0; to: 2
			duration: 200
			target: swipeView
			property: "currentIndex"
			onFinished: timer1.start()
		}
		Timer {
			id: timer1
			interval: 100
			onRunningChanged: {
				if (!running) egg.start()
			}
		}
	}
}
