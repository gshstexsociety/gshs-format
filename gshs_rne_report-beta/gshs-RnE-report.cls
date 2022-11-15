% % % % % % % % % % % % % % % % % % % % % % % % % % % % %
% % % LaTeX document class for the GSHS RnE Report  % % %
% % % First edition 2022.11.05 by Junseok Lee % % % % % %
% % % Copyright (C) 2022-present GSHS TeX Society % % % %
% % % % % % % % % % % % % % % % % % % % % % % % % % % % %

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{gshs-RnE-report}[2022/06/14 GSHS RnE Report Class]
\LoadClass[12pt]{article}
\usepackage[a4paper, left=25mm, right=25mm, top=30mm, bottom=30mm]{geometry}
\usepackage{setspace}
\linespread{1.6} % 줄간격 160%
\usepackage{fontspec}
\usepackage{kotex}
\setmainfont{Times New Roman}[Ligatures=TeX]
\setmainhangulfont{HCR Batang}[InterHangul=.05em,WordSpace={1.2,0.1,0.1}]
% 한글 기본 글꼴을 함초롬 바탕으로 설정.
\newfontfamily{\dotum}{HCR Dotum}[WordSpace={1.2,0.1,0.1}]
\newhangulfontfamily{\hdotum}{HCR Dotum}[WordSpace={1.2,0.1,0.1}]
\newfontfamily{\batang}{HCR Batang}[WordSpace={1.2,0.1,0.1}]
\newhangulfontfamily{\hbatang}{HCR Batang}[WordSpace={1.2,0.1,0.1}]


\renewcommand{\thesection}{\Roman{section}}
\renewcommand{\thefootnote}{\fnsymbol{footnote}} 
% 주석 번호와 참고문헌 번호의 혼동을 막기 위해 arabic 대신 fnsymbol 사용(asterisk, dagger, double dagger, ...)

\def\engtitle#1{\gdef\@engtitle{#1}}
\def\authorstyle#1{\gdef\@authorstyle{#1}}
\authorstyle{1}
\def\advisor#1{\gdef\@advisor{#1}}
\def\advisorEmail#1{\gdef\@advisorEmail{#1}}
\newif\ifauthorsup
\authorsupfalse


\newcommand{\ifnotext}[3]{%
	\sbox0{#1}%
	\ifdim\wd0=0pt{#2}\else{#3}\fi
}


\usepackage{listofitems}
\usepackage{etoolbox}

\BeforeBeginEnvironment{equation}{\linespread{0.7}}
\AfterEndEnvironment{equation}{\linespread{1.6}\vspace*{0.3\baselineskip}\noindent}

\renewcommand{\date}[1]{
	\setsepchar{.}
	\readlist\temp{#1}
	\newcommand{\@year}{\temp[1]}
	\newcommand{\@month}{\temp[2]}
	\newcommand{\@day}{\temp[3]}		
}

\newcommand{\printauthoremail}{%
	\sameemailcheck
	\ifnum\@authorstyle=1
		\textbf{연구 참여자: \foreachitem\x\in\authoremails{\mbox{\authoremails[{\xcnt}, 1]\ifauthorsup\textsuperscript{\xcnt}\else\fi}\ifnum\xcnt=\authoremailslen\else, \fi}\\}
		\ifsameemail
			\texttt{\{\foreachitem\x\in\authoremails{\mbox{\href{mailto:\authoremails[{\xcnt},2,1]@\authoremails[1,2,2]}{\ifauthorsup\textsuperscript{\xcnt}\else\fi\authoremails[{\xcnt}, 2, 1]}}\ifnum\xcnt=\authoremailslen\else, \fi}\}@\authoremails[1,2,2]}
		\else
			\texttt{\foreachitem\x\in\authoremails{\mbox{\href{mailto:\authoremails[{\xcnt},2]}{\ifauthorsup\textsuperscript{\xcnt}\else\fi\authoremails[{\xcnt}, 2]}}\ifnum\xcnt=\authoremailslen\else, \fi}}
		\fi
	\else%
		\textbf{연구 참여자: }\foreachitem\x\in\authoremails{\mbox{\textbf{\authoremails[{\xcnt}, 1]}(\texttt{\href{mailto:\authoremails[{\xcnt},2]}{\authoremails[{\xcnt},2]}})}\ifnum\xcnt=\authoremailslen\else, \fi}\\
	\fi
}

\newcommand{\makecover}{%
	\thispagestyle{empty} 
	\noindent{\dotum\hdotum\@year학년도}\\
	{\dotum\hdotum\bfseries 경기과학고 기초 R\&E 결과보고서}
	\vskip 10pc
	\begin{center}
		\ifnotext{\@title}{}{\fontsize{18}{18}\selectfont\bfseries\@title\\[2pc]}
		\ifnotext{\@engtitle}{}{\fontsize{14}{14}\selectfont\bfseries\@engtitle}
	\end{center}
	\vskip 2pc
	\vspace*{\stretch{1}}
	\begin{center}
		\batang\bfseries \@year.\:\@month.\:\@day.
	\end{center}
	\vspace*{\stretch{1}}
	\begin{center}
		\begin{minipage}{0.7\textwidth}
			\begin{center}
				{\lineskip .75em%
					\printauthoremail
				}
			\end{center}
		\end{minipage}
	\end{center}
	\vskip 2pc
	\begin{center}
		\textbf{지도 교사: \@advisor }(\texttt{\href{mailto:\@advisorEmail}{\@advisorEmail}})
	\end{center}
	\vskip 5pc
	\begin{center}
		{\fontsize{18}{18}\selectfont\bfseries 과학영재학교}%
		{\fontsize{24}{24}\selectfont\bfseries{}~~경기과학고등학교}
	\end{center}
	\newpage
}

\renewcommand{\maketitle}{%
	\begin{center}
		\ifnotext{\@title}{}{\fontsize{18}{18}\selectfont\bfseries\@title\\[1pc]}
		\ifnotext{\@engtitle}{}{\fontsize{14}{14}\selectfont\bfseries\@engtitle}
	\end{center}
	\vskip 3cm
}

\renewenvironment{abstract}
 {\begin{center}
  \bfseries \abstractname\vspace{-.5em}\vspace{0pt}
  \end{center}
  \quotation\bfseries}
 {\endquotation}