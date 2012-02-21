if !has('python')
    echo "Error: Required vim compiled with +python"
    finish
endif

function s:DjangoAppMakeGreen(file)
python << EOF
import os
import vim
src = os.path.realpath(os.path.dirname(vim.eval('a:file')))

def find_app_directory(path):
    patterns = (
        'tests', 'tests.py',
    )
    exit_patterns = (
        'settings.py', 'manage.py',
    )
    if path == "" or path == "/":
        return None
    for pattern in patterns:
        if os.path.exists(os.path.join(path, pattern)):
            return path
    for pattern in exit_patterns:
        if os.path.exists(os.path.join(path, pattern)):
            return None
    # recursive
    parent = os.path.dirname(path)
    if path == parent:
        return None
    return find_app_directory(parent)

app_directory = find_app_directory(src)
if app_directory:
    app_name = os.path.basename(app_directory)
    vim.command('compiler django')
    vim.command('call MakeGreen("%s")' % app_name)
else:
    vim.command('echo "No Django App directory with tests found"')
EOF
endfunction

function DjangoMakeGreen(value)
    compiler django
    if a:value == "%"
        let s:file = expand("%")
        call s:DjangoAppMakeGreen(s:file)
    elseif a:value == "."
        call MakeGreen('')
    else
        call s:DjangoAppMakeGreen(a:value)
    endif
endfunction
