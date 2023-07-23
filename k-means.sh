#!/bin/bash

for k in {2..10}
do
  echo "Running kmeans with k = $k"
  mahout kmeans \
   -i docw-vectors-manhattan/tfidf-vectors \
   -c docw-canopy-centroids-Manhattan \
   -o hdfs://lena/user/nmart001/docs-kmeans-clusters-Manhattan-$k \
   -dm org.apache.mahout.common.distance.ManhattanDistanceMeasure \
   -cl \
   -cd 0.1 \
   -ow \
   -x 20 \
   -k $k
done
