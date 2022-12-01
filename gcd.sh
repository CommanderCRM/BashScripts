while true
do
    read a b
    if [ -z "$a" ] && [ -z "$b" ]; then
        echo "bye"
        break
    fi
    while [ $b -ne 0 ]
        do
            r=`expr $a % $b`
            a=$b
            b=$r
        done
    echo "GCD is $a"
done