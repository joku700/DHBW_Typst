#import "@preview/rexllent:0.4.0": xlsx-parser
#counter(heading).update(0)

#set page(flipped: true)

== Bewertungsmatrix der Nutzwertanalyse <anhang:nwa_table>

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
    [Stabilität],
    [Einsatz zukunftssicherer Technologien],
    [5,82],
    [85],
    [4,95],
    [80],
    [4,66],
    [*95*],
    [*5,53*],
    [75],
    [4,37],

    [Stabilität], [Funktionale Konsistenz], [5,82], [*95*], [*5,53*], [80], [4,66], [35], [2,04], [70], [4,07],
    [Sicherheit], [Manipulationssicherheit], [7,32], [*95*], [*6,95*], [85], [6,22], [25], [1,83], [90], [6,59],
  ),
  caption: [Bewertungsmatrix der Nutzwertanalyse],
) <tab:nwa_bewertung>

#set page(flipped: false)

== Prompt für Feedback-Tool <anhang:feedback_tool_prompt>

#figure(
  ```javascript
  const systemMessage = ` You are a UI Form Selector for a Content Management System.

  CONSTRAINT: You MUST call exactly one tool. Never respond with text - only tool calls are valid.

  TASK: Analyze the agent's request and select the most appropriate feedback form.

  DECISION PROCESS:
  1. Does the request involve IMAGES (showing, comparing, rating generated images)?
     → Use image forms: RatingFeedbackForm (1 image), ImageComparisonForm (2 images),
       MultiImageSelectionForm (6 images), ContentRefinementForm (refinement)
  2. Does the request need IMAGE GENERATION PARAMETERS before creating?
     → Use ImageStyleSelectionForm
  3. Does the request involve TRANSLATIONS?
     → Use TranslationValidationForm
  4. Is it a QUESTION or STATUS MESSAGE without generated Data?
     → Use AgentQuestionForm

  DEFAULT: When uncertain, use AgentQuestionForm.`;

  const claudeMessage = {
      anthropic_version: "bedrock-2023-05-31",
      max_tokens: 4096,
      messages: [
          {
              role: "user",
              content: systemMessage,
          },
          {
              role: "user",
              content: description,
          },
      ],
      // Konvertiert Formular-Definitionen (Name + Beschreibung) ins Claude Tool-Use-Format
      tools: buildDialogToolsForAI(),
  };

  if (contentIds?.length) {
      claudeMessage.messages.push({
          role: "user",
          content: `There is generated content with the ids [${contentIds.toString()}]!`,
      });
  }
  if (batchIds?.length) {
      claudeMessage.messages.push({
          role: "user",
          content: `There is generated content with the batch ids [${batchIds.toString()}]!`,
      });
  }
  if (question) {
      claudeMessage.messages.push({
          role: "user",
          content: `The Content Manager Agent wants to ask this question:" ${question}!`,
      });
  }
  ```,
  caption: [Konstruktion der LLM-Anfrage zur Formularauswahl]
) <list:feedback_tool_prompt>

== Formulare des Feedback-Tools <anhang:formulare>

#figure(
  image("Screenshots/Formulare/AgentQuestionForm.png"),
  caption: [AgentQuestionForm],
) <img:form_agent_question>

#figure(
  image("Screenshots/Formulare/RatingFeedbackForm.png"),
  caption: [RatingFeedbackForm],
) <img:form_rating_feedback>

#figure(
  image("Screenshots/Formulare/TranslationValidationForm.png"),
  caption: [TranslationValidationForm],
) <img:form_translation_validation>

#figure(
  image("Screenshots/Formulare/ImageComparisonForm.png"),
  caption: [ImageComparisonForm],
) <img:form_image_comparison>

#figure(
  image("Screenshots/Formulare/MultiImageSelectionForm.png"),
  caption: [MultiImageSelectionForm],
) <img:form_multi_image_selection>

#figure(
  image("Screenshots/Formulare/ImageStyleSelectionForm.png"),
  caption: [ImageStyleSelectionForm],
) <img:form_image_style_selection>

#figure(
  image("Screenshots/Formulare/ContentRefinementForm.png"),
  caption: [ContentRefinementForm],
) <img:form_content_refinement>

== Systemprompt für Content Manager Agent <anhang:systemprompt>

#figure(
  ```javascript
  const CONTENT_MANAGER_SYSTEM_PROMPT = `You are a Catalog Content Manager that helps users
  generate images and translate catalog content.

  ## Critical
  Use get_feedback for ALL user communication. When the user indicates they are done
  (e.g. "fertig", "danke", "done", "exit"), respond with a brief farewell message
  WITHOUT calling any tool.
  The User CAN NOT see your messages, if you want to communicate with them use get_feedback!

  ## Capabilities
  You can help users with:
  1. **Image Generation**: Generate images for catalog nodes
  2. **Text Translation**: Translate catalog texts from one language to another

  ## How to use get_feedback
  When calling get_feedback, set:
  - description: ALWAYS set this parameter with your intent/situation, the feedback tool
    will choose the best feedback form based on this parameter
    (e.g. "I want to greet the user", "I generated 2 images and need feedback",
    "Translations are complete")
  - question: Set with the question that is displayed to the user, ONLY use this parameter
    if you actually have a question (e.g. "What would you like me to do?")
  - The feedback tool only has access to the contents of description, so you should give
    all necessary information in that parameter
  - generated_content_ids: ONLY when you have generated images to show
  - batch_ids: ONLY when you have translation batches to show (from translate_texts calls)

  ## Behavior
  - Start by calling get_feedback to greet the user and ask what they want to do
    (generate images OR translate texts)
  - Keep questions concise - no examples in the initial greeting
  - Once the user gives a task, proceed IMMEDIATELY - do NOT ask additional clarifying
    questions beforehand
  - Stop once you are done with your task, don't ask what you should do next

  ### For Image Generation:
  - The generate_image tool fetches all necessary context automatically, so you have
    limited influence on the initial generation
  - After images are generated, call get_feedback with generated_content_ids to let
    the user review

  ### For Translation:

  #### Workflow
  1. Always start by calling get_catalog_context with the provided layvr and sortf to get
     the catalog structure below the given node.
  2. Translate all texts of the given node itself and all texts of nodes and materials
     below it. Do not translate texts of nodes outside the subtree.
  3. You only have to translate the node itself once. In subsequent calls for
     materials/supplier_materials of that node, set translate_node to false.
  4. After ALL translations are complete, call get_feedback so the user can review.
     Pass all batch_ids from translate_texts calls as a JSON array.

  #### Critical: Parallelization Strategy
  - NEVER translate all materials in a single translate_texts call when there are
    multiple materials.
  - When a node has up to ~20 materials: call translate_texts ONCE per material,
    all in parallel.
  - When a node has more than ~20 materials: batch them into groups of ~5 materials
    per call, all in parallel.
  - Maximum 20-30 parallel calls per response.

  ## Rules
  - Always use "{{contentLanguage}}" for context_language in tool calls
  - Always use "{{contentLanguage}}" when communicating with the user
  - You CAN send multiple translate_texts calls in one response for parallel execution
  - Maximum 3 calls per tool (except get_feedback and translate_texts - unlimited)
  - Always call get_feedback after generating content or completing translations so the
    user can verify
  - If the user requests unsupported content types, use get_feedback to clarify
  - If you need further information or have questions also use get_feedback`;
  ```,
  caption: [Systemprompt des Content Manager Agents]
) <list:systemprompt>
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

#figure(
  table(
    columns: 2,
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
  ),
  caption: [System Usability Scale (SUS) -- Fragebogen],
) <tab:sus_fragebogen>

*Antwortskala:* 1 = stimme überhaupt nicht zu | 2 = stimme eher nicht zu | 3 = neutral | 4 = stimme eher zu | 5 = stimme voll zu

=== HEAT-Heuristik

#figure(
  table(
    columns: 2,
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
  ),
  caption: [HEAT-Heuristik -- Fragebogen],
) <tab:heat_fragebogen>

*Antwortskala:* 1 = trifft nicht zu | 2 = trifft eher nicht zu | 3 = neutral | 4 = trifft eher zu | 5 = trifft voll zu

=== Ergänzende Usability-Aspekte

#figure(
  table(
    columns: 2,
    align: (left, left),
    [*Nr.*], [*Aussage*],
    [U1], [Ich wusste jederzeit, was das System gerade tat],
    [U2], [Ich hatte die Kontrolle über den Ablauf der Validierung],
    [U3], [Das System reagierte schnell auf meine Eingaben],
  ),
  caption: [Ergänzende Usability-Aspekte -- Fragebogen],
) <tab:usability_fragebogen>

*Antwortskala:* 1 = trifft nicht zu | 2 = trifft eher nicht zu | 3 = neutral | 4 = trifft eher zu | 5 = trifft voll zu

=== Offene Fragen

#figure(
  table(
    columns: 2,
    align: (left, left),
    [*Nr.*], [*Aussage*],
    [O1], [Was hat Ihnen am Tool besonders gut gefallen?],
    [O2], [Was fanden Sie besonders schwierig oder verwirrend?],
    [O3], [Haben Sie weitere Anmerkungen oder Verbesserungsvorschläge?],
  ),
  caption: [Offene Fragen -- Fragebogen],
) <tab:offene_fragen_fragebogen>

== Ergebnisse der quantitativen Evaluation <anhang:ux_ergebnisse>

=== Demografische Angaben der Teilnehmer

#figure(
  table(
    columns: (auto, auto, auto, auto),
    align: (center, center, left, left),
    table.header([*Teilnehmer*], [*Alter*], [*Nutzungshäufigkeit*], [*KI-Erfahrung*]),
    [T1], [20–30], [Täglich], [Ja, regelmäßig],
    [T2], [20–30], [Täglich], [Ja, regelmäßig],
    [T3], [20–30], [Täglich], [Ja, regelmäßig],
    [T4], [20–30], [Täglich], [Ja, regelmäßig],
    [T5], [20–30], [Täglich], [Ja, regelmäßig],
    [T6], [20–30], [Täglich], [Ja, gelegentlich],
  ),
  caption: [Demografische Angaben der Teilnehmer],
) <tab:demografie>

=== SUS-Einzelwerte

#figure(
  table(
    columns: (auto, auto, auto, auto, auto, auto, auto, auto, auto, auto, auto, auto),
    align: (center, center, center, center, center, center, center, center, center, center, center, center),
    table.header(
      [*Teilnehmer*], [*S1*], [*S2*], [*S3*], [*S4*], [*S5*], [*S6*], [*S7*], [*S8*], [*S9*], [*S10*], [*SUS-Score*]
    ),
    [T1], [4], [1], [3], [1], [4], [1], [5], [2], [3], [1], [82,5],
    [T2], [5], [2], [4], [2], [5], [1], [5], [2], [5], [1], [90],
    [T3], [5], [1], [4], [1], [5], [1], [5], [1], [5], [1], [97,5],
    [T4], [5], [3], [3], [4], [4], [2], [5], [2], [3], [1], [70],
    [T5], [3], [2], [4], [1], [4], [1], [5], [1], [5], [1], [87,5],
    [T6], [4], [2], [4], [2], [5], [2], [5], [2], [2], [1], [77,5],
    [*Mittelwert*],
    [*4,33*],
    [*1,83*],
    [*3,67*],
    [*1,83*],
    [*4,50*],
    [*1,33*],
    [*5,00*],
    [*1,67*],
    [*3,83*],
    [*1,00*],
    [*84,17*],
  ),
  caption: [SUS-Einzelwerte der Teilnehmer],
) <tab:sus_einzelwerte>

=== HEAT-Einzelwerte

#figure(
  table(
    columns: (auto, auto, auto, auto, auto, auto, auto, auto, auto, auto, auto, auto, auto, auto, auto, auto, auto),
    align: center,
    table.header(
      [*TN*],
      [*H1*],
      [*H2*],
      [*H3*],
      [*HE*],
      [*E1*],
      [*E2*],
      [*E3*],
      [*EX*],
      [*A1*],
      [*A2*],
      [*A3*],
      [*AC*],
      [*T1*],
      [*T2*],
      [*T3*],
      [*TR*],
    ),
    [T1], [5], [3], [5], [4,33], [4], [5], [5], [4,67], [5], [5], [1], [3,67], [4], [5], [4], [4,33],
    [T2], [4], [4], [4], [4,00], [5], [5], [5], [5,00], [5], [5], [3], [4,33], [4], [5], [4], [4,33],
    [T3], [5], [5], [5], [5,00], [5], [5], [5], [5,00], [5], [5], [5], [5,00], [5], [5], [4], [4,67],
    [T4], [4], [4], [4], [4,00], [4], [5], [4], [4,33], [4], [4], [3], [3,67], [3], [4], [4], [3,67],
    [T5], [4], [4], [5], [4,33], [5], [5], [5], [5,00], [4], [5], [2], [3,67], [5], [5], [5], [5,00],
    [T6], [5], [4], [4], [4,33], [4], [4], [3], [3,67], [5], [5], [2], [4,00], [5], [5], [4], [4,67],
    [*MW*],
    [*4,50*],
    [*4,00*],
    [*4,50*],
    [*4,33*],
    [*4,50*],
    [*4,83*],
    [*4,50*],
    [*4,61*],
    [*4,67*],
    [*4,83*],
    [*2,67*],
    [*4,06*],
    [*4,33*],
    [*4,83*],
    [*4,17*],
    [*4,45*],
  ),
  caption: [HEAT-Einzelwerte der Teilnehmer (HE = Human Experience, EX = Expertise, AC = Accuracy, TR = Trust)],
) <tab:heat_einzelwerte>

=== Ergänzende Usability-Metriken Einzelwerte


#figure(
  table(
    columns: (auto, auto, auto, auto),
    align: (center, center, center, center),
    table.header([*Teilnehmer*], [*U1*], [*U2*], [*U3*]),
    [T1], [5], [5], [4],
    [T2], [3], [5], [4],
    [T3], [5], [5], [5],
    [T4], [5], [4], [5],
    [T5], [3], [4], [3],
    [T6], [5], [4], [4],
    [*Mittelwert*], [*4,33*], [*4,50*], [*4,17*],
  ),
  caption: [Ergänzende Usability-Metriken -- Einzelwerte],
) <tab:usability_einzelwerte>

=== Offene Rückmeldungen


  #figure(
    table(
      columns: (auto, 1fr, 1fr, 1fr),
      align: (center, left, left, left),
      table.header([*TN*], [*O1: Besonders gut gefallen*], [*O2: Schwierig/verwirrend*], [*O3: Verbesserungsvorschläge*]),
      [T1],
      [Der Ablaufplan],
      [Auf kleineren Bildschirmen werden einige interaktive Elemente nicht angezeigt. Außerdem ist nicht ersichtlich, dass der Button oben rechts den AI-Assistent aufruft],
      [Auf kleinere Bildschirme achten],

      [T2],
      [Die Bildgenerierung war sehr flexibel und ist gut auf meine Anforderungen eingegangen],
      [Beim Übersetzen wurde der Vorgang durch den Knopf "Bestätigen" abgebrochen, weil noch nicht alle Texte reviewed wurden -- hier wäre eine Meldung gut],
      [Texte beim Übersetzen in einer Übersicht alle anzeigen, nicht nur zum Durchswitchen],

      [T3],
      [Hat sich gut angefühlt bei der Benutzung (10/10)],
      [Dass man runterscrollen muss, um manche Buttons zu sehen],
      [--],

      [T4],
      [Die Geschwindigkeit der Bildgenerierung],
      [Verhalten der Buttons interpretieren; zu viele Buttons; einige Buttons nicht auf Anhieb sichtbar],
      [--],

      [T5], [Der rote Faden], [Herunterscrollen ohne Indikator], [--],
      [T6], [--], [--], [--],
    ),
    caption: [Offene Rückmeldungen der Teilnehmer],
  ) <tab:offene_rueckmeldungen>

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
