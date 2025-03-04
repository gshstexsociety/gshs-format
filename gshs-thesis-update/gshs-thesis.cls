% % % % % % % % % % % % % % % % % % % % % % % % % % % %
% % % LaTeX document class for the GSHS Tesis % % % % %
% % % First edition 2022.11.05 by Junseok Lee % % % % %
% % % Second edition 2025.03.04 by Seungchan Park % % % % %
% % % Copyright (C) 2022-present GSHS TeX Society % % %
% % % % % % % % % % % % % % % % % % % % % % % % % % % %

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{gshs-thesis}[2022/02/01 v1.0.0 GSHS Thesis Class]

\LoadClass[11pt]{article}

\newif\if@overleaf
\@overleaffalse
\DeclareOption{overleaf}{\@overleaftrue}
\newif\if@pdflatex
\@pdflatexfalse
\DeclareOption{pdflatex}{\@pdflatextrue}
\newif\if@freepass
\@freepassfalse
\DeclareOption{freepass}{\@freepasstrue}
\ProcessOptions\relax

\RequirePackage[papersize={195mm,255mm}, top=25mm, bottom=30mm, left=25mm, right=25mm]{geometry}

%%%%%%%%%%%%%%%%%%%%%
%%% Font settings %%%
%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{kotex}

\if@pdflatex
  \usepackage{mathptm} % To use Times New Roman in pdfLaTeX
  \def\everyhangul#1{\relax}
  \def\everyhanja#1{\relax}
\else
  \RequirePackage{fontspec}
  \setmainfont[Ligatures=TeX]{Times New Roman}
  \if@overleaf
    \setmainhangulfont[Extension=.ttf, Path=./fonts/, BoldFont=*, BoldFeatures={FakeBold=3}, ItalicFont=*, ItalicFeatures=FakeSlant]{Batang}
  \else
    \setmainhangulfont[Extension=.ttf, Path=./fonts/, BoldFont=*, BoldFeatures={FakeBold=3}, ItalicFont=*, ItalicFeatures=FakeSlant]{Batang}
  \fi
  \hanjabyhangulfont
  \def\fallbackhanjafont{\hanjafontspec{Noto Serif TC}\selectfont}
  \disablecjksymbolspacing
  \nonfrenchspacing
\fi

\DeclareRobustCommand*{\title}[1]{\gdef\@title{#1}\gdef\@kortitle{#1}}
\DeclareRobustCommand*{\engtitle}[1]{\gdef\@engtitle{#1}}
\DeclareRobustCommand*{\studid}[1]{\gdef\@studid{#1}}
\DeclareRobustCommand*{\degreeyear}[1]{\gdef\@degreeyear{#1}}
\DeclareRobustCommand*{\advisor}[1]{\gdef\@advisor{#1}}
\DeclareRobustCommand*{\judge}[1]{
  \def\do##1, ##2, ##3\relax{
    \gdef\@judgei{##1}
    \gdef\@judgeii{##2}
    \gdef\@judgeiii{##3}
  }
  \do#1\relax
}
\DeclareRobustCommand*{\author}[1]{
  \def\do##1, ##2, ##3, ##4\relax{
    \gdef\@authorall{##1(##2##3,~##4)}
    \gdef\@korauthor{##1}
    \gdef\@engauthor{##3,~##4}
  }
  \do#1\relax
}
\DeclareRobustCommand*{\date}[1]{
  \def\do##1.##2.##3.\relax{
    \gdef\@year{##1}
    \gdef\@month{##2}
    \gdef\@day{##3}
  }
  \do#1\relax
}

\newcommand{\abstractengname}{Abstract}
\newcommand{\abstractkorname}{초~~~~록}
\newcommand{\titlebox}[1]{\parbox[c][2.6em][c]{\linewidth}{\centering #1}}

\newcommand{\acknowledgmentsname}{Acknowledgments}
\newcommand{\researchname}{Research Activities}
\newcommand{\koreansummaryname}{Korean Summary}


\def\@kor{kor}
\newcommand{\usetitle}[1]{
  \AtBeginDocument{
    \def\teststring{#1}
    \ifx\teststring\@kor
      \renewcommand{\contentsname}{목차}
      \renewcommand{\refname}{참고문헌}
      \renewcommand{\listfigurename}{그림 차례}
      \renewcommand{\listtablename}{표 차례}
      \renewcommand{\acknowledgmentsname}{감사의 글}
      \renewcommand{\researchname}{연구 활동}
      \renewcommand{\koreansummaryname}{한글 요약}
    \else
      \renewcommand{\contentsname}{Contents}
      \renewcommand{\refname}{References}
      \renewcommand{\listfigurename}{List of Figures}
      \renewcommand{\listtablename}{List of Tables}
      \renewcommand{\acknowledgmentsname}{Acknowledgments}
      \renewcommand{\researchname}{Research Activities}
      \renewcommand{\koreansummaryname}{Korean Summary}
    \fi
  }
}

\newcommand{\usecaption}[1]{
  \def\teststring{#1}
  \ifx\teststring\@kor
    \renewcommand{\figurename}{그림}
    \renewcommand{\tablename}{표}
  \else
    \renewcommand{\figurename}{Figure}
    \renewcommand{\tablename}{Table}
  \fi
}

\def\@check{check}
\def\@checki{}
\def\@checkii{}
\def\@checkiii{}
\def\@checkiv{}
\def\@checkv{}
\def\@checkvi{}

\newcommand{\checklist}[2]{
  \def\teststring{#2}
  \ifx\teststring\@check
    \ifcase#1\relax\or
    \def\@checki{$\checkmark$}\or
    \def\@checkii{$\checkmark$}\or
    \def\@checkiii{$\checkmark$}\or
    \def\@checkiv{$\checkmark$}\or
    \def\@checkv{$\checkmark$}\or
    \def\@checkvi{$\checkmark$}
    \fi
  \fi
}

\RequirePackage{titlesec}
\titleformat{\section}[hang]
{\normalfont\fontsize{21}{21}\selectfont\bfseries}{\Roman{section}.}{1em}{}
\titleformat{\subsection}[hang]
{\normalfont\fontsize{16}{20}\selectfont\bfseries}{\Roman{section}.\arabic{subsection}}{1em}{}
\titleformat{\subsubsection}[hang]
{\normalfont\fontsize{14}{18}\selectfont}{\Roman{section}.\arabic{subsection}.\arabic{subsubsection}}{1em}{}
\titleformat{\paragraph}[hang]
{\normalfont\fontsize{12}{16}\selectfont\itshape}{}{1em}{}

\RequirePackage{xparse}

\RenewDocumentEnvironment{abstract} { O{eng} }
  {
    \baselineskip=2.0em
    \null\thispagestyle{plain}%
    \begin{center}
    \vskip 6em%
    {\LARGE\bfseries\titlebox{\csname @#1title\endcsname}}
    \vskip 10em%
    {\LARGE\bfseries\csname abstract#1name\endcsname}
    \vskip 3em%
    \end{center}
    \addcontentsline{toc}{section}{\csname abstract#1name\endcsname}
    \setlength{\parindent}{0pt}
  }
  {\par\newpage\setlength{\parindent}{17pt}}


\NewDocumentEnvironment{acknowledgments} { }
  {
    \clearpage
    \null\vskip7pc
    {\hfill\huge\bfseries\acknowledgmentsname\hfill\null}
    \vskip2pc
    \addcontentsline{toc}{section}{\acknowledgmentsname}
    \setlength{\parindent}{0pt}
  }
  {\par\clearpage}

\NewDocumentEnvironment{koreansummary} { }
  {
    \clearpage
    \null\vskip5pc
    \begin{center}
    {\huge\bfseries\koreansummaryname}
    \vskip2pc
    \addcontentsline{toc}{section}{\koreansummaryname}
    \setlength{\parindent}{0pt}
    {\LARGE\bfseries\titlebox{\@title}\par}
    \end{center}
    \setcounter{section}{0}
    \let\oldwrite\addcontentsline
    \def\addcontentsline##1##2##3{\relax}
  }
  {\par\clearpage%
  \let\addcontentsline\oldwrite}

\NewDocumentEnvironment{research} { }
  {
    \clearpage
    \null\vskip5pc
    {\hfill\huge\bfseries\researchname\hfill\null}
    \vskip.5pc
    \addcontentsline{toc}{section}{\researchname}
    \setlength{\parindent}{0pt}
  }
  {\par\clearpage}

%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Table of Contents %%%
%%%%%%%%%%%%%%%%%%%%%%%%%


\RequirePackage{tocloft}

\setcounter{secnumdepth}{3} % organisational level that receives a numbers
\setcounter{tocdepth}{3}    % print table of contents for level 3

\renewcommand{\cftsecleader}{\cftdotfill{\cftdotsep}}

\renewcommand{\cfttoctitlefont}{\hfill\huge\bfseries}
\renewcommand{\cftaftertoctitle}{\hfill\null}
\renewcommand{\cftlottitlefont}{\hfill\huge\bfseries}
\renewcommand{\cftafterlottitle}{\hfill\null}
\renewcommand{\cftloftitlefont}{\hfill\huge\bfseries}
\renewcommand{\cftafterloftitle}{\hfill\null}

\setlength{\cftbeforesecskip}{0pt}
\setlength{\cftbeforesubsecskip}{0pt}
\setlength{\cftbeforesubsubsecskip}{0pt}


\RequirePackage{etoolbox}
\BeforeBeginEnvironment{equation}{\begin{singlespace}\vspace{-\baselineskip}}
\AfterEndEnvironment{equation}{\end{singlespace}\noindent\ignorespaces}
\BeforeBeginEnvironment{equation*}{\begin{singlespace}\vspace{-\baselineskip}}
\AfterEndEnvironment{equation*}{\end{singlespace}\noindent\ignorespaces}
\BeforeBeginEnvironment{align}{\begin{singlespace}\vspace{-\baselineskip}}
\AfterEndEnvironment{align}{\end{singlespace}\noindent\ignorespaces}
\BeforeBeginEnvironment{align*}{\begin{singlespace}\vspace{-\baselineskip}}
\AfterEndEnvironment{align*}{\end{singlespace}\noindent\ignorespaces}

\providecommand*\setfloatlocations[2]{\@namedef{fps@#1}{#2}}
\setfloatlocations{figure}{htbp}
\setfloatlocations{table}{htbp}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Cover and Title Pages %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\makecover}{%
  \renewcommand{\footnotesize}{\small}
  \thispagestyle{empty}%
  \null%
  \begin{center}
    \vskip 4em%
    {\Large 졸업논문청구논문\par}%
    \ifx\@title\@engtitle
      \vspace*{\stretch{6}}%
      {\huge\bfseries\titlebox{\@title}\par}%
      \vspace*{\stretch{10}}%
    \else
      \vspace*{\stretch{4}}%
      {\huge\bfseries\titlebox{\@title}\par}%
      \vskip 1em%
      \vspace*{\stretch{2}}%
      {\LARGE\bfseries\titlebox{\@engtitle}\par}%
      \vspace*{\stretch{10}}%
    \fi
    {\LARGE\bfseries\everyhangul{##1\hspace{0.6em}}\everyhanja{##1\hspace{0.6em}}\@authorall\par}%
    {\LARGE\@studid\par}%
    \vskip 2.3em%
    {\LARGE\bfseries 과학영재학교 경기과학고등학교\par}%
    \vskip 1em%
    {\LARGE\bfseries\@degreeyear\par}%
    \null%
  \end{center}\par
  %
  \newpage%
  \thispagestyle{empty}%
  \null%
  \begin{center}
    \null\vspace*{\stretch{2}}%
    \ifx\@title\@engtitle
      \begingroup%
        \def\baselinestretch{1.3}\@currsize\huge\titlebox{\@title}\par%
      \endgroup%
      \vspace*{\stretch{4}}%
    \else
      \begingroup%
        \def\baselinestretch{1.3}\@currsize\huge\titlebox{\@title}\par
      \endgroup%
      \vspace*{\stretch{2}}%
      \begingroup%
        \def\baselinestretch{1.2}\@currsize\LARGE\titlebox{\@engtitle}\par
      \endgroup%
      \vspace*{\stretch{5}}%
    \fi
    {\large[논문제출 전 체크리스트]\par}%
    \vskip 0.5em%
    \renewcommand{\arraystretch}{1.2}
    \begin{tabular}{lc}
      1. 이 논문은 내가 직접 연구하고 작성한 것이다. & \rlap{\@checki}$\square$\\
      2. 인용한 모든 자료(책·논문·인터넷자료 등)의 인용표시를 바르게 하였다. & \rlap{\@checkii}$\square$ \\
      3. 인용한 자료의 표현이나 내용을 왜곡하지 않았다. & \rlap{\@checkiii}$\square$\\
      4. 정확한 출처제시 없이 다른 사람의 글이나 아이디어를 가져오지 않았다. & \rlap{\@checkiv}$\square$ \\
      5. 논문 작성 중 도표나 데이터를 조작(위조 혹은 변조)하지 않았다. & \rlap{\@checkv}$\square$ \\
      6. 다른 친구와 같은 내용의 논문을 제출하지 않았다. & \rlap{\@checkvi}$\square$ \\
    \end{tabular}
    \vskip12pc%
  \end{center}\par
  %
  \newpage%
  \thispagestyle{empty}%
  \null%
  \begin{center}
    \null%
    \vspace{\stretch{1}}%
    \begingroup%
      \def\baselinestretch{1.0}\@currsize\huge\bfseries\titlebox{\@engtitle}\par%
    \endgroup%
    \vspace{\stretch{2}}%
    {\Large Advisor : Teacher \@advisor\par\vskip 0.5em}%
    {\Large by\par\vskip 0.8em}%
    {\Large \@studid{} \bfseries\@engauthor\par\vskip 0.5em}%
    {\Large\bfseries Gyeonggi Science High School for the Gifted\par}%
    \vspace{\stretch{2}}%
  \end{center}\par
  {\Large A thesis submitted to the Gyeonggi Science High School in partial fulfillment of the requirements for the graduation. The study was conducted in accordance with Code of Research Ethics.%
    \footnote{Declaration of Ethical Conduct in Research: I, as a graduate student of GSHS, hereby declare that I have not committed any acts that may damage the credibility of my research. These include, but are not limited to: falsification, thesis written by someone else, distortion of research findings or plagiarism. I affirm that my thesis contains honest conclusions based on my own careful research under the guidance of my thesis advisor.}\par}%
  \begin{flushright}
    \Large \@year. \@month. \@day.\par%
  \end{flushright}\par%
  {\setlength{\leftskip}{16em}%
    {\Large\bfseries Approved by\par}%
    {\Large\bfseries Teacher \@advisor\par}%
    {\Large\bfseries [Thesis Advisor]\par}%
  }%
  \null\vfill%
  %
  \newpage%
  \thispagestyle{empty}
  \begin{center}
    \null\vskip 2em%
    \vspace{\stretch{1}}%
    {\huge\titlebox{\@title}\par}%
    \vspace{\stretch{2}}%
    {\LARGE\everyhangul{##1\hspace{0.6em}}\@korauthor\par}%
    \vspace{\stretch{2}}%
    {\Large 위 논문은 과학영재학교 경기과학고등학교 졸업논문으로 졸업논문심사위원회에서 심사 통과하였음.\par}%
    \vspace{\stretch{3}}%
  \end{center}\par%
  {\hfill\Large\@year년 \@month월 \@day일 \hspace*{4em}\par}%
  \vskip 4em
  {\hfill\Large
  \setlength{\tabcolsep}{12pt}
  \if@freepass
    \renewcommand{\arraystretch}{1.4}
    \begin{tabular}{rc@{}}
      지도교사 & ~서명 \\
       & 또는 인
    \end{tabular}%
  \else%
    \renewcommand{\arraystretch}{1.6}
    \begin{tabular}{rcc@{}}
      심사위원장 & \@judgei & (인)\\
      심사위원 & \@judgeii & (인)\\
      심사위원 & \@judgeiii & (인)\\
    \end{tabular}%
  \fi%
  \hspace*{4em}\par}%
  \vspace{\stretch{2}}%
  \newpage%
}

