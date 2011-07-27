#!/bin/bash
echo "Starting"
IMPORT="./data/import-data2.csv"
NEWYORKTEMPLATE="./template/newyork-template.html"
ENTERTAINMENTTEMPLATE="./template/entertainment-template.html"
WORLDWIDETEMPLATE="./template/worldwide-template.html"
CONTENTTEMPLATE="./template/content-template.html"
INNOVATIONTEMPLATE="./template/innovation-template.html"
LONDONTEMPLATE="./template/london-template.html"
HTMLIMPUT="./output/*"
echo "Variables Declaired"
perl -pi -e 's/\r\n?/\n/g' "$IMPORT" 
cat $IMPORT | while read i
do
VAR_CONAME=$(echo "$i" | awk -F, '{print $1}')
VAR_FULLNAME=$(echo "$i" | awk -F, '{print $2}')
VAR_JOB=$(echo "$i" | awk -F, '{print $3}')
VAR_MOBILE=$(echo "$i" | awk -F, '{print $4}')
if [ "$VAR_CONAME" == "newyork" ]; then 
cat $NEWYORKTEMPLATE | sed -e "s/VAR_FULLNAME/$VAR_FULLNAME/g" -e "s/VAR_JOB/$VAR_JOB/g" -e "s/VAR_MOBILE/$VAR_MOBILE/g" | tee ./output/"$VAR_FULLNAME.html" 1>/dev/null
echo "i created a file in output called $VAR_FULLNAME"
elif [ "$VAR_CONAME" == "entertainment" ]; then
cat $ENTERTAINMENTTEMPLATE | sed -e "s/VAR_FULLNAME/$VAR_FULLNAME/g" -e "s/VAR_JOB/$VAR_JOB/g" -e "s/VAR_MOBILE/$VAR_MOBILE/g" | tee ./output/"$VAR_FULLNAME.html" 1>/dev/null
echo "i created a file in output called $VAR_FULLNAME"
elif [ "$VAR_CONAME" == "worldwide" ]; then
cat $WORLDWIDETEMPLATE | sed -e "s/VAR_FULLNAME/$VAR_FULLNAME/g" -e "s/VAR_JOB/$VAR_JOB/g" -e "s/VAR_MOBILE/$VAR_MOBILE/g" | tee ./output/"$VAR_FULLNAME.html" 1>/dev/null
echo "i created a file in output called $VAR_FULLNAME"
elif [ "$VAR_CONAME" == "content" ]; then
cat $CONTENTTEMPLATE | sed -e "s/VAR_FULLNAME/$VAR_FULLNAME/g" -e "s/VAR_JOB/$VAR_JOB/g" -e "s/VAR_MOBILE/$VAR_MOBILE/g" | tee ./output/"$VAR_FULLNAME.html" 1>/dev/null
echo "i created a file in output called $VAR_FULLNAME"
elif [ "$VAR_CONAME" == "innovation" ]; then
cat $INNOVATIONTEMPLATE | sed -e "s/VAR_FULLNAME/$VAR_FULLNAME/g" -e "s/VAR_JOB/$VAR_JOB/g" -e "s/VAR_MOBILE/$VAR_MOBILE/g" | tee ./output/"$VAR_FULLNAME.html" 1>/dev/null
echo "i created a file in output called $VAR_FULLNAME"
elif [ "$VAR_CONAME" == "london" ]; then
cat $LONDONTEMPLATE | sed -e "s/VAR_FULLNAME/$VAR_FULLNAME/g" -e "s/VAR_JOB/$VAR_JOB/g" -e "s/VAR_MOBILE/$VAR_MOBILE/g" | tee ./output/"$VAR_FULLNAME.html" 1>/dev/null
echo "i created a file in output called $VAR_FULLNAME"
else echo "Not a correct company name"
fi
done
for f in $HTMLIMPUT
do 
	Echo "Converting to webarchive $f"
	Textutil -convert webarchive -timeout 15 "$f" 
done
mv output/*.webarchive webarchives/
exit