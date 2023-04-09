// 封面
#import "font.typ" : *
#import "../body/info.typ" : *

#align(center)[
  #v(20pt)

  #table(
    columns: (140pt, auto, auto),
    align: horizon,
    stroke: none,
    [],
    [#image("../assets/schoolname.png", width: 120%, height: 9%)],
    [#image("../assets/logo.png", width: 40%)]     
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