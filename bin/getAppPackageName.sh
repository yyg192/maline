#!/bin/sh

# Copyright 2013,2014 Marko Dimjašević, Simone Atzeni, Ivo Ugrina, Zvonimir Rakamarić
#
# This file is part of maline.
#
# maline is free software: you can redistribute it and/or modify it
# under the terms of the GNU Affero General Public License as
# published by the Free Software Foundation, either version 3 of the
# License, or (at your option) any later version.
#
# maline is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with maline.  If not, see <http://www.gnu.org/licenses/>.


$MALINE/lib/apktool/apktool d $1 1>/dev/null 2>/dev/null
filepath=$(basename $1 .apk)
filename=./$filepath/AndroidManifest.xml
package=$(grep -e "package" $filename | grep -o -P '(?<=package=").*(?=\")')
rm -rf $filepath
echo $package