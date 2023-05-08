import sys
import re
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

@dataclass
class Title:
  content: str

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
  first_header = True

  for block in re.split(r'\n{2,}', input_file.read_text()):
    if block.startswith('//'):
      if first_header:
        yield Title(block)
        first_header = False
      else:
        yield Header(block)
      continue

    lines = block.splitlines()
    if all(l.startswith('/') for l in lines):
      yield Markdown([l[1:] for l in lines])
    else:
      yield Code(lines)

def get_markdown_chunks(): pass

blocks = get_blocks()
for block in blocks:
  print(block)
