import QtQuick
import Quickshell
import Quickshell.Networking

Text {
    property bool connecté: Networking.NetworkDevice.state === ConnectionState.Connected
    text: "ᛠ " + Wifi.stat + (connecté ? " : " : "") + Wifi.name
    color: "purple"
}