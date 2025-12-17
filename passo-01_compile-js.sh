#!/bin/bash

transformacoes=("all" "base" "while" "ifelse" "junkcode" "definitions")
idProblemas=("1" "2")

for probId in "${idProblemas[@]}"; do
    echo probId
    for transf in "${transformacoes[@]}"; do

        # Baseline apenas
        echo 10 | node --max-opt=1 --print-code "problemas-base/p${probId}-${transf}.js" > "V8-assemblies/asm/Baseline_p${probId}-${transf}.asm"

        # Baseline + Maglev
        echo 10 | node --max-opt=2 --print-code "problemas-base/p${probId}-${transf}.js" > "V8-assemblies/asm/SparkLev_p${probId}-${transf}.asm"

        # Baseline + Maglev + TurboFan
        echo 10 | node --max-opt=3 --print-code "problemas-base/p${probId}-${transf}.js" > "V8-assemblies/asm/SparkLevFan_p${probId}-${transf}.asm"

        # Baseline + Maglev + TurboShaft
        echo 10 | node --max-opt=3 --turboshaft --print-code "problemas-base/p${probId}-${transf}.js" > "V8-assemblies/asm/SparkLevShaft_p${probId}-${transf}.asm"
    done
done
