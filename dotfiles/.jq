# Convert JSON to YAML.
# See https://www.javacodegeeks.com/2022/11/convert-json-file-to-yaml-using-jq.html.
def to_yaml:
    (objects | to_entries | (map(.key | length) | max + 2) as $w |
        .[] | (.value | type) as $type |
        if $type == "array" then
            "\(.key):", (.value | to_yaml)
        elif $type == "object" then
            "\(.key):", "    \(.value | to_yaml)"
        else
            "\(.key):\(" " * (.key | $w - length))\(.value)"
        end
    )
    // (arrays | select(length > 0)[] | [to_yaml] |
        "  - \(.[0])", "    \(.[1:][])"
    )
    // .
    ;
