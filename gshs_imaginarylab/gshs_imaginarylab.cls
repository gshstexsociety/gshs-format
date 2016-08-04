\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{gshs_imaginarylab}[2016/08/02 v.1.0]
\LoadClass[a4paper,10pt]{article}

% 명령어 설정
\newcommand{\@worktitle}{작품제목}
\newcommand{\@workauthor}{작품저자}

\newcommand{\worktitle}[1]{%
	\renewcommand{\@worktitle}{#1}%	
}
\newcommand{\workauthor}[1]{%
	\renewcommand{\@workauthor}{#1}%	
}

% 들여쓰기 설정
\usepackage{indentfirst}
\setlength\parindent{1.0em}

% 줄간격 설정
\usepackage{kotex}
\usepackage{dhucs-setspace}
\SetHangulspace{1.33333}{1.08333}
%한글 사용, 줄 간격 1.2*1.33333 = 1.6
%표의 줄 간격 1.2*1.08333 = 1.3

% 색상 설정
\usepackage{color}
\definecolor{mygray}{gray}{0.6}

% 편집용지 설정
\usepackage[%
	left=10mm,%
	right=10mm,%
	top=10mm,%
	bottom=30mm,%
	headheight=0mm,%
	headsep=0mm,%
	footskip=15mm%
]{geometry}

%그림삽입 설정
\usepackage{graphicx}
\graphicspath{{images/}}
%\newcommand{\insertfig}[1]{
%	\includegraphics[width=0.46\textwidth]{#1}
%}

\def\insertfig#1{\def\tempa{#1}\futurelet\next\insertfig@i}% Save first argument
\def\insertfig@i{\ifx\next\bgroup\expandafter\insertfig@ii\else\expandafter\insertfig@end\fi}%Check brace
\def\insertfig@ii#1{%Two args
	\vspace{0.5cm}
	\begin{minipage}{0.46\textwidth}
		\includegraphics[width=\textwidth]{\tempa}
		
		Image Notes
		
		#1
	\end{minipage}
	\vspace{0.5cm}	
}
\def\insertfig@end{%Single args
	\vspace{0.5cm}	
	\begin{minipage}{0.46\textwidth}
		\includegraphics[width=\textwidth]{\tempa}
	\end{minipage}
	\vspace{0.5cm}	
}


%표지 설정
\newcommand{\makeworkcover}{%
	\includegraphics[width=0.5\textwidth]{gshslogo_long.png}
	\begin{flushleft}
		{\Large \bf \@worktitle}
	\end{flushleft}
	{\sf \@workauthor} \ on \@workdate
	%\vspace*{-15.5pt}%
	%{\centering\bf\changefontsizes{13pt}\@reporttitle\par}%
	%\vspace{18.5pt}%
	\tableofcontents
	\clearpage
}
\def\workdate#1#2#3{\gdef\@workdate{#1. #2. #3}}

%머리말, 꼬리말 설정
\usepackage{fancyhdr}
\pagestyle{fancy}
\renewcommand{\headrulewidth}{0pt}
\lhead{}
\rhead{}
\lfoot{\href{https://www.gs.hs.kr/researchschool/research-school.do}{\color{mygray} 경기과학고등학교 무한상상실 - 2016 무한상상캠프}}
\rfoot{\color{mygray} 양식 제작 by \href{http://gshslatexintro.github.io}{경기과학고 텍 사용자협회}}

%section 설정 - section 을 step 으로 사용
\usepackage{tocloft}
\renewcommand{\cftsecpresnum}{Step }
\renewcommand{\cftsecaftersnum}{:}
\renewcommand{\cftsecnumwidth}{4.5em}
\usepackage{titlesec}
\titleformat{\section}{\Large\bfseries\sffamily}{}{0pt}{Step \thesection:\quad}

%toc 설정
\renewcommand\contentsname{Table of Contents} %제목변경
\renewcommand\cftsecleader{\cftdotfill{\cftdotsep}} %점선

%hyperref 설정
\usepackage[%
	hidelinks,%
	pdfencoding=auto%
]{hyperref}