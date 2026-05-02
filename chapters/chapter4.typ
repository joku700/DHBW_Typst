#import "@preview/drafting:0.2.2": *

= Implementierung
Im vorherigen Kapitel wurde festgelegt, dass bei der prototypischen Entwicklung des Feedback-Tools der statische @GenUI\-Ansatz eingesetzt werden soll. In diesem Kapitel wird die konkrete Implementierung des Prototyps dokumentiert und auf Herausforderungen sowie deren Lösungen eingegangen.

== Ausgangssituation
Der Content Manager Agent nutzt ein Claude 4.5 Haiku Model das auf dem SAP AI Core läuft. Dieses @LLM ist über eine mit @RAP veröffentlichte @ABAP\-Methode vom Frontend erreichbar. 
Auf @img:cma_old_arch sind die bisherigen Tools des Content Manager Agents zu sehen. Weitere Tools können angeschlossen werden, indem diese als Client Tools in der Request definiert werden.

#figure(
  caption: [Bisherige Tools des Content Manager Agents],
  image("../assets/Diagramme/cma_old_arch.drawio.png"),
) <img:cma_old_arch>

 Bei Client Tools erfolgt die Implementierung Client-seitig. Der Content Manager Agent gibt also ein spezifisches Tool mit den entsprechenden Parametern zurück, woraufhin entsprechende TypeScript-Funktionen ausgeführt werden. Da alle bisherigen Tools in @ABAP implementiert sind, werden in diesen Funktionen @OData V4 Actions aufgerufen, die über @RAP mit @ABAP\-Methoden verknüpft sind. Die Antwort des Tools wird anschließend zur Message-Liste des Agenten-Prompts hinzugefügt. In @img:cma_sequence ist dieser Ablauf zu sehen.

#figure(
  caption: [Ablauf des Agent-Loops des Content Manager Agents],
  image("../assets/Diagramme/cma_sequence.drawio.png"),
) <img:cma_sequence>

== Umsetzung
Das Feedback-Tool wurde im Gegensatz zu den restlichen Tools nicht in @ABAP, sondern in TypeScript implementiert. Diese Entscheidung ermöglicht direkten Einfluss auf das Frontend (unter Anderem die dynamische Erstellung von Feedback-Dialogen ohne zusätzliche Server-Roundtrips) sowie asynchrone Verarbeitung mit parallelen Aufrufen. Auf @img:cma_new_arch ist diese Architektur veranschaulicht.

#figure(
  caption: [Beziehungen zwischen den Komponenten des Content Manager Agents],
  image("../assets/Diagramme/cma_arch.drawio.png"),
) <img:cma_new_arch>

=== Komponenten des Feedback-Tools
Das Feedback-Tool besteht aus drei zentralen Komponenten:

FeedbackTool: Die Hauptklasse agiert als Koordinator und Einstiegspunkt für alle Feedback-Anfragen. Sie empfängt vom Content Manager Agent eine Beschreibung der Situation sowie optionale Parameter wie Frage-Text, generierte Inhalts-IDs oder -Batch-IDs. Die Klasse ist verantwortlich für die Auswahl des passenden Formulars, das Laden der benötigten Daten und das Aufrufen des FeedbackHandlers.

FeedbackHandler: Diese Komponente ist für das Laden der Dialoge verantwortlich. Sie verknüpft zudem dynamisch Datenmodelle und Logik basierend auf der übergebenen Konfiguration mit dem erstellten Dialog.

FeedbackDialogDefinitions: Dieses zentrale Verzeichnis verwaltet die Definitionen aller verfügbaren Formulare. Für jedes Formular sind Informationen wie die Dialog-Dimensionen, eine Beschreibung über den Anwendungsfall sowie die Standard-Buttons hinterlegt. Diese Informationen werden dem Feedback-Tool zur Laufzeit zur Verfügung gestellt. Das Tool gibt sie wiederum zur Formularauswahl an das @LLM und verwendet sie für die Erstellung des Dialogs. Durch diese zentrales Verzeichnis wird insbesondere eine gute Erweiterbarkeit gewährleistet, da nur an einer Stelle Anpassungen gemacht werden.

=== Ablauf der Feedbackeinholung
Der detaillierte Ablauf des Feedback-Prozesses ist auf @img:feedback_sequence dargestellt. Der Prozess beginnt, wenn der Content Manager Agent das `get_feedback`-Tool aufruft. Dieser Aufruf enthält eine Beschreibung der aktuellen Situation, optional eine konkrete Frage an den Benutzer oder einzelne bzw Batch-IDs von generierten Inhalten. In der Implementierung dieses Tools wird eine Instanz der Feedback-Tool-Klasse erstellt und anschließend die `getFeedback()`-Methode aufgerufen.

#figure(
  caption: [Ablauf der Feedbackeinholung],
  image("../assets/Diagramme/feedback_tool_sequence.drawio.png")
) <img:feedback_sequence>

Das Feedback-Tool konstruiert zunächst einen Prompt für die Formularauswahl und sendet diesen über das @ABAP\-Backend an den @AI\-Core, wo ein @LLM mit Reasoning-Fähigkeiten das passende Formular auswählt. 
Der Prompt besteht aus einer Message-Liste mit einem allgemeinen System-Prompt und der Situationsbeschreibung des Content Manager Agents sowie einer Auflistung aller verfügbarer Formulare mit Beschreibungen. Die Formulare werden im Prompt als Tools deklariert, da die Antwort des @LLM:pl so die Form eines Tool-Aufrufs hat. Die Antwort-@JSON enthält den konkreten Namen des Formulars in einem spezifischen Attribut, was die Verarbeitung erleichtert. Zudem wird eine weitere Nachricht an die Message-Liste angehängt, die den Agenten darüber informiert, ob generierte Inhalte oder eine Nachfrage des Content Manager Agents vorliegen. Der Prompt ist im Anhang zu finden. #inline-note(text("adden"))

Basierend auf dem ausgewählten Formular werden anschließend die entsprechende Formular-Konfiguration aus dem FeedbackDialogDefinitions-Verzeichnis abgerufen und die referenzierten Inhalte über OData-Aufrufe vom Backend geladen.

Der FeedbackHandler erstellt daraufhin ein @JSON\-Model mit den formularspezifischen Daten und einen dynamischen Controller mit den benötigten Event-Handlern. Die Dialog-Buttons werden mit Callback-Funktionen versehen, die ein Promise an den Content Manager Agent mit den eingegebenen Daten auflösen. Das entsprechende @UI\5-Fragment wird geladen und in einem Dialog angezeigt. Der Content Manager Agent-Loop wartet währenddessen asynchron auf die Benutzerinteraktion.

Nachdem der Benutzer den Dialog abgeschlossen hat, sammelt der Controller die Formulardaten und löst das Promise auf. Das Ergebnis wird an den Content Manager Agent zurückgegeben, der damit seinen Loop fortsetzt. Wenn generierte Inhalte durch einen Klick auf den "Bestätigen"-Button freigegeben wurden, wird auf dem Backend bei dem Inhalt außerdem eine entsprechenden Flag auf "Accepted" gesetzt. Bei einem Klick auf den "Ablehnen"-Button wird diese Flag dahingegen auf "Rejected" gesetzt.

#inline-note(text("hier nochmal drauf eingehen warum das hier abstrahiert ist und warum das geil ist"))

=== Formulare
Das Feedback-Tool unterstützt sieben verschiedene Formulare, die unterschiedliche Validierungs- und Feedback-Szenarien abdecken. Es wurden diese spezifischen Formulare entwickelt, um möglichst viele Situationen in den beiden Use-Cases Bildgenerierung und Textübersetzung abzudecken. Bilder von den Formularen sind im Anhang zu finden. #inline-note(text("in den anhang packen"))

*AgentQuestionForm:* Das einfachste Formular stellt eine direkte Frage des Agents und bietet ein Textfeld für die Antwort. Es wird verwendet, wenn der Agent Klarstellung benötigt oder zusätzliche Informationen vom Benutzer einholen muss.

*RatingFeedbackForm:* Dieses Formular zeigt ein einzelnes generiertes Bild zusammen mit einer 5-Sterne-Bewertung und einem Feedback-Textfeld. Der Benutzer kann das Bild akzeptieren, Anpassungen anfordern oder ablehnen. Es wird nach der Generierung einzelner Bilder verwendet, um detailliertes Feedback zur Qualität zu sammeln.

*TranslationValidationForm:* Dieses Formular dient der Validierung von Übersetzungen von Bereichstexten. Es zeigt nacheinander die Original- neben den übersetzten Texten an und ermöglicht dem Benutzer, jede Übersetzung zu akzeptieren oder anzupassen. Ein Rich-Text-Editor erlaubt direkte Bearbeitungen der Übersetzungen vor der Finalisierung.

*ImageComparisonForm:* Bei diesem Formular werden zwei Bilder nebeneinander angezeigt. So können A/B-Tests durchgeführt werden, bei denen der Benutzer das bevorzugte Bild auswählen kann. 

*MultiImageSelectionForm:* Dieses Formular präsentiert sechs generierte Bildvarianten. Der Benutzer kann eine oder mehrere passende Bilder auswählen oder alle ablehnen. Dieses Formular eignet sich für Szenarien, in denen aus mehreren Varianten die besten ausgewählt werden sollen.

*ImageStyleSelectionForm:* Dieses Formular erlaubt es dem Nutzer vor der Inhaltsgenerierung Parameter wie Stil (fotorealistisch, illustrativ etc.), Perspektive, Farbschema, Hintergrund und Beleuchtung festzulegen. Dies ermöglicht eine präzisere Steuerung des Generierungsprozesses.

*ContentRefinementForm:* Dieses Formular zeigt ein Bild mit Schaltern und Eingabefeldern für verschiedene Aspekte (Farbe, Komposition, Beleuchtung, Details, Hintergrund). Der Benutzer kann spezifizieren, welche Aspekte beibehalten und welche geändert werden sollen. Dieses Formular unterstützt einen iterativen Verbesserungsprozess, bei dem das Bild schrittweise optimiert wird.


=== Integrationsmuster
Die Integration des Feedback-Tools folgt einem hybriden Ansatz, der Human-as-a-Tool und Interrupt-and-Resume kombiniert. Die Wahl des Integrationsmusters wird durch den System-Prompt des Content Manager Agents festgelegt und hängt vom Kontext ab. Dieser Prompt ist im Anhang zu finden. #inline-note(text("in den anhang packen"))

Nach der Inhaltsgenerierung wird primär das Interrupt-and-Resume-Muster eingesetzt. Es ist fest definiert, dass der Agent seinen Loop an dieser Stelle pausieren und auf die menschliche Validierung warten soll. Dies stellt sicher, dass generierte Inhalte vor der weiteren Verarbeitung oder Finalisierung geprüft werden.

Für allgemeine Rückfragen oder Klarstellungen während des Prozesses wird hingegen das Human-as-a-Tool-Muster verwendet: Der Agent betrachtet den Menschen als ein Tool, das er bei Bedarf aufrufen kann, um zusätzliche Informationen zu erhalten. Dies ermöglicht eine flexible, kontextabhängige Einbindung menschlicher Expertise.

Diese Mischung ermöglicht es dem Agenten, autonom zu arbeiten, wo möglich, und menschliches Urteilsvermögen einzuholen, wo notwendig, insbesondere bei Qualitätssicherung und Entscheidungen, die menschliche Präferenzen oder Domänenwissen erfordern.

== Herausforderungen
Während der Implementierung des Feedback-Tools traten verschiedene technische und konzeptionelle Herausforderungen auf, die im Folgenden beschrieben und mit ihren Lösungsansätzen dokumentiert werden.

=== Bearbeitungszeiten
In frühen Versionen des Systems führten die sequenziellen Aufrufe verschiedener Services zu spürbaren Verzögerungen. Insbesondere die Kombination aus @AI\-Core\-Aufrufen für die Agent-Logik, Formularauswahl und Content-Generierung resultierte in langen Wartezeiten für den Benutzer.

Als Gegenmaßnahme wurden mehrere Optimierungen implementiert. Die Wahl eines effizienteren Modells (Claude 4.5 Haiku) verkürzte die Response-Zeiten erheblich. Die Frontend-basierte Implementierung des Feedback-Tools ermöglicht zudem asynchrone Verarbeitung und Parallelisierung von unabhängigen Aufrufen. Zudem werden Token gespart, indem den Agenten nur Referenzen auf die generierten Inhalte mitgegeben werden.

=== Eingeschränkte Bewertungsfähigkeit
Eine grundlegende Herausforderung besteht darin, dass der Content Manager Agent lediglich als Vermittler zwischen den generativen Tools und dem Benutzer agiert, jedoch nicht in der Lage ist, die Qualität oder Korrektheit der generierten Inhalte selbst zu bewerten. So kann er bspw. nach der Neugenerierung von Inhalten nicht überprüfen, ob die entsprechenden Anpassungen tatsächlich durchgeführt wurden. An dieser Stelle musste dem Content Manager Agent durch Prompt Engineering deutlich gemacht wurde, dass es zu Randfällen kommen kann und dass er im Zweifelsfall die Behauptungen des Benutzers priorisieren sollte. 

=== Limitationen von UI5-Cards
Ursprünglich sollten @UI\5-Cards für die Darstellung der Feedback-Formulare verwendet werden, da sie eine plattformunabhängige JSON-basierte Definition von UI-Komponenten ermöglichen. Während der Implementierung stellte sich heraus, dass @UI\5-Cards für die komplexen Anforderungen des Feedback-Tools zu eingeschränkt sind. Insbesondere fehlten Möglichkeiten für die Implementierung komplexerer Logik, wie sie bspw. bei dem TranslationValidationForm nötig ist.

Als Lösung wurde auf @UI\5\-Fragments umgestellt, die die volle Flexibilität des @UI\5\-Frameworks bieten. Fragments ermöglichen unter Anderem die Integration von Custom Controllern für komplexe Logik. Diese Lösung bietet zwar weniger Plattformunabhängigkeit als Cards, ist jedoch für die Anforderungen des Feedback-Tools erheblich besser geeignet.

=== Fehlende Tool-Aufrufe
Eine wiederkehrende Herausforderung bestand darin, dass der Agent in bestimmten Situationen direkt auf Benutzeranfragen antwortete, anstatt das Feedback-Tool oder andere verfügbare Tools aufzurufen. Dieses Verhalten hat mehrere Ursachen.

Die Prompt-Formulierung beeinflusst stark, ob der Agent Tool-Calls bevorzugt oder direkt antwortet. Unklare Anweisungen oder widersprüchliche Beispiele im System-Prompt können dazu führen, dass der Agent den direkten Weg wählt. Auch das Modell-Verhalten selbst spielt eine Rolle: LLMs tendieren dazu, Anfragen möglichst schnell und direkt zu beantworten, wenn nicht explizit zur Tool-Nutzung aufgefordert.

Als Mitigationsstrategie wurde der System-Prompt präzisiert, um die Verwendung von Tools in spezifischen Situationen explizit zu fordern. In Fällen, in denen der Agent ohne Tool-Call antwortet, wird die Antwort trotzdem im AgentQuestionForm angezeigt, um eine konsistente Benutzerführung zu gewährleisten. Zusätzlich wurden die Tool-Beschreibungen optimiert, um dem Modell klarere Hinweise zu geben, wann welches Tool verwendet werden soll.

=== Genauigkeit der Formularauswahl
Die dynamische Auswahl des passenden Feedback-Formulars durch Claude Haiku 4.5 funktioniert in den meisten Fällen zuverlässig. Sie ist jedoch stark kontextabhängig und nicht deterministisch. Bei mehrdeutigen Situationen kann das Modell ein suboptimales Formular auswählen oder in seltenen Fällen gar keine Tool-Use-Response zurückgeben. Als Lösung wurde ein robustes Fallback-System implementiert. Wenn Claude keine Tool-Use-Response zurückgibt, wird automatisch das AgentQuestionForm verwendet, das als universelles Formular für alle Rückfragen dient. Die Beschreibungen der verfügbaren Formulare in der FeedbackDialogDefinitions-Registry wurden iterativ verfeinert, um Claude präzisere Entscheidungshilfen zu bieten.
