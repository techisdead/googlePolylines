% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Utils_sf.R
\name{geometryRow}
\alias{geometryRow}
\title{Geometry Row}
\usage{
geometryRow(x, geometry = c("POINT", "LINESTRING", "POLYGON"))
}
\arguments{
\item{x}{\code{sfencoded} object}

\item{geometry}{the specific geometry to extract}
}
\value{
the row indeces for the requested geometry
}
\description{
Extracts specific geometry rows of an \code{sfencoded} object
}
\examples{
\dontrun{

df <- data.frame(myId = c(1,1,1,1,1,1,1,1,2,2,2,2),
	lineId = c(1,1,1,1,2,2,2,2,1,1,1,2),
	lon = c(-80.190,-66.118,-64.757,-80.190,-70.579,-67.514,-66.668,-70.579,-70,-49,-51,-70),
	lat = c(26.774, 18.466, 32.321, 26.774, 28.745, 29.570, 27.339, 28.745, 22, 23, 22, 22))

p1 <- as.matrix(df[1:4, c("lon", "lat")])
p2 <- as.matrix(df[5:8, c("lon", "lat")])
p3 <- as.matrix(df[9:12, c("lon", "lat")])

point <- sf::st_sfc(sf::st_point(x = c(df[1,"lon"], df[1,"lat"])))
multipoint <- sf::st_sfc(sf::st_multipoint(x = as.matrix(df[1:2, c("lon", "lat")])))
polygon <- sf::st_sfc(sf::st_polygon(x = list(p1, p2)))
linestring <- sf::st_sfc(sf::st_linestring(p3))
multilinestring <- sf::st_sfc(sf::st_multilinestring(list(p1, p2)))
multipolygon <- sf::st_sfc(sf::st_multipolygon(x = list(list(p1, p2), list(p3))))

sf <- rbind(
	st_sf(geo = polygon),
	st_sf(geo = multilinestring),
	st_sf(geo = linestring),
	st_sf(geo = point)
	)

encode(sf)

enc <- encode(sf)
geometryRow(enc, "POINT")
geometryRow(enc, "LINESTRING")
geometryRow(enc, "POLYGON")

}

}
