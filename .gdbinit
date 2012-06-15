define cls
shell clear
end
document cls
Clears the screen with a simple command.
end

define bpl
info breakpoints
end
document bpl
List breakpoints
end

define argv
show args
end
document argv
Print program arguments
end

define reg
printf "     eax:%08X ebx:%08X  ecx:%08X ",  $eax, $ebx, $ecx
printf " edx:%08X     eflags:%08X\n",  $edx, $eflags
printf "     esi:%08X edi:%08X  esp:%08X ",  $esi, $edi, $esp
printf " ebp:%08X     eip:%08X\n", $ebp, $eip
printf "     cs:%04X  ds:%04X  es:%04X", $cs, $ds, $es
printf "  fs:%04X  gs:%04X  ss:%04X    ", $fs, $gs, $ss
flags
end
document reg
Print CPU registers
end

define iframe
info frame
info args
info locals
end
document iframe
Print stack frame
end


define func
info functions
end
document func
Print functions in target, accept RE to match name
end

define lib
info sharedlibrary
end
document lib
Print shared libraries linked to target
end

define sig
info signals
end
document sig
Print signal actions for target
end

define diss
disassemble $arg0
end
document diss
Disassemble address
Usage: dis addr
end


define context
printf "_______________________________________"
printf "________________________________________\n"
reg
printf "[%04X:%08X]------------------------", $ss, $esp
printf "---------------------------------[stack]\n"
hexdump $sp+0x30
hexdump $sp+0x20
hexdump $sp+0x10
hexdump $sp
datawin
printf "[%04X:%08X]------------------------", $cs, $eip
printf "---------------------------------[ code]\n"
x /6i $pc
printf "---------------------------------------"
printf "---------------------------------------\n"
end
document context
Print regs, stack, ds:esi, and disassemble cs:eip
end

define context-on
set $SHOW_CONTEXT = 1
end
document context-on
Enable display of context on every program stop
end

define context-off
set $SHOW_CONTEXT = 0
end
document context-off
Disable display of context on every program stop
end
# Calls "context" at every breakpoint.
define hook-stop
  context
end

define mallocinfo
  set $__f = fopen("/dev/tty", "w")
  call malloc_info(0, $__f)
  call fclose($__f)
end
document mallocinfo
Show malloc info by call malloc_info
end


# Init parameters
set output-radix 0x10
set input-radix 0x10
set disassembly-flavor intel


