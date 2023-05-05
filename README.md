# Feihong's Q Quickstart

## Installation

1. Fill out the form for [kdb+ Personal Edition](https://kx.com/kdb-personal-edition-download/)
1. In the email, click the link specific to your platform to download the zip file.
1. In the email, click the link to download the `kc.lic` license file
1. Add to your `.zshrc`:
   export QHOME=~/work/q-quickstart/q
   alias q="rlwrap -r $QHOME/m64/q"

Run

    unzip m64.zip -d $QHOME
    mv kc.lic $QHOME
    spctl --add q/m64/q
    xattr -d com.apple.quarantine q/m64/q
    q/m64/q

You will need to override your security settings when running `spctl` through the dialog that pops up. You'll see an error that says `q/m64/q: The authorization was canceled by the user`, but you can ignore it.

## Commands

Execute a program from a file

    q hello.q

## Notes

Running `pip install pyq` fails with a build error in Python 3.11.

## Links

- [Installation instructions](https://code.kx.com/q/learn/install/)
- [Reference card](https://code.kx.com/q/ref/)
- [Q by examples](https://code.kx.com/q/learn/q-by-examples/)
