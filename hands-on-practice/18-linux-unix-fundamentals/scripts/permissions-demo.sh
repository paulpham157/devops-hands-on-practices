#!/usr/bin/env sh
set -eu

SANDBOX="sandbox/permissions"
rm -rf "$SANDBOX"
mkdir -p "$SANDBOX"

printf '#!/usr/bin/env sh\necho "permission demo"\n' > "$SANDBOX/run.sh"
printf 'secret-token-placeholder\n' > "$SANDBOX/config.txt"

chmod 644 "$SANDBOX/run.sh" "$SANDBOX/config.txt"

echo "Before chmod:"
ls -l "$SANDBOX"

chmod +x "$SANDBOX/run.sh"
chmod 640 "$SANDBOX/config.txt"

echo
echo "After chmod:"
ls -l "$SANDBOX"

echo
echo "Running script:"
"$SANDBOX/run.sh"

