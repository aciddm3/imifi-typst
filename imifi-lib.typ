// === beamerSFU.typ ===
// Шаблон презентации в стиле СФУ (адаптация beamerSFU-VKR.sty)

// =====================================================
// 1. ЦВЕТА (из оригинала)
// =====================================================
#import "@preview/polylux:0.4.0": *

#let IMorange = rgb("#fc2200")      // RGB(252, 34, 0)
#let IMgray = rgb("#474646")        // RGB(71, 70, 70)
#let IMblue = rgb("#0000ff")        // для \bluetext


#set page(
  paper: "presentation-16-9",
  margin: (x: 0.8cm, y: 0.8cm),
)

#set text(
  font: "DejaVu Sans",
  size: 11pt,
  lang: "ru",
  hyphenate: true,
)

#set text(fill: IMgray)

#show heading: it => {
  set text(fill: IMgray, weight: "bold")
  if it.level == 1 {
    set text(size: 28pt)
  } else if it.level == 2 {
    set text(size: 22pt)
  }
  it.body
}

#set list(
  marker: [--], // аналог label=--
  indent: 1.5em,
)

#set enum(
  numbering: "{1})", // 1), 2), ...
  indent: 1.5em,
)

#let block(title: none, body) = {
  rect(
    fill: IMgray,
    inset: 8pt,
    radius: 3pt,
    [
      #if title != none {
        text(fill: white, weight: "bold", size: 14pt)[#title]
        v(4pt)
        line(stroke: white)
        v(4pt)
      }
      #body
    ],
  )
}

#let alert(body) = text(fill: IMorange)[#body]
#let bluetext(body) = text(fill: IMblue)[#body]

#let IMslide(
  slide_title: none,
  subtitle: none,
  author: "",
  content,
) = {
  slide(
    grid(
      rows: (1.6cm, 1fr, 1.0cm),
      columns: 100%,
      gutter: 0pt,

      if slide_title != none {
        rect(
          fill: IMgray,
          inset: (x: 0.8cm, y: 0.3cm),
          text(fill: white, size: 20pt, weight: "bold")[#slide_title],
          height: 100%,
          width: 100%,
        )
      },

      align(horizon, content),

      grid(
        rows: 1fr,
        columns: (15%, 55%, 30%),
        gutter: 0pt,
        rect(fill: white, inset: (left: 0.3cm), align(left + horizon)[
          #image("assets/IMfoot.png", height: 1.5em)
        ]),
        rect(fill: IMgray, inset: 0.1cm, height: 100%, width: 100%, align(center + horizon)[
          #text(fill: white, size: 9pt)[#subtitle]
        ]),
        rect(fill: IMorange, inset: (right: 0.3cm), height: 100%, width: 100%, align(right + horizon)[
          #text(fill: white, size: 9pt)[
            #grid(
              columns: (1fr, 1fr),
              align(left, author),
              context {
                [#counter(page).display() / #counter(page).final().at(0)]
              },
            )]
        ]),
      )
    ),
  )
}

#let IMtitle(
  title: "",
  author: "",
  institute: "",
  direction: "",
  supervisor: "",
  town: "",
  reviewer: none,
  date: datetime.today().display("[day].[month].[year]"),
) = {
  slide(
    grid(
      columns: 100%,
      // auto = под контент, 1fr = "растяжимый" отступ (аналог \vfill)
      rows: (auto, 1fr, auto, 1fr, auto, 1fr, auto, 1fr, auto, 1fr, auto),
      gutter: 0pt,
      align: center + horizon,

      // 1. Институт
      text(size: 16pt)[#institute],
      [],

      // 2. Заголовок (в цветном блоке как в \begin{block}{})
      rect(
        stroke: IMgray,
        inset: 14pt,
        radius: 4pt,
        width: 100%,
        text(size: 26pt, weight: "bold")[#title],
      ),
      [],

      // 3. Автор
      text(size: 20pt, weight: "bold")[#author],
      [],

      // 4. Направление подготовки
      text(size: 14pt)[Направление #direction],
      [],

      // 5. Научный руководитель / Рецензент (таблица lr как в оригинале)
      if reviewer != none {
        grid(
          columns: 2,
          column-gutter: 2.5em,
          align: (left, right),
          [Научный руководитель], [#supervisor],
          [Рецензент], [#reviewer],
        )
      } else {
        grid(
          columns: 2,
          column-gutter: 2.5em,
          align: (left, right),
          [Научный руководитель], [#supervisor],
        )
      },
      // Город
      town,

      // 6. Дата
      text(size: 10pt)[#date],
    ),
  )
}

#let thank_you_slide = slide[
  #align(horizon + center)[
    #text(size: 24pt, "Спасибо за внимание!")
    #image("assets/IMLogo.png")
  ]
]
