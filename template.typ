#let heiti = ("Times New Roman", "Heiti SC", "Heiti TC")
#let songti = ("Times New Roman", "Songti SC")
#let kaiti = ("Times New Roman", "Kaiti SC")


#let content() = {
  v(1em)
  align(center)[
    #text(font: songti, size: 16pt, "目    录")
  ]

  parbreak();

  set text(font: songti, size: 12pt)
  [摘要] + [.] * 144  + [ 1]
  parbreak()

  text(font:songti)[ABSTRACT] + [.] * 133 + [2]

  show outline: it => {
    set text(font: songti, size: 12pt)
    set par(leading: 1.5em )
    it
  }
  outline(
    title: none
  )
}


// 中文摘要页
#let zh_abstract_page(abstract,  keywords:(),title) = {
  v(2em)
  align(center)[
    #text(font:heiti, size:26pt)[#title]
    #v(26pt)
    #text(font:heiti, size:18pt)[摘要]
  ]

  set text(font: songti, size: 12pt)
  set par(leading: 1.5em, first-line-indent: 2em)
  show par: it => {
    it
    v(5pt)
  }
  abstract
  par(first-line-indent: 0em)[
    #text(weight: "bold", font: songti, size: 12pt)[
      关键词： ]
    #text(font: songti, size: 12pt)[#keywords.join("；") ]
    ]
}

#let en_abstract_page(abstract, keywords:()) = {
  v(2em)

  align(center)[
    #text( font: heiti, size: 18pt, "Abstract")
  ]

  set text(font: songti, size: 12pt)
  set par(justify: false, leading: 1.5em, first-line-indent: 2em)
  show par: it => {
    it
    v(5pt)
  }

  abstract
  par(first-line-indent: 0em)[
    #text(font: heiti, size: 12pt, weight: "bold")[
      Keywords: ]
    #text(font: heiti, size: 12pt)[#keywords.join("; ") ]
    ]
}


#let Thesis(
  title : "",
  college : "",
  major : "",
  id : "",
  name : "",
  teacher : "" ,
  data : "" ,
  abstract_zh : [],
  abstract_en : [],
  keywords_zh : (),
  keywords_en : (),
  body,
) = {
  set page(paper:  "a4",
           margin: (
              top: 2.54cm,
              bottom: 2.54cm,
              left: 2.5cm,
              right: 2cm),
  )

  // 封面
  align(center)[
    #v(20pt)

    #table(
      columns: (140pt, auto, auto),
      align: horizon,
      stroke: none,
      [],
      [#image("assets/schoolname.png", width: 120%, height: 9%)],
      [#image("assets/logo.png", width: 40%)]     
    )
    

    #table(
      columns: (auto),
      rows: (auto, auto ,auto),
      stroke: none,
      gutter: 9pt,

      text(
        font: "Times New Roman",
        size: 18pt,
        weight: "bold"
      )[SHANGHAI  UNIVERSITY],

      text(
        font: songti,
        size: 36pt,
      )[毕业论文（设计）],

      text(
        font: "Times New Roman",
        size: 16pt,
        weight: "bold"
      )[UNDERGRADUATE  THESIS (PROJECT)]
    )

    #v(60pt)

    #text(
      font : kaiti,
      size : 18pt,
      bottom-edge: "descender"
    )[题 目： #underline(extent: 6pt)[#title]]
    
    #v(100pt)

    #let info_value(body) = {
      rect(
        width: 100%,
        inset: 2pt,
        stroke: (
          bottom: 1pt + black
        ),
        text(
          font: songti,
          size: 18pt,
          weight: "medium",
          bottom-edge: "descender"
        )[
          #body
        ]
      ) 
    }
    
    #let info_key(body) = {
      rect(width: 100%, inset: 2pt, 
       stroke: none,
       text(
        font: heiti,
        size: 18pt,
        weight: "bold",
        overhang: false,
        body
      ))
    }

    #grid(
      columns: (80pt, 180pt),
      rows : (35pt, 35pt),
      //gutter: 3pt,
     // row : (auto ,auto, auto, auto, auto, auto),
      info_key("学　　院"),
      info_value(college),
      info_key("专　　业"),
      info_value(major),
      info_key("学　　号"),
      info_value(id),
      info_key("学生姓名"),
      info_value(name),
      info_key("指导老师"),
      info_value(teacher),
      info_key("起讫日期"),   
      info_value(data)
    )
  ]

  // 目录
  pagebreak()
  content()
  
  // 置计数器
  counter(page).update(1)

  // 中文摘要
  pagebreak()
  zh_abstract_page(abstract_zh,title,keywords : keywords_zh)

  //英文摘要
  pagebreak() 
  en_abstract_page(abstract_en,keywords :keywords_en)
  pagebreak()

  // 设置标题格式
  set heading(numbering: (..nums) => {
    nums.pos().map(str).join(".") + "　"
  })

  // 设置一级标题格式
  // TODO: 一级标题应为 第N章 题目
  show heading.where(level : 1) : it => {
    set align(center)
    set text(font:heiti, size: 18pt, weight: "bold" )
    it.body
  }

  // 二级标题格式
  show heading.where(level : 2) : it => {
    set text(font:heiti, size: 14pt, weight: "bold" )
    it
  }

  show heading: it => {
    set text(font:heiti, size: 12pt, weight: "bold" )
    it
  } + box(width: 1.8em)
  
  
  // 设置正文格式
  set text(font: songti, size:12pt)
  set par(justify: false, leading: 1.5em, first-line-indent: 2em)
  show par : it => {
    it 
    v(5pt)
  }

  body  

}
