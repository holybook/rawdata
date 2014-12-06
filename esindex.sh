host=$ES_HOST
core=$ES_CORE

read -p "Enter User: " user
read -s -p "Enter Password: " password

if [[ -z $host ]]; then
  echo "Could not find environment variable ES_HOST using default";
  host="http://localhost"
fi

if [[ -z $core ]]; then
  echo "Could not find environment variable ES_CORE using default";
  core="en"
fi

echo -ne "Deleting index... "
echo `curl -u "$user:$password" -s -w "%{http_code}\n" -XDELETE "$host:9200/en"`

echo -ne "Creating index... "
echo `curl -u "$user:$password" -s -w "%{http_code}\n" -XPUT "$host:9200/en" --data-binary @index.json`

echo "Indexing..."
for file in reference-library/*.xml
do
    echo -ne "Uploading $file... "
    echo `curl -u "$user:$password" -s -o /dev/null -w "%{http_code}\n" -XPOST "$host:9200/_book" --data-binary @$file`
done
