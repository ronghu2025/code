# BLAST 2.5.0+
makeblastdb -in ${i}.protein.fa -dbtype prot -out ./proteinDB/${i}.protein

# BLASTp
blastp -query query.fasta -out ${i}.blast.txt -db ./proteinDB/${i}.protein -outfmt 6 -evalue 1e-5 -num_threads 20

# Merge the out files
find . -type f -name "*blast.txt" -exec awk '{print FILENAME "\t" $0}' {} + > merged_file.txt

# Extract the Family and Orders of each species
cat scientific_name.txt \
| taxonkit name2taxid \
|cut -f 2 \
| taxonkit lineage \
| taxonkit reformat \
-f "{k}\t{p}\t{c}\t{o}\t{f}\t{g}\t{s}" \
        -F -P \
        |csvtk cut -t -f -2 \
        >taxon.txt

       