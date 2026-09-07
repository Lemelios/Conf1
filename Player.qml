import Quickshell
import Quickshell.Services.Mpris
import QtQuick

DataSec {
    id : root
    readonly property var player: Mpris.players.values.find(p => p.isPlaying) ?? Mpris.players.values[0] ?? null
    icon: String.fromCodePoint(player ? player.isPlaying ? "0xf28b" : "0xf144" : "0xf038a")
    maxLabelWidth: 300
    value: player && mouseAr.containsMouse ? `${player.trackArtist || "Inconnu"} — ${player.trackTitle || ""}` : ""

    MouseArea {
        id : mouseAr
        anchors.fill: parent
        onClicked : root.player.togglePlaying()
        hoverEnabled: true
    }
    Behavior on width {
        PropertyAnimation { duration: 250 ; easing {type : Easing.OutExpo ; }}
    }
}