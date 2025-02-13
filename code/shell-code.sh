# create a data directory
mkdir data

# copy Gries' (2009: Ch. 3) data for disfluency by gender for the descriptive statistics
cp "G:\Other computers\My MacBook Pro\Documents\qclwr_and_sflwr\_sflwr_1st\e_data_chapters_1-5\03-1_uh(m).txt" data/

# create a code directory
mkdir code

# create a yaml for manuscript configuration
touch _quarto.yml

# create html symlink
ln -s quant-ling-with-r.html index.html
