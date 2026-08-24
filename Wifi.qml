pragma Singleton

import Quickshell 
import Quickshell.Io
import QtQuick
import Quickshell.Networking

Singleton {
	id: root 
	property string name  
	property string stat  
	Process {
		id: getName 
		command: ["nmcli", "|", "head", "-1", "|", "cut", "-d", '" "', "-f", "4"] // 17 for status 
		running: true 

		stdout : StdioCollector {
			onStreamFinished: {
				root.name = this.text
			}
		}
	}
	Process {
		id: getStatus 
		command: ["nmcli", "|", "head", "-1", "|", "cut", "-d", '" "', "-f", "2"] // 17 for status 
		running: true 

		stdout : StdioCollector {
			onStreamFinished: {
				root.stat = this.text
			}
		}
	}
}
