(* Content-type: application/vnd.wolfram.mathematica *)

(*** Wolfram Notebook File ***)
(* http://www.wolfram.com/nb *)

(* CreatedBy='Mathematica 14.0' *)

(*CacheID: 234*)
(* Internal cache information:
NotebookFileLineBreakTest
NotebookFileLineBreakTest
NotebookDataPosition[       158,          7]
NotebookDataLength[     58075,       1493]
NotebookOptionsPosition[     56694,       1463]
NotebookOutlinePosition[     57051,       1479]
CellTagsIndexPosition[     57008,       1476]
WindowFrame->Normal*)

(* Beginning of Notebook Content *)
Notebook[{
Cell[BoxData[
 RowBox[{
  RowBox[{"(*", 
   RowBox[{
    RowBox[{
    "===", "===", "===", "===", "===", "===", "===", "===", "===", "===", "===",
      "===", "===", "===", "===", "===", "===", "===", "===", "=="}], "=", 
    RowBox[{"===", "="}]}], "*)"}], "\[IndentingNewLine]", 
  RowBox[{"(*", " ", 
   RowBox[{"1.", " ", 
    StyleBox["The",
     FontSize->18,
     FontWeight->"Bold",
     FontColor->RGBColor[0, 0, 1]], 
    StyleBox[" ",
     FontSize->18,
     FontWeight->"Bold",
     FontColor->RGBColor[0, 0, 1]], 
    StyleBox["GnPairing",
     FontSize->18,
     FontWeight->"Bold",
     FontColor->RGBColor[0, 0, 1]], 
    StyleBox[" ",
     FontSize->18,
     FontWeight->"Bold",
     FontColor->RGBColor[0, 0, 1]], 
    StyleBox["Code",
     FontSize->18,
     FontWeight->"Bold",
     FontColor->RGBColor[0, 0, 1]], 
    StyleBox[" ",
     FontSize->18,
     FontWeight->"Bold",
     FontColor->RGBColor[0, 0, 1]], 
    StyleBox["version",
     FontSize->18,
     FontWeight->"Bold",
     FontColor->RGBColor[0, 0, 1]], 
    StyleBox[" ",
     FontSize->18,
     FontWeight->"Bold",
     FontColor->RGBColor[0, 0, 1]], 
    StyleBox["1.5",
     FontSize->18,
     FontWeight->"Bold",
     FontColor->RGBColor[0, 0, 1]], 
    StyleBox[".2",
     FontSize->18,
     FontWeight->"Bold",
     FontColor->RGBColor[0, 0, 1]], 
    StyleBox[" ",
     FontSize->18,
     FontWeight->"Bold",
     FontColor->RGBColor[0, 0, 1]], 
    StyleBox[
     RowBox[{"(", 
      RowBox[{"Run", " ", "it", " ", "first", " ", "before", " ", "input"}], 
      ")"}],
     FontSize->18,
     FontWeight->"Bold",
     FontColor->RGBColor[0, 0, 1]]}], 
   StyleBox[" ",
    FontSize->18,
    FontWeight->"Bold",
    FontColor->RGBColor[0, 0, 1]], "*)"}], "\[IndentingNewLine]", "  ", 
  RowBox[{"(*", " ", 
   StyleBox[
    RowBox[{
     RowBox[{
      RowBox[{"F", ".", " ", "Pan"}], "  ", "et", " ", "al"}], ",", " ", 
     RowBox[{"May", " ", "08"}], ",", " ", 
     RowBox[{
     "2026", " ", "for", " ", "submission", " ", "to", " ", "Computer", " ", 
      "Physics", " ", "Communications"}]}],
    FontColor->RGBColor[0, 0, 1]], "*)"}], "\[IndentingNewLine]", " ", 
  RowBox[{"(*", " ", 
   StyleBox[
    RowBox[{
     RowBox[{
      RowBox[{"F", ".", " ", "Pan"}], "  ", "et", " ", "al"}], ",", " ", 
     RowBox[{"May", " ", "22"}], ",", " ", "2026", ",", " ", 
     RowBox[{
     "a", " ", "simple", " ", "Lanczos", " ", "for", " ", "evaluating", " ", 
      "eigenvalues", " ", "of", " ", "Hp", " ", "is", " ", "added"}]}],
    FontColor->RGBColor[0, 0, 1]], "*)"}], "\[IndentingNewLine]", " ", 
  RowBox[{"(*", " ", 
   StyleBox[
    RowBox[{
     RowBox[{
      RowBox[{"F", ".", " ", "Pan"}], "  ", "et", " ", "al"}], ",", " ", 
     RowBox[{"Sept", ".", " ", "12"}], ",", " ", "2026", ",", " ", 
     RowBox[{
     "absolute", " ", "phases", " ", "of", " ", "the", " ", "eigenvactors", 
      " ", "of", " ", "Hp", " ", "is", " ", "fixed"}]}],
    FontColor->RGBColor[0, 0, 1]], "*)"}], "\[IndentingNewLine]", 
  RowBox[{"(*", 
   RowBox[{
   "===", "===", "===", "===", "===", "===", "===", "===", "===", "===", "===",
     "===", "===", "===", "===", "===", "===", "===", "===", "===", "==="}], 
   "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    RowBox[{"Clear", "[", 
     RowBox[{
     "GnPairing", ",", "S", ",", "u", ",", "G", ",", "H", ",", "epsilon"}], 
     "]"}], ";"}], "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{
     RowBox[{"GnPairing", "[", 
      RowBox[{
      "p_", ",", "k_", ",", "S_Symbol", ",", "epsilon_Symbol", ",", 
       "G_Symbol"}], "]"}], ":=", 
     RowBox[{"Module", "[", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{
        "SS", ",", "u", ",", "W", ",", "n", ",", "current", ",", "gen", ",", 
         "weights", ",", "encode", ",", "encodedW", ",", "index", ",", 
         "precomputeSJ", ",", "rules", ",", "contrib", ",", "i", ",", "j", 
         ",", "l", ",", "wi", ",", "key", ",", "keyNew", ",", "pos", ",", 
         "sj", ",", "sl", ",", "val", ",", "diagList", ",", "diagRules", ",", 
         "Hmat"}], "}"}], ",", 
       RowBox[{
        RowBox[{"SS", "=", 
         RowBox[{"Table", "[", 
          RowBox[{
           RowBox[{"-", 
            RowBox[{"S", "[", "i", "]"}]}], ",", 
           RowBox[{"{", 
            RowBox[{"i", ",", "p"}], "}"}]}], "]"}]}], ";", 
        "\[IndentingNewLine]", 
        RowBox[{"u", "=", 
         RowBox[{"Table", "[", 
          RowBox[{
           RowBox[{"2", " ", 
            RowBox[{"S", "[", "i", "]"}]}], ",", 
           RowBox[{"{", 
            RowBox[{"i", ",", "p"}], "}"}]}], "]"}]}], ";", 
        "\[IndentingNewLine]", 
        RowBox[{
        "Print", "[", "\"\<\\n== GnPairing Hamiltonian Builder ==\>\"", "]"}],
         ";", "\[IndentingNewLine]", 
        RowBox[{"(*", " ", 
         RowBox[{"===", "===", "===", "===", "===", "===", "==="}], "*)"}], 
        "\[IndentingNewLine]", 
        RowBox[{"(*", " ", 
         StyleBox[
          RowBox[{
           RowBox[{"Part", " ", "1"}], ":", " ", "Basis"}],
          FontSize->18,
          FontWeight->"Bold",
          FontColor->RGBColor[0., 0., 1.]], "*)"}], "\[IndentingNewLine]", 
        RowBox[{"(*", " ", 
         RowBox[{"===", "===", "===", "===", "===", "===", "==="}], "*)"}], 
        "\[IndentingNewLine]", 
        RowBox[{"current", "=", 
         RowBox[{"ConstantArray", "[", 
          RowBox[{"0", ",", "p"}], "]"}]}], ";", "\[IndentingNewLine]", 
        RowBox[{
         RowBox[{"gen", "[", 
          RowBox[{"rem_", ",", "pos_"}], "]"}], ":=", 
         RowBox[{"If", "[", 
          RowBox[{
           RowBox[{"pos", "\[Equal]", "p"}], ",", 
           RowBox[{"If", "[", 
            RowBox[{
             RowBox[{"rem", "\[LessEqual]", 
              RowBox[{"u", "[", 
               RowBox[{"[", "pos", "]"}], "]"}]}], ",", 
             RowBox[{
              RowBox[{
               RowBox[{"current", "[", 
                RowBox[{"[", "pos", "]"}], "]"}], "=", "rem"}], ";", 
              "\[IndentingNewLine]", 
              RowBox[{"Sow", "[", 
               RowBox[{"SS", "+", "current"}], "]"}], ";"}]}], "]"}], ",", 
           RowBox[{"Do", "[", 
            RowBox[{
             RowBox[{"If", "[", 
              RowBox[{
               RowBox[{
                RowBox[{"i", "\[LessEqual]", 
                 RowBox[{"u", "[", 
                  RowBox[{"[", "pos", "]"}], "]"}]}], "&&", 
                RowBox[{"i", "\[LessEqual]", "rem"}]}], ",", 
               RowBox[{
                RowBox[{
                 RowBox[{"current", "[", 
                  RowBox[{"[", "pos", "]"}], "]"}], "=", "i"}], ";", 
                "\[IndentingNewLine]", 
                RowBox[{"gen", "[", 
                 RowBox[{
                  RowBox[{"rem", "-", "i"}], ",", 
                  RowBox[{"pos", "+", "1"}]}], "]"}], ";"}]}], "]"}], ",", 
             RowBox[{"{", 
              RowBox[{"i", ",", "0", ",", 
               RowBox[{"Min", "[", 
                RowBox[{"rem", ",", 
                 RowBox[{"u", "[", 
                  RowBox[{"[", "pos", "]"}], "]"}]}], "]"}]}], "}"}]}], 
            "]"}]}], "]"}]}], ";", "\[IndentingNewLine]", 
        RowBox[{"W", "=", 
         RowBox[{
          RowBox[{"Reap", "[", 
           RowBox[{"gen", "[", 
            RowBox[{"k", ",", "1"}], "]"}], "]"}], "[", 
          RowBox[{"[", 
           RowBox[{"2", ",", "1"}], "]"}], "]"}]}], ";", 
        "\[IndentingNewLine]", 
        RowBox[{"n", "=", 
         RowBox[{"Length", "[", "W", "]"}]}], ";", "\[IndentingNewLine]", 
        "\[IndentingNewLine]", 
        RowBox[{"If", "[", 
         RowBox[{
          RowBox[{"n", "\[Equal]", "0"}], ",", 
          RowBox[{"Return", "[", 
           RowBox[{"SparseArray", "[", 
            RowBox[{
             RowBox[{"{", "}"}], ",", 
             RowBox[{"{", 
              RowBox[{"0", ",", "0"}], "}"}]}], "]"}], "]"}]}], "]"}], ";", 
        "\[IndentingNewLine]", 
        RowBox[{"Print", "[", 
         RowBox[{"\"\<Dimension = \>\"", ",", "n"}], "]"}], ";", 
        "\[IndentingNewLine]", 
        RowBox[{"(*", " ", 
         RowBox[{"===", "===", "===", "===", "===", "===", "==="}], "*)"}], 
        "\[IndentingNewLine]", 
        RowBox[{"(*", " ", 
         StyleBox[
          RowBox[{"basis", " ", "encoding"}],
          FontSize->18,
          FontWeight->"Bold",
          FontColor->RGBColor[0., 0., 1.]], 
         StyleBox[" ",
          FontSize->18,
          FontWeight->"Bold",
          FontColor->RGBColor[0., 0., 1.]], "*)"}], "\[IndentingNewLine]", 
        RowBox[{"(*", " ", 
         RowBox[{"===", "===", "===", "===", "===", "===", "==="}], "*)"}], 
        "\[IndentingNewLine]", 
        RowBox[{"weights", "=", 
         RowBox[{"FoldList", "[", 
          RowBox[{"Times", ",", "1", ",", 
           RowBox[{"Most", "[", 
            RowBox[{"u", "+", "1"}], "]"}]}], "]"}]}], ";", 
        "\[IndentingNewLine]", 
        RowBox[{
         RowBox[{"encode", "[", "v_", "]"}], ":=", 
         RowBox[{"Dot", "[", 
          RowBox[{
           RowBox[{"v", "-", "SS"}], ",", "weights"}], "]"}]}], ";", 
        "\[IndentingNewLine]", 
        RowBox[{"encodedW", "=", 
         RowBox[{"encode", "/@", "W"}]}], ";", "\[IndentingNewLine]", 
        RowBox[{"index", "=", 
         RowBox[{"AssociationThread", "[", 
          RowBox[{"encodedW", "\[Rule]", 
           RowBox[{"Range", "[", "n", "]"}]}], "]"}]}], ";", 
        "\[IndentingNewLine]", "\[IndentingNewLine]", 
        RowBox[{"(*", " ", 
         RowBox[{"===", "===", "===", "===", "===", "===", "==="}], "*)"}], 
        "\[IndentingNewLine]", 
        RowBox[{"(*", 
         StyleBox[
          RowBox[{
           RowBox[{"Part", " ", "2"}], ":", " ", 
           RowBox[{
            RowBox[{"Generate", " ", "off"}], "-", 
            RowBox[{
            "diagonal", " ", "pairig", " ", "matrix", " ", "elements"}]}]}],
          FontSize->18,
          FontWeight->"Bold",
          FontColor->RGBColor[0., 0., 1.]], " ", "*)"}], 
        "\[IndentingNewLine]", 
        RowBox[{"(*", " ", 
         RowBox[{"===", "===", "===", "===", "===", "===", "==="}], "*)"}], 
        "\[IndentingNewLine]", 
        RowBox[{"(*", " ", 
         StyleBox[
          RowBox[{
           RowBox[{
           "Precompute", " ", "matrix", " ", "elements", " ", "of", " ", 
            "S"}], "+", " ", 
           RowBox[{"and", " ", "S"}], "-"}],
          FontSize->16,
          FontWeight->"Bold",
          FontColor->RGBColor[0., 0., 1.]], 
         StyleBox[" ",
          FontSize->18,
          FontWeight->"Bold",
          FontColor->RGBColor[0., 0., 1.]], 
         StyleBox[" ",
          FontColor->RGBColor[0, 0, 1]], "*)"}], "\[IndentingNewLine]", 
        RowBox[{"precomputeSJ", "=", 
         RowBox[{"Table", "[", 
          RowBox[{
           RowBox[{"{", 
            RowBox[{
             RowBox[{"Table", "[", 
              RowBox[{
               RowBox[{"Sqrt", "[", 
                RowBox[{
                 RowBox[{"(", 
                  RowBox[{
                   RowBox[{"S", "[", "kk", "]"}], "-", "x"}], ")"}], " ", 
                 RowBox[{"(", 
                  RowBox[{
                   RowBox[{"S", "[", "kk", "]"}], "+", "x", "+", "1"}], 
                  ")"}]}], "]"}], ",", 
               RowBox[{"{", 
                RowBox[{"x", ",", 
                 RowBox[{"-", 
                  RowBox[{"S", "[", "kk", "]"}]}], ",", 
                 RowBox[{"S", "[", "kk", "]"}]}], "}"}]}], "]"}], ",", 
             RowBox[{"Table", "[", 
              RowBox[{
               RowBox[{"Sqrt", "[", 
                RowBox[{
                 RowBox[{"(", 
                  RowBox[{
                   RowBox[{"S", "[", "kk", "]"}], "+", "x"}], ")"}], " ", 
                 RowBox[{"(", 
                  RowBox[{
                   RowBox[{"S", "[", "kk", "]"}], "-", "x", "+", "1"}], 
                  ")"}]}], "]"}], ",", 
               RowBox[{"{", 
                RowBox[{"x", ",", 
                 RowBox[{"-", 
                  RowBox[{"S", "[", "kk", "]"}]}], ",", 
                 RowBox[{"S", "[", "kk", "]"}]}], "}"}]}], "]"}]}], "}"}], 
           ",", 
           RowBox[{"{", 
            RowBox[{"kk", ",", "p"}], "}"}]}], "]"}]}], ";", 
        "\[IndentingNewLine]", 
        RowBox[{"rules", "=", 
         RowBox[{
          RowBox[{"Reap", "[", 
           RowBox[{"Do", "[", 
            RowBox[{
             RowBox[{
              RowBox[{"wi", "=", 
               RowBox[{"W", "[", 
                RowBox[{"[", "i", "]"}], "]"}]}], ";", "\[IndentingNewLine]", 
              RowBox[{"key", "=", 
               RowBox[{"encodedW", "[", 
                RowBox[{"[", "i", "]"}], "]"}]}], ";", "\[IndentingNewLine]", 
              RowBox[{"Do", "[", 
               RowBox[{
                RowBox[{"If", "[", 
                 RowBox[{
                  RowBox[{
                   RowBox[{
                    RowBox[{"wi", "[", 
                    RowBox[{"[", "l", "]"}], "]"}], ">", 
                    RowBox[{"-", 
                    RowBox[{"S", "[", "l", "]"}]}]}], "&&", 
                   RowBox[{
                    RowBox[{"wi", "[", 
                    RowBox[{"[", "j", "]"}], "]"}], "<", 
                    RowBox[{"u", "[", 
                    RowBox[{"[", "j", "]"}], "]"}]}]}], ",", 
                  RowBox[{
                   RowBox[{"keyNew", "=", 
                    RowBox[{"key", "+", 
                    RowBox[{"weights", "[", 
                    RowBox[{"[", "j", "]"}], "]"}], "-", 
                    RowBox[{"weights", "[", 
                    RowBox[{"[", "l", "]"}], "]"}]}]}], ";", 
                   "\[IndentingNewLine]", 
                   RowBox[{"pos", "=", 
                    RowBox[{"Lookup", "[", 
                    RowBox[{"index", ",", "keyNew", ",", "None"}], "]"}]}], 
                   ";", "\[IndentingNewLine]", 
                   RowBox[{"If", "[", 
                    RowBox[{
                    RowBox[{
                    RowBox[{"IntegerQ", "[", "pos", "]"}], "&&", 
                    RowBox[{
                    "1", "\[LessEqual]", "pos", "\[LessEqual]", "n"}]}], ",", 
                    RowBox[{
                    RowBox[{"sj", "=", 
                    RowBox[{"precomputeSJ", "[", 
                    RowBox[{"[", 
                    RowBox[{"j", ",", "1", ",", 
                    RowBox[{"Round", "[", 
                    RowBox[{
                    RowBox[{"wi", "[", 
                    RowBox[{"[", "j", "]"}], "]"}], "-", 
                    RowBox[{"(", 
                    RowBox[{"-", 
                    RowBox[{"S", "[", "j", "]"}]}], ")"}], "+", "1"}], 
                    "]"}]}], "]"}], "]"}]}], ";", "\[IndentingNewLine]", 
                    RowBox[{"sl", "=", 
                    RowBox[{"precomputeSJ", "[", 
                    RowBox[{"[", 
                    RowBox[{"l", ",", "2", ",", 
                    RowBox[{"Round", "[", 
                    RowBox[{
                    RowBox[{"wi", "[", 
                    RowBox[{"[", "l", "]"}], "]"}], "-", 
                    RowBox[{"(", 
                    RowBox[{"-", 
                    RowBox[{"S", "[", "l", "]"}]}], ")"}], "+", "1"}], 
                    "]"}]}], "]"}], "]"}]}], ";", "\[IndentingNewLine]", 
                    RowBox[{"val", "=", 
                    RowBox[{
                    RowBox[{"G", "[", 
                    RowBox[{"j", ",", "l"}], "]"}], "*", "sj", "*", "sl"}]}], 
                    ";", "\[IndentingNewLine]", 
                    RowBox[{"Sow", "[", 
                    RowBox[{"{", 
                    RowBox[{"i", ",", "pos", ",", "val"}], "}"}], "]"}], ";", 
                    "\[IndentingNewLine]", 
                    RowBox[{"Sow", "[", 
                    RowBox[{"{", 
                    RowBox[{"pos", ",", "i", ",", "val"}], "}"}], "]"}], 
                    ";"}]}], "]"}], ";"}]}], "]"}], ",", 
                RowBox[{"{", 
                 RowBox[{"j", ",", "p"}], "}"}], ",", 
                RowBox[{"{", 
                 RowBox[{"l", ",", 
                  RowBox[{"j", "+", "1"}], ",", "p"}], "}"}]}], "]"}]}], ",", 
             RowBox[{"{", 
              RowBox[{"i", ",", "n"}], "}"}]}], "]"}], "]"}], "[", 
          RowBox[{"[", "2", "]"}], "]"}]}], ";", "\[IndentingNewLine]", 
        RowBox[{"contrib", "=", 
         RowBox[{"If", "[", 
          RowBox[{
           RowBox[{"rules", "===", 
            RowBox[{"{", "}"}]}], ",", 
           RowBox[{"{", "}"}], ",", 
           RowBox[{"rules", "[", 
            RowBox[{"[", "1", "]"}], "]"}]}], "]"}]}], ";", 
        "\[IndentingNewLine]", 
        RowBox[{"(*", " ", 
         RowBox[{"===", "===", "===", "===", "===", "===", "==="}], "*)"}], 
        "\[IndentingNewLine]", 
        RowBox[{"(*", " ", 
         StyleBox[
          RowBox[{
           RowBox[{"Part", " ", "3"}], ":", " ", 
           RowBox[{
           "Generate", " ", "diagonal", " ", "part", " ", "of", " ", "the", 
            " ", "Hamiltontian", " ", "matrix"}]}],
          FontSize->18,
          FontWeight->"Bold",
          FontColor->RGBColor[0., 0., 1.]], "*)"}], "\[IndentingNewLine]", 
        RowBox[{"(*", " ", 
         RowBox[{"===", "===", "===", "===", "===", "===", "==="}], "*)"}], 
        RowBox[{"diagList", "=", 
         RowBox[{"Table", "[", 
          RowBox[{
           RowBox[{
            RowBox[{"Sum", "[", 
             RowBox[{
              RowBox[{"2", " ", 
               RowBox[{"epsilon", "[", "j", "]"}], " ", 
               RowBox[{"(", 
                RowBox[{
                 RowBox[{"W", "[", 
                  RowBox[{"[", 
                   RowBox[{"i", ",", "j"}], "]"}], "]"}], "+", 
                 RowBox[{"S", "[", "j", "]"}]}], ")"}]}], ",", 
              RowBox[{"{", 
               RowBox[{"j", ",", "p"}], "}"}]}], "]"}], "+", 
            RowBox[{"Sum", "[", 
             RowBox[{
              RowBox[{
               RowBox[{"G", "[", 
                RowBox[{"j", ",", "j"}], "]"}], " ", 
               RowBox[{"(", 
                RowBox[{
                 RowBox[{"S", "[", "j", "]"}], "+", 
                 RowBox[{"W", "[", 
                  RowBox[{"[", 
                   RowBox[{"i", ",", "j"}], "]"}], "]"}]}], ")"}], " ", 
               RowBox[{"(", 
                RowBox[{
                 RowBox[{"S", "[", "j", "]"}], "-", 
                 RowBox[{"W", "[", 
                  RowBox[{"[", 
                   RowBox[{"i", ",", "j"}], "]"}], "]"}], "+", "1"}], ")"}]}],
               ",", 
              RowBox[{"{", 
               RowBox[{"j", ",", "p"}], "}"}]}], "]"}]}], ",", 
           RowBox[{"{", 
            RowBox[{"i", ",", "n"}], "}"}]}], "]"}]}], ";", 
        "\[IndentingNewLine]", 
        RowBox[{"diagRules", "=", 
         RowBox[{"Table", "[", 
          RowBox[{
           RowBox[{
            RowBox[{"{", 
             RowBox[{"i", ",", "i"}], "}"}], "\[Rule]", 
            RowBox[{"diagList", "[", 
             RowBox[{"[", "i", "]"}], "]"}]}], ",", 
           RowBox[{"{", 
            RowBox[{"i", ",", "n"}], "}"}]}], "]"}]}], ";", 
        "\[IndentingNewLine]", 
        RowBox[{"(*", " ", 
         RowBox[{"===", "===", "===", "===", "===", "===", "==="}], "*)"}], 
        "\[IndentingNewLine]", 
        RowBox[{"(*", " ", 
         StyleBox[
          RowBox[{
          "Part", " ", "4.", " ", "Build", " ", "the", " ", "Final", " ", 
           "Hamiltonian", " ", "Matrix"}],
          FontSize->18,
          FontWeight->"Bold",
          FontColor->RGBColor[0., 0., 1.]], "*)"}], "\[IndentingNewLine]", 
        RowBox[{"(*", " ", 
         RowBox[{"===", "===", "===", "===", "===", "===", "==="}], "*)"}], 
        "\[IndentingNewLine]", 
        RowBox[{"Hmat", "=", 
         RowBox[{"SparseArray", "[", 
          RowBox[{
           RowBox[{"Join", "[", 
            RowBox[{
             RowBox[{"(", 
              RowBox[{"contrib", "/.", 
               RowBox[{
                RowBox[{"{", 
                 RowBox[{"i_", ",", "j_", ",", "v_"}], "}"}], 
                "\[RuleDelayed]", 
                RowBox[{"(", 
                 RowBox[{
                  RowBox[{"{", 
                   RowBox[{"i", ",", "j"}], "}"}], "\[Rule]", "v"}], 
                 ")"}]}]}], ")"}], ",", "diagRules"}], "]"}], ",", 
           RowBox[{"{", 
            RowBox[{"n", ",", "n"}], "}"}]}], "]"}]}], ";", 
        "\[IndentingNewLine]", 
        RowBox[{"Print", "[", "\"\<Matrix built successfully.\>\"", "]"}], 
        ";", "\[IndentingNewLine]", 
        RowBox[{
         RowBox[{"H", "[", 
          RowBox[{"p", ",", "k"}], "]"}], "=", "Hmat"}], ";", 
        "\[IndentingNewLine]", 
        RowBox[{"(*", " ", 
         RowBox[{
         "The", " ", "Final", " ", "Hamiltonian", " ", "matrix", " ", "and", 
          " ", "the", " ", "basis", " ", "vectors", " ", "can", " ", "be", 
          " ", "read", " ", 
          RowBox[{"out", "."}]}], " ", "*)"}], "\[IndentingNewLine]", 
        RowBox[{"Return", "[", 
         RowBox[{"<|", 
          RowBox[{
           RowBox[{"\"\<Hamiltonian\>\"", "\[Rule]", "Hmat"}], ",", 
           RowBox[{"\"\<BasisVectors\>\"", "\[Rule]", "W"}]}], "|>"}], "]"}], 
        ";"}]}], "]"}]}], ";"}]}]}]], "Input",
 CellChangeTimes->{{3.9864609023872347`*^9, 3.986460902388235*^9}, {
   3.986637845785375*^9, 3.986637847569159*^9}, {3.986637898115988*^9, 
   3.9866379182007637`*^9}, 3.9866380722027264`*^9, {3.98664393860009*^9, 
   3.986643943793585*^9}, {3.986644346214978*^9, 3.986644349112894*^9}, {
   3.986644466040476*^9, 3.98664447822088*^9}, {3.986644599669298*^9, 
   3.986644603219085*^9}, {3.986645305419193*^9, 3.986645311703663*^9}, {
   3.986686887951018*^9, 3.986686948263718*^9}, {3.986703382382742*^9, 
   3.986703425955297*^9}, {3.986703504488312*^9, 3.986703576804804*^9}, {
   3.98670362270829*^9, 3.986703628868717*^9}, {3.986703672802908*^9, 
   3.9867037718562546`*^9}, {3.986703805893137*^9, 3.9867040110758305`*^9}, {
   3.986704047458843*^9, 3.9867040813118305`*^9}, {3.986704116814995*^9, 
   3.986704203938289*^9}, {3.986704330706927*^9, 3.98670439991885*^9}, {
   3.98670459284607*^9, 3.986704622753947*^9}, {3.9867050573890457`*^9, 
   3.986705065079771*^9}, {3.986705148020397*^9, 3.9867051902475967`*^9}, {
   3.986705528633524*^9, 3.986705529258461*^9}, {3.986709973594042*^9, 
   3.986709973609667*^9}, {3.986725345985092*^9, 3.9867253656562176`*^9}, {
   3.986781169106722*^9, 3.986781177048788*^9}, {3.986781972961778*^9, 
   3.986781987292065*^9}, {3.986782039153911*^9, 3.9867820697845135`*^9}, 
   3.986782132898864*^9, {3.986782634521441*^9, 3.986782636598767*^9}, {
   3.9867843085286026`*^9, 3.9867843092702208`*^9}, {3.98678533450561*^9, 
   3.986785449064263*^9}, {3.98678597097627*^9, 3.986785989499251*^9}, {
   3.986786160276643*^9, 3.986786162186059*^9}, {3.9867862079211516`*^9, 
   3.986786229758556*^9}, {3.9867863560857396`*^9, 3.986786359568795*^9}, {
   3.986786640972225*^9, 3.986786644571442*^9}, {3.986786899625372*^9, 
   3.9867869055530243`*^9}, {3.9868727870412283`*^9, 3.986872825659544*^9}, {
   3.9868728720865335`*^9, 3.986872920602505*^9}, {3.986900387558779*^9, 
   3.986900390384781*^9}, {3.98690584209033*^9, 3.9869059080843396`*^9}, {
   3.986905947960107*^9, 3.986905969180844*^9}, {3.986906806901517*^9, 
   3.9869068309516697`*^9}, {3.9869130553808146`*^9, 3.986913067640273*^9}, {
   3.9870377468113017`*^9, 3.987037777281937*^9}, {3.987043114532157*^9, 
   3.987043145153922*^9}, {3.987043184353708*^9, 3.98704323758362*^9}, 
   3.9870432798621902`*^9, {3.987043363113664*^9, 3.987043365513568*^9}, {
   3.987043429341659*^9, 3.9870434723492594`*^9}, 3.9870441345884504`*^9, {
   3.987045430184827*^9, 3.9870455298165007`*^9}, {3.987045577407346*^9, 
   3.987045584723666*^9}, {3.9870457911737504`*^9, 3.987045799353773*^9}, {
   3.98721508213568*^9, 3.987215097968407*^9}, {3.987215228943282*^9, 
   3.987215229630247*^9}, {3.988327785846218*^9, 3.988327853666756*^9}, {
   3.988367261081238*^9, 3.988367265132128*^9}, {3.988368398520483*^9, 
   3.988368398564093*^9}, 3.998049323333341*^9, {3.998573323206557*^9, 
   3.9985733376782*^9}, {3.999007502660967*^9, 3.9990075906770086`*^9}},
 CellLabel->
  "In[986]:=",ExpressionUUID->"fa5bc0f6-a51f-45ee-a587-3f2dc96318e9"],

Cell[BoxData[
 RowBox[{"(*", 
  RowBox[{
  "**", "**", "**", "**", "**", "**", "**", "**", "**", "**", "**", "**", "**",
    "**", "**"}], "******)"}]], "Input",
 CellChangeTimes->{{3.9867835999387913`*^9, 3.98678360261195*^9}, {
  3.986783647020643*^9, 3.986783662863043*^9}, {3.9867855670300956`*^9, 
  3.98678556937792*^9}, {3.9867856435710497`*^9, 3.9867858527484474`*^9}, {
  3.986786305346237*^9, 3.986786321167568*^9}, {3.986786366972536*^9, 
  3.986786367336728*^9}, {3.9869130917235003`*^9, 3.986913098036573*^9}, {
  3.987045225449087*^9, 3.987045258381492*^9}, {3.99900775500404*^9, 
  3.9990077681328163`*^9}},ExpressionUUID->"ab854493-7047-48be-9483-\
4fb00326b3d4"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", 
   RowBox[{
    RowBox[{"**", " ", 
     StyleBox["Example",
      FontSize->18,
      FontWeight->"Bold",
      FontColor->RGBColor[0., 0., 1.]]}], 
    StyleBox[" ",
     FontSize->18,
     FontWeight->"Bold",
     FontColor->RGBColor[0., 0., 1.]], 
    StyleBox["including",
     FontSize->18,
     FontWeight->"Bold",
     FontColor->RGBColor[0., 0., 1.]], 
    StyleBox[" ",
     FontSize->18,
     FontWeight->"Bold",
     FontColor->RGBColor[0., 0., 1.]], 
    StyleBox["phase",
     FontSize->18,
     FontWeight->"Bold",
     FontColor->RGBColor[0., 0., 1.]], 
    StyleBox[" ",
     FontSize->18,
     FontWeight->"Bold",
     FontColor->RGBColor[0., 0., 1.]], 
    StyleBox["fixing",
     FontSize->18,
     FontWeight->"Bold",
     FontColor->RGBColor[0., 0., 1.]]}], 
   StyleBox[" ",
    FontSize->18,
    FontWeight->"Bold",
    FontColor->RGBColor[0., 0., 1.]], "***)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    RowBox[{"p", "=", "7"}], ";"}], 
   RowBox[{"(*", "  ", 
    RowBox[{"Number", " ", "of", " ", "orbits"}], " ", "*)"}], " ", 
   "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{"k", "=", "14"}], ";"}], 
   RowBox[{"(*", " ", 
    RowBox[{"Number", " ", "of", " ", "nucleon", " ", "pairs"}], " ", "*)"}], 
   "\[IndentingNewLine]", 
   RowBox[{"(*", 
    RowBox[{
     RowBox[{"*", " ", 
      StyleBox["Input",
       FontSize->18,
       FontWeight->"Bold",
       FontColor->RGBColor[0., 0., 0.]], 
      StyleBox[" ",
       FontSize->18,
       FontWeight->"Bold",
       FontColor->RGBColor[0., 0., 0.]], 
      StyleBox["Quasispins",
       FontSize->18,
       FontWeight->"Bold",
       FontColor->RGBColor[0., 0., 0.]], 
      StyleBox[" ",
       FontSize->18,
       FontWeight->"Bold",
       FontColor->RGBColor[0., 0., 0.]], 
      StyleBox["for",
       FontSize->18,
       FontWeight->"Bold",
       FontColor->RGBColor[0., 0., 0.]], 
      StyleBox[" ",
       FontSize->18,
       FontWeight->"Bold",
       FontColor->RGBColor[0., 0., 0.]], 
      StyleBox["126",
       FontSize->18,
       FontWeight->"Bold",
       FontColor->RGBColor[0., 0., 0.]]}], 
     StyleBox["-",
      FontSize->18,
      FontWeight->"Bold",
      FontColor->RGBColor[0., 0., 0.]], 
     StyleBox[
      RowBox[{"184", " ", "shell"}],
      FontSize->18,
      FontWeight->"Bold",
      FontColor->RGBColor[0., 0., 0.]]}], " ", "**)"}], 
   RowBox[{
    RowBox[{"{", 
     RowBox[{
      RowBox[{
       RowBox[{"S", "[", "1", "]"}], "=", 
       RowBox[{"5", "/", "2"}]}], ",", 
      RowBox[{
       RowBox[{"S", "[", "2", "]"}], "=", 
       RowBox[{"3", "/", "2"}]}], ",", 
      RowBox[{
       RowBox[{"S", "[", "3", "]"}], "=", 
       RowBox[{"6", "/", "2"}]}], ",", 
      RowBox[{
       RowBox[{"S", "[", "4", "]"}], "=", 
       RowBox[{"4", "/", "2"}]}], ",", 
      RowBox[{
       RowBox[{"S", "[", "5", "]"}], "=", 
       RowBox[{"1", "/", "2"}]}], ",", 
      RowBox[{
       RowBox[{"S", "[", "6", "]"}], "=", 
       RowBox[{"2", "/", "2"}]}], ",", 
      RowBox[{
       RowBox[{"S", "[", "7", "]"}], "=", 
       RowBox[{"8", "/", "2"}]}]}], "}"}], ";"}], "\n", 
   RowBox[{
    RowBox[{"Table", "[", 
     RowBox[{
      RowBox[{
       RowBox[{"epsilon", "[", "i", "]"}], "=", "i"}], ",", 
      RowBox[{"{", 
       RowBox[{"i", ",", "p"}], "}"}]}], "]"}], ";"}], " ", 
   RowBox[{"(*", 
    RowBox[{
     RowBox[{
      RowBox[{"--", 
       RowBox[{"--", 
        StyleBox["Input",
         FontSize->18,
         FontWeight->"Bold",
         FontColor->RGBColor[0., 0., 0.]]}]}], 
      StyleBox[" ",
       FontSize->18,
       FontWeight->"Bold",
       FontColor->RGBColor[0., 0., 0.]], 
      StyleBox["single",
       FontSize->18,
       FontWeight->"Bold",
       FontColor->RGBColor[0., 0., 0.]]}], 
     StyleBox["-",
      FontSize->18,
      FontWeight->"Bold",
      FontColor->RGBColor[0., 0., 0.]], 
     RowBox[{
      StyleBox["particle",
       FontSize->18,
       FontWeight->"Bold",
       FontColor->RGBColor[0., 0., 0.]], 
      StyleBox[" ",
       FontSize->18,
       FontWeight->"Bold",
       FontColor->RGBColor[0., 0., 0.]], 
      RowBox[{
       RowBox[{
        StyleBox["energies",
         FontSize->18,
         FontWeight->"Bold",
         FontColor->RGBColor[0., 0., 0.]], "--"}], "--"}]}], "-"}], "*)"}], 
   "\n", 
   RowBox[{
    RowBox[{"Table", "[", 
     RowBox[{
      RowBox[{
       RowBox[{"G", "[", 
        RowBox[{"i", ",", "j"}], "]"}], "=", 
       RowBox[{
        RowBox[{"-", "1."}], "/", "2"}]}], ",", 
      RowBox[{"{", 
       RowBox[{"i", ",", "p"}], "}"}], ",", 
      RowBox[{"{", 
       RowBox[{"j", ",", "p"}], "}"}]}], "]"}], ";"}], " ", 
   RowBox[{"(*", 
    RowBox[{
     RowBox[{
      RowBox[{"--", 
       RowBox[{"--", 
        StyleBox["Input",
         FontSize->18,
         FontWeight->"Bold",
         FontColor->RGBColor[0., 0., 0.]]}]}], 
      StyleBox[" ",
       FontSize->18,
       FontWeight->"Bold",
       FontColor->RGBColor[0., 0., 0.]], 
      StyleBox["Pairing",
       FontSize->18,
       FontWeight->"Bold",
       FontColor->RGBColor[0., 0., 0.]], 
      StyleBox[" ",
       FontSize->18,
       FontWeight->"Bold",
       FontColor->RGBColor[0., 0., 0.]], 
      RowBox[{
       RowBox[{
        StyleBox["strangths",
         FontSize->18,
         FontWeight->"Bold",
         FontColor->RGBColor[0., 0., 0.]], "--"}], "--"}]}], "-"}], "*)"}], 
   "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{"Result", "=", 
     RowBox[{"GnPairing", "[", 
      RowBox[{"p", ",", "k", ",", "S", ",", "epsilon", ",", "G"}], "]"}]}], 
    ";"}], "\n", 
   RowBox[{
    RowBox[{"Hp", "=", 
     RowBox[{"Result", "[", "\"\<Hamiltonian\>\"", "]"}]}], ";"}], "   ", 
   RowBox[{"(*", " ", 
    StyleBox[
     RowBox[{
     "Hp", " ", "denotes", " ", "the", " ", "final", " ", "Hamiltonian", " ", 
      "matirx"}],
     FontSize->18,
     FontWeight->"Bold",
     FontColor->RGBColor[0., 0., 0.]], 
    StyleBox[" ",
     FontSize->18,
     FontWeight->"Bold",
     FontColor->RGBColor[0., 0., 0.]], "*)"}], "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{
     RowBox[{"{", 
      RowBox[{"vals", ",", "vecs"}], "}"}], "=", 
     RowBox[{"Eigensystem", "[", 
      RowBox[{
       RowBox[{"N", "[", "Hp", "]"}], ",", 
       RowBox[{"-", "7"}], ",", 
       RowBox[{"Method", "->", "\"\<Arnoldi\>\""}]}], "]"}]}], ";"}], 
   "\[IndentingNewLine]", 
   RowBox[{"(*", " ", 
    RowBox[{
    "===", "===", "===", "===", "===", "===", "===", "===", "===", "===", "===",
      "===", "===", "===", "===", "===", "===", "===", "===", "===", 
     "\[Equal]"}], "*)"}], "\[IndentingNewLine]", 
   RowBox[{"(*", 
    StyleBox[
     RowBox[{
     "Deterministic", " ", "phase", " ", "fixing", " ", "of", " ", "real", 
      " ", "eigenvectors", " ", "added"}],
     FontWeight->"Bold",
     FontColor->RGBColor[0., 0., 1.]], " ", "*)"}], "\[IndentingNewLine]", 
   RowBox[{"(*", 
    RowBox[{
     StyleBox["The",
      FontSize->16,
      FontWeight->"Bold",
      FontColor->RGBColor[0., 0., 1.]], 
     StyleBox[" ",
      FontSize->16,
      FontWeight->"Bold",
      FontColor->RGBColor[0., 0., 1.]], 
     StyleBox["first",
      FontSize->16,
      FontWeight->"Bold",
      FontColor->RGBColor[0., 0., 1.]], 
     StyleBox[" ",
      FontSize->16,
      FontWeight->"Bold",
      FontColor->RGBColor[0., 0., 1.]], 
     StyleBox["numerically",
      FontSize->16,
      FontWeight->"Bold",
      FontColor->RGBColor[0., 0., 1.]], 
     StyleBox[" ",
      FontSize->16,
      FontWeight->"Bold",
      FontColor->RGBColor[0., 0., 1.]], 
     StyleBox["nonzero",
      FontSize->16,
      FontWeight->"Bold",
      FontColor->RGBColor[0., 0., 1.]], 
     StyleBox[" ",
      FontSize->16,
      FontWeight->"Bold",
      FontColor->RGBColor[0., 0., 1.]], 
     StyleBox["component",
      FontSize->16,
      FontWeight->"Bold",
      FontColor->RGBColor[0., 0., 1.]], 
     StyleBox[" ",
      FontSize->16,
      FontWeight->"Bold",
      FontColor->RGBColor[0., 0., 1.]], 
     StyleBox["is",
      FontSize->16,
      FontWeight->"Bold",
      FontColor->RGBColor[0., 0., 1.]], 
     StyleBox[" ",
      FontSize->16,
      FontWeight->"Bold",
      FontColor->RGBColor[0., 0., 1.]], 
     StyleBox["made",
      FontSize->16,
      FontWeight->"Bold",
      FontColor->RGBColor[0., 0., 1.]], 
     StyleBox[" ",
      FontSize->16,
      FontWeight->"Bold",
      FontColor->RGBColor[0., 0., 1.]], 
     RowBox[{
      StyleBox["positive",
       FontSize->16,
       FontWeight->"Bold",
       FontColor->RGBColor[0., 0., 1.]], "."}]}], "*)"}], 
   RowBox[{"(*", 
    RowBox[{
    "===", "===", "===", "===", "===", "===", "===", "===", "===", "===", "===",
      "===", "===", "===", "===", "===", "===", "===", "===", "===", 
     "\[Equal]"}], "*)"}], "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{"PhaseFixEigenvectors", "[", 
     RowBox[{"vecs_", ",", 
      RowBox[{"tol_:", " ", 
       RowBox[{"10", "^", 
        RowBox[{"-", "12"}]}]}]}], "]"}], ":=", 
    RowBox[{"Map", "[", 
     RowBox[{
      RowBox[{"Function", "[", 
       RowBox[{"v", ",", 
        RowBox[{"Module", "[", 
         RowBox[{
          RowBox[{"{", "pos", "}"}], ",", 
          RowBox[{
           RowBox[{"pos", "=", 
            RowBox[{"FirstPosition", "[", 
             RowBox[{
              RowBox[{"Abs", "[", "v", "]"}], ",", 
              RowBox[{"x_", "/;", 
               RowBox[{"x", ">", "tol"}]}]}], "]"}]}], ";", 
           "\[IndentingNewLine]", 
           RowBox[{"If", "[", 
            RowBox[{
             RowBox[{
              RowBox[{"v", "[", 
               RowBox[{"[", 
                RowBox[{"First", "[", "pos", "]"}], "]"}], "]"}], "<", "0"}], 
             ",", 
             RowBox[{"-", "v"}], ",", "v"}], "]"}]}]}], "]"}]}], "]"}], ",", 
      "vecs"}], "]"}]}], "\[IndentingNewLine]", "   ", 
   RowBox[{
    RowBox[{"vecs", "=", 
     RowBox[{"PhaseFixEigenvectors", "[", "vecs", "]"}]}], ";"}], 
   "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{"Print", "[", "\"\<The first 7 Eigenvalues=\>\"", "]"}], ";", " ",
     "vals"}], "\[IndentingNewLine]", " "}]}]], "Input",
 CellChangeTimes->{
  3.9864609289165583`*^9, {3.986461007936675*^9, 3.9864610122789083`*^9}, {
   3.986461155342014*^9, 3.986461156618616*^9}, {3.986637765592903*^9, 
   3.986637769878475*^9}, {3.98663781953179*^9, 3.986637820282522*^9}, {
   3.986637851667195*^9, 3.9866378532466106`*^9}, {3.9866438847120304`*^9, 
   3.986643885994194*^9}, 3.986644176874618*^9, {3.986644854764589*^9, 
   3.986644889876955*^9}, {3.98664515900326*^9, 3.986645166932436*^9}, {
   3.9866641706903934`*^9, 3.9866641807379017`*^9}, {3.9866869617187977`*^9, 
   3.986686972519569*^9}, {3.986704235539936*^9, 3.986704256263817*^9}, 
   3.986704291664741*^9, 3.986704410751129*^9, {3.9867046993478317`*^9, 
   3.986704899521368*^9}, {3.9867050792233353`*^9, 3.9867050847552147`*^9}, {
   3.986705279305723*^9, 3.9867052802119884`*^9}, {3.986705337924701*^9, 
   3.986705339143274*^9}, {3.986709861535164*^9, 3.9867098745378666`*^9}, {
   3.986710147853409*^9, 3.9867101495256233`*^9}, {3.986724314484934*^9, 
   3.986724337382456*^9}, {3.986724367559641*^9, 3.98672437896838*^9}, {
   3.9867246494834805`*^9, 3.9867246696111736`*^9}, {3.986724707493851*^9, 
   3.986724713964466*^9}, {3.986724825015581*^9, 3.9867248415196347`*^9}, {
   3.9867249763216095`*^9, 3.986724980587553*^9}, {3.986750996672447*^9, 
   3.9867509991420135`*^9}, {3.986752569757057*^9, 3.986752572444996*^9}, {
   3.9867580679258137`*^9, 3.9867580743174744`*^9}, {3.9867813831428165`*^9, 
   3.9867814065728874`*^9}, {3.9867814439650936`*^9, 3.986781458905409*^9}, {
   3.9867815215887628`*^9, 3.986781537345167*^9}, {3.9867826959562*^9, 
   3.9867827712045794`*^9}, {3.986783280260973*^9, 3.9867833008857384`*^9}, {
   3.986783360010024*^9, 3.986783360695979*^9}, {3.986783411675425*^9, 
   3.986783439863075*^9}, 3.986784250137096*^9, 3.986785296703055*^9, 
   3.986785917929716*^9, {3.98678678824104*^9, 3.986786791726673*^9}, {
   3.9869129872508717`*^9, 3.98691299550977*^9}, 3.9869130379488735`*^9, {
   3.987045656596034*^9, 3.9870456657325497`*^9}, 3.988293608371174*^9, 
   3.998136611982518*^9, {3.9981366424150825`*^9, 3.9981366811764355`*^9}, {
   3.9981367116291866`*^9, 3.998136746814767*^9}, {3.9990076505973225`*^9, 
   3.9990076610036387`*^9}, {3.9990078150906897`*^9, 
   3.9990078597943287`*^9}, {3.999007913860521*^9, 3.999007931225934*^9}, {
   3.999008065069398*^9, 3.999008195911807*^9}},
 CellLabel->
  "In[1099]:=",ExpressionUUID->"1fead932-fdf7-4e4b-ac5f-31db937a0dc4"],

Cell[CellGroupData[{

Cell[BoxData["\<\"\\n== GnPairing Hamiltonian Builder ==\"\>"], "Print",
 CellChangeTimes->{
  3.986783367693139*^9, {3.98678341459843*^9, 3.986783442143033*^9}, 
   3.986783683580901*^9, 3.986784250764006*^9, 3.986786792742783*^9, 
   3.9868730245456467`*^9, 3.987045869566905*^9, 3.98721525673698*^9, 
   3.999007779012094*^9, 3.9990078266050253`*^9, 3.9990078608853817`*^9, {
   3.999007917110143*^9, 3.999007931881814*^9}, 3.9990080668808994`*^9, {
   3.9990081105526166`*^9, 3.9990081340055914`*^9}, {3.9990081646425667`*^9, 
   3.9990081977040524`*^9}},
 CellLabel->
  "\:6b63\:5728\:8ba1\:7b97In[1099]:=",ExpressionUUID->"85e7b3c6-f57c-435c-\
be0b-3c214c1d65d5"],

Cell[BoxData[
 InterpretationBox[
  RowBox[{"\<\"Dimension = \"\>", "\[InvisibleSpace]", "4095"}],
  SequenceForm["Dimension = ", 4095],
  Editable->False]], "Print",
 CellChangeTimes->{
  3.986783367693139*^9, {3.98678341459843*^9, 3.986783442143033*^9}, 
   3.986783683580901*^9, 3.986784250764006*^9, 3.986786792742783*^9, 
   3.9868730245456467`*^9, 3.987045869566905*^9, 3.98721525673698*^9, 
   3.999007779012094*^9, 3.9990078266050253`*^9, 3.9990078608853817`*^9, {
   3.999007917110143*^9, 3.999007931881814*^9}, 3.9990080668808994`*^9, {
   3.9990081105526166`*^9, 3.9990081340055914`*^9}, {3.9990081646425667`*^9, 
   3.999008197779619*^9}},
 CellLabel->
  "\:6b63\:5728\:8ba1\:7b97In[1099]:=",ExpressionUUID->"61179c6b-b4e1-4734-\
b89c-b05f8222502c"],

Cell[BoxData["\<\"Matrix built successfully.\"\>"], "Print",
 CellChangeTimes->{
  3.986783367693139*^9, {3.98678341459843*^9, 3.986783442143033*^9}, 
   3.986783683580901*^9, 3.986784250764006*^9, 3.986786792742783*^9, 
   3.9868730245456467`*^9, 3.987045869566905*^9, 3.98721525673698*^9, 
   3.999007779012094*^9, 3.9990078266050253`*^9, 3.9990078608853817`*^9, {
   3.999007917110143*^9, 3.999007931881814*^9}, 3.9990080668808994`*^9, {
   3.9990081105526166`*^9, 3.9990081340055914`*^9}, {3.9990081646425667`*^9, 
   3.999008199593591*^9}},
 CellLabel->
  "\:6b63\:5728\:8ba1\:7b97In[1099]:=",ExpressionUUID->"3b10ef1b-5be8-468c-\
9ab7-e561e454591a"],

Cell[BoxData["\<\"The first 7 Eigenvalues=\"\>"], "Print",
 CellChangeTimes->{
  3.986783367693139*^9, {3.98678341459843*^9, 3.986783442143033*^9}, 
   3.986783683580901*^9, 3.986784250764006*^9, 3.986786792742783*^9, 
   3.9868730245456467`*^9, 3.987045869566905*^9, 3.98721525673698*^9, 
   3.999007779012094*^9, 3.9990078266050253`*^9, 3.9990078608853817`*^9, {
   3.999007917110143*^9, 3.999007931881814*^9}, 3.9990080668808994`*^9, {
   3.9990081105526166`*^9, 3.9990081340055914`*^9}, {3.9990081646425667`*^9, 
   3.9990082008501015`*^9}},
 CellLabel->
  "\:6b63\:5728\:8ba1\:7b97In[1099]:=",ExpressionUUID->"f6bbaaea-4068-4623-\
82b1-ce6a9699b04f"]
}, Open  ]],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"-", "8.163863328857975`"}], ",", "6.663279186271989`", ",", 
   "6.54736727466213`", ",", "6.0719140614739295`", ",", "5.950980329132727`",
    ",", "5.739976871347154`", ",", "5.560631264863429`"}], "}"}]], "Output",
 CellChangeTimes->{{3.999008167778212*^9, 3.9990082008616104`*^9}},
 CellLabel->
  "Out[1108]=",ExpressionUUID->"8ebd4a9a-6cf1-4e21-b4f8-dcf4bd0e8a4b"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", 
   StyleBox[
    RowBox[{
    "Simple", " ", "Lanczos", " ", "Algorithm", " ", "For", " ", 
     "diagonalizing", " ", "Hp", " ", "of", " ", "the", " ", "above", " ", 
     "example"}],
    FontSize->18,
    FontColor->RGBColor[0, 0, 1]], "*)"}], "\[IndentingNewLine]", 
  "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    RowBox[{"ClearAll", "[", "LanczosEigenvalues", "]"}], ";"}], "\n", 
   RowBox[{
    RowBox[{
     RowBox[{"Options", "[", "LanczosEigenvalues", "]"}], "=", 
     RowBox[{"{", 
      RowBox[{
       RowBox[{"MaxIterations", "\[Rule]", "Automatic"}], ",", 
       RowBox[{"Tolerance", "\[Rule]", 
        RowBox[{"10", "^", 
         RowBox[{"-", "10"}]}]}], ",", 
       RowBox[{"\"\<Which\>\"", "\[Rule]", "\"\<Smallest\>\""}], ",", 
       RowBox[{"\"\<StartingVector\>\"", "\[Rule]", "Automatic"}], ",", 
       RowBox[{"\"\<ReturnVectors\>\"", "\[Rule]", "False"}]}], "}"}]}], 
    ";"}], "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{"LanczosEigenvalues", "[", 
     RowBox[{
      RowBox[{"A_", "?", "MatrixQ"}], ",", "k_Integer", ",", 
      RowBox[{"opts", ":", 
       RowBox[{"OptionsPattern", "[", "]"}]}]}], "]"}], ":=", 
    RowBox[{"Module", "[", 
     RowBox[{
      RowBox[{"{", 
       RowBox[{
       "n", ",", "maxIter", ",", "tol", ",", "which", ",", "v0", ",", "alpha",
         ",", "beta", ",", "V", ",", "w", ",", "j", ",", "m", ",", "T", ",", 
        "vals", ",", "vecs", ",", "idx", ",", "residual"}], "}"}], ",", 
      RowBox[{
       RowBox[{"n", "=", 
        RowBox[{"Length", "[", "A", "]"}]}], ";", "\[IndentingNewLine]", 
       RowBox[{"maxIter", "=", 
        RowBox[{"Replace", "[", 
         RowBox[{
          RowBox[{"OptionValue", "[", "MaxIterations", "]"}], ",", 
          RowBox[{"Automatic", "\[RuleDelayed]", 
           RowBox[{"Min", "[", 
            RowBox[{
             RowBox[{"Max", "[", 
              RowBox[{
               RowBox[{"4", " ", "k"}], ",", "20"}], "]"}], ",", "n"}], 
            "]"}]}]}], "]"}]}], ";", "\[IndentingNewLine]", 
       RowBox[{"tol", "=", 
        RowBox[{"Replace", "[", 
         RowBox[{
          RowBox[{"OptionValue", "[", "Tolerance", "]"}], ",", 
          RowBox[{"Automatic", "\[Rule]", 
           RowBox[{"10", "^", 
            RowBox[{"-", "10"}]}]}]}], "]"}]}], ";", "\[IndentingNewLine]", 
       RowBox[{"which", "=", 
        RowBox[{"OptionValue", "[", "\"\<Which\>\"", "]"}]}], ";", 
       "\[IndentingNewLine]", 
       RowBox[{"v0", "=", 
        RowBox[{"Replace", "[", 
         RowBox[{
          RowBox[{"OptionValue", "[", "\"\<StartingVector\>\"", "]"}], ",", 
          RowBox[{"Automatic", "\[RuleDelayed]", 
           RowBox[{"RandomReal", "[", 
            RowBox[{
             RowBox[{"{", 
              RowBox[{
               RowBox[{"-", "1"}], ",", "1"}], "}"}], ",", "n"}], "]"}]}]}], 
         "]"}]}], ";", "\[IndentingNewLine]", 
       RowBox[{"v0", "=", 
        RowBox[{"N", "[", 
         RowBox[{"v0", "/", 
          RowBox[{"Norm", "[", "v0", "]"}]}], "]"}]}], ";", 
       "\[IndentingNewLine]", 
       RowBox[{"alpha", "=", 
        RowBox[{"ConstantArray", "[", 
         RowBox[{"0.", ",", "maxIter"}], "]"}]}], ";", "\[IndentingNewLine]", 
       RowBox[{"beta", "=", 
        RowBox[{"ConstantArray", "[", 
         RowBox[{"0.", ",", "maxIter"}], "]"}]}], ";", "\[IndentingNewLine]", 
       RowBox[{"V", "=", 
        RowBox[{"ConstantArray", "[", 
         RowBox[{"0.", ",", 
          RowBox[{"{", 
           RowBox[{"maxIter", ",", "n"}], "}"}]}], "]"}]}], ";", 
       "\[IndentingNewLine]", 
       RowBox[{
        RowBox[{"V", "[", 
         RowBox[{"[", "1", "]"}], "]"}], "=", "v0"}], ";", 
       "\[IndentingNewLine]", 
       RowBox[{"w", "=", 
        RowBox[{"A", ".", 
         RowBox[{"V", "[", 
          RowBox[{"[", "1", "]"}], "]"}]}]}], ";", "\[IndentingNewLine]", 
       RowBox[{
        RowBox[{"alpha", "[", 
         RowBox[{"[", "1", "]"}], "]"}], "=", 
        RowBox[{
         RowBox[{"V", "[", 
          RowBox[{"[", "1", "]"}], "]"}], ".", "w"}]}], ";", 
       "\[IndentingNewLine]", 
       RowBox[{"w", "=", 
        RowBox[{"w", "-", 
         RowBox[{
          RowBox[{"alpha", "[", 
           RowBox[{"[", "1", "]"}], "]"}], " ", 
          RowBox[{"V", "[", 
           RowBox[{"[", "1", "]"}], "]"}]}]}]}], ";", "\[IndentingNewLine]", 
       RowBox[{
        RowBox[{"beta", "[", 
         RowBox[{"[", "1", "]"}], "]"}], "=", 
        RowBox[{"Norm", "[", "w", "]"}]}], ";", "\[IndentingNewLine]", 
       RowBox[{"m", "=", "1"}], ";", "\[IndentingNewLine]", 
       RowBox[{"For", "[", 
        RowBox[{
         RowBox[{"j", "=", "2"}], ",", 
         RowBox[{"j", "\[LessEqual]", "maxIter"}], ",", 
         RowBox[{"j", "++"}], ",", 
         RowBox[{
          RowBox[{"If", "[", 
           RowBox[{
            RowBox[{
             RowBox[{"beta", "[", 
              RowBox[{"[", 
               RowBox[{"j", "-", "1"}], "]"}], "]"}], "<", "tol"}], ",", 
            RowBox[{
             RowBox[{"Break", "[", "]"}], ";"}]}], "]"}], ";", 
          "\[IndentingNewLine]", 
          RowBox[{
           RowBox[{"V", "[", 
            RowBox[{"[", "j", "]"}], "]"}], "=", 
           RowBox[{"w", "/", 
            RowBox[{"beta", "[", 
             RowBox[{"[", 
              RowBox[{"j", "-", "1"}], "]"}], "]"}]}]}], ";", 
          "\[IndentingNewLine]", 
          RowBox[{"w", "=", 
           RowBox[{"A", ".", 
            RowBox[{"V", "[", 
             RowBox[{"[", "j", "]"}], "]"}]}]}], ";", "\[IndentingNewLine]", 
          RowBox[{
           RowBox[{"alpha", "[", 
            RowBox[{"[", "j", "]"}], "]"}], "=", 
           RowBox[{
            RowBox[{"V", "[", 
             RowBox[{"[", "j", "]"}], "]"}], ".", "w"}]}], ";", 
          "\[IndentingNewLine]", 
          RowBox[{"w", "=", 
           RowBox[{"w", "-", 
            RowBox[{
             RowBox[{"alpha", "[", 
              RowBox[{"[", "j", "]"}], "]"}], " ", 
             RowBox[{"V", "[", 
              RowBox[{"[", "j", "]"}], "]"}]}], "-", 
            RowBox[{
             RowBox[{"beta", "[", 
              RowBox[{"[", 
               RowBox[{"j", "-", "1"}], "]"}], "]"}], " ", 
             RowBox[{"V", "[", 
              RowBox[{"[", 
               RowBox[{"j", "-", "1"}], "]"}], "]"}]}]}]}], ";", 
          "\[IndentingNewLine]", 
          RowBox[{"(*", 
           RowBox[{"Full", " ", "reorthogonalization"}], "*)"}], 
          RowBox[{"w", "=", 
           RowBox[{"w", "-", 
            RowBox[{"Sum", "[", 
             RowBox[{
              RowBox[{
               RowBox[{"(", 
                RowBox[{
                 RowBox[{"V", "[", 
                  RowBox[{"[", "i", "]"}], "]"}], ".", "w"}], ")"}], " ", 
               RowBox[{"V", "[", 
                RowBox[{"[", "i", "]"}], "]"}]}], ",", 
              RowBox[{"{", 
               RowBox[{"i", ",", "1", ",", "j"}], "}"}]}], "]"}]}]}], ";", 
          "\[IndentingNewLine]", 
          RowBox[{
           RowBox[{"beta", "[", 
            RowBox[{"[", "j", "]"}], "]"}], "=", 
           RowBox[{"Norm", "[", "w", "]"}]}], ";", "\[IndentingNewLine]", 
          RowBox[{"m", "=", "j"}], ";"}]}], "]"}], ";", "\[IndentingNewLine]", 
       RowBox[{"(*", 
        RowBox[{"Build", " ", "tridiagonal", " ", "matrix"}], "*)"}], 
       RowBox[{"T", "=", 
        RowBox[{"SparseArray", "[", 
         RowBox[{
          RowBox[{"{", 
           RowBox[{
            RowBox[{
             RowBox[{"Band", "[", 
              RowBox[{"{", 
               RowBox[{"1", ",", "1"}], "}"}], "]"}], "\[Rule]", 
             RowBox[{"alpha", "[", 
              RowBox[{"[", 
               RowBox[{"1", ";;", "m"}], "]"}], "]"}]}], ",", 
            RowBox[{
             RowBox[{"Band", "[", 
              RowBox[{"{", 
               RowBox[{"2", ",", "1"}], "}"}], "]"}], "\[Rule]", 
             RowBox[{"beta", "[", 
              RowBox[{"[", 
               RowBox[{"1", ";;", 
                RowBox[{"m", "-", "1"}]}], "]"}], "]"}]}], ",", 
            RowBox[{
             RowBox[{"Band", "[", 
              RowBox[{"{", 
               RowBox[{"1", ",", "2"}], "}"}], "]"}], "\[Rule]", 
             RowBox[{"beta", "[", 
              RowBox[{"[", 
               RowBox[{"1", ";;", 
                RowBox[{"m", "-", "1"}]}], "]"}], "]"}]}]}], "}"}], ",", 
          RowBox[{"{", 
           RowBox[{"m", ",", "m"}], "}"}]}], "]"}]}], ";", 
       "\[IndentingNewLine]", 
       RowBox[{
        RowBox[{"{", 
         RowBox[{"vals", ",", "vecs"}], "}"}], "=", 
        RowBox[{"Eigensystem", "[", 
         RowBox[{"Normal", "[", "T", "]"}], "]"}]}], ";", 
       "\[IndentingNewLine]", 
       RowBox[{"idx", "=", 
        RowBox[{"Switch", "[", 
         RowBox[{"which", ",", "\"\<Smallest\>\"", ",", 
          RowBox[{"Ordering", "[", 
           RowBox[{"vals", ",", "k"}], "]"}], ",", "\"\<Largest\>\"", ",", 
          RowBox[{"Ordering", "[", 
           RowBox[{"vals", ",", 
            RowBox[{"-", "k"}]}], "]"}], ",", "_", ",", 
          RowBox[{"Ordering", "[", 
           RowBox[{"vals", ",", "k"}], "]"}]}], "]"}]}], ";", 
       "\[IndentingNewLine]", 
       RowBox[{"vals", "=", 
        RowBox[{"vals", "[", 
         RowBox[{"[", "idx", "]"}], "]"}]}], ";", "\[IndentingNewLine]", 
       RowBox[{"vecs", "=", 
        RowBox[{"vecs", "[", 
         RowBox[{"[", "idx", "]"}], "]"}]}], ";", "\[IndentingNewLine]", 
       RowBox[{"If", "[", 
        RowBox[{
         RowBox[{"TrueQ", "[", 
          RowBox[{"OptionValue", "[", "\"\<ReturnVectors\>\"", "]"}], "]"}], 
         ",", 
         RowBox[{"{", 
          RowBox[{"vals", ",", 
           RowBox[{"vecs", ".", 
            RowBox[{"V", "[", 
             RowBox[{"[", 
              RowBox[{"1", ";;", "m"}], "]"}], "]"}]}]}], "}"}], ",", 
         "vals"}], "]"}]}]}], "]"}]}], "\[IndentingNewLine]", 
   RowBox[{"(*", 
    RowBox[{"The", " ", "first", " ", "7", "  ", "eigenvalues"}], "*)"}], 
   "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{"Print", "[", 
     RowBox[{"Timing", "[", 
      RowBox[{"eigenvals", "=", 
       RowBox[{"LanczosEigenvalues", "[", 
        RowBox[{"Hp", ",", "50", ",", 
         RowBox[{"\"\<Which\>\"", "\[Rule]", "\"\<Smallest\>\""}], ",", 
         RowBox[{"Tolerance", "\[Rule]", 
          RowBox[{"10", "^", 
           RowBox[{"-", "8"}]}]}]}], "]"}]}], "]"}], "]"}], 
    StyleBox[
     RowBox[{
      StyleBox["(*",
       FontColor->RGBColor[0, 0, 1]], 
      StyleBox[
       RowBox[{
       "CPU", " ", "time", " ", "and", " ", "the", " ", "first", " ", "a", 
        " ", "few", " ", "eigenvalues", " ", "of", " ", "Hp"}],
       FontColor->GrayLevel[0]], 
      StyleBox[" ",
       FontColor->RGBColor[0, 0, 1]], 
      StyleBox["*)",
       FontColor->RGBColor[0, 0, 1]]}],
     FontFamily->"Times New Roman",
     FontSize->16,
     FontWeight->"Bold"], ";"}], "\n", 
   RowBox[{"Table", "[", 
    RowBox[{
     RowBox[{"eigenvals", "[", 
      RowBox[{"[", "i", "]"}], "]"}], ",", 
     RowBox[{"{", 
      RowBox[{"i", ",", "1", ",", "7"}], "}"}]}], "]"}], "     ", 
   StyleBox[
    RowBox[{
     StyleBox["(*",
      FontColor->RGBColor[0, 0, 1]], 
     StyleBox[
      RowBox[{
      "CPU", " ", "time", " ", "and", " ", "the", " ", "first", " ", "a", " ",
        "few", " ", "eigenvalues"}],
      FontColor->GrayLevel[0]], 
     StyleBox[" ",
      FontColor->RGBColor[0, 0, 1]], 
     StyleBox["*)",
      FontColor->RGBColor[0, 0, 1]]}],
    FontFamily->"Times New Roman",
    FontSize->16,
    FontWeight->"Bold"], 
   StyleBox["\[IndentingNewLine]",
    FontFamily->"Times New Roman",
    FontSize->16,
    FontWeight->"Bold",
    FontColor->RGBColor[0, 0, 1]], 
   StyleBox["\[IndentingNewLine]",
    FontFamily->"Times New Roman",
    FontSize->16,
    FontWeight->"Bold",
    FontColor->RGBColor[0, 0, 1]]}]}]], "Input",
 CellChangeTimes->{{3.988276095713011*^9, 3.988276095715513*^9}, {
   3.988276623900264*^9, 3.988276642813173*^9}, {3.988288829923405*^9, 
   3.98828886346265*^9}, {3.988290603063081*^9, 3.9882906043598194`*^9}, {
   3.988293160615267*^9, 3.9882931628308353`*^9}, {3.9882938424469595`*^9, 
   3.9882938567182617`*^9}, {3.988294020469504*^9, 3.98829405309358*^9}, {
   3.988294092013819*^9, 3.988294127726717*^9}, {3.9882942916882305`*^9, 
   3.988294355509037*^9}, {3.988294401188011*^9, 3.9882944149482136`*^9}, {
   3.9883125954708633`*^9, 3.9883125962479334`*^9}, {3.9883134838112087`*^9, 
   3.9883134855455704`*^9}, 3.9883138318238564`*^9, 3.9990077385384865`*^9, {
   3.999007891017423*^9, 3.99900789302092*^9}, {3.9990079462794805`*^9, 
   3.999008019716819*^9}},
 CellLabel->
  "In[1044]:=",ExpressionUUID->"380990dc-0295-4216-a6c2-a2ebdd94f08f"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"1.1875`", ",", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"-", "8.163863328862561`"}], ",", "5.560631264863616`", ",", 
     "5.7399768713471815`", ",", "5.950980329132747`", ",", 
     "6.071914061473654`", ",", "6.547367274662185`", ",", 
     "6.663279186271509`", ",", "18.140958407320653`", ",", 
     "18.31865417295728`", ",", "18.59049740661811`", ",", 
     "18.662983023502495`", ",", "18.71658398430386`", ",", 
     "18.798424608689743`", ",", "19.03598740517253`", ",", 
     "19.160783367878878`", ",", "19.255068874424772`", ",", 
     "19.323883793365752`", ",", "19.348573344854955`", ",", 
     "19.420064027340175`", ",", "19.615888989340572`", ",", 
     "19.651119977942564`", ",", "19.655330333736593`", ",", 
     "19.777374666182162`", ",", "20.08106071738544`", ",", 
     "20.24688905568098`", ",", "20.580991461607585`", ",", 
     "20.712680771222193`", ",", "29.51927656660854`", ",", 
     "29.69608250664325`", ",", "30.067394033111654`", ",", 
     "30.161530691863778`", ",", "30.551459775987098`", ",", 
     "30.790691736708396`", ",", "30.951645539302433`", ",", 
     "31.154903827144466`", ",", "31.490833890458987`", ",", 
     "31.721405986291302`", ",", "32.02395767890741`", ",", 
     "32.346617465253985`", ",", "32.61479044149513`", ",", 
     "32.77819564638199`", ",", "33.145356583463354`", ",", 
     "34.13823860427943`", ",", "34.16644522299462`", ",", 
     "39.58690647747835`", ",", "39.781926008995754`", ",", 
     "40.208174380181205`", ",", "40.79800048465869`", ",", 
     "41.11000499256559`", ",", "41.62461017470115`"}], "}"}]}], 
  "}"}]], "Print",
 CellChangeTimes->{3.988321872730488*^9, 3.9990078988726997`*^9, 
  3.999008034672749*^9},
 CellLabel->
  "\:6b63\:5728\:8ba1\:7b97In[1044]:=",ExpressionUUID->"2e01ca0e-2e3c-484f-\
a9a7-4b9836f233b5"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"-", "8.163863328862561`"}], ",", "5.560631264863616`", ",", 
   "5.7399768713471815`", ",", "5.950980329132747`", ",", 
   "6.071914061473654`", ",", "6.547367274662185`", ",", 
   "6.663279186271509`"}], "}"}]], "Output",
 CellChangeTimes->{3.988321872730488*^9, 3.9990078988792048`*^9, 
  3.9990080346812553`*^9},
 CellLabel->
  "Out[1048]=",ExpressionUUID->"9b84be01-6d3d-4b8f-b4f1-3bf184fb0aac"]
}, Open  ]]
},
WindowSize->{1063, 680},
WindowMargins->{{96, Automatic}, {Automatic, 141}},
FrontEndVersion->"12.0 for Microsoft Windows (64-bit) (2019\:5e744\:67088\
\:65e5)",
StyleDefinitions->"Default.nb"
]
(* End of Notebook Content *)

(* Internal cache information *)
(*CellTagsOutline
CellTagsIndex->{}
*)
(*CellTagsIndex
CellTagsIndex->{}
*)
(*NotebookFileOutline
Notebook[{
Cell[558, 20, 24417, 592, 1805, "Input",ExpressionUUID->"fa5bc0f6-a51f-45ee-a587-3f2dc96318e9"],
Cell[24978, 614, 679, 12, 28, "Input",ExpressionUUID->"ab854493-7047-48be-9483-4fb00326b3d4"],
Cell[CellGroupData[{
Cell[25682, 630, 12645, 377, 526, "Input",ExpressionUUID->"1fead932-fdf7-4e4b-ac5f-31db937a0dc4"],
Cell[CellGroupData[{
Cell[38352, 1011, 669, 11, 42, "Print",ExpressionUUID->"85e7b3c6-f57c-435c-be0b-3c214c1d65d5"],
Cell[39024, 1024, 761, 15, 22, "Print",ExpressionUUID->"61179c6b-b4e1-4734-b89c-b05f8222502c"],
Cell[39788, 1041, 655, 11, 24, "Print",ExpressionUUID->"3b10ef1b-5be8-468c-9ab7-e561e454591a"],
Cell[40446, 1054, 655, 11, 24, "Print",ExpressionUUID->"f6bbaaea-4068-4623-82b1-ce6a9699b04f"]
}, Open  ]],
Cell[41116, 1068, 421, 8, 34, "Output",ExpressionUUID->"8ebd4a9a-6cf1-4e21-b4f8-dcf4bd0e8a4b"]
}, Open  ]],
Cell[CellGroupData[{
Cell[41574, 1081, 12794, 330, 1271, "Input",ExpressionUUID->"380990dc-0295-4216-a6c2-a2ebdd94f08f"],
Cell[54371, 1413, 1853, 35, 81, "Print",ExpressionUUID->"2e01ca0e-2e3c-484f-a9a7-4b9836f233b5"],
Cell[56227, 1450, 451, 10, 34, "Output",ExpressionUUID->"9b84be01-6d3d-4b8f-b4f1-3bf184fb0aac"]
}, Open  ]]
}
]
*)

