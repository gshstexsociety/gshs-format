% -*- TeX:UTF-8 -*-

\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{gshs-report-v0.11}%
       %[2014/09/02 v0.1 Standard GSHS report document class, ko.TeX version] % initiated by 정민석(2014년도 경기과학고 수학과 전문교원)
	   [2015/11/22 v0.11 Standard GSHS report document class, ko.TeX version] % modified by 박승원(32nd, 14041, seungwonpark) 
	   % 변경사항 : Figure를 Fig. 로 변경, References 를 '참고문헌'으로 변경, figure/table numbering 의 chapter 넘어갈때마다 문제생기는점 해결, SI 단위계 사용 가능하게 함
       
%% 그림과 표의 번호가 chapter를 넘어가도 초기화되지 않도록 설정. sample report 파일에 \counterwithout{figure}{chapter}가 포함됨
\usepackage{chngcntr} % figure numbering across chapters continously

%% SI Unit 을 사용하기 위한 설정. \SI{1}{\meter\per\sec}는 m/s 와 같이 나옴.
\usepackage[per-mode=symbol]{siunitx}
\sisetup{inter-unit-product =$\cdot$} % http://tex.stackexchange.com/questions/59032/how-to-format-si-units

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
\DeclareOption{leqno}  {\PassOptionsToClass{leqno}  {report}}
\DeclareOption{fleqn}  {\PassOptionsToClass{fleqn}  {report}}
\DeclareOption{openbib}{\PassOptionsToClass{openbib}{report}}

\ExecuteOptions{english,final}         % doctor,korean,final이 기본값
\ProcessOptions

%% 12pt,a4paper,onecolumn,oneside 옵션으로 report 클래스 불러오기
\LoadClass[12pt, a4paper, onecolumn, oneside]{report}


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

%$ 연구 타입
\newcommand{\researchtype}[1]{
\newcommand{\@type}{#1}}
\@onlypreamble{\researchtype}

%%
%% 문서 정보 변수 정의
%%

%% @command title 논문 제목
%% @options [default: (none)]
%% - korean: 한글제목 | english: 영문제목
%\renewcommand{\title}[2][korean] {%
%    \ifthenelse{\equal{#1}{korean}}%
%        {\newcommand{\@titleKor}{#2}}{}%
%    \ifthenelse{\equal{#1}{english}}%
%        {\newcommand{\@titleEng}{#2}}{}%
%}
%\@onlypreamble{\title}

% @command author 저자 이름
% @param family_name, given_name 성, 이름을 구분해서 입력
% @options [default: (none)]
% - korean: 한글이름 | chinese: 한문이름 | english: 영문이름
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
    \ifthenelse{\equal{#1}{5}}{\renewcommand{\@fiftheAuthor} {#2}} {}%
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
    \ifthenelse{\equal{#1}{5}}{\renewcommand{\@fiftheAuthorEmail} {#2}} {}%
}
\@onlypreamble{\email}

% @command advisor 지도교사 이름
\newcommand{\advisor}[1]{
\newcommand{\@advisor}{#1}
}
\@onlypreamble{\advisor}

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
    \@summitYear 학년도\\
    {\sf 경기과학고등학교 \@type R\&E 결과보고서}\\
    \vskip 3cm
    \noindent\begin{minipage}[t]{\textwidth}
        \begin{center}
            \fontsize{21pt}{21pt}\selectfont  \@title \\[21pt]
        \end{center}
    \end{minipage}\\
    \vskip 3cm
    \noindent\begin{minipage}[c]{\textwidth}
        \begin{center}
            \@summitYear. \@summitMonth. \@summitDate
        \end{center}
    \end{minipage}\\
    \vskip 3cm
    \noindent\begin{minipage}[c]{\textwidth}
        \begin{center}
            \large 연구참여자 : \@firstAuthor(\@firstAuthorEmail)\\ 
            \ifthenelse{\equal{\@secondAuthor}{}}{} {\hskip 7pc \@secondAuthor(\@secondAuthorEmail)\\ }%
    \ifthenelse{\equal{\@thirdAuthor}{}}{}{\hskip 7pc \@thirdAuthor(\@thirdAuthorEmail)\\ }%
    \ifthenelse{\equal{\@forthAuthor}{}}{}{\hskip 7pc \@forthAuthor(\@forthAuthorEmail)\\ }%
    \ifthenelse{\equal{\@fifthAuthor}{}}{}{\hskip 7pc \@fifthAuthor(\@fifthAuthorEmail)\\ }%
           \end{center}
    \end{minipage}\\
    \vskip 3pc
    \noindent\begin{minipage}[c]{\textwidth}
        \begin{center}
            \large 지도교사: \@advisor
        \end{center}
    \end{minipage}
    \vskip 7pc
   \noindent \begin{minipage}[c]{\textwidth}
        \begin{center}
            \large 과학영재학교 \Large 경기과학고등학교
        \end{center}
    \end{minipage}
    \newpage
}
  

%한글초록
\newenvironment{abstractkor}{%
%    \pagenumbering{roman}                        % 로마자 페이지 시작
    \thispagestyle{plain}%
    \vspace*{2cm}
    \begin{center} \Large \textbf{초~~~~~록} \end{center}      % 초록명 -> Abstract
    \vspace*{4mm}
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
\renewcommand{\bibname}{%
    %\if@isKorean 참 고 문 헌 \else References      \fi}
    \if@isKorean 참 고 문 헌 \else 참 고 문 헌      \fi}

%%
%% \part 재정의 - 아예 쓰지 못하게 막아버림. 이 명령을 호출하면 에러 발생.
%%
\renewcommand\part{%
    \secdef\@part\@spart}
\def\@part[#1]#2{%
    \ClassError{gshs}{The use of \protect\part\space is prohibited.
        \MessageBreak Consider the use of \protect\chapter\space instead}{}
}
\def\@spart#1{%
    \ClassError{gshs}{The use of \protect\part\space is prohibited.
        \MessageBreak Consider the use of \protect\chapter\space instead}{}
}

%%
%% \chapter 재정의 - report 클래스로부터 복사하여 일부 수정
%%
\renewcommand\chapter{%
\renewcommand{\thechapter}{\Roman{chapter}}%
    \if@openright\cleardoublepage\else\clearpage\fi
%   \thispagestyle{plain}%
    \global\@topnum\z@
    \@afterindentfalse
%   \if@isKorean \parindent\z@ \else \fi % <-- 추가할지 여부 고민중
    \secdef\@chapter\@schapter}
\def\@chapter[#1]#2{%
    \ifnum \c@secnumdepth >\m@ne
        \refstepcounter{chapter}%
        \typeout{\@chapapp\space\thechapter.}%
        \addcontentsline{toc}{chapter}{%
                \protect\numberline{\thechapter.}#1
        }% <-- 목차에 나타나는 형식 - 변경사항
    \else
        \addcontentsline{toc}{chapter}{#1}%
    \fi
    \chaptermark{#1}%
%    \addtocontents{lof}{\protect\addvspace{10\p@}}%
%    \addtocontents{lot}{\protect\addvspace{10\p@}}%
    \if@twocolumn
        \@topnewpage[\@makechapterhead{#2}]%
    \else
        \@makechapterhead{#2}%
        \@afterheading%
    \fi
}
\def\@makechapterhead#1{% <-- 전체 변경
    \vspace*{10\p@}
    {\parindent\z@ \LARGE\bfseries
        {\thechapter.\hspace{1.4ex}}
    #1\par}
    \vspace*{20\p@}
}
\def\@schapter#1{%
    \if@twocolumn
        \@topnewpage[\@makeschapterhead{#1}]%
    \else
        \@makeschapterhead{#1}%
        \@afterheading
    \fi}
\def\@makeschapterhead#1{% <-- 전체 변경
    \vspace*{10\p@}
    {\centering \parindent\z@ \LARGE\bfseries #1\par}
    \vspace*{20\p@}
}

%%
%%
%%

\renewcommand \thesection {\@arabic{\c@chapter}.\@arabic\c@section}
\renewcommand \thesubsection   {\thesection.\@arabic\c@subsection}
\renewcommand \thesubsubsection{\thesubsection.\@arabic\c@subsubsection}
\renewcommand \theparagraph    {\thesubsubsection.\@arabic\c@paragraph}
\renewcommand \thesubparagraph {\theparagraph.\@arabic\c@subparagraph}
\renewcommand \thefigure {\@arabic\c@figure}
\renewcommand \thetable {\@arabic\c@table}
%\def\fnum@table{\thetable}
%\def\fnum@figure{\thefigure}

\renewcommand\figurename{Fig.}%{\sf Fig.}
\renewcommand\tablename{Table}%{\sf Tab.}
%\def\fnum@figure{\figurename\nobreakspace\thefigure}
%\def\fnum@table{\tablename\nobreakspace\thetable}

%%
%% \tableofcontents 재정의 - report 클래스로부터 복사하여 일부 수정
%%
\renewcommand\tableofcontents{%
	\thispagestyle{plain}
    \if@twocolumn
        \@restonecoltrue\onecolumn
    \else
        \@restonecolfalse
    \fi
    \chapter*{\contentsname
        \@mkboth{\MakeUppercase\contentsname}{\MakeUppercase\contentsname}}%
    \pagenumbering{roman}                         % roman 페이지번호로 복원
    \setcounter{page}{\value{pagemarker}}         % pagemarker에 저장된 값으로
    \if@PDFdoc\phantomsection\fi\addcontentsline{toc}{content}{\contentsname} % 목차(TOC)에 추가
    \@starttoc{toc}%
    \if@restonecol\twocolumn\fi
    \newpage \setcounter{pagemarker}{\value{page}}% pagemarker에 다시 저장
    \pagenumbering{arabic}                        % arabic 페이지번호로 재시작
}

%%
%% \listoftables 재정의 - report 클래스로부터 복사하여 일부 수정
%%
\renewcommand\listoftables{%
	\thispagestyle{plain}
    \if@twocolumn
        \@restonecoltrue\onecolumn
    \else
        \@restonecolfalse
    \fi
    \chapter*{\listtablename}%
    \@mkboth{\MakeUppercase\listtablename}{\MakeUppercase\listtablename}%
    \pagenumbering{roman}                         % roman 페이지번호로 복원
    \setcounter{page}{\value{pagemarker}}         % pagemarker에 저장된 값으로
    \if@PDFdoc\phantomsection\fi\addcontentsline{toc}{content}{\listtablename}% 목차(TOC)에 추가
    \@starttoc{lot}%
    \if@restonecol\twocolumn\fi
    \newpage \setcounter{pagemarker}{\value{page}}% pagemarker에 다시 저장
    \pagenumbering{arabic}                        % arabic 페이지번호로 재시작
}

%%
%% \listoffigures 재정의 - report 클래스로부터 복사하여 일부 수정
%%
\renewcommand\listoffigures{%
	\thispagestyle{plain}
    \if@twocolumn
        \@restonecoltrue\onecolumn
    \else
        \@restonecolfalse
    \fi
    \chapter*{\listfigurename}%
    \phantomsection 
    \pagenumbering{roman}                         % roman 페이지번호로 복원
    \setcounter{page}{\value{pagemarker}}         % pagemarker에 저장된 값으로
    \addcontentsline{toc}{content}{\listfigurename}% 목차(TOC)에 추가
    \@starttoc{lof}%
    \if@restonecol\twocolumn\fi

    \newpage \setcounter{pagemarker}{\value{page}}% pagemarker에 다시 저장
    \pagenumbering{arabic}                        % arabic 페이지번호로 재시작
}

%%
%% 목차에 나오는 형식 - report 클래스로부터 복사하여 일부 수정
%%

\newcommand{\l@content}{\large\bf\@dottedtocline{1}{0em}{0em}}

\renewcommand*\l@chapter[2]{%
    \ifnum \c@tocdepth >\m@ne
        \addpenalty{-\@highpenalty}%
        \vskip 1.0em \@plus\p@
        \if@isKorean                     % <-- 변경 부분
            \setlength\@tempdima{5.0em} % korean  옵션일 때는 5.0em
        \else
            \setlength\@tempdima{1.5em} % english 옵션일 때는 1.5em
        \fi
        \begingroup
            \parindent \z@ \rightskip \@pnumwidth
            \parfillskip -\@pnumwidth
            \leavevmode \large \sffamily \bfseries
            \advance\leftskip\@tempdima
            \hskip -\leftskip
            #1\nobreak\hfil \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
            \penalty\@highpenalty
        \endgroup
    \fi}

  
\if@isKorean % 한글이면 각종 치수를 변경
    \renewcommand*\l@section{\@dottedtocline{1}{2.7em}{2.3em}}
    \renewcommand*\l@subsection{\@dottedtocline{2}{5.0em}{3.2em}}
    \renewcommand*\l@subsubsection{\@dottedtocline{3}{8.2em}{4.1em}}
    \renewcommand*\l@paragraph{\@dottedtocline{4}{11.2em}{5em}}
    \renewcommand*\l@subparagraph{\@dottedtocline{5}{13.2em}{6em}}
\else \fi     % 영문이면 가만히 내버려둠

%%
%% thebibliography 환경 재정의 - report 클래스로부터 복사하여 일부 수정
%%
\renewenvironment{thebibliography}[1]{%
    \chapter{\bibname}%
    \@mkboth{\MakeUppercase\bibname}{\MakeUppercase\bibname}%
%    \if@PDFdoc\phantomsection\fi\addcontentsline{toc}{chapter}{\bibname}%
    \list{\@biblabel{\@arabic\c@enumiv}}%
        {\settowidth\labelwidth{\@biblabel{#1}}%
         \leftmargin\labelwidth
         \advance\leftmargin\labelsep
         \@openbib@code
         \usecounter{enumiv}%
         \let\p@enumiv\@empty
         \renewcommand\theenumiv{\@arabic\c@enumiv}}%
    \sloppy
    \clubpenalty4000
    \@clubpenalty \clubpenalty
    \widowpenalty4000%
    \sfcode`\.\@m%
}{  \label{paperlastpagelabel}     % <-- 추가 부분: 마지막 페이지 위치 지정
    \def\@noitemerr{\@latex@warning{Empty `thebibliography' environment}}%
    \endlist
}

\newenvironment{thebibliographykor}[1]{%
    \chapter{참고문헌}%
    \@mkboth{\MakeUppercase\bibname}{\MakeUppercase\bibname}%
%    \if@PDFdoc\phantomsection\fi\addcontentsline{toc}{chapter}{\bibname}%
    \list{\@biblabel{\@arabic\c@enumiv}}%
        {\settowidth\labelwidth{\@biblabel{#1}}%
         \leftmargin\labelwidth
         \advance\leftmargin\labelsep
         \@openbib@code
         \usecounter{enumiv}%
         \let\p@enumiv\@empty
         \renewcommand\theenumiv{\@arabic\c@enumiv}}%
    \sloppy
    \clubpenalty4000
    \@clubpenalty \clubpenalty
    \widowpenalty4000%
    \sfcode`\.\@m%
}{  \label{paperlastpagelabel}     % <-- 추가 부분: 마지막 페이지 위치 지정
    \def\@noitemerr{\@latex@warning{Empty `thebibliographykor' environment}}%
    \endlist
}

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
