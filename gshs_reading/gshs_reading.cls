\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{gshs_reading}[2016/06/13 v.1.1]
\LoadClass[a4paper,10pt]{article}

\newcommand{\@booktitle}{책제목}
\newcommand{\@bookauthor}{저자}
\newcommand{\@bookpublisher}{출판사}
\newcommand{\@studentnumber}{학번}
\newcommand{\@studentname}{이름}
\newcommand{\@reporttitle}{감상문 제목(13p)}

\newcommand{\@type}{nonfinal}

\DeclareOption{final}{%
	\renewcommand{\@type}{final}%
	\renewcommand{\@reporttitle}{제목(13p)}%
}
\ProcessOptions\relax

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
\SetHangulspace{1.33333}{1.08333}
%한글 사용, 줄 간격 1.2*1.33333 = 1.6
%표의 줄 간격 1.2*1.08333 = 1.3

\setmainfont[Ligatures=TeX,BoldFont=*,BoldFeatures=FakeBold,
	ItalicFont=*,ItalicFeatures=FakeSlant]{Batang}
\setsansfont{Gulim}
\xetexkofontregime{hangul}
%한글 사용 옵션. 줄 간격
\disablecjksymbolspacing

\newcommand{\booktitle}[1]{%
	\renewcommand{\@booktitle}{#1}%	
}
\newcommand{\bookauthor}[1]{%
	\renewcommand{\@bookauthor}{#1}%
}
\newcommand{\bookpublisher}[1]{%
	\renewcommand{\@bookpublisher}{#1}%
}
\newcommand{\studentnumber}[1]{%
	\renewcommand{\@studentnumber}{#1}%
}
\newcommand{\studentname}[1]{%
	\renewcommand{\@studentname}{#1}%
}
\newcommand{\reporttitle}[1]{%
	\renewcommand{\@reporttitle}{#1}%
}

\usepackage{ifthen}
\usepackage{scrextend} %changefontsizes 사용 패키지
\usepackage{fancyhdr}
\pagestyle{fancy}
\renewcommand{\headrulewidth}{0pt}
\ifthenelse{\equal{\@type}{final}}{}{%
	\lhead{\small\sf%
		\@bookauthor, <{}<\@booktitle>{}>, \@bookpublisher%
	}%
}
\rfoot{\small\sf\@studentnumber, \@studentname}
%머리말, 꼬리말 설정.

\newcommand{\makebooktitle}{%
	\vspace*{-15.5pt}%
	{\centering\bf\changefontsizes{13pt}\@reporttitle\par}%
	\vspace{18.5pt}%
}
%제목 설정

\pagenumbering{gobble}
%쪽 번호 안 보이게