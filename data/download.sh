#!/bin/bash
# associative arrays are not POSIX standard, so disable shellcheck warning
# shellcheck disable=SC2039

set -e

BASEURL=http://publications.naturalengland.org.uk/file/
TARGETPATH=$DATAROOT/SourceData/Observations/NaturalEngland/MENE/

declare -A filenumbers

filenumbers[6252849495539712]=excel_spss_mene_weighting_guide.pdf
filenumbers[5701857678983168]=mene_year_1-9_respondent_data.csv
filenumbers[5561617467310080]=mene_year_1_to_7_visit_data.csv
filenumbers[6088843157831680]=mene_year_8_and_9_visit_data.csv
filenumbers[4607962547224576]=nci_year_5_core_and_boost_data.csv
filenumbers[5749422113947648]=mene_year_1_to_5_childrens_data.csv


for file in "${!filenumbers[@]}"; do
    wget -nc $BASEURL$file -P "$TARGETPATH"
    mv "$TARGETPATH$file" "$TARGETPATH${filenumbers[$file]}"
done

