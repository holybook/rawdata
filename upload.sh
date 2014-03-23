for file in "$@"
do
    echo "Uploading $file..."
    curl -s -o /dev/null -w "%{http_code}\n" "http://localhost:8983/solr/books_en/update?commit=true&tr=doc.xsl" -H "Content-Type: text/xml" --data-binary @$file
done

