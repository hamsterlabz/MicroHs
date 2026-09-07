p="pipeline.sh"; s=open(p).read()
old = """echo "=== $(date +%H:%M:%S) STAGE 2: build mhs64 ==="""
new = """# Gate: mhs64 is only worth an hour of anyone's time once the GHC-built
# compiler reads every interface it wrote.  A round-trip bug found here costs
# seconds; found by the self-compile it costs the whole run.
if [ $BAD -ne 0 ]; then
  echo "STOP: $BAD interfaces do not read back -- not running mhs64."
  echo "failures:"; cat $O/iface.tsv
  exit 1
fi

echo "=== $(date +%H:%M:%S) STAGE 2: build mhs64 ==="""
assert old in s
open(p,"w").write(s.replace(old,new,1)); print("gate added")
