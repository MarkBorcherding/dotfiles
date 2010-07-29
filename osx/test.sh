
function f(){
foo=1;    
}

function b(){
if [ $foo -ne 0 ]; then
    echo "nope"
fi
}

f
b