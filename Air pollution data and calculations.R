# ==============================================================================
# PROJECT: Vilnius Air Pollution and Traffic Analysis (March 21 - April 8, 2026)
# ==============================================================================

# 1. DATA PREPARATION ----------------------------------------------------------

# Air pollution data (PM2.5 / PM10 levels) across 21 monitoring stations in Vilnius
oro <- data.frame(
  row.names = c("2026-03-21", "2026-03-22", "2026-03-23", "2026-03-24", "2026-03-25", "2026-03-26", "2026-03-27", "2026-03-28", "2026-03-29", "2026-03-30",
                "2026-03-31", "2026-04-01", "2026-04-02", "2026-04-03", "2026-04-04", "2026-04-05", "2026-04-06", "2026-04-07", "2026-04-08"),
  
  Pašilaičiai      = c(43, 31, 26, 55, 61, 51, 2, 22, 31, 28, 26, 5, NA, 19, 19, NA, NA, 2, 2),
  Baltupiai        = c(58, 56, 52, 66, 75, 23, 26, 52, 57, 53, NA, 24, 26, 45, 37, 21, 12, 4, 19),
  Pramogų_arena    = c(46, 87, 108, 89, 91, 74, 37, 58, 67, 60, 56, 50, 51, 61, 53, NA, NA, 22, 27),
  Žirmūnai         = c(56, 54, 52, 63, 69, 17, 40, 52, 56, 52, 41, 40, 31, 49, 44, 29, 20, 9, 22),
  Taikos_progimnazija = c(55, 56, 52, 65, 74, 16, 28, 53, 56, 55, 47, 26, 27, 52, 41, 22, 17, 11, 19),
  Saltoniškės      = c(48, 49, 41, 59, 67, 11, 21, 44, 52, 45, 33, 18, 22, 38, 29, 17, 9, 2, 17),
  Karoliniškės     = c(49, 52, 48, 60, 68, 20, 21, 47, 54, 52, 37, 24, 23, 45, 31, 21, 12, 3, 16),
  
  Joachimo_gimnazija = c(50, 51, 45, 59, 69, 66, 12, 52, 27, 44, 51, 46, 31, 22, 41, 39, 28, 18, 11),
  Antakalnis       = c(55, 53, 48, 62, 70, 18, 28, 51, 55, 51, 34, 25, 23, 43, 36, 21, 13, 1, 19),
  Naujamiestis     = c(51, 52, 47, 61, 68, 47, 23, 49, 52, 50, 33, 21, 22, 41, 29, 17, 6, 5, 14),
  Senamiestis      = c(16, 44, 51, 45, 40, 35, 17, 26, 33, 33, 24, 19, 20, 66, 64, NA, NA, 53, 13),
  
  Lazdynai_S       = c(27, 36, 36, 34, 41, 27, 26, 33, 50, 55, 56, 39, 50, 53, 25, NA, NA, 33, 26),
  Lazdynai_P       = c(54, 54, 52, 68, 76, 11, 25, 52, 55, 54, 39, 27, 27, 48, 33, 20, 7, 6, 16),
  Vilkpedė         = c(10, 43, 58, 49, 40, 30, 31, 49, 58, 56, 66, 53, 56, 64, 58, NA, NA, 28, 6),
  Stepono_sodas    = c(62, 68, 60, 86, 97, 35, 55, 60, 60, 64, 55, 28, 22, 62, 66, 22, 44, 27, 33),
  Naujininkai      = c(51, 52, 51, 62, 68, 54, 29, 51, 54, 52, 37, 26, 26, 45, 31, 21, 15, 2, 21),
  
  Nugaletojų_g.    = c(50, 50, 39, 66, 77, 23, 22, 39, 53, 33, 35, 11, 11, 22, 39, 11, 11, 21, 11),
  Kalneniai_Italų_g. = c(45, 39, 41, 66, 69, 32, 42, 48, 41, 42, 41, 14, 9, 39, 48, 9, 17, 29, 11),
  Anglų_g.         = c(58, 55, 50, NA, 82, 40, 44, 53, 55, 55, 51, 22, 11, 44, 55, 11, 17, 27, 22),
  Lukšinės_g.      = c(55, 42, 33, 66, 74, 60, 21, 52, 47, 52, 19, 17, 17, 43, 33, 24, 6, 6, 11),
  Aušros_Vartų_g.  = c(48, 50, 42, 60, 67, 25, 23, 43, 51, 44, 32, 20, 22, 41, 31, 20, 11, 3, 15)
)

# Macro-environmental and meteorological vectors (daily values)
v  <- c(0.8, 1.1, 1.3, 1.7, 5.6, 2, 1.8, 1.4, 0.6, 1.3, 2.8, 2.4, 1.4, 0.5, 6.8, 3.1, 4.4, 3.5, 2.8)    # Wind speed (m/s)
o  <- c(6.6, 9.1, 10, 9.1, 12.6, 5.4, 8.3, 11.9, 12.2, 12.1, 5.5, 9.5, 10.4,	9.1, 5.2, 11.5, 3.5, 3.8, 5.7) # Temperature (°C)
vk <- c(161, 222, 294, 198, 165, 17, 330, 10, 279, 32, 333, 339, 332, 241, 274, 167, 256, 331, 351)    # Wind direction (degrees)
d  <- c(70, 45, 43, 52, 37, 76, 47, 40, 45, 53, 90, 48, 33, 41, 79, 47, 86, 84, 48)                    # Relative air humidity (%)

# Traffic dataset: Daily vehicle counts on major adjacent streets/lanes
au <- data.frame(
  row.names = c("2026-03-21", "2026-03-22", "2026-03-23", "2026-03-24", "2026-03-25", "2026-03-26", "2026-03-27", "2026-03-28", "2026-03-29", "2026-03-30",
                "2026-03-31", "2026-04-01", "2026-04-02", "2026-04-03", "2026-04-04", "2026-04-05", "2026-04-06", "2026-04-07", "2026-04-08"),
  
  Kareivių_g.n = c(1090, 1001, 879, 591, 756, 929, 1175, 977, 1102, 958, NA, 946, 1196, 1241, 696, 748, 1078, 919, 1138),
  Kareivių_g.i = c(1284, 1327, 1479, 1389, 1504, 1518, 1551, 1173, 1234, 1489, 1349, NA, 1529, 1457, 949, 789, 1005, 1389, 1428), 
  Kalvarijų_g.i0 = c(451, 453, 724, 803, 842, 739, 701, 492, 404, 798, 628, NA, 669, 656, 357, 295, 419, 625, 742),
  Kalvarijų_g.n0 = c(370, 361, 895, 925, 884, 866, 711, 354, 314, 818, 570, NA, 813, 660, 281, 195, 299, 901, 835),
  Kalvarijų_g.i = c(623, 578, 1031, 1106, 1351, 1080, 1054, 700, 464, 1036, 870, NA, 1010, 900, 436, 347, 401, 1157, 1069),
  Kalvarijų_g.n = c(469, 466, 505, 712, 613, 469, 677, 514, 522, 584, NA, NA, 561, 717, 440, 385, 545, 699, 604),
  Ozo_g.i = c(1572, 1585, 1423, 990, 1245, 1462, 1824, 1409, 1446, 1561, 1524, NA, 1587, 1783, 1107, 872, 1587, 1685, 1559),
  Ozo_g.n = c(1591, 1629, 1635, 1709, 1691, 1790, 1742, 1428, 1415, 1768, 1710, NA, 1743, 1742, 1124, 872, 1139, 1529, 1585),
  Zirmūnų_g.  = c(679, 723, 685, 674, 709, 825, 803, 803, 614, 730, 670, 751, 783, 806, 540, 498, 602, 782, 750),
  T.Narbuto_g.  = c(347, 298, 733, 750, 832, 812, 547, 453, 665, 787, 686, NA, 685, 732, 548, 456, 582, 739, 643),
  Ukmergės_g. = c(1348, 1294, 1318, 1464, 1474, 1494, 1593, 1387, 1128, 1494, 1452, 1613, 1415, 1511, 1095, 970, 1124, 1624, 1529),
  Antakalnio_n.= c(483, 452, 816, 865, 803, 807, 753, 445, 465, 746, NA, NA, NA, 704, 360, NA, 363, 974, 819),
  Antakalnio_i.= c(513, 562, 787, 820, 868, 819, 697, 560, 479, 696, NA, 611, 401, 694, 355, 406, 409, 868, 836),
  Antakalnio_i2.= c(478, 518, 786, 770, 820, 785, 672, 527, 458, 659, NA, NA, NA, 668, 349, 418, 396, 832, 815),
  Savanorių_pr. = c(437, 408, 866, 814, 942, 855, 735, 438, 387, 891, NA, 590, 974, 634, 387, 302, 412, 844, 903),
  Žemaitės_g. = c(414, 372, NA, NA, NA, NA, NA, NA, NA, NA, 448, NA, NA, 605, 348, 255, 389, 822, 991),
  Gerosios_Vilties_g. = c(310, 307, 520, 480, 569, 525, 447, 294, 259, 547, 319, 364, 550, 360, 244, 193, 272, 474, 578),
  Švitrigailos_g.i = c(279, 251, 495, 542, 447, 474, 450, 250, 286, 517, 300, 400, 441, 394, 238, 194, 200, 512, 504),
  Švitrigailos_g.n = c(555, 521, 848, 809, 817, 800, 727, 575, 485, 813, 598, 813, 720, 738, 477, 274, 425, 802, 664),
  Rūdninkų_g. = c(339, 351, 389, 447, 441, 428, 396, 411, 360, 412, 386, 406, 447, 438, 295, 240, 243, 425, 451),
  T.Ševčenkos_g. =c(129, 94, 130, 161, 138, 165, 121, 100, 82, 118, 125, 126, 128, 144, 127, 25, 88, 136, 144),
  Žemaitijos_g. = c(40, 52, 53, 52, 83, 59, 98, 60, 40, 71, 45, 68, 157, 177, 40, 15, 34, 41, 122),
  Ligoninės_g. = c(17, 24, 37, 34, 27, 59, 39, 26, 14, 30, 28, 36, 50, 53, 21, NA, NA, 41, 37), 
  Pylimo_g.n = c(683, 631, 708, 761, 818, 787, 770, 667, 606, 782, 713, 701, 833, 766, 500, 381, 420, 759, 757),
  Pylimo_g.i = c(87, 60, 66, 59, 120, 86, 103, 43, 40, 106, 66, 57, 57, 58, 43, 26, 44, 84, 100),
  Panerių_g.= c(281, 262, 368, 327, 412, 410, 399, 255, 252, 331, NA, NA, 332, 429, 265, 143, 214, 404, 361),
  Algirdo_g.= c(119, 112, 255, 223, 254, 264, 205, 129, 99, 277, NA, NA, 303, 259, 147, 75, 90, 301, 260),
  Aušros_v.g.i= c(173, 162, 239, 278, 239, 237, 267, 145, 166, 205, 194, 178, 236, 236, 190, 132, 113, 259, 275), 
  Aušros_v.g.n = c(154, 119, 181, 185, 220, 211, 182, 140, 126, 134, 157, 168, 193, 202, 228, 115, 114, 166, 174)
)

# 2. STATISTICAL ANALYSIS & TREND TESTING --------------------------------------

# Compute the city-wide daily median pollution across all available stations
m <- apply(oro, 1, median, na.rm=TRUE)

# Load library to run the non-parametric Mann-Kendall trend test on traffic data
library(Kendall)
# Test if there is a statistically significant upward/downward trend in vehicle volume
apply(au, 2, MannKendall)

# Conduct a correlation test between city-wide median pollution (m) and temperature (o)
cor.test(m, o)


# 3. VISUALIZATION: TRAFFIC AND POLLUTION TIMELINES ----------------------------

# Grid plotting: Trend lines for all analyzed streets (4 rows, 8 columns grid)
par(mfrow=c(4, 8), mar=c(2, 2, 2, 1))
for (i in 1:ncol(au)){
  plot(as.Date(rownames(au)), au[,i], type='b', main=colnames(au)[i], xlab = '', ylab = '')
  # Vertical blue lines mark weekend checkpoints to observe weekly cycle behaviors
  abline(v=as.Date(c("2026-03-21","2026-03-22","2026-03-28","2026-03-29","2026-04-04","2026-04-05")), col='blue')
}
par(mfrow=c(1, 1)) # Reset plot grid

# Grid plotting: Trend lines for all air pollution monitoring stations (3 rows, 7 columns)
par(mfrow=c(3, 7), mar=c(2, 2, 2, 1))
for (i in 1:ncol(oro)){
  plot(as.Date(rownames(oro)), oro[,i], type='b', main=colnames(oro)[i], xlab = '', ylab = '')
  abline(v=as.Date(c("2026-03-21","2026-03-22","2026-03-28","2026-03-29","2026-04-04","2026-04-05")), col='blue')
}
par(mfrow=c(1, 1)) # Reset plot grid


# 4. PLOTTING METEOROLOGICAL DRIVERS -------------------------------------------

# Plot A: Daily Median Pollution timeline
plot(as.Date(rownames(au)), m, type='b')
abline(v=as.Date(c("2026-03-21","2026-03-22","2026-03-28","2026-03-29","2026-04-04","2026-04-05")), col='blue')

# Plot B: Wind Speed timeline
plot(as.Date(rownames(au)), v, type='b')
abline(v=as.Date(c("2026-03-21","2026-03-22","2026-03-28","2026-03-29","2026-04-04","2026-04-05")), col='blue')

# Plot C: Relative Humidity timeline
plot(as.Date(rownames(au)), d, type='b')
abline(v=as.Date(c("2026-03-21","2026-03-22","2026-03-28","2026-03-29","2026-04-04","2026-04-05")), col='blue')

# Plot D: Temperature timeline
plot(as.Date(rownames(au)), o, type='b')
abline(v=as.Date(c("2026-03-21","2026-03-22","2026-03-28","2026-03-29","2026-04-04","2026-04-05")), col='blue')

# Plot E: Individual focus on the "Pramogų arena" pollution station timeline
plot(as.Date(rownames(au)), oro$Pramogu_arena, xlab = '', ylab = '', type='b')
abline(v=as.Date(c("2026-03-21","2026-03-22","2026-03-28","2026-03-29","2026-04-04","2026-04-05")), col='blue')


# 5. METEOROLOGICAL FILTERING: WIND DIRECTION TARGETING ------------------------

# Creating binary masks (1 or 0) for target wind angles mapping specific streets.
# A strict tolerance window of +/- 22.5 degrees is applied to isolate direct wind.
v1  <- ifelse(330 - 22.5 <= vk & vk <= 330 + 22.5, 1, 0)
v2  <- ifelse(240 - 22.5 <= vk & vk <= 240 + 22.5, 1, 0)
v3  <- ifelse(277 - 22.5 <= vk & vk <= 277 + 22.5, 1, 0)
v4  <- ifelse(261 - 22.5 <= vk & vk <= 261 + 22.5, 1, 0)
v5  <- ifelse(220 - 22.5 <= vk & vk <= 220 + 22.5, 1, 0)
v6  <- ifelse(214 - 22.5 <= vk & vk <= 214 + 22.5, 1, 0)
v7  <- ifelse(281 - 22.5 <= vk & vk <= 281 + 22.5, 1, 0)
v8  <- ifelse(147 - 22.5 <= vk & vk <= 147 + 22.5, 1, 0)
v9  <- ifelse(25  - 22.5 <= vk & vk <= 25  + 22.5, 1, 0)
v10 <- ifelse(315 - 22.5 <= vk & vk <= 315 + 22.5, 1, 0)
v11 <- ifelse(274 - 22.5 <= vk & vk <= 274 + 22.5, 1, 0)
v12 <- ifelse(166 - 22.5 <= vk & vk <= 166 + 22.5, 1, 0)
v13 <- ifelse(76  - 22.5 <= vk & vk <= 76  + 22.5, 1, 0)

# Filtered traffic columns: Multiply car numbers by the wind mask.
# This zeros out days where the wind was NOT blowing from the street to the sensor.
a1 <- au$Kareivių_g.n * v1
c1 <- au$Kareivių_g.i * v1
d1 <- (au$Kalvarijų_g.i0 + au$Kalvarijų_g.n0) * v3
e1 <- au$Ozo_g.n * v4
f1 <- au$Ozo_g.i * v4
g1 <- au$Ligoninės_g. * v5
h1 <- au$Antakalnio_i2. * v7
i1 <- au$T.Narbuto_g. * v8
j1 <- au$Ukmergės_g. * v9
k1 <- au$Savanorių_pr. * v10
l1 <- au$Zirmūnų_g. * v11
m1 <- au$T.Ševčenkos_g. * v12
n1 <- au$Algirdo_g. * v4
o1 <- au$Panerių_g. * v1


# 6. REGIONAL CORRELATION PLOTS (FILTERED DAYS) --------------------------------

# Plot Grid 1: Pollution vs Traffic Volume on filtered wind days only
par(mfrow=c(2, 7), mar=c(2, 2, 2, 1))
plot(a1[which(a1!=0)], oro$Pramogų_arena[which(a1!=0)], main = 'Kareivių g.n')
plot(c1[which(c1!=0)], oro$Pramogų_arena[which(c1!=0)], main = 'Kareivių g.i')
plot(d1[which(d1!=0)], oro$Pramogų_arena[which(d1!=0)], main = 'Kalvarijų g.0')
plot(e1[which(e1!=0)], oro$Pramogų_arena[which(e1!=0)], main = 'Ozo g.n')
plot(f1[which(f1!=0)], oro$Pramogų_arena[which(f1!=0)], main = 'Ozo g.i')
plot(g1[which(g1!=0)], oro$Senamiestis[which(g1!=0)], main = 'Ligoninės g.')
plot(h1[which(h1!=0)], oro$Antakalnis[which(h1!=0)], main = 'Antakalnio g.')
plot(i1[which(i1!=0)], oro$Saltoniškės[which(i1!=0)], main = 'T. Narbuto g.')
plot(j1[which(j1!=0)], oro$Saltoniškės[which(j1!=0)], main = 'Ukmergės g.')
plot(k1[which(k1!=0)], oro$Vilkpedė[which(k1!=0)], main = 'Savanorių pr.')
plot(l1[which(l1!=0)], oro$Žirmūnai[which(l1!=0)], main = 'Žirmūnų g.')
plot(m1[which(m1!=0)], oro$Naujamiestis[which(m1!=0)], main = 'T. Ševčenkos')
plot(n1[which(n1!=0)], oro$Stepono_sodas[which(n1!=0)], main = 'Algirdo g.')
plot(o1[which(o1!=0)], oro$Stepono_sodas[which(o1!=0)], main = 'Panerių g.')


# Plot Grid 2: Pollution vs Wind Speed on the same filtered wind days
# Used to check if high wind speeds disperse the vehicle pollution on these days.
par(mfrow=c(2, 7), mar=c(2, 2, 2, 1))
plot(v[which(a1!=0)], oro$Pramogų_arena[which(a1!=0)], main = 'Kareivių g.n')
plot(v[which(c1!=0)], oro$Pramogų_arena[which(c1!=0)], main = 'Kareivių g.i')
plot(v[which(d1!=0)], oro$Pramogų_arena[which(d1!=0)], main = 'Kalvarijų g.0')
plot(v[which(e1!=0)], oro$Pramogų_arena[which(e1!=0)], main = 'Ozo g.n')
plot(v[which(f1!=0)], oro$Pramogų_arena[which(f1!=0)], main = 'Ozo g.i')
plot(v[which(g1!=0)], oro$Senamiestis[which(g1!=0)], main = 'Ligoninės g.')
plot(v[which(h1!=0)], oro$Antakalnis[which(h1!=0)], main = 'Antakalnio g.')
plot(v[which(i1!=0)], oro$Saltoniškės[which(i1!=0)], main = 'T. Narbuto g.')
plot(v[which(j1!=0)], oro$Saltoniškės[which(j1!=0)], main = 'Ukmergės g.')
plot(v[which(k1!=0)], oro$Vilkpedė[which(k1!=0)], main = 'Savanorių pr.')
plot(v[which(l1!=0)], oro$Žirmūnai[which(l1!=0)], main = 'Žirmūnų g.')
plot(v[which(m1!=0)], oro$Naujamiestis[which(m1!=0)], main = 'T. Ševčenkos')
plot(v[which(n1!=0)], oro$Stepono_sodas[which(n1!=0)], main = 'Algirdo g.')
plot(v[which(o1!=0)], oro$Stepono_sodas[which(o1!=0)], main = 'Panerių g.')

par(mfrow=c(1, 1)) # Final reset of plot grid back to default layout