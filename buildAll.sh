for dirname in */
do
    version=$(echo $dirname | sed 's/\///')
    docker build --tag "guywithnose/solr:${version}" $dirname
done
