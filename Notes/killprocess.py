import subprocess
cmd1='''
    # This for loop syntax is Bash only
    for((i=1;i<=$#;i++)); do
        # Arrays are Bash-only
        array[i]+=123
    done'''
cmd2='kill -9 $(ps -x | grep firefox)'
results = subprocess.run(cmd2,
    shell=True, check=True,
    executable='/bin/bash')
print(results.stdout)
