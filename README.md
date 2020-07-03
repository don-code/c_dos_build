c\_dos\_build
--

This is a build environment enabling cross-compiling of DOS apps on Linux using the
[Digital Mars C compiler](https://www.digitalmars.com/download/freecompiler.html),
WINE to run the compiler, and DOSBox to run the DOS-specific bits. The environment
is wrapped in a container image.

## Usage

`dmc` and related utilities are aliased:

```
root@94f4d0537d9d:~# dmc test.c
link test,,,user32+kernel32/noi;

root@94f4d0537d9d:~# wine test.exe
Hello, world!
```

See the compiler documentation for more information. To compile a 16-bit DOS
executable, you most likely want to invoke `dmc` with `dmc -mt`. Note that
16-bit applications run through DOSBox, not WINE - so "Hello, world!" will
output to DOSBox's emulated screen, not standard out.

## Testing

The included `test.sh` script builds an image, then attempts to compile a
small DOS application with it and verify its output.

## Disclaimer

The Digital Mars toolchain is licensed separately from this project - see
https://github.com/DigitalMars/dmc for more details.
