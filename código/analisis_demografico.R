# Analisis demografico de Quality Alloys

library(readxl)
library(dplyr)
library(ggplot2)

demograficos <- read_excel(
  "data/Web_Analytics.xls",
  sheet = "Demographics",
  col_names = FALSE
)

View(demograficos)

fuentes_trafico <- demograficos[8:11, 2:3]

colnames(fuentes_trafico) <- c("Fuente", "Visitas")

fuentes_trafico$Visitas <- as.numeric(fuentes_trafico$Visitas)

View(fuentes_trafico)

fuentes_trafico <- fuentes_trafico %>%
  mutate(
    Porcentaje = round(Visitas / sum(Visitas) * 100, 1)
  )

View(fuentes_trafico)

grafico_fuentes <- ggplot(
  fuentes_trafico,
  aes(x = reorder(Fuente, Visitas), y = Visitas)
) +
  geom_col(fill = "#3D8DFF") +
  geom_text(
    aes(label = paste0(Porcentaje, "%")),
    hjust = -0.1
  ) +
  coord_flip() +
  scale_y_continuous(
    expand = expansion(mult = c(0, 0.15))
  ) +
  labs(
    title = "Fuentes de trafico del sitio web",
    x = NULL,
    y = "Numero de visitas"
  ) +
  theme_minimal()

grafico_fuentes

ggsave(
  "informe/grafico_fuentes_trafico.png",
  plot = grafico_fuentes,
  width = 9,
  height = 5,
  dpi = 300
)

# Diez principales sitios de referencia

sitios_referencia <- demograficos[15:24, 2:3]

colnames(sitios_referencia) <- c("Sitio", "Visitas")

sitios_referencia$Visitas <- as.numeric(
  sitios_referencia$Visitas
)

sitios_referencia <- sitios_referencia %>%
  mutate(
    Porcentaje = round(Visitas / sum(Visitas) * 100, 1)
  )

View(sitios_referencia)

# Funcion para preparar los demas grupos

preparar_datos <- function(fila_inicial, fila_final) {
  
  tabla <- demograficos[fila_inicial:fila_final, 2:3]
  
  colnames(tabla) <- c("Categoria", "Visitas")
  
  tabla$Visitas <- as.numeric(tabla$Visitas)
  
  tabla <- tabla %>%
    mutate(
      Porcentaje = round(Visitas / sum(Visitas) * 100, 1)
    )
  
  return(tabla)
}


# Funcion para crear graficos

crear_grafico <- function(datos, titulo, color) {
  
  ggplot(
    datos,
    aes(x = reorder(Categoria, Visitas), y = Visitas)
  ) +
    geom_col(fill = color) +
    geom_text(
      aes(label = paste0(Porcentaje, "%")),
      hjust = -0.1
    ) +
    coord_flip() +
    scale_y_continuous(
      expand = expansion(mult = c(0, 0.20))
    ) +
    labs(
      title = titulo,
      x = NULL,
      y = "Numero de visitas"
    ) +
    theme_minimal()
}


# Preparar los cinco grupos restantes

colnames(sitios_referencia)[1] <- "Categoria"

motores_busqueda <- preparar_datos(28, 37)
regiones <- preparar_datos(41, 50)
navegadores <- preparar_datos(55, 64)
sistemas_operativos <- preparar_datos(69, 78)


# Crear los cinco graficos

grafico_referencias <- crear_grafico(
  sitios_referencia,
  "Principales sitios de referencia",
  "#3D8DFF"
)

grafico_busqueda <- crear_grafico(
  motores_busqueda,
  "Motores de busqueda",
  "#6DCBF4"
)

grafico_regiones <- crear_grafico(
  regiones,
  "Origen geografico de las visitas",
  "#F6B94A"
)

grafico_navegadores <- crear_grafico(
  navegadores,
  "Navegadores utilizados",
  "#7F8C8D"
)

grafico_sistemas <- crear_grafico(
  sistemas_operativos,
  "Sistemas operativos utilizados",
  "#8E44AD"
)


# Guardar los cinco graficos

ggsave(
  "informe/grafico_sitios_referencia.png",
  grafico_referencias,
  width = 9, height = 5, dpi = 300
)

ggsave(
  "informe/grafico_motores_busqueda.png",
  grafico_busqueda,
  width = 9, height = 5, dpi = 300
)

ggsave(
  "informe/grafico_regiones.png",
  grafico_regiones,
  width = 9, height = 5, dpi = 300
)

ggsave(
  "informe/grafico_navegadores.png",
  grafico_navegadores,
  width = 9, height = 5, dpi = 300
)

ggsave(
  "informe/grafico_sistemas_operativos.png",
  grafico_sistemas,
  width = 9, height = 5, dpi = 300
)

grafico_referencias