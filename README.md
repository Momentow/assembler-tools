# assembler-tools
*This priject is task of low-level programming classes.*

### Prepare
First of all, you should install nasm:
```
apt install nasm
```
### How it works
You may use your own assembly code. To run it you should execute commands below:
```
nasm -f <object file type> <file name> -o <object file name>
```
```
cc -o <result file name> <object file name> -no-pie
```

**But it's to long so I made autorunner file!**

```
./run.sh <number of task file>
```
This bash makes executable file and run it. But make attention! **This runner runs only files with pattern "task(your number).asm"!**
