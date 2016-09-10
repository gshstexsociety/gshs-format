%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%  LaTeX document class of the thesis of the Gyeonggi Science High School   %%%
%%%  Last edition 2015.11.13 by Chinook Mok                                   %%%
%%%  Continously being modified by gshslatexintro after 2016.02.02.           %%%
%%%  Check the latest version at : latex.gs.hs.kr                             %%%
%%%  Also refer to https://www.facebook.com/gshstexsociety                    %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% 2016.02.25 변경사항(by 14088 이주찬)
%% 한글, 영어 날짜 양식을 하나로 통합

\ProvidesClass{gshs_thesis}
\LoadClass[pdftex, a4paper]{article}

\usepackage{amssymb}
\usepackage{amsmath}
\usepackage{graphicx}
\usepackage[margin=10pt,font=small,labelfont=bf]{caption}
\usepackage{subcaption}
\usepackage{fancyhdr}
\usepackage[nottoc]{tocbibind}
\usepackage{titlesec}
\usepackage{cite}   % citation [1,2,3] --> [1-3]
\usepackage{tocloft}
\usepackage[toc,page]{appendix}
\usepackage[T1]{fontenc}   % To use Times New Roman
\usepackage[utf8]{inputenc}% To use Times New Roman
\usepackage{mathptmx}      % To use Times New Roman
\usepackage{array}
\usepackage{setspace}

\usepackage{enumitem} % itemize, enumerate 환경 여백 조절
\setitemize{noitemsep} % 여백이 너무 넓어서 기본 여백으로 만듦
\setenumerate{noitemsep} % 여백이 너무 넓어서 기본 여백으로 만듦

\usepackage{etoolbox}
\apptocmd{\thebibliography}{\setlength{\itemsep}{0pt}}{}{}
%\setstretch{1.5}

\renewcommand{\thefootnote}{\fnsymbol{footnote}} 
% 주석 번호와 참고문헌 번호의 혼동을 막기 위해 arabic 대신 fnsymbol 사용(asterisk, dagger, double dagger, ...)

\setlength{\hoffset}{0pt}
\setlength{\voffset}{0pt}
\setlength{\paperwidth}{597pt}
\setlength{\paperheight}{845pt}
\setlength{\oddsidemargin}{42pt}
\setlength{\evensidemargin}{42pt}
\setlength{\topmargin}{0pt}
\setlength{\headheight}{0pt}
\setlength{\headsep}{25pt}
\setlength{\textheight}{569pt}
\setlength{\textwidth}{384pt}
\setlength{\marginparsep}{10pt}
\setlength{\marginparwidth}{35pt}
\setlength{\footskip}{56pt}



%%%%%%%%%%%%%%%%%%%%%%%%%
%%% title page layout %%%
%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand{\thepage}{\roman{page}}
\def\degreeyear#1{\gdef\@degreeyear{#1}}
%\def\degreedate#1#2#3{\gdef\@degreedate{#1. #2. #3}\gdef\@degreedatekor{#1년 #2월 #3일}}
\def\degreedate#1{\gdef\@degreedate{#1}}
\def\degreedatekor#1{\gdef\@degreedatekor{#1}}
\def\studid#1{\gdef\@studid{#1}}
\def\engname#1{\gdef\@engname{#1}}
\def\korname#1{\gdef\@korname{#1}}
\def\chnname#1{\gdef\@chnname{#1}}
\def\titleheader#1{\gdef\@titleheader{#1}} %title 위에 졸업논문청구논문
\def\engtitle#1{\gdef\@engtitle{#1}} %English title
\def\school#1{\gdef\@school{#1}}
%%%% 논문제출 전 체크리스트들
\def\checklisttitle#1{\gdef\@checklisttitle{#1}}
\def\checklistI#1{\gdef\@checklistI{#1}}
\def\checklistII#1{\gdef\@checklistII{#1}}
\def\checklistIII#1{\gdef\@checklistIII{#1}}
\def\checklistIV#1{\gdef\@checklistIV{#1}}
\def\checklistV#1{\gdef\@checklistV{#1}}
\def\checklistVI#1{\gdef\@checklistVI{#1}}
\def\checklistmarkI#1{\gdef\@checklistmarkI{#1}}
\def\checklistmarkII#1{\gdef\@checklistmarkII{#1}}
\def\checklistmarkIII#1{\gdef\@checklistmarkIII{#1}}
\def\checklistmarkIV#1{\gdef\@checklistmarkIV{#1}}
\def\checklistmarkV#1{\gdef\@checklistmarkV{#1}}
\def\checklistmarkVI#1{\gdef\@checklistmarkVI{#1}}
\def\approval#1{\gdef\@approval{#1}}  %% approvement
%%% advisor(지도교사) 및 심사위원
\def\chairperson#1{\gdef\@chairperson{#1}}
\def\examiner#1{\gdef\@examiner{#1}}
\def\apprvsign#1{\gdef\@apprvsign{#1}}
\def\advisor#1{\gdef\@advisor{#1}}
\def\judgeone#1{\gdef\@judgeone{#1}}
\def\judgetwo#1{\gdef\@judgetwo{#1}}
\def\judgethree#1{\gdef\@judgethree{#1}}
\def\korabstract#1{\gdef\@korabstract{#1}}
\def\koracknowledgement#1{\gdef\@koracknowledgement{#1}}
\def\korresearches#1{\gdef\@korresearches{#1}}


\newenvironment{alwayssingle}{%
       \@restonecolfalse\if@twocolumn\@restonecoltrue\onecolumn
       \else\newpage\fi}
       {\if@restonecol\twocolumn\else\newpage\fi}
       
\newenvironment{myepigraph}
  {\par\hfill
   \begin{tabular}{@{}r@{\hspace{20mm}}}}
  {\end{tabular}\par\medskip}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%define title page layout%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand{\maketitle}{%
\begin{alwayssingle}
    \renewcommand{\footnotesize}{\small}
    \renewcommand{\footnoterule}{\relax}
    \thispagestyle{empty}   %%%% 제 1 타이틀 페이지
    \begin{center}
    \vspace*{4mm}
    {\Large \@titleheader}\par
    \vspace{18mm}
    \begin{minipage}[h][30mm][c]{\textwidth}
    \begin{center}
    {\begin{spacing}{1.5}\huge\bfseries\@title\end{spacing}\par}
    \end{center}
    \end{minipage}
    \par\vspace{2mm}%%% 한글/영어 제목 사이 여백 (조절 가능)  
    \begin{minipage}[h][30mm][c]{\textwidth}
    \begin{center}
    {\begin{spacing}{1.2}\LARGE\bfseries\@engtitle\end{spacing}\par}
    \end{center}
    \end{minipage}
    \par\vspace{53mm}%%% 영어 제목 아래 여백 (조절 가능)
%    {{\LARGE\bf \@author} \par}
    {{\LARGE\bf \@korname\hspace{3mm}(\@chnname\hspace{3mm}\@engname)}}
    \par\vspace{4mm}
    {\LARGE{\@studid}}
    \par\vspace{8mm}
    {\LARGE\bf{\@school}}
    \par\vspace*{6mm}
    {\LARGE\bf\@degreeyear}
  \end{center}
%  \null\vfill
  \newpage                   %%% 제 2 타이틀 페이지
  \thispagestyle{empty}
  \begin{center}
    \vspace*{18mm}   %%% 한글 제목 위 여백 (조절 가능)
    \begin{minipage}[h][30mm][c]{\textwidth}
    \begin{center}
    {\begin{spacing}{1.5}\huge\bfseries\@title\end{spacing}\par}
    \end{center}
    \end{minipage}
    \par\vspace{8mm}%%% 한글/영어 제목 사이 여백 (조절 가능)  
    \begin{minipage}[h][30mm][c]{\textwidth}
    \begin{center}
    {\begin{spacing}{1.2}\LARGE\bfseries\@engtitle\end{spacing}\par}
    \end{center}
    \end{minipage}
    \par\vspace{50mm}   %%% 영어 제목 아래 여백 (조절 가능)
    {\large{\@checklisttitle}}
    \par\vspace{3mm}
   \setstretch{1.3}
    \begin{tabular}{lr}
    {{\@checklistI} \par}  & {\@checklistmarkI}\\[2pt]
    {{\@checklistII} \par} & {\@checklistmarkII}\\[2pt]
    {{\@checklistIII} \par}& {\@checklistmarkIII}\\[2pt]
    {{\@checklistIV} \par} & {\@checklistmarkIV}\\[2pt]
    {{\@checklistV} \par}  & {\@checklistmarkV}\\[2pt]
    {{\@checklistVI} \par} & {\@checklistmarkVI}
    \end{tabular}
    \end{center}
  \null\vfill
  \newpage                   %%% 제 3 타이틀 페이지
  \thispagestyle{empty}
  \begin{center}
    \vspace*{5mm}   %%% 영어 제목 위 여백 (조절 가능)
    \begin{minipage}[h][3.5cm][c]{\textwidth}
    \begin{center}
    {\begin{spacing}{1.0}\huge\bfseries\@engtitle\end{spacing}\par}
    \end{center}
    \end{minipage}
    \par\vspace{10mm}   %%% 영어 제목 아래 여백 (조절 가능)
    {\Large Advisor : Teacher {\@advisor}}
    \par\vspace{2mm}
    {\Large by}
    \par\vspace{2mm}
    {\Large {\@studid} \bf{\@engname}}
    \par\vspace{2mm}
    {\Large\bf Gyeonggi Science High School for the gifted}
  \end{center}
  \par\vspace{12mm}
  {\Large {A thesis submitted to the Gyeonggi Science High School in partial
   fulfillment of the requirements for the graduation. The study was conducted
   in accordance with Code of Research Ethics.\footnote{Declaration of Ethical
   Conduct in Research: I, as a graduate student of GSHS, hereby declare that
   I have not committed any acts that may damage the credibility of my research.
   These include, but are not limited to: falsification, thesis written by
   someone else, distortion of research findings or plagiarism. I affirm that
   my thesis contains honest conclusions based on my own careful research under
   the guidance of my thesis advisor.}}}
   \par\vspace{3mm}
   \begin{flushright}
     {\Large\@degreedate}
   \end{flushright}
   \par\vspace{3mm}
   \hfill\begin{minipage}{\dimexpr\textwidth-70mm}
   {\Large\bf Approved by\par}
   {\Large\bf Teacher {\@advisor}\par}
   {\Large\bf [Thesis Advisor]\par}
   \xdef\tpd{\the\prevdepth}
   \end{minipage}
  \null\vfill
  \newpage                  %%%%%% 제 4 타이틀 페이지
  \thispagestyle{empty}
  \begin{center}
    \vspace*{13mm}  %%% 한글 제목 위 여백
    \begin{minipage}[h][3.5cm][c]{\textwidth}
    \begin{center}
    {\begin{spacing}{1.5}\huge\bfseries\@title\end{spacing}\par}
    \end{center}
    \end{minipage}
    \par\vspace{15mm}   %%% 한글 제목 아래 여백
    {\LARGE {\@korname}}
    \par\vspace{20mm}
    {\Large {\@approval}}
  \end{center}
    \par\vspace{22mm}
  \begin{myepigraph}
    {\Large {\@degreedatekor}}\\[11mm]
    {\Large \@chairperson\hspace{5mm}\@judgeone\hspace{6mm}\@apprvsign}\\[8mm]
    {\Large \@examiner\hspace{5mm}\@judgetwo\hspace{6mm}\@apprvsign}\\[8mm]
    {\Large \@examiner\hspace{5mm}\@judgethree\hspace{6mm}\@apprvsign}
  \end{myepigraph}
\end{alwayssingle}}


%%%%%%%%%%%%%%%%%%%%%%%
%%% Abstract layout %%%
%%%%%%%%%%%%%%%%%%%%%%%
\newenvironment{abstracts}{\begin{alwayssingle} \thispagestyle{plain}
  \vspace*{20mm}
  \begin{center}
  \begin{minipage}[h][35mm][c]{\textwidth}
    \begin{center}
    {\begin{spacing}{1.0}\LARGE\bfseries\@engtitle\end{spacing}}
    \end{center}
  \end{minipage}
  \par\vspace{35mm}
  {\LARGE \bfseries  Abstract}
  \end{center}
  \par\vspace{0.5cm}
%   \begin{quote}}
%{\end{quote}\end{alwayssingle}}
}{\end{alwayssingle}}

\newenvironment{abstractskor} {\begin{alwayssingle} \thispagestyle{plain}
  \begin{center}
  \vspace*{20mm}
  \begin{minipage}[h][35mm][c]{\textwidth}
    \begin{center}
    {\begin{spacing}{1.5}\LARGE\bfseries\@title\end{spacing}}
    \end{center}
  \end{minipage}
  \par\vspace{35mm}
  {\LARGE \bfseries{\@korabstract}}
  \end{center}
  \par\vspace{0.5cm}}{\end{alwayssingle}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Table of Contents layout %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%\renewcommand{\contentsname}{\begin{center}Contents\end{center}}
%\renewcommand{\listfigurename}{\begin{center}List of Figures\end{center}}
%\renewcommand{\listtablename}{\begin{center}List of Tables\end{center}}
\renewcommand{\cftsecleader}{\cftdotfill{\cftdotsep}}
\renewcommand{\cfttoctitlefont}{\hspace*{\fill}\huge\bfseries}
\renewcommand{\cftaftertoctitle}{\hspace*{\fill}}
\renewcommand{\cftlottitlefont}{\hspace*{\fill}\huge\bfseries}
\renewcommand{\cftafterlottitle}{\hspace*{\fill}}
\renewcommand{\cftloftitlefont}{\hspace*{\fill}\huge\bfseries}
\renewcommand{\cftafterloftitle}{\hspace*{\fill}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% List of Figures/Table layout %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newlength{\mylenfig}
\newlength{\mylentab}

\renewcommand{\cftfigpresnum}{\textbf{\figurename}\enspace}
\renewcommand{\cfttabpresnum}{\textbf{\tablename}\enspace}
\renewcommand{\cftfigfont}{\bfseries}
\renewcommand{\cfttabfont}{\bfseries}
\renewcommand{\cftfigaftersnum}{.}
\renewcommand{\cfttabaftersnum}{.}
\renewcommand{\cftfigaftersnumb}{\normalfont}
\renewcommand{\cfttabaftersnumb}{\normalfont}
\settowidth{\mylenfig}{\cftfigpresnum}
\settowidth{\mylentab}{\cfttabpresnum}
\addtolength{\cftfignumwidth}{\mylenfig}
\addtolength{\cfttabnumwidth}{\mylentab}
\setlength{\cftfigindent}{0pt}  % remove indentation from figures in lof
\setlength{\cfttabindent}{0pt}  % remove indentation from tables in lot

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% toc, lot, lof layout %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand{\cfttoctitlefont}{\hspace*{\fill}\huge\bfseries}
\renewcommand{\cftaftertoctitle}{\hspace*{\fill}}
\renewcommand{\cftlottitlefont}{\hspace*{\fill}\huge\bfseries}
\renewcommand{\cftafterlottitle}{\hspace*{\fill}}
\renewcommand{\cftloftitlefont}{\hspace*{\fill}\huge\bfseries}
\renewcommand{\cftafterloftitle}{\hspace*{\fill}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Chapter/section title format %%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%\titleformat{\section}[hang]
%{\normalfont\LARGE\bfseries}{\Roman{section}.}{1em}{}
%\titleformat{\subsection}[hang]
%{\normalfont\Large\bfseries}{\arabic{section}.\arabic{subsection}}{1em}{}
%\titleformat{\subsubsection}[hang]
%{\normalfont\large}{\arabic{section}.\arabic{subsection}.\arabic{subsubsection}{1em}{}

% ``각 절 제목의 글자는 section (21pt, bold face), subsection (16pt, bold face), subsubsection (14pt, normal style), paragraph (12pt, Italic)로 설정한다.''
% ``각 절의 첫 문단은 들여쓰기를 하지 않지만, 두 번째 문단 이후부터는 들여쓰기 (16pt)를 한다. 각 절의 제목에는 글씨 크기에 비례하는 상하 여백을 준다.''
% 졸업논문 hwp 양식에서 따옴
\titleformat{\section}[hang]
{\normalfont\fontsize{21}{21}\selectfont\bfseries}{\Roman{section}.}{1em}{}
\titleformat{\subsection}[hang]
{\normalfont\fontsize{16}{16}\selectfont\bfseries}{\arabic{section}.\arabic{subsection}}{1em}{}
\titleformat{\subsubsection}[hang]
{\normalfont\fontsize{14}{14}\selectfont}{\arabic{section}.\arabic{subsection}.\arabic{subsubsection}}{1em}{}
\titleformat{\paragraph}[hang]
{\normalfont\fontsize{12}{12}\selectfont\it}{}{1em}{}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% caption format %%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%\renewcommand{\figurename}{Fig.}
\captionsetup[figure]{%
	font=small,labelsep=period,singlelinecheck=off,aboveskip=0pt,% 
	belowskip=0pt, margin=0pt,subrefformat=parens%
}
\captionsetup[table]{%
	font=small,labelsep=period,singlelinecheck=off,aboveskip=0pt,% 
	margin=0pt%
}

%%%%%%%%%%%%%%%%%%%%%%%
%%%  Summary format %%%
%%%%%%%%%%%%%%%%%%%%%%%
\newenvironment{summary}
{\begin{alwayssingle}
\begin{center}
\vspace*{1.5cm}
{\huge \bfseries Summary}
\par\vspace{10mm}
{\LARGE\bfseries\@engtitle}
\end{center}
\par\vspace{5mm}
}
{\end{alwayssingle}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Acknowledgement format %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newenvironment{acknowledgements}
{\begin{alwayssingle}
\begin{center}
\vspace*{1.5cm}
{\LARGE \bfseries {\@koracknowledgement}}
\end{center}
\vspace{0.5cm}
}
{\end{alwayssingle}}

%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Researches format %%%
%%%%%%%%%%%%%%%%%%%%%%%%%
\newenvironment{researches}
{\begin{alwayssingle}
\begin{center}
\vspace*{1.5cm}
{\huge \bfseries {\@korresearches}}
\end{center}
\vspace{0.5cm}
}
{\end{alwayssingle}}
