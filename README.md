# XKCK-Mathematica
Installation directions
-------------------------
1) Download xkcd font from http://www.xkcd.com/fonts/xkcd-Regular.otf. Save file to .Mathematica/Applications
2) Save .m file to .Mathematica/Applications

Examples
----
Sample notebook. Note - You need to begin the notebook with the Needs command
`Needs["XKCD``"]
xkcdConvert[
 BarChart[{10, 1}, ChartLabels -> {"XKCD", "Others"}, 
  PlotLabel -> "Popularity of questions on MMA.SE", 
  Ticks -> {None, {{1, "Min"}, {10, "Max"}}}]]`

Attributions
--------------
- Graphing code accredited to github user Simon Woods (https://mathematica.stackexchange.com/users/862/simon-woods)
- Font from  XKCD (http://www.xkcd.com/fonts/xkcd-Regular.otf)
