// LTeX: enabled=false
#import "template.typ": project, caption_with_source

#show: project.with(

  // ── Language ───────────────────────────────────────────────────────────────
  // "en" for English, "de" for German.
  lang: "de",

  // ── Submission options ─────────────────────────────────────────────────────
  // Remove confidentiality clause by setting to false
  confidentiality_clause: true,

  // ── Cover page ─────────────────────────────────────────────────────────────
  title_long:  "Konzeptionierung und prototypische Implementierung eines Ansatzes zur Qualitätssicherung und Freigabe multimodaler KI-Agenten-generierter Inhalte mittels menschlicher Validierung",
  title_short: "",
  thesis_type: "Bachelorarbeit",
  faculty:     "Wirtschaftsfakultät",
  program:     "Wirtschaftsinformatik",

  firstname:            "Jonas",
  lastname:             "Röber",
  course:               "WWI23B1",
  signature_place:      "Karlsruhe",
  submission_date:      "04.04.2026",

  partner_company:      "SAP SE",
  supervisor_university: "Eugenie Giesbrecht",

  // ── Degree statement ───────────────────────────────────────────────────────
  degree:        "Bachelor of Science (B. Sc.)",

  // ── Bibliography ───────────────────────────────────────────────────────────
  // Accepts a single path or an array: ("refs.bib", "more.yaml")
  library_paths: "refs.bib",

  // ── Abstract ───────────────────────────────────────────────────────────
  abstract: (
    ("de", include("abstract/abstract_german.typ")),
    ("en", include("abstract/abstract_english.typ"))
  ),

  // ── Acronyms ───────────────────────────────────────────────────────────────
  // List of acronyms for the abbreviation list.
  // Reference them in text with @key
  // acronyms: (
  //   (key: "API", short: "API", long: "Application Programming Interface"),
  // ),
  acronyms: (
    
    (key: "A2UI", short: "A2UI", long:"Agent to UI"),
    (key: "AI", short: "AI", long: "Artificial Intelligence"),
    (key: "KI", short: "KI", long: "Künstliche Intelligenz"),
    (key: "ABAP", short: "ABAP", long: "Advanced Business Application Programming"),
    (key: "ADT", short: "ADT", long: "ABAP Development Tools"),
    (key: "API", short: "API", long: "Application Programming Interface"),
    (key: "CatMan", short: "CatMan", long: "Catalog Manager"),
    (key: "CoT", short: "CoT", long: "Chain-of-Thought"),
    (key: "GenAI", short: "GenAI", long: "Generative AI"),
    (key: "GenUI", short: "GenUI", long: "Generative UI"),
    (key: "GUI", short: "GUI", long: "Graphical User Interface"),
    (key: "HITL", short: "HITL", long: "Human In The Loop"),
    (key: "HTTP", short: "HTTP", long: "Hypertext Transfer Protocol"),
    (key: "IDE", short: "IDE", long: "Integrated Development Environment"),
    (key: "ISO", short: "ISO", long: "International Organization for Standardization"),
    (key: "JSON", short: "JSON", long: "JavaScript Object Notation"),
    (key: "LLM", short: "LLM", long: "Large Language Model"),
    (key: "ML", short: "ML", long: "Machine Learning"),
    (key: "MAS", short: "MAS", long: "Multi-Agent Systems"),
    (key: "NWA", short: "NWA", long: "Nutzwertanalyse"),
    (key: "OData", short: "OData", long: "Open Data Protocol"),
    (key: "PPR", short: "PPR", long: "Personalized Page Rank"),
    (key: "T2I", short: "T2I", long: "Text-to-Image"),
    (key: "RAP", short: "RAP", long: "RESTful ABAP Programming Model"),
    (key: "REST", short: "REST", long: "Representational State Transfer"),
    (key: "SUS", short: "SUS", long: "System Usability Scale"),
    (key: "UI", short: "UI", long: "User Interface"),
    (key: "UX", short: "UX", long: "User Experience"),
    (key: "WCAG", short: "WCAG", long: "Web Content Accessibility Guidelines"),
  ),

)

// ── Additional imports ─────────────────────────────────────────────────────
#import "@preview/drafting:0.2.2": *

// LTeX: enabled=true

// ── Chapters ───────────────────────────────────────────────────────────────
#include "chapters/chapter1.typ"
#include "chapters/chapter2.typ"
#include "chapters/chapter3.typ"
#include "chapters/chapter4.typ"
#include "chapters/chapter5.typ"
#include "chapters/chapter6.typ"
// add more chapters as you need
