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

Die Experteninterviews nutzen bewusst keine formale heuristische Evaluation mit festen Bewertungsrahmen. Diese Heuristiken werden bereits im quantitativen Teil der Evaluation abgedeckt. Stattdessen ermöglicht der semi-strukturierte Ansatz mit thematischem Leitfaden, dass Experten ihre Fachexpertise frei äußern und Aspekte identifizieren, die über standardisierte Heuristiken hinausgehen.

Für die Experteninterviews werden zwei komplementäre Expertenperspektiven einbezogen: zwei @UX\-Experten mit Fachwissen in Benutzeroberflächen-Design und Usability Engineering, sowie ein @KI\-Experte mit Expertise in @GenAI und agentischen Systemen. Die @UX\-Experten bewerten primär gestalterische Qualität und @UX. Der @KI\-Experte fokussiert sich auf die Implementierung des Feedback-Tools im Agenten-Loop.

== Ergebnisse

Im Folgenden werden die Ergebnisse der quantitativen Fragebogenerhebung und der qualitativen Experteninterviews dargestellt. Abschließend erfolgt eine Triangulation beider Datenquellen. Die vollständigen Rohdaten finden sich im Anhang unter @anhang:ux_ergebnisse, die Interview-Transkripte in den digitalen Beigaben.
#inline-note(text("Transkripte in die Beigaben packen"))

=== Quantitative Ergebnisse

An der quantitativen Evaluation nahmen sechs Testpersonen teil. Alle Teilnehmer waren zwischen 20 und 30 Jahren alt, nutzten Software täglich und hatten regelmäßige bis gelegentliche Erfahrung mit @KI\-gestützten Tools.

==== System Usability Scale

Die @SUS\-Auswertung ergab einen Mittelwert von 84,17 Punkten. Nach Brooke #cite(<brooke_1996>, supplement: "S. 192") liegt dieser Wert im Bereich "Excellent". Die Einzelwerte variierten zwischen 70 und 97,5 Punkten bei einer Standardabweichung von 9,70 Punkten. Selbst der niedrigste Einzelwert von 70 Punkten überschreitet die von Brooke definierte Akzeptanzschwelle von 68 Punkten, sodass kein Teilnehmer kritische Usability-Probleme erlebte. Die @SUS\-Scores der Teilnehmer sind in @tab:sus-scores zu finden.

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

Die Item-Level-Analyse offenbart differenziertere Muster hinter dem Gesamtscore. @tab:sus-items zeigt die Mittelwerte der einzelnen SUS-Aussagen.

#figure(
  table(
    columns: (auto, 1fr, auto),
    align: (center, left, center),
    table.header([*Item*], [*Aussage (verkürzt)*], [*Mittelwert*]),
    [S1], [Würde das System gerne häufig benutzen], [4,33],
    [S2], [System unnötig komplex (invertiert)], [1,83],
    [S3], [System einfach zu benutzen], [3,67],
    [S4], [Technische Hilfe nötig (invertiert)], [1,83],
    [S5], [Funktionen gut integriert], [4,50],
    [S6], [Zu viele Inkonsistenzen (invertiert)], [1,33],
    [S7], [Schnell erlernbar], [5,00],
    [S8], [Umständlich zu nutzen (invertiert)], [1,67],
    [S9], [Sicher bei der Nutzung gefühlt], [3,83],
    [S10], [Viel lernen vor Nutzung nötig (invertiert)], [1,00],
  ),
  caption: [SUS-Item-Mittelwerte (Skala 1–5; bei invertierten Items bedeutet ein niedriger Wert ein positives Ergebnis)]
) <tab:sus-items>

Besonders hervorzuheben sind die perfekten Werte bei S7 (5,00) und S10 (1,00): Alle Teilnehmer stimmten vollständig zu, dass das System schnell erlernbar ist, und zur Benutzung kein Vorwissen nötig ist. Diese Werte korrelieren mit der Dimension Erlernbarkeit nach @ISO 9241-110 (vgl. @tab:sus_heuristiken) und bestätigen, dass die vordefinierten Formulare ohne Einarbeitungsaufwand verständlich sind. Ebenso zeigt S6 (1,33), dass Teilnehmer kaum Inkonsistenzen wahrnahmen, was die Entscheidung für den statischen @GenUI\-Ansatz mit konsistenten UI5-Fragments validiert.

Demgegenüber fällt S3 (3,67 -- "einfach zu benutzen") etwas niedriger aus. In Verbindung mit den offenen Rückmeldungen (vgl. @sec:offene-rueckmeldungen) lässt sich dies auf Sichtbarkeits- und Responsiveness-Probleme auf kleineren Bildschirmen zurückführen: Interaktive Elemente erforderten teils Scrollen und waren nicht unmittelbar sichtbar. S9 (3,83 -- "sicher bei der Nutzung gefühlt") zeigt eine leichte Unsicherheit, die sich in der HEAT-Analyse (insbesondere Item A3, vgl. @sec:heat-ergebnisse) als Unsicherheit über die korrekte Interpretation des Feedbacks durch den Agenten konkretisiert.

==== HEAT-Dimensionen <sec:heat-ergebnisse>

Die HEAT-Auswertung #cite(<verhulsdonck_incorporating_2024>, supplement: "S. 61-65") zeigt durchgehend positive Bewertungen auf Dimensionsebene. Expertise (4,61) und Trust (4,45) erreichten die höchsten Werte, Accuracy (4,06) den niedrigsten.

Die Item-Level-Betrachtung in @tab:heat-items differenziert diese Dimensionswerte und deckt einen signifikanten Ausreißer auf.

#figure(
  table(
    columns: (auto, 1fr, auto),
    align: (center, left, center),
    table.header([*Item*], [*Aussage (verkürzt)*], [*Mittelwert*]),
    [H1], [Formulare fühlten sich natürlich und passend an], [4,50],
    [H2], [Interaktion war verständlich und nachvollziehbar], [4,00],
    [H3], [Formulare waren hilfreich für Validierung], [4,50],
    [E1], [Formulare unterstützten angemessen bei Validierung], [4,50],
    [E2], [Fachliche Einschätzung vollständig ausdrückbar], [4,83],
    [E3], [Notwendige Validierungsdimensionen berücksichtigt], [4,50],
    [A1], [Feedback wurde präzise erfasst], [4,67],
    [A2], [Feedback wurde vollständig erfasst], [4,83],
    [*A3*], [*Kein Risiko für Missverständnisse*], [*2,67*],
    [T1], [Prozess war transparent und nachvollziehbar], [4,33],
    [T2], [Vertrauen in korrekte Feedback-Verarbeitung], [4,83],
    [T3], [System verhielt sich konsistent und verlässlich], [4,17],
  ),
  caption: [HEAT-Item-Mittelwerte (Skala 1–5)]
) <tab:heat-items>

*Expertise (4,61):* Die drei Expertise-Items erzielen konsistent hohe Werte zwischen 4,50 und 4,83. Item E2 (4,83) bestätigt, dass Teilnehmer ihre fachliche Einschätzung vollständig durch die vordefinierten Formulare ausdrücken konnten. Dies adressiert direkt die Hauptforschungsfrage: Die strukturierten Formulare schränken die Ausdrucksmöglichkeiten der Nutzer nicht ein, sondern ermöglichen qualitativ hochwertiges, strukturiertes Feedback.

*Trust (4,45):* T2 erreicht mit 4,83 den zweithöchsten Einzelwert insgesamt. Die Teilnehmer vertrauen darauf, dass ihr Feedback korrekt verarbeitet wird. Dies lässt sich auf das Schrittprotokoll zurückführen, das den Verarbeitungsstatus transparent macht. T3 (4,17) fällt etwas niedriger aus, da beispielsweise Buttons teilweise uneinheitliche benannt sind. Außerdem erscheinen je nach Kontext unterschiedliche Formulartype, was zwar ein beabsichtigtes Verhalten ist, die wahrgenommene Konsistenz jedoch leicht reduziert.

*Human Experience (4,33):* Diese Dimension wurde durchweg positiv bewertet, wobei H2 (4,0) der niedrigste Wert ist. Dies korreliert mit den in den offenen Rückmeldungen und Experteninterviews identifizierten Unklarheiten bei der Button-Beschriftung und -Semantik (vgl. @sec:offene-rueckmeldungen, @sec:ux-experten).

*Accuracy (4,06):* Die Accuracy-Dimension erfordert eine differenzierte Betrachtung. Während A1 (4,67) und A2 (4,83) bestätigen, dass Feedback präzise und vollständig erfasst wird, fällt A3 mit 2,67 deutlich ab. Diese Aussage ist der einzige Wert unter 3,0 im gesamten Fragebogen. Ohne A3 läge der Accuracy-Mittelwert bei 4,71 und wäre damit die höchste Dimension. Die Diskrepanz zwischen A1 beziehungsweise A2 und A3 zeigt, dass das Problem nicht in der Feedback-Erfassung, sondern in der wahrgenommenen Feedback-Interpretation liegt. Nutzer sind unsicher, ob der @KI\-Agent ihr strukturiertes Feedback korrekt interpretiert und umsetzt. Dies deutet auf eine Transparenzlücke im Pfad zwischen Feedback-Abgabe und Ergebnisanpassung hin, die beispielsweise durch eine Bestätigungs- oder Zusammenfassungsanzeige adressiert werden könnte.

==== Ergänzende Elemente

Die drei ergänzenden Usability-Dimensionen bestätigen die positiven Befunde der standardisierten Instrumente. In @tab:usability-metriken sind die Mittelwerte der Metriken zu sehen.

#figure(
  table(
    columns: (auto, 1fr, auto),
    align: (center, left, center),
    table.header([*Item*], [*Aussage (verkürzt)*], [*Mittelwert*]),
    [U1], [Jederzeit gewusst, was das System tat], [4,33],
    [U2], [Kontrolle über den Ablauf der Validierung], [4,50],
    [U3], [System reagierte schnell auf Eingaben], [4,17],
  ),
  caption: [Ergänzende Usability-Metriken (Skala 1–5)]
) <tab:usability-metriken>

U2 (4,50) erreicht den höchsten Wert und bestätigt, dass Nutzer sich im Validierungsprozess handlungsfähig fühlen. Dies validiert das @HITL\-Designprinzip: Das Tool gewährt dem Menschen tatsächliche Steuerungsmöglichkeit gemäß @ISO 9241-110 (Steuerbarkeit). U1 (4,33) korreliert mit den hohen Trust-Werten und dem Schrittprotokoll als Transparenzmechanismus, liegt jedoch nicht bei 5,0. Dies stellt einen Hinweis darauf dar, dass insbesondere während der @KI\-Verarbeitungszeiten eine feinere Fortschrittsanzeige fehlt. U3 (4,17) ist der niedrigste Wert trotz der in der @NWA priorisierten Reaktionszeit. Dies lässt sich darauf zurückführen, dass die Verarbeitungszeiten des @LLM:pl spürbare Wartezeiten verursachen, obwohl diese für generative Systeme erwartbar sind.

==== Offene Rückmeldungen <sec:offene-rueckmeldungen>

Die offenen Rückmeldungen ermöglichen eine thematische Kategorisierung jenseits der standardisierten Skalen.

*Positive Aspekte* lassen sich in zwei Cluster gruppieren: Erstens die *Prozessstruktur* -- der Ablaufplan (T1) und der konsistente Fluss ("roter Faden", T5) wurden unabhängig hervorgehoben. Zweitens die *generative Qualität* -- die Flexibilität der Bildgenerierung (T2) und deren Geschwindigkeit (T4) überzeugten. Ein Teilnehmer vergab die maximale Zufriedenheitsbewertung (T3). Beide Cluster korrespondieren mit den zentralen Designzielen: strukturierter Workflow und effektive @HITL\-Integration bei der Inhaltsgenerierung.

*Negative Aspekte* zeigen zwei wiederkehrende Muster: Das häufigste Problem betrifft *Sichtbarkeit und Responsiveness* -- vier von sechs Teilnehmern (T1, T3, T4, T5) berichteten, dass interaktive Elemente auf kleineren Bildschirmen nicht sichtbar waren oder Scrollen ohne Indikator erforderten. Das zweithäufigste Muster betrifft *Button-Semantik und -Verhalten* -- drei von sechs Teilnehmern (T1, T2, T4) nannten unklare Button-Beschriftungen, unerwartetes Verhalten (z.B. vorzeitiger Abbruch des Übersetzungsvorgangs durch "Bestätigen", T2) oder eine insgesamt zu hohe Anzahl an Buttons. Die quantitativen Befunde stützen diese Muster: Der niedrigere S3-Wert (3,67) lässt sich auf die Responsiveness-Probleme zurückführen, der HEAT-Ausreißer A3 (2,67) auf die Button-Semantik-Unklarheiten.

=== Qualitative Ergebnisse der Experteninterviews

Zur Validierung und Vertiefung der quantitativen Befunde wurden drei Experteninterviews durchgeführt. Die Auswertung orientiert sich am thematisch-vergleichenden Verfahren nach Liebold: Die Interviewaussagen wurden thematisch gruppiert und perspektivenübergreifend zusammengestellt #cite(<Liebold_2009>, supplement: "S. 51-54").

==== Perspektive des KI-Experten

Der befragte @KI\-Experte (besondere Expertise für @LLM\-Output-Evaluation) bewertete den Prototyp aus architektonischer und funktionaler Perspektive.

*Architektonische Eignung:* Die Einschränkung auf vordefinierte Formulare wurde positiv bewertet, da Nutzer so klar erkennen, welche Use Cases abgedeckt werden #cite(<interview_ki_experte>). Das Schrittprotokoll wurde als hilfreich für die Transparenz bewertet #cite(<interview_ki_experte>) und korrespondiert mit dem quantitativ hohen Trust-Wert (T2 = 4,83).

*@HITL\-Integration:* Die technische Umsetzung des Feedback-Loops wurde als gelungen bezeichnet #cite(<interview_ki_experte>). Insbesondere bestätigte der Experte die Eignung für Qualitätssicherung bei der Bildgenerierung, da hier die menschliche Validierung den größten Mehrwert gegenüber rein automatisierter Bewertung biete #cite(<interview_ki_experte>). Dies korrespondiert mit den offenen Rückmeldungen, in denen die Bildgenerierung als besonders flexibel (T2) und schnell (T4) hervorgehoben wurde.

*Limitationen und Verbesserungspotenzial:* Als Schwäche nannte der Experte die eingeschränkte Flexibilität gegenüber freien Chatbots, relativierte jedoch, dass nicht jeder Anwendungsfall einen Chat erfordere #cite(<interview_ki_experte>). Diese Einschätzung validiert die in der @NWA (Kapitel 3) getroffene Designentscheidung für den statischen @GenUI\-Ansatz, bei dem die Konsistenz und Verarbeitbarkeit des Feedbacks gegenüber maximaler Nutzerfreiheit priorisiert wurde. Als konkrete Verbesserungspotenziale nannte er ein erweitertes Kontextwissen des Agenten sowie parallele Bildgenerierung #cite(<interview_ki_experte>).

==== Perspektive der @UX\-Experten <sec:ux-experten>

Zwei @UX\-Experten bewerteten den Prototyp aus gestalterischer und interaktionsbezogener Perspektive.

*Grundsätzliche Validierung:* Beide Experten bestätigten unabhängig voneinander die Notwendigkeit menschlicher Validierung für @KI\-generierte Inhalte im aktuellen Entwicklungsstand #cite(<interview_ux_experte_1>) #cite(<interview_ux_experte_2>). Diese Bestätigung der Grundprämisse ist insofern bedeutsam, als sie die Relevanz des gesamten Ansatzes aus Praxissicht stützt.

*Workflow und Prozessdesign:* Das Schrittprotokoll wurde als deutlich hilfreicher als reine Ladeanzeigen bewertet #cite(<interview_ux_experte_1>). Der Gesamtflow wurde als gut durchdacht eingestuft #cite(<interview_ux_experte_1>), was sich mit der offenen Rückmeldung "roter Faden" (T5) deckt und die hohen Learnability-Werte (S7 = 5,0, S10 = 1,0) qualitativ erklärt.

*UI-Detailbefunde:* Beide Experten identifizierten Optimierungspotenzial auf der Ebene einzelner Interaktionselemente. Die Button-Farbsemantik folge nicht durchgängig den Fiori-Designrichtlinien #cite(<interview_ux_experte_1>). Besonders das Wording "Ablehnen" wurde als zu harsch bewertet, eine neutralere Formulierung wie "Überarbeiten" würde die Hemmschwelle senken und präziser ausdrücken, dass der Inhalt nicht verworfen, sondern angepasst wird #cite(<interview_ux_experte_1>). Dieser Befund korrespondiert direkt mit dem HEAT-Ausreißer A3 (2,67): Wenn Nutzer die semantische Konsequenz eines Buttons nicht sicher einschätzen können, entsteht das wahrgenommene Risiko für Missverständnisse. Ergänzend schlug ein Experte die bedingte Aktivierung von Buttons vor, sodass nur kontextuell relevante Aktionen angeboten werden #cite(<interview_ux_experte_2>). Dies adressiert die offene Rückmeldung von T4 ("zu viele Buttons"). Die Gesamtbewertung fiel positiv aus -- kritische Usability-Hindernisse wurden nicht identifiziert #cite(<interview_ux_experte_1>) #cite(<interview_ux_experte_2>).

=== Triangulation der Ergebnisse

Die Methodentriangulation verknüpft quantitative und qualitative Befunde entlang vier konvergierender Themen sowie einer identifizierten Divergenz.

*Erlernbarkeit und Workflow-Klarheit:* Die perfekten SUS-Werte für Erlernbarkeit (S7 = 5,0, S10 = 1,0) konvergieren mit der positiven Bewertung des Schrittprotokolls durch alle drei Experten. Der @KI\-Experte hebt dessen Transparenzfunktion hervor, @UX\-Experte 1 bewertet es als "hilfreicher als Ladeanzeigen", und in den offenen Rückmeldungen werden der "Ablaufplan" (T1) und der "rote Faden" (T5) als positive Aspekte genannt. Alle drei Datenquellen konvergieren auf dem Befund, dass das Schrittprotokoll die kognitive Last reduziert und Orientierung schafft -- es stellt einen zentralen Design-Erfolg des Prototyps dar.

*Button- und Interaktionssemantik als primäre Schwäche:* Der HEAT-Ausreißer A3 (2,67), der leicht reduzierte Confidence-Wert S9 (3,83) und der niedrigste Human-Experience-Wert H2 (4,0) bilden auf quantitativer Seite ein konsistentes Muster. Die UX-Experten konkretisieren dieses Muster qualitativ: Button-Farbsemantik, das Wording "Ablehnen" und fehlende kontextuelle Button-Aktivierung erzeugen Unsicherheit. Drei von sechs Teilnehmern bestätigen dies in den offenen Rückmeldungen (T1, T2, T4). Die Interaktionssemantik -- Beschriftung, Farbkodierung und Aktivierungslogik -- ist damit die konsistenteste Verbesserungsarea über alle drei Datenquellen hinweg.

*Responsiveness als technische Schuld:* Die quantitativen Indikatoren (U3 = 4,17 als niedrigster ergänzender Wert; S3 = 3,67 als niedrigster positiv formulierter SUS-Wert) werden durch vier von sechs offenen Rückmeldungen gestützt, die Sichtbarkeits- und Scrolling-Probleme auf kleineren Bildschirmen beschreiben. Bemerkenswert ist, dass keiner der drei Experten dieses Problem identifizierte -- vermutlich, weil die Interviews auf Vollbild-Monitoren stattfanden. Es handelt sich um ein rein technisches Issue der responsiven Darstellung, nicht um einen konzeptuellen Designfehler.

*Validierung des @HITL\-Ansatzes:* Die hohe Expertise-Dimension (4,61) belegt, dass Nutzer ihr fachliches Urteil vollständig über die strukturierten Formulare ausdrücken können. Der Trust-Spitzenwert T2 (4,83) zeigt Vertrauen in die korrekte Feedback-Verarbeitung. Qualitativ bestätigen alle drei Experten unabhängig sowohl die Notwendigkeit menschlicher Validierung als auch die Eignung der Implementierung für diesen Zweck. Diese Konvergenz liefert starke Evidenz für eine positive Beantwortung der Hauptforschungsfrage: Das System ermöglicht qualitativ hochwertiges, strukturiertes Feedback zur Qualitätssicherung generierter Inhalte.

*Divergenz:* Der @KI\-Experte nannte die eingeschränkte Flexibilität gegenüber freien Chatbots als konzeptionelle Schwäche. Die quantitativen Daten widersprechen jedoch einer praktischen Auswirkung dieser Einschränkung: SUS-Item S5 (4,50 -- "Funktionen gut integriert") und E2 (4,83 -- "fachliche Einschätzung vollständig ausdrückbar") zeigen, dass Endnutzer keine funktionale Limitation erlebten. Dies deutet auf eine Diskrepanz zwischen der konzeptionellen Wahrnehmung eines Experten und der tatsächlichen Nutzungserfahrung hin: Während aus architektonischer Perspektive die Einschränkung sichtbar ist, erfahren Nutzer im konkreten Validierungskontext keine relevante Begrenzung.

Zusammenfassend bestätigt die Methodentriangulation, dass der Prototyp eine hohe User Experience gemäß etablierter Heuristiken erreicht (Teilfrage 3). Der @SUS\-Score von 84,17 ("Excellent"), durchgehend hohe HEAT-Werte (alle Dimensionen über 4,0) und übereinstimmend positive Expertenbewertungen belegen dies. Das primäre Optimierungspotenzial liegt in der Interaktionssemantik (Button-Beschriftung, Farbkodierung, kontextuelle Aktivierung), nicht in der grundlegenden Architektur oder dem Interaktionskonzept des Feedback-Systems.
