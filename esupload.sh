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

for file in "$@"
do
    echo -ne "Uploading $file... "
    xsltproc  -o tmp xml2json.xsl $file 
    echo `curl -s -o /dev/null -w "%{http_code}\n" -XPOST "$host:9200/books/$core/_bulk" --data-binary @tmp`
done

rm tmp

