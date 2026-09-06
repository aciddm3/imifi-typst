// === beamerSFU.typ ===
// Шаблон презентации в стиле СФУ (адаптация beamerSFU-VKR.sty)
#import "@preview/polylux:0.4.0": *

#let IMorange = rgb("#fc2200")      // RGB(252, 34, 0)
#let IMtext_orange = rgb("#cc0000")
#let IMgray = rgb("#474646")        // RGB(71, 70, 70)
#let IMblue = rgb("#0000ff")        // от \bluetext
#let IMvery_light_gray = rgb("#f2f2f2")

/// Блок с бортиками, стилизованными под тень
/// 
/// - inset ():  минимальное расстояние от контента до краёв
/// - radius (): радиус скругления углов
/// - content (): содержимое
/// -> 
#let shadow_box(inset: 14pt, radius: 16pt, content) = box(
  width: 100%,
  radius: radius,
  inset: inset,
  stroke: 3pt
    + gradient.linear(
      angle: 60deg,
      (rgb(0, 0, 0, 0), 0%),
      (rgb(0, 0, 0, 0), 30%),
      (rgb(0, 0, 0, 60%), 100%),
    ),
)[#content]

#let block(title: "", body) = shadow_box(inset: 0pt, radius: 0pt, stack(
  dir: ttb,
  rect(width: 100%, fill: IMgray)[#text(fill: white, title)],
  rect(width: 100%, stroke: none)[#body],
))

#let bluetext(body) = text(fill: IMblue)[#body]

#let IMslide(
  slide_title: none,
  subtitle: none,
  author: "",
  content,
) = {
  set page(
    paper: "presentation-16-9",
    margin: (x: 0.0cm, y: 0.0cm),
  )
  set list(
    marker: [--], // аналог label=--
    indent: 1.5em,
  )

  set enum(
    numbering: id => text()[#id)],
    indent: 1.5em,
  )
  slide(
    grid(
      rows: (3.2cm, 1fr, 1.0cm),
      columns: 100%,
      gutter: 0pt,

      // Верхняя часть слайда: шапка и название
      stack(
        grid(
          columns: (1fr, 1fr),
          rect(
            fill: IMgray,
            stroke: none,
            inset: (x: 0.8cm, y: 0.3cm),
            height: 20%,
            width: 100%,
          ),
          rect(
            fill: IMorange,
            stroke: none,
            inset: (x: 0.8cm, y: 0.3cm),
            height: 20%,
            width: 100%,
          ),
        ),
        rect(
          fill: IMvery_light_gray,
          stroke: none,
          inset: (x: 0.8cm, y: 0.3cm),
          align(horizon, text(fill: IMtext_orange, size: 20pt, slide_title)),
          height: 60%,
          width: 100%,
        ),
      ),

      // Контент слайда
      align(horizon, grid(
        columns: (0.8cm, 1fr, 0.8cm),
        [], content, [],
      )),

      // низ слайда
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
  set text(fill: black)
  slide(
    grid(
      columns: 100%,
      rows: (auto, 1fr, auto, 1fr, auto, 1fr, auto, 1fr, auto, 1fr, auto),
      gutter: 0pt,
      align: center + horizon,


      text(size: 24pt)[#institute],
      [],


      shadow_box(
        text(size: 28pt, weight: "bold", title),
      ),

      [],

      // 3. Автор
      text(size: 28pt, weight: "bold")[#author],
      [],

      // 4. Направление подготовки
      text(size: 21pt)[Направление #direction],
      [],
      text(size: 21pt, if reviewer != none {
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
      }),
      text(size: 17pt)[#town],
      text(size: 17pt)[#date],
    ),
  )
}

#let thank_you_slide = slide[
  #align(horizon + center)[
    #text(size: 48pt, "Спасибо за внимание!")
  ]

]
