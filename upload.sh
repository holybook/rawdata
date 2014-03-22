curl "http://localhost:8983/solr/books_en/update?commit=true&tr=doc.xsl" -H "Content-Type: text/xml" --data-binary @$1
