function add_header() {
  echo "==================="
}

function add_section() {
  echo "-------------------"
}

add_header
echo "AWK Tutorial"
add_section
echo "source file: answers.txt"
echo "
a,1,1
b,3,4
c,5,2
d,6,1
e,3,3
f,3,7
"

add_header
echo "AWK IF-Else"
add_section
awk -F ',' '{if($2==$3){print $1","$2","$3} else {print "No Duplicates"}}' answers.txt
add_section

add_header
echo "AWK While"
add_section


echo "First lets understand what NF in awk. as per documentation 'NF is a predefined variable whose value is the number of fields in the current record. awk automatically updates the value of NF each time it reads a record. No matter how many fields there are, the last field in a record can be represented by $NF'"

echo "lets have a sample file, like CEOs list"
add_section
echo "
Rich Lesser, Boston Consulting Group,99%
Shantanu Narayen, Adobe,99%
Peter Pisters, MD Anderson Cancer Center,99%
Gary C. Kelly, Southwest Airlines,98%
Alfred F. Kelly, Jr. Visa Inc.,97%
Satya Nadella, Microsoft,97%
Charles C. Butt, H.E.B.,97%
Ed Bastian, Delta Air Lines,97%
Paul Cormier, Red Hat,97%
Horacio D. Rozanski, Booz Allen Hamilton,97%
"
add_section


echo "Number of fields (we will get 3 fields per each line as we have 3 commad(,) separated fields"
awk -F',' '{print NF}' top10CEO.txt
add_section
echo "Lets iterate with awk"
add_section
awk -F',' '{i=0; while(i<=NF) { print i ":"$i; i++;}}' top10CEO.txt
add_section

# every row is 0, and i iterates over every field that selected row. 
# please observe the output

add_section

echo "AWK Selectors"
echo "Selectors used for deciding whether a particular awk action should be executed or not."
echo "For example display only CEOs with their name starting 'S'"
add_section
awk -F',' '$1 ~ /^S/ {print $0}' top10CEO.txt
add_section

echo "relational expressions"
add_section

awk -F',' '$3 > "98%" {print $0}' top10CEO.txt
add_section
echo "Range patterns"
add_section
awk -F',' '/Peter Pisters/,/Satya Nadella/ {print $1 $3}' top10CEO.txt
add_section

add_header
echo "Special expression patterns include BEGIN and END which denote program initialization and end. The BEGIN pattern matches the beginning of the input, before the first record is processed. The END pattern matches the end of the input, after the last record has been processed."
add_section
awk -F',' 'BEGIN { print "starting list of top 10 CEOs" }; {print $1 $2 $3} END{print "end list of top 10 CEOs"}' top10CEO.txt
add_section

add_header
echo "AWK supports && || ! "
add_section
echo " I would like to see the CEO with score greater than 97% and starting with letter S"
add_section
awk -F',' '$3 > "97%" && $1 ~/^S/ { print $1}' top10CEO.txt

add_header

echo "AWK variables"
echo "$0 -> Print full line"
echo "$1, $2 -> Field 1 and File 2..."
echo "NR-> Number of row, usually print the current row number"
echo -e "Hello\nGoodMorning" | awk '{print NR"\t" $0}'
echo "NF-> Number of fields, when you call NF it will print number of fields, and when you call $NF it will print last field, so if you have a use case like you would like to get last field, then $NF is the best case"
echo -e "123,459,905\n456,544,345" | awk -F',' '{print $NF}'
echo -e "123,459,905\n456,544,345" | awk -F',' '{print NF}'
add_section
echo "Dont mess with IFS and RS unless you know what you are doing."
add_section

add_header
echo "awk length"
add_section
awk -F',' '{print "number of chars in line " NR "=" length($0)}' top10CEO.txt
add_section

add_header
echo "Bottom Line"
echo "AWK is a great text/file processing/manipulation with so many use cases. I just added what I have learned, if you like this post, please subscribe to my blog and add a star on my gitrepo."
echo "Thakn you."