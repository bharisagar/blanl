#!/bin/bash

day=$(date +"%a")

case $day in  
    Mon|Tue|Wed|Thu|Fri)  
        echo "Today is a weekday ($day)"  
        ;;  
    Sat|Sun)  
        echo "Today is weekend ($day)"  
        ;;  
    *)  
        echo "The date is not recognized"  
        ;;  
esac
-------------------------------------------------------------
#!/bin/bash

day=$(date +"%a")

case $day in  
    Mon|Tue|Wed|Thu|Fri)  
        if [[ "$day" == "Thu" ]]; then
            echo "Today is Thursday (weekday)"
        else
            echo "Today is a weekday ($day)"  
        fi
        ;;  
    Sat|Sun)  
        if [[ "$day" == "Sun" ]]; then
            echo "Today is Sunday (weekend)"
        else
            echo "Today is weekend ($day)"  
        fi
        ;;  
    *)  
        echo "The date is not recognized"  
        ;;  
esac