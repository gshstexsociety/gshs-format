\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{gshs_math_seminar_report}[2016/05/23 v.1.0]
\LoadClass[a4paper,10pt]{article}

\usepackage[a4paper,vmargin={5mm,5mm},hmargin={10mm,18mm}, includehead,%
includefoot]{geometry}
\usepackage{fancybox}
\usepackage{fancyhdr}
\usepackage{kotex}
\usepackage{dhucs-setspace}
\SetHangulspace{1.33333}{1.08333}
%한글 사용, 줄 간격 1.2*1.33333 = 1.6
%표의 줄 간격 1.2*1.08333 = 1.3

\RequirePackage{xetexko}
\setmainfont[Ligatures=TeX]{Times New Roman}
\setmainhangulfont[BoldFont=*,BoldFeatures=FakeBold,%
ItalicFont=*,ItalicFeatures=FakeSlant]{Batang}
\disablecjksymbolspacing
\nonfrenchspacing

\fancyhf{}
\lhead{2016수학세미나I 보고서}
\pagestyle{fancy}
\renewcommand\headrule{}

\newcommand{\@classnum}{수강반의번호}
\newcommand{\@studentnum}{학번}
\newcommand{\@studentname}{학생이름}
\newcommand{\@reporttitle}{주제명}
\newcommand{\classnum}[1]{%
	\renewcommand{\@classnum}{#1}%	
}
\newcommand{\studentnum}[1]{%
	\renewcommand{\@studentnum}{#1}%	
}
\newcommand{\studentname}[1]{%
	\renewcommand{\@studentname}{#1}%	
}
\newcommand{\reporttitle}[1]{%
	\renewcommand{\@reporttitle}{#1}%	
}

\newcommand{\makereporttitle}{%
		\fancypage{\setlength{\fboxsep}{10pt}\fbox}{}
		
		\begin{minipage}[t][][b]{\textwidth}
			\begin{flushright}
				반 : \@classnum ~~~~ 학번 : \@studentnum ~~~~ 이름 : \@studentname ~~~~~~~~
			\end{flushright}
			\vspace{0mm}
		\end{minipage}
		
		\noindent\makebox[\linewidth]{\rule{\textwidth}{0.4pt}}
		
		\begin{minipage}[t][][b]{\textwidth}
			\begin{flushleft}
				주제 : \@reporttitle
			\end{flushleft}
			\vspace{0mm}
		\end{minipage}
		
		\noindent\makebox[\linewidth]{\rule{\textwidth}{0.4pt}}
}

