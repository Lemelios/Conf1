pragma Singleton

import Quickshell 
import Quickshell.Io
import QtQuick

Singleton {
	id: root 
	property string name: ""
	property string stat: disconnected 
	Process {
		id: getName 
		command: ['#'] // 17 for status 
		running: true 

		stdout : StdioCollector {
			onStreamFinished: {
				root.name = this.text
			}
		}
	}
	Process {
		id: getStatus 
		command: ["sh", "-c", 'nmcli dev status | cut -d " " -f 17 | head -2 | tail -1']
		running: true 

		stdout : StdioCollector {
			onStreamFinished: {
				root.stat = this.text
			}
		}
	}
}
