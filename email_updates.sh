#!/bin/bash
# Written by Luke Barone
# PURPOSE: Email pre-defined list of users that updates have happened

SUBJECT="Subject line here"
FROM_EMAIL="administrator@example.com"

LIST_FILE=./email_list.txt
BODY_FILE=./email_body.txt
FOOTER_FILE=./email_footer.txt

# Check for list of users
[ -f $LIST_FILE ] && echo "List of users exists" || exit 1

# Check for message body file
[ -f $BODY_FILE ] && echo "Email Body file exists" || exit 2

# Check for Email Footer file
[ -f $FOOTER_FILE ] && echo "Email footer exists" || exit 3

# Check variables exists
[ ! -z "$SUBJECT" ] && echo "Subject Line is set" || exit 4
[ ! -z "$FROM_EMAIL" ] && echo "From Email is set" || exit 5

echo -e "\n---- Email preview below ----"
echo "From: $FROM_EMAIL"
echo "Subject: $SUBJECT"
cat $BODY_FILE $FOOTER_FILE
echo -e "-----------------------------\n"
read -n 1 -s -r -p "Press any key to continue"
echo -e "\n"
while read -r line; do
  cat $BODY_FILE $FOOTER_FILE | fmt -s | mail -a "MIME-Version: 1.0" \
                                                                  -a "Content-Type: text/html" \
                                                                  -r "$FROM_EMAIL" \
                                                                  -s "$SUBJECT" \
                                                                  $line
done < $LIST_FILE
