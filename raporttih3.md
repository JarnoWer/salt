# Palvelinten hallinta ict4tn022-3002 viikko 3
Klo 7:42
Alla kurssisivulla (http://terokarvinen.com/2018/aikataulu-%E2%80%93-palvelinten-hallinta-ict4tn022-3004-ti-ja-3002-to-%E2%80%93-loppukevat-2018-5p#h3) annetut harjoitus tehtävät, jotka suoritan tässä raportissa.
>>	# H3
>*	a) Opiskele yllä aikataulussa olevat artikkelit. Noissa artikkeleissa opetetaan ne asiat, joilla läksyt saa tehtyä. Tätä a-kohdan lukutehtävää ei tarvitse raportoida. Luettava materiaali on kunkin tapaamiskerran kohdalla.
>*	b) MarkDown. Tee tämän tehtävän raportti MarkDownina. Helpointa on tehdä raportti samaan GitHub-varastoon kuin Salt-modulit. Tiedostoon .md-pääte. Tyhjä rivi tekee kappalejaon, risuaita ‘#’ tekee otsikon, sisennys merkitsee koodinpätkän.
>*	c) Laita /srv/salt/ gittiin. Tee uusi moduli. Kloonaa varastosi toiselle koneelle (tai poista /srv/salt ja palauta se kloonaamalla) ja jatka sillä.
>*	d) Näytä omalla salt-varastollasi esimerkit komennoista ‘git log’, ‘git diff’ ja ‘git blame’. Selitä tulokset.
>*	e) Tee tyhmä muutos gittiin, älä tee commit:tia. Tuhoa huonot muutokset ‘git reset –hard’. Huomaa, että tässä toiminnossa ei ole peruutusnappia.
>*	f) Tee uusi salt-moduli. Voit asentaa ja konfiguroida minkä vain uuden ohjelman: demonin, työpöytäohjelman tai komentokehotteesta toimivan ohjelman. Käytä tarvittaessa ‘find -printf “%T+ %p\n”|sort’ löytääksesi uudet asetustiedostot.

Tehtäviä suoritan Lenovo Thinkpad E570-kannettavalla, jossa käyttöjärjestelmänä käytän live tikulla pyörivää Linux Ubuntua(Ubuntu 18.04.1 LTS \n \l). Koneen sisältö "sudo lshw -short -sanitize" komenolla on seuraava:
![koneen sisältö](img/Selection_001.png)

Alkutoimina suoritin koneessa komennot joilla näppäimistön saa tukemaan suomenkieltä, päivitin pakettivarastot ja asensin Shutterin kuvakaappauksia varten.
```
$ setxkbmap fi
$ sudo apt-get update
$ sudo apt-get install shutter
```

# C) Laita /srv/salt/ gittiin. Tee uusi moduli. Kloonaa varastosi toiselle koneelle (tai poista /srv/salt ja palauta se kloonaamalla) ja jatka sillä.
Klo 11:26
Olin jo tunnilla luonut GitHubiin "tyhjän" salt-repositoryn (kansion), joten en lähtenyt tällä kertaa poistamaan ja tekemään uudestaaan. Sen sijaan asensin koneeseen gitin ja kloonasin salt-kansion gitistä oman koneen /srv/-kansioon.
```
$ sudo apt-get install git
$ cd /srv
$ sudo git clone https://github.com/JarnoWer/salt
```
Seuraavaksi menin salt kansiioon ja annoin gitille käyttäjätietoni (sähköposti ja käyttäjänimi). Näiden toimien jälkeen loin raportille tämän tiedoston ja aloin harjoitella markdownin käyttöä kirjoittamalla raporttia ensimmäiseen kuvaan asti. Kuvan lisäyksen ohjeen löysin osoitteesta https://community.atlassian.com/t5/Bitbucket-questions/How-to-add-images-to-Readme-md/qaq-p/541434. Tallensin raportin ja suoritin git varaston päivitykset nähdäkseni toimiiko tekemäni markdown muotoilut. Muotoiluja piti muokkailla useaan kertaan, jotta sain muotoilut mieleisekseni hyvät ohjeet löytyivät sivulta https://en.support.wordpress.com/markdown-quick-reference/. Muotoiluja muokatessa suoritin git päivitykset useaan kertaan yhdistämällä kommennot, olisi varmaankin ollut hyvä poistaa virheelliset päivitykset git reset komennolla, mutta en vielä tässä vaiheessa ollut harjoitellut sitä. Lisäksi aika nopeasti kopioin Tero Karvisen ohjeesta (http://terokarvinen.com/2016/publish-your-project-with-github) komennon millä salasana kyselyn saa pidemmällä välillä. 
 
```
$ cd salt
$ git config --global user.email "jarno.wermundsen@myy.haaga-helia.fi"
$ git config --global user.name "Jarno Wermundsen"
$ sudoedit raporttih3.md
$ sudo git add .
$ sudo git commit
$ sudo git pull
$ sudo git push
$ sudoedit raporttih3.md
$ sudo git add .; sudo git commit; sudo git pull; sudo git push
$ git config --global credential.helper "cache --timeout=3600"
```

## Tee uusi moduli
Klo 12:27
Teen modulin, joka asentaa ssh-serverin ja vaihtaa käytettävän portin. Aloitan asentamalla konelle openssh-server ohjelman ja muokkaamalla sen config tiedostosta uudeksi yhteysportiksi 9595(kuva alla). Käynnistin ssh:n uudelleen, vaihdoin käyttäjän salasanan ja kokelin yhteydenottoa samalta koneelta samalle koneelle. Mikä onnistui(kuva alla).
```
$ sudo apt-get install openssh-server 
$ sudoedit /etc/ssh/sshd_config 
$ sudo service ssh restart
$ hostname -I
$ passwd
$ ssh -p 9595 xubuntu@192.168.10.50 
```
![ssh config tiedosto](img/Selection_002.png)
![Onnistunut ssh-yhteys](img/Selection_003.png)


