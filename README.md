# Replication Package

```shell
pip3 install -r requirements.txt
```

# Data preparation 
Put the experiment data in the folder `data/`. The data file should be named as format `trialNumber_browser_notificationStatus_notifiactionFrequency_notificationDistribution`. For example, `trial2_chrome_off_low_even.csv` is the data file for the second dataset. 
Change the folderpath in 'explore.py' to the folder where you put the data.
Change the resultpath in 'explore.py' to the folder where you want to put the results.
We use the file `explore.py` to prepare the data. 
We generate the combined data file `combined.txt` and the statistics description are shown in the file.

# Data exploration
Change the dataset path in DataExploration.Rmd to the folder where you put the data.
We make a basic data exploration in file `DataExploration.Rmd`. The results boxplots are shown in the file.