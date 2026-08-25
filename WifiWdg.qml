import QtQuick 
import Quickshell.Networking

/*Text {
	text: `${Wifi.stat} ${Wifi.name}`
}*/
Text {
	text: toString(ConnectionState)
}
