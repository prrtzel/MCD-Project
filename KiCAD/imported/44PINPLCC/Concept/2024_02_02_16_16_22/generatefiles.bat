rem --- Component "8444-11B1-RK-TP" ---
newgenasym.exe -i "%cd%\exported\8444_11b1_rk_tp" -n "8444_11b1_rk_tp"
van.exe -q -nolinks -sironly "%cd%\exported\8444_11b1_rk_tp\entity\verilog.v" -lib "exported_lib" -view entity -cdslib "%cd%\exported_lib.lib"

Pause
