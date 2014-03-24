host=$SOLR_HOST
core=$SOLR_CORE

if [[ -z $host ]]; then
  echo "Could not find environment variable SOLR_HOST using default";
  host="http://localhost"
fi

if [[ -z $core ]]; then
  echo "Could not find environment variable SOLR_CORE using default";
  core="books_en"
fi

echo -ne "Clearing index... "
echo `curl  -s -o /dev/null -w "%{http_code}\n" "$host:8983/solr/$core/update" --data '<delete><query>*:*</query></delete>' -H 'Content-type:text/xml; charset=utf-8'  `

echo -ne "Comitting... "
echo `curl  -s -o /dev/null -w "%{http_code}\n" "$host:8983/solr/$core/update" --data '<commit/>' -H 'Content-type:text/xml; charset=utf-8'` 

