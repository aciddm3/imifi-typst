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
  fill: black,
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
    #text(size: 20pt)[
      $ F[f](omega) = frac(1, sqrt(2pi)) integral_(-oo)^(+oo)f(t) e^(-i omega t) d t $
    ]
  ]
]

#IMslide(author: author, slide_title: "Слайд", subtitle: subtitle)[
  #for value in range(1, 6).map(it => it * 10pt) {
    text(size: value)[
      $F[f](omega) = frac(1, sqrt(2pi)) integral_(-oo)^(+oo)f(t) e^(-i omega t) d t$
    ]
    [
      размер : #value

    ]
  }
]

#IMslide(author: author, slide_title: "Слайд с проверкой списков и перечислений", subtitle: subtitle)[
  Что должно быть доступно в РФ?
  - Хлеб,
  - Молоко,
  - Соль,
  - Мясо,
  - ...

  Топ 3 лучших исполнителей 2027
  + Erian
  + dj Arbuz
  + Ampersand

]

#IMslide(author: author, slide_title: "Тест блоков текста", subtitle: subtitle)[
  #block(title: "Теорема")[
    #let sgn = $"sgn"$
    #let mif = $"if"$
    #let otherwise = $"otherwise"$
    Функция $ sgn(x) = cases(
      1 &mif x > 0, 
      0 &mif x = 0, 
      -1 &mif x < 0) $ чётна и почти всюду дифференцируема.
  ]
  #block(title: "Доказательство")[
    Чётность очевидна.

    Дифференцируемость почти всюду исходит из того, что:
    + функция константна, кроме точки $x=0$
    + константа дифференцируема
    + ${0}$ имеет меру $0$
  ]
]

#IMslide(author: author, slide_title: "Тест shadow gradient", subtitle: subtitle)[
  #shadow_box()[content]
]

#thank_you_slide
