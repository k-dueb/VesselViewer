#!/bin/bash

pluginDir=GameData/VesselView/Plugins
toremove="
Assembly-CSharp.dll
Assembly-CSharp-firstpass.dll
KSPAssets.dll
KSPCore.dll
KSPUtil.dll
Mono.Cecil.dll
Mono.Security.dll
RasterPropMonitor.dll
SaveUpgradePipeline.Core.dll
System.dll
System.Xml.dll
TDx.TDxInput.dll
Toolbar.dll
TrackIRUnity.dll
UnityEngine.dll
UnityEngine.UI.dll
Vectrosity.dll
"
rm -f  $pluginDir/*.xml $pluginDir/*.pdb
for i in $toremove; do
	rm -f $pluginDir/$i
done

cat GameData/VesselView/VesselView.version
echo "Enter version: "
read v
set -x

RELEASEDIR="/d/Users/jbb/release"
FILE="${RELEASEDIR}/VesselView-${v}.zip"
[ -f $FILE ] && rm -f $FILE

zip -9r $FILE GameData
