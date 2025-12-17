#!/bin/bash

#perl moss.pl problemas-base/p1-all.js problemas-base/p1-base.js problemas-base/p1-definitions.js problemas-base/p1-ifelse.js problemas-base/p1-junkcode.js problemas-base/p1-while.js problemas-base/p2-all.js problemas-base/p2-base.js problemas-base/p2-definitions.js problemas-base/p2-ifelse.js problemas-base/p2-junkcode.js problemas-base/p2-while.js

listaArquivos=""

for arquivo in ./V8-assemblies/asm/*.asm; do
    if [ -f "$arquivo" ]; then
        listaArquivos+=" $arquivo"
    fi
done

echo "Baseline P1 - " >> asmdiff-server-moss.txt &&

perl moss.pl V8-assemblies/asm/Baseline_p1-all.asm V8-assemblies/asm/Baseline_p1-base.asm V8-assemblies/asm/Baseline_p1-definitions.asm V8-assemblies/asm/Baseline_p1-ifelse.asm V8-assemblies/asm/Baseline_p1-junkcode.asm V8-assemblies/asm/Baseline_p1-while.asm | grep http >> asmdiff-server-moss.txt &&

echo "SparkLevFan P1 - " >> asmdiff-server-moss.txt &&

perl moss.pl V8-assemblies/asm/SparkLevFan_p1-all.asm V8-assemblies/asm/SparkLevFan_p1-base.asm V8-assemblies/asm/SparkLevFan_p1-definitions.asm V8-assemblies/asm/SparkLevFan_p1-ifelse.asm V8-assemblies/asm/SparkLevFan_p1-junkcode.asm V8-assemblies/asm/SparkLevFan_p1-while.asm | grep http >> asmdiff-server-moss.txt &&

echo "Baseline P2 - " >> asmdiff-server-moss.txt &&

perl moss.pl V8-assemblies/asm/Baseline_p2-all.asm V8-assemblies/asm/Baseline_p2-base.asm V8-assemblies/asm/Baseline_p2-definitions.asm V8-assemblies/asm/Baseline_p2-ifelse.asm V8-assemblies/asm/Baseline_p2-junkcode.asm V8-assemblies/asm/Baseline_p2-while.asm | grep http >> asmdiff-server-moss.txt &&

echo "SparkLevFan P2 - " >> asmdiff-server-moss.txt &&

perl moss.pl V8-assemblies/asm/SparkLevFan_p2-all.asm V8-assemblies/asm/SparkLevFan_p2-base.asm V8-assemblies/asm/SparkLevFan_p2-definitions.asm V8-assemblies/asm/SparkLevFan_p2-ifelse.asm V8-assemblies/asm/SparkLevFan_p2-junkcode.asm V8-assemblies/asm/SparkLevFan_p2-while.asm | grep http >> asmdiff-server-moss.txt &&

echo "SparkLev P1 - " >> asmdiff-server-moss.txt &&

perl moss.pl V8-assemblies/asm/SparkLev_p1-all.asm V8-assemblies/asm/SparkLev_p1-base.asm V8-assemblies/asm/SparkLev_p1-definitions.asm V8-assemblies/asm/SparkLev_p1-ifelse.asm V8-assemblies/asm/SparkLev_p1-junkcode.asm V8-assemblies/asm/SparkLev_p1-while.asm | grep http >> asmdiff-server-moss.txt &&

echo "SparkLev P2 - " >> asmdiff-server-moss.txt &&

perl moss.pl V8-assemblies/asm/SparkLev_p2-all.asm V8-assemblies/asm/SparkLev_p2-base.asm V8-assemblies/asm/SparkLev_p2-definitions.asm V8-assemblies/asm/SparkLev_p2-ifelse.asm V8-assemblies/asm/SparkLev_p2-junkcode.asm V8-assemblies/asm/SparkLev_p2-while.asm | grep http >> asmdiff-server-moss.txt &&

echo "SparkLevShaft P1 - " >> asmdiff-server-moss.txt &&

perl moss.pl V8-assemblies/asm/SparkLevShaft_p1-all.asm V8-assemblies/asm/SparkLevShaft_p1-base.asm V8-assemblies/asm/SparkLevShaft_p1-definitions.asm V8-assemblies/asm/SparkLevShaft_p1-ifelse.asm V8-assemblies/asm/SparkLevShaft_p1-junkcode.asm V8-assemblies/asm/SparkLevShaft_p1-while.asm | grep http >> asmdiff-server-moss.txt &&

echo "SparkLevShaft P2 - " >> asmdiff-server-moss.txt &&

perl moss.pl V8-assemblies/asm/SparkLevShaft_p2-all.asm V8-assemblies/asm/SparkLevShaft_p2-base.asm V8-assemblies/asm/SparkLevShaft_p2-definitions.asm V8-assemblies/asm/SparkLevShaft_p2-ifelse.asm V8-assemblies/asm/SparkLevShaft_p2-junkcode.asm V8-assemblies/asm/SparkLevShaft_p2-while.asm | grep http >> asmdiff-server-moss.txt
