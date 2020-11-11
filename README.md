# Windows Utility to Retrive Website Status and Connectivity Details.

## Requirements

* cURL >= 7.73.0
* PowerShell

## Installation
* Download [sitestat](https://github.com/damithsj/sitestat/archive/main.zip) to a local directory
* Install cURL for [windows](https://curl.se/windows/)
* Add cURL location upto bin to the PATH environment variable

## Usage
sitestat can be used to visualize web site loading stats as well as save stats to a file.
### Visualize Website Stats
```
sitestat website_url
```
Output is the timings in each step of the connection to the website until data is loaded.
```
D:\github\sitestat>sitestat https://dsj23.me
Effective URL   : https://dsj23.me/
Response Code   : 200
DNS Lookup      : 0.062000
TCP Handshake   :       |_ 0.140000
SSL Handshake   :               |_ 0.328000
Wait            :                       |_ 0.734000
Data Transfer   :                               |_ 1.031000
```
### Save Website Stats
```
sitestat website_url filename
```
This option writes timings in semicolon seperated format to the given file. 
Entry starts with the Timestamp so you can schedule the script to periodically retrive website stats.

```
2020-11-11 18:00:00;https://dsj23.me/;200;0.110000;0.141000;0.188000;0.485000;0.829000; 
2020-11-11 18:15:00;https://dsj23.me/;200;0.109000;0.140000;0.203000;0.593000;0.843000; 
2020-11-11 18:30:00;https://dsj23.me/;200;0.016000;0.031000;0.094000;0.375000;0.578000; 
```

[Detailed exlanation about cURL timings](https://blog.cloudflare.com/a-question-of-timing/)


