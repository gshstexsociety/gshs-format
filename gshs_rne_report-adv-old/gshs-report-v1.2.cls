% -*- TeX:UTF-8 -*-

\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{gshs-report-v1.2}[2016/06/10 v.1.21]%
%[2014/09/02 v0.1 Standard GSHS report document class, ko.TeX version] % initiated by 정민석(2014년도 경기과학고 수학과 전문교원)
% [2015/11/22 v0.11 Standard GSHS report document class, ko.TeX version] % modified by 박승원(32nd, 14041, seungwonpark) 
% 변경사항 : Figure를 Fig. 로 변경, References 를 '참고문헌'으로 변경, figure/table numbering 의 chapter 넘어갈때마다 문제생기는점 해결, SI 단위계 사용 가능하게 함
%[2015/11/25 v0.12 Standard GSHS report document class, ko.TeX version] % modified by 이상헌(32nd, 14080, evenharder) 
% 변경사항 : 심화 R&E 보고서에 지도교수의 이름을 표지에 추가해주는 \professor 구문 추가 및 fifthe 관련 오타 수정
%[2016/02/07 v0.13 Standard GSHS report document class, ko.TeX version] % modified by 박승원(32nd, 14041, seungwonpark)
% 변경사항 : 

% 인코딩 관련 주의사항 : 이 클래스에서 기본적으로 kotex을 포함하고 있기에 따로 포함할 필요는 없으나, inputenc 등의 추가적인 class 사용이나 TeXstudio의 'Insert encoding as TeX comment'는 삼가시기 바랍니다.

%% 그림과 표의 번호가 chapter를 넘어가도 초기화되지 않도록 설정. sample report 파일에 \counterwithout{figure}{chapter}가 포함됨
%\usepackage{chngcntr} % figure numbering across chapters continously

%[2016/06/02 v1.2 Standard GSHS report document class] % modified by 서울(경기과학고 물리교사), 박승원(32nd, 14041, seungwonpark)
% 변경사항(서울) : 표지의 폰트 및 vskip 간격 일부 수정, 지도교사/교수 이메일란 추가.
% 변경사항(박승원) : reporttype 를 통해 중간/결과 를 선택 가능하게 함, section formatting 수정 (section 계층 번호부여를 arabic 대신 roman 으로 수정)


% 영어 Font : Times New Roman
\usepackage[T1]{fontenc}   % To use Times New Roman
\usepackage[utf8]{inputenc}% To use Times New Roman
\usepackage{mathptmx}      % To use Times New Roman


%% SI Unit 을 사용하기 위한 설정. \SI{1}{\meter\per\sec}는 m/s 와 같이 나옴.
\usepackage[per-mode=symbol]{siunitx}
\sisetup{inter-unit-product = \cdot}
%http://tex.stackexchange.com/questions/59032/how-to-format-si-units

%% 옵션 설정을 위한 boolean 변수선언
\newif\if@isDoctor
\newif\if@isKorean
\newif\if@isFinal
\newif\if@PDFdoc\@PDFdocfalse
\newif\if@dvips\@dvipsfalse

%% 새 옵션 모음 - korean|english, final|draft
\DeclareOption{korean} {\@isKoreantrue}
\DeclareOption{english}{\@isKoreanfalse}
%\DeclareOption{basic}  {\@isBasictrue}
%\DeclareOption{intensice}  {\@isFinalfalse}

%% leqno,fleqn,openbib 옵션은 그대로 report 클래스에 전달
\DeclareOption{leqno}  {\PassOptionsToClass{leqno}  {article}}
\DeclareOption{fleqn}  {\PassOptionsToClass{fleqn}  {article}}
\DeclareOption{openbib}{\PassOptionsToClass{openbib}{article}}

\ExecuteOptions{english,final}         % doctor,korean,final이 기본값
\ProcessOptions

%% 12pt,a4paper,onecolumn,oneside 옵션으로 report 클래스 불러오기
\LoadClass[12pt, a4paper, onecolumn, oneside,titlepage]{article}


%%들여쓰기
\usepackage{indentfirst}
\setlength\parindent{2.0em}

\RequirePackage{ifthen}       % 추가 패키지 설정
\RequirePackage{tabu}

%%%% Hangul-ucs preamble.......
\RequirePackage[nonfrench]{kotex}
%\RequirePackage[default]{dhucs-interword}

%수학 패키지
\RequirePackage{amsmath}
\RequirePackage{graphicx,xcolor}
\usepackage{amssymb}
\usepackage{amsthm}

%% for compatability to HLaTeX
\let\gt\sffamily
\DeclareTextFontCommand{\textgt}{\gt}
%%%% end of Hangul-ucs preamble

%% 편집용지 설정
\usepackage[left=25mm,right=25mm,top=30mm,bottom=30mm]{geometry}
%\usepackage{geometry}
\usepackage{amssymb}
\usepackage{setspace}

%% 줄간격 설정
%\renewcommand{\baselinestretch}{1.3}
\linespread{1.6}

%% 본문이 영어로 되어있는지 한글로 되어있는지 설정
\newcommand{\@korean}{korean}
\newcommand{\@english}{english}
\newcommand{\@textlang}{}                    % 텍스트 기본언어 변수선언
\if@isKorean                                 % korean 옵션이 지정되어 있으면
\let\@textlang\@korean                  % 텍스트 기본언어는 한글
\else                                        % english 옵션이 지정되어 있으면
\let\@textlang\@english                 % 텍스트 기본언어는 영문
\fi

%% pagestyle 
\def\ps@gshs{\let\@mkboth\@gobbletwo
	\let\@oddhead\@empty
	\def\@oddfoot{\reset@font\hfil--\ \thepage\ --
		\hfil}%
	\let\@evenhead\@empty\let\@evenfoot\@oddfoot
}

\pagestyle{gshs}

%% 연구 타입
\newcommand{\researchtype}[1]{
	\newcommand{\@type}{#1}}
\@onlypreamble{\researchtype}


%% 보고서 타입 (중간보고서,결과보고서)
\newcommand{\reporttype}[1]{%
	\newcommand{\@reporttype}{#1}%
}


%%
%% 문서 정보 변수 정의
%%

\newcommand{\@firstAuthor} {}
\newcommand{\@secondAuthor} {}
\newcommand{\@thirdAuthor} {}
\newcommand{\@forthAuthor} {}
\newcommand{\@fifthAuthor} {}
\renewcommand{\author}[2][1]{%
	\ifthenelse{\equal{#1}{1}}{\renewcommand{\@firstAuthor} {#2}} {}%
	\ifthenelse{\equal{#1}{2}}{\renewcommand{\@secondAuthor}{#2}} {}%
	\ifthenelse{\equal{#1}{3}}{\renewcommand{\@thirdAuthor} {#2}} {}%
	\ifthenelse{\equal{#1}{4}}{\renewcommand{\@forthAuthor}{#2}} {}%
	\ifthenelse{\equal{#1}{5}}{\renewcommand{\@fifthAuthor} {#2}} {}%
}
\@onlypreamble{\author}

% @command email 저자 이름
% @param family_name, given_name 성, 이름을 구분해서 입력
% @options [default: (none)]
% - korean: 한글이름 | chinese: 한문이름 | english: 영문이름
\newcommand{\@firstAuthorEmail} {}
\newcommand{\@secondAuthorEmail} {}
\newcommand{\@thirdAuthorEmail} {}
\newcommand{\@forthAuthorEmail} {}
\newcommand{\@fifthAuthorEmail} {}

\newcommand{\email}[2][1]{%
	\ifthenelse{\equal{#1}{1}}{\renewcommand{\@firstAuthorEmail} {#2}} {}%
	\ifthenelse{\equal{#1}{2}}{\renewcommand{\@secondAuthorEmail}{#2}} {}%
	\ifthenelse{\equal{#1}{3}}{\renewcommand{\@thirdAuthorEmail} {#2}} {}%
	\ifthenelse{\equal{#1}{4}}{\renewcommand{\@forthAuthorEmail}{#2}} {}%
	\ifthenelse{\equal{#1}{5}}{\renewcommand{\@fifthAuthorEmail} {#2}} {}%
}
\@onlypreamble{\email}

% @command advisor 지도교사 이름
\newcommand{\advisor}[1]{
	\newcommand{\@advisor}{#1}
}
\@onlypreamble{\advisor}

% @command advisor 지도교사 이메일
\newcommand{\advisorEmail}[1]{
	\newcommand{\@advisorEmail}{#1}
}
\@onlypreamble{\advisorEmail}

% @command professor 지도교수 이름

\newcommand{\professor}[1]{
	\newcommand{\@professor}{#1}
}
\@onlypreamble{\professor}

% @command English Title
\newcommand{\englishtitle}[1]{
	\newcommand{\@englishtitle}{#1}
}
\@onlypreamble{\englishtitle}

% @command advisor 지도교사 이메일
\newcommand{\professorEmail}[1]{
	\newcommand{\@professorEmail}{#1}
}
\@onlypreamble{\professorEmail}

% @param year,month,day 연,월,일 순으로 입력
\newcommand{\summitdate}[3]{
	\newcommand{\@summitYear}{#1}
	\newcommand{\@summitMonth}{#2}
	\newcommand{\@summitDate}{#3}		
}
\@onlypreamble{\summitdate}


%%
%% 앞표지 생성
%%
\newcommand{\makecover}{%
	\renewcommand{\baselinestretch}{1.3}%
	\thispagestyle{empty} \noindent%
	\@summitYear 학년도\newline
	{\sf \textbf{경기과학고등학교 \@type R\&E \@reporttype 보고서}}
	\vskip 3cm
	\noindent\begin{minipage}[t]{\textwidth}
		\begin{center}
			\fontsize{21pt}{21pt}\selectfont  \@title \\[21pt]
		\end{center}
	\end{minipage}
	\vskip 3.6604cm %3cm + 12pt*1.3*1.2
	\noindent\begin{minipage}[c]{\textwidth}
		\begin{center}
			\@summitYear. \@summitMonth. \@summitDate
		\end{center}
	\end{minipage}
	\vskip 3.6604cm %3cm + 12pt*1.3*1.2
	\noindent\begin{minipage}[c]{\textwidth}
		\begin{center}
			\large 연구참여자 : \@firstAuthor(\@firstAuthorEmail)\\ 
			\ifthenelse{\equal{\@secondAuthor}{}}{} {\hskip 7pc 
				\@secondAuthor(\@secondAuthorEmail)\\ }%
			\ifthenelse{\equal{\@thirdAuthor}{}}{}{\hskip 7pc 
				\@thirdAuthor(\@thirdAuthorEmail)\\ }%
			\ifthenelse{\equal{\@forthAuthor}{}}{}{\hskip 7pc 
				\@forthAuthor(\@forthAuthorEmail)\\ }%
			\ifthenelse{\equal{\@fifthAuthor}{}}{}{\hskip 7pc 
				\@fifthAuthor(\@fifthAuthorEmail)\\ }%
		\end{center}
	\end{minipage}
	\vskip 4.56pc %3pc + 12pt*1.3*1.2
	\noindent\begin{minipage}[c]{\textwidth}
		\begin{center}
			\large 지도교사: \@advisor(\@advisorEmail)
		\end{center}
	\end{minipage}
	\vskip 2pc
	\noindent\begin{minipage}[c]{\textwidth}
		\begin{center}
			\large \ifthenelse{\equal{\@type}{심화}}{지도교수: 
			\@professor(\@professorEmail)}{}
		\end{center}
	\end{minipage}
	\vskip 5pc
	\noindent \begin{minipage}[c]{\textwidth}
		\begin{center}
			{\normalfont\fontsize{18}{18}\selectfont\bfseries 
			과학영재학교}
			~
			{\normalfont\fontsize{24}{24}\selectfont\bfseries 
			경기과학고등학교}
		\end{center}
	\end{minipage}
	\newpage
}

%한글초록
\newenvironment{abstractkor}{%
	\pagenumbering{roman}                        % 로마자 페이지 시작
	\thispagestyle{plain}%
	\vspace*{5cm}
	\begin{center} \Large \textbf{초~~~~~록} \end{center}  % 초록명 -> Abstract
	
	\hspace*{5mm}
	\if@PDFdoc\phantomsection\fi\addcontentsline{toc}{content}{초록}% 초록을 목차(TOC)에 삽입
}

%%
%% 헤딩 재설정
%%
\renewcommand{\contentsname}{%
	\if@isKorean 목 차       \else Contents        \fi}
\renewcommand{\listfigurename}{%
	\if@isKorean 그 림 목 차 \else List of Figures \fi}
\renewcommand{\listtablename}{%
	%\if@isKorean 표 목 차    \else List of Tables  \fi}
	\if@isKorean 표 목 차    \else 표 목 차  \fi}
%\renewcommand{\bibname}{%
	%\if@isKorean 참 고 문 헌 \else References      \fi}
%	\if@isKorean 참 고 문 헌 \else 참 고 문 헌      \fi}




\renewcommand \thefigure {\@arabic\c@figure}
\renewcommand \thetable {\@arabic\c@table}
%\def\fnum@table{\thetable}
%\def\fnum@figure{\thefigure}

\renewcommand\figurename{Fig.}%{\sf Fig.}
\renewcommand\tablename{Table}%{\sf Tab.}
%\def\fnum@figure{\figurename\nobreakspace\thefigure}
%\def\fnum@table{\tablename\nobreakspace\thetable}




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Chapter/section title format %%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\usepackage{titlesec}

%\titleformat{command}[shape]{format}{label}{sep}{before-code}{after-code}

\titleformat{\section}[hang]
{\LARGE\bfseries}{\Roman{section}.}{1em}{}{}
\titleformat{\subsection}[hang]
{\Large\bfseries}{\arabic{section}.\arabic{subsection}}{1em}{}{}
\titleformat{\subsubsection}[hang]
{\large}{\arabic{section}.\arabic{subsection}.\arabic{subsubsection}}{1em}{}{}
\titleformat{\paragraph}[hang]
{\normalfont\fontsize{12}{12}\selectfont\it}{}{1em}{}{}

%% section 명령어 수정 - section 넘어갈 때마다 clearpage.. 드디어 해결..!
\let\stdsection\section
\renewcommand\section{\newpage\stdsection}

%%
%% 목차에 나오는 형식 - report 클래스로부터 복사하여 일부 수정
%%

\newcommand{\l@content}{\large\bf\@dottedtocline{1}{0em}{0em}}


\if@isKorean % 한글이면 각종 치수를 변경
\renewcommand*\l@section{\@dottedtocline{1}{2.7em}{2.3em}}
\renewcommand*\l@subsection{\@dottedtocline{2}{5.0em}{3.2em}}
\renewcommand*\l@subsubsection{\@dottedtocline{3}{8.2em}{4.1em}}
\renewcommand*\l@paragraph{\@dottedtocline{4}{11.2em}{5em}}
\renewcommand*\l@subparagraph{\@dottedtocline{5}{13.2em}{6em}}
\else \fi     % 영문이면 가만히 내버려둠


%%
%% 한국식 날짜 표기 -> 영문식 날짜 표기
%%
\newcommand{\@dateUSenglish}[3]{%  % 미국식 날짜 표기
	\newcommand{\@year}{#1}%
	\newcommand{\@month}{#2}%
	\newcommand{\@day}{#3}%
	\ifcase\@month \or
	January \or February \or March \or April \or May \or June \or
	July \or August \or September \or October \or November \or December \fi
	\@day, \@year
}
\newcommand{\@dateBRenglish}[3]{%  % 영국식 날짜 표기
	\newcommand{\@year}{#1}%
	\newcommand{\@month}{#2}%
	\newcommand{\@day}{#3}%
	\@day\ifcase\@day \or
	st\or nd\or rd\or th\or th\or th\or th\or th\or th\or th\or
	st\or nd\or rd\or th\or th\or th\or th\or th\or th\or th\or
	st\or nd\or rd\or th\or th\or th\or th\or th\or th\or th\or th\fi
	\space\ifcase\@month \or
	January\or February\or March\or April\or May\or June\or
	July\or August\or September\or October\or November\or December\fi,
	\@year
}


\long\def\@makecaption#1#2{%
	\vskip\abovecaptionskip
	\sbox\@tempboxa{#1. #2}%
	\ifdim \wd\@tempboxa >\hsize
	#1. #2\par
	\else
	\global \@minipagefalse
	\hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
	\fi
	\vskip\belowcaptionskip}
