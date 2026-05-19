#import "@preview/polylux:0.4.0": *
#import "imifi-lib.typ": *



#let author = "Умнов У.У" // автор
#let title = "Блиб-блаб, дубадубадаб" // Полное название работы
#let subtitle = "Бли-блаб" // Сокращённое название работы
#let current_year = datetime.today().display("[year]") // Настоящий год
#let direction = "01.03.02 Прикладная математика и информатика" // Направление обучения
#let institute = "ФГАОУ ВО «Сибирский федеральный университет»
Институт математики и фундаментальной информатики
Кафедра высшей и прикладной математики" // Учебное заведение
#let supervisor = "Хакатон Х. Х." // Научный руководитель
#let town = "Красноярск" // Город

#set page(
  paper: "presentation-16-9",
  margin: (x: 0.8cm, y: 0.8cm),
)

#set text(
  font: "DIN pro",
  size: 16pt,
  lang: "ru",
  hyphenate: true,
)

#set text(fill: IMgray)

#IMtitle(
  author: author,
  title: title,
  direction: direction,
  institute: institute,
  supervisor: supervisor,
  date: current_year,
  town: town,
)

#IMslide(author: author, slide_title: "Слайд", subtitle: subtitle)[
  #quote(lorem(15))

  Преобразованием Фурье функции $f$ называют оператор $F$:
  #align(center)[
    #text(size: 45pt)[
      $F[f](omega) = frac(1, sqrt(2pi)) integral_(-oo)^(+oo)f(t) e^(-i omega t) d t$
    ]
  ]
]

#IMslide(author: author, slide_title: "Слайд", subtitle: subtitle)[
  #for value in (1,2,3,4,5) {
    text(size: value * 10pt)[
      $F[f](omega) = frac(1, sqrt(2pi)) integral_(-oo)^(+oo)f(t) e^(-i omega t) d t$

    ]
  }
]

#thank_you_slide
