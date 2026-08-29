import Quickshell
import Quickshell.Services.Pipewire
import QtQuick.Layouts
import QtQuick

RowLayout {
    id: row
    anchors.verticalCenter : parent.verticalCenter
    Text{
        property var speaker: Pipewire.defaultAudioSink?.audio
        property bool mute: speaker.muted 
        id: icon 
        text: muted ? "no_sound" : "volume_up"
        font.family : "Material Symbols Rounded"
    } 
    Text {
        property var speaker: Pipewire.defaultAudioSink?.audio
        id : level
        text: "ᛰ " + Math.round((speaker?.volume ?? 0)* 100) 
        color: "purple";
        font.family:"Terminus"
    } 
    PwObjectTracker { objects: [Pipewire.defaultAudioSink]}
}


