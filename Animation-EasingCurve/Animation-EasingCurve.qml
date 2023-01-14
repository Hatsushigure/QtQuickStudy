//缓动曲线
import QtQuick
import QtQuick.Controls.Material
import "../Utils" as Utils

Window {
	width: 640; height: 480
	visible: true
	title: "Animation-EasingCurve"

	Rectangle {
		id: root
		anchors.fill: parent
		gradient: Gradient {
			GradientStop {position: 0.00; color: "#86ffd9"}
			GradientStop {position: 1.00; color: "#89e8f7"}
		}

		Utils.ClickableImage {
			id: linerImage
			anchors.horizontalCenter: parent.horizontalCenter; anchors.top: parent.top
			anchors.topMargin: 8
			source: "../images/EasingCurve/Liner.png"
			imageWidth: 100; imageHeight: 100
			showText: false
			onClicked: {animaDemonstrator.easingType = Easing.Linear; animaDemonstrator.toggle()}
		}

		ComboBox {
			id: prefixCombo
			anchors.left: linerImage.right; anchors.verticalCenter: linerImage.verticalCenter
			anchors.leftMargin: 8
			model: ["In", "Out", "InOut", "OutIn"]
			onCurrentIndexChanged: {
				switch (currentIndex) {
				case 0:
					inGroup.visible = true;
					outGroup.visible = false;
					inOutGroup.visible = false;
					outInGroup.visible = false;
					break;
				case 1:
					inGroup.visible = false;
					outGroup.visible = true;
					inOutGroup.visible = false;
					outInGroup.visible = false;
					break;
				case 2:
					inGroup.visible = false;
					outGroup.visible = false;
					inOutGroup.visible = true;
					outInGroup.visible = false;
					break;
				case 3:
					inGroup.visible = false;
					outGroup.visible = false;
					inOutGroup.visible = false;
					outInGroup.visible = true;
					break;
				}
			}
		}

		SpinBox {
			id: durationSpin
			anchors.right: linerImage.left; anchors.verticalCenter: linerImage.verticalCenter
			anchors.rightMargin: 8
			value: 300
			from: 0; to:100000
			editable: true
			onValueChanged: animaDemonstrator.duration = value
		}

		Grid {
			id: inGroup
			columns: 5; rows: 2
			spacing: 4
			anchors.top: linerImage.bottom; anchors.horizontalCenter: parent.horizontalCenter
			anchors.topMargin: 4

			ClickableEasingType {
				prefix: "In"; generalType: "Quad";
				onClicked: {animaDemonstrator.easingType = Easing.InQuad; animaDemonstrator.toggle()}
			}

			ClickableEasingType {
				prefix: "In"; generalType: "Cubic"
				onClicked: {animaDemonstrator.easingType = Easing.InCubic; animaDemonstrator.toggle()}
			}

			ClickableEasingType {
				prefix: "In"; generalType: "Quart"
				onClicked: {animaDemonstrator.easingType = Easing.InQuart; animaDemonstrator.toggle()}
			}

			ClickableEasingType {
				prefix: "In"; generalType: "Quint"
				onClicked: {animaDemonstrator.easingType = Easing.InQuint; animaDemonstrator.toggle()}
			}

			ClickableEasingType {
				prefix: "In"; generalType: "Sine"
				onClicked: {animaDemonstrator.easingType = Easing.InSine; animaDemonstrator.toggle()}
			}

			ClickableEasingType {
				prefix: "In"; generalType: "Expo"
				onClicked: {animaDemonstrator.easingType = Easing.InExpo; animaDemonstrator.toggle()}
			}

			ClickableEasingType {
				prefix: "In"; generalType: "Circ"
				onClicked: {animaDemonstrator.easingType = Easing.InCirc; animaDemonstrator.toggle()}
			}

			ClickableEasingType {
				prefix: "In"; generalType: "Elastic"
				onClicked: {animaDemonstrator.easingType = Easing.InElastic; animaDemonstrator.toggle()}
			}

			ClickableEasingType {
				prefix: "In"; generalType: "Back"
				onClicked: {animaDemonstrator.easingType = Easing.InBack; animaDemonstrator.toggle()}
			}

			ClickableEasingType {
				prefix: "In"; generalType: "Bounce"
				onClicked: {animaDemonstrator.easingType = Easing.InBounce; animaDemonstrator.toggle()}
			}
		}

		Grid {
			id: outGroup
			columns: 5; rows: 2
			spacing: 4
			anchors.top: linerImage.bottom; anchors.horizontalCenter: parent.horizontalCenter
			anchors.topMargin: 4
			visible: false

			ClickableEasingType {
				prefix: "Out"; generalType: "Quad";
				onClicked: {animaDemonstrator.easingType = Easing.OutQuad; animaDemonstrator.toggle()}
			}

			ClickableEasingType {
				prefix: "Out"; generalType: "Cubic"
				onClicked: {animaDemonstrator.easingType = Easing.OutCubic; animaDemonstrator.toggle()}
			}

			ClickableEasingType {
				prefix: "Out"; generalType: "Quart"
				onClicked: {animaDemonstrator.easingType = Easing.OutQuart; animaDemonstrator.toggle()}
			}

			ClickableEasingType {
				prefix: "Out"; generalType: "Quint"
				onClicked: {animaDemonstrator.easingType = Easing.OutQuint; animaDemonstrator.toggle()}
			}

			ClickableEasingType {
				prefix: "Out"; generalType: "Sine"
				onClicked: {animaDemonstrator.easingType = Easing.OutSine; animaDemonstrator.toggle()}
			}

			ClickableEasingType {
				prefix: "Out"; generalType: "Expo"
				onClicked: {animaDemonstrator.easingType = Easing.OutExpo; animaDemonstrator.toggle()}
			}

			ClickableEasingType {
				prefix: "Out"; generalType: "Circ"
				onClicked: {animaDemonstrator.easingType = Easing.OutCirc; animaDemonstrator.toggle()}
			}

			ClickableEasingType {
				prefix: "Out"; generalType: "Elastic"
				onClicked: {animaDemonstrator.easingType = Easing.OutElastic; animaDemonstrator.toggle()}
			}

			ClickableEasingType {
				prefix: "Out"; generalType: "Back"
				onClicked: {animaDemonstrator.easingType = Easing.OutBack; animaDemonstrator.toggle()}
			}

			ClickableEasingType {
				prefix: "Out"; generalType: "Bounce"
				onClicked: {animaDemonstrator.easingType = Easing.OutBounce; animaDemonstrator.toggle()}
			}
		}

		Grid {
			id: inOutGroup
			columns: 5; rows: 2
			spacing: 4
			anchors.top: linerImage.bottom; anchors.horizontalCenter: parent.horizontalCenter
			anchors.topMargin: 4
			visible: false

			ClickableEasingType {
				prefix: "InOut"; generalType: "Quad";
				onClicked: {animaDemonstrator.easingType = Easing.InOutQuad; animaDemonstrator.toggle()}
			}

			ClickableEasingType {
				prefix: "InOut"; generalType: "Cubic"
				onClicked: {animaDemonstrator.easingType = Easing.InOutCubic; animaDemonstrator.toggle()}
			}

			ClickableEasingType {
				prefix: "InOut"; generalType: "Quart"
				onClicked: {animaDemonstrator.easingType = Easing.InOutQuart; animaDemonstrator.toggle()}
			}

			ClickableEasingType {
				prefix: "InOut"; generalType: "Quint"
				onClicked: {animaDemonstrator.easingType = Easing.InOutQuint; animaDemonstrator.toggle()}
			}

			ClickableEasingType {
				prefix: "InOut"; generalType: "Sine"
				onClicked: {animaDemonstrator.easingType = Easing.InOutSine; animaDemonstrator.toggle()}
			}

			ClickableEasingType {
				prefix: "InOut"; generalType: "Expo"
				onClicked: {animaDemonstrator.easingType = Easing.InOutExpo; animaDemonstrator.toggle()}
			}

			ClickableEasingType {
				prefix: "InOut"; generalType: "Circ"
				onClicked: {animaDemonstrator.easingType = Easing.InOutCirc; animaDemonstrator.toggle()}
			}

			ClickableEasingType {
				prefix: "InOut"; generalType: "Elastic"
				onClicked: {animaDemonstrator.easingType = Easing.InOutElastic; animaDemonstrator.toggle()}
			}

			ClickableEasingType {
				prefix: "InOut"; generalType: "Back"
				onClicked: {animaDemonstrator.easingType = Easing.InOutBack; animaDemonstrator.toggle()}
			}

			ClickableEasingType {
				prefix: "InOut"; generalType: "Bounce"
				onClicked: {animaDemonstrator.easingType = Easing.InOutBounce; animaDemonstrator.toggle()}
			}
		}

		Grid {
			id: outInGroup
			columns: 5; rows: 2
			spacing: 4
			anchors.top: linerImage.bottom; anchors.horizontalCenter: parent.horizontalCenter
			anchors.topMargin: 4
			visible: false

			ClickableEasingType {
				prefix: "OutIn"; generalType: "Quad";
				onClicked: {animaDemonstrator.easingType = Easing.OutInQuad; animaDemonstrator.toggle()}
			}

			ClickableEasingType {
				prefix: "OutIn"; generalType: "Cubic"
				onClicked: {animaDemonstrator.easingType = Easing.OutInCubic; animaDemonstrator.toggle()}
			}

			ClickableEasingType {
				prefix: "OutIn"; generalType: "Quart"
				onClicked: {animaDemonstrator.easingType = Easing.OutInQuart; animaDemonstrator.toggle()}
			}

			ClickableEasingType {
				prefix: "OutIn"; generalType: "Quint"
				onClicked: {animaDemonstrator.easingType = Easing.OutInQuint; animaDemonstrator.toggle()}
			}

			ClickableEasingType {
				prefix: "OutIn"; generalType: "Sine"
				onClicked: {animaDemonstrator.easingType = Easing.OutInSine; animaDemonstrator.toggle()}
			}

			ClickableEasingType {
				prefix: "OutIn"; generalType: "Expo"
				onClicked: {animaDemonstrator.easingType = Easing.OutInExpo; animaDemonstrator.toggle()}
			}

			ClickableEasingType {
				prefix: "OutIn"; generalType: "Circ"
				onClicked: {animaDemonstrator.easingType = Easing.OutInCirc; animaDemonstrator.toggle()}
			}

			ClickableEasingType {
				prefix: "OutIn"; generalType: "Elastic"
				onClicked: {animaDemonstrator.easingType = Easing.OutInElastic; animaDemonstrator.toggle()}
			}

			ClickableEasingType {
				prefix: "OutIn"; generalType: "Back"
				onClicked: {animaDemonstrator.easingType = Easing.OutInBack; animaDemonstrator.toggle()}
			}

			ClickableEasingType {
				prefix: "OutIn"; generalType: "Bounce"
				onClicked: {animaDemonstrator.easingType = Easing.OutInBounce; animaDemonstrator.toggle()}
			}
		}

		AnimaDemonstrator {
			id: animaDemonstrator
			width: parent.width; height: 100
			anchors.bottom: parent.bottom
			anchors.bottomMargin: 8
			duration: 300
		}
	}
}
