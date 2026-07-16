pragma Singleton

import Quickshell 
import Quickshell.Io
import QtQuick

Singleton {
	id: root 
	property string capacity 

	Process {
		id: getCapacityLevel
		command: ["sh", "-c", "cat /sys/class/power_supply/BAT1/capacity"] 
		running: true

		stdout : StdioCollector {
			onStreamFinished: root.capacity = this.text
		}
	}
	
	Timer {
		interval: 30000
		running: true 
		repeat: true 
		onTriggered: getCapacityLevel.running = true 
	}
}
