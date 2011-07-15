#!/bin/sh
if [ ! $# -eq 2 ]
then
    echo "Modern Plone Site Policy Generator"
    echo "Usage: $0 [short policy name] [full policy name]"
    echo "Example: $0 myawesomepolicy \"My Awesome Policy\""
    exit 1
fi
SHORTNAME=$1
FULLNAME=$2

# insert the policy name where needed
SEDEXPRESSION='s/yourpolicynamegoeshere/'$SHORTNAME'/g;s/Your Policy Name Goes Here/'$FULLNAME'/g'
find -X policy.yourpolicynamegoeshere -type f | xargs -I {} sed -i '' -e "$SEDEXPRESSION" {} 

# rename the file and folder objects
mv policy.yourpolicynamegoeshere/policy/yourpolicynamegoeshere policy.yourpolicynamegoeshere/policy/$SHORTNAME 
mv policy.yourpolicynamegoeshere policy.$SHORTNAME
