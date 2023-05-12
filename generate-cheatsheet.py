import re
import subprocess
from pathlib import Path
from dataclasses import dataclass
from typing import List

q_exe = 'q/m64/q'
input_file = Path('cheatsheet.q')
build_dir = Path('_build')
generated_file = build_dir / input_file.name
output_file = input_file.with_suffix('.md')

@dataclass
class Header:
  level: int
  content: str

@dataclass
class Code:
  lines: List[str]

def get_blocks():
  for block in re.split(r'\n{2,}', input_file.read_text()):
    match = re.match(r'(\/+)(.*)', block)
    if match:
      level = len(match.group(1))
      yield Header(level, match.group(2))
    else:
      yield Code(block.splitlines())

def get_code_chunks(blocks):
  for block in get_blocks():
    match block:
      case Header(level, content):
        prefix = (4-level) * '#'
        yield f'p "{prefix} {content}\\n"'
      case Code(lines):
        yield 'p "```q"'
        for line in lines:
          printable_line = line.replace('\\', '\\\\').replace('"', '\\"')
          if line.startswith('\\'):
            yield f'p "{printable_line}"'
            yield line
          else:
            yield f'pcode["{printable_line}";.Q.s[{line}]]'
        yield 'p "```\\n"'

if not build_dir.exists():
  build_dir.mkdir()

BOILERPLATE = """\
p:{-1 x;}
pcode:{[code;val] lines:"\\n" vs -1_val; -1 code," --> ",first lines; ((5+count code)#" ") {-1 x,y;}/: 1_lines;}
p "# Cheatsheet\\n"

"""

with generated_file.open('w') as fp:
  fp.write(BOILERPLATE)
  
  for chunk in get_code_chunks(get_blocks()):    
    fp.write(f'{chunk}\n')
  fp.write('exit 0')

result = subprocess.run([q_exe, generated_file], capture_output=True)
output_file.write_bytes(result.stdout.strip() + b'\n')
