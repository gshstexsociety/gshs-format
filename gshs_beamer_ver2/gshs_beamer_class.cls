\ProvidesClass{gshshg_lecture}
\LoadClass[pdftex]{beamer}
\usetheme{Berkeley}

\usepackage{ifthen}
\usepackage{xcolor}
\usepackage{amssymb,amsmath,graphicx}
\usepackage{etoolbox}
\usepackage[hangul]{kotex}
\usepackage{tikz}
\usepackage{listings}

%% Color Setting %%

\definecolor{Grey}{rgb}{0.6,0.6,0.6}

\definecolor{GSHSred}{RGB}{105,0,0} %main color
\definecolor{GSHSRED}{RGB}{80,0,0} %sub color: toc, block (fg)
\definecolor{gshsred}{RGB}{240,210,170} %light color: maybe no use

\definecolor{GSHSblue}{RGB}{0,0,105}
\definecolor{GSHSBLUE}{RGB}{0,0,80}
\definecolor{gshsblue}{RGB}{210,210,240}

\definecolor{GSHSgreen}{RGB}{0,105,0}
\definecolor{GSHSGREEN}{RGB}{0,80,0}
\definecolor{gshsgreen}{RGB}{210,240,210}

\newcommand\themecolor[1]{%
	\ifthenelse{\equal{#1}{red}}{
	\setbeamercolor{title}{bg=white,fg=GSHSred}
	\setbeamercolor{author}{fg=GSHSred}
	\setbeamercolor{institute}{fg=GSHSred}
	\setbeamercolor{date}{fg=GSHSred}
	\setbeamercolor{logo}{bg=GSHSred}
	\setbeamercolor{sidebar}{bg=GSHSred}
	\setbeamercolor{frametitle}{bg=white,fg=GSHSred}
	\setbeamercolor{section in sidebar}{use=sidebar,bg=white,fg=sidebar.bg}
	\setbeamercolor{subsection in sidebar}{parent=section in sidebar}
	\setbeamercolor{subsubsection in sidebar}{parent=subsection in sidebar}
	\setbeamercolor{section in toc}{bg=white,fg=GSHSRED}
	\setbeamercolor{item}{fg=GSHSred}
	\setbeamercolor{block title}{bg=GSHSRED,fg=white}
	\setbeamercolor{subsection in toc}{fg=GSHSRED}
	\setbeamercolor{block body}{bg=black!7,fg=black}
	\logo{\includegraphics[width=8mm]{./logo/gshs_red.png}}
}{}%
\ifthenelse{\equal{#1}{blue}}{
	\setbeamercolor{title}{bg=white,fg=GSHSblue}
	\setbeamercolor{author}{fg=GSHSblue}
	\setbeamercolor{institute}{fg=GSHSblue}
	\setbeamercolor{date}{fg=GSHSblue}
	\setbeamercolor{logo}{bg=GSHSblue}
	\setbeamercolor{sidebar}{bg=GSHSblue}
	\setbeamercolor{frametitle}{bg=white,fg=GSHSblue}
	\setbeamercolor{section in sidebar}{use=sidebar,bg=white,fg=sidebar.bg}
	\setbeamercolor{subsection in sidebar}{parent=section in sidebar}
	\setbeamercolor{subsubsection in sidebar}{parent=subsection in sidebar}
	\setbeamercolor{section in toc}{bg=white,fg=GSHSBLUE}
	\setbeamercolor{item}{fg=GSHSblue}
	\setbeamercolor{block title}{bg=GSHSBLUE,fg=white}
	\setbeamercolor{subsection in toc}{fg=GSHSBLUE}
	\setbeamercolor{block body}{bg=black!7,fg=black}
	\logo{\includegraphics[width=8mm]{./logo/gshs_blue.png}}
}{}%
\ifthenelse{\equal{#1}{green}}{
	\setbeamercolor{title}{bg=white,fg=GSHSgreen}
	\setbeamercolor{author}{fg=GSHSgreen}
	\setbeamercolor{institute}{fg=GSHSgreen}
	\setbeamercolor{date}{fg=GSHSgreen}
	\setbeamercolor{logo}{bg=GSHSgreen}
	\setbeamercolor{sidebar}{bg=GSHSgreen}
	\setbeamercolor{frametitle}{bg=white,fg=GSHSgreen}
	\setbeamercolor{section in sidebar}{use=sidebar,bg=white,fg=sidebar.bg}
	\setbeamercolor{subsection in sidebar}{parent=section in sidebar}
	\setbeamercolor{subsubsection in sidebar}{parent=subsection in sidebar}
	\setbeamercolor{section in toc}{bg=white,fg=GSHSGREEN}
	\setbeamercolor{item}{fg=GSHSgreen}
	\setbeamercolor{block title}{bg=GSHSGREEN,fg=white}
	\setbeamercolor{subsection in toc}{fg=GSHSGREEN}
	\setbeamercolor{block body}{bg=black!7,fg=black}
	\logo{\includegraphics[width=8mm]{./logo/gshs_green.png}}
}{}%
}


\AtBeginEnvironment{theorem}{%
  \setbeamercolor{block title}{fg=white,bg=blue!50!black}
  \setbeamercolor{block body}{bg=blue!10!white}
}
\AtBeginEnvironment{definition}{%
  \setbeamercolor{block title}{fg=white,bg=black}
  \setbeamercolor{block body}{bg=black!10!white}
}

%% Equation Setting %%
\newcommand\equationfont[1]{%
	\ifthenelse{\equal{#1}{sf}}{
	\renewcommand\mathfamilydefault{\sfdefault}
}{}%
	\ifthenelse{\equal{#1}{rm}}{
	\renewcommand\mathfamilydefault{\rmdefault}
}{}%
}

%% Frametitle Setting %%
\setbeamerfont{frametitle}{series=\bfseries}
\setbeamertemplate{frametitle}
{ \vspace*{-10mm}
  \leavevmode
  \hspace*{3pt}
  \begin{beamercolorbox}[wd=\paperwidth,ht=1ex,dp=1ex]{frametitle}
    \hspace*{7pt}\underline{\makebox[0.6\paperwidth][l]{
    \Large{\insertframetitle}}}
  \end{beamercolorbox}
}

%% Title Page Setting %%
\setbeamerfont{title}{series=\bfseries}
\setbeamertemplate{title page}{
  %% Background Logo
  \begin{picture}(0,0)%
    \setlength{\unitlength}{1cm}% default
    \protect\put(1.3,0.8){%
    \begin{picture}(6,6)(4,10)%
      \includegraphics[width=0.4\paperwidth]{./logo/gshs_logo_pdf.pdf}%
    \end{picture}%
    }%
  \end{picture}%
  \vfill
  \vspace*{10mm}
  \raggedleft
  %% Title
  \usebeamerfont{title}\usebeamercolor[fg]{title}\inserttitle\par
  %% Subtitle
  \ifx\insertsubtitle\@empty
  \else\usebeamerfont{subtitle}\usebeamercolor[fg]{subtitle}\insertsubtitle
  \fi

  \vskip 2mm
  %% Horizontal line
  \usebeamercolor[fg]{title}\hrule height 2pt\hfill
  \vskip 10mm
  %% Author
  \usebeamercolor[fg]{author}\usebeamerfont{author}\insertauthor
  \vskip 1cm
  %% Institute
  \usebeamercolor[fg]{institute}\usebeamerfont{institute}\insertinstitute
  \vskip 1cm
  %% Date
  \usebeamercolor[fg]{date}\usebeamerfont{date}\insertdate
  \vfill
}

%% itemize bullet setting %%
\setbeamertemplate{itemize items}[ball]
\setbeamertemplate{sections/subsections in toc}[ball]

%% block setting %%
\setbeamertemplate{blocks}[rounded][shadow=false]

%% Listing (Source Code) Setting %%
\lstset
{
    language=[LaTeX]TeX,
    breaklines=true,
    breakindent=0pt,
    basicstyle=\ttfamily\scriptsize,
    texcsstyle=*\color{GSHSred},
    keywordstyle=\color{blue},
    literate=
    *{\{}{{\textcolor{GSHSred}{\{}}}{1}
     {\}}{{\textcolor{GSHSred}{\}}}}{1}
     {\$}{{\textcolor{GSHSred}{\$}}}{1}
     {\#}{{\textcolor{GSHSred}{\#}}}{1},
    identifierstyle=\color{blue},
    commentstyle=\color{red!70},
}% end of lstset

%% No navigation bar %%
\beamertemplatenavigationsymbolsempty
