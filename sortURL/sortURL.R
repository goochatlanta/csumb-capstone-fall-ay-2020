# Selected local sources from top 50 news outlets. Determined location by either the "About Us" section or the "Contact Us" section of the website.
# If there are no local sources in the top 50 and the next 200 sources have a substantial number of article, extend the search to #250. 
library(readr)

# Name the files using the FIPS code (see gitlab.nps.edu/eric.eckstrand/csumb-capstone-fall-ay-2020/-/blob/master/Sutter%20Laird/Python/countryCodeConversion.py)

sources <- read_csv("~/csumb-capstone-fall-ay-2020/Sutter Laird/CountrySourceCounts/Afghanistan, Islamic Republic of/sourceCounts.csv")
sources_local <- sources[ which(sources$`Source Name`=="tolonews.com" | 
                                  sources$`Source Name`=="Afghanistansun.com" |
                                  sources$`Source Name`=="pajhwok.com" |
                                  sources$`Source Name`=="outlookafghanistan.net" |
                                  sources$`Source Name`=="thefrontierpost.com" |
                                  sources$`Source Name`=="bakhtarnews.com.af" |
                                  sources$`Source Name`=="khaama.com" |
                                  sources$`Source Name`=="afghanistantimes.af" |
                                  sources$`Source Name`=="ariananews.af"), ]
write.csv(sources_local, "~/csumb-capstone-fall-ay-2020/Sutter Laird/CountrySourceCounts/Afghanistan, Islamic Republic of/local.csv", append = FALSE)
# afghanpaper is an Iranian publication
# Afghanistannews.net is out of UAE

sources <- read_csv("~/csumb-capstone-fall-ay-2020/Sutter Laird/CountrySourceCounts/Algeria, People's Democratic Republic of/sourceCounts.csv")
sources_local <- sources[ which(sources$`Source Name`=="djazairess.com" |
                                  sources$`Source Name`=="aps.dz" | 
                                  sources$`Source Name`=="lemaghrebdz.com" |
                                  sources$`Source Name`=="elbilad.net" |
                                  sources$`Source Name`=="echoroukonline.com" |
                                  sources$`Source Name`=="elmoudjahid.com" |
                                  sources$`Source Name`=="elwatan.com" |
                                  sources$`Source Name`=="liberte-algerie.com" |
                                  sources$`Source Name`=="maghrebemergent.info" |
                                  sources$`Source Name`=="ennaharonline.com" |
                                  sources$`Source Name`=="lexpressiondz.com" |
                                  sources$`Source Name`=="lequotidien-oran.com" |
                                  sources$`Source Name`=="tsa-algerie.com"), ]
write.csv(sources_local, "~/csumb-capstone-fall-ay-2020/Sutter Laird/CountrySourceCounts/Algeria, People's Democratic Republic of/local.csv", append = FALSE)
# al-fadjr.com, alroeya.ae are UAE papers

sources <- read_csv("~/csumb-capstone-fall-ay-2020/Sutter Laird/CountrySourceCounts/Angola, Republic of/sourceCounts.csv")
sources_local <- sources[ which(sources$`Source Name`=="allafrica.com" |
                                  sources$`Source Name`=="angop.ao" |
                                  sources$`Source Name`=="portalangop.co.ao" |
                                  sources$`Source Name`=="jornaldeangola.sapo.ao" |
                                  sources$`Source Name`=="angonoticias.com" |
                                  sources$`Source Name`=="portaldeangola.com" |
                                  sources$`Source Name`=="governo.gov.ao"), ]
write.csv(sources_local, "~/csumb-capstone-fall-ay-2020/Sutter Laird/CountrySourceCounts/Angola, Republic of/local.csv", append = FALSE)
# question methods of aggregation in allafrica.com citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.1027.9807&rep=rep1&type=pdf

sources <- read_csv("~/csumb-capstone-fall-ay-2020/Sutter Laird/CountrySourceCounts/Armenia, Republic of/sourceCounts.csv")
sources_local <- sources[ which(sources$`Source Name`=="armenpress.am" |
                                  sources$`Source Name`=="news.am" |
                                  sources$`Source Name`=="panorama.am" |
                                  sources$`Source Name`=="panarmenian.net" |
                                  sources$`Source Name`=="hraparak.am" |
                                  sources$`Source Name`=="tert.am" |
                                  sources$`Source Name`=="aysor.am" |
                                  sources$`Source Name`=="nt.am" |
                                  sources$`Source Name`=="oratert.com" |
                                  sources$`Source Name`=="azatutyun.am" |
                                  sources$`Source Name`=="armradio.am" |
                                  sources$`Source Name`=="aravot.am" |
                                  sources$`Source Name`=="lragir.am" |
                                  sources$`Source Name`=="en.a1plus.am" |
                                  sources$`Source Name`=="times.am" |
                                  sources$`Source Name`=="hetq.am" |
                                  sources$`Source Name`=="nyut.am" |
                                  sources$`Source Name`=="yerkir.am" |
                                  sources$`Source Name`=="armenianow.com" |
                                  sources$`Source Name`=="armtimes.com" |
                                  sources$`Source Name`=="golosarmenii.am" |
                                  sources$`Source Name`=="arminfo.info" |
                                  sources$`Source Name`=="nv.am"), ]
write.csv(sources_local, "~/csumb-capstone-fall-ay-2020/Sutter Laird/CountrySourceCounts/Armenia, Republic of/local.csv", append = FALSE)
# armenews.com is hosted in France
# asbarez.com is from California, Little Armenia; armenianweekly.com from Mass.
# yerkramas.org from Armenians of Russia 
# newsinfo.am aggregator of from all major Armenia news sites

sources <- read_csv("~/csumb-capstone-fall-ay-2020/Sutter Laird/CountrySourceCounts/Azerbaijan, Republic of/sourceCounts.csv")
sources_local <- sources[ which(sources$`Source Name`=="azertag.az" |
                                  sources$`Source Name`=="azernews.az" |
                                  sources$`Source Name`=="en.trend.az" |
                                  sources$`Source Name`=="today.az" |
                                  sources$`Source Name`=="yeniazerbaycan.com" |
                                  sources$`Source Name`=="news.az" |
                                  sources$`Source Name`=="abc.az" |
                                  sources$`Source Name`=="525.az" |
                                  sources$`Source Name`=="news.day.az" |
                                  sources$`Source Name`=="interfax.az" |
                                  sources$`Source Name`=="en.apa.az" |
                                  sources$`Source Name`=="trend.az" |
                                  sources$`Source Name`=="haqqin.az" |
                                  sources$`Source Name`=="1news.az" |
                                  sources$`Source Name`=="azerbaijannews.net" |
                                  sources$`Source Name`=="azerbaijan-news.az" |
                                  sources$`Source Name`=="kaspi.az" |
                                  sources$`Source Name`=="br.az" |
                                  sources$`Source Name`=="az.trend.az" |
                                  sources$`Source Name`=="apa.az" |
                                  sources$`Source Name`=="en.president.az"), ]
write.csv(sources_local, "~/csumb-capstone-fall-ay-2020/Sutter Laird/CountrySourceCounts/Azerbaijan, Republic of/local.csv", append = FALSE)
# vestnikkavkaza.net Joint project of the Russian State University for the Humanities and Moscow State University

sources <- read_csv("~/csumb-capstone-fall-ay-2020/Sutter Laird/CountrySourceCounts/Bahrain, Kingdom of/sourceCounts.csv")
sources_local <- sources[ which(sources$`Source Name`=="bna.bh" |
                                  sources$`Source Name`=="newsofbahrain.com" |
                                  sources$`Source Name`=="tradearabia.com" |
                                  sources$`Source Name`=="akhbar-alkhaleej.com" |
                                  sources$`Source Name`=="alayam.com" |
                                  sources$`Source Name`=="albiladpress.com" |
                                  sources$`Source Name`=="alwatannews.net" |
                                  sources$`Source Name`=="ttnworldwide.com" |
                                  sources$`Source Name`=="gdnonline.com" |
                                  sources$`Source Name`=="gulf-daily-news.com" |
                                  sources$`Source Name`=="alwasatnews.com" |
                                  sources$`Source Name`=="startupmgzn.com" |
                                  sources$`Source Name`=="shafaqna.com"), ]
write.csv(sources_local, "~/csumb-capstone-fall-ay-2020/Sutter Laird/CountrySourceCounts/Bahrain, Kingdom of/local.csv", append = FALSE)

sources <- read_csv("~/csumb-capstone-fall-ay-2020/Sutter Laird/CountrySourceCounts/Bangladesh, People's Republic of/sourceCounts.csv")
sources_local <- sources[ which(sources$`Source Name`=="thedailystar.net" |
                                  sources$`Source Name`=="dhakatoday.com" |
                                  sources$`Source Name`=="dhakatribune.com" |
                                  sources$`Source Name`=="newstoday.com.bd" |
                                  sources$`Source Name`=="bdnews24.com" |
                                  sources$`Source Name`=="daily-sun.com" |
                                  sources$`Source Name`=="bssnews.net" |
                                  sources$`Source Name`=="clickittefaq.com" |
                                  sources$`Source Name`=="bangladeshsun.com" |
                                  sources$`Source Name`=="thedailynewnation.com" |
                                  sources$`Source Name`=="thefinancialexpress-bd.com" |
                                  sources$`Source Name`=="thebangladeshtoday.com" |
                                  sources$`Source Name`=="prothom-alo.com" |
                                  sources$`Source Name`=="banglanews24.com" |
                                  sources$`Source Name`=="albd.org" |
                                  sources$`Source Name`=="firstpost.com" |
                                  sources$`Source Name`=="vnewsbd.com" |
                                  sources$`Source Name`=="theindependentbd.com" |
                                  sources$`Source Name`=="businessnews-bd.com" |
                                  sources$`Source Name`=="dhakacourier.com.bd" |
                                  sources$`Source Name`=="bangladeshchronicle.net" |
                                  sources$`Source Name`=="sylhettimes.com"), ]
write.csv(sources_local, "~/csumb-capstone-fall-ay-2020/Sutter Laird/CountrySourceCounts/Bangladesh, People's Republic of/local.csv", append = FALSE)

sources <- read_csv("~/csumb-capstone-fall-ay-2020/Sutter Laird/CountrySourceCounts/Benin, Republic of/sourceCounts.csv")
sources_local <- sources[ which(sources$`Source Name`=="acotonou.com" |
                                  sources$`Source Name`=="allafrica.com"), ]
write.csv(sources_local, "~/csumb-capstone-fall-ay-2020/Sutter Laird/CountrySourceCounts/Benin, Republic of/local.csv", append = FALSE)

sources <- read_csv("~/csumb-capstone-fall-ay-2020/Sutter Laird/CountrySourceCounts/Bhutan, Kingdom of/sourceCounts.csv")
sources_local <- sources[ which(sources$`Source Name`=="kuenselonline.com"), ]
write.csv(sources_local, "~/csumb-capstone-fall-ay-2020/Sutter Laird/CountrySourceCounts/Bhutan, Kingdom of/local.csv", append = FALSE)

sources <- read_csv("~/csumb-capstone-fall-ay-2020/Sutter Laird/CountrySourceCounts/Botswana, Republic of/sourceCounts.csv")
sources_local <- sources[ which(sources$`Source Name`=="mmegi.bw" |
                                  sources$`Source Name`=="allafrica.com" |
                                  sources$`Source Name`=="sundaystandard.info" |
                                  sources$`Source Name`=="weekendpost.co.bw" |
                                  sources$`Source Name`=="thepatriot.co.bw" |
                                  sources$`Source Name`=="bulawayo24.com"), ]
write.csv(sources_local, "~/csumb-capstone-fall-ay-2020/Sutter Laird/CountrySourceCounts/Botswana, Republic of/local.csv", append = FALSE)

sources <- read_csv("~/csumb-capstone-fall-ay-2020/Sutter Laird/CountrySourceCounts/Brunei Darussalam/sourceCounts.csv")
sources_local <- sources[ which(sources$`Source Name`=="borneobulletin.com.bn" |
                                  sources$`Source Name`=="bruneinews.net" |
                                  sources$`Source Name`=="brudirect.com"), ]
write.csv(sources_local, "~/csumb-capstone-fall-ay-2020/Sutter Laird/CountrySourceCounts/Brunei Darussalam/local.csv", append = FALSE)
# Top 250 news sources for Brunei Darasalam

sources <- read_csv("~/csumb-capstone-fall-ay-2020/Sutter Laird/CountrySourceCounts/Burkina Faso/sourceCounts.csv")
sources_local <- sources[ which(sources$`Source Name`=="fasopresse.net" |
                                  sources$`Source Name`=="allafrica.com" |
                                  sources$`Source Name`=="aouaga.com" |
                                  sources$`Source Name`=="sidwaya.bf" |
                                  sources$`Source Name`=="lefaso.net" |
                                  sources$`Source Name`=="aib.bf" |
                                  sources$`Source Name`=="fasozine.com" |
                                  sources$`Source Name`=="burkina24.com" |
                                  sources$`Source Name`=="lepays.bf"), ]
write.csv(sources_local, "~/csumb-capstone-fall-ay-2020/Sutter Laird/CountrySourceCounts/Burkina Faso/local.csv", append = FALSE)

sources <- read_csv("~/csumb-capstone-fall-ay-2020/Sutter Laird/CountrySourceCounts/Burundi, Republic of/sourceCounts.csv")
sources_local <- sources[ which(sources$`Source Name`=="arib.info" |
                                  sources$`Source Name`=="allafrica.com" |
                                  sources$`Source Name`=="iwacu-burundi.org" |
                                  sources$`Source Name`=="presidence.gov.bi" |
                                  sources$`Source Name`=="burundi-agnews.org"), ]
write.csv(sources_local, "~/csumb-capstone-fall-ay-2020/Sutter Laird/CountrySourceCounts/Burundi, Republic of/local.csv", append = FALSE)

sources <- read_csv("~/csumb-capstone-fall-ay-2020/Sutter Laird/CountrySourceCounts/Cambodia, Kingdom of/sourceCounts.csv")
sources_local <- sources[ which(sources$`Source Name`=="akp.gov.kh" |
                                  sources$`Source Name`=="khmertimeskh.com" |
                                  sources$`Source Name`=="phnompenhpost.com" |
                                  sources$`Source Name`=="cambodiantimes.com" |
                                  sources$`Source Name`=="cnv.org.kh" |
                                  sources$`Source Name`=="cambodiadaily.com"), ]
write.csv(sources_local, "~/csumb-capstone-fall-ay-2020/Sutter Laird/CountrySourceCounts/Cambodia, Kingdom of/local.csv", append = FALSE)

sources <- read_csv("~/csumb-capstone-fall-ay-2020/Sutter Laird/CountrySourceCounts/Cameroon, Republic of/sourceCounts.csv")
sources_local <- sources[ which(sources$`Source Name`=="cameroon-tribune.cm" |
                                  sources$`Source Name`=="allafrica.com" |
                                  sources$`Source Name`=="camer.be" |
                                  sources$`Source Name`=="cameroon-info.net" |
                                  sources$`Source Name`=="cameroun24.net" |
                                  sources$`Source Name`=="cameroononline.org" |
                                  sources$`Source Name`=="journalducameroun.com" |
                                  sources$`Source Name`=="237online.com" |
                                  sources$`Source Name`=="crtv.cm" |
                                  sources$`Source Name`=="cameroon-one.com" |
                                  sources$`Source Name`=="investiraucameroun.com" |
                                  sources$`Source Name`=="businessincameroon.com" |
                                  sources$`Source Name`=="cameroon-concord.com" |
                                  sources$`Source Name`=="camerpost.com" |
                                  sources$`Source Name`=="cameroun-online.com" |
                                  sources$`Source Name`=="cameroonjournal.com"), ]
write.csv(sources_local, "~/csumb-capstone-fall-ay-2020/Sutter Laird/CountrySourceCounts/Cameroon, Republic of/local.csv", append = FALSE)

sources <- read_csv("~/csumb-capstone-fall-ay-2020/Sutter Laird/CountrySourceCounts/Cape Verde, Republic of/sourceCounts.csv")
sources_local <- sources[ which(sources$`Source Name`=="inforpress.publ.cv" |
                                  sources$`Source Name`=="expressodasilhas.cv" |
                                  sources$`Source Name`=="anacao.cv" |
                                  sources$`Source Name`=="governo.cv" |
                                  sources$`Source Name`=="allafrica.com" |
                                  sources$`Source Name`=="expressodasilhas.sapo.cv" |
                                  sources$`Source Name`=="asemana.publ.cv" |
                                  sources$`Source Name`=="rtc.cv"), ]
write.csv(sources_local, "~/csumb-capstone-fall-ay-2020/Sutter Laird/CountrySourceCounts/Cape Verde, Republic of/local.csv", append = FALSE)

sources <- read_csv("~/csumb-capstone-fall-ay-2020/Sutter Laird/CountrySourceCounts/Central African Republic/sourceCounts.csv")
sources_local <- sources[ which(sources$`Source Name`=="centrafrique-presse.info"), ]
write.csv(sources_local, "~/csumb-capstone-fall-ay-2020/Sutter Laird/CountrySourceCounts/Central African Republic/local.csv", append = FALSE)

sources <- read_csv("~/csumb-capstone-fall-ay-2020/Sutter Laird/CountrySourceCounts/Chad, Republic of/sourceCounts.csv")
sources_local <- sources[ which(sources$`Source Name`=="alwihdainfo.com" |
                                  sources$`Source Name`=="tchadactuel.com"), ]
write.csv(sources_local, "~/csumb-capstone-fall-ay-2020/Sutter Laird/CountrySourceCounts/Chad, Republic of/local.csv", append = FALSE)

sources <- read_csv("~/csumb-capstone-fall-ay-2020/Sutter Laird/CountrySourceCounts/Comoros, Union of the/sourceCounts.csv")
sources_local <- sources[ which(sources$`Source Name`=="alwatwan.net" |
                                  sources$`Source Name`=="mayottehebdo.com"), ]
write.csv(sources_local, "~/csumb-capstone-fall-ay-2020/Sutter Laird/CountrySourceCounts/Comoros, Union of the/local.csv", append = FALSE)

sources <- read_csv("~/csumb-capstone-fall-ay-2020/Sutter Laird/CountrySourceCounts/Congo, Democratic Republic of the/sourceCounts.csv")
sources_local <- sources[ which(sources$`Source Name`=="allafrica.com" |
                                  sources$`Source Name`=="mediacongo.net" |
                                  sources$`Source Name`=="radiookapi.net" |
                                  sources$`Source Name`=="lephareonline.net" |
                                  sources$`Source Name`=="kongotimes.info" |
                                  sources$`Source Name`=="digitalcongo.net" |
                                  sources$`Source Name`=="laprosperiteonline.net" |
                                  sources$`Source Name`=="lecongolais.cd" |
                                  sources$`Source Name`=="adiac-congo.com"), ]
write.csv(sources_local, "~/csumb-capstone-fall-ay-2020/Sutter Laird/CountrySourceCounts/Congo, Democratic Republic of the/local.csv", append = FALSE)

# journaldebrazza is based in Ivory Coast. 
# Dac E-news is based in France. 
# Continued searching up to #250

sources<- read_csv("~/csumb-capstone-fall-ay-2020/Sutter Laird/CountrySourceCounts/Congo, Republic of the/sourceCounts.csv")
#Republic of Congo - Brazzaville
sources_local <- sources[ which(sources$`Source Name`=="allafrica.com" |
                                  sources$`Source Name`=="adiac-congo.com" |
                                  sources$`Source Name`=="digitalcongo.net" |
                                  sources$`Source Name`=="mediacongo.net" |
                                  sources$`Source Name`=="demainlenouveaucongobrazzaville.org" |
                                  sources$`Source Name`=="laprosperiteonline.net" |
                                  sources$`Source Name`=="groupelavenir.org" |
                                  sources$`Source Name`=="kongotimes.info" |
                                  sources$`Source Name`=="lephareonline.net" |
                                  sources$`Source Name`=="congopage.com"), ]
write.csv(sources_local, "~/csumb-capstone-fall-ay-2020/Sutter Laird/CountrySourceCounts/Congo, Republic of the/local.csv", append = FALSE)

# journaldebrazza is based in Ivory Coast. 
# Dac E-news is based in France. 
# Continued searching up to #250

sources <- read_csv("~/csumb-capstone-fall-ay-2020/Sutter Laird/CountrySourceCounts/Cote d'Ivoire, Republic of/sourceCounts.csv")
sources_local <- sources[ which(sources$`Source Name`=="abidjan.net" |
                                  sources$`Source Name`=="allafrica.com" |
                                  sources$`Source Name`=="lepointsur.com" |
                                  sources$`Source Name`=="cote-d-ivoire.net" |
                                  sources$`Source Name`=="gouv.ci" |
                                  sources$`Source Name`=="rti.ci"), ]
write.csv(sources_local, "~/csumb-capstone-fall-ay-2020/Sutter Laird/CountrySourceCounts/Cote d'Ivoire/local.csv", append = FALSE)

sources <- read_csv("~/csumb-capstone-fall-ay-2020/Sutter Laird/CountrySourceCounts/Djibouti, Republic of/sourceCounts.csv")
sources_local <- sources[ which(sources$`Source Name`=="geeskaafrika.com" |
                                  sources$`Source Name`=="djiboutination.com" |
                                  sources$`Source Name`=="presidence.dj" |
                                  sources$`Source Name`=="alqarn.dj"), ]
write.csv(sources_local, "~/csumb-capstone-fall-ay-2020/Sutter Laird/CountrySourceCounts/Djibouti, Republic of/local.csv", append = FALSE)
# In Djibouti, I went searching up to #250

sources <- read_csv("~/csumb-capstone-fall-ay-2020/Sutter Laird/CountrySourceCounts/Egypt, Arab Republic of/sourceCounts.csv")
sources_local <- sources[ which(sources$`Source Name`=="albawabhnews.com" | 
                                  sources$`Source Name`=="ahram.org.eg" |
                                  sources$`Source Name`=="elbalad.news" |
                                  sources$`Source Name`=="el-balad.com" |
                                  sources$`Source Name`=="dostor.org" |
                                  sources$`Source Name`=="almasryalyoum.com" |
                                  sources$`Source Name`=="shorouknews.com" |
                                  sources$`Source Name`=="elbashayeronline.com" | # redirects to elbashayer.com/
                                  sources$`Source Name`=="egynews.net" |
                                  sources$`Source Name`=="egypttoday.com" |
                                  sources$`Source Name`=="soutalomma.com" |
                                  sources$`Source Name`=="dailynewsegypt.com" |
                                  sources$`Source Name`=="almalnews.com" |
                                  sources$`Source Name`=="elfagr.com" |
                                  sources$`Source Name`=="nile.eg" |
                                  sources$`Source Name`=="akhbarelyom.com" |
                                  sources$`Source Name`=="elwatannews.com" |
                                  sources$`Source Name`=="hamrinnews.net" |
                                  sources$`Source Name`=="elmethaq.net" |
                                  sources$`Source Name`=="vetogate.com"), ]
write.csv(sources_local, "~/csumb-capstone-fall-ay-2020/Sutter Laird/CountrySourceCounts/Egypt, Arab Republic of/local.csv", append = FALSE)

sources <- read_csv("~/csumb-capstone-fall-ay-2020/Sutter Laird/CountrySourceCounts/Equatorial Guinea, Republic of/sourceCounts.csv")
sources_local <- sources[ which(sources$`Source Name`=="guineaecuatorialpress.com"), ] #Checked everything with 4 or more articles
write.csv(sources_local, "~/csumb-capstone-fall-ay-2020/Sutter Laird/CountrySourceCounts/Equatorial Guinea, Republic of/local.csv", append = FALSE)

sources <- read_csv("~/csumb-capstone-fall-ay-2020/Sutter Laird/CountrySourceCounts/Eritrea, State of/sourceCounts.csv")
sources_local <- sources[ which(sources$`Source Name`=="shabait.com"|
                                  sources$`Source Name`=="tesfanews.net"| #pretty sure
                                  sources$`Source Name`=="asmarino.com"), ]
write.csv(sources_local, "~/csumb-capstone-fall-ay-2020/Sutter Laird/CountrySourceCounts/Eritrea, State of/local.csv", append = FALSE)

sources <- read_csv("~/csumb-capstone-fall-ay-2020/Sutter Laird/CountrySourceCounts/Ethiopia, Federal Democratic Republic of/sourceCounts.csv")
sources_local <- sources[ which(sources$`Source Name`=="waltainfo.com"|
                                  sources$`Source Name`=="addisfortune.news/"| 
                                  sources$`Source Name`=="capitalethiopia.com/"|
                                  sources$`Source Name`=="newbusinessethiopia.com"|
                                  sources$`Source Name`=="nazret.com/"|
                                  sources$`Source Name`=="durame.com/"|
                                  sources$`Source Name`=="ezega.com/"|
                                  sources$`Source Name`=="2merkato.com/"), ]
write.csv(sources_local, "~/csumb-capstone-fall-ay-2020/Sutter Laird/CountrySourceCounts/Ethiopia, Federal Democratic Republic of/local.csv", append = FALSE)

sources <- read_csv("~/csumb-capstone-fall-ay-2020/Sutter Laird/CountrySourceCounts/Gabon, Gabonese Republic/sourceCounts.csv")
sources_local <- sources[ which(sources$`Source Name`=="alibreville.com/"|
                                  sources$`Source Name`=="gabonactu.com/"| 
                                  sources$`Source Name`=="infosplusgabon.com/"| 
                                  sources$`Source Name`=="agpgabon.ga/"), ]
write.csv(sources_local, "~/csumb-capstone-fall-ay-2020/Sutter Laird/CountrySourceCounts/Gabon, Gabonese Republic/local.csv", append = FALSE)

sources <- read_csv("~/csumb-capstone-fall-ay-2020/Sutter Laird/CountrySourceCounts/Gambia, Republic of the/sourceCounts.csv")
sources_local <- sources[ which(sources$`Source Name`=="thepoint.gm"|
                                  sources$`Source Name`=="freedomnewspaper.com"| 
                                  sources$`Source Name`=="foroyaa.gm"| 
                                  sources$`Source Name`=="gambianewsonline.com"), ]
write.csv(sources_local, "~/csumb-capstone-fall-ay-2020/Sutter Laird/CountrySourceCounts/Gambia, Republic of/local.csv", append = FALSE)

sources <- read_csv("~/csumb-capstone-fall-ay-2020/Sutter Laird/CountrySourceCounts/Georgia/sourceCounts.csv")
sources_local <- sources[ which(sources$`Source Name`=="agenda.ge"|
                                  sources$`Source Name`=="georgiatoday.ge"| 
                                  sources$`Source Name`=="civil.ge"| 
                                  sources$`Source Name`=="dfwatch.net"| 
                                  sources$`Source Name`=="georgianjournal.ge"| 
                                  sources$`Source Name`=="finchannel.com"), ]
write.csv(sources_local, "~/csumb-capstone-fall-ay-2020/Sutter Laird/CountrySourceCounts/Georgia/local.csv", append = FALSE)

sources <- read_csv("~/csumb-capstone-fall-ay-2020/Sutter Laird/CountrySourceCounts/Ghana, Republic of/sourceCounts.csv")
sources_local <- sources[ which(sources$`Source Name`=="ghanaweb.com"| 
                                  sources$`Source Name`=="modernghana.com"| 
                                  sources$`Source Name`=="ghanavisions.com"|
                                  sources$`Source Name`=="myjoyonline.com"| 
                                  sources$`Source Name`=="businessghana.com"| 
                                  sources$`Source Name`=="graphic.com.gh"| 
                                  sources$`Source Name`=="ghananewsagency.org"| 
                                  sources$`Source Name`=="citifmonline.com"| 
                                  sources$`Source Name`=="peacefmonline.com"| 
                                  sources$`Source Name`=="newsghana.com.gh"| 
                                  sources$`Source Name`=="pulse.com.gh"| 
                                  sources$`Source Name`=="ghanastar.com"| 
                                  sources$`Source Name`=="ghanamma.com"| 
                                  sources$`Source Name`=="ghanaiantimes.com.gh"| 
                                  sources$`Source Name`=="yen.com.gh"| 
                                  sources$`Source Name`=="spyghana.com"| 
                                  sources$`Source Name`=="primenewsghana.com"| 
                                  sources$`Source Name`=="theheraldghana.com"| 
                                  sources$`Source Name`=="allghananews.com"| 
                                  sources$`Source Name`=="ghana.gov.gh"| 
                                  sources$`Source Name`=="businessdayghana.com"| 
                                  sources$`Source Name`=="dailyguideghana.com"| 
                                  sources$`Source Name`=="gbcghana.com"), ]
write.csv(sources_local, "~/csumb-capstone-fall-ay-2020/Sutter Laird/CountrySourceCounts/Ghana, Republic of/local.csv", append = FALSE)

sources <- read_csv("~/csumb-capstone-fall-ay-2020/Sutter Laird/CountrySourceCounts/Guinea, Republic of/sourceCounts.csv") #I see a lot of overlap between different Guineas (Bisseu, Equitorial, etc), might be a concern
sources_local <- sources[ which(sources$`Source Name`=="guineematin.com"|
                                  sources$`Source Name`=="kaloumpresse.com"| 
                                  sources$`Source Name`=="guineenews.org "| 
                                  sources$`Source Name`=="kababachir.com"| 
                                  sources$`Source Name`=="africaguinee.com"| #maybe Guinea-Bissau
                                  sources$`Source Name`=="guinee7.com"| 
                                  sources$`Source Name`=="lexpressguinee.com"| 
                                  sources$`Source Name`=="aminata.com"| 
                                  sources$`Source Name`=="tamtamguinee.com"), ]
write.csv(sources_local, "~/csumb-capstone-fall-ay-2020/Sutter Laird/CountrySourceCounts/Guinea, Republic of/local.csv", append = FALSE)

sources <- read_csv("~/csumb-capstone-fall-ay-2020/Sutter Laird/CountrySourceCounts/Guinea-Bissau, Republic of/sourceCounts.csv") 
sources_local <- sources[ which(sources$`Source Name`=="bissaudigital.com"), ] #Only 2 articles. If I look for more, it will only be sources with 1 article
write.csv(sources_local, "~/csumb-capstone-fall-ay-2020/Sutter Laird/CountrySourceCounts/Guinea-Bissau, Republic of/local.csv", append = FALSE)

sources <- read_csv("~/csumb-capstone-fall-ay-2020/Sutter Laird/CountrySourceCounts/India, Republic of/sourceCounts.csv") #I see a lot of overlap between different Guineas (Bisseu, Equitorial, etc), might be a concern
sources_local <- sources[ which(sources$`Source Name`=="indiatimes.com"|
                                  sources$`Source Name`=="aninews.in"| 
                                  sources$`Source Name`=="india.com"| 
                                  sources$`Source Name`=="firstpost.com"|
                                  sources$`Source Name`=="idrw.org"| 
                                  sources$`Source Name`=="indianexpress.com"| 
                                  sources$`Source Name`=="dnaindia.com"|
                                  sources$`Source Name`=="thehindu.com"| 
                                  sources$`Source Name`=="thewire.in"| 
                                  sources$`Source Name`=="hindustantimes.com"|
                                  sources$`Source Name`=="btvi.in"| #Located in India, but was owned by Bloomberg for a while
                                  sources$`Source Name`=="indiatoday.intoday.in"| 
                                  sources$`Source Name`=="ndtv.com"|
                                  sources$`Source Name`=="indiatvnews.com"| 
                                  sources$`Source Name`=="asianage.com"| 
                                  sources$`Source Name`=="deccanchronicle.com"|
                                  sources$`Source Name`=="ptinews.com"| 
                                  sources$`Source Name`=="sify.com"| 
                                  sources$`Source Name`=="deccanherald.com"|
                                  sources$`Source Name`=="livemint.com"| 
                                  sources$`Source Name`=="tribuneindia.com"| 
                                  sources$`Source Name`=="dailypioneer.com"|
                                  sources$`Source Name`=="oneindia.com"| 
                                  sources$`Source Name`=="outlookindia.com"| 
                                  sources$`Source Name`=="indiagazette.com"| #Their contact info says Australia, but startedin India and says they're based in India as well
                                  sources$`Source Name`=="newindianexpress.com"| 
                                  sources$`Source Name`=="prokerala.com"| 
                                  sources$`Source Name`=="webindia123.com"|
                                  sources$`Source Name`=="thestatesman.com"| 
                                  sources$`Source Name`=="thehindubusinessline.com"| 
                                  sources$`Source Name`=="newkerala.com"| #Not sure
                                  sources$`Source Name`=="freepressjournal.in"| 
                                  sources$`Source Name`=="ianslive.in"| 
                                  sources$`Source Name`=="jagran.com"|
                                  sources$`Source Name`=="siasat.com"|
                                  sources$`Source Name`=="defencenews.in"), ]
write.csv(sources_local, "~/csumb-capstone-fall-ay-2020/Sutter Laird/CountrySourceCounts/India, Republic of/local.csv", append = FALSE)

sources <- read_csv("~/csumb-capstone-fall-ay-2020/Sutter Laird/CountrySourceCounts/Indonesia, Republic of/sourceCounts.csv") 
sources_local <- sources[ which(sources$`Source Name`=="thejakartapost.com"|
                                  sources$`Source Name`=="antaranews.com"| 
                                  sources$`Source Name`=="tribunnews.com"|
                                  sources$`Source Name`=="republika.co.id"| 
                                  sources$`Source Name`=="beritasatu.com"|
                                  sources$`Source Name`=="metrotvnews.com"| 
                                  sources$`Source Name`=="liputan6.com"|
                                  sources$`Source Name`=="inilah.com"| 
                                  sources$`Source Name`=="jakartaglobe.id"|
                                  sources$`Source Name`=="kompas.com"|
                                  sources$`Source Name`=="bisnis.com"| 
                                  sources$`Source Name`=="okezone.com"|
                                  sources$`Source Name`=="viva.co.id"), ]
write.csv(sources_local, "~/csumb-capstone-fall-ay-2020/Sutter Laird/CountrySourceCounts/Indonesia, Republic of/local.csv", append = FALSE)

sources <- read_csv("~/csumb-capstone-fall-ay-2020/Sutter Laird/CountrySourceCounts/Iran, Islamic Republic of/sourceCounts.csv") 
sources_local <- sources[ which(sources$`Source Name`=="theiranproject.com"|
                                  sources$`Source Name`=="irna.ir"| 
                                  sources$`Source Name`=="presstv.com"|
                                  sources$`Source Name`=="iranherald.com"| 
                                  sources$`Source Name`=="presstv.ir"| 
                                  sources$`Source Name`=="tasnimnews.com"), ]
write.csv(sources_local, "~/csumb-capstone-fall-ay-2020/Sutter Laird/CountrySourceCounts/Iran, Islamic Republic of/local.csv", append = FALSE)

sources <- read_csv("~/csumb-capstone-fall-ay-2020/Sutter Laird/CountrySourceCounts/Iraq, Republic of/sourceCounts.csv") 
sources_local <- sources[ which(sources$`Source Name`=="iraqakhbar.com"|
                                  sources$`Source Name`=="almadapaper.net"|
                                  sources$`Source Name`=="akhbaar.org"| #not sure 
                                  sources$`Source Name`=="newsabah.com"| 
                                  sources$`Source Name`=="sotaliraq.com"| 
                                  sources$`Source Name`=="alsabaah.iq"), ]
write.csv(sources_local, "~/csumb-capstone-fall-ay-2020/Sutter Laird/CountrySourceCounts/Iraq, Republic of/local.csv", append = FALSE)

sources <- read_csv("~/csumb-capstone-fall-ay-2020/Sutter Laird/CountrySourceCounts/Israel, State of/sourceCounts.csv") 
sources_local <- sources[ which(sources$`Source Name`=="timesofisrael.com"|
                                  sources$`Source Name`=="globes.co.il"| 
                                  sources$`Source Name`=="israelherald.com"|
                                  sources$`Source Name`=="ynetnews.com"| 
                                  sources$`Source Name`=="algemeiner.com"| 
                                  sources$`Source Name`=="themarker.com"| 
                                  sources$`Source Name`=="haaretz.com"|
                                  sources$`Source Name`=="israelnationalnews.com"| 
                                  sources$`Source Name`=="jpost.com"), ]
write.csv(sources_local, "~/csumb-capstone-fall-ay-2020/Sutter Laird/CountrySourceCounts/Israel, State of/local.csv", append = FALSE)

#I think vosizneias.com and jns.org are US based, but I'm not sure

sources <- read_csv("~/csumb-capstone-fall-ay-2020/Sutter Laird/CountrySourceCounts/Japan/sourceCounts.csv") 
sources_local <- sources[ which(sources$`Source Name`=="japantimes.co.jp"|
                                  sources$`Source Name`=="the-japan-news.com"| 
                                  sources$`Source Name`=="nikkei.com"|
                                  sources$`Source Name`=="the-japan-news.com"| 
                                  sources$`Source Name`=="japanherald.com"| 
                                  sources$`Source Name`=="mainichi.jp"), ]
write.csv(sources_local, "~/csumb-capstone-fall-ay-2020/Sutter Laird/CountrySourceCounts/Japan/local.csv", append = FALSE)

sources <- read_csv("~/csumb-capstone-fall-ay-2020/Sutter Laird/CountrySourceCounts/Jordan, Hashemite Kingdom of/sourceCounts.csv") 
sources_local <- sources[ which(sources$`Source Name`=="petra.gov.jo"|
                                  sources$`Source Name`=="ammonnews.net"| 
                                  sources$`Source Name`=="alrai.com"|
                                  sources$`Source Name`=="alghad.com"| 
                                  sources$`Source Name`=="alanbatnews.net"|
                                  sources$`Source Name`=="albawaba.com"| 
                                  sources$`Source Name`=="sarayanews.com"|
                                  sources$`Source Name`=="addustour.com"| 
                                  sources$`Source Name`=="khaberni.com"|
                                  sources$`Source Name`=="jordantimes.com"), ]
write.csv(sources_local, "~/csumb-capstone-fall-ay-2020/Sutter Laird/CountrySourceCounts/Jordan, Hashemite Kingdom of/local.csv", append = FALSE)

sources <- read_csv("~/csumb-capstone-fall-ay-2020/Sutter Laird/CountrySourceCounts/Kazakhstan, Republic of/sourceCounts.csv") 
sources_local <- sources[ which(sources$`Source Name`=="inform.kz"|
                                  sources$`Source Name`=="forbes.kz"| #Does a local Forbes count?
                                  sources$`Source Name`=="astanatimes.com"|
                                  sources$`Source Name`=="kt.kz"|
                                  sources$`Source Name`=="kazpravda.kz"|
                                  sources$`Source Name`=="kursiv.kz"|
                                  sources$`Source Name`=="bnews.kz"|
                                  sources$`Source Name`=="kazakh-tv.kz"), ]
write.csv(sources_local, "~/csumb-capstone-fall-ay-2020/Sutter Laird/CountrySourceCounts/Kazakhstan, Republic of/local.csv", append = FALSE)

sources <- read_csv("~/csumb-capstone-fall-ay-2020/Sutter Laird/CountrySourceCounts/Kenya, Republic of/sourceCounts.csv") 
sources_local <- sources[ which(sources$`Source Name`=="standardmedia.co.ke"|
                                  sources$`Source Name`=="nation.co.ke"| 
                                  sources$`Source Name`=="capitalfm.co.ke"|
                                  sources$`Source Name`=="kenyastar.com"|
                                  sources$`Source Name`=="citizentv.co.ke"|
                                  sources$`Source Name`=="tuko.co.ke"|
                                  sources$`Source Name`=="kbc.co.ke"|
                                  sources$`Source Name`=="sde.co.ke"|
                                  sources$`Source Name`=="the-star.co.ke"), ]
write.csv(sources_local, "~/csumb-capstone-fall-ay-2020/Sutter Laird/CountrySourceCounts/Kenya, Republic of/local.csv", append = FALSE)

sources <- read_csv("~/csumb-capstone-fall-ay-2020/Sutter Laird/CountrySourceCounts/Korea, Democratic People's Republic of/sourceCounts.csv") 
sources_local <- sources[ which(sources$`Source Name`==""|
                                  sources$`Source Name`==""|
                                  sources$`Source Name`==""), ]
write.csv(sources_local, "~/csumb-capstone-fall-ay-2020/Sutter Laird/CountrySourceCounts/Korea, Democratic People's Republic of/local.csv", append = FALSE)

#I can't figure out if North Korea Times is local, I don't think it is. Can't find any other North Korean sources in top 50

sources <- read_csv("~/csumb-capstone-fall-ay-2020/Sutter Laird/CountrySourceCounts/Korea, Republic of/sourceCounts.csv") 
sources_local <- sources[ which(sources$`Source Name`=="yonhapnews.co.kr"|
                                  sources$`Source Name`=="koreaherald.com"|
                                  sources$`Source Name`=="koreatimes.co.kr"|
                                  sources$`Source Name`=="donga.com"|
                                  sources$`Source Name`=="joins.com"|
                                  sources$`Source Name`=="chosun.com"|
                                  sources$`Source Name`=="diodeo.com"|
                                  sources$`Source Name`=="hani.co.kr"|
                                  sources$`Source Name`=="heraldcorp.com"|
                                  sources$`Source Name`=="ohmynews.com"|
                                  sources$`Source Name`=="koreaobserver.com"|
                                  sources$`Source Name`=="hankookilbo.com"|
                                  sources$`Source Name`=="news1.kr"|
                                  sources$`Source Name`=="arirang.co.kr"|
                                  sources$`Source Name`=="kbs.co.kr"), ]
write.csv(sources_local, "~/csumb-capstone-fall-ay-2020/Sutter Laird/CountrySourceCounts/Korea, Republic of/local.csv", append = FALSE)

sources <- read_csv("~/csumb-capstone-fall-ay-2020/Sutter Laird/CountrySourceCounts/Kuwait, State of/sourceCounts.csv") 
sources_local <- sources[ which(sources$`Source Name`=="kuna.net.kw"|
                                  sources$`Source Name`=="aljarida.com"|
                                  sources$`Source Name`=="kuwaittimes.net"|
                                  sources$`Source Name`=="arabtimesonline.com"|
                                  sources$`Source Name`=="al-seyassah.com"|
                                  sources$`Source Name`=="alufuqnews.com"| #not sure
                                  sources$`Source Name`=="alanba.com.kw"|
                                  sources$`Source Name`=="alqabas.com.kw"|
                                  sources$`Source Name`=="alkhabarkw.com"| #not sure
                                  sources$`Source Name`=="e.gov.kw"|
                                  sources$`Source Name`=="alraimedia.com"), ]
write.csv(sources_local, "~/csumb-capstone-fall-ay-2020/Sutter Laird/CountrySourceCounts/Kuwait, State of/local.csv", append = FALSE)

sources <- read_csv("~/csumb-capstone-fall-ay-2020/Sutter Laird/CountrySourceCounts/Kyrgyz Republic/sourceCounts.csv") 
sources_local <- sources[ which(sources$`Source Name`=="kabar.kg"|
                                  sources$`Source Name`=="akipress.com"|
                                  sources$`Source Name`=="eng.24.kg"|
                                  sources$`Source Name`=="azattyk.org"|
                                  sources$`Source Name`=="24.kg"|
                                  sources$`Source Name`=="vb.kg"|
                                  sources$`Source Name`=="tazabek.kg"|
                                  sources$`Source Name`=="knews.kg"|
                                  sources$`Source Name`=="akipress.org"), ]
write.csv(sources_local, "~/csumb-capstone-fall-ay-2020/Sutter Laird/CountrySourceCounts/Kyrgyz Republic/local.csv", append = FALSE)

sources <- read_csv("~/csumb-capstone-fall-ay-2020/Sutter Laird/CountrySourceCounts/Lao People's Democratic Republic/sourceCounts.csv") 
sources_local <- sources[ which(sources$`Source Name`=="vientianetimes.la"), ]
write.csv(sources_local, "~/csumb-capstone-fall-ay-2020/Sutter Laird/CountrySourceCounts/Lao People's Democratic Republic/local.csv", append = FALSE)
#Can't find any more. Wikipedia says there's only 5 or so newspapers in Laos

sources <- read_csv("~/csumb-capstone-fall-ay-2020/Sutter Laird/CountrySourceCounts/Lebanon, Lebanese Republic/sourceCounts.csv") 
sources_local <- sources[ which(sources$`Source Name`=="nna-leb.gov.lb"|
                                  sources$`Source Name`=="almanar.com.lb"|
                                  sources$`Source Name`=="lebanon24.com"|
                                  sources$`Source Name`=="aljoumhouria.com"|
                                  sources$`Source Name`=="lebanondebate.com"|
                                  sources$`Source Name`=="aliwaa.com"|
                                  sources$`Source Name`=="lebanese-forces.com"|
                                  sources$`Source Name`=="almarkazia.net"|
                                  sources$`Source Name`=="al-binaa.com"|
                                  sources$`Source Name`=="al-akhbar.com"|
                                  sources$`Source Name`=="alankabout.com"|
                                  sources$`Source Name`=="naharnet.com"|
                                  sources$`Source Name`=="almustaqbal.com"), ]
write.csv(LB_local, "~/csumb-capstone-fall-ay-2020/Sutter Laird/CountrySourceCounts/Lebanon, Lebanese Republic/local.csv", append = FALSE)

#Not sure if dailystar.com.lb counts

+sources <- read_csv("~/csumb-capstone-fall-ay-2020/Sutter Laird/CountrySourceCounts/Lesotho, Kingdom of/sourceCounts.csv") 
sources_local <- sources[ which(sources$`Source Name`=="lestimes.com"|
                                  sources$`Source Name`=="thepost.co.ls"|
                                  sources$`Source Name`=="informativenews.co.ls"|
                                  sources$`Source Name`=="sundayexpress.co.ls"), ]
write.csv(sources_local, "~/csumb-capstone-fall-ay-2020/Sutter Laird/CountrySourceCounts/Lesotho, Kingdom of/local.csv", append = FALSE)

sources <- read_csv("~/csumb-capstone-fall-ay-2020/Sutter Laird/CountrySourceCounts/Liberia, Republic of/sourceCounts.csv") 
sources_local <- sources[ which(sources$`Source Name`=="thenewdawnliberia.com"|
                                  sources$`Source Name`=="gnnliberia.com"|
                                  sources$`Source Name`=="emansion.gov.lr"|
                                  sources$`Source Name`=="tlcafrica.com"|
                                  sources$`Source Name`=="heritageliberia.net"|
                                  sources$`Source Name`=="thenewrepublicliberia.com"| #newrepublicliberia.com is related to liberia, but thenewrepublicliberia is not. Look into
                                  sources$`Source Name`=="liberianewsagency.org"| #only 1 page
                                  sources$`Source Name`=="theperspective.org"|
                                  sources$`Source Name`=="liberianobserver.com"), ]
write.csv(sources_local, "~/csumb-capstone-fall-ay-2020/Sutter Laird/CountrySourceCounts/Liberia, Republic of/local.csv", append = FALSE)

sources <- read_csv("~/csumb-capstone-fall-ay-2020/Sutter Laird/CountrySourceCounts/Libyan Arab Jamahiriya/sourceCounts.csv") 
sources_local <- sources[ which(sources$`Source Name`=="libyaakhbar.com"|
                                  sources$`Source Name`=="lana-news.ly"|
                                  sources$`Source Name`=="alwasat.ly"), ]
write.csv(sources_local, "~/csumb-capstone-fall-ay-2020/Sutter Laird/CountrySourceCounts/Libyan Arab Jamahiriya/local.csv", append = FALSE)

sources <- read_csv("~/csumb-capstone-fall-ay-2020/Sutter Laird/CountrySourceCounts/Madagascar, Republic of/sourceCounts.csv") 
sources_local <- sources[ which(sources$`Source Name`=="midi-madagasikara.mg"|
                                  sources$`Source Name`=="lexpressmada.com"|
                                  sources$`Source Name`=="presidence.gov.mg"|
                                  sources$`Source Name`=="madagate.org"|
                                  sources$`Source Name`=="madagascar-tribune.com"|
                                  sources$`Source Name`=="newsmada.com"), ]
write.csv(sources_local, "~/csumb-capstone-fall-ay-2020/Sutter Laird/CountrySourceCounts/Madagascar, Republic of/local.csv", append = FALSE)

sources <- read_csv("~/csumb-capstone-fall-ay-2020/Sutter Laird/CountrySourceCounts/Malawi, Republic of/sourceCounts.csv") 
sources_local <- sources[ which(sources$`Source Name`=="nyasatimes.com"|
                                  sources$`Source Name`=="malawivoice.com"|
                                  sources$`Source Name`=="manaonline.gov.mw"|
                                  sources$`Source Name`=="maravipost.com"|
                                  sources$`Source Name`=="faceofmalawi.com"|
                                  sources$`Source Name`=="malawi24.com"| 
                                  sources$`Source Name`=="zodiakmalawi.com"| 
                                  sources$`Source Name`=="capitalradiomalawi.com"|
                                  sources$`Source Name`=="mwnation.com"), ]
write.csv(sources_local, "~/csumb-capstone-fall-ay-2020/Sutter Laird/CountrySourceCounts/Malawi, Republic of/local.csv", append = FALSE)

sources <- read_csv("~/csumb-capstone-fall-ay-2020/Sutter Laird/CountrySourceCounts/Malaysia/sourceCounts.csv") 
sources_local <- sources[ which(sources$`Source Name`=="thestar.com.my"|
                                  sources$`Source Name`=="malaysia-chronicle.com"|
                                  sources$`Source Name`=="freemalaysiatoday.com"|
                                  sources$`Source Name`=="malaysiakini.com"|
                                  sources$`Source Name`=="theborneopost.com"|
                                  sources$`Source Name`=="malaysiandigest.com"| #name implies local, but not sure
                                  sources$`Source Name`=="thesundaily.my"| 
                                  sources$`Source Name`=="nst.com.my"|
                                  sources$`Source Name`=="bernama.com"| 
                                  sources$`Source Name`=="malaysiasun.com"|
                                  sources$`Source Name`=="dailyexpress.com.my"| 
                                  sources$`Source Name`=="themalaysianinsider.com"|
                                  sources$`Source Name`=="malaysia-today.net"|
                                  sources$`Source Name`=="mysinchew.com"| 
                                  sources$`Source Name`=="malaymail.com"|
                                  sources$`Source Name`=="astroawani.com"|
                                  sources$`Source Name`=="therakyatpost.com"| 
                                  sources$`Source Name`=="themalaymailonline.com"), ]
write.csv(sources_local, "~/csumb-capstone-fall-ay-2020/Sutter Laird/CountrySourceCounts/Malaysia/local.csv", append = FALSE)

sources <- read_csv("~/csumb-capstone-fall-ay-2020/Sutter Laird/CountrySourceCounts/Maldives, Republic of/sourceCounts.csv") 
sources_local <- sources[ which(sources$`Source Name`=="haveeru.com.mv"|
                                  sources$`Source Name`=="raajje.mv"|
                                  sources$`Source Name`=="miadhu.com"|
                                  sources$`Source Name`=="avas.mv"|
                                  sources$`Source Name`=="maldiveshighcommission.org"| #Not sure, maybe London based
                                  sources$`Source Name`=="sun.mv"| 
                                  sources$`Source Name`=="maldivesindependent.com"), ]
write.csv(sources_local, "~/csumb-capstone-fall-ay-2020/Sutter Laird/CountrySourceCounts/Maldives, Republic of/local.csv", append = FALSE)

sources <- read_csv("~/csumb-capstone-fall-ay-2020/Sutter Laird/CountrySourceCounts/Mali, Republic of/sourceCounts.csv") 
sources_local <- sources[ which(sources$`Source Name`=="koulouba.com"|
                                  sources$`Source Name`=="mali-web.org"|
                                  sources$`Source Name`=="maliweb.net"|
                                  sources$`Source Name`=="malijet.com"|
                                  sources$`Source Name`=="abamako.com"|
                                  sources$`Source Name`=="maliactu.net"| 
                                  sources$`Source Name`=="essor.ml"| 
                                  sources$`Source Name`=="bamada.net"), ]
write.csv(sources_local, "~/csumb-capstone-fall-ay-2020/Sutter Laird/CountrySourceCounts/Mali, Republic of/local.csv", append = FALSE)

sources <- read_csv("~/csumb-capstone-fall-ay-2020/Sutter Laird/CountrySourceCounts/Mauritania, Islamic Republic of/sourceCounts.csv") 
sources_local <- sources[ which(sources$`Source Name`=="aqlame.com"|
                                  sources$`Source Name`=="fr.ami.mr"|
                                  sources$`Source Name`=="journaltahalil.com"|
                                  sources$`Source Name`=="lecalame.info"|
                                  sources$`Source Name`=="saharamedias.net"|
                                  sources$`Source Name`=="ami.mr"), ]
write.csv(sources_local, "~/csumb-capstone-fall-ay-2020/Sutter Laird/CountrySourceCounts/Mauritania, Islamic Republic of/local.csv", append = FALSE)

#ani.mr has the mr domain name, but the site is down and seems to be in Arabic

sources <- read_csv("~/csumb-capstone-fall-ay-2020/Sutter Laird/CountrySourceCounts/Mauritius, Republic of/sourceCounts.csv") 
sources_local <- sources[ which(sources$`Source Name`=="defimedia.info"|
                                  sources$`Source Name`=="lexpress.mu"|
                                  sources$`Source Name`=="govmu.org"|
                                  sources$`Source Name`=="mbcradio.tv"|
                                  sources$`Source Name`=="maurice-info.mu"|
                                  sources$`Source Name`=="orange.mu"| 
                                  sources$`Source Name`=="business.mega.mu"| 
                                  sources$`Source Name`=="mauritiustimes.com"|
                                  sources$`Source Name`=="lemauricien.com"), ]
write.csv(sources_local, "~/csumb-capstone-fall-ay-2020/Sutter Laird/CountrySourceCounts/Mauritius, Republic of/local.csv", append = FALSE)

sources <- read_csv("~/csumb-capstone-fall-ay-2020/Sutter Laird/CountrySourceCounts/Mongolia/sourceCounts.csv") 
sources_local <- sources[ which(sources$`Source Name`=="sonin.mn"|
                                  sources$`Source Name`=="olloo.mn"|
                                  sources$`Source Name`=="montsame.mn"|
                                  sources$`Source Name`=="ubpost.mongolnews.mn"|
                                  sources$`Source Name`=="news.mn"), ]
write.csv(sources_local, "~/csumb-capstone-fall-ay-2020/Sutter Laird/CountrySourceCounts/Mongolia/local.csv", append = FALSE)

sources <- read_csv("~/csumb-capstone-fall-ay-2020/Sutter Laird/CountrySourceCounts/Morocco, Kingdom of/sourceCounts.csv") 
sources_local <- sources[ which(sources$`Source Name`=="hespress.com"|
                                  sources$`Source Name`=="cawalisse.com"|
                                  sources$`Source Name`=="lematin.ma"|
                                  sources$`Source Name`=="ahdath.info"|
                                  sources$`Source Name`=="medias24.com"|
                                  sources$`Source Name`=="maroc.ma"| 
                                  sources$`Source Name`=="moroccoworldnews.com"| 
                                  sources$`Source Name`=="marocpress.com"|
                                  sources$`Source Name`=="northafricapost.com"| 
                                  sources$`Source Name`=="alyaoum24.com"|
                                  sources$`Source Name`=="leseco.ma"| 
                                  sources$`Source Name`=="infomaroc.net"|
                                  sources$`Source Name`=="leconomiste.com"| 
                                  sources$`Source Name`=="hibapress.com"| #not sure
                                  sources$`Source Name`=="maghress.com"|
                                  sources$`Source Name`=="aujourdhui.ma"| 
                                  sources$`Source Name`=="fr.le360.ma"|
                                  sources$`Source Name`=="lnt.ma"|
                                  sources$`Source Name`=="telquel.ma"| 
                                  sources$`Source Name`=="assabah.press.ma"|
                                  sources$`Source Name`=="akhbarona.com"), ]
write.csv(sources_local, "~/csumb-capstone-fall-ay-2020/Sutter Laird/CountrySourceCounts/Morocco, Kingdom of/local.csv", append = FALSE)

sources <- read_csv("~/csumb-capstone-fall-ay-2020/Sutter Laird/CountrySourceCounts/Mozambique, Republic of/sourceCounts.csv") 
sources_local <- sources[ which(sources$`Source Name`=="jornalnoticias.co.mz"|
                                  sources$`Source Name`=="verdade.co.mz"), ]
write.csv(sources_local, "~/csumb-capstone-fall-ay-2020/Sutter Laird/CountrySourceCounts/Mozambique, Republic of/local.csv", append = FALSE)

sources <- read_csv("~/csumb-capstone-fall-ay-2020/Sutter Laird/CountrySourceCounts/Myanmar, Union of/sourceCounts.csv") 
sources_local <- sources[ which(sources$`Source Name`=="irrawaddy.com"|
                                  sources$`Source Name`=="irrawaddy.org"|
                                  sources$`Source Name`=="mmtimes.com"|
                                  sources$`Source Name`=="mizzima.com"|
                                  sources$`Source Name`=="burmanet.org"|
                                  sources$`Source Name`=="bnionline.net"| 
                                  sources$`Source Name`=="elevenmyanmar.com"| 
                                  sources$`Source Name`=="themalaymailonline.com"|
                                  sources$`Source Name`=="thestar.com.my"| 
                                  sources$`Source Name`=="frontiermyanmar.net"| 
                                  sources$`Source Name`=="dvb.no"), ]
write.csv(sources_local, "~/csumb-capstone-fall-ay-2020/Sutter Laird/CountrySourceCounts/Myanmar, Union of/local.csv", append = FALSE)

#Shan news used to be in Myanmar, but is now in Thailand. Did not include

sources <- read_csv("~/csumb-capstone-fall-ay-2020/Sutter Laird/CountrySourceCounts/Namibia, Republic of/sourceCounts.csv") 
sources_local <- sources[ which(sources$`Source Name`=="gov.na"|
                                  sources$`Source Name`=="namibiansun.com"|
                                  sources$`Source Name`=="neweralive.na"|
                                  sources$`Source Name`=="observer.com.na"|
                                  sources$`Source Name`=="informante.web.na"|
                                  sources$`Source Name`=="thevillager.com.na"| 
                                  sources$`Source Name`=="republikein.com.na"| 
                                  sources$`Source Name`=="az.com.na"|
                                  sources$`Source Name`=="nbc.na"| 
                                  sources$`Source Name`=="insight.com.na"| 
                                  sources$`Source Name`=="namibian.com.na"), ]
write.csv(sources_local, "~/csumb-capstone-fall-ay-2020/Sutter Laird/CountrySourceCounts/Namibia, Republic of/local.csv", append = FALSE)

#NewsEra.com.na used to be a Namibian website, but is not now. Did not include

sources <- read_csv("~/csumb-capstone-fall-ay-2020/Sutter Laird/CountrySourceCounts/Nepal, State of/sourceCounts.csv") 
sources_local <- sources[ which(sources$`Source Name`=="ekantipur.com"|
                                  sources$`Source Name`=="peoplesreview.com.np"|
                                  sources$`Source Name`=="myrepublica.com"|
                                  sources$`Source Name`=="onlinekhabar.com"|
                                  sources$`Source Name`=="spotlightnepal.com"|
                                  sources$`Source Name`=="nagariknetwork.com"| 
                                  sources$`Source Name`=="annapurnapost.com"| 
                                  sources$`Source Name`=="nepalitimes.com"|
                                  sources$`Source Name`=="ratopati.com"| 
                                  sources$`Source Name`=="gorkhapatraonline.com"|
                                  sources$`Source Name`=="nepalireporter.com"| 
                                  sources$`Source Name`=="thehimalayantimes.com"), ]
write.csv(sources_local, "~/csumb-capstone-fall-ay-2020/Sutter Laird/CountrySourceCounts/Nepal, State of/local.csv", append = FALSE)

sources <- read_csv("~/csumb-capstone-fall-ay-2020/Sutter Laird/CountrySourceCounts/Niger, Republic of/sourceCounts.csv") 
sources_local <- sources[ which(sources$`Source Name`=="lesahel.org"|
                                  sources$`Source Name`=="nigerdiaspora.net"|
                                  sources$`Source Name`=="presidence.ne"|
                                  sources$`Source Name`=="tamtaminfo.com"|
                                  sources$`Source Name`=="actuniger.com"), ] #used to be, not any more
write.csv(sources_local, "~/csumb-capstone-fall-ay-2020/Sutter Laird/CountrySourceCounts/Niger, Republic of/local.csv", append = FALSE)

sources <- read_csv("~/csumb-capstone-fall-ay-2020/Sutter Laird/CountrySourceCounts/Nigeria, Federal Republic of/sourceCounts.csv") 
sources_local <- sources[ which(sources$`Source Name`=="onlinenigeria.com"|
                                  sources$`Source Name`=="sunnewsonline.com"|
                                  sources$`Source Name`=="thisdaylive.com"|
                                  sources$`Source Name`=="thenationonlineng.net"|
                                  sources$`Source Name`=="leadership.ng"|
                                  sources$`Source Name`=="today.ng"| 
                                  sources$`Source Name`=="nairaland.com"| #Nigerian, seems to be social media nad not really traditional news? 
                                  sources$`Source Name`=="dailytrust.com.ng"|
                                  sources$`Source Name`=="vanguardngr.com"| 
                                  sources$`Source Name`=="premiumtimesng.com"| 
                                  sources$`Source Name`=="nigeriatoday.ng"|
                                  sources$`Source Name`=="pulse.ng"| 
                                  sources$`Source Name`=="omojuwa.com"| 
                                  sources$`Source Name`=="nigerianeye.com"|
                                  sources$`Source Name`=="naija247news.com"| 
                                  sources$`Source Name`=="guardian.ng"|
                                  sources$`Source Name`=="naij.com"| 
                                  sources$`Source Name`=="dailypost.ng"|
                                  sources$`Source Name`=="thenewsnigeria.com.ng"| 
                                  sources$`Source Name`=="businessdayonline.com"|
                                  sources$`Source Name`=="pmnewsnigeria.com"|
                                  sources$`Source Name`=="theeagleonline.com.ng"| 
                                  sources$`Source Name`=="peoplesdailyng.com"|
                                  sources$`Source Name`=="tribuneonlineng.com"|
                                  sources$`Source Name`=="nigerianpilot.com"| 
                                  sources$`Source Name`=="thecable.ng"|
                                  sources$`Source Name`=="informationng.com"| 
                                  sources$`Source Name`=="promptnewsonline.com"|
                                  sources$`Source Name`=="thetidenewsonline.com"| 
                                  sources$`Source Name`=="channelstv.com"|
                                  sources$`Source Name`=="ngrguardiannews.com"|
                                  sources$`Source Name`=="blueprint.ng"| 
                                  sources$`Source Name`=="punchng.com"), ]
write.csv(sources_local, "~/csumb-capstone-fall-ay-2020/Sutter Laird/CountrySourceCounts/Nigeria, Federal Republic of/local.csv", append = FALSE)

sources <- read_csv("~/csumb-capstone-fall-ay-2020/Sutter Laird/CountrySourceCounts/Oman, Sultanate of/sourceCounts.csv") 
sources_local <- sources[ which(sources$`Source Name`=="timesofoman.com"|
                                  sources$`Source Name`=="omanobserver.om"|
                                  sources$`Source Name`=="alwatan.com"|
                                  sources$`Source Name`=="shabiba.com"|
                                  sources$`Source Name`=="muscatdaily.com"|
                                  sources$`Source Name`=="omantribune.com"| 
                                  sources$`Source Name`=="omandaily.om"), ]
write.csv(sources_local, "~/csumb-capstone-fall-ay-2020/Sutter Laird/CountrySourceCounts/Oman, Sultanate of/local.csv", append = FALSE)