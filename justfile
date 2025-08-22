work_dir := `pwd`
src_dir := work_dir + "/eta"
eta_bin := work_dir + "/eta.exe"

odin := env("ODIN", "odin")
rm := "rm -f"

build:
    {{odin}} build {{src_dir}} -out:{{eta_bin}}

clean:
    {{rm}} {{eta_bin}}

run: build
    {{eta_bin}}