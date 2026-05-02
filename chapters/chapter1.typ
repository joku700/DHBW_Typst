#import "@preview/drafting:0.2.2": *

= Einleitung
@KI\-Agenten entwickeln sich von reinen Assistenten zu autonomen Akteuren, die komplexe Aufgaben eigenständig planen, ausführen und validieren können #cite(<sapkota_ai_2026>, supplement: "S. 7-8"). Sie generieren nicht nur Antworten auf Anfragen, sondern erstellen multimodale Inhalte wie Texte, Bilder und Analysen #cite(<sapkota_ai_2026>, supplement: "S. 7, 24") #cite(<liang_llm-powered_2025>, supplement: "S. 1"). Diese Entwicklung verspricht erhebliche Effizienzgewinne und neue Möglichkeiten in der Zusammenarbeit zwischen Mensch und Maschine #cite(<rai_editors_2019>, supplement: "S. iii") #cite(<sapkota_ai_2026>, supplement: "S. 39").

Doch mit wachsender Autonomie entstehen neue Herausforderungen. @KI\-generierte Inhalte werden von Problemen wie Halluzinationen, faktischen Ungenauigkeiten und inkonsistenten Aussagen beeinträchtigt. Studien zeigen, dass durch die iterative Einbindung menschlichen Feedbacks, durch das sogenannte @HITL\-Prinzip, die Qualität @KI\-generierter Inhalte erheblich verbessern kann #cite(<verhulsdonck_incorporating_2024>, supplement: "S. 60") #cite(<guo_using_2024>, supplement: "S. 1") #cite(<mosqueira-rey_human---loop_2023>, supplement: "S. 3006"). Durch gezieltes Feedback können Agenten ihren Kontext präzisieren, wodurch Faktoren wie Genauigkeit, Zuverlässigkeit und Transparenz steigen #cite(<verhulsdonck_incorporating_2024>, supplement: "S. 60") #cite(<guo_using_2024>, supplement: "S. 1") #cite(<rai_editors_2019>, supplement: "S. vi"). Zudem kann @HITL durch das _Interrupt and Resume_\-Integrationsmuster zur menschlichen Validierung an vordefinierten kritischen Stellen genutzt werden #cite(<durante_agent_2024>, supplement: "S. 36") #cite(<putta_agent_2024>, supplement: "S. 5").

Aktuelle Feedbackmechanismen sind jedoch oft manuell und unflexibel #cite(<sapkota_ai_2026>, supplement: "S. 38") #cite(<hojo_generativegui_2025>, supplement: "S. 11"). Sie passen sich nicht dynamisch an verschiedene Inhaltsarten an und nutzen meist einfache Chat-Interfaces, die Benutzer zwingen, ihr Feedback selbst zu strukturieren #cite(<hojo_generativegui_2025>, supplement: "S. 1-2") #cite(<leviathan_generative_2025>). Dies führt zu unvollständigen oder mehrdeutigen Rückmeldungen, wodurch Verbesserungspotenziale nicht vollständig ausgeschöpft werden.

Hier setzt diese Arbeit an. Es wird untersucht, wie ein @KI\-Agent eigenständig strukturierte Feedback-Formulare generieren kann, die auf den jeweiligen generierten Inhalt abgestimmt sind. Dabei steht die Frage im Zentrum, wie solche Formulare gestaltet werden müssen, um durch eine hohe @UX qualitativ hochwertiges Feedback zu gewährleisten.

== Zielsetzung
Das Ziel dieser Bachelorarbeit ist die Konzeptionierung und prototypische Implementierung eines Ansatzes, der es einem generativen @KI\-Agenten ermöglicht, nach der Erstellung multimodaler Inhalte eigenständig menschliche Validierung anzufordern. Der Fokus liegt auf der Entwicklung eines Systems, das Feedback-Formulare dynamisch generiert beziehungsweise auswählt und strukturiertes Feedback für die Qualitätssicherung einholt.

Die Untersuchung erfolgt beispielhaft an einem multimodalen @KI\-Agenten des SAP Lean Catalogs, einer katalogbasierten Beschaffungslösung im SAP-Umfeld. Dieser Agent orchestriert die Generierung von Bereichsbildern und Übersetzung von Texten für Kataloge.

Die zentrale Forschungsfrage lautet:

_Wie kann ein Feedback-System für einen @KI\-Agenten konzipiert werden, das durch geeignete Gestaltungs- und Steuerungsprinzipien eine hohe @UX gewährleistet und gleichzeitig qualitativ hochwertiges, strukturiertes Feedback zur Qualitätssicherung generierter Inhalte ermöglicht?_

Aus dieser Hauptfrage ergeben sich folgende Teilfragen:

1. Welche Ansätze zur Generierung von Feedback-Formularen eignen sich für den Einsatz in @KI\-Agenten-gestützten Systemen?
2. Wie kann der gewählte Ansatz prototypisch im Kontext des SAP Lean Catalog Agenten implementiert werden?
3. Wie bewerten Benutzer die @UX des implementierten Prototyps basierend auf etablierten @UX\-Heuristiken?

== Vorgehensweise und Aufbau der Arbeit
Die Arbeit folgt einem systematischen Vorgehen, das theoretische Analyse, konzeptionelle Entwicklung und praktische Implementierung kombiniert. Sie gliedert sich in sechs Kapitel.

Zunächst werden in Kapitel 2 relevante theoretische Grundlagen erarbeitet. Dies umfasst Konzepte zu @KI\-Agenten, @GenUI, @HITL\-Systemen sowie etablierte Standards zur Bewertung von @UX und Usability. Außerdem wird die Methodik der @NWA vorgestellt, die als Entscheidungsinstrument für die Auswahl des Ansatzes dient. Diese theoretische Basis bildet das Fundament für die spätere Konzeption und Evaluation.

Kapitel 3 widmet sich der Konzeption. Zunächst wird die Ausgangssituation des Lean Catalog Agenten beschrieben. Anschließend wird durch eine @NWA systematisch ermittelt, welcher Ansatz zur Generierung von Feedback-Formularen sich für den Anwendungsfall am besten eignet.

Die prototypische Implementierung des ausgewählten Ansatzes wird in Kapitel 4 dokumentiert. Hier werden Architekturentscheidungen, technische Details und die Integration in den bestehenden Agenten erläutert.

Kapitel 5 präsentiert die Evaluation des Prototyps. Die Bewertung erfolgt anhand definierter Metriken zur technischen Funktionalität und Qualität. Ergänzend werden qualitative Experteninterviews durchgeführt, um die @UX und Usability aus Nutzersicht zu bewerten. Die Kombination quantitativer und qualitativer Methoden ermöglicht eine umfassende Beurteilung des entwickelten Ansatzes.

Kapitel 6 fasst die Arbeit zusammen, zieht Schlussfolgerungen und gibt einen Ausblick auf mögliche zukünftige Entwicklungen.


// #inline-note(text("vllt noch Satya Nadella: 'The future is agentic' einbringen"))
// #inline-note(text("vllt noch “A computer can never be held accountable, therefore a computer must never make a management decision.” – IBM Training Manual, 1979 einbringen (https://www.ibm.com/think/insights/ai-decision-making-where-do-businesses-draw-the-line)"))