I=0
FILE=$I.txt
SCRIPT=$I-*.sh
while [ -e $FILE ]
do
 cat $FILE
 sh $SCRIPT
 read -n1 -s -r -p $'Press any key to continue...\n' key
 I=$[$I+1]
 FILE=$I.txt
 SCRIPT=$I-*.sh
done
