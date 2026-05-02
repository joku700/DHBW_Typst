#import "@preview/drafting:0.2.2": *

= Fazit

Diese Bachelorarbeit untersuchte, wie ein Feedback-Tool für einen @KI\-Agenten konzipiert werden kann, das eine hohe @UX gewährleistet und gleichzeitig strukturiertes Feedback zur Qualitätssicherung generierter Inhalte ermöglicht. In diesem Kapitel werden die Ergebnisse zusammengefasst sowie ein Ausblick auf zukünftige Entwicklungen gewährt. Außerdem werden die Limitationen der Arbeit aufgezeigt, indem die verwendeten wissenschaftlichen Methoden kritisch reflektiert werden.

== Zusammenfassung der Ergebnisse
Insgesamt zeigt diese Arbeit, dass strukturierte Feedback-Formulare eine effektive Schnittstelle zwischen @KI\-Agenten und menschlichen Validierern darstellen können. Der entwickelte Prototyp demonstriert, dass ein statischer @GenUI\-Ansatz die Anforderungen an @UX und Qualitätssicherung erfüllen kann, ohne die Komplexität und Risiken offener Generierungsansätze einzugehen.

== Limitationen und kritische Reflexion

Die vorliegende Arbeit unterliegt methodischen und kontextbezogenen Einschränkungen, die bei der Interpretation der Ergebnisse berücksichtigt werden müssen.

Die quantitative Evaluation mit sechs Testpersonen und drei Experteninterviews erlaubt keine statistisch belastbaren Aussagen zur Generalisierbarkeit der Ergebnisse. Die homogene Altersgruppe der Testpersonen (20-30 Jahre) schränkt die Übertragbarkeit auf andere Nutzergruppen zusätzlich ein. Allerdings zeigen Studien, dass die @SUS auch bei kleineren Stichproben verlässliche Ergebnisse liefert #cite(<Tullis_2006>, supplement: "S. 7"), weshalb der ermittelte Score als valider Indikator für die Gebrauchstauglichkeit des Prototyps gewertet werden kann. Die Ergebnisse müssten dennoch in größer angelegten Studien validiert werden.

Die Bewertungen der Alternativen in der @NWA basieren teilweise auf qualitativen Einschätzungen und praktischen Erfahrungen. Obwohl die Gewichtung der Kriterien durch fünf Experten intersubjektiv abgesichert wurde, können subjektive Verzerrungen nicht vollständig ausgeschlossen werden. Die Sensitivitätsbetrachtung zeigt jedoch, dass das Ergebnis robust gegenüber moderaten Gewichtungsänderungen ist.

Der Prototyp wurde spezifisch für den SAP Lean Catalog entwickelt und evaluiert. Die sieben implementierten Formulartypen decken die identifizierten Use Cases der Bildgenerierung und Textübersetzung ab, sind jedoch nicht ohne Anpassung auf andere Domänen übertragbar. Die Abhängigkeit von vordefinierten Templates bedeutet, dass neue Validierungsszenarien die Entwicklung zusätzlicher Formulare erfordern. Solche neuen Formulare können allerdings unkompliziert in das Feedback-Tool eingebunden werden.

== Ausblick

Die Ergebnisse dieser Arbeit eröffnen mehrere Anknüpfungspunkte für zukünftige Forschung und Entwicklung.

Das modulare Design des FeedbackDialogDefinitions-Verzeichnisses ermöglicht die einfache Integration zusätzlicher Formulare für neue Validierungsszenarien. Zukünftige Erweiterungen könnten spezialisierte Formulare für die Validierung von Katalogstrukturen, Produktbeschreibungen oder komplexeren multimodalen Inhalten umfassen. Zudem könnte der Agent durch die Integration eines spezifischen Tools die Fähigkeit erlangen, generierte Bilder selbst zu analysieren und so präzisere Feedback-Anfragen zu stellen. 

Eine Langzeitstudie im produktiven Einsatz würde zudem Erkenntnisse über die tatsächliche Akzeptanz und Effektivität des Feedback-Tools im Arbeitsalltag von Katalogadministratoren liefern. Insbesondere die Auswirkungen auf die Qualität der finalisierten Kataloginhalte und die Zeitersparnis gegenüber manuellen Prozessen wären relevante Untersuchungsgegenstände.

Die entwickelte Architektur und die methodischen Erkenntnisse zur Gestaltung von @HITL\-Feedback-Systemen sind prinzipiell aber auch auf andere Anwendungen mit @KI\-Agenten übertragbar. Zukünftige Arbeiten könnten untersuchen, inwieweit der statische @GenUI\-Ansatz auch in solchen Systemen mit ähnlichen Anforderungen an Konsistenz und Kontrolle geeignet ist.