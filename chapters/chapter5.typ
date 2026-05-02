#import "@preview/drafting:0.2.2": *

= Evaluation <sec:evaluation>

Dieses Kapitel beschreibt die Evaluation des entwickelten Feedback-Tools. Zunächst wird die Evaluationsmethodik erläutert, anschließend werden die quantitativen und qualitativen Ergebnisse präsentiert und abschließend trianguliert.

== Evaluationsmethodik

Zur Evaluation des entwickelten Feedback-Tools werden quantitative und qualitative Methoden kombiniert. Diese Methodentriangulation ermöglicht sowohl die statistische Bewertung der Gebrauchstauglichkeit als auch die tiefgehende Analyse der praktischen Eignung des Systems für die Qualitätssicherung @KI\-generierter Inhalte.

Der quantitative Teil der Evaluation umfasst standardisierte Fragebögen auf Basis der @SUS sowie der HEAT-Heuristiken und ergänzenden Elementen aus den Usability-Heuristiken nach Nielsen und der @ISO 9241-110. Die quantitative Evaluation wird mit Testpersonen ohne spezifische Fachexpertise durchgeführt, um die Gebrauchstauglichkeit des Prototyps allgemein auszuwerten.

Der qualitative Teil erfolgt über semi-strukturierte Experteninterviews. Diese dienen der vertiefenden Bewertung fachspezifischer Aspekte, die über standardisierte Fragebögen hinausgehen. Die Experteninterviews folgen einem thematischen Leitfaden, erlauben aber explorative Vertiefung basierend auf der jeweiligen Fachexpertise.

== Quantitative Evaluation
Die quantitative Evaluation durch Fragebögen nutzt eine Kombination aus drei komplementären Instrumenten:

*@SUS*: Die @SUS wird zur allgemeinen Bewertung der Usability, wie in @sec:sus beschrieben, verwendet. 

*HEAT-Heuristiken*: Als speziell für @GenAI\-Systeme entwickelter Rahmen #cite(<verhulsdonck_incorporating_2024>, supplement: "S. 61-65") werden die HEAT-Heuristiken ergänzend verwendet. Dabei werden sowohl die Qualität der vordefinierten @UI\-Fragments als auch die Eignung der situativen Formular-Auswahl durch den @KI\-Agenten bewertet. Die vier Dimensionen (vgl. @sec:heat) werden jeweils durch drei Aussagen auf einer 5-Punkte-Skala erfasst und bewerten, ob die dynamisch ausgewählten Formulare im jeweiligen Kontext angemessen sind und effektive Validierung ermöglichen.

*Ergänzende Usability-Aspekte*: Zusätzlich werden drei weitere Usability-Dimensionen erfasst, die weder durch SUS noch durch HEAT vollständig abgedeckt werden: Systemstatus-Sichtbarkeit (Nielsen-Heuristik #1), Benutzerkontrolle (Nielsen #3, @ISO 9241-110 Steuerbarkeit) und Performance (Reaktionszeit aus der @NWA). Diese drei Aussagen schließen Lücken der standardisierten Fragebögen.

Der vollständige Fragebogen umfasst also 25 Aussagen (10 SUS + 12 HEAT + 3 ergänzende) sowie drei offene Fragen zu positiven und negativen Aspekten des Prototypen. Er ist im Anhang unter @anhang:fragebogen zu finden.

== Qualitative Evaluation

Die Experteninterviews nutzen bewusst keine formale heuristische Evaluation mit festen Bewertungsrahmen. Diese Heuristiken werden bereits im quantitativen Teil der Evaluation abgedeckt. Stattdessen ermöglicht der semi-strukturierte Ansatz mit thematischem Leitfaden, dass Experten ihre implizite Fachexpertise frei äußern und Aspekte identifizieren, die über standardisierte Checklisten hinausgehen.

Für die Experteninterviews werden zwei komplementäre Expertenperspektiven einbezogen: zwei @UX\-Experten mit Fachwissen in Benutzeroberflächen-Design und Usability Engineering, sowie ein @KI\-Experte mit Expertise in @GenAI und agentischen Systemen. Die @UX\-Experten bewerten primär gestalterische Qualität und @UX. Der @KI\-Experte fokussiert sich auf die Implementierung des Feedback-Tools im Agenten-Loop.

== Ergebnisse

Im Folgenden werden die Ergebnisse der quantitativen Fragebogenerhebung und der qualitativen Experteninterviews dargestellt. Abschließend erfolgt eine Triangulation beider Datenquellen. Die vollständigen Rohdaten sowie die Interview-Transkripte finden sich in den digitalen Beigaben.

=== Quantitative Ergebnisse

An der quantitativen Evaluation nahmen sechs Testpersonen teil. Alle Teilnehmer waren zwischen 20 und 30 Jahren alt, nutzten Software täglich und hatten regelmäßige bis gelegentliche Erfahrung mit @KI\-gestützten Tools. 

==== System Usability Scale

Die @SUS\-Auswertung ergab einen Mittelwert von 84,17 Punkten. Nach Brooke #cite(<brooke_1996>, supplement: "S. 192") liegt dieser Wert im Bereich "Excellent". Die Einzelwerte variierten zwischen 70 und 97,5 Punkten.

#figure(
  table(
    columns: (auto, auto),
    align: (left, center),
    table.header([*Teilnehmer*], [*SUS-Score*]),
    [1], [82,5],
    [2], [90],
    [3], [97,5],
    [4], [70],
    [5], [87,5],
    [6], [77,5],
    [*Durchschnitt*], [*84,17*],
  ),
  caption: [SUS-Scores der Teilnehmer]
) <tab:sus-scores>

==== HEAT-Dimensionen

Die HEAT-Auswertung #cite(<verhulsdonck_incorporating_2024>, supplement: "S. 61-65") zeigt durchgehend positive Bewertungen. Expertise (4,61) und Trust (4,45) erreichten die höchsten Werte, Accuracy (4,06) den niedrigsten.

#figure(
  table(
    columns: (auto, auto),
    align: (left, center),
    table.header([*Dimension*], [*Mittelwert*]),
    [Human Experience], [4,33],
    [Expertise], [4,61],
    [Accuracy], [4,06],
    [Trust], [4,45],
  ),
  caption: [HEAT-Dimensionen (Skala 1-5)]
) <tab:heat-scores>

==== Ergänzende Elemente

Systemstatus-Sichtbarkeit (4,33), Benutzerkontrolle (4,5) und Performance (4,17) wurden ebenfalls positiv bewertet.

==== Offene Rückmeldungen

Positiv hervorgehoben wurden der Ablaufplan, die Flexibilität der Bildgenerierung und die Reaktionsgeschwindigkeit. Als problematisch gaben drei Teilnehmer Responsiveness-Probleme auf kleineren Bildschirmen an. Ein Teilnehmer berichtete zudem Unklarheiten bei der Benennung von Buttons.

=== Qualitative Ergebnisse der Experteninterviews

Zur Validierung und Vertiefung der quantitativen Befunde wurden drei Experteninterviews durchgeführt. Die Experten bewerteten den Prototyp aus ihrer jeweiligen fachlichen Perspektive.

==== Perspektive des KI-Experten

Der befragte @KI\-Experte (Project Consultant Development, mit besonderer Expertise für @LLM\-Output-Evaluation) bewertete die Einschränkung durch vordefinierte Formulare positiv, da Nutzer so klar erkennen, welche Use Cases abgedeckt werden #cite(<interview_ki_experte>). Das Schrittprotokoll wurde als hilfreich für Transparenz bewertet, die technische Umsetzung des Feedback-Loops als gelungen bezeichnet #cite(<interview_ki_experte>).

Als Schwäche nannte er die eingeschränkte Flexibilität gegenüber freien Chatbots, relativierte jedoch, dass nicht jeder Anwendungsfall einen Chat erfordere #cite(<interview_ki_experte>). Insgesamt bestätigte er die Eignung für Qualitätssicherung, insbesondere die Human-in-the-Loop-Integration bei der Bildgenerierung #cite(<interview_ki_experte>). Verbesserungspotenziale sah er bei Kontextwissen des Agents und paralleler Bildgenerierung #cite(<interview_ki_experte>).

==== Perspektive der @UX\-Experten

Zwei @UX\-Experten bestätigten unabhängig die Notwendigkeit menschlicher Validierung für @KI\-generierte Inhalte im aktuellen Entwicklungsstand #cite(<interview_ux_experte_1>) #cite(<interview_ux_experte_2>). Das Schrittprotokoll wurde als deutlich hilfreicher als reine Ladeanzeigen bewertet, der Gesamtflow als gut durchdacht eingestuft #cite(<interview_ux_experte_1>).

Beide Experten identifizierten Optimierungspotenzial bei UI-Details. Bspw. Button-Farbsemantik, Wording (z.B. neutralere Formulierung statt "Ablehnen") und bedingte Aktivierung von Buttons #cite(<interview_ux_experte_1>) #cite(<interview_ux_experte_2>). Die Gesamtbewertung für die Usability fiel positiv aus, kritische Hindernisse wurden nicht identifiziert #cite(<interview_ux_experte_1>) #cite(<interview_ux_experte_2>).

=== Triangulation der Ergebnisse

Die quantitativen Befunde werden durch die qualitativen Erkenntnisse gestützt. Der hohe @SUS\-Score von 82,5 korreliert mit den positiven Expertenaussagen zur Nutzerfreundlichkeit. Die HEAT-Werte für Trust (4,50) werden durch das Lob des Schrittprotokolls erklärt, das Transparenz über den Systemstatus schafft. Der vergleichsweise niedrigere Accuracy-Wert (4,06) lässt sich durch die bemängelte Button-Semantik erklären. Beispielsweise führten unklare Unterscheidung zwischen "Ablehnen" und "Abbrechen" zu Unsicherheiten bei der Feedback-Verarbeitung.

Die Schwerpunktsetzung der Experten unterschied sich erwartungsgemäß: Der @KI\-Experte fokussierte auf architektonische Aspekte wie Agent-Patterns und Erweiterbarkeit, die @UX\-Experten auf visuelle Gestaltung und Fiori-Konformität. Alle drei bestätigen übereinstimmend die Notwendigkeit menschlicher Validierung und die Eignung des Tools für diesen Zweck.
