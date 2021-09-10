
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{gshs-report}[]


\DeclareOption*{\PassOptionsToClass{\CurrentOption}{memoir}}
\ProcessOptions\relax
\LoadClass[11pt,a4paper,oneside]{memoir}


%% **************** Packages (Start) *********************
\usepackage{cmap}

\RequirePackage[utf8]{inputenc}      % Required for inputting international characters
\RequirePackage[T1]{fontenc}         % Output font encoding for international characters
\RequirePackage{mathpazo}            % Use the Palatino font by default
\RequirePackage[english]{babel}      % Load babel if you're unsure about the default language - mostly to be safe
\RequirePackage{xcolor}              % For named colors
\RequirePackage{eso-pic}                 % required to place huge uni logo at the back - on title page
\RequirePackage[pdftex]{graphicx}    % For pictures
\RequirePackage{amssymb}             % At least, for black squares in bullet list
\RequirePackage[pdfusetitle]{hyperref}             % For hyperreferences
\RequirePackage[authoryear,semicolon,sort]{natbib} % for (Ebejer, 2012; Alba, 2013) kind of references; removed 'square' option after viva examination comments

\RequirePackage{longtable}           % For very long tables
\RequirePackage{amsmath} 
\RequirePackage{pdflscape}			 % For landscape tables (instead of portrait)
\usepackage[defaultsans]{lato}		 % Sans font to use
\usepackage[printonlyused,withpage]{acronym}
\usepackage{lipsum} % dummy text
\usepackage{float} % dummy text
\usepackage{listings}
\usepackage{etoolbox}

\input glyphtounicode
\pdfgentounicode=1
%% ****************** Packages (End) *********************



\definecolor{OxfordBlue}{rgb}{0,0.106,0.329}   % Color
\definecolor{GsBlue}{rgb}{0,0.106,0.329}   % 

% Setup logo
\def\logo{{\includegraphics[width=30mm]{logo}}}

% The year and term the thesis is submitted 
\def\degreedate#1{\gdef\@degreedate{#1}}
% The full (unabbreviated) name of the degree
\def\degree#1{\gdef\@degree{#1}}
% The name of your supervisor
\def\koauthor#1{\gdef\@koauthor{#1}}
% The name of your co-supervisor
\def\cosupervisor#1{\gdef\@cosupervisor{#1}}
% The name of your department (e.g. Computer Science, Statistics, Biochemistry, AI)
\def\department#1{\gdef\@department{#1}}
% The name of your faculty
\def\faculty#1{\gdef\@faculty{#1}}
% The name of your faculty
\def\subjectcode#1{\gdef\@subjectcode{#1}}
% The tagline
\def\tagline#1{\gdef\@tagline{#1}}
% The document type, e.g. a dissertation or a thesis
\def\doctype#1{\gdef\@doctype{#1}}
\def\authorID#1{\gdef\@authorID{#1}}

%% ************* Definitions (End) ******************


%% ************ Document Options (Start) *****************

\OnehalfSpacing                                  % One and a half line spacing

\setlength{\headsep}{1.5cm}                      % Add space between the header and text

\nouppercaseheads								 % Don't convert titles to Uppercase
\makepagestyle{gspage}

												 % This travesty is due to a bug in memoir, see https://tex.stackexchange.com/questions/468922/oneside-in-memoir-causing-header-trouble
\makeevenhead{gspage}{\color{gray}\sffamily\small\leftmark}{}{\color{gray}\sffamily\small\rightmark}
\makeoddhead{gspage}{\color{gray}\sffamily\small\leftmark}{}{\color{gray}\sffamily\small\rightmark}
\makeevenfoot{gspage}{}{\thepage}{}  			 % UM pagestyle, put page at bottom
\makeoddfoot{gspage}{}{\thepage}{}
\makeheadfootruleprefix{gspage}{\color{gray}}{}
\makeheadrule{gspage}{\textwidth}{\normalrulethickness}
\makepsmarks{gspage}{%
	%\createmark{chapter}{left}{shownumber}{\@chapapp\ }{. \ }
	\createmark{section}{right}{shownumber}{}{. \ }
}


\setlrmarginsandblock{2.5cm}{2.5cm}{*}           % Set the page margins (for one and two sided docs) 
\checkandfixthelayout                            % Put layout into effect

\graphicspath{{./images/}}                       % Where to look for images (paths) ...
\DeclareGraphicsExtensions{.pdf,.jpeg,.png,.jpg} % Graphics extensions to load

\chapterstyle{dash} % how to draw the different chapter headings

\renewcommand*{\chapnumfont}{\sffamily\HUGE\bfseries\color{GsBlue}}  % Chapter titles should be normal
\renewcommand*{\chaptitlefont}{\sffamily\Huge\color{GsBlue}}
\setsecheadstyle{\sffamily\Large\color{GsBlue}}% Set \section style
\setsubsecheadstyle{\sffamily\large\color{GsBlue}}% Set \subsection style
\setsubsubsecheadstyle{\sffamily\large\color{GsBlue}}% Set \subsection style
\setsecnumformat{\csname the#1\endcsname\enskip{\color{gray}\textbar}\enskip}

\newsubfloat{figure} % declares a new subfloat element which allows to use \subbottom commands

\renewcommand{\labelitemi}{\color{GsBlue}\scriptsize$\blacksquare$}

\addto{\captionsenglish}{\renewcommand{\bibname}{References}} % because we are using babel we need this                                                       % instead of just redefining bibname
\setlength{\bibitemsep}{\onelineskip}

\newcommand{\ra}[1]{\renewcommand{\arraystretch}{#1}} % to set array stretch within tables

\hypersetup{%
    colorlinks=false,
    linkcolor=GsBlue,
    citecolor=GsBlue,
    urlcolor=GsBlue,
    filecolor=magenta, 
    pdfborder={0 0 0},    
}

\feetbelowfloat % we want the footnotes below floats, not wierdly above

\setsecnumdepth{subsubsection}  % three level depth - chapter, section, subsection, subsubsection
\settocdepth{subsection}

\renewcommand*{\cftappendixname}{Appendix\space}
\newcommand{\removelinebreaks}[1]{%
	\begingroup\def\\{ }#1\endgroup}
\renewcommand*{\thesection}{\arabic{section}}

%% ************* Document Options (End) ******************






%% *************** Environments (Start) ******************

%% *** Title Page (Start) ***
% background image
% taken from http://tug.org/pracjourn/2008-1/mori/mori.pdf
\newcommand\AlCentroPagina[1]{%
\AddToShipoutPicture*{\AtPageCenter{%
\makebox(0,-50){\includegraphics[width=0.5\paperwidth]{#1}}}}}

% The front page
\renewcommand{\maketitle}
{\begingroup
\AlCentroPagina{logo_gray}
\parbox[b][0.95\textheight][t]{0.2\textwidth}{\raggedleft\logo} %% this 0.95 is important, otherwise page overflows in next page
\hspace*{2ex}
\textcolor{GsBlue}{\rule{2pt}{0.95\textheight}}
\hspace*{2ex}
\parbox[b][0.95\textheight][t]{0.8\textwidth}{
    \setlength{\parindent}{0pt}
    %%\fontfamily{pag}\selectfont
    \sffamily
    {\Huge\bfseries{\begin{Spacing}{1.15}\textcolor{GsBlue}{\@title}\end{Spacing}}}
    \vspace*{2ex}
    {\large\textit{\@tagline}}\\[1in]
    
    {\LARGE\bfseries \textsc{\@author}} \\[0.5cm]
    {\large \@koauthor} \\[1cm]
    {\large \@cosupervisor} \\[1cm]
    {\large \@department} \\[1ex]
    {\large Gyeonggi Science High School} \\
    \vfill
    {\bfseries \@degreedate}\\[\baselineskip]
	\parbox[t]{0.80\linewidth}{\footnotesize\textit{이 보고서는 2021년 수학세미나 자율보고서로 작성되었습니다}.}    
}
\thispagestyle{empty}
\if@openright\cleardoublepage\else\clearpage\fi
\endgroup}
%% *** Title Page (End) ***

\newenvironment{acknowledgements}
{\renewcommand{\abstractname}{\Large\bfseries\sffamily\textcolor{GsBlue}{Acknowledgements}}\abstract}
{\endabstract\if@openright\cleardoublepage\else\clearpage\fi}
       
\addto{\captionsenglish}{\renewcommand{\abstractname}{\Large\bfseries\sffamily\textcolor{GsBlue}{Abstract}}}

\newenvironment{dedication2}
  {         % we want a new page
   \thispagestyle{empty}% no header and footer
   \vspace*{\stretch{1}}% some space at the top 
   \itshape             % the text is in italics
   \raggedleft          % flush to the right margin
   \textcolor{GsBlue}
  }
  {\par % end the paragraph
   \vspace{\stretch{3}} % space at bottom is three times that at the top
  }  
  
\newenvironment{dedication}
  {\clearpage           % we want a new page
   \thispagestyle{empty}% no header and footer
   \vspace*{\stretch{1}}% some space at the top 
   \itshape             % the text is in italics
   \raggedleft          % flush to the right margin
   \textcolor{GsBlue}
  }
  {\par % end the paragraph
   \vspace{\stretch{3}} % space at bottom is three times that at the top
   \if@openright\cleardoublepage\else\clearpage\fi
  }       
\newenvironment{copyright2}
  {
  }     

%%\renewenvironment{abstract}
%%{\begin{alwayssingle} \thispagestyle{empty}
%%\begin{center}
%%\vspace*{0.5cm}
%%{\large \bfseries \textcolor{GsBlue}{Abstract}}
%%\end{center}
%%\singlespacing\enlargethispage{\baselineskip}}
%%{\end{alwayssingle}}

%%{\cleardoublepage\newgeometry{right=1.3cm,top=2.4cm,bottom=2cm}\pagestyle{empty}\begin{center}\bfseries\large\textcolor{OxfordBlue}\abstractname\end{center}\normalsize\onehalfspacing\begin{quotation}}{\end{quotation}\restoregeometry\cleardoublepage}


% STATEMENT OF ORIGINALITY
%
% The originality environment puts a large, bold, centered 
% "Statement of originality" label at the top of the page. The statement 
% of originality itself appears in a quote environment, i.e. tabbed in at 
% both sides, and on its own page.

%\newenvironment{originality}
%{\clearpage
%\begin{center}
%\vspace*{1.5cm}
%{\Large\bfseries\sffamily\textcolor{GsBlue}{Statement of Originality}\par}
%\vspace*{1.5cm}
%{I, the undersigned, declare that this is my own work unless where otherwise acknowledged and referenced. \par}
%\vspace*{1.5cm}
%\renewcommand\arraystretch{1.5}
%\begin{tabular}{ll}
%      {\bfseries Candidate} & \@author \\[15mm]
%      {\bfseries Signed} & \makebox[1.5in]{\hrulefill} \\
%      {\bfseries Date} & \today \\
%\end{tabular}
%\end{center}
%\if@openright\cleardoublepage\else\clearpage\fi}

%% This was updated to the official Statement of Originality (Authentication form)

\newenvironment{originality}
{\clearpage\thispagestyle{empty}
\begin{figure}[h]
	\includegraphics[width=4in]{logo_full}
\end{figure}
\vspace{3mm}
{\noindent\Large\bfseries\sffamily\textcolor{GsBlue}{서버 사용 규칙}}\\ %% FIXME this will have to change if not postgraduate ...

{\setlength{\parindent}{0em}
	
\textbf{(a) 사용 목적}\\

\noindent 경기과학고등학교의 연구용 서버는 7층 서버실에 있다. 이 서버는 정보과학 연구 또는 이외 학교의 공적인 목적으로만 이용할 수 있으며 암호화폐 채굴, 게임 연산 보조 등 사적인 목적으로 이용할 수 없다.\\

\textbf{(b) 사용 신청}\\

연구용 서버의 GPU를 사용하지 않는 경우 별도의 사용 신청이 필요하지 않다. 서버의 GPU를 사용하고자 하는 학생은 반드시 송죽학사를 통해 미리 신청해야 한다. 신청하고 승인받은 이후 사용하고자 할 때는 반드시 정해진 GPU를 정해진 기한 동안만 사용해야 한다.\\

\textbf{(c) 관리}\\

연구용 서버는 GM 봉사모둠이 관리한다. 또한, GM 봉사모둠원만이 관리자 계정을 가질 수 있으며 root 계정의 비밀번호는 각 기수의 기장이 관리한다. \\

\textbf{(d) 현재 서버 정보}}\\

%%\newcolumntype{L}{>{\arraybackslash}m{2.5in}}
\bgroup
\def\arraystretch{1.2}%
\begin{tabular}{|l|l}
{\bfseries OS} & {Ubuntu 18.04.5 LTS} \\
{\bfseries CPU} & {Intel(R) Xeon(R) CPU E5-2680 v2 @ 2.80GHz $\times$ 40} \\
{\bfseries GPU} & {Nvidia Tesla K40c $\times$ 6} \\
{\bfseries IP} & {115.23.235.135} \\
{\bfseries Port} & {443} \\
{\bfseries Location} & {SRC 718} \\
{\bfseries Admin} & {19007 권준우} \\
{\bfseries Last modified} & {2021.5.11.} \\
\end{tabular}\\
\egroup
\if@openright\cleardoublepage\else\clearpage\fi}


% COPYRIGHT
%
% The originality environment puts a large, bold, centered 
% "Statement of originality" label at the top of the page. The statement 
% of originality itself appears in a quote environment, i.e. tabbed in at 
% both sides, and on its own page.

