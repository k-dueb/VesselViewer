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

d=`pwd`
cp /d/Users/jbb/github/MiniAVC.dll ${d}/GameData/VesselView

v="GameData/VesselView/VesselView.version"
major=`grep -m 1 MAJOR $v  | cut -f2 -d':' | tr -d , | tr -d '[:space:]'`
minor=`grep -m 1 MINOR $v  | cut -f2 -d':' | tr -d ,| tr -d '[:space:]'`
patch=`grep -m 1 PATCH $v  | cut -f2 -d':' | tr -d ,| tr -d '[:space:]'`
build=`grep -m 1 BUILD $v  | cut -f2 -d':' | tr -d ,| tr -d '[:space:]'`
version="${major}.${minor}.${patch}"
if [ "$build" != "0" ]; then
	version="${version}.${build}"
fi
echo $version


#cat GameData/VesselView/VesselView.version
#echo "Enter version: "
#read v
v=$version
#set -x

RELEASEDIR="/d/Users/jbb/release"

# full version
FILE="${RELEASEDIR}/VesselView-${v}.zip"
[ -f $FILE ] && rm -f $FILE
zip -9r $FILE GameData

#Toolbar version
FILE="${RELEASEDIR}/VesselView-toolbar-${v}.zip"
[ -f $FILE ] && rm -f $FILE
zip -9r $FILE GameData --exclude "\*/VesselViewRPM.dll" --exclude "\*/JSI*"

#RPM version
FILE="${RELEASEDIR}/VesselView-RPM-${v}.zip"
[ -f $FILE ] && rm -f $FILE
zip -9r $FILE GameData --exclude "\*/VesselViewPlugin.dll" --exclude "\*/000_Toolbar*"

