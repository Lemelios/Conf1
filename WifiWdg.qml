import QtQuick
import Quickshell
import Quickshell.Networking

Text {
    property bool connecté: Networking.NetworkDevice.state === ConnectionState.Connected
    text: String.fromCodePoint(0xf08d8 + (connecté ? 0 : 1)) + " " + Wifi.stat + (connecté ? " : " : "") + Wifi.name
    color: "purple"
    font {
        family : "Terminess Nerd Font Propo"
        pixelSize : 15
    }
}
