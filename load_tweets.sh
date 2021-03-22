files='
test-data.zip
'

for file in $files; do
    :  #PASS
    # call the load_tweets.py file to load data into pg_normalized

done

for file in $files; do
    # use SQL's COPY command to load data into pg_denormalized
    
    # cat <JSONFILE> | sed 's/\\u0000//g' | psql <POSTGRES_DB_URL> -c "COPY <TABLENAME> (<COLUMNNAME>) FROM STDIN csv quote e'\x01' delimiter e'\x02';"
    # postgresql://password:username@host:port/database
    
    unzip -p $file | sed 's/\\u0000//g' | psql postgres://postgres:pass@localhost:11251/postgres -c "COPY tweets_jsonb (data) FROM STDIN csv quote e'\x01' delimiter e'\x02';"

done
