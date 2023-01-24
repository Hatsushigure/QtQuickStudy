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
				text = "不会吧，不会真的有人这么闲吧\n算了，给你个小小的彩蛋\n送你一颗小星星  (o゜▽゜)o☆"
			}
		}

		MouseArea {
			onClicked: theText.clickCount++
			anchors.fill: parent
		}
	}
}
