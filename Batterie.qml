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
			 	if (this.text*1 <= 20) {
					lowbat.running = true
				}
			}
		}
	}

	Process { 
		id: lowbat
		command: ["sh", "-c", "notify-send -u critical 'Low Battery' 'Battery level : `cat /sys/class/power_supply/BAT1/capacity`'"]
		running: false

	}
	Timer {
		interval: 30000
		running: true 
		repeat: true 
		onTriggered: getCapacityLevel.running = true
	}
}
