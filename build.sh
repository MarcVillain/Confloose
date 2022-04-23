#!/bin/bash

OUTPUT_FILE="${OUTPUT_FILE:-confloose_min.sh}"

# Cleanup existing
rm "$OUTPUT_FILE"

# Shebang!
echo "#!/bin/bash" >> "$OUTPUT_FILE"

# Export tools
for tool in tools/*; do
    cat $tool >> "$OUTPUT_FILE"
done

# Export scripts into their own functions
for script in scripts/*; do
    name="$(basename "$script")"
    echo "run_$name () {" >> "$OUTPUT_FILE"
    cat $script >> "$OUTPUT_FILE"
    echo "}" >> "$OUTPUT_FILE"
done

# Export list of scripts
echo "scripts=($(ls scripts/ | sed -e 's/\..*$//'))" >> "$OUTPUT_FILE"

# Export main run script
cat run.sh >> "$OUTPUT_FILE"

# Encode result
base64 "$OUTPUT_FILE" > tmp
mv tmp "$OUTPUT_FILE"

# Make it an executable
chmod u+x "$OUTPUT_FILE"
