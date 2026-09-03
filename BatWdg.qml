import Quickshell
import QtQuick 
import Quickshell.Services.UPower

Text {
	property var battery: UPower.displayDevice
	property bool charging: UPower.displayDevice.state === UPowerDeviceState.Charging
	property string capacity : Math.round((battery.percentage ?? 0) * 100)
	readonly property string icon : {
		if (charging) return String.fromCodePoint(0xf0084)
		let tier = Math.floor ((capacity / 10) + 1) % 10
		return String.fromCodePoint(0xf0079 + tier)
	}
	text: icon + " " + capacity + "%"
	color: "purple"
	font.pixelSize : 15
}
