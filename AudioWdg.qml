import Quickshell
import Quickshell.Services.Pipewire
import QtQuick

Text {
    property var speaker: Pipewire.defaultAudioSink?.audio
    text: "ᛰ " + Math.round((speaker?.volume ?? 0)* 100) 
    color: "purple";
    PwObjectTracker { objects: [Pipewire.defaultAudioSink]}
} 

