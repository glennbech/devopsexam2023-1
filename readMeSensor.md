Oppgave 1A:
Først må sensor lage en fork av ditt repository ved å klikke på «Fork» øverst til høyre på GitHub-siden i prosjektet mitt.

Deretter må sensor gå til sitt forkede repository og gå til «settings», deretter «Secrets». Legg til nødvendige secrets, spesielt de som brukes av GitHub Actions arbeidsflyten. (f.eks AWS:_ACCESS_KEY_ID, AWS_SECRET_ACESS_KEY, BUCKET_NAME).

For å deretter trigge Github Actions workflow kan sensor gjøre en endring (filendring) i sitt forkede repository. (Kan være hva som helst. For eksempel så pleier jeg å bare legge inn en kommentar i app.py). Deretter kan sensor gjøre en push til main-branchen. Dette bør få GitHub Actions til å bygge og deploye Lambda-funksjonen i sensor sin egen konto. 
Dersom sensor velger å pushe sitt forkede repo til en annen branch enn main-branchen vil Actions workflow bare bygge lambda funksjonen.

Hvis sensor skal bruke sin egen bucket kan sensor endre dette ved å endre bucket_name i app.py koden

NB: navnet på branchen for testing utenfor main er "test" bruk git checkout  test for å akksesere test branchen.

Oppgave 3B)
Først må sensor endre dynamisk tjenestenavn service_name. Erstatt den hardkodede verdien med referanse til variabelen ‘var.kandidatnummer’.
Dersom sensor skal bruke sin egen docker bildekonfigurasjon så må sensoroppdatere Docker-bildeinformasjonen i GitHub Actions-workflow-filen for å matche deres Docker-bildekonfigurasjon inne  F eks «IMAGE_URI=244530008913.dkr.ecr.eu-west-1.amazonaws.com/ecr_2037» med sin egen verdier.

Tilpass også terraform-backend konfigurasjonen etter behov inne på main.tf.

Oppgave 5A
Kontinuerlig integrasjon (CI):
Definisjonen av kontinuerlig integrasjon CI: 
Kontinuerlig integrasjon er en måte å integrere kode regelmessig fra ulike utvikler i en delt repository for å maksimalisere arbeidsflyt. Dette skjer automatisk og formålet er å løse integreringsproblemer tidlig under utviklingen. 

Fordeler med kontinuerlig integrasjon CI:
1.	Tidlig feiloppdagelse:
CI identifiserer feil og konflikter man skulle ha tidlig i utviklingsprosessen. Det samsvarer et enklere og billigere leveranse av fremtidige programvare.

2.	Raskere leveranser: 
Siden integrasjon er Automatisert tillater det oftere og mer effektiv bygging og testing av program. Dette fører til raskere leveranse av programvare. Samtidig gir CI umiddelbar tilbakemelding og rapportering om bygg og test resultater. Dette fører til at utviklere får raskere tilbakemelding om eventuelle problemer det skulle oppstå sånn at de blir håndtert.

3.	Forbedret kodekvalitet:
Kontinuerlig testing og integrasjon fører til økt kodekvalitet ved å identifisere og håndtere problemer før de når produksjon. Etter at en utvikler har pushet endringer til hovedgrenen, utløses kontinuerlig integrasjon (CI) med automatisert bygg og testing. Oppstår det feil, blir de umiddelbart rapportert til utviklerne, og feil må løses før endringene kan merges gjennom en Pull Request (PR). Denne integrerte tilnærmingen sikrer tidlig oppdagelse og løsning av problemer, og bidrar til å opprettholde høy kodekvalitet, forhindrer feil fra å nå produksjonsmiljøet. Dermed etablerer kontinuerlig testing og integrasjon et solid rammeverk for å forbedre programvarekvalitet gjennom hele utviklingsprosessen.

4.	Skalering og team arbeid:
Hver utvikler kan jobbe på separate grenenheter, og CI vil håndtere integrasjon når endringene sendes til main-branchen. Ettersom et utviklingsteam vokser, blir koordineringen av kodeintegrasjon mer kompleks og avansert. CI gjør det lettere å håndtere økt teamstørrelse ved å tillate parallell utvikling på separate branches. Dette fører til at hver utvikler kan jobbe mer komfortabelt i hver sin branch og deretter kan kode flettes sammen i main-branchen og CI kan forsikre om at koden er jevn og konfliktfri.


Praktisk bruk av CI i GitHub i et utviklingsteam:
Konfiguerer CI-verktøy og branching strategi: 
La oss anta at utviklingsteamet består av fire utviklere: A, B, C, D, og E. Teamet jobber med en Git-grenmodell som inkluderer en hovedgren main-branch, og inviduelle undergren for hver utvikler. For eksempel: A-feature, B-fix, osv. og Pull Requests som brukes for kodegjennomgang og integrasjon.

Først velger man et CI-verktøy som passer prosjektet. For eksempel GitHub Actions. Deretter lager man en konfigurasjonsfil. Et eksempel på dette kan være .yml fil: github/workflows/main.yml. Dette definerer bygg og test prosesser. Her kan man også sette in flere brancher workflowen skal håndtere, eller ha en IF setning for eksempel om man ønsker å bare bygge dersom kode pushes til en annen gren enn main-branchen. 
Et eksempel på en basic konfigurasjonsfil kan se ut som dette: 


Workflow for en utvikler:
A kan opprette en ny gren (‘A-feature’) for å implementere funksjonalitet. H*n gjør lokalt arbeid, deretter pusher grenen til GitHub og åpner deretter en Pull Request. GitHub Actions kjører automatisk for å bygge og teste A sin gren. Resten av teamet + A kan se CI-resultatene i Pull Requesten. Ved godkjennelse blir grenen merget med main-branchen av GitHub Actions. Dette gjelder ikke bare A, men B, C, D og E sitt arbeid også. Alle 5 utviklere jobber på separate grener, og GitHub Actions sørger for parallell bygging og testing for å hindre konflikter ved integrasjon. 
Code review og samarbeid:
Teamet kan samarbeide gjennom GitHub Pull Requests for kodegjennomgang. CI-resultater vises i PR-en og kommentarer gjør det mulig å diskutere og samarbeide for nødvendige endringer.

Oppgave 5B)
SCRUM/Smidig metodikk:
Hovedtrekk: scrum er et rammeverk innenfor smidig metodikk som fokuserer på iterative og trinnvis utviklingsprosseser. Teamet organiseres i sprinter, vanligvis to til fire uker, der det leveres en brukbar versjon av produktet etter hver sprint/møte. Smidig metodikk vektlegger samarbeid, kundeinvolvering, og evnen til å tilpasse seg endringer. 
Styrker ved scrum/smidig metodikk:
-Fleksibilitet:
Siden scrum arbeides med små iterativ og inkrementelle utvikling så kan kodeleveransen bli sendt tidligere og det kan hjelpe med at kunden kan ta i bruk/ha tilgang til funksjoner som er klare etter hver sprint. Dette kan også føre til tidligere funn av feil i kode.
-Kundekommunikasjon/involvering:
Kunden blir oftere oppdatert og har møte. Kunden får tilgang til kode tidligere som jeg nevnte under fleksibilitet linjen. Hyppigere levreranser fører til mulighet for tidligere kunde tilbakemelding.
-Teamengasjement:
Oftere møter med teamet kan gjøre medlemmene mer engasjerte og mer motiverte. Dette fører til mer effektivt arbeid. Et selvorganiserende team med daglige stand-ups øker teamets engasjement og effektivitet.


-Billigere kostander:
Scrum foksuerer på fleksibilitet og rask tilpasninger. Dette fører til at det kan noen ganger være mindre behov for automatisering. Som regel koster det for verktøy for automatisering og vedlikehold osv. disse automatiseringene kan være svært kostbar spesielt da det prosjektet skaleres.


Utfordringer ved scrum/smidig metodikk:
-Uforutsigbarhet:
Scrum som har kjennetegnet ved sin fleksible tilnærming til endringer, kan utfordre langsiktige oppdrag. Den kortsiktige iterasjonen gjør det vanskelig å tydelig definere langsiktige mål og estimering av ressurser. Balanseringen mellom fleksibilitet og langsiktig planlegging er kritisk, med potensielle utfordringer knyttet til å håndtere kundens forventninger. Dette gjør det til en utfordring.

-Manglede kunde engasjement: 
Det er svært vikitg at kunden er aktiv og er med på oppmøter/kontakt da det gjelder kundens prosjekt. Dersom kunden ikke viser/mangler engasjement kan det gi dårlig kommunikasjon mellom kunde og utviklere/teammedlemmer. 

Devops metodikk:
Devops handler om å få utviklere (som er dev) og driftpersonell (som ops) (=devops) til å samarbeide for å lage kode og programvare mer effektivt. I stedet for å jobbe separat jobber dem sammen gjennom hele prosjektet, f eks på GitHub. Inne på GitHub kan de legge inn kommentarer til comittede kode og dermed diskutere sammen om mulige endringer eller ideer. De kan bruke GitHub Actions workflow for bygging/testing av kode på push/pull for å forsikre seg om at denringer av kode ikke bryter eksisterende funksjonalitet. Tanken med DevOps er å jobbe mer samarbeidsorientert gjennom hele perioden av utviklingen til programvaren/prosjektet. Sentrale ting i DevOps inkluderer å jobbe tett, automatisere mest mulig med CI/CD kontinuerlig integrasjon og kontinuerlig leveranse, og dermed ha en jevn flyt fra utvikling til drift. Blant annet brukes verktøy som terraform for å definere og administrere infrastrukturen gjennom kode. Dette gir en konsistent og reproduserbar infrastruktur. 


DevOps kan påvirke kodekvalitet på følgende måte: Siden Devops fremmer automatisering er det masse eksempler på hvordan det kan forbedre kodekvalitet betraktelig samtidig effektiviteten.

Påvirkning av kvalitet og leveransetempo: 
DevOps fremmer automatisert testing gjennom hele utviklingsprosessen. Dette kan bidra å redsuere risiko for feil og sikrer at programvaren kan forbeholde seg til høy kvalitet. (F.eks bruke GitHub Actions for å ikke ødelegge eksisterende funksjonalitet og GitHub Actions Workflows kan bli utløst av spesifikke hendelser, for eksempel en push til en bestemt gren, opprettelse av en pull request, utgivelse av en ny versjon, eller annen definert hendelse.). Automatisert testing ved bruk av CI/CD fører til raske tilbakemeldinger og identifikasjon/løsning av konflikter. Dette fører til at teamet kan raskt oppdage feil og rette dem opp. Da blir det kortere tid på leveranser siden det hindrer manuell testing som er ganske tidskrevende. Samtidig bruker teamet mindre tid på testing og mer tid på å øke kodekvalitet. 

Å håndtere infrastrukturen som kode gir pålitelig og enhetlig administrasjon, med mulighet for å teste og rulle ut endringer på samme måte som programvareoppdateringer. Dette sikrer en jevn og pålitelig infrastruktur, og muliggjør en strukturert tilnærming til endringshåndtering i både programvare og infrastruktur. Vi kan bruke IaC verktøy som f.eks Terraform. Programmeringsspråk som YAML brukes ofte for konfigurasjonsfilene.

DevOps styrker:

-Automatisering og effektivitet:
DevOps legger stor vekt på automatisering av utvikling, testing og implementering. Dette øker effektiviteten ved å redusere manuelle feil, øke hastigheten på leveranser og tillate rask iterasjon.
-Kontinuerlig integrasjon og leveranse (CI/CD):
CI/CD-prinsippene sørger for kontinuerlig testing og distribusjon, og dette muliggjør jevn og pålitelig utrulling av programvareendringer, noe som fører til kortere utviklings- og lanseringssykluser.

-Skalerbarhet og fleksibilitet:
DevOps gir mulighet for en skalerbar og fleksibel infrastruktur. For eksempel ved bruk av skytjenester. Et eksmepel er AWS. Dette gjør det enkelt å håndtere varierende arbeidsbelastninger. Et eksempel her er tjenester som AWS Lambda. Dette gjør det mulig å kjøre kode uten å måtte administrere serverinfrastrukturen direkte, og det skalerer automatisk basert på etterspørsel. Et annet eksempel er S3 buckets. Tjenester som Amazon S3 gir fleksibel og skalerbar lagringskapasitet. Organisasjoner kan lagre og hente data etter behov, uten å bekymre seg for fysiske begrensninger på lagringsplass. Enda et eksempel kan være bruk av elastiske ressurser som EC2 instanser. AWS tilbyr elastiske ressurser som kan skaleres opp eller ned basert på etterspørsel. Dette betyr at organisasjoner kan tilpasse infrastrukturen etter behov. AWS har også dataservere i alle regioner. Dette fører til mindre latens og øke ytelse. Man kan tilpasse regioner selv. 

DevOps utfordringer:

-kompleksitet og bratt lærekurve:
Implementering og optimal bruk av DevOps-verktøy og praksiser kan være komplekst. Det krever tid for teamet å bli komfortable og effektive med nye verktøy og prosesser.

-Kostbart:
DevOps metodikk kan være kostbart siden automatiserte verktøy og konstant vedlikehold koster penger å opprettholde. Dette kan være et problem for små bedrifter.

-Sikkerhetsbekymringer: 
Mens DevOps fremmer kontinuerlig leveranse, kan det også føre til bekymringer om sikkerhet hvis sikkerhetspraksiser ikke blir nøye overvåket og implementert. Det kan være lett å ha feil i konfigurasjon i skytjenester. Samtidig må man passe på å ikke eksponere AWS credentials, heller lagre dem skjult og eventuelt ha dem som Secrets på GitHub.



Sammenligning av Scrum/Smidig og DevOps i forhold til Programvarekvalitet og Leveransetempo:

Scrum/Smidig:
Iterative og inkrementelle utviklingsprosesser er forskjellige med Scrum/Smidig metodikk, som organiserer teamet i sprinter med hyppige leveranser. Når det gjelder programvarekvalitet og leveransetempo, gir dette fokuset på fleksibilitet og tidlig tilpasning betydelige fordeler. Den iterative naturen gir økt kvalitet ved å oppdage og rette feil tidlig i utviklingsprosessen. Hyppige leveranser hjelper kunder med å gi tidlige tilbakemeldinger, forbedre kommunikasjonen og få ting gjort raskere. Arbeidseffektiviteten øker som et resultat av teamengasjement som oppnås gjennom selvorganisering og regelmessige møter. Ikke desto mindre, på grunn av usikkerhet knyttet til mål og ressursplanlegging på lang sikt, kan Scrum/Smidig møte problemer når det gjelder langvarige prosjekter.

DevOps:
DevOps er ansvarlig for å koordinere utvikling og drift gjennom hele livssyklusen, noe som påvirker programvarekvaliteten og leveringshastigheten. DevOps jobber med automatisering og kontinuerlig integrasjon/leveranse (CI/CD) for å redusere feilrisikoen ved å gi automatiserte tester og hyppige leveranser. Dette resulterer i programvare av høyere kvalitet. Infrastruktur som kode (IaC) administrerer infrastruktur på en pålitelig og konsistent måte, forbedrer konsistens og reduserer konfigurasjonsfeil. Samtidig gir DevOps en betydelig økning i leveransetempoet ved å håndtere ulike arbeidsbelastninger og muliggjøre rask utrulling, takket være skalerbarheten og fleksibiliteten til skytjenester som AWS. Når det er sagt, kan DevOps møte utfordringer med å sette i gang prosessen med å implementere, på grunn av vanskeligheter og lange leveringstider, så vel som potensielt høye kostnader og sikkerhetsspørsmål.
Sammenligning:
Både Scrum/Smidig og DevOps gir fordeler for programvareutvikling, men med forskjellige vektlegginger. Scrum/Smidig styrker fleksibilitet, tidlig tilbakemelding og teamengasjement, mens DevOps fokuserer på automatisering, CI/CD, og effektiv administrasjon av infrastrukturen. Scrum/Smidig er spesielt egnet for prosjekter med høy grad av usikkerhet og behov for kundeinvolvering, mens DevOps passer godt for organisasjoner som søker høy grad av automatisering og ønsker å optimalisere leveransetempoet gjennom hele livssyklusen. Valget mellom metodikkene avhenger av prosjektets spesifikke krav og kontekst.


Scrum/Smidig:
Usikre Krav og Endringer:
Fordel: Scrum/Smidig er ideell når kravene er usikre eller har potensiale for endringer. Den iterative og inkrementelle tilnærmingen gjør det enkelt å tilpasse seg endringer etter hvert som prosjektet utvikler seg.

Høy Grad av Kundekommunikasjon:
Fordel: Hvis prosjektet krever hyppig kommunikasjon med kunden for å forstå og tilpasse seg deres behov, gir Scrum/Smidig regelmessige møter og leveranser som styrker denne kommunikasjonen.

Teamengasjement og Kreativitet:
Fordel: Scrum/Smidig er gunstig når teamengasjement og kreativitet er avgjørende. Den selvorganiserende naturen og daglige møter styrker samhørighet og effektivitet i teamet.

Mindre Skalering:
Fordel: For mindre prosjekter eller mindre organisasjoner kan Scrum/Smidig være enklere å implementere og administrere i forhold til større rammeverk som kan være nødvendige for DevOps.

DevOps:
Automatisering og Skalerbarhet:
Fordel: DevOps utmerker seg i miljøer som krever høy grad av automatisering og skalerbarhet. Dette er spesielt gunstig for store prosjekter eller organisasjoner med komplekse infrastrukturer.

Rask og Kontinuerlig Leveranse:
Fordel: Når det er kritisk å oppnå rask og kontinuerlig leveranse av kodeendringer, er DevOps ideell. CI/CD-pipeliner automatiserer test- og utrullingsprosesser, noe som gir rask tilbakemelding og minimal ventetid.



Stor Grad av Infrastrukturkontroll:
Fordel: Organisasjoner som ønsker full kontroll over sin infrastruktur og ønsker å administrere den som kode, vil dra nytte av DevOps. IaC gir presisjon og konsistens i infrastrukturadministrasjonen.

Tett Integrering av Utvikling og Drift:
Fordel: For prosjekter hvor tett integrasjon mellom utviklere og driftspersonell er avgjørende for suksess, gir DevOps en strukturert tilnærming gjennom hele livssyklusen, fra utvikling til drift.

Konklusjon:
Valget mellom Scrum/Smidig og DevOps avhenger av prosjektets spesifikke behov og kontekst. Scrum/Smidig passer godt for prosjekter med usikre krav og fokus på kundeinvolvering, mens DevOps er ideell for organisasjoner som søker høy automatisering, skalerbarhet og tett integrasjon mellom utvikling og drift. I noen tilfeller kan en hybrid tilnærming også være gunstig, der elementer fra begge metodikkene kombineres for å møte unike utfordringer.

Oppgave 5C)
Prototyping og brukertesting:
Før den endelige implementeringen av min nye funksjonalitet vil jeg lage prototyper av den nye funksjonaliteten og utføre brukertester. Dette gir direkte feedback fra ekte brukere, og eventuelle kommentarer vil bli brukt til å endre funksjoner.

Informasjonsskjemaer og spørreundersøkelser:
Det vil bli sendt ut feedbackskjemaer og undersøkelser til brukerne etter implementering. Dette leverer data om deres erfaring med den nye funksjonen. Intervjuene vil konsentrere seg om brukervennlighet, nytteverdi og eventuelle problemer de har møtt.

Forskning på bruksmønstre:
For å finne ut hvordan brukerne faktisk bruker de nye funksjonene, vil jeg bruke verktøy som Google Analytics eller lignende for å analysere bruksmønstre. Dette gir informasjon om brukernes klikk, brukertid og andre metrikker.

Sosiale medier og andre kommunikasjonsverktøy:
Jeg vil søke etter brukernes direkte tilbakemeldinger på sosiale medier og andre kommunikasjonsplattformer. Dette kan føre til ufiltrerte meninger og tidlige tegn på bekymringer eller positive reaksjoner.

Behov:
Feedback er viktig for å endre og forbedre funksjonaliteten for å møte brukernes behov. Det hjelper til med å finne mulige feil, lære hvordan brukerne bruker funksjonaliteten og oppdage nye krav som kanskje ikke var synlige ved starten av utviklingen.

Kontinuerlige fremskritt:
Feedback legger grunnlaget for kontinuerlig forbedring ved å identifisere områder der det er potensial til forbedring. Tilbakemeldinger kan brukes til å endre applikasjonens behov og forventninger over tid.

Inkludering i utviklingslivssyklusen:
Design, implementering og etter lansering er alle faser av utviklingslivssyklusen der feedback integreres. Tidlig brukertesting påvirker designvalg, mens kontinuerlig overvåking etter lansering lar deg raskt reagere på brukerbehov.

En helhetlig og brukersentrert tilnærming, som er avgjørende for å levere en vellykket applikasjon, sikres ved å integrere feedback i utviklingsprosessen.