#!/bin/bash
## @license AGPLv3 <https://www.gnu.org/licenses/agpl-3.0.html>
## @author Copyright (C) 2015 Robin Schneider <ypid@riseup.net>
##
## This program is free software: you can redistribute it and/or modify
## it under the terms of the GNU Affero General Public License as
## published by the Free Software Foundation, version 3 of the
## License.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU Affero General Public License for more details.
##
## You should have received a copy of the GNU Affero General Public License
## along with this program.  If not, see <https://www.gnu.org/licenses/>.

## FIXME: Triggers a bug in opening_hours.js: sl sh th

for state in bw by be bb hb hh he mv ni nw rp sn st
do
    echo "exporting $state …"
    filepath="ferien_${state}.conf"
    ./PH_SH_exporter.js /tmp/PH_SH_export.list --from 2013 --until 2016 --school-holidays --region $state
    (
        echo "# Diese Datei wurde durch das Skript https://github.com/ypid/opening_hours.js/blob/master/SH_batch_exporter.sh erzeugt."
        echo "# Nicht von Hand editieren ;-)"
        cat /tmp/PH_SH_export.list
    ) > $filepath
done
