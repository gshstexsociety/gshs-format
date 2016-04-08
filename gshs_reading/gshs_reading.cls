\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{gshs_reading}[2016/04/08 v.1.0]
\LoadClass[a4paper,10pt]{article}

\usepackage{indentfirst}
\setlength\parindent{1.0em}

\usepackage[%
	left=30mm,%
	right=30mm,%
	top=33.375mm,%
	bottom=30mm,%
	headheight=3.175mm,%
	headsep=10.7mm,%
	footskip=15mm%
]{geometry}


\usepackage{kotex}
\usepackage{dhucs-setspace}
\SetHangulspace{1.33333}{*}
%한글 사용, 줄 간격 1.2*1.33333 = 1.6

\setmainfont{Batang}
\setmainhangulfont[BoldFont=*,BoldFeatures=FakeBold]{Batang}
\setmainhanjafont{Batang}
\setsansfont{Gulim}
\setsanshangulfont{Gulim}
\setsanshanjafont{Gulim}
\xetexkofontregime{hangul}
%한글 사용 옵션. 줄 간격
\disablecjksymbolspacing



\newcommand{\booktitle}[1]{%
	\newcommand{\booktitlea}{#1}%	
}
\newcommand{\bookauthor}[1]{%
	\newcommand{\bookauthora}{#1}%
}
\newcommand{\bookpublisher}[1]{%
		\newcommand{\bookpublishera}{#1}%
}
\newcommand{\studentnumber}[1]{%
		\newcommand{\studentnumbera}{#1}%
}
\newcommand{\studentname}[1]{%
	\newcommand{\studentnamea}{#1}%
}
\newcommand{\reporttitle}[1]{%
		\newcommand{\reporttitlea}{#1}%
}

\usepackage{scrextend} %changefontsizes 사용 패키지
\usepackage{fancyhdr}
\pagestyle{fancy}
\renewcommand{\headrulewidth}{0pt}
\lhead{\small\sf%
	\bookauthora, <{}<\booktitlea>{}>, \bookpublishera%
}
\rfoot{\small\sf\studentnumbera, \studentnamea}
%머리말, 꼬리말 설정.

\newcommand{\makebooktitle}{%
	\vspace*{-15.5pt}%
	{\centering\bf\changefontsizes{13pt}\reporttitlea\par}%
	\vspace{18.5pt}%
}
%제목 설정

\pagenumbering{gobble}
%쪽 번호 안 보이게