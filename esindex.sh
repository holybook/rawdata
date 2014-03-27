host=$ES_HOST
core=$ES_CORE

if [[ -z $host ]]; then
  echo "Could not find environment variable ES_HOST using default";
  host="http://localhost"
fi

if [[ -z $core ]]; then
  echo "Could not find environment variable ES_CORE using default";
  core="en"
fi

echo -ne "Deleting index... "
echo `curl -s -o /dev/null -w "%{http_code}\n" -XDELETE "$host:9200/books"`

echo -ne "Creating index... " 
echo `curl -s -o /dev/null -w "%{http_code}\n" -XPUT "$host:9200/books" --data-binary @index.json`

echo "Indexing..."
./esupload.sh reference-library/Abdul_Baha_in_London.xml

