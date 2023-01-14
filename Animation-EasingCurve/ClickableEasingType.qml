import QtQuick
import "../Utils" as Utils

Utils.ClickableImage {
	property string prefix
	property string generalType

	source: "../images/EasingCurve/" + prefix + '/' + prefix + generalType
	imageWidth: 100; imageHeight: 100
	showText: false
}
