#!/bin/bash

mahout canopy \
 -i docw-vectors-manhattan/tfidf-vectors \
 -ow \
 -o docw-vectors-manhattan/docs-canopy-centroids-Manhattan \
 -dm org.apache.mahout.common.distance.ManhattanDistanceMeasure \
 -t1 0.5 \
 -t2 0.3

for k in {2..10}
do
  echo "Running kmeans with k = $k"
  mahout kmeans \
   -i docw-vectors-manhattan/tfidf-vectors \
   -c docw-canopy-centroids-Manhattan \
   -o docs-kmeans-clusters-Manhattan-$k \
   -dm org.apache.mahout.common.distance.ManhattanDistanceMeasure \
   -cl \
   -cd 0.1 \
   -ow \
   -x 20 \
   -k $k
done
