import QtQuick
import Quickshell
import Quickshell.Networking

DataSec {
	property bool connecté: Networking.NetworkDevice.state === ConnectionState.Connected 
	icon: String.fromCodePoint(0xf08d8 + (connecté ? 0 : 1))
	value: Wifi.name
}
