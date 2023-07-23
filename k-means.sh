#!/bin/bash

#mahout canopy \
# -i docw-vectors/tfidf-vectors \
# -ow \
## -o docw-vectors/docs-canopy-centroids-Manhattan \
# -dm org.apache.mahout.common.distance.ManhattanDistanceMeasure \
# -t1 0.5 \
# -t2 0.3


k_values=(3 4 5 6 7 8 9 10)

for k in "${k_values[@]}"; do
  echo "Running kmeans with k = ${k}"
  mahout kmeans \
   -i docw-vectors/tfidf-vectors \
   -c docw-canopy-centroids-Manhattan \
   -o hdfs://lena/user/nmart001/docs-kmeans-clusters-Manhattan-${k} \
   -dm org.apache.mahout.common.distance.ManhattanDistanceMeasure \
   -cl \
   -cd 0.1 \
   -ow \
   -x 20 \
   -k ${k}
done
