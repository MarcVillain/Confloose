#!/bin/sh

OUTPUT_FILE=confloose_min.sh

rm $OUTPUT_FILE

echo "scripts=($(ls scripts/ | sed -e 's/\..*$//'))" >> $OUTPUT_FILE

for tool in tools/*; do
    cat $tool >> $OUTPUT_FILE
done

for script in scripts/*; do
    name=$(basename $script)
    echo "run_$name () {" >> $OUTPUT_FILE
    cat $script >> $OUTPUT_FILE
    echo "}" >> $OUTPUT_FILE
done

cat run.sh >> $OUTPUT_FILE
base64 $OUTPUT_FILE > tmp
mv tmp $OUTPUT_FILE
chmod u+x $OUTPUT_FILE
