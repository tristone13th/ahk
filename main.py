from ahk import AHK, Hotkey
import string

script = ""

LOWERCASE_LETTERS = list(string.ascii_lowercase)
UPPERCASE_LETTERS = list(string.ascii_uppercase)

def remap_modifier(before, after):
    global script
    for c in LOWERCASE_LETTERS:
        command = f"{before} & {c}::Send {after} & {c}\n\n"
        script += command
    
ahk = AHK()
remap_modifier("CapsLock", "ctrl")
remap_modifier("rwin", ">!")

# multitask
command = "ralt & w::Send, #7\n\n"
script += command

print(script)
ahk.run_script(script)


