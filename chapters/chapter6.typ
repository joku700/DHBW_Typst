#import "@preview/drafting:0.2.2": *

= Fazit

Diese Bachelorarbeit untersuchte, wie ein Feedback-Tool für einen @KI\-Agenten konzipiert werden kann, dass eine hohe @UX gewährleistet und gleichzeitig strukturiertes Feedback zur Qualitätssicherung generierter Inhalte ermöglicht. In diesem Kapitel werden die Ergebnisse zusammengefasst, Limitationen reflektiert sowie ein Ausblick gewährt.

== Zusammenfassung der Ergebnisse
Die erste Teilfrage untersuchte, welche Ansätze zur Generierung von Feedback-Formularen sich für @KI\-Agenten-gestützte Systeme eignen. In Kapitel 3 wurden vier Alternativen identifiziert und mittels einer @NWA systematisch bewertet: statisches @GenUI, deklaratives @GenUI, offenes @GenUI und chatbasierte Schnittstellen. Der statische @GenUI\-Ansatz erzielte mit 86,15 von 100 Punkten das beste Ergebnis und wurde als "sehr gut" klassifiziert. Ausschlaggebend waren die hohe Darstellungskonsistenz, vollständige Kontrolle über die Formularstruktur, geringe Betriebskosten sowie die Manipulationssicherheit gegenüber unbeabsichtigten Modellantworten. Die Sensitivitätsanalyse bestätigte die Robustheit dieses Ergebnisses gegenüber moderaten Gewichtungsänderungen.

Die zweite Teilfrage adressierte die prototypische Implementierung im Kontext des SAP Lean Catalog Agenten. Kapitel 4 dokumentiert die realisierte modulare Architektur, die auf einem _FeedbackDialogDefinitions_-Verzeichnis basiert. Sieben spezialisierte Formulartypen wurden entwickelt, die die Validierungsszenarien der Bildgenerierung und Textübersetzung abdecken. Die Integration in den bestehenden Agenten erfolgt über einen hybriden Ansatz, der _Interrupt and Resume_ und _Human-as-a-Tool_ kombiniert, sodass menschliche Validierung sowohl an vordefinierten Stellen als auch situativ eingeholt werden kann.

Die dritte Teilfrage widmete sich der @UX\-Bewertung des implementierten Prototyps. Die in Kapitel 5 durchgeführte Evaluation zeigt einen durchschnittlichen @SUS\-Score von 84,17 Punkten, was nach Brooke der Bewertung "Excellent" entspricht. Ergänzend wurde die für generative KI-Systeme konzipierte HEAT-Heuristik erhoben, deren Dimensionen Expertise (4,61/5), Trust (4,45/5), Human Experience (4,33/5) und Accuracy (4,06/5) die hohe Gebrauchstauglichkeit bestätigen. Die qualitativen Experteninterviews validierten das Grundkonzept des Feedback-Tools und identifizierten Optimierungspotenzial primär auf Ebene der Interaktionssemantik, insbesondere bei Button-Bezeichnungen und Farbgebung.

Zusammenfassend lässt sich die zentrale Forschungsfrage wie folgt beantworten: Ein Feedback-System für @KI\-Agenten kann durch den Einsatz eines statischen @GenUI\-Ansatzes mit vordefinierten, kontextspezifischen Feedback-Formularen realisiert werden, das sowohl eine hohe @UX als auch strukturiertes, qualitativ hochwertiges Feedback gewährleistet. Die Kombination aus kontrollierter Formularauswahl durch den Agenten, domänenspezifischem Formulardesign und dem @HITL\-Integrationsmuster ermöglicht es, Konsistenz und Kontrolle sicherzustellen, ohne die Komplexität und Risiken offener Generierungsansätze einzugehen.

== Limitationen und kritische Reflexion

Die vorliegende Arbeit unterliegt methodischen und kontextbezogenen Einschränkungen, die bei der Interpretation der Ergebnisse berücksichtigt werden müssen.

Die Bewertungen der Alternativen in der @NWA basieren auf wissenschaftlicher Literatur und technischen Analysen, stellen aber letztlich qualitative Einschätzungen eines einzelnen Bewerters dar. Obwohl die Punktvergabe durchgehend mit Quellen begründet wird, können subjektive Verzerrungen nicht vollständig ausgeschlossen werden. Die Sensitivitätsbetrachtung zeigt jedoch, dass das Ergebnis robust gegenüber moderaten Gewichtungsänderungen ist.

Die quantitative Evaluation mit sechs Testpersonen und drei Experteninterviews erlaubt keine statistisch belastbaren Aussagen zur Generalisierbarkeit der Ergebnisse. Die homogene Altersgruppe der Testpersonen (20-30 Jahre) schränkt die Übertragbarkeit auf andere Nutzergruppen zusätzlich ein. Allerdings zeigen Studien, dass die @SUS auch bei kleineren Stichproben verlässliche Ergebnisse liefert #cite(<Tullis_2006>, supplement: "S. 7"), weshalb der ermittelte Score als valider Indikator für die Gebrauchstauglichkeit des Prototyps gewertet werden kann. Die Ergebnisse müssten dennoch in größer angelegten Studien validiert werden.

Der Prototyp wurde spezifisch für den SAP Lean Catalog entwickelt und evaluiert. Die sieben implementierten Formulartypen decken die identifizierten Use Cases der Bildgenerierung und Textübersetzung ab, sind jedoch nicht ohne Anpassung auf andere Domänen übertragbar. Die Abhängigkeit von vordefinierten Templates bedeutet, dass neue Validierungsszenarien die Entwicklung zusätzlicher Formulare erfordern. Solche neuen Formulare können allerdings unkompliziert in das Feedback-Tool eingebunden werden.

== Ausblick

Die Ergebnisse dieser Arbeit eröffnen mehrere Anknüpfungspunkte für zukünftige Forschung und Entwicklung.

Das modulare Design des _FeedbackDialogDefinitions_-Verzeichnisses ermöglicht die einfache Integration zusätzlicher Formulare für neue Validierungsszenarien. Zukünftige Erweiterungen könnten spezialisierte Formulare für die Validierung von Katalogstrukturen, Produktbeschreibungen oder komplexeren multimodalen Inhalten umfassen. Zudem könnte der Agent durch die Integration eines spezifischen Tools die Fähigkeit erlangen, generierte Bilder selbst zu analysieren und so präzisere Feedback-Anfragen zu stellen.

Eine Langzeitstudie im produktiven Einsatz würde Erkenntnisse über die tatsächliche Akzeptanz und Effektivität des Feedback-Tools im Arbeitsalltag von Katalogadministratoren liefern, insbesondere hinsichtlich der Qualität finalisierter Kataloginhalte und der Zeitersparnis gegenüber manuellen Prozessen.

Die entwickelte Architektur und die methodischen Erkenntnisse zur Gestaltung von @HITL\-Feedback-Systemen sind prinzipiell auch auf andere Anwendungen mit @KI\-Agenten übertragbar, bei denen ähnliche Anforderungen an Konsistenz und Kontrolle bestehen.