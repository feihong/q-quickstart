from pathlib import Path
import pexpect

qhome = Path('./q').absolute()
print(qhome)
child = pexpect.spawn(f'q/m64/q', env={'QHOME': qhome})
child.expect('q\)')
child.sendline('til 6')
child.readline() # repeat the command itself
result = child.readline().decode('utf8')
print(result)

child.terminate()
