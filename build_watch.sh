
FIND_COMMAND="find hello-world -type f '(' -name 'package.json' -o -not -path '*/tests/*' -not -path '*/*.config.ts' -name '*.ts' ')'"
ON_CHANGED_FILE="xargs -0 -n 1 -I {} sh -c 'sam build -t template.yaml'"

echo "Watching for changes in the hello-world directory..."

fswatch -r -0 \
    $(find hello-world -type f \
    '(' -name 'package.json' -o -not -path '*/tests/*' -not -path '*/*.config.ts' -name '*.ts' ')') \
    | xargs -0 -n 1 -I {} sh -c 'sam build -t template.yaml'

# find hello-world -type f '(' -name "package.json" -o -not -path 
# "*/tests/*" -not -path "*/*.config.ts" -name "*.ts" ')'