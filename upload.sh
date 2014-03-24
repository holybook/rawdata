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

for file in "$@"
do
    echo -ne "Uploading $file... "
    echo `curl -s -o /dev/null -w "%{http_code}\n" "$host:8983/solr/$core/update?commit=false&tr=doc.xsl" -H "Content-Type: text/xml" --data-binary @$file`
done
echo -ne "Committing... "
curl -s -o /dev/null -w "%{http_code}\n" "$host:8983/solr/$core/update?commit=true"

