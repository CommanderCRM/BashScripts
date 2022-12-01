function isNumber() {
    if [[ $1 =~ ^[0-9]+$ ]]; then
        return 0
    else
        return 1
    fi
}

function isOperator() {
    if [[ $1 == "+" || $1 == "-" || $1 == "*" || $1 == "/" || $1 == "%" || $1 == "**" ]]; then
        return 0
    else
        return 1
    fi
}

function isExit() {
    if [[ $1 == "exit" ]]; then
        return 0
    else
        return 1
    fi
}

function calculate() {
    if [[ $2 == "+" ]]; then
        result=`expr $1 + $3`
    elif [[ $2 == "-" ]]; then
        result=`expr $1 - $3`
    elif [[ $2 == "*" ]]; then
        result=`expr $1 \* $3`
    elif [[ $2 == "/" ]]; then
        result=`expr $1 / $3`
    elif [[ $2 == "%" ]]; then
        result=`expr $1 % $3`
    elif [[ $2 == "**" ]]; then
        result=`echo "$1^$3" | bc`
    fi
}

while [[ 1 -eq 1 ]]; do
    read a op b
    if isExit $a; then
        echo "bye"
        break
    fi
    if isNumber $a && isOperator "$op" && isNumber $b; then
        calculate $a "$op" $b
        echo $result
    else
        echo "error"
        break
    fi
done