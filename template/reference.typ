#import "font.typ" : *

#let bibliography-file = "../body/refs.bib"
  // 展示参考文献

#if bibliography-file != none {
    show bibliography: set text(10pt)
    show heading : it => {
      set align(center)
      set text(font:heiti, size: 18pt, weight: "bold")
      it
    }
    bibliography(bibliography-file,
        title: [参考文献],
        style: "ieee")
  }