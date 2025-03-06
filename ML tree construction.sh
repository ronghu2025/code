# Clustalw v2.1
#the ClustalW interactive interface to perform alignment and generate aligned files.

#trimAl v1.4
trimAl -in FILE.align -out trimAl.FILE.align -automated1

#IQ-TREE v2.2.2.7
iqtree -m TEST -s trimAl.FILE.align -B 1000 -T AUTO 

#RaxML v8.2.13
./raxmlHPC-AVX2 -f a -x 123 -p 123 -# 10 -m PROTGAMMALGX -s trimAl.FILE.align -n FILE.newick -T AUTO -o Bacteria_sequence_IDs 
