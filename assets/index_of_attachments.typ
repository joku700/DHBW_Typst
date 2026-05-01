#let __strings = (
  title: (
    en: "Index of Attachments",
    de: "Beigabenverzeichnis",
  ),
  source-texts:   (en: "Source texts",          de: "Quelltexte"),
  project-docs:   (en: "Project documentation", de: "Projektdokumentationen"),
  electronic:     (en: "Electronic sources",    de: "Elektronische Quellen"),
  misc:           (en: "Miscellaneous",         de: "Sonstiges"),
)

#let indexOfAttachmentsWith(lang: "en") = [
  #let s(key) = __strings.at(key).at(lang)

  #set heading(numbering: none)
  = #s("title")

  #set enum(numbering: "1.1.", full: true)

// structure your attachment like so 
// + Source texts
//    + source_code_1
//    + source_code_2
// + Project documentation
//    + documentation_1
// ...

  + #s("source-texts") 
  + #s("project-docs") 
  + #s("electronic") 
  + #s("misc") 
]
