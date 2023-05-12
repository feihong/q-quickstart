import sys
import re
import subprocess
from pathlib import Path
from dataclasses import dataclass
from typing import List

try:
  input_file = Path(sys.argv[1])
except:
  q_files = sorted(
    (f for f in Path('.').glob('*.q') if f.name != 'cheatsheet'), 
    key=lambda f: f.stat().st_mtime, 
    reverse=True)
  input_file = q_files[0]

q_exe = 'q/m64/q'
build_dir = Path('_build')
generated_file = build_dir / input_file.name
output_file = input_file.with_suffix('.md')


@dataclass
class Header:
  content: str

@dataclass
class Markdown:
  content: List[str]

@dataclass
class Code:
  content: List[str]

def get_blocks():
  for block in re.split(r'\n{2,}', input_file.read_text()):
    if block.startswith('//'):
      yield Header(block[2:])
      continue

    lines = block.splitlines()
    if all(l.startswith('/') for l in lines):
      yield Markdown([l[1:] for l in lines])
    else:
      yield Code(lines)

def get_code_chunks(blocks): 
  for block in blocks:
    match block:
      case Header(content):
        yield f'p "## {content}\\n"'
      case Markdown(content):
        for line in content:
          yield f'p "{line}"'
        yield 'p ""'
      case Code(content):
        yield 'p "```q"'
        lines = [line.replace('\\', '\\\\').replace('"', '\\"') for line in content]
        for line in lines:
          yield f'p "{line}"'
        yield 'p "```\\n"'
        yield 'p "```"'
        for line in lines:
          yield f'0 "{line}"'
        yield 'p "```\\n"'

if not build_dir.exists():
  build_dir.mkdir()

BOILERPLATE = """\
p:{-1 x;}

"""

with generated_file.open('w') as fp:
  fp.write(BOILERPLATE)
  
  for chunk in get_code_chunks(get_blocks()):    
    fp.write(f'{chunk}\n')
  fp.write('exit 0')

result = subprocess.run([q_exe, generated_file], capture_output=True)
output = result.stdout.strip().replace(b'\n```\n```\n', b'')
output_file.write_bytes(output + b'\n')

print(f'Generated {output_file}')
