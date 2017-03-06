\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{tulthesis}[2014/04/27 TUL thesis class version 1.0]

\newcommand{\TUL@levelCZ}{Bakal\'{a}\v{r}sk\'{a} pr\'{a}ce}
\newcommand{\TUL@levelEN}{Bachelor thesis}
\newcommand{\TUL@kat}{BP}

\DeclareOption{EN}{\PassOptionsToPackage{\CurrentOption}{EN}}
\DeclareOption{BP}{}
\DeclareOption{DP}{
    \renewcommand{\TUL@levelCZ}{Diplomov\'{a} pr\'{a}ce}
    \renewcommand{\TUL@levelEN}{Diploma thesis}
    \renewcommand{\TUL@kat}{DP}}
\DeclareOption{Dis}{
    \renewcommand{\TUL@levelCZ}{Diserta\v cn\'\i\ pr\'{a}ce}
    \renewcommand{\TUL@levelEN}{Dissertation}
    \renewcommand{\TUL@kat}{Dis}}
\DeclareOption{RP}{
    \renewcommand{\TUL@levelCZ}{Ro\v cn\'\i kov\'y projekt}
    \renewcommand{\TUL@levelEN}{Project report}
    \renewcommand{\TUL@kat}{RP}}
\DeclareOption{MP}{
    \renewcommand{\TUL@levelCZ}{Magistersk\'y projekt}
    \renewcommand{\TUL@levelEN}{Project report}
    \renewcommand{\TUL@kat}{MP}}
\DeclareOption{FS}{\PassOptionsToPackage{\CurrentOption}{tul}}
\DeclareOption{FT}{\PassOptionsToPackage{\CurrentOption}{tul}}
\DeclareOption{FP}{\PassOptionsToPackage{\CurrentOption}{tul}}
\DeclareOption{EF}{\PassOptionsToPackage{\CurrentOption}{tul}}
\DeclareOption{FA}{\PassOptionsToPackage{\CurrentOption}{tul}}
\DeclareOption{FM}{\PassOptionsToPackage{\CurrentOption}{tul}}
\DeclareOption{UZS}{\PassOptionsToPackage{\CurrentOption}{tul}}
\DeclareOption{CXI}{\PassOptionsToPackage{\CurrentOption}{tul}}
\DeclareOption{bwtitles}{\PassOptionsToPackage{\CurrentOption}{tul}}
\DeclareOption{bw}{\PassOptionsToPackage{\CurrentOption}{tul}}
\DeclareOption{fonts}{\PassOptionsToPackage{\CurrentOption}{tul}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions\relax

\LoadClass[a4paper,12pt]{report}

\RequirePackage[noheader]{tul}
\noTULfooter

\RequirePackage{ifthen}
\RequirePackage{tabularx}

\newcommand{\TULthesisType}[2]{\renewcommand{\TUL@levelCZ}{#1}%
\renewcommand{\TUL@levelEN}{#2}}

\newcommand{\TUL@nazevCZ}{Chyb\'\i\ \textbackslash TULtitle\{\v{c}esky\}\{anglicky\}}
\newcommand{\TUL@nazevEN}{English title}
\newcommand{\TULtitle}[2]{\renewcommand{\TUL@nazevCZ}{#1}%
\renewcommand{\TUL@nazevEN}{#2}}

\newcommand{\TUL@autor}{Chyb\'\i\ \textbackslash TULauthor\{jm\'eno\}}
\newcommand{\TULauthor}[1]{\renewcommand{\TUL@autor}{#1}}

\newcommand{\TUL@vedouci}{Chyb\'\i\ \textbackslash TULsupervisor\{jm\'eno\}}
\newcommand{\TULsupervisor}[1]{\renewcommand{\TUL@vedouci}{#1}}

\newcommand{\TUL@programCZ}{Chyb\'\i\ \textbackslash TULprogramme\{k\'od\}\{\v{c}esky\}\{anglicky\}}
\newcommand{\TUL@programEN}{Study Programme}
\newcommand{\TULprogramme}[2]{\renewcommand{\TUL@programCZ}{#1}%
\renewcommand{\TUL@programEN}{#2}}

\newcounter{TUL@bor}
\setcounter{TUL@bor}{0}
\newcounter{TULc@unter}
\newcommand{\i@TULoborCZ}{Chyb\'\i\ \textbackslash TULbranch\{k\'od\}\{\v{c}esky\}\{anglicky\}}
\newcommand{\i@TULoborEN}{Study Branches}
\newcommand{\TULbranch}[2]{%
  \stepcounter{TUL@bor}
  \@namedef{\roman{TUL@bor}@TULoborCZ}{#1}%
  \@namedef{\roman{TUL@bor}@TULoborEN}{#2}%
}

\newcommand{\TUL@rok}{\the\year}
\newcommand{\TULyear}[1]{\renewcommand{\TUL@rok}{#1}}

\newcommand{\TULid}[1]{\newcommand{\TUL@id}{#1}}

% podpurne prikazy
\newcommand{\@ddel}{\hspace{0.5em}\rule[-0.2em]{0.75pt}{1.2em}\hspace{0.5em}}

\newenvironment{uzky@text}{\begin{center}\begin{minipage}{0.80\textwidth}
\setlength{\parskip}{0.5\baselineskip}}{\end{minipage}\end{center}}


% rozmery stranky a styl zapati
\setlength{\oddsidemargin}{10mm}
\setlength{\evensidemargin}{0mm}
\setlength{\textwidth}{150mm}
\setlength{\topmargin}{0mm}
\setlength{\headheight}{0mm}
\setlength{\headsep}{0mm}
\setlength{\textheight}{230mm}
\setlength{\footskip}{15mm}
\fancyfoot{}
\fancyfootoffset{0pt}
\if@twoside
    \fancyfoot[RO,LE]{\textbf{\thepage}}
\else
    \fancyfoot[R]{\thepage}
\fi
\newlength{\title@line}


\newcommand{\ThesisTitle}[1]{{\thispagestyle{empty}\sffamily

\begin{center}
\bfseries
\LARGE
\ifthenelse{\equal{#1}{EN}}{University of Economics in Prague\\ }{Vysok\'a \v skola ekonomick\'a v Praze\\ }
\vspace{3mm}
\Large
\ifthenelse{\equal{#1}{EN}}{Faculty of Informatics and Statistics\\}{Fakulta informatiky a statistiky\\\vspace{1mm}}
\vspace{1mm}
\ifthenelse{\equal{#1}{EN}}{Department of Information Technologies}{Katedra informa\v cn\'ich technologi\'i}
\end{center}

\vfill

\newcommand{\t@nd}{&}%
\begin{center}
\ifthenelse{\equal{#1}{EN}}{Study programme}{Studijn\'\i\ program}: 
\ifthenelse{\equal{#1}{EN}}{\TUL@programEN}{\TUL@programCZ} \\
\ifthenelse{\equal{#1}{EN}}{Study branch}{Studijn\'\i\ obor}: 
\ifthenelse{\equal{#1}{EN}}{\i@TULoborEN}{\i@TULoborCZ}
\end{center}

\vspace{1cm}

\vfill

\begin{center}
\Huge\bfseries
\ifthenelse{\equal{#1}{EN}}{\MakeUppercase{\TUL@nazevEN}}{\MakeUppercase{\TUL@nazevCZ}}
\par
\end{center}

\vspace{1cm}

\begin{center}
\Large\bfseries
\ifthenelse{\equal{#1}{EN}}{\MakeUppercase\TUL@levelEN}{\MakeUppercase\TUL@levelCZ}
\ifthenelse{\isundefined{\TUL@id}}{}{\par {\normalsize\mdseries\color{tulgray}\TUL@id}}
\end{center}

\vspace{2cm}

\vfill

\list{}{\leftmargin=3.4cm}\item[]
\large\noindent\begin{tabularx}{\linewidth}{@{}lX@{}}
\itshape\color{tulgray}%
\ifthenelse{\equal{#1}{EN}}{Student}{Student}: &
\TUL@autor \\
\itshape\color{tulgray}%
\ifthenelse{\equal{#1}{EN}}{Supervisor}{Vedouc\'\i}: &
\TUL@vedouci \\
\end{tabularx}
\endlist
\list{}{\leftmargin=-3.1cm}\item[]
\endlist

\vfill

\begin{center}
\Large\bfseries
\TUL@rok
\end{center}

\vspace*{-1cm}
\cleardoublepage}}	

\newcommand{\Assignment}{
\mbox{}
\vfill

\begin{center}
\LARGE Tento list nahra\v{d}te\\[0.5em]origin\'alem zad\'an\'\i.
\thispagestyle{empty}
\end{center}

\vfill
\cleardoublepage
}


\newcommand{\Declaration}[1]{\vspace*{2cm}
\thispagestyle{empty}
\begin{uzky@text}
\section*{Prohl\'a\v sen\'\i}

Prohla\v suji, \v ze jsem diplomovou pr\'aci zpracoval samostatn\v e a \v ze jsem uvedl v\v sechny pou\v zit\'e prameny a literaturu, ze kter\'e jsem \v cerpal.

\vspace{1cm}
\noindent Datum:

\vspace{1cm}
\noindent Podpis:
\end{uzky@text}
\cleardoublepage
}


\newcommand{\ThesisStart}[1]{
\ThesisTitle{CZ}
\ThesisTitle{EN}
\Assignment
\Declaration{#1}
}


\newenvironment{abstractCZ}{\begin{uzky@text}\section*{Abstrakt}}{\end{uzky@text}}

\newenvironment{klicovaslovaCZ}{\begin{uzky@text}\section*{Klíčová slova}}{\end{uzky@text}}

\newenvironment{abstractEN}{\begin{uzky@text}\section*{Abstract}}%
{\end{uzky@text}}

\newenvironment{klicovaslovaEN}{\begin{uzky@text}\section*{Key words}}{\end{uzky@text}\clearpage}

\newenvironment{acknowledgement}{\begin{uzky@text}\section*{Pod\v ekov\'an\'{\i}}}%
{\end{uzky@text}\clearpage}

\newenvironment{abbrList}{\section*{Seznam zkratek}
\addcontentsline{toc}{section}{Seznam zkratek}
\noindent\tabularx{\linewidth}{@{}lX@{}}}
{\endtabularx
\cleardoublepage}

\titleformat{\chapter}%
{\normalfont\sffamily\LARGE\bfseries}{\thechapter}{1em}{}

