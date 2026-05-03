#import "@preview/drafting:0.2.2": *
#import "../template.typ": caption_with_source

= Theoretische Grundlagen
Im folgenden Kapitel werden die grundlegenden Begriffe und Technologien, die zum Verständnis dieser Bachelorarbeit relevant sind, erläutert.

== Grundlagen von KI
@KI beschreibt die Fähigkeit einer Maschine, kognitive Funktionen durchzuführen, die für gewöhnlich mit menschlichem Verstand assoziiert werden. Dies umfasst beispielsweise logisches Denken, Lernen, Entscheidungsfindung und Kreativität #cite(<rai_editors_2019>, supplement: "S. iii"). Frühe @KI\-Modelle basierten auf symbolischen, regelbasierten Systemen, wodurch sie wenig anpassungsfähig waren und nur spezifische Aufgaben in strukturierten Domänen lösen konnten #cite(<sapkota_ai_2026>, supplement: "S. 1").

@ML stellt einen paradigmatischen Wandel im Kontext von @KI dar. Statt explizit programmierter Regeln lernen @ML\-Modelle funktionale Abbildungen $f: X arrow Y$ durch iterative Optimierung von Modellparametern anhand empirischer Daten. Die Zielfunktion wird dabei approximiert, indem der Verlust $cal(L)(f(X), Y)$ zwischen Vorhersagen und tatsächlichen Ausgaben minimiert wird #cite(<Kufel_2023>, supplement: "S. 1-2"). Bei @ML wird zwischen den folgenden Lernparadigmen unterschieden #cite(<Kufel_2023>, supplement: "S. 4, 15").
- *Überwachtes Lernen*
Ein Modell lernt anhand von gekennzeichneten Daten $(x_i, y_i)$ eine Funktion, die Eingaben $x$ auf Ausgaben $y$ abbildet #cite(<Kufel_2023>, supplement: "S. 2, 4")
- *Unüberwachtes Lernen*
Ein Modell erkennt latente Strukturen oder Repräsentationen in ungekennzeichneten Daten ohne vorgegebene Zielvariablen #cite(<Kufel_2023>, supplement: "S. 2, 4")
- *Bestärkendes Lernen*
Ein Agent lernt durch Interaktion mit einer Umgebung eine Policy $pi(a|s)$, die die erwartete kumulative Belohnung maximiert #cite(<Kufel_2023>, supplement: "S. 2, 15")

=== Generative Aktionen
Der Begriff @GenAI beschreibt die autonome Generierung von Inhalten durch @KI\-Modelle. Traditionelle @KI\-Systeme werden primär zur Klassifikation oder Vorhersage eingesetzt. @GenAI\-Modelle sind hingegen darauf spezialisiert, neue Inhalte zu erstellen, die den Merkmalen ihrer Trainingsdaten ähneln #cite(<krakowski_human-ai_2025>). Sie basieren auf neuronalen Netzwerken, die Muster und Strukturen aus großen Datenmengen erlernt haben #cite(<krakowski_human-ai_2025>).

Es gibt verschiedene Ausprägungen von @GenAI, die jeweils auf die Erstellung von konkreten Medientypen spezialisiert sind. @LLM:pl stellen eine der prominentesten Ausprägungen dar. Sie können natürlichsprachliche Eingaben verstehen und eigenständig textuelle Antworten generieren. Dadurch sind @LLM:pl in der Lage, vielfältige Aufgaben zu bewältigen, wie das Schreiben von Programmcode, das Übersetzen von Texten oder das Beantworten komplexer Fragen #cite(<liang_llm-powered_2025>).

@T2I\-Modelle generieren Bilder aus natürlichsprachlichen Beschreibungen. Sie werden auf umfangreichen Datensätzen aus Bild-Text-Paaren trainiert und lernen, semantische Konzepte aus der Sprache in visuelle Merkmale zu übersetzen #cite(<Enjellina_2023>, supplement: "S. 54"). Moderne @T2I\-Modelle basieren häufig auf Diffusionsarchitekturen, die Bilder schrittweise aus Rauschen generieren #cite(<Rombach_2022>, supplement: "S. 10685-10686").

=== KI-Agenten
Agenten sind autonome Einheiten, die ihre Umgebung wahrnehmen und Handlungen ausführen können, um definierte Ziele zu erreichen #cite(<liang_llm-powered_2025>, supplement: "S. 1"). Traditionelle Agenten basieren auf vordefinierten Regeln oder bestärkendem Lernen #cite(<VANMELLE1978313>) #cite(<Gronauer_Diepold_2022>). Dadurch sind sie nur in strukturierten Umgebungen effektiv und auf konkrete Aufgaben spezialisiert #cite(<liang_llm-powered_2025>, supplement: "S. 1").

Durch Skalierung von Modellgröße und Trainingsdaten zeigen @LLM:pl emergente Fähigkeiten wie mehrstufiges logisches Schlussfolgern. Insbesondere @CoT\-Prompting ermöglicht es @LLM:pl, komplexe Probleme in mehrere Reasoning-Phasen zu zerlegen, Zwischenergebnisse zu evaluieren und deren Ableitungsschritte explizit zu formulieren #cite(<sapkota_ai_2026>, supplement: "S. 19") #cite(<Li_2024>). Diese Reasoning-Fähigkeiten erlauben es @LLM:pl, über ihre typischen Einsatzfälle hinauszugehen und die Rolle von dynamischen Agenten einzunehmen #cite(<putta_agent_2024>, supplement: "S. 1"). @LLM\-basierte Agenten treffen Entscheidungen flexibel und adaptiv und können sich an neue unbekannte Aufgaben anpassen #cite(<liang_llm-powered_2025>, supplement: "S. 2-3"). Außerdem können sie mit unstrukturierten Daten wie menschlicher Sprache umgehen, wodurch unter Anderem die Mensch-@KI\-Kollaboration erheblich erhöht wird #cite(<liang_llm-powered_2025>, supplement: "S. 3").

Zusätzlich zu den Funktionalitäten von gewöhnlichen @LLM:pl haben @LLM\-basierte @KI\-Agenten Zugriff auf Speicher und können sogenannte Tools aufrufen #cite(<Yang_2025>, supplement: "S. 5"). Tools sind externe Funktionen, zu denen Agenten Schnittstellen erhalten. Agenten können diese Tools beispielsweise nutzen, um externes Wissen abzufragen oder gewisse Aufgaben auszulagern. Dabei entscheiden Agenten selbst, wann sie welches Tool aufrufen #cite(<Schick_2023>, supplement: "S. 1"). Mithilfe von systematischen Toolaufrufen können Funktionalität und Antwortqualität eines Agenten erheblich verbessert werden #cite(<Yang_2025>, supplement: "S. 5").

Anstatt eine Aufgabe an einen monolithischen Agenten zu vergeben, kann diese in modulare Teilaufgaben zerlegt werden, die von mehreren spezialisierten Agenten übernommen werden #cite(<He_2025>, supplement: "S. 2"). Systeme mit mehreren kollaborierenden Agenten werden als @MAS bezeichnet #cite(<Li_2024>, supplement: "S. 3"). In @MAS können Agenten beispielsweise verschiedene Rollen (z.B. Planer und Prüfer) zugewiesen werden, wodurch das Ergebnis des Gesamtprozesses automatisch validiert und verfeinert werden kann #cite(<guo_using_2024>, supplement: "S. 4"). Außerdem können Teilaufgaben parallel bearbeitet werden und bei neuen Anforderungen zusätzliche Agenten in das System integriert werden #cite(<guo_using_2024>, supplement: "S. 4") #cite(<He_2025>, supplement: "S. 2"). Somit bietet der Einsatz mehrerer kooperierender @KI\-Agenten eine erhöhte Qualität der Ergebnisse sowie eine höhere Flexibilität.

Agentic AI ist seit 2023 die nächste Entwicklung im @MAS\-Bereich #cite(<sapkota_ai_2026>, supplement: "S. 2"). Dabei werden @LLM\-basierte Meta-Agenten als Koordinatioren beziehungsweise Organisatoren von spezialisierten @KI\-Agenten eingesetzt. Agentic AI-Systeme können komplexe Aufgaben eigenständig in Teilaufgaben zerlegen und an Sub-Agenten delegieren. Ergebnisse werden anschließend oft iterativ durch Kontrollen des Meta-Agenten evaluiert und verbessert. So können Systeme adäquat auf Unsicherheiten oder Fehler reagieren #cite(<sapkota_ai_2026>, supplement: "S. 2, 12-13").

== Generatives UI
Der Begriff @GenUI beschreibt @UI:pl, die dynamisch zur Laufzeit von @KI generiert oder gesteuert werden #cite(<leviathan_generative_2025>). Im Gegensatz zu traditionellen Benutzeroberflächen, die zur Entwicklungszeit fest definiert werden, passt sich @GenUI an den spezifischen Kontext, die Bedürfnisse und die Absichten des Nutzers an #cite(<Lee_2025>, supplement: "S. 490"). Lee definiert @GenUI als iterativen Co-Creation-Prozess zwischen Mensch und @KI, bei dem die Oberfläche als Kommunikationsmedium zwischen beiden Parteien fungiert #cite(<Lee_2025>, supplement: "S. 491").

Die verschiedenen @GenUI\-Ansätze unterscheiden sich primär im Grad der Autonomie, den die @KI bei der Gestaltung der Oberfläche erhält #cite(<copilotkit_2026>). Die Ansätze lassen sich auf einem Spektrum zwischen maximaler Kontrolle und maximaler Flexibilität einordnen #cite(<google_a2ui_2025>). Diese Kategorisierung stammt primär aus der Industrie, insbesondere von Google #cite(<google_a2ui_2025>) und Open-Source-Frameworks wie CopilotKit #cite(<copilotkit_2026>), die zwischen statischen, deklarativen und offenen Ansätzen unterscheiden. Die akademische Forschung fokussiert sich hingegen stärker auf paradigmatische Unterschiede zur klassischen Mensch-Computer-Interaktion und ordnet @GenUI als Verschiebung von Kontrolle und Handlungsfähigkeit hin zu ko-kreativen Systemen ein #cite(<Lee_2025>, supplement: "S. 491-492") #cite(<Okopnyi_2024>, supplement: "S. 1-2").

Für diese Arbeit ist diese Unterscheidung zentral, da die Auswahl des Ansatzes direkten Einfluss auf die @UX, Sicherheit, Wartbarkeit und Skalierbarkeit des Feedback-Tools hat. Die Ansätze werden im Folgenden erläutert:

=== Statisches Generatives UI
Statisches @GenUI ist die restriktivste Variante #cite(<Deshmukh_2026>). Hierbei wählt die @KI das @UI aus einem vordefinierten Katalog von @UI\-Komponenten aus #cite(<copilotkit_2026>). #cite(<leviathan_generative_2025>, form: "prose") bezeichnen diesen Ansatz als _Templated UI_, bei dem die @KI vordefinierte, interaktive Widgets aus einer festen Bibliothek aufruft und befüllt. Über jede Vorlage liegen der @KI Metadaten vor, wie beispielsweise eine Beschreibung des Aussehens und des konkreten Anwendungsfalls. Im Anschluss befüllt die @KI die Vorlage mit den entsprechenden Daten #cite(<copilotkit_2026>). Bei dieser Lösung bleibt die gesamte Kontrolle über Styling und Interaktionslogik bei menschlichen Entwicklern, wodurch visuelle Konsistenz und die Einhaltung der Markenidentität gewährleistet werden #cite(<Deshmukh_2026>).

=== Deklaratives Generatives UI
Bei deklarativem @GenUI erhält die @KI direkte Kontrolle über Elemente auf dem @UI #cite(<Deshmukh_2026>). Die @KI generiert eigenständig eine strukturierte @UI\-Spezifikation, typischerweise als @JSON\-Dokument #cite(<copilotkit_2026>). Die Host-Anwendung empfängt diese strukturierte Beschreibung und rendert sie nach vordefinierten Styling- und Interaktionsregeln #cite(<Deshmukh_2026>). So können situationsspezifische @UI:pl generiert werden, die trotzdem native Barrierefreiheitsfunktionen und das Styling einer Anwendung bzw. eines @UI\-Frameworks erben #cite(<copilotkit_2026>). Deklarative Formate bieten zudem Sicherheitsvorteile, da sie das Risiko willkürlicher Code-Ausführung im Vergleich zu generativem HTML-Code minimieren #cite(<google_a2ui_2025>). Gleichzeitig bleibt der Ansatz plattformunabhängig, da die generierten @JSON\-Strukturen prinzipiell von allen @UI\-Frameworks interpretiert werden können #cite(<Deshmukh_2026>).

=== Offenes Generatives UI
Offenes @GenUI stellt die flexibelste Variante dar #cite(<Deshmukh_2026>). Die @KI generiert vollständigen, funktionsfähigen Code (HTML, CSS und JavaScript) in Echtzeit für beliebige Prompts #cite(<leviathan_generative_2025>). Empirische Studien von Google zeigen, dass so von @KI\-generierte Benutzeroberflächen eine hohe Qualität erreichen können #cite(<leviathan_generative_2025>). Im Vergleich zu, von menschlichen Experten entwickelten Websites, erreichte die @KI\-Lösung schon in 44 % der Fälle eine vergleichbare Qualität #cite(<leviathan_generative_2025>). Ergänzend zeigen #cite(<hojo_generativegui_2025>, form: "prose") in einer Studie zu dynamischer GUI-Generierung, dass solche Ansätze die kognitive Belastung und den Zeitaufwand für Nutzer bei komplexen Interaktionen signifikant reduzieren können. Die Qualität der generierten @UI:pl variiert jedoch stark mit der Modellgröße. Moderne Modelle erreichten in einer Studie von Google 0 % Output-Fehler, während kleinere Modelle Fehlerraten von bis zu 29 % aufwiesen #cite(<leviathan_generative_2025>).


Offenes @GenUI ermöglicht theoretisch unbegrenzte kreative Freiheit und kann jede erdenkliche Interaktion realisieren #cite(<Deshmukh_2026>). Die Generierungsgeschwindigkeit stellt allerdings eine primäre Limitation dar, komplexe Interfaces können ein bis zwei Minuten Ladezeit benötigen #cite(<leviathan_generative_2025>). Außerdem können Fehler im generierten Code und inhaltliche Ungenauigkeiten auftreten #cite(<leviathan_generative_2025>) #cite(<hojo_generativegui_2025>, supplement: "S. 8"). Zusätzlich verursacht die vollständige Neugenerierung bei jeder Interaktion erhebliche Betriebskosten, da die Generierung strukturiertes Codes deutlich mehr Token verbrauchen als einfacher Text #cite(<google_a2ui_2025>). Kritiker wie #cite(<Okopnyi_2024>, form: "prose") warnen zudem vor der Verletzung etablierter Designprinzipien, insbesondere hinsichtlich Konsistenz und der Gefahr von kognitiver Überlastung durch sich ständig ändernde Oberflächen.

Zudem wird offenes @GenUI im Bezug auf Sicherheit als kritisch risikoreich eingestuft #cite(<google_a2ui_2025>). Da beliebiger Code ausgeführt wird, entstehen potenzielle Angriffsvektoren für Code-Injection (das Einschleusen von Schadcode in eine Anwendung #cite(<Ray_2012>)) #cite(<Deshmukh_2026>) #cite(<hojo_generativegui_2025>, supplement: "S. 8"). Die generierten @UI:pl müssen also vom restlichen System isoliert und spezifisch überwacht werden #cite(<google_a2ui_2025>) #cite(<leviathan_generative_2025>).

=== Chat-basierte Schnittstellen
Chat-basierte Schnittstellen mit Markdown-Formatierung stellen den aktuellen De-facto-Standard für die Interaktion mit @LLM:pl dar #cite(<leviathan_generative_2025>). Sie bieten eine textuelle Konversationsschnittstelle, bei der Nutzer Anfragen in natürlicher Sprache stellen und das Modell mit formatierten Textantworten reagiert.

Allerdings sind solche statischen Texte im Vergleich zu visuellen @UI:pl für menschliche Nutzer deutlich schwieriger zu erfassen und zu verarbeiten, insbesondere wenn die Textblöcke sehr lang sind #cite(<leviathan_generative_2025>). #cite(<hojo_generativegui_2025>, form: "prose") bezeichnen dieses Problem als "Wall of Text" und zeigen, dass Nutzer komplexe Anforderungen selbst in Textprompts strukturieren müssen, was zu Fehlern führen kann. Zusätzlich bleiben kritische Aktionen wie Tool-Aufrufe und Ausführungsfortschritt oft hinter Chat-Nachrichten verborgen, was zu mangelnder Transparenz und vermindertem Nutzervertrauen führen kann #cite(<copilotkit_2026>).

== SAP Consulting Solution Lean Catalog

SAP Lean Catalog ist eine katalogbasierte Beschaffungslösung für indirekte Güter. Der Begriff indirekte Güter umfasst Produkte und Leistungen, die nicht zu den Primärprozessen eines Unternehmens gehören, wie etwa Büromaterial, IT-Equipment oder Wartungsleistungen #cite(<VanWeele_2017>, supplement: "S. 546"). Der Lean Catalog umfasst das Lean Catalog Search Interface und den @CatMan. Mit dem Search Interface können Endnutzer Produkte suchen und bestellen. Der @CatMan wird von Administratoren zum Anlegen und Bearbeiten von Katalogen verwendet.

Ein Katalog im Kontext des Lean Catalogs besteht aus verschiedenen Bereichen, die wiederum Unterbereiche haben können. Bereiche besitzen Titel und können von formatierten Detailtexten beschrieben werden. Außerdem können Bilder für Bereiche angelegt werden. Produkte sind einzelnen Bereichen zugeordnet und haben diverse beschreibende Texte und Bilder. In @img:example_catalog ist ein Screenshot des klassischen @UI:pl des @CatMan in SAP @GUI zu sehen. Dabei ist auf der linken Seite die Bereichsstruktur des Katalogs _Human In The Loop Test Catalog_ zu sehen. Auf der rechten Seite sind die Produkte des Bereichs _Kabel_ zu sehen, der wiederum in dem Bereich _Zubehör_ liegt.

#figure(
  caption: [Struktur eines Beispielkatalogs],
  image("../assets/Screenshots/CatMan.png"),
) <img:example_catalog>

Für den Lean Catalog soll @KI zunächst für die Generierung von Bereichsbildern sowie bei der Übersetzung von Texten eingesetzt werden, da die manuelle Pflege dieser Inhalte einige Probleme mit sich bringt. Der Aufwand für die Auswahl passender Bereichsbilder, beispielsweise aus Stock-Footage-Bibliotheken, ist enorm, wobei die Qualität der Bilder teilweise schlecht und sehr inkonsistent ist. Eigene Aufnahmen würden die Qualität sicherstellen, erforderten jedoch einen erheblichen Mehraufwand. Der Aufwand für manuelle Übersetzungen wäre ebenfalls enorm. Zusätzlich müsste man sowohl innerhalb einer Sprache als auch sprachübergreifend konsistent gute Qualität gewährleisten, was ebenfalls sehr aufwändig wäre. Außerdem würde man Experten mit Sprachkenntnissen für alle gewünschten Sprachen benötigen, was Personalkosten extrem erhöhen würde.

@KI\-Agenten können den Aufwand für die Pflege dieser Inhalte stark verringern. Es können beispielsweise mehrere Inhalte gleichzeitig generiert beziehungsweise übersetzt werden. Die Qualität der Inhalte kann durch den Agenten selbst sowie durch menschliche Validierung mittels @HITL\-Prozessen sichergestellt werden.

Allgemein unterstützen passende Bereichsbilder bzw. übersetzte Texte Nutzer bei der Navigation durch Anwendungen. Zudem sind sie für eine gute @UX ausschlaggebend. Sie unterstützen unter anderem die nachfolgenden @UI\-/ @UX\-Heuristiken, die zusammen mit @UX selbst in @sec:ux genauer erläutert werden. Diese Heuristiken sind unter anderem Selbstbeschreibungsfähigkeit und Individualisierbarkeit nach @ISO 9241-110 sowie ästhetisches und minimalistisches Design nach Nielsen #cite(<nielsen_molich_1990>) #cite(<Prümper_1993>). Auch für Accessibility sind sie essenziell, hier erfüllen sie beispielsweise das Prinzip der Verständlichkeit.

Langfristig soll der @KI\-Agent basierend auf Daten im SAP System eigenständig komplette Kataloge verwalten können. Dabei stellen menschliche Mitarbeiter nur noch eine Kontrollinstanz dar. Die operativen Aufgaben sollen vollständig von der @KI übernommen werden. So wird die zeitliche und monetäre Effizienz erheblich gesteigert.

== Human in the Loop
Der Begriff @HITL beschreibt ein Paradigma, bei dem Menschen aktiv in automatisierte Prozesse eingebunden werden, um Entscheidungen zu treffen, Ergebnisse zu validieren oder Feedback zu geben #cite(<mosqueira-rey_human---loop_2023>, supplement: "S. 3006") #cite(<verhulsdonck_incorporating_2024>, supplement: "S. 62").
In @KI\-Agenten-Systemen wird @HITL eingesetzt, um autonome Entscheidungen abzusichern, da Agenten teilweise komplex und unvorhersehbar agieren können #cite(<sapkota_ai_2026>, supplement: "S. 29"). Menschliche Intervention an kritischen Punkten stellt sicher, dass Ergebnisse den Anforderungen entsprechen und unerwünschte Aktionen verhindert werden. Besonders bei der Generierung von Inhalten ist @HITL als Kontrollinstanz wichtig, da Agenten zu Halluzinationen, faktischen Fehlern oder unangemessenen Ausgaben neigen können #cite(<sapkota_ai_2026>, supplement: "S. 20"). Außerdem erhöhen @HITL\-Prozesse das Vertrauen in @KI\-Systeme, da Aussagen und Inhalte überprüft und mit Fakten abgeglichen werden #cite(<verhulsdonck_incorporating_2024>, supplement: "S. 61, 63"). Zudem ermöglichen sie kontinuierliches Lernen, da menschliches Feedback genutzt werden kann, um Modelle zu verbessern #cite(<durante_agent_2024>, supplement: "S. 6") #cite(<mosqueira-rey_human---loop_2023>, supplement: "S. 3040").

=== Herausforderungen bei KI-generierten Inhalten

Die Automatisierung von Prozessen durch @KI\-Agenten birgt erhebliche Risiken. Beispielsweise neigen @KI\-Modelle zu Halluzinationen und können faktisch inkorrekte oder kontextuell unpassende Inhalte generieren #cite(<sapkota_ai_2026>, supplement: "S. 20").

Die Qualität @KI\-generierter Inhalte korreliert mit der Modellgröße nach mathematischen Skalierungsgesetzen #cite(<kaplan_scaling_2020>). Während Modelle mit 6 Milliarden Parametern bei der dreistelligen Addition lediglich eine Genauigkeit von 1 % aufweisen, steigt dieser Wert bei 175-Milliarden-Parameter-Modellen auf 80 % an #cite(<wei_emergent_2022>). Auch Halluzinationsraten variieren erheblich. Bei wissensintensiven Aufgaben enthielten 59,8 % der ChatGPT-Antworten mindestens eine faktische Halluzination #cite(<mishra_fine-grained_2024>).
Insbesondere @T2I\-Modelle können durch ihre Trainingsdaten gesellschaftliche Vorurteile bilden und haben teilweise Schwierigkeiten, einen konsistenten visuellen Stil über mehrere Generierungen aufrechtzuerhalten #cite(<Enjellina_2023>, supplement: "S. 60-61").

Die Konsequenzen fehlerhafter @KI\-generierter Inhalte in Produktivsystemen können erheblich sein. Dokumentierte Fälle zeigen rechtliche und finanzielle Schäden durch Chatbots, die nicht-existente Unternehmensrichtlinien erfanden #cite(<verhulsdonck_incorporating_2024>, supplement: "S. 61"), sowie systematische Diskriminierung durch @KI\-Systeme ohne menschliche Aufsicht #cite(<den_hond_useful_2023>, supplement: "S. 93"). Auch bei der Generierung von Referenzen und Zitaten produzieren @LLM:pl Halluzinationen mit teils schwerwiegenden Folgen, wie dokumentierte Fälle von erfundenen Gerichtsurteilen und wissenschaftlichen Quellen zeigen #cite(<Boonsanong_2025>).

Studien belegen zudem, dass menschliche Experten qualitativ deutlich hochwertigeres Feedback liefern als @KI\-Systeme alleine. Die Zustimmungsraten betragen 88 % bei menschlichem Feedback gegenüber nur 59 % bei @KI\-generiertem Feedback #cite(<guo_using_2024>). Dies unterstreicht die Notwendigkeit eines systematischen @HITL\-Ansatzes für den Lean Catalog, bei dem Administratoren generierte Inhalte prüfen, korrigieren und freigeben können, bevor diese für Endnutzer sichtbar werden.

=== Integrationsmuster
Die Integration von @HITL in @KI\-Systeme kann auf verschiedene Weisen erfolgen. Die beiden grundlegenden Muster "Interrupt and Resume" und "Human-as-a-Tool" haben sich etabliert #cite(<durante_agent_2024>, supplement: "S. 36") #cite(<putta_agent_2024>, supplement: "S. 5").

==== Interrupt and Resume
Bei diesem Muster wird der Arbeitsablauf des Agenten an vordefinierten Punkten unterbrochen. Das System pausiert automatisch und fordert menschliche Bestätigung oder Input an, bevor es fortfährt #cite(<durante_agent_2024>, supplement: "S. 35-36").

Typische Anwendungsfälle sind Situationen, in denen irreversible oder kritische Aktionen durchgeführt werden sollen. Beispiele sind das Löschen von Daten oder das Versenden von Nachrichten an externe Empfänger #cite(<durante_agent_2024>, supplement: "S. 36"). Der Agent stoppt vor der Ausführung und wartet auf explizite Freigabe. So werden hohe Sicherheit und Kontrolle sichergestellt #cite(<sapkota_ai_2026>, supplement: "S. 38").
Ein Mensch muss bewusst entscheiden, ob eine Aktion ausgeführt werden soll oder nicht.

==== Human-as-a-Tool
Bei diesem Muster entscheidet der Agent eigenständig, wann er menschliche Hilfe benötigt #cite(<putta_agent_2024>, supplement: "S. 5"). Der Mensch wird als eine Art Werkzeug betrachtet, das der Agent bei Bedarf aufrufen kann. Die Entscheidung basiert oft auf Konfidenzbewertungen oder der Erkennung schwieriger Situationen #cite(<putta_agent_2024>, supplement: "S. 5").

Der Agent analysiert kontinuierlich seine eigene Leistung und Unsicherheit. Wenn die Konfidenz unter einen Schwellenwert fällt oder eine Aufgabe als zu komplex eingeschätzt wird, fordert der Agent aktiv menschlichen Input an. Dies geschieht dynamisch und kontextabhängig #cite(<putta_agent_2024>, supplement: "S. 5").

Dieses Muster ermöglicht flexiblere und effizientere Zusammenarbeit. Menschliche Intervention erfolgt nur dann, wenn sie tatsächlich benötigt wird #cite(<mosqueira-rey_human---loop_2023>, supplement: "S. 3040"). Dies reduziert unnötige Unterbrechungen und ermöglicht es dem Agenten, bei einfachen Aufgaben vollständig autonom zu arbeiten. Gleichzeitig stellt es sicher, dass bei komplexen oder unsicheren Situationen menschliche Expertise eingebunden wird #cite(<durante_agent_2024>, supplement: "S. 36").

== User Experience <sec:ux>
@UX umfasst alle Aspekte der Interaktion zwischen menschlichen Nutzern und digitalen Systemen. Dazu gehören Wahrnehmungen, Emotionen und Reaktionen vor, während und nach der Nutzung #cite(<Bevan_Carter_Harker_2015>, supplement: "S. 145"). Der Begriff geht über die reine Gebrauchstauglichkeit (Usability) hinaus. Usability beschreibt die Effektivität, Effizienz und Zufriedenheit bei der Zielerreichung im jeweiligen konkreten Nutzungskontext #cite(<Bevan_Carter_Harker_2015>, supplement: "S. 144").

Eine positive @UX entsteht durch die Erfüllung von Nutzerbedürfnissen und -erwartungen. Dazu gehören hohe Usability und ansprechende Gestaltung. Im Kontext von @KI\-gestützten Systemen sind @UX und Usability besonders relevant, da solche Systeme komplex und unvorhersehbar sind #cite(<sapkota_ai_2026>, supplement: "S. 29"). Trotz dieser Faktoren müssen die Entscheidungen der @KI sowie die Abläufe in den Gesamtsystemen nachvollziehbar bleiben. Gleiches gilt für die Kontrollierbarkeit autonomer Prozesse und die Transparenz von Systemzuständen #cite(<krakowski_human-ai_2025>). Diese Faktoren bestimmen die Akzeptanz und erfolgreiche Nutzung @KI\-gestützter Systeme.

Die folgenden Abschnitte erläutern etablierte Standards zur Bewertung und Gestaltung von Usability und @UX. Zusätzlich wird ein speziell für @GenAI entwickelter Bewertungsansatz vorgestellt.

=== ISO 9241-110
Die @ISO 9241-110 ist ein internationaler Standard für die Dialoggestaltung interaktiver Systeme #cite(<Prümper_1993>, supplement: "S. 147"). Sie definiert sieben zentrale Prinzipien für die gebrauchstaugliche Gestaltung von Benutzerschnittstellen:

+ *Aufgabenangemessenheit*: Das System unterstützt Benutzer effektiv und effizient. Es erfordert keine unnötigen Schritte.
+ *Selbstbeschreibungsfähigkeit*: Jeder Dialogschritt ist durch Rückmeldungen unmittelbar verständlich. Benutzer wissen jederzeit, wo sie sich befinden.
+ *Erwartungskonformität*: Das System verhält sich konsistent. Es entspricht Konventionen und Erwartungen der Benutzer.
+ *Lernförderlichkeit*: Das System unterstützt das Erlernen seiner Funktionen. Dies geschieht durch nachvollziehbare Strukturen und hilfreiche Anleitungen.
+ *Steuerbarkeit*: Benutzer können Geschwindigkeit und Reihenfolge des Dialogs beeinflussen. Sie haben die Kontrolle über das System.
+ *Fehlertoleranz*: Das System erkennt Fehler frühzeitig. Es verhindert sie nach Möglichkeit oder ermöglicht einfache Korrekturen.
+ *Individualisierbarkeit*: Das System lässt sich an individuelle Bedürfnisse und Fähigkeiten anpassen.

Diese Grundsätze bilden eine Basis für die Gestaltung von Benutzeroberflächen. Die Dialoggrundsätze der @ISO 9241-110 werden auch als Grundlage für die Messung der Softwarequalität moderner Systeme herangezogen #cite(<Bevan_2016>, supplement: "S. 275"). Im Kontext von @KI\-generierten Inhalten sind sie besonders relevant. Hier stellen Nachvollziehbarkeit und Kontrollierbarkeit der Systemausgaben zentrale Herausforderungen dar #cite(<sapkota_ai_2026>, supplement: "S. 29") #cite(<mosqueira-rey_human---loop_2023>, supplement: "S. 3040").

=== Usability-Heuristiken nach Nielsen
Die Usability-Heuristiken nach Jakob Nielsen sind zehn Prinzipien für benutzerfreundliche Oberflächen. Sie dienen als Leitlinien für die Evaluation und das Design interaktiver Systeme #cite(<nielsen_1994>):

+ *Sichtbarkeit des Systemstatus*: Das System informiert Benutzer durch angemessenes Feedback darüber, was gerade geschieht.
+ *Übereinstimmung zwischen System und realer Welt*: Das System spricht die Sprache der Benutzer. Es verwendet vertraute Begriffe und Konzepte.
+ *Benutzerkontrolle und Freiheit*: Benutzer können Aktionen rückgängig machen oder wiederholen. Sie haben eine klar gekennzeichnete Möglichkeit, ungewollte Zustände zu verlassen.
+ *Konsistenz und Standards*: Das System verwendet einheitliche Begriffe und Aktionen. Es befolgt Plattform- und Industriekonventionen.
+ *Fehlervermeidung*: Sorgfältiges Design verhindert Probleme von vornherein.
+ *Wiedererkennung statt Erinnerung*: Objekte, Aktionen und Optionen sind sichtbar. Benutzer müssen sich nicht an Informationen aus vorherigen Schritten erinnern.
+ *Flexibilität und Effizienz*: Abkürzungen beschleunigen die Interaktion für erfahrene Benutzer. Das System bedient sowohl unerfahrene als auch erfahrene Benutzer.
+ *Ästhetisches und minimalistisches Design*: Dialoge enthalten keine irrelevanten Informationen. Diese könnten relevante Informationen überdecken.
+ *Hilfe beim Erkennen, Diagnostizieren und Beheben von Fehlern*: Fehlermeldungen sind in einfacher Sprache formuliert. Sie beschreiben das Problem präzise und schlagen eine Lösung vor.
+ *Hilfe und Dokumentation*: Wenn nötig, steht Hilfe und Dokumentation zur Verfügung. Diese ist leicht durchsuchbar und aufgabenbezogen.

Da @GenAI\-Systeme in der Regel nicht-deterministische Inhalte generieren, sind in diesem Kontext insbesondere Konsistenz und Standards (4) abzuwägen.

=== Web Content Accessibility Guidelines 2
Die @WCAG 2 sind internationale Richtlinien für barrierefreie Webinhalte #cite(<wcag_2018>). Sie stellen die Zugänglichkeit für Menschen mit Einschränkungen sicher. Die Richtlinien basieren auf den folgenden vier Prinzipien #cite(<wcag_2018>).

- *Wahrnehmbar*: Benutzer müssen Informationen und Komponenten wahrnehmen können. Dies umfasst Textalternativen für Nicht-Text-Inhalte und anpassbare Darstellung.
- *Bedienbar*: Komponenten und Navigation müssen bedienbar sein. Dies schließt Tastaturzugänglichkeit und ausreichend Zeit ein.
- *Verständlich*: Informationen und Bedienung müssen verständlich sein. Dies bedeutet lesbare und vorhersehbare Inhalte.
- *Robust*: Inhalte müssen von verschiedenen Benutzeragenten interpretierbar sein. Dies schließt assistive Technologien ein.

Die WCAG 2 definiert drei Konformitätsstufen (A, AA, AAA). Stufe AA gilt als international anerkannter Standard für Web-Inhalte und wird von den meisten Organisationen zur Erfüllung rechtlicher Anforderungen wie dem European Accessibility Act genutzt #cite(<wcag_2018>).

=== HEAT <sec:heat>
HEAT ist ein Bewertungsrahmen für @GenAI\-generierte Inhalte #cite(<verhulsdonck_incorporating_2024>, supplement: "S. 61"). Der Begriff ist ein Akronym für vier Dimensionen #cite(<verhulsdonck_incorporating_2024>, supplement: "S. 63"):

- *Human Experience* bewertet, wie natürlich, ansprechend und hilfreich die Inhalte sind. Dies umfasst Verständlichkeit, Relevanz und emotionale Angemessenheit.
- *Expertise* bewertet die fachliche Korrektheit und prüft, ob die Inhalte dem erforderlichen Expertenniveau entsprechen.
- *Accuracy* fokussiert auf faktische Korrektheit und Verlässlichkeit und prüft, ob Ausgaben frei von Halluzinationen sind.
- *Trust* bewertet, inwieweit Benutzer den Inhalten vertrauen. Dies umfasst Transparenz, Nachvollziehbarkeit und Konsistenz.

Der HEAT-Rahmen ermöglicht systematische Qualitätssicherung von @GenAI\-Ausgaben durch konkrete Bewertungskriterien  #cite(<verhulsdonck_incorporating_2024>, supplement: "S. 63, 65"). In empirischen Studien wurde HEAT erfolgreich zur Bewertung von Qualität und Halluzinationsraten @KI\-generierter Texte eingesetzt #cite(<verhulsdonck_incorporating_2024>, supplement: "S. 65").

=== System Usability Scale <sec:sus>
Die @SUS ist ein standardisierter Fragebogen zur Bewertung der Gebrauchstauglichkeit #cite(<brooke_1996>). Der Fragebogen besteht aus zehn Aussagen. Die Befragten bewerten auf einer fünfstufigen Skala wie stark sie den Aussagen zustimmen. Die Aussagen wechseln zwischen positiven und negativen Formulierungen um Antworttendenzen zu vermeiden. Die konkreten Aussagen sind auf @tab:sus zu sehen.

#figure(
  table(
    columns: 2,
    stroke: 1pt,

    [\#], [*Aussage*],

    [1], [Ich denke, dass ich das System gerne häufig benutzen würde.],
    [2], [Ich fand das System unnötig komplex.],
    [3], [Ich fand das System einfach zu benutzen.],
    [4],
    [Ich glaube, ich würde die Hilfe einer technisch versierten Person benötigen, um das System benutzen zu können.],

    [5], [Ich fand, die verschiedenen Funktionen des Systems waren gut integriert.],
    [6], [Ich denke, das System enthielt zu viele Inkonsistenzen. ],
    [7], [Ich kann mir vorstellen, dass die meisten Menschen den Umgang mit diesem System sehr schnell lernen.],
    [8], [Ich fand das System sehr umständlich zu nutzen.],
    [9], [Ich fühlte mich bei der Nutzung des Systems sehr sicher.],
    [10], [Ich musste eine Menge lernen, bevor ich mit dem System arbeiten konnte.],
  ),
  caption: caption_with_source("Aussagen der SUS", [@brooke_1996]),
) <tab:sus>

Die Berechnung des @SUS\-Scores erfolgt in mehreren Schritten. Zunächst werden die Antworten transformiert: Bei ungeraden Fragen (1, 3, 5, 7, 9), die positiv formuliert sind, wird 1 vom Skalenwert abgezogen. Bei geraden Fragen (2, 4, 6, 8, 10), die negativ formuliert sind, wird der Skalenwert von 5 abgezogen. Dadurch trägt jede Frage 0 bis 4 Punkte bei, was eine maximale Rohsumme von 40 ergibt. Diese wird mit 2,5 multipliziert, um einen Wert zwischen 0 und 100 zu erhalten #cite(<brooke_1996>).

Bei der Interpretation der Werte sind Ergebnisse über 80 exzellent wohingegen sie zwischen 80 und 68 überdurchschnittlich sind. Zwischen 51 und 68 sind sie durchschnittlich und unter 51 gelten sie als unterdurchschnittlich. Werte unter 50 deuten auf erhebliche Usability-Probleme hin.

Die @SUS bietet mehrere Vorteile. Sie ist schnell durchzuführen und liefert auch bei kleineren Stichproben zuverlässige Ergebnisse #cite(<brooke_1996>). Die standardisierten Scores ermöglichen zudem direkte Vergleiche zwischen Systemen.

Die zehn SUS-Aussagen korrelieren dabei mit etablierten Usability-Prinzipien, wie @tab:sus_heuristiken zeigt. Diese Überschneidungen machen die SUS zu einem validen Instrument zur Messung der in Kapitel 2 beschriebenen Usability-Dimensionen.

#figure(
  caption: [Korrelation zwischen SUS-Aussagen und UX-Heuristiken],
  table(
    columns: 3,
    stroke: 1pt,
    align: (center, left, left),

    [*SUS\-Aussage*], [*Inhalt*], [*Korrelierte Heuristik*],

    [2, 8], [Komplexität und Umständlichkeit], [Aufgabenangemessenheit (@ISO 9241-110)],
    [3, 7], [Einfachheit und Lerngeschwindigkeit], [Lernförderlichkeit (@ISO 9241-110)],
    [4], [Benötigter Support], [Selbstbeschreibungsfähigkeit (@ISO 9241-110)],
    [6], [Inkonsistenzen], [Konsistenz und Standards (Nielsen) \ Erwartungskonformität (@ISO 9241-110)],
    [5, 9], [Funktionsintegration und Sicherheit], [Steuerbarkeit und Fehlertoleranz (@ISO 9241-110)],
    [1, 10], [Nutzungsbereitschaft und Lernaufwand], [Lernförderlichkeit (@ISO 9241-110)],
  ),
) <tab:sus_heuristiken>

== UI5

@UI\5 ist ein JavaScript-Framework für die Entwicklung von Unternehmensanwendungen, das von SAP betreut wird. Es wird zwischen OpenUI5 und SAPUI5 unterschieden. OpenUI5 ist ein quelloffenes Framework, zu dem SAPUI5 zusätzliche Erweiterungen bietet, etwa geschäftsspezifische Funktionen und erweiterte Komponenten.

Das Framework basiert auf dem Model-View-Controller-Muster und bietet eine umfangreiche Bibliothek vordefinierter UI-Komponenten, die den SAP Fiori Design Guidelines entsprechen. Diese Komponenten ermöglichen eine konsistente Gestaltung von Benutzeroberflächen und gewährleisten die Einhaltung von Accessibility-Standards.

@UI\5 stellt mit Fragments  wiederverwendbare @UI\-Definitionen, die als XML-, HTML- oder JavaScript-Dateien vorliegen können, zur Verfügung. Sie ermöglichen die modulare Strukturierung von Benutzeroberflächen, indem komplexe @UI\-Elemente in separate, wiederverwendbare Komponenten ausgelagert werden.

Im Gegensatz zu vollständigen Views sind Fragments leichtgewichtige @UI\-Bausteine ohne eigenen Controller. Sie können in Views eingebunden werden und erhalten ihre Datenanbindung und Event-Handler vom umgebenden Controller. XML-Fragments sind dabei die gebräuchlichste Variante und unterstützen diverse  Funktionen des @UI\5\-Frameworks, inklusive Data Binding, Event-Handler-Anbindung und der Nutzung aller verfügbaren Standard-Controls.


== Nutzwertanalyse <sec:nwa_grundlagen>
Um mit komplexen Problemen, die häufig unbekannte Variablen beinhalten, adäquat umgehen zu können, müssen oft Annahmen gemacht und anderweitig pauschalisiert werden #cite(<nwa>, supplement: "S. 7"). Auch intensive Recherchen können selten alle nötigen Informationen liefern #cite(<nwa>, supplement: "S. 7").

Eine @NWA bietet sich insbesondere dann an, wenn ein solches komplexes Entscheidungsproblem vorliegt #cite(<nwa>, supplement: "S. 6"). Im Kontext dieser Bachelorarbeit wird sie explizit bei einer Auswahlentscheidung eingesetzt. Hierbei werden mehrere Alternativen gegeneinander abgewogen #cite(<nwa>, supplement: "S. 6").

Ein Problem wird bei der @NWA in alle relevanten Aspekte zerlegt, welche schließlich in einen Nutzwert-Score einfließen #cite(<nwa>, supplement: "S. 6"). Zur Errechnung des Scores werden zunächst das Ziel und Entscheidungsproblem der @NWA sowie alle Entscheidungsalternativen klar und deutlich definiert #cite(<nwa>, supplement: "S. 23-24"). Bei der Auswahl der Entscheidungsalternativen ist insbesondere darauf zu achten, dass diese Optionen sinnvoll voneinander unterscheidbar, aber dennoch vergleichbar sind #cite(<nwa>, supplement: "S. 24"). Anschließend werden alle relevanten Entscheidungskriterien bestimmt und gewichtet #cite(<nwa>, supplement: "S. 28, 42"). Graduelle, objektive Kriterien sind besonders gut geeignet #cite(<nwa>, supplement: "S. 32"). Insgesamt sollten etwa zehn bis zwanzig Kriterien ausgewählt werden #cite(<nwa>, supplement: "S. 32"). Zur Identifikation geeigneter Kriterien bietet sich ein Brainstorming im Team oder die Befragung von Expert*Innen an. Ein passendes Verfahren für die Gewichtung der Kriterien bildet die Skalenbasierte Gewichtung, bei der die Kriterien mithilfe einer Skala, beispielsweise von eins bis zehn, eingestuft werden und so eine Gewichtung erhalten #cite(<nwa>, supplement: "S. 43"). Anschließend wird der Erfüllungsgrad der Kriterien bewertet. Hierbei ist insbesondere darauf zu achten, dass die Bewertungsskalen praktikabel (verständlich), repräsentativ (zu dem Erfüllungsgrad eines Kriteriums passend) und universell (zu möglichst vielen Kriterien gleichzeitig passend) sein sollten #cite(<nwa>, supplement: "S. 56-57"). Die Bewertungen werden anschließend mit ihrer Gewichtung multipliziert, um so den @NWA\-Score zu errechnen #cite(<nwa>, supplement: "S. 79"). Schlussendlich werden die Ergebnisse sowie alle Arbeitsschritte dokumentiert, um alle Betroffenen von den Ergebnissen der @NWA zu unterrichten sowie die einzelnen Arbeitsschritte und Entscheidungen nachvollziehbar zu machen #cite(<nwa>, supplement: "S. 86-87").

In @tab:nwa_steps sind diese Arbeitsschritte  aufgeführt. Schritt 1 und 9 sind für eine @NWA im Umfang dieser Bachelorarbeit nicht relevant, da sie sich mit der Durchführung der Analyse in einem Team bzw. der Diskussion der Ergebnisse befassen, die ohnehin in @sec:evaluation stattfindet #cite(<nwa>, supplement: "S. 20-22, 81").

#figure(
  caption: caption_with_source("Schritte der Nutzwertanalyse", cite(<nwa>, supplement: "S. 18")),
  table(
    columns: 2,
    stroke: 1pt,

    [\#], [*Arbeitschritt*],

    [1], [Organisation des Arbeitsumfelds und Planung],
    [2], [Ziel und Entscheidungsproblem],
    [3], [Auswahl der Entscheidungsalternativen],
    [4], [Bestimmung der Entscheidungskriterien],
    [5], [Gewichtung der Entscheidungskriterien],
    [6], [Skalen und Bewertungsvorschriften],
    [7], [Bewertung der Entscheidungskriterien],
    [8], [Berechnung des Nutzwerts bzw. Scores],
    [9], [Sensitivitätsanalyse],
    [10], [Präsentation und Dokumentation des Ergebnisses],
  ),
) <tab:nwa_steps>


Die Vorteile der @NWA liegen insbesondere in der durch die Fragmentierung durchgesetzten Objektivität. So werden einzelne Faktoren eines Problems bei der Bewertung von ihrem Kontext getrennt, was beispielsweise der Durchsetzung subjektiver Präferenzen vorbeugt #cite(<nwa>, supplement: "S. 11"). Allerdings kann eine @NWA durch das Einsetzen subjektiver Rankings teilweise ungenau oder verzerrt sein #cite(<nwa>, supplement: "S. 11-12"). Zudem ist sie für Einsatzfälle, wie beispielsweise Zukunftsprognosen, ungeeignet. Hierbei hätten die bewerteten Kriterien nur selten eine Aussagekraft, da sie meistens entweder zu vage sind oder so spezifisch formuliert wären, dass ihr Eintreten äußerst unwahrscheinlich wäre #cite(<nwa>, supplement: "S. 15").

== Experteninterviews

Experteninterviews sind eine qualitative Forschungsmethode, bei der der Befragte als Repräsentant eines organisationalen oder fachlichen Kontextes befragt wird #cite(<Liebold_2009>, supplement: "S. 33"). Experten sind Personen, die über spezifisches Sonderwissen verfügen #cite(<Bogner_2002>). Im Gegensatz zu standardisierten Befragungen ermöglichen Experteninterviews die Erfassung von Erfahrungswissen, Prozesswissen und Deutungswissen #cite(<Liebold_2009>, supplement: "S. 35-36").

In der Forschungspraxis hat sich das leitfadengestützte Interview als Standard etabliert #cite(<Liebold_2009>, supplement: "S. 37"). Der Leitfaden dient als thematische Strukturierungshilfe, muss jedoch flexibel gehandhabt werden, um den Erzählfluss nicht zu behindern #cite(<Liebold_2009>, supplement: "S. 38-39"). Besonders bei Interviews mit Fachexperten empfiehlt sich ein diskursiv-argumentativer Gesprächsstil, der den professionellen Kommunikationsgewohnheiten entspricht #cite(<Liebold_2009>, supplement: "S. 41").

Die Auswertung von Experteninterviews erfolgt typischerweise thematisch-vergleichend #cite(<Liebold_2009>, supplement: "S. 51"). Den Textpassagen der Transkripte werden zunächst textnahe Überschriften (Codes) zugewiesen, die die Terminologie der Befragten aufgreifen. Anschließend werden ähnliche Themen aus verschiedenen Interviews zusammengestellt, um übergreifende Wissensbestände herauszuarbeiten #cite(<Liebold_2009>, supplement: "S. 53-54").
