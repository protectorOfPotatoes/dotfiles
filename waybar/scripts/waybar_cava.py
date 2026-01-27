import subprocess
import sys

# Simplified config for stability
config_content = """
[general]
bars = 8
[output]
method = raw
raw_target = /dev/stdout
data_format = ascii
ascii_max_range = 7
"""

with open("/tmp/cava_config_waybar", "w") as f:
    f.write(config_content)

# The mapping dictionary
bar_map = {
    '0': '_ ', '1': '▂ ', '2': '▃ ', '3': '▄ ', '4': '▅ ', '5': '▆ ', '6': '▇ ', '7': '█ '
}

# Launch CAVA
process = subprocess.Popen(
    ["cava", "-p", "/tmp/cava_config_waybar"],
    stdout=subprocess.PIPE,
    text=True,
    bufsize=1 # Line buffered
)

try:
    for line in process.stdout:
        # This mirrors your 'sed' logic but stays in one process
        clean_line = line.strip().replace(';', '')
        output = "".join(bar_map.get(c, c) for c in clean_line)
        
        if output:
            sys.stdout.write(output + '\n')
            sys.stdout.flush()
except KeyboardInterrupt:
    process.terminate()
