#import "@preview/drafting:0.2.2": *
#import "../template.typ": caption_with_source

= Konzeption
Zur Konzeption des Feedback-Systems wird zunächst die Ausgangssituation des @KI\-Agenten des SAP Lean Catalogs erläutert. Anschließend wird ermittelt, welcher Ansatz sich zur Generierung der Feedback-Formulare für den Anwendungsfall am besten eignet. Da das zu implementierende System von einem Agenten aufgerufen werden soll, kann hier von einem Tool gesprochen werden. Der Arbeitstitel für das System ist also _Feedback-Tool_.

== Ausgangssituation
Der SAP Lean Catalog verfügt über einen Content Manager Agent, der einen Bildgenerierungs-Agenten und einen Textübersetzungs-Agenten orchestriert. Beide Inhaltsgenerierungs-Agenten sind in @ABAP implementiert, laufen auf dem SAP AI Core und sind über @OData V4 Actions (einem @HTTP\-basierten Standard mit dem Daten über @REST\ful Schnittstellen frei ausgetauscht werden können #cite(<Pizzo_2020>)) aufrufbar. Der Content Manager Agent selbst ist in TypeScript implementiert und wird direkt vom @UI\5-Frontend verwendet. Dies ermöglicht asynchrone Verarbeitung sowie durch Dependency Injection direkten Zugriff auf @UI\-Elemente, eine Voraussetzung für die Implementierung des Feedback-Tools.


== Nutzwertanalyse <sec:nwa>
Zur Auswahl des geeigneten Ansatzes für die Feedback-Formulare wird eine @NWA durchgeführt. Diese ermöglicht eine systematische Bewertung verschiedener Alternativen anhand definierter Kriterien. Die @NWA folgt der in @sec:nwa_grundlagen beschriebenen Methodik.

Im Folgenden werden die einzelnen Schritte der @NWA dokumentiert.

=== Ziel und Entscheidungsproblem
Das Ziel dieser @NWA ist die Auswahl eines geeigneten Ansatzes zur Generierung von Feedback-Formularen für den @KI\-Agenten des SAP Lean Catalog.

Auf Basis der in Kapitel 2 vorgestellten Ansätze für @GenUI werden die folgenden vier Alternativen zur Generierung von Feedback-Formularen betrachtet:

1. Statisches Generatives UI
2. Deklaratives Generatives UI
3. Offenes Generatives UI
4. Chat-basierte Schnittstellen

Diese Alternativen unterscheiden sich insbesondere im Grad der Autonomie, die der @KI\-Agent bei der Formulargestaltung erhält.

=== Bestimmung der Entscheidungskriterien
Die Auswahl der Entscheidungskriterien erfolgt systematisch auf Basis einer Brainstorming-Sitzung. Diese Sitzung wurde zusammen mit 4 Experten aus dem SAP Lean Catalog-Team durchgeführt. Das Transkript der Sitzung ist in den Beigaben zu finden.

#inline-note(text("Transkript in die Beigaben packen,"))

Die Kriterien werden in vier Hauptkategorien gruppiert: @UX, Wirtschaftlichkeit, Stabilität und Sicherheit.

==== User Experience
Die @UX\-Kriterien leiten sich größtenteils aus den in Kapitel 2 vorgestellten Standards ab. Sie bewerten, wie benutzerfreundlich und zugänglich die generierten Feedback-Formulare sind.

*Reaktionszeit* beschreibt, wie schnell das System auf Benutzereingaben reagiert. Eine niedrige Reaktionszeit ist essenziell für eine positive @UX, da Verzögerungen die Wahrnehmung der Systemqualität negativ beeinflussen.

*Accessibility* bewertet die Zugänglichkeit der Formulare für Menschen mit Einschränkungen. Dies umfasst die Einhaltung von @WCAG 2-Richtlinien wie Tastaturnavigation, Screenreader-Kompatibilität und ausreichende Kontraste.

*Responsiveness* beschreibt, wie gut sich die Formulare an verschiedene Bildschirmgrößen und Geräte anpassen.

*Generierungsgeschwindigkeit* erfasst die Zeit zwischen der Anforderung eines Feedback-Formulars und dessen vollständiger Darstellung.

*Darstellungskonsistenz (innerhalb einer Session)* bewertet, ob Formulare während einer Nutzungssitzung visuell konsistent erscheinen. Dies entspricht Nielsens Heuristik "Konsistenz und Standards".

*Mehrsprachigkeit* beschreibt die Fähigkeit, Formulare in verschiedenen Sprachen anzubieten.

*Statusanzeige* bewertet, ob Benutzer jederzeit über den aktuellen Systemstatus informiert sind. Dieses Kriterium entspricht der Heuristik "Sichtbarkeit des Systemstatus" nach Nielsen.

*Support für Corporate Design* misst, inwieweit die Formulare das visuelle Erscheinungsbild des SAP-Ökosystems einhalten können. Hierdurch werden Wiedererkennung und Einbindung in die bestehende Umgebung bestärkt.

*Individualisierbarkeit* bewertet gemäß @ISO 9241-110 die Möglichkeit, Formulare an individuelle Benutzerpräferenzen anzupassen.

*Fehlertoleranz* beschreibt, wie gut das System mit Fehlern umgeht und Benutzer bei der Korrektur unterstützt. Dieses Kriterium entspricht ebenfalls dem Aspekt mit dem selben Namen aus der @ISO 9241-110.

*Nachvollziehbarkeit* bewertet, wie transparent und verständlich die Formulare aufgebaut sind. Dieses Kriterium orientiert sich an dem Aspekt "Selbstbeschreibungsfähigkeit" aus der @ISO 9241-110.

==== Wirtschaftlichkeit
Diese Kriterien bewerten die ökonomischen Aspekte der verschiedenen Ansätze.

*Betriebskosten* erfassen die laufenden Kosten für den Betrieb des Systems. Dazu gehören insbesondere API-Kosten für @LLM\-Aufrufe und Hosting-Kosten.

*Implementierungsaufwand* bewertet den initialen Aufwand zur Umsetzung des Ansatzes. Dies umfasst Entwicklungszeit, benötigte Expertise und Integrationskomplexität.

==== Stabilität
Diese Kriterien bewerten die langfristige Anpassungsfähigkeit und qualitative Konsistenz der Lösung.

*Wartbarkeit* beschreibt, wie einfach das System zu warten und zu pflegen ist.

*Erweiterbarkeit* bewertet, wie leicht neue Funktionen oder Formulartypen hinzugefügt werden können.

*Einsatz von zukunftssicheren Technologien* bewertet, ob die verwendeten Technologien und Standards voraussichtlich langfristig unterstützt werden.

*Funktionale Konsistenz (sessionübergreifend)* beschreibt, ob das System über verschiedene Nutzungssitzungen hinweg konsistent funktioniert.

==== Sicherheit
Diese Kategorie bewertet sicherheitsrelevante Aspekte der Ansätze.

*Manipulationssicherheit* beschreibt, wie gut der Ansatz vor böswilligen Angriffen (wie beispielsweise Code-Injections) geschützt ist.

=== Gewichtung der Entscheidungskriterien

Die Gewichtung der Kriterien fand direkt im Anschluss der Brainstorming-Sitzung statt. Dabei bewerteten die teilnehmenden Experten alle Kriterien auf einer Skala von 1 bis 10. Die relative Gewichtung $w_i$ für Kriterium $i$ wurde wie folgt berechnet:

$ w_i = (overline(g)_i) / (sum_(k=1)^m overline(g)_k) quad "mit" quad overline(g)_i = 1/n sum_(j=1)^n g_(i j) $

Dabei ist $g_(i j)$ die Bewertung von Experte $j$ für Kriterium $i$, $n$ die Anzahl der Experten und $m$ die Anzahl der Kriterien. Diese Normalisierung stellt sicher, dass die Summe aller Gewichtungen 100 % ergibt. In @tab:nwa_gewichtung sind die konkreten Gewichtungen aller Experten, sowie die prozentuelle Gesamtgewichtung einsehbar.

#figure(
  caption: [Gewichtung der Kriterien],
  table(
    columns: 9,
    stroke: 1pt,
    align: (left, left, center, center, center, center, center, center, center),

    [*Kategorie*], [*Kriterium*], [*E1*], [*E2*], [*E3*], [*E4*], [*E5*], [*Ø*], [*Gewichtung*],

    [UX], [Reaktionszeit], [10], [6], [10], [9], [9], [8,8], [7,32 %],
    [UX], [Accessibility], [1], [4], [5], [7], [7], [4,8], [3,99 %],
    [UX], [Responsiveness], [5], [4], [6], [6], [8], [5,8], [4,83 %],
    [UX], [Generierungsgeschwindigkeit], [10], [6], [10], [9], [8], [8,6], [7,15 %],
    [UX], [Darstellungskonsistenz (innerhalb einer Session)], [8], [6], [8], [8], [7], [7,4], [6,16 %],
    [UX], [Mehrsprachigkeit], [5], [6], [8], [6], [6], [6,2], [5,16 %],
    [UX], [Statusanzeige], [5], [4], [8], [9], [8], [6,8], [5,66 %],
    [UX], [Support für Corporate Design], [3], [2], [3], [3], [7], [3,6], [3,00 %],
    [UX], [Individualisierbarkeit], [1], [2], [3], [2], [5], [2,6], [2,16 %],
    [UX], [Fehlertoleranz], [3], [8], [9], [8], [9], [7,4], [6,16 %],
    [UX], [Nachvollziehbarkeit], [5], [2], [8], [6], [8], [5,8], [4,83 %],
    [Wirtschaftlichkeit], [Betriebskosten], [10], [8], [9], [9], [7], [8,6], [7,15 %],
    [Wirtschaftlichkeit], [Implementierungsaufwand], [5], [8], [8], [8], [6], [7], [5,82 %],
    [Stabilität], [Wartbarkeit], [6], [6], [9], [7], [8], [7,2], [5,99 %],
    [Stabilität], [Erweiterbarkeit], [8], [4], [9], [6], [7], [6,8], [5,66 %],
    [Stabilität], [Einsatz von zukunftssicheren Technologien], [8], [4], [8], [9], [6], [7], [5,82 %],
    [Stabilität], [Funktionale Konsistenz (sessionübergreifend)], [5], [8], [6], [9], [7], [7], [5,82 %],
    [Sicherheit], [Manipulationssicherheit], [5], [10], [9], [10], [10], [8,8], [7,32 %],
  ),
) <tab:nwa_gewichtung>

=== Skalen und Bewertungsvorschriften
Die Bewertung der Alternativen erfolgt auf einer kardinalen Skala von 1 bis 100 Punkten. Diese Skala ermöglicht eine differenzierte Beurteilung und ist in der Nutzwertanalyse etabliert #cite(<nwa>, supplement: "S. 72"). Die Bewertungsstufen sind wie folgt definiert:

#figure(
  caption: caption_with_source("Bewertungsskala der Nutzwertanalyse", [@nwa]),
  table(
    columns: 3,
    stroke: 1pt,
    align: (center, left, left),
    [*Punktzahl*], [*Bewertung*], [*Beschreibung*],
    [81-100], [Sehr gut], [Anforderung vollständig erfüllt],
    [61-80], [Gut], [Anforderung größtenteils erfüllt],
    [41-60], [Befriedigend], [Anforderung ausreichend erfüllt],
    [21-40], [Mangelhaft], [Anforderung nur teilweise erfüllt],
    [1-20], [Ungenügend], [Anforderung kaum oder nicht erfüllt],
  ),
) <tab:nwa_skala>

Die Bewertung wurde vom Autor dieser Arbeit auf Basis von Quellenrecherche sowie praktischer Erfahrungen mit den verschiedenen Ansätzen vorgenommen.

=== Bewertung der Entscheidungskriterien
Im Folgenden werden die vier Alternativen anhand der definierten Kriterien bewertet. @tab:nwa_bewertung im Anhang unter @anhang:nwa_table zeigt die vollständige Bewertungsmatrix. @tab:nwa_teilnutzwerte gewährt zudem eine Übersicht über die gewichteten Teilnutzwerte nach Kategorien.

#figure(
  caption: [Gewichtete Teilnutzwerte nach Kategorien],
  table(
    columns: 6,
    stroke: 1pt,
    align: (left, center, center, center, center),
    [*Kategorie*], [*Gewichtung (Maximum des Teilnutzwerts)*], [*Statisch*], [*Deklarativ*], [*Offen*], [*Chat*],
    [User Experience], [56,42 %], [*49,86*], [42,71], [26,56], [42,15],
    [Wirtschaftlichkeit], [12,97 %], [*11,21*], [9,73], [5,62], [10,96],
    [Stabilität], [23,29 %], [18,13], [*18,64*], [14,78], [17,19],
    [Sicherheit], [7,32 %], [*6,95*], [6,22], [1,83], [6,59],
    [*Gesamt*], [100 %], [*86,15*], [77,30], [48,79], [76,89],
  ),
) <tab:nwa_teilnutzwerte>

Die Bewertungen werden im Folgenden nach Kategorien erläutert und auf Basis wissenschaftlicher Literatur sowie technischer Analysen begründet.

==== User Experience
Die @UX\-Bewertung der vier Alternativen zeigt deutliche Unterschiede in den verschiedenen Kriterien. Die Beurteilung basiert auf etablierten Usability-Standards sowie aktuellen Erkenntnissen zur Generierung von Benutzeroberflächen durch @KI\-Systeme.

===== Reaktionszeit und Generierungsgeschwindigkeit

Statisches @GenUI erzielt die besten Werte bei Reaktionszeit (95) und Generierungsgeschwindigkeit (95). Da ein @LLM lediglich die passendste Vorlage auswählt, entfällt die zeitintensive Generierung von @UI\-Code #cite(<copilotkit_2026>).

Deklaratives @GenUI erreicht moderate Werte (Reaktionszeit: 70, Generierung: 65). Die @KI muss eine strukturierte @JSON\-Beschreibung generieren, was @LLM\-Aufrufe erfordert. Allerdings benötigt die Beschreibung deutlich weniger Token als vollständiger Code #cite(<copilotkit_2026>) #cite(<hojo_generativegui_2025>, supplement: "S. 5").

Offenes @GenUI schneidet bei diesen Kriterien am schlechtesten ab (Reaktionszeit: 40, Generierung: 35). Die Generierung von vollständigem HTML, CSS und JavaScript erfordert eine sehr hohe Token-Anzahl, was die Inter-Token-Latenz erheblich erhöht #cite(<copilotkit_2026>). Empirische Studien zeigen, dass Systeme, die vollständige Webseiten zur Laufzeit generieren, häufig eine Minute oder mehr benötigen, bis die @UI vollständig dargestellt ist #cite(<copilotkit_2026>) #cite(<leviathan_generative_2025>).

Chat-basierte Schnittstellen erzielen sehr gute Werte (Reaktionszeit: 90, Generierung: 85), da sie keine komplexen @UI\-Elemente sondern lediglich Text generieren #cite(<hojo_generativegui_2025>, supplement: "S. 2").

===== Darstellungskonsistenz

Statisches @GenUI garantiert theoretisch Konsistenz (95), da Frontend-Entwickler Details wie Layout, Styling und Interaktionsmuster zur Entwicklungszeit festlegen #cite(<copilotkit_2026>). Dies ermöglicht die Einhaltung der Markenidentität und stellt sicher, dass Agent-Ausgaben optisch einheitlich sind #cite(<copilotkit_2026>).

Deklaratives @GenUI bietet gute Konsistenz (80), da das Frontend native Komponenten mit einheitlichem Styling rendert #cite(<copilotkit_2026>). Die Interpretation der @JSON\-Struktur erfolgt deterministisch durch die Rendering-Engine, wodurch strukturelle und visuelle Konsistenz gewährleistet wird #cite(<hojo_generativegui_2025>, supplement: "S. 6").

Offenes @GenUI zeigt variable Konsistenz (35). Obwohl die Optik durch System-Anweisungen beeinflusst werden kann, bleibt es schwierig, Konsistenz über verschiedene Prompts hinweg sicherzustellen #cite(<copilotkit_2026>). Da @LLM:pl nicht deterministisch sind, werden bei gleichen Anfragen oft unterschiedliche @UI\-Strukturen generiert. Zusätzlich kann es zu Halluzinationen bei der Erstellung des Layouts kommen, was die Konsistenz ebenfalls verletzt #cite(<verhulsdonck_incorporating_2024>, supplement: "S. 62-63").

Chat-Interfaces erreichen moderate Konsistenz (75), da die Darstellung durch das Chat-Framework vorgegeben ist, aber inhaltliche Strukturierung variieren kann #cite(<hojo_generativegui_2025>, supplement: "S. 1-2").

===== Accessibility

Statisches @GenUI erzielt hohe Werte (90), da @WCAG 2.1 Level AA-Konformität bei der Entwicklung sichergestellt werden kann. Alle Templates können vorab validiert und mit assistiven Technologien getestet werden.

Deklaratives @GenUI erreicht gute Werte (75). Da der Agent eine strukturierte Beschreibung sendet und das Host-Framework native Komponenten eigenständig rendert, erben die @UI\-Elemente automatisch die Barrierefreiheitsfunktionen des Frameworks #cite(<copilotkit_2026>) #cite(<hojo_generativegui_2025>, supplement: "S. 7").

Offenes @GenUI schneidet kritisch ab (30). Agenten müssen beim Generieren von HTML-Code explizit Barrierefreiheits-Attribute setzen und semantisch korrekte Strukturen wählen. In der Praxis vernachlässigen Agenten diese Aspekte häufig, da sie sich primär auf Funktionalität und Layout konzentrieren #cite(<milo_2026>). Außerdem muss dynamisch generierter Code aus Sicherheitsgründen oft in isoliert ausgeführt werden, wodurch assistive Technologien keinen Zugriff auf die innere Struktur erhalten und die Inhalte nicht interpretieren können #cite(<google_a2ui_2025>).

Chat-Interfaces erreichen moderate Werte (60), da grundlegende Textausgabe für Screenreader zugänglich ist #cite(<Bieniek_2024>). Allerdings sind strukturierte Informationen in langen Textantworten für Menschen mit Einschränkungen schwerer konsumierbar als dedizierte Formularelemente.

===== Support für Corporate Design

Statisches @GenUI bietet maximale Kontrolle (95), da alle visuellen Elemente den SAP Fiori Gestaltungsrichtlinien entsprechen können. Entwickler haben Kontrolle über Farben, Typografie, Spacing und Komponenten-Bibliotheken, wodurch perfekte Markenkonformität garantiert wird #cite(<copilotkit_2026>).

Deklaratives @GenUI ermöglicht gute Corporate-Design-Unterstützung (75). Die Trennung von Struktur und visueller Umsetzung ermöglicht es dem @UI\-Framework, das finale Styling zu kontrollieren, wodurch die generierten Oberflächen automatisch Gestaltungsrichtlinien erben #cite(<copilotkit_2026>). @UI\5 bietet vordefinierte @UI\-Elemente, die den SAP Fiori Gestaltungsrichtlinien entsprechen #cite(<Richter_2015>).

Offenes @GenUI bietet eingeschränkte Kontrolle, wodurch es in diesem Aspekt eine geringe Bewertung erhält (40). Die @KI generiert HTML bzw. CSS ohne Zugriff auf Corporate-Design-Token oder Komponenten-Bibliotheken. Das Styling muss durch System-Prompts gesteuert werden, was inkonsistente Ergebnisse liefert und nicht die Präzision vordefinierter Gestaltungs-Systeme erreicht #cite(<copilotkit_2026>).

Chat-Interfaces erreichen geringe Werte (50), da sie wenig Möglichkeiten für visuelles Branding bieten. Die Darstellung beschränkt sich auf Markdown-Formatierung innerhalb eines Chatfensters.

===== Responsiveness

Statisches @GenUI (90) profitiert von bewährten Responsive-Design-Patterns. Layouts werden zur Entwicklungszeit implementiert und auf verschiedenen Geräten getestet, wodurch hohe Kompatibilität gewährleistet wird. Die manuelle Optimierung für verschiedene Geräteklassen ermöglicht eine perfekte Anpassung an unterschiedliche Viewport-Breiten #cite(<copilotkit_2026>).

Deklaratives @GenUI (80) ist von Grund auf plattformagnostisch #cite(<copilotkit_2026>). Deklarative Formate erben die nativen Responsiveness-Funktionalitäten der Host-Applikation und passen sich automatisch an verschiedene Bildschirmgrößen an #cite(<hojo_generativegui_2025>, supplement: "S. 7-8").

Offenes @GenUI (50) muss Responsive-Design selbst implementieren, was fehleranfällig ist und häufig zu suboptimalen Darstellungen auf mobilen Geräten führt #cite(<leviathan_generative_2025>, supplement: "S. 6").

Chat-Interfaces (70) sind grundsätzlich responsive, da Text-Container anpassbar sind. Allerdings sind sie weniger optimiert für verschiedene Bildschirmgrößen als dedizierte responsive Formulare #cite(<Bieniek_2024>).

===== Statusanzeige

Sowohl statisches @GenUI (90) als auch deklaratives @GenUI (80) ermöglichen dedizierte Statusanzeigen. Bei statischen Ansätzen werden Ladebalken, Spinner und Fortschrittsanzeigen zur Entwicklungszeit implementiert, während bei deklarativen Ansätzen die @JSON\-Beschreibung entsprechende Komponenten spezifiziert, die vom Host-Framework gerendert werden #cite(<hojo_generativegui_2025>, supplement: "S. 6"). Beide erfüllen die Nielsen-Heuristik "Sichtbarkeit des Systemstatus" #cite(<nielsen_molich_1990>, supplement: "S. 250"). Der leichte Vorteil des statischen Ansatzes liegt in der vollständigen Kontrolle über Timing und Verhalten der Indikatoren.

Offenes @GenUI (50) muss Statusanzeigen selbst generieren. Die Generierung solcher Elemente ist jedoch nicht garantiert #cite(<hojo_generativegui_2025>, supplement: "S. 6"). Da Antwortzeiten bei @KI\-Systemen oft groß und variabel sind, wären Statusanzeigen insbesondere bei solchen Systemen aber eigentlich essenziell.

Chat-Interfaces (70) zeigen typische Typing-Indikatoren, die signalisieren, dass das System arbeitet. Diese bieten jedoch keine Fortschrittsanzeige für mehrstufige Prozesse und vermitteln keine Information über die verbleibende Wartezeit #cite(<copilotkit_2026>).

===== Mehrsprachigkeit

Offenes @GenUI erzielt hier die beste Bewertung (90), da das @LLM frei mehrsprachige Inhalte in verschiedenen Sprachen generieren kann. Moderne multimodale @LLM:pl können Inhalte nuanciert an verschiedene Sprachen und Layout-Anforderungen anpassen, ohne die Barrierefreiheit zu beeinträchtigen #cite(<liang_llm-powered_2025>, supplement: "S. 3").

Chat-Interfaces (90) profitieren ebenfalls von der natürlichsprachlichen Fähigkeit der @LLM:pl, in verschiedenen Sprachen zu kommunizieren. Text-Streaming funktioniert sprachunabhängig, wodurch eine nahtlose mehrsprachige Interaktion möglich ist #cite(<liang_llm-powered_2025>, supplement: "S. 3").

Deklaratives @GenUI (85) kann mehrsprachige Texte effektiv erzeugen, da das @LLM @JSON\-Strukturen in beliebigen Sprachen befüllen kann. Die strukturierte Natur ermöglicht auch die Integration von Übersetzungsservices #cite(<hojo_generativegui_2025>, supplement: "S. 8").

Statisches @GenUI (70) ist eingeschränkter, da Templates für jede Sprache vordefiniert oder mit Internationalisierungsmechanismen ausgestattet werden müssen. Dies erfordert manuelle Übersetzung und Wartung separater Sprachversionen, was den Implementierungsaufwand erhöht.

===== Individualisierbarkeit

Offenes @GenUI bietet maximale Flexibilität (95), da es unbegrenzte kreative Freiheit hat und theoretisch jede erdenkliche Interaktion realisieren kann #cite(<copilotkit_2026>).

Deklaratives @GenUI ermöglicht moderate Anpassung (70) innerhalb der @JSON\-Struktur. Die Flexibilität ist begrenzt auf die vom Schema erlaubten Kombinationen von Komponenten und Parametern, bietet aber einen ausgewogenen Trade-off zwischen Anpassbarkeit und Konsistenz #cite(<copilotkit_2026>) #cite(<hojo_generativegui_2025>, supplement: "S. 5-6").

Chat-Interfaces (60) erlauben flexible Textausgabe und können den Inhalt dynamisch an Nutzerpräferenzen anpassen. Allerdings ist keine strukturelle Anpassung der Interaktionsform möglich – die Kommunikation bleibt textbasiert #cite(<hojo_generativegui_2025>, supplement: "S. 1-2").

Statisches @GenUI ist am restriktivsten (30), da nur vordefinierte Templates verfügbar sind. Die @ISO 9241-110 fordert Individualisierbarkeit als Qualitätsmerkmal #cite(<Prümper_1993>, supplement: "S. 153"), doch statische Ansätze priorisieren Konsistenz über Flexibilität.

===== Fehlertoleranz

Statisches @GenUI (90) bietet hohe Fehlertoleranz durch getestete, robuste Templates. Eingabevalidierung, Fehlerbehandlung und Benutzerführung sind zur Entwicklungszeit implementiert und entsprechen der @ISO 9241-110 Anforderung zur Fehlertoleranz #cite(<Prümper_1993>, supplement: "S. 153").

Deklaratives @GenUI (75) kann @JSON\-Schema-Validierung nutzen, um strukturelle Fehler zu vermeiden. Die Rendering-Engine kann ungültige Eingaben abfangen und Benutzer mit klaren Fehlermeldungen unterstützen #cite(<hojo_generativegui_2025>, supplement: "S. 6").

Chat-Interfaces (70) sind fehlertoleranter als offenes @GenUI, da Text robust darstellbar ist. Allerdings müssen Benutzer Fehler in ihren textuellen Eingaben selbst erkennen und korrigieren #cite(<hojo_generativegui_2025>, supplement: "S. 1").

Offenes @GenUI (40) ist anfällig für Generierungsfehler im Code, die zu nicht-funktionalen Interfaces führen können. Die Qualitätssicherung ist herausfordernd, da jedes generierte Interface potenziell neue Fehlerquellen einführt #cite(<verhulsdonck_incorporating_2024>, supplement: "S. 62-63").

===== Nachvollziehbarkeit

Statisches @GenUI (95) bietet maximale Nachvollziehbarkeit durch klar strukturierte Formulare mit visueller Hierarchie und eindeutiger Beschriftung.

Deklaratives @GenUI (80) ermöglicht verständliche Strukturen, da die @JSON\-Beschreibung explizite Labels, Beschreibungen und Hierarchien definiert. Die deterministische Rendering-Logik stellt sicher, dass Formulare logisch aufgebaut sind #cite(<hojo_generativegui_2025>, supplement: "S. 6-7").

Chat-Interfaces (70) leiden darunter, dass lange Textantworten strukturierte Informationen schwer konsumierbar machen. Benutzer müssen relevante Informationen aus Fließtext extrahieren, was weniger effizient ist als visuelle Strukturierung #cite(<copilotkit_2026>) #cite(<hojo_generativegui_2025>, supplement: "S. 1-2").

Offenes @GenUI (45) kann unübersichtliche Interfaces generieren, die keine klare visuelle Hierarchie aufweisen. Die Nachvollziehbarkeit hängt stark von der Qualität der @KI\-Generierung ab und ist nicht garantiert #cite(<copilotkit_2026>).

==== Wirtschaftlichkeit
Die wirtschaftliche Bewertung berücksichtigt sowohl die laufenden Betriebskosten als auch den initialen Implementierungsaufwand der verschiedenen Ansätze.

===== Betriebskosten

Statisches @GenUI schneidet am besten ab (95), da keine @LLM\-Aufrufe für die @UI\-Generierung notwendig sind. Der Agent wählt lediglich die passende Template-ID aus, was minimale API-Kosten verursacht. Die gesamte Rendering-Logik liegt im Client, wodurch keine Token-Kosten anfallen #cite(<copilotkit_2026>).

Chat-Interfaces (80) profitieren von effizientem Text-Streaming. Allerdings können wiederholte @LLM\-Calls bei komplexen Interaktionen die Kosten erhöhen, insbesondere wenn mehrere Konversationsrunden für die Informationserhebung notwendig sind #cite(<liang_llm-powered_2025>, supplement: "S. 8").

Deklaratives @GenUI verursacht moderate Kosten (75). Die Generierung strukturierter @JSON\-Beschreibungen benötigt @LLM\-Aufrufe, jedoch deutlich weniger Token als vollständiger Code. So können die Anfragen an den Agenten kompakt gehalten werden, was die Token-Nutzung und damit die API-Kosten reduziert #cite(<copilotkit_2026>) #cite(<hojo_generativegui_2025>, supplement: "S. 5").

Offenes @GenUI verursacht die höchsten Kosten (50), da vollständiger HTML-, CSS- und JavaScript-Code generiert werden muss. Die Generierung komplexer @UI:pl kann mehrere tausend Token pro Anfrage erfordern, was bei häufiger Nutzung erhebliche API-Kosten verursacht #cite(<copilotkit_2026>) #cite(<liang_llm-powered_2025>, supplement: "S. 8").

===== Implementierungsaufwand

Chat-basierte Schnittstellen sind am einfachsten zu implementieren (90), da sie auf bestehenden Chat-Frameworks und Markdown-Rendering aufbauen. Die Integration erfordert minimalen zusätzlichen Aufwand #cite(<leviathan_generative_2025>) #cite(<Bieniek_2024>).

Statisches @GenUI erfordert die manuelle Entwicklung aller Formularvorlagen (76). Jedes neue Szenario benötigt einen separaten Entwicklungsprozess, was zu einem linearen Anwachsen der Codebasis führt #cite(<copilotkit_2026>). Insbesondere bei einer hohen Anzahl von Templates zu Beginn der Entwicklung steigt der initiale Entwicklungsprozess deutlich. Die Anbindung der Formulare in das System ist allerdings unkompliziert, da lediglich wiederverwendbare @UI\-Elemente, wie @UI\5-Fragments,dynamisch geladen werden müssen #cite(<SAP_2026>).

Deklaratives @GenUI (75) erfordert die Integration bestehender @UI\-Frameworks wie SAP @UI\5. Der Aufwand liegt in der Anbindung des @KI\-Agenten an die deklarative Schnittstelle des UI-Frameworks und der Konfiguration der Rendering-Logik. Nach der initialen Implementierung ist das System jedoch skalierbar, da neue Szenarien durch @JSON\-Schema-Erweiterungen abgedeckt werden können, ohne Frontend-Code zu ändern. Die Boilerplate-Reduktion im Frontend kompensiert den initialen Aufwand #cite(<copilotkit_2026>) #cite(<hojo_generativegui_2025>, supplement: "S. 6-7").

Offenes @GenUI hat den höchsten Implementierungsaufwand (35). Es erfordert eine komplexe Isolationsinfrastruktur (z.B. Iframes mit Content-Security-Policy), umfangreiche Sicherheitsüberwachung und spezialisierte Debugging-Tools zur Fehleranalyse in @KI\-generiertem Code #cite(<copilotkit_2026>). Diese Sicherheitsanforderungen machen die Implementierung aufwändig und kostspielig.

==== Stabilität
Die Stabilitätskriterien bewerten die langfristige Anpassungsfähigkeit, Wartbarkeit und qualitative Konsistenz der verschiedenen Ansätze.

===== Wartbarkeit

Statisches @GenUI bietet die beste Wartbarkeit (90), da der Code deterministisch, versioniert und mit etablierten Testing-Praktiken überprüfbar ist. Entwickler können Unit-Tests, Integration-Tests und visuelle Regressionstests einsetzen. Die klare Trennung zwischen Logik und Darstellung erleichtert Fehlerdiagnose und Wartung.

Deklaratives @GenUI erreicht gute Wartbarkeit (80), da @JSON\-Schemas validierbar sind und strukturelle Fehler automatisch erkannt werden können. Allerdings erfordert die Integration mit @UI\-Frameworks spezifische Kenntnisse der jeweiligen API und ihrer Konfigurationsmöglichkeiten. Die Wartung der Anbindungslogik zwischen @KI\-Agent und Framework erfordert spezialisierte Expertise #cite(<hojo_generativegui_2025>, supplement: "S. 6-7").

Chat-Interfaces (80) profitieren von Standard-Markdown, das minimale Maintenance erfordert. Die Einfachheit des Formats reduziert Fehlerquellen und erleichtert Updates. Allerdings können komplexe Konversationslogiken schwer nachvollziehbar werden #cite(<hojo_generativegui_2025>, supplement: "S. 2").

Offenes @GenUI leidet unter schlechter Wartbarkeit (40). @KI\-generierter Code ist oft redundant, inkonsistent strukturiert und schwer zu debuggen #cite(<sapkota_ai_2026>, supplement: "S. 29"). Da jede @UI\-Generierung potenziell neuartigen Code produziert, können systematische Fehler nicht zentral behoben werden. Die Qualitätssicherung erfordert manuelle Code-Reviews für jedes generierte Interface #cite(<copilotkit_2026>).

===== Erweiterbarkeit

Offenes @GenUI ist am flexibelsten erweiterbar (85), da es durch Prompt-Engineering neue Funktionalitäten ohne Code-Änderungen ermöglicht. Die @KI kann spontan neue @UI\-Elemente generieren, wodurch maximale Anpassungsfähigkeit erreicht wird #cite(<leviathan_generative_2025>). Allerdings besteht das Risiko inkonsistenter Implementierungen.

Deklaratives @GenUI bietet die beste Balance (80) zwischen Erweiterbarkeit und Kontrolle. Ein Agent kann einmal entwickelt werden und seine @UI auf Web, Mobile und Desktop ohne Code-Änderungen projizieren #cite(<copilotkit_2026>). Neue Formulartypen werden durch Schema-Erweiterungen hinzugefügt, was die Codebasis modular hält #cite(<hojo_generativegui_2025>, supplement: "S. 7-8").

Chat-Interfaces (70) ermöglichen einfache Texterweiterungen durch Anpassung der @LLM\-Prompts. Allerdings sind strukturelle Limitierungen gegeben, da komplexe Interaktionen sich nicht durch reine Textausgabe abbilden lassen #cite(<hojo_generativegui_2025>, supplement: "S. 1-2").

Statisches @GenUI ist am restriktivsten (40), da jede neue Funktionalität die manuelle Entwicklung eines neuen Templates erfordert. Dies ist aufwädig und führt zu einem linearen Anwachsen der Codebasis #cite(<copilotkit_2026>).

===== Einsatz zukunftssicherer Technologien

Statisches @GenUI (85) basiert im SAP-Kontext auf SAP @UI\5, das breite Community-Unterstützung und langfristige Wartung durch SAP genießt. Diese Technologie hat sich als Industriestandard im Enterprise-Umfeld etabliert und wird voraussichtlich über Jahre hinweg unterstützt.

Deklaratives @GenUI (80) nutzt Standards wie @A2UI, Adaptive Cards und Open-@JSON\-UI #cite(<copilotkit_2026>). Diese Protokolle werden von großen Technologieunternehmen (Google, Microsoft) vorangetrieben und gewinnen an Adoption. Die wachsende Akzeptanz deutet auf langfristige Relevanz hin, aber die Standards sind noch nicht vollständig ausgereift.

Chat-Interfaces (75) basieren auf Markdown als stabilem, weit verbreitetem Standard. Allerdings sind sie in ihrer @UX durch die Limitierungen textueller Interaktion beschränkt, was ihre langfristige Relevanz für komplexe Anwendungsfälle einschränkt.

Offenes @GenUI (95) profitiert von der kontinuierlichen Verbesserung der Code-Generierungsfähigkeiten von @LLM:pl #cite(<kaplan_scaling_2020>, supplement: "S. 2") und basiert auf stabilen Web-Standards (HTML, CSS, JavaScript).

===== Funktionale Konsistenz (sitzungsübergreifend)

Statisches @GenUI (95) garantiert optische Einheitlichkeit über Sitzungen hinweg, wenn die gleichen Formulare ausgewählt werden. Da die Formulare zur Entwicklungszeit definiert sind, produziert derselbe Aufruf immer dieselbe @UI #cite(<copilotkit_2026>). Die Bewertung ist nicht perfekt, da es durch nicht-deterministisches Verhalten des Agenten dazu kommen kann, dass er bei der selben Situation verschiedene Templates auswählt. Diesem Risiko kann allerdings durch Prompt-Engineering entgegengewirkt werden #cite(<sapkota_ai_2026>, supplement: "S. 18").

Deklaratives @GenUI (80) ist konsistent, solange das @JSON\-Schema eingehalten wird. Die strukturierte Natur der Beschreibung minimiert Variabilität. Allerdings können @LLM:pl gelegentlich leicht unterschiedliche @JSON\-Strukturen für ähnliche Anfragen generieren.

Chat-Interfaces (70) zeigen konsistente Darstellung, da das Chat-Framework fix ist. Der Inhalt kann jedoch zwischen Sitzungen variieren, da @LLM:pl stochastisch arbeiten und unterschiedliche Antworten auf gleiche Fragen geben können #cite(<liang_llm-powered_2025>, supplement: "S. 5").

Offenes @GenUI (35) leidet unter variabler Konsistenz durch die stochastische Natur der @LLM\-Generierung. Halluzinationen in @UI\-Layout und -Struktur treten auf, wodurch ähnliche Anfragen zu unterschiedlichen Interfaces führen können #cite(<verhulsdonck_incorporating_2024>, supplement: "S. 62-63"). Dies erschwert die Vorhersagbarkeit und Zuverlässigkeit des Systems.

==== Sicherheit
Die Sicherheitsbewertung fokussiert sich auf das Risiko von Code-Injection und anderen Manipulationsangriffen bei der dynamischen @UI\-Generierung.

===== Manipulationssicherheit

Statisches @GenUI (95) bietet höchste Sicherheit, da kein Code-Execution-Risiko besteht. Der Agent übergibt lediglich Datenparameter an vordefinierte Templates, wodurch keine Möglichkeit zur Code-Injection gegeben ist #cite(<copilotkit_2026>). Alle potenziell gefährlichen Operationen sind zur Entwicklungszeit bekannt und können abgesichert werden.

Chat-Interfaces (90) haben ebenfalls hohes Sicherheitsniveau, da keine Code-Ausführung im Client stattfindet. Die Hauptbedrohung sind Prompt-Injection-Angriffe, bei denen Nutzer versuchen, durch manipulierte Eingaben das @LLM\-Verhalten zu beeinflussen. Diese Angriffe betreffen jedoch primär die Inhaltsebene, nicht die Systemsicherheit #cite(<raheem_agentic_2025>, supplement: "S. 620-621").

Deklaratives @GenUI (85) minimiert Injection-Risiken, da nur ein Katalog vertrauenswürdiger, vorab genehmigter Komponenten verwendet wird #cite(<copilotkit_2026>). Der Agent liefert strukturierte Daten, keinen ausführbaren Code. Bei Adaptive Cards ist die Interaktivität rein deklarativ spezifiziert, wodurch Injektionsrisiken erheblich reduziert werden. Allerdings muss die Rendering-Engine gegen malformed @JSON\-Inputs abgesichert sein #cite(<hojo_generativegui_2025>, supplement: "S. 7").

Offenes @GenUI (25) ist kritisch risikoreich, da es die Ausführung beliebigen, durch die @KI generierten Codes erfordert #cite(<copilotkit_2026>). Dies schafft potenzielle Angriffsvektoren (beispielsweise Code-Injection-Exploits). Strikte Isolierung ist zwingend erforderlich, um die Systemsicherheit zu gewährleisten #cite(<copilotkit_2026>) #cite(<raheem_agentic_2025>, supplement: "S. 620-621"). Selbst mit solcher Isolierung bleibt ein Restrisiko, dass @LLM:pl schädlichen oder ungewollt fehlerhaften Code generieren.

=== Berechnung des Nutzwerts
Der Gesamtnutzwert jeder Alternative ergibt sich aus der Summe der gewichteten Einzelbewertungen. Die Formel lautet:

$ N_j = sum_(i=1)^n g_i dot p_(i j) $

Dabei ist $N_j$ der Nutzwert der Alternative $j$, $g_i$ die Gewichtung des Kriteriums $i$ und $p_(i j)$ die Punktzahl der Alternative $j$ für Kriterium $i$.

Die Einzelwerte sind in @tab:nwa_bewertung im Anhang unter @anhang:nwa_table dokumentiert. @tab:nwa_ranking zeigt das resultierende Ranking der Alternativen.

#figure(
  caption: [Ranking der Alternativen],
  table(
    columns: 4,
    stroke: 1pt,
    align: (center, left, center, left),
    [*Rang*], [*Alternative*], [*Nutzwert*], [*Bewertung*],
    [1], [Statisches @GenUI], [86,15], [Sehr gut],
    [2], [Deklaratives @GenUI], [77,30], [Gut],
    [3], [Chat-basierte Schnittstellen], [76,89], [Gut],
    [4], [Offenes @GenUI], [48,79], [Befriedigend],
  ),
) <tab:nwa_ranking>

=== Präsentation und Dokumentation des Ergebnisses

Die @NWA ergibt ein eindeutiges Ergebnis: Das statische @GenUI erreicht mit 86,15 Punkten den höchsten Nutzwert und wird als bevorzugter Ansatz für die Implementierung des Feedback-Tools empfohlen.

==== Interpretation der Ergebnisse
Der deutliche Vorsprung des statischen Ansatzes resultiert primär aus dessen Stärken in den hochgewichteten Kriterien. Insbesondere bei Reaktionszeit (7,32 % Gewichtung), Manipulationssicherheit (7,32 %) und Betriebskosten (7,15 %) erzielt dieser Ansatz Bestwerte. Die vordefinierte Natur der Formulare gewährleistet konsistente Darstellung, vollständige Kontrolle über Accessibility-Standards und minimale Laufzeitkosten.

Deklaratives @GenUI (77,30 Punkte) und Chat-basierte Schnittstellen (76,89 Punkte) liegen nahe beieinander auf den Rängen zwei und drei. Beide Ansätze bieten einen guten Kompromiss zwischen Kontrolle und Flexibilität, wobei der deklarative Ansatz bei Erweiterbarkeit und der Chat-Ansatz bei Implementierungsaufwand Vorteile hat.

Das offene @GenUI (48,79 Punkte) fällt deutlich ab. Die theoretische Flexibilität wird durch erhebliche Nachteile bei Sicherheit, Konsistenz und Kosten überlagert. Für einen produktiven Einsatz im SAP-Umfeld, das hohe Anforderungen an Stabilität und Compliance stellt, ist dieser Ansatz momentan nicht geeignet.

==== Sensitivitätsbetrachtung
Die Robustheit des Ergebnisses wurde durch Variation der Gewichtungen überprüft. Selbst bei einer Erhöhung der Gewichtung für Individualisierbarkeit und Erweiterbarkeit um 50 % behält das statische UI seinen Vorsprung. Erst bei einer unrealistischen Umkehrung der Prioritäten -- wenn Flexibilität wichtiger als Stabilität und Sicherheit wäre -- würde sich das Ranking ändern. Dies bestätigt die Validität der Entscheidung.

==== Empfehlung
Basierend auf den Ergebnissen der @NWA wird das statische Generative UI für die prototypische Implementierung des Feedback-Tools ausgewählt.

Die Einschränkung der geringeren Individualisierbarkeit ist im Kontext des Anwendungsfalls akzeptabel, da die Feedback-Szenarien des Lean Catalog überschaubar und vorhersehbar sind. Die Auswahl geeigneter Formularvorlagen kann durch den @KI\-Agenten auf Basis des Kontexts erfolgen.

Im folgenden Kapitel wird die prototypische Implementierung dieses Ansatzes beschrieben.
