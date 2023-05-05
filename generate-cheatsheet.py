from pathlib import Path
import pexpect

input_file = Path('cheatsheet.q')
output_file = input_file.with_suffix('.md')

class QIntepreter:
  def __init__(self):
    qhome = Path('./q').absolute()
    self.q = pexpect.spawn(f'q/m64/q', env={'QHOME': qhome})
    self.q.expect('q\)')
  
  def eval(self, s):
    self.q.sendline(s)
    self.q.expect('q\)')
    _expr, *result = self.q.before.decode('utf8').splitlines()
    if len(result) > 1:
      prefix = ' ' * (len(s) + 9)
      first, *rest = result
      result = [first] + [prefix + line for line in rest]

    return '\n'.join(result)

def get_lines():
  with input_file.open() as fp:
    for line in fp:
      line = line.strip()
      if line:
        yield line

def run_examples(lines):
  q = QIntepreter()

  for line in lines:
    if line.startswith('//'):
      yield f'\n## {line[2:]}\n'
      continue

    if line.startswith('/'):
      yield f'\n### {line[1:]}\n\n'
      continue

    result = q.eval(line)
    if result:
      yield f'    {line} --> {result}\n'
    else:
      yield f'    {line}\n'

with output_file.open('w') as fp:
  fp.write('# Cheatsheet\n')
  for line in run_examples(get_lines()):
    fp.write(line)
