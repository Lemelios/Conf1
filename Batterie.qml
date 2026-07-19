pragma Singleton

import Quickshell 
import Quickshell.Io
import QtQuick

Singleton {
	id: root 
	property string capacity 

	Process {
		id: getCapacityLevel
		command: ["sh", "-c", "echo `cat /sys/class/power_supply/BAT1/capacity`%"] 
		running: true

		stdout : StdioCollector {
			onStreamFinished: {
				root.capacity = this.text
			 	if (parseInt(this.text) <= 20) {
					lowbat.running = true
				}
			}
		}
	}

	Process { 
		id: lowbat
		command: ["notify-send", "-u", "critical", "Low Battery", "Battery level : " + root.capacity]
		running: false

	}
	Timer {
		interval: 30000
		running: true 
		repeat: true 
		onTriggered: getCapacityLevel.running = true
	}
}
