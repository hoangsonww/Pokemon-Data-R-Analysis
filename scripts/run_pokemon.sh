#!/usr/bin/env bash
# Execute the Pokémon Attack analysis and generate images

set -euo pipefail

echo "[$(date)] Running Pokémon Attack Analysis..."
Rscript Pokemon_Attack_Analysis.R
echo "[$(date)] Analysis complete. Generated:"
echo "  - attack-population.png"
echo "  - attack-sample.png"
