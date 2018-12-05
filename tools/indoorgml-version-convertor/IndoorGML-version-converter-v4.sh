#! /bin/bash

startT=$(date +%s)

echo -n "Input gml file name: "

read file_name

sed 's/<MultiLayeredGraph /<multiLayeredGraph>\n\t\t<MultiLayeredGraph /' $file_name > tmp1.gml
sed 's/<\/MultiLayeredGraph>/<\/MultiLayeredGraph>\n<\/multiLayeredGraph>/' tmp1.gml > tmp2.gml
rm -f tmp1.gml
sed 's/<Geometry3D>/<cellSpaceGeometry>\n\t\t\t\t\t<Geometry3D>/' tmp2.gml > tmp1.gml
rm -f tmp2.gml
sed 's/<Geometry2D>/<cellSpaceGeometry>\n\t\t\t\t\t<Geometry2D>/' tmp1.gml > tmp2.gml
rm -f tmp1.gml
sed 's/<\/Geometry3D>/<\/Geometry3D>\n\t\t\t\t\t<\/cellSpaceGeometry>/' tmp2.gml > tmp1.gml
rm -f tmp2.gml
sed 's/<\/Geometry2D>/<\/Geometry2D>\n\t\t\t\t\t<\/cellSpaceGeometry>/' tmp1.gml > tmp2.gml
rm -f tmp1.gml
sed 's/<geometry3D>/<cellSpaceBoundaryGeometry>\n\t\t\t\t\t<geometry3D>/' tmp2.gml > tmp1.gml
rm -f tmp2.gml
sed 's/<geometry2D>/<cellSpaceBoundaryGeometry>\n\t\t\t\t\t<geometry2D>/' tmp1.gml > tmp2.gml
rm -f tmp1.gml
sed 's/<\/geometry3D>/<\/geometry3D>\n\t\t\t\t\t<\/cellSpaceBoundaryGeometry>/' tmp2.gml > tmp1.gml
rm -f tmp2.gml
sed 's/<\/geometry3D>/<\/geometry3D>\n\t\t\t\t\t<\/cellSpaceBoundaryGeometry>/' tmp1.gml > tmp2.gml
rm -f tmp1.gml
sed 's/<\/geometry2D>/<\/geometry2D>\n\t\t\t\t\t<\/cellSpaceBoundaryGeometry>/' tmp2.gml > tmp1.gml
rm -f tmp2.gml
sed 's/xsi:schemaLocation="[^"]*/xmlns:navi="http:\/\/www.opengis.net\/indoorgml\/1.0\/navigation" xsi:schemaLocation="http:\/\/www.opengis.net\/indoorgml\/1.0\/core http:\/\/schemas.opengis.net\/indoorgml\/1.0\/indoorgmlcore.xsd http:\/\/www.opengis.net\/indoorgml\/1.0\/navigation http:\/\/schemas.opengis.net\/indoorgml\/1.0\/indoorgmlnavi.xsd/' tmp1.gml > converted.gml
rm -f tmp1.gml

endT=$(date +%s)
echo "IndoorGML version convert complete."
echo "It takes $(($endT-$startT)) seconds :)"

sleep 5