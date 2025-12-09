#!/usr/bin/env bash
set -euo pipefail

### INFO ###
# Generates schemas from the existing k8s cluster

OUT_DIR="${1:-$HOME/schemas/strimzi}"
mkdir -p "$OUT_DIR"

echo "Exporting Strimzi CRD schemas into: $OUT_DIR"

# Grab all Strimzi CRDs: kafka.strimzi.io + core.strimzi.io (for StrimziPodSet)
kubectl get crds -o json \
    | jq -r '
  .items[]
  | select(.spec.group == "kafka.strimzi.io" or .spec.group == "core.strimzi.io")
  | .metadata.name
' \
    | while read -r CRD_NAME; do
        echo " → $CRD_NAME"
        CRD_DIR="$OUT_DIR/$CRD_NAME"
        mkdir -p "$CRD_DIR"

        CRD_JSON=$(kubectl get crd "$CRD_NAME" -o json)

        # Prefer v1 if present, otherwise fall back to the first version
        if echo "$CRD_JSON" | jq -e '.spec.versions[] | select(.name=="v1")' > /dev/null 2>&1; then
            VERSION_NAME="v1"
        else
            VERSION_NAME=$(echo "$CRD_JSON" | jq -r '.spec.versions[0].name')
            echo "   (no v1, using $VERSION_NAME)"
        fi

        echo "$CRD_JSON" \
            | jq ".spec.versions[] | select(.name==\"$VERSION_NAME\") | .schema.openAPIV3Schema" \
                > "$CRD_DIR/$VERSION_NAME.json"

        echo "   - saved $CRD_DIR/$VERSION_NAME.json"
    done

echo "Done."
