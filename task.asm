.386
.model flat, stdcall
option casemap:none
include \masm32\include\windows.inc
include \masm32\include\kernel32.inc
include \masm32\include\masm32.inc
include \masm32\include\user32.inc
includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\masm32.lib
includelib \masm32\lib\user32.lib
BSIZE equ 15
N equ 5 ; our number
.data 
ifmt db '%d',0
stdout dd ?
cWritten dd ?
.data?
buf db BSIZE dup(?)
.code
start:
invoke GetStdHandle, STD_OUTPUT_HANDLE 
mov edx,N
mov ecx,N
shl edx,3
shl ecx,1
add edx,ecx
mov stdout,eax
invoke wsprintf,ADDR buf,ADDR ifmt,edx
invoke WriteConsoleA,stdout,ADDR buf,BSIZE,ADDR cWritten,NULL
invoke ExitProcess,0
end start 

