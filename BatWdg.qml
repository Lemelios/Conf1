import Quickshell
import QtQuick 
import Quickshell.Services.UPower

DataSec {
	property var battery: UPower.displayDevice
	property bool charging: UPower.displayDevice.state === UPowerDeviceState.Charging
	property string capacity : Math.round((battery.percentage ?? 0) * 100)

	icon : {
		if (charging) return String.fromCodePoint(0xf0084)
		let tier = Math.floor ((capacity / 10) + 1) % 10
		return String.fromCodePoint(0xf0079 + tier)
	}

	iconColor : {
		let col = icon == String.fromCodePoint("0xf007a") ? '#d70000'
				: icon == String.fromCodePoint("0xf007b") ? '#d74400'
				: icon == String.fromCodePoint("0xf007c") ? '#d75600'
				: icon == String.fromCodePoint("0xf007d") ? '#d77600'
				: icon == String.fromCodePoint("0xf007e") ? '#d79e00'
				: icon == String.fromCodePoint("0xf007f") ? '#d7ba00'
				: icon == String.fromCodePoint("0xf0080") ? '#d7d300'
				: icon == String.fromCodePoint("0xf0081") ? '#a8d700'
				: icon == String.fromCodePoint("0xf0082") ? '#81d700'
				: '#00ff00'
		return col
	}

	value: capacity + "%"
}