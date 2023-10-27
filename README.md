# NodeHarjoituksia
Web-palvelinten toimintaan liittyviä esimerkkejä toteutettuna Node.js kirjaston avulla

# Tietokanta ja näkymät
Luodaan näkymä, joka laskee edellisen kuukauden hinnan keskiarvon, normaalihinnan ala- ja ylärajat keskihajonnan perusteella. Jaetaan vaatimukset tehtäviksi tyyliin:

Selvitä kuluva vuosi ja kuukausi
Laske, mikä on edellisen kuukauden numero
Tee kysely, joka laskee tarvittavat keskirarvot ja keskihajonnat
Määrittele rajoittava ehto kuukaudelle ja vuodelle (tämän vuoden edell. kuukausi)
Muokkaa kyselyä siten, että se laskee ala- ja ylärajat (keskihinta +/- keskihajonta)
Muuta näkymäksi, joka hyödyntää month_lookup-taulua.
Luodaan näkymä, joka näyttää tiedot edelliseltä vuodelta, mutta kuluvalta kuukaudelta

# Mikropalvelu datan hakemiseen ja tallentamiseen
Microservice2 drawio TÄSTÄ PUUTTUU KUVA

Käyttäjät muodostavat yhteyden web-palvelimeen, joka on node-prosesessi. Koska samanaikaisia käyttäjiä voi olla useita, käytetään pääasiassa asynkronista koodia, jotta jonkin käyttäjän käynnistämä pitkäkestoinen operaatio ei hidasta muiden käyttäjien operaatioita. Taustapalveluna toimivaa microservice.js node.js ohjelmaa ajetaan erikseen, jolloin se on tietokoneessa oma prosessinsa. Se voidaan tarvittaessa sijoittaa eri tietokoneeseen. Koska käyttäjät eivät suoraan pääse ohjaamaan tätä prosessia, koodi voi olla synkronista, jolloin sen kirjoittaminen on yksinkertaista ja koodista tulee myös lyhyempää ja helpommin hallittavaa.

☠️ Jos on tarkoitus tehdä koodia, joka suoritetaan tietyssä järjestyksessä, se kannattaa kirjoittaa synkronisia funktioita tai metodeja käyttämällä. Asynkronisten funktioiden suoritusjärjestystä ei voi aina tietää etukäteen. Käytä asynkronisia työkaluja silloin, kun haluat, että ohjelman suoritus jatkuu seuraavaan vaiheeseen ennen kuin funktion suoritus on päättynyt. Nodessa asynkroniset funktiot on tarkoitettu palvelinsovelluksiin, joilla on useita samanaikaisia käyttäjiä. Jos näin ei ole, voit käyttää tavallisia funktioita, eli voit unohtaa callback, promise ja async -rakenteet.

Node.js palvelin voi tehdä ajastettuja toimintoja. Selvitä, mitä kirjastoja voisi käyttää tähän tarkoitukseen. Luodaan palvelu, joka lukee päivittäin klo 15.30 hinnat ja tallentaa ne tietokantaan. Jos ei onnistu, yritetään uudelleen tunnin kuluttua.

## Node.js ajastin (scheduler)
Jakakaa projektiryhmässä työt: kuka katsoo mitäkin työkalua tai kirjastoa. Lisätkää ne kortteina Githubin projektinhallintaan. Laittakaa tutkimiinne kirjastoihin kommentteina mielipide: "jatkoon, ei jatkoon" ja lyhyt perustelu miksi.

# PostgreSQL-kirjasto
Selvittäkää, mitä työkaluja / kirjastoja voisi käyttää tiedon hakemiseen ja tallentamiseen Node-sovelluksesta PostgreSQL-tietokantaan. Jakakaa tehtävät ja kirjatkaa projektinhallintaan. Mielipiteet kuten edellisessä tehtävässä.

**Tehtävä1:**
Rakenna palvelu valmiiksi niin, että se pystyy hakemaan päivittäin hintatiedot porssisahko.net-palvelusta ja tallentamaan ne tietokantaan. Esimerkkikoodissa haku- ja tallennustapahtumat kaiutetaan konsoliin. Todellisessa palvelimessa ne halutaan kirjoittaa lokitiedostoon. Lisää koodiin kirjoitus tiedostoon (append) fs-kirjaston avulla.

## Dynaamista dataa käyttävät sivut
Alkuvaiheessa **handlebars**-sivuille oli upotettu dataa taulukoiden ja kaavioiden piirtämiseksi.

**Tehtävä2:**
Muuta sivujen data dynaamiseksi, siten että `app.js` renderöi sivut käyttäen tietokantaan tallennettuja näkymiä. Tee seuraavat sivut:
1. Kotisivu -> tuntihinta saadaan tietokannasta (tehty)
2. Tunneittain sivu -> taulukko päivistä, tunneista ja hinnoista saadaan tietokannasta (tehty)
3.  Selvitä mitä vaihtoehtoja olisi muodostaa kaavioita dynaamisesti `app.js`:n koodissa. Hae esim. Chart.js ja node hakusanoilla ohjeita netistä. Vertaa ohjeita omaan ratkaisuumme. Tee lopuksi koodi, joka muodostaa kaavion vaatiman datan erilliseen tiedostoon `getChartData.js` ja julkaisee koodin `app.js`-tiedostossa käytettäväksi. Tuo koodi `app.js`-tiedostoon ja renderöi sivu. 
# Pikadokumentaatio
Seuraavasta taulukosta löytyvät tämän projektin tärkeimmät tiedostot ja hakemistot:

| Tiedosto tai kansio |	Käyttötarkoitus |
|---|---|
app.js	| web-palvelinohjelmisto sivujen tuottamiseen
microservice.js	| mikropalvelu, joka noutaa hintatiedot ja tallentaa ne PosgtreSQL-tietokantaa
getNewPrices.js	| Moduuli, jossa on rutiini hintatietojen hakemiseen porssisahko.net-palvelusta
DBObjectScripts	| Kansiosta löytyvät tietokantapalvelimen varmuuskopiot ja objektien luontiskriptit
Data	| Kansiosta löytyy oikeaan muotoon muunnettua dataa, joka voidaan tuoda tietokantaan
Examples	| Wikisivuilla käytettyjen esimerkkien javascript-koodit
Planning	| Suunnitteluun liittyvät SQL Power Arcitect -käsitemallit
Tietokannasta löytyvät seuraavat taulut:

| Nimi	| Käyttötarkoitus |
|---|---|
hourly_price	| Sähkön päivittäiset hintatiedot: aikaleima tunneittain ja kWh-hinta sentteinä
month_name_lookup	| Taulu eri kielisten kuukauden nimien hakemiseen
weekday_lookup	| Taulu eri kielisten viikonpäivien nimien hakemiseen.
Tietokantaan on luotu joukko näkymiä. Niiden käyttötarkoitukset ilmenevät seuraavasta taulukosta:

| Nimi	| Käyttötarkoitus |
|---|---|
current_prices |	Sähkön pörssihinnat tästä hetkestä eteenpäin
running_average	| Sähkön hinnan keskiarvo koko aineistosta
running_average_stdev	| Sähkön hinnan keskiarvo ja keskihajonta koko aineistosta
average_by_year_and_month	| Sähkön kuukausittaiset keskihinnat ja hajonta eri vuosilta
previous_month_average	| Edellisen kuukauden sähkön keskihinta ja keskihajonnan mukaiset rajat
avg_price_by_weekday_num	| Keskihinnat viikonpäivittäin viikonpäivänumeroin
avg_price_by_weekday_name	| Keskihinnat viikonpäivittäin viikonpäivän nimin (fi, se, uk, de, tr)
average_by_year	| Vuosittainen keskihinta
average_year-month_day	| Päivän keskihinnat koko aineistosta
monthly_averages_by_year_fin	| Keskihinnat kuukausittain ja vuosittain, kuukausien nimet suomeksi

# Haarat ja moduulit
Sivujen sisällön luomiseksi ja renderöimiseksi luodaan omat moduulit. Moduulien nimet ja käyttötarkoitukset ilmenevät seuraavasta taulukosta: 

| Tiedosto | Tarkoitus | Tekijä / Tekijät |
|---|---|---|
getHomePageData.js | Lukee tietokannasta nykyisen sähkön tuntihinnan, tuulen nopeuden ja lämpötilan. Lämpötila ja tuuli lisätään myöhemmin
hourlyPageData.js | Lukee tietokannasta päivän tuntihinnat
createGraphics.js | Lukee tietokannasta ja dataa ja muodostaa kaaviot: päivä, hintakehitys viikko ja kuukausi taaksepäin. 
