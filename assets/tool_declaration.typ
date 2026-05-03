#let __strings = (
  title: (
    en: "Declaration of Auxiliary Tools",
    de: "Hilfsmittelverzeichnis",
  ),
  intro: (
    en: "The following Artificial Intelligence (AI) based systems were used in the preparation of this thesis in the manner described:",
    de: "Bei der Erstellung der Arbeit wurden die folgenden auf Künstlicher Intelligenz (KI) basierende Systeme in der beschriebenen Weise benutzt:",
  ),
  col-step: (en: "Work Step", de: "Arbeitsschritt"),
  col-systems: (en: "AI System(s) Used", de: "Eingesetzte(s)
    KI-System(e)"),
  col-description: (en: "Description of Use", de: "Beschreibung der Verwendungsweise"),
  col-parts: (en: "Affected Parts", de: "Betroffene Teile der Arbeit"),
  row-ideation: (en: "Idea generation and conception", de: "Generierung von Ideen und Konzeption der Arbeit"),
  row-lit-search: (en: "Literature search", de: "Literatursuche"),
  row-lit-review: (en: "Literature analysis", de: "Literaturanalyse"),
  row-references: (en: "Reference management and citation", de: "Literaturverwaltung und Zitationsmanagement"),
  row-methods: (en: "Selection of methods and models", de: "Auswahl von Methoden und Modellen"),
  row-data: (en: "Data collection and analysis", de: "Datensammlung und -analyse"),
  row-code: (en: "Code generation", de: "Generierung von Programmcodes"),
  row-viz: (en: "Creation of visualizations", de: "Erstellung von Visualisierungen"),
  row-interpret: (en: "Interpretation and validation", de: "Interpretation und Validierung"),
  row-structure: (en: "Structuring of thesis text", de: "Strukturierung Texts der Arbeit"),
  row-formulate: (en: "Formulation of thesis text", de: "Formulierung des Texts der Arbeit"),
  row-other: (en: "Other", de: "Sonstiges"),
)

#let toolDeclarationWith(lang: "en") = [
  #let s(key) = __strings.at(key).at(lang)

  == #s("title") <hilfsmittelverzeichnis>

  #s("intro")

  // Fill your KI usage Information here
  #table(
    columns: 4,
    table.header([*#s("col-step")*], [*#s("col-systems")*], [*#s("col-description")*], [*#s("col-parts")*]),
    [#s("row-ideation")], [-], [-], [-],
    [#s("row-lit-search")], [Elicit], [Ergänzende Literatursuche], [-],
    [#s("row-lit-review")], [-], [-], [-],
    [#s("row-references")], [NotebookLM], [Organisierung von Quellen], [-],
    [#s("row-methods")], [Claude 4.5], [Hilfe bei der Planung der Methodik der Evaluation], [Kapitel 5: Evaluation],
    [#s("row-data")],
    [Claude 4.5],
    [Bereinigung der Transkripte der Experteninterviews/ Brainstorming-Sitzung],
    [Kapitel 3: Konzeption, Kapitel 5: Evaluation],

    [#s("row-code")], [Claude 4.5], [Unterstützung bei der Entwicklung], [Kapitel 4: Implementierung],
    [#s("row-viz")], [-], [-], [-],
    [#s("row-interpret")], [-], [-], [-],
    [#s("row-structure")], [-], [-], [-],
    [#s("row-formulate")], [Claude 4.5], [Verbesserung von Formulierungen], [-],
    [#s("row-other")], [-], [-], [-],
  )
]
