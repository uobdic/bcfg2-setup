#!/usr/bin/env bash
BACKEND_PORT='5986'
NODE_DB='nodes'
nodes='bigcouch@bc-37-00.dice.cluster
bigcouch@bc-37-01.dice.cluster
bigcouch@bc-37-02.dice.cluster
'

for node in ${nodes[@]}
do
   response=`curl --write-out %{http_code} --silent --output /dev/null -X GET http://localhost:$BACKEND_PORT/$NODE_DB/$node`
   if [ $response == 404 ]
   then
      curl -f -X PUT http://localhost:$BACKEND_PORT/$NODE_DB/$node -d {}
      if [ $? != 0 ]
      then
         echo "Could not populate nodelist - exiting"
         exit 1
      else
         echo "Successfully added $node to nodelist"
      fi
   elif [ $response == 200 ]
   then
      echo "Node $node already in nodelist"
   else
      echo "Got an unexpected response when checking if $node is already in the nodelist"
      exit 1
   fi
done
