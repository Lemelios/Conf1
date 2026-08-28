import Quickshell
import QtQuick 
import Quickshell.Services.UPower

Text {
	property var battery: UPower.displayDevice
	property bool charging: UPower.displayDevice.state === UPowerDeviceState.Charging
	property string capacity : Math.round((battery.percentage ?? 0) * 100) + "%"
	text: (charging ? "ᛪ " :  "ᛃ " ) + capacity	
	color: "purple"
}
