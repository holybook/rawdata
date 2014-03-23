host=$SOLR_HOST
core=$SOLR_CORE

if [[ -z $host ]]; then
  echo "Could not find environment variable SOLR_HOST using default";
  host="http://localhost:8983"
fi

if [[ -z $core ]]; then
  echo "Could not find environment variable SOLR_CORE using default";
  core="books_en"
fi

for file in "$@"
do
    echo "Uploading $file..."
    curl -s -o /dev/null -w "%{http_code}\n" "$host/solr/$core/update?commit=true&tr=doc.xsl" -H "Content-Type: text/xml" --data-binary @$file
done

