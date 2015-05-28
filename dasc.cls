\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{dasc}[2011/07/15]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{IEEEtran}}
\ProcessOptions\relax

\LoadClass[letterpaper,conference,11pt]{IEEEtran}

\usepackage{mathptmx}
\usepackage[T1]{fontenc}
\usepackage[lmargin=0.8in,rmargin=0.8in,bmargin=1.25in,tmargin=0.8in,columnsep=0.3in]{geometry} % DASC style
\usepackage{flushend}
\usepackage{booktabs} 
\usepackage{graphicx}
\usepackage[colorlinks=false]{hyperref}
\usepackage[capitalize]{cleveref}
\crefname{figure}{Figure}{Figures}
\crefname{table}{Table}{Tables}
\usepackage[backend=bibtex,style=ieee]{biblatex}

\hypersetup{hidelinks}

\IEEEoverridecommandlockouts

\def\thebibliography#1{\section*{\refname}%
    \addcontentsline{toc}{section}{\refname}%
    \normalsize\@IEEEcompsocconfonly{\small}\vskip 0.3\baselineskip plus 0.1\baselineskip minus 0.1\baselineskip%
    \list{\@biblabel{\@arabic\c@enumiv}}%
    {\settowidth\labelwidth{\@biblabel{#1}}%
    \leftmargin\labelwidth
    \advance\leftmargin\labelsep\relax
    \itemsep \IEEEbibitemsep\relax
    \usecounter{enumiv}%
    \let\p@enumiv\@empty
    \renewcommand\theenumiv{\@arabic\c@enumiv}}%
    \let\@IEEElatexbibitem\bibitem%
    \def\bibitem{\@IEEEbibitemprefix\@IEEElatexbibitem}%
\def\newblock{\hskip .11em plus .33em minus .07em}%
\ifCLASSOPTIONtechnote\sloppy\clubpenalty4000\widowpenalty4000\interlinepenalty100%
\else\sloppy\clubpenalty4000\widowpenalty4000\interlinepenalty500\fi%
    \sfcode`\.=1000\relax}
\let\endthebibliography=\endlist


\def\@maketitle{\newpage
\begin{center}%
   \vskip0.2em{\bfseries\Large{\@title}\par}\vskip1.0em\par
      {\@IEEEspecialpapernotice\mbox{}\vskip\@IEEEauthorblockconfadjspace%
       \mbox{}\hfill\begin{@IEEEauthorhalign}\large\itshape\@author\end{@IEEEauthorhalign}\hfill\mbox{}\par}\relax
\end{center}}

\def\section{\@startsection{section}{1}{\z@}{1.5ex plus 1.5ex minus 0.5ex}%
{0.7ex plus 1ex minus 0ex}{\normalfont\Large\bfseries}}%
\def\subsection{\@startsection{subsection}{2}{\z@}{1.5ex plus 1.5ex minus 0.5ex}%
{0.7ex plus .5ex minus 0ex}{\normalfont\large\bfseries\itshape}}%

\long\def\@makecaption#1#2{%
% test if is a for a figure or table
\ifx\@captype\@IEEEtablestring%
% if a table, do table caption
\begin{center}{\bfseries #1.~#2}\end{center}%
\@IEEEtablecaptionsepspace
% if not a table, format it as a figure
\else
% 3/2001 use footnotesize, not small; use two nonbreaking spaces, not one
\setbox\@tempboxa\hbox{\bfseries\normalsize #1.~#2}%
\ifdim \wd\@tempboxa >\hsize%
% if caption is longer than a line, let it wrap around
\setbox\@tempboxa\hbox{\bfseries\normalsize {#1.}~}%
\parbox[t]{\hsize}{\bfseries\noindent\unhbox\@tempboxa#2}%
% if caption is shorter than a line, center if conference, left justify otherwise
\else%
\ifCLASSOPTIONconference \hbox to\hsize{\bfseries\normalsize\hfil\box\@tempboxa\hfil}%
\else \hbox to\hsize{\bfseries\normalsize\box\@tempboxa\hfil}%
\fi\fi\fi}


\parindent    0.3in
\def\figurename{Figure}
\def\tablename{Table}
\def\thesection{\arabic{section}}                
\def\thesubsection{\thesection.\arabic{subsection}}

% remove hanging indent for references
\defbibenvironment{bibliography}
{\list
	{\printtext[labelnumberwidth]{%
			\printfield{prefixnumber}%
			\printfield{labelnumber}}}
	{\setlength{\labelwidth}{0pt}%
		\setlength{\leftmargin}{\labelwidth}%
		\setlength{\labelsep}{0pt}%
		\addtolength{\leftmargin}{\labelsep}%
		\setlength{\itemsep}{\bibitemsep}%
		\setlength{\parsep}{\bibparsep}}%
	\renewcommand*{\makelabel}[1]{\hss##1~}}
{\endlist}
{\item}