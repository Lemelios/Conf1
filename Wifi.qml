pragma Singleton

import Quickshell 
import Quickshell.Io
import QtQuick
import Quickshell.Networking
import QtQml

Singleton {
	id: root 
	property string name  
	property string stat  
	Process {
		id: getWifi 
		command: ["nmcli", "-t", "dev", "status"] 
		running: true 

		stdout : StdioCollector {
			onStreamFinished: {
				const lines = this.text.trim().split("\n")
				const activeLine = lines[0]
				root.name = activeLine ? activeLine.split(":")[3] : ""
			}
		}
	}
	Connections {
		target: root.NetworkDevice
		function onStateChanged() {
			root.stat = toString(Networking.NetworkDevice.state)
			getWifi.running = true 
		}
	}
}
