for dirname in */
do
    version=$(echo $dirname | sed 's/\///')
    docker build --tag "hirnschmalz/solr:${version}" $dirname
done
