import Quickshell
import Quickshell.Services.Mpris
import QtQuick

DataSec {
    id : root
    readonly property var player: Mpris.players.values.find(p => p.isPlaying) ?? Mpris.players.values[0] ?? null
    icon: String.fromCodePoint(player ? "0xf0387" : "0xf038a")
    maxLabelWidth: 200
    value: player ? `${player.trackArtist || "Inconnu"} — ${player.trackTitle || ""}` : ""

    MouseArea {
        anchors.fill: parent
        onClicked : root.player.togglePlaying()
    }
}