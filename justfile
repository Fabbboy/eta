project := "eta"

work_dir := `pwd`
src_dir := work_dir + "/" + project
eta_bin := work_dir + "/" + project + ".exe"

odin := env("ODIN", "odin")
rm := "rm -f"

build:
    {{odin}} build {{src_dir}} \
        -collection:{{project}}={{src_dir}} \
        -out:{{eta_bin}}

clean:
    {{rm}} {{eta_bin}}

run: build
    {{eta_bin}}