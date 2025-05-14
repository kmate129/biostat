# Adatbázis beolvasása
db <- read.table("biostat/SimData7.csv", header=TRUE, sep=";", dec=",", stringsAsFactors=FALSE)

# 1. feladat
# Választott kategoriális változó: szemszín

# Gyakorisági sor

gyak_sor <- table(db$EyeColour)

# Relatív gyakoriság

prop.table(gyak_sor)

# Oszlopdiagram

barplot(gyak_sor, main="Szemszín szerinti megoszlás", ylab = "Gyakoriság [fő]", ylim = c(0, 60))

# Választott folytonos változó: testsúly

# Osztályközös gyakorisági sor

min_from <- floor(min(db$BodyWeight) / 10) * 10
max_to <- ceiling(max(db$BodyWeight) / 10) * 10
table(cut(db$BodyWeight, seq(min_from,max_to, 10)))

# KDE

Grafikusan is megszeretném jeleníteni, viszont nem a hisztrogramot választottam, mivel tulajdonsképpen hasonló osztályközött gyakorisági sort kapnék: osztályonként konstans becslés, osztályközt kell választani.
Ehelyett magfüggvényes sűrűségbecslőt használok, mert folytonos változót jobban prezentálhat egy folytonos függvény. Lényegében ugyanazt az eloszlást becsli, mint a hisztogram.



mean_weight <- mean(db$BodyWeight)
sd_weight <- sd(db$BodyWeight)

# 3. feladat

# Kiszámítjuk a mintanagyságot
n <- length(db$BodyWeight)

# 95%-os konfidenciaintervallum számítása t-eloszlás alapján
error_margin <- qt(0.95, df=n-1) * (sd_weight / sqrt(n))
lower_bound <- mean_weight - error_margin
upper_bound <- mean_weight + error_margin

