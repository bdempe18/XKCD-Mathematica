(* ::Package:: *)

BeginPackage["XKCD`"]

xkcdConvert::usage="XKCD style graphs"

Begin["`Private`"]
xkcdStyle = {FontFamily -> "/home/scooberftw/xkcd-font-master/build/xkcd.otf", 16};

xkcdLabel[{str_, {x1_, y1_}, {xo_, yo_}}] := Module[{x2, y2},
   x2 = x1 + xo; y2 = y1 + yo;
   {Inset[
     Style[str, xkcdStyle], {x2, y2}, {1.2 Sign[x1 - x2], 
      Sign[y1 - y2] Boole[x1 == x2]}], Thick, 
    BezierCurve[{{0.9 x1 + 0.1 x2, 0.9 y1 + 0.1 y2}, {x1, y2}, {x2, y2}}]}];

xkcdRules = {EdgeForm[ef:Except[None]] :> EdgeForm[Flatten@{ef, Thick, Black}], 
   Style[x_, st_] :> Style[x, xkcdStyle], 
   Pane[s_String] :> Pane[Style[s, xkcdStyle]],
   {h_Hue, l_Line} :> {Thickness[0.02], White, l, Thick, h, l},
   Grid[{{g_Graphics, s_String}}] :> Grid[{{g, Style[s, xkcdStyle]}}],
   Rule[PlotLabel, lab_] :> Rule[PlotLabel, Style[lab, xkcdStyle]]};

xkcdShow[p_] := Show[p, AxesStyle -> Thick, LabelStyle -> xkcdStyle] /. xkcdRules

xkcdShow[Labeled[p_, rest__]] := 
 Labeled[Show[p, AxesStyle -> Thick, LabelStyle -> xkcdStyle], rest] /. xkcdRules

xkcdDistort[p_] := Module[{r, ix, iy},
   r = ImagePad[Rasterize@p, 10, Padding -> White];
   {ix, iy} = 
    Table[RandomImage[{-1, 1}, ImageDimensions@r]~ImageConvolve~
      GaussianMatrix[10], {2}];
   ImagePad[ImageTransformation[r, 
     # + 15 {ImageValue[ix, #], ImageValue[iy, #]} &, DataRange -> Full], -5]];

xkcdConvert[x_] := xkcdDistort[xkcdShow[x]]
End[]
EndPackage[]



