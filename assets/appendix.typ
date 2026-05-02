#import "@preview/rexllent:0.4.0": xlsx-parser
#counter(heading).update(0)

#set page(flipped: true)

== Bewertungsmatrix der Nutzwertanalyse <tab:nwa_bewertung>

#figure(
    table(
      columns: (auto, auto, auto, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr),
      stroke: 0.5pt,
      align: (left, left, center, center, center, center, center, center, center, center, center),
      table.header(
        table.cell(rowspan: 2)[*Kategorie*],
        table.cell(rowspan: 2)[*Kriterium*],
        table.cell(rowspan: 2)[*Gewichtung*],
        table.cell(colspan: 2)[*Statisch*],
        table.cell(colspan: 2)[*Deklarativ*],
        table.cell(colspan: 2)[*Offen*],
        table.cell(colspan: 2)[*Chat*],
        [Bew.], [Gew.], [Bew.], [Gew.], [Bew.], [Gew.], [Bew.], [Gew.],
      ),
      [UX], [Reaktionszeit], [7,32], [*95*], [*6,95*], [70], [5,12], [40], [2,93], [90], [6,59],
      [UX], [Accessibility], [3,99], [*90*], [*3,59*], [75], [2,99], [30], [1,20], [60], [2,39],
      [UX], [Responsiveness], [4,83], [*90*], [*4,35*], [80], [3,86], [50], [2,42], [70], [3,38],
      [UX], [Generierungsgeschwindigkeit], [7,15], [*95*], [*6,79*], [65], [4,65], [35], [2,50], [85], [6,08],
      [UX], [Darstellungskonsistenz], [6,16], [*95*], [*5,85*], [80], [4,93], [35], [2,16], [75], [4,62],
      [UX], [Mehrsprachigkeit], [5,16], [70], [3,61], [85], [4,39], [*90*], [*4,64*], [*90*], [*4,64*],
      [UX], [Statusanzeige], [5,66], [*90*], [*5,09*], [80], [4,53], [50], [2,83], [70], [3,96],
      [UX], [Support für Corporate Design], [3,00], [*95*], [*2,85*], [75], [2,25], [40], [1,20], [50], [1,50],
      [UX], [Individualisierbarkeit], [2,16], [30], [0,65], [70], [1,51], [*95*], [*2,05*], [60], [1,30],
      [UX], [Fehlertoleranz], [6,16], [*90*], [*5,54*], [75], [4,62], [40], [2,46], [70], [4,31],
      [UX], [Nachvollziehbarkeit], [4,83], [*95*], [*4,59*], [80], [3,86], [45], [2,17], [70], [3,38],
      [Wirtschaftlichkeit], [Betriebskosten], [7,15], [*95*], [*6,79*], [75], [5,36], [50], [3,58], [80], [5,72],
      [Wirtschaftlichkeit], [Implementierungsaufwand], [5,82], [76], [4,42], [75], [4,37], [35], [2,04], [*90*], [*5,24*],
      [Stabilität], [Wartbarkeit], [5,99], [*90*], [*5,39*], [80], [4,79], [40], [2,40], [80], [4,79],
      [Stabilität], [Erweiterbarkeit], [5,66], [40], [2,26], [80], [4,53], [*85*], [*4,81*], [70], [3,96],
      [Stabilität], [Einsatz zukunftssicherer Technologien], [5,82], [85], [4,95], [80], [4,66], [*95*], [*5,53*], [75], [4,37],
      [Stabilität], [Funktionale Konsistenz], [5,82], [*95*], [*5,53*], [80], [4,66], [35], [2,04], [70], [4,07],
      [Sicherheit], [Manipulationssicherheit], [7,32], [*95*], [*6,95*], [85], [6,22], [25], [1,83], [90], [6,59],
    ),
  )

#set page(flipped: false)

== Fragebogen für quantitative Evaluation <anhang:fragebogen>

Der folgende Fragebogen wird für die quantitative Evaluation mit Testpersonen (n=5) eingesetzt. Er kombiniert demografische Fragen, den standardisierten System Usability Scale (SUS) Fragebogen und die HEAT-Heuristik zur Bewertung @KI\-spezifischer Qualitätsdimensionen.

=== Demografische Angaben

D1. Wie alt sind Sie?
  - Unter 25
  - 25-34
  - 35-44
  - 45-54
  - 55 oder älter

D2. Wie häufig nutzen Sie Software oder Webanwendungen beruflich?
  - Täglich
  - Mehrmals pro Woche
  - Gelegentlich
  - Selten

D3. Haben Sie bereits Erfahrung mit @KI\-gestützten Tools (z.B. ChatGPT, Bildgeneratoren)?
  - Ja, regelmäßig
  - Ja, gelegentlich
  - Nein, aber ich kenne solche Tools
  - Nein


=== System Usability Scale (SUS)

#table(
  columns: 2,
  stroke: none,
  align: (left, left),
  [*Nr.*], [*Aussage*],
  [S1], [Ich denke, dass ich das System gerne häufig benutzen würde.],
  [S2], [Ich fand das System unnötig komplex.],
  [S3], [Ich fand das System einfach zu benutzen.],
  [S4], [Ich glaube, ich würde die Hilfe einer technisch versierten Person benötigen, um das System nutzen zu können.],
  [S5], [Ich fand, dass die verschiedenen Funktionen des Systems gut integriert waren.],
  [S6], [Ich fand, dass es im System zu viele Inkonsistenzen gab.],
  [S7], [Ich kann mir vorstellen, dass die meisten Menschen den Umgang mit diesem System sehr schnell lernen.],
  [S8], [Ich fand das System sehr umständlich zu nutzen.],
  [S9], [Ich fühlte mich bei der Nutzung des Systems sehr sicher.],
  [S10], [Ich musste eine Menge lernen, bevor ich mit dem System arbeiten konnte.],
)

*Antwortskala:* 1 = stimme überhaupt nicht zu | 2 = stimme eher nicht zu | 3 = neutral | 4 = stimme eher zu | 5 = stimme voll zu

=== HEAT-Heuristik

#table(
  columns: 2,
  stroke: none,
  align: (left, left),
  [*Nr.*], [*Aussage*],
  [H1], [Die angezeigten Formulare fühlten sich natürlich und passend an],
  [H2], [Die Interaktion war verständlich und nachvollziehbar],
  [H3], [Die Formulare waren hilfreich für die Validierungsaufgaben],
  [E1], [Die Formulare unterstützten mich angemessen bei der Validierung],
  [E2], [Ich konnte meine fachliche Einschätzung vollständig ausdrücken],
  [E3], [Das System berücksichtigte die notwendigen Validierungsdimensionen],
  [A1], [Die Formulare erfassten mein Feedback präzise],
  [A2], [Mein Feedback wurde vollständig erfasst],
  [A3], [Es bestand kein Risiko für Missverständnisse],
  [T1], [Der Prozess war transparent und nachvollziehbar],
  [T2], [Ich vertraue darauf, dass mein Feedback korrekt verarbeitet wird],
  [T3], [Das System verhielt sich konsistent und verlässlich],
)

*Antwortskala:* 1 = trifft nicht zu | 2 = trifft eher nicht zu | 3 = neutral | 4 = trifft eher zu | 5 = trifft voll zu

=== Ergänzende Usability-Aspekte

#table(
  columns: 2,
  stroke: none,
  align: (left, left),
  [*Nr.*], [*Aussage*],
  [U1], [Ich wusste jederzeit, was das System gerade tat],
  [U2], [Ich hatte die Kontrolle über den Ablauf der Validierung],
  [U3], [Das System reagierte schnell auf meine Eingaben],
)

*Antwortskala:* 1 = trifft nicht zu | 2 = trifft eher nicht zu | 3 = neutral | 4 = trifft eher zu | 5 = trifft voll zu

=== Offene Fragen

#table(
  columns: 2,
  stroke: none,
  align: (left, left),
  [*Nr.*], [*Aussage*],
  [O1], [Was hat Ihnen am Tool besonders gut gefallen?],
  [O2], [Was fanden Sie besonders schwierig oder verwirrend?],
  [O3], [Haben Sie weitere Anmerkungen oder Verbesserungsvorschläge?],
)

// == Experteninterviews: Detaillierter Fragenkatalog <anhang:fragenkatalog>

// Der folgende Fragenkatalog dient als thematischer Leitfaden für die semi-strukturierten Experteninterviews.

// == A. Einführung

// 1. Welche Rolle haben Sie in Ihrem beruflichen Kontext?
// 2. Welche Erfahrung haben Sie mit @KI\-generierten Inhalten (Texte, Bilder)?
// 3. _(Für UX-Expertin)_ Welche Erfahrung haben Sie mit der Evaluation von Benutzeroberflächen? Welche Methoden nutzen Sie?
// 4. _(Für KI-Experten)_ Welche Erfahrung haben Sie mit @HITL\-Systemen oder der Qualitätssicherung @KI\-generierter Inhalte?
// 5. _(Für KI-Experten)_ Welche Erfahrung haben Sie mit @GenUI?

// == B. Prototyp-Demonstration mit thematisch geleiteter Kommentierung (20 Minuten)

// *Leitfragen zur Usability und Verständlichkeit:*

// 6. Was fällt Ihnen spontan an diesem Formular auf?
// 7. Ist die Funktionsweise unmittelbar klar, oder benötigt es Erklärungen?
// 8. Wie intuitiv sind die Interaktionen? Gibt es verwirrende Elemente?
// 9. Sehen Sie Inkonsistenzen in der Gestaltung zwischen Formularen?

// *Leitfragen zur Eignung für Qualitätssicherung:*

// 10. Erfasst dieses Formular die notwendigen Validierungsinformationen?
// 11. Fehlen wichtige Eingabemöglichkeiten oder Validierungsdimensionen?
// 12. Ist die Feedback-Struktur für @KI\-Agenten sinnvoll interpretierbar?
// 13. Unterstützt das Tool effektive Qualitätssicherung @KI\-generierter Inhalte?

// *Leitfragen zu Vergleich und Kontext:*

// 14. Wie unterscheidet sich das Tool von vergleichbaren Ansätzen (z.B. Chat-basierte @KI\-Assistenten)?
// 15. Ist die Balance zwischen Agentenautonomie und menschlicher Kontrolle angemessen?
// 16. Welche Stärken oder Schwächen zeigen sich im Vergleich?

// == C. Zusammenfassende Bewertung

// 17. Was sind insgesamt die größten Stärken des Tools?
// 18. Was sind die größten Schwächen oder Limitierungen?
// 19. Welche 2-3 Verbesserungen wären am wichtigsten und warum?
// 20. Ist das Tool für seinen Zweck (@KI\-basierte Qualitätssicherung) geeignet?
// 21. Gibt es noch wichtige Aspekte, die wir nicht besprochen haben?

// == Anforderungsprofile der Experten <anhang:expertenprofile>

// == Expertin 1: UX-Expertin

// Die UX-Expertin verfügt über Fachwissen in der Gestaltung von Benutzeroberflächen und Interaktionsdesign. Ihre Expertise ermöglicht die systematische Bewertung der Gebrauchstauglichkeit, Formulargestaltung und Konsistenz des Feedback-Tools. Sie kann beurteilen, ob die Formulare etablierten Usability-Prinzipien entsprechen und ob die Interaktionsmuster intuitiv und effizient sind.

// *Anforderungen:*
// - Berufserfahrung im UI/UX-Design oder Usability Engineering
// - Kenntnis von Usability-Prinzipien (ISO 9241-110, Nielsen-Heuristiken)
// - Erfahrung in der Evaluation von Softwaresystemen
// - Idealerweise: Erfahrung mit Enterprise-Anwendungen oder UI5

// *Bewertungsfokus:*

// Die UX-Expertin bewertet primär die *Human Experience*-Dimension der HEAT-Heuristik sowie allgemeine Usability-Aspekte: Verständlichkeit, visuelle Konsistenz, Effizienz der Interaktion und Erlernbarkeit.

// == Experte 2: KI-Experte

// Der KI-Experte verfügt über Fachwissen im Bereich künstliche Intelligenz, insbesondere @GenAI und agentische Systeme. Seine Expertise ermöglicht die Bewertung, ob das Feedback-Tool die spezifischen Anforderungen von @HITL\-Systemen erfüllt. Er kann beurteilen, ob die strukturierte Feedback-Erfassung für die Qualitätssicherung @KI\-generierter Inhalte geeignet ist und ob die gewählten Formulartypen die relevanten Validierungsdimensionen abdecken.

// *Anforderungen:*
// - Berufserfahrung im Bereich @KI, Machine Learning oder agentische Systeme
// - Kenntnis von @HITL\-Ansätzen und @GenAI\-Qualitätssicherung
// - Verständnis für die Herausforderungen @KI\-generierter Inhalte (Halluzinationen, Qualitätsvarianz)
// - Idealerweise: Erfahrung mit der Evaluation @KI\-basierter Systeme

// *Bewertungsfokus:*

// Der KI-Experte bewertet primär die *Expertise*, *Accuracy* und *Trust*-Dimensionen der HEAT-Heuristik: Erfasst das Tool die notwendigen Validierungsinformationen präzise? Ist die Feedback-Struktur für @KI\-Agenten sinnvoll interpretierbar? Ermöglicht das System effektive Qualitätssicherung?
