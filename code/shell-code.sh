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

# download "menawari.txt" and "menawarkan.txt" data from Rajeg (2023)
curl https://raw.githubusercontent.com/gederajeg/profiled-participant-roles/refs/heads/main/menawari.txt --output data/menawari.txt
curl https://raw.githubusercontent.com/gederajeg/profiled-participant-roles/refs/heads/main/menawarkan.txt --output data/menawarkan.txt

# download linguistics vanguard data (Rajeg et al. 2022)
gh repo clone gederajeg/lingvan-voice

# copy files to Drive for sharing with Karlina
mkdir /g/My\ Drive/kimli-2025-quantitative-workshop/data
## code
cp code/work-with-data-1.R /g/My\ Drive/kimli-2025-quantitative-workshop/code-work-with-data-1.R
## data
cp data/03-1_uh\(m\).txt data/vanguard-majukan.txt /g/My\ Drive/kimli-2025-quantitative-workshop/data
## readme
#touch /g/My\ Drive/kimli-2025-quantitative-workshop/README.md

nano /g/My\ Drive/kimli-2025-quantitative-workshop/README.md
