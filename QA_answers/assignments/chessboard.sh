# write a script to create a chessboard [black & white] on the screen using for loop.
# -n prevents a newline from being added, and -e enables interpretation of backslash escapes.
# \e[47m sets the background color to white, and \e[40m sets it to black.
# \e[0m resets the formatting to default.
for ((i=1; i<=8; i++)) 
do
    for ((j=1; j<=8; j++))
    do
        if (( (i+j) % 2 == 0 ))
        then
            echo -n -e "\e[47m  \e[0m"  # White square
        else
            echo -n -e "\e[40m  \e[0m"  # Black square
        fi
    done
done