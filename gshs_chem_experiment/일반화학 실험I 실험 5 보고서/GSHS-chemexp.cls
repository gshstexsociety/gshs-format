\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{GSHS-chemexp}[2016/01/18 v.0.91]
\LoadClass[a4paper,10pt]{article}
%화실 보고서는 비교적 짧은 분량이므로 article을 사용.
%한규일 선생님 기준으로, 선생님은 A4에 2면을 인쇄하시므로 a4 단면 옵션으로 지정.

\usepackage{indentfirst}
\setlength\parindent{1.0em}
%\RequirePackage{ifthen}
%\RequirePackage{tabu}

\usepackage[left=25mm,right=25mm,top=30mm,bottom=30mm]{geometry}
%margin은 수정 가능.

\usepackage[version=4]{mhchem}
\usepackage{tikz}
\mhchemoptions{arrows=pgf}
%화실 보고서이므로, 화학식 관련 기능을 쓰기 위한 패키지입니다.
%mhcemoptions는 화살표 모양 때문에. 지워도 상관 없습니다.

\usepackage[justification=centering,labelsep=period]{caption}
%캡션을 두 줄 이상 쓸 때도 가운데로 위치하도록.
%화실 보고서에서 그림이나 표에 캡션 달 때 말이 길어지는 경우가 많습니다.
%번호 뒤 구분자가 쌍점이 아닌 온점으로 찍히도록 하였습니다.

\usepackage[nonfrench,hangul]{kotex}
\usepackage{dhucs-setspace}
\SetHangulspace{1.5}{1.2}
\usepackage[ensec]{dhucs-sectsty}
%nonfrench 옵션은 빼도 좋습니다.(문장 끝 여백을 늘려주는 옵션)
%화실 보고서를 영어로 쓰려는 사람은 없겠지. 한글 사용 옵션입니다.
%hangul 옵션을 쓰면 제 #절이 달리기 때문에 ensec 옵션 사용.

\usepackage{amsmath}
\usepackage{graphicx,xcolor}
\makeatletter
\g@addto@macro\normalsize{%
	\setlength\abovedisplayskip{0.25em}
	\setlength\belowdisplayskip{0.25em}
	\setlength\abovedisplayshortskip{0.25em}
	\setlength\belowdisplayshortskip{0.25em}
}
\makeatother
%수식을 사용하기 위한 옵션입니다.
%display형 수식의 위아래 옵션이 분수식이 아닐 때는 너무 커,
%위·아래 여백을 조정했습니다.

%% 편집 용지 설정

\usepackage{amssymb}
\usepackage{setspace}
\usepackage{ulem}

\usepackage{dcolumn}
%소숫점 정렬을 위한 패키지입니다.

\usepackage{siunitx}
\sisetup{inter-unit-product = \ensuremath{ { } \cdot { } } }
\sisetup{range-phrase={ - }}
\sisetup{separate-uncertainty = true}
\DeclareSIUnit\atmosphere{atm}
\DeclareSIUnit\Molar{\textsc{m}}
\DeclareSIUnit\molar{\mole\per\litre}
\DeclareSIUnit\gramforce{gf}
%단위 표시를 위한 패키지입니다.
%단위와 단위 사이에 가운뎃점이 들어가도록 하였습니다.
%불확정도 표기 시 +- 기호가 표시되도록 하였습니다.
%범위 표시를 할 때 to 대신 하이픈으로 표시되도록 하였습니다.
%atm, 몰 농도 등의 단위를 정의하였습니다.
%만약 대문자 L로 리터를 표시하고 싶다면 liter를 사용하면 됩니다.

%\usepackage[shortlabels]{enumitem}
%\setlist[enumerate, 1]{1)}
\usepackage{dhucs-enumitem}
\setenumerate[1]{label={\onum*},noitemsep}
\setenumerate[2]{label={\pnum*},nolistsep}
%원 문자로 numerate를 표시하기 위한 옵션입니다.
%원 문자는 15 개를 넘는 item을 표시하지 못합니다.
%부득이하게 item의 개수가 15개가 넘어간다면
%원 문자를 쓰지 말고 아래 세 줄을 비활성화시킨 뒤
%위 두 줄을 활성화시켜 괄호 문자로 대체하여 쓰시기 바랍니다.

\usepackage{hhline}
%표에서 이중 선을 그을 때, 세로선을 겹쳐 그리기 위해 쓰입니다.

\renewcommand\thesection{\Roman{section}}
\renewcommand\thesubsection{\arabic{section}.\arabic{subsection}}
\usepackage{chngcntr}
\renewcommand\thesubsubsection{\arabic{section}.\arabic{subsection}.\arabic{subsubsection}}
\renewcommand\theparagraph{\arabic{section}.\arabic{subsection}.\arabic{subsubsection}.\arabic{paragraph}}
\renewcommand\thesubparagraph{\arabic{section}.\arabic{subsection}.\arabic{subsubsection}.\arabic{paragraph}.\arabic{subparagraph}}
\setcounter{secnumdepth}{5}  
%한규일 선생님 양식은 최상위 번호가 로마 숫자로 쓰여 있습니다.
%하지만 아래 번호까지 로마 숫자로 부여할 필요가 없으므로,
%section만 로마 숫자로, 나머지는 아라비아 숫자로 표기하기 위한 옵션입니다.
%subparagraph까지 번호가 표시되도록 하였습니다.

\usepackage{etoolbox}
\patchcmd{\thebibliography}{\section*}{\section}{}{}
%참고 문헌을 하나의 section으로 편입시키기 위한 옵션입니다.


\makeatletter
\renewcommand{\date}[1]{
	\renewcommand{\@date}{#1}
}

\newcommand{\coauthor}[1]{
	\newcommand{\@coauthor}{#1}
}

\renewcommand{\maketitle}{
	\newpage
	\begin{center}%
		{\LARGE \@title \par}%
	\end{center}
		\vskip 0.5em%
	\hspace{0.5\textwidth}{\normalsize
		\begin{tabular}[t]{r@{ }l}
		실험 \space\space 일자 : & \@date \\
		공동실험자 : & \@coauthor \\
		제 \space\space 출 \space\space 자 : & \@author
		\end{tabular}
	}
}
\makeatother
%이상 제목을 만들기 위한 옵션입니다.
%현재 공동실험자가 많으면 글이 margin 밖으로 나갈 수 있는 문제가 있습니다.

\setlist{nosep}
%item 사이 간격을 없애는 옵션입니다.

\setlist[itemize]{leftmargin=*}
\setlist[enumerate]{leftmargin=*}

\usepackage{multirow}
%표에서 칸을 합치기 위한 패키지입니다.

\setlength{\intextsep}{0.75em plus 0.075em minus 0.15em}
%텍스트와 floating 개체들 간 간격을 줄이기 위한 옵션입니다.

\addtolength\abovecaptionskip{-.5em}
\addtolength\belowcaptionskip{-1em}
%caption과 이후 text 간 간격이 너무 커 좁혔습니다.

\makeatletter
\newcommand{\thickhline}{%
	\noalign {\ifnum 0=`}\fi \hrule height 0.5mm
	\futurelet \reserved@a \@xhline
}
\makeatother
%굵은 선을 나타내기 위하여 \thickhline을 설정하였습니다.

\usepackage{titlesec}
\titleformat{\paragraph}
{\normalfont\normalsize\bfseries}{\theparagraph}{1em}{}
\titleformat{\subparagraph}
{\normalfont\normalsize\bfseries}{\thesubparagraph}{1em}{}
\titlespacing*{\section} {0pt}{3.5ex plus 1ex minus .2ex}{0ex}
\titlespacing*{\subsection} {0pt}{3.25ex plus 1ex minus .2ex}{0ex}
\titlespacing*{\subsubsection}{0pt}{3.25ex plus 1ex minus .2ex}{0ex}
\titlespacing*{\paragraph} {0pt}{3.25ex plus 1ex minus .2ex}{0ex}
\titlespacing*{\subparagraph} {0pt}{3.25ex plus 1ex minus .2ex}{0ex}
%paragraph와 subparagraph의 형식을 section과 같게 하고,
%문단 제목 아래 공백을 없앴습니다.
\titlelabel{\thetitle.\quad}
%문단 번호 자체에는 점을 없애고, 표시될 때에 나타나게 하였습니다.
%(refer를 위하여)

\usepackage{lipsum}
\let\OLDthebibliography\thebibliography
\renewcommand\thebibliography[1]{
	\OLDthebibliography{#1}
	\setlength{\parskip}{0pt}
	\setlength{\itemsep}{0pt}
}
%참고 문헌의 줄 간격을 줄이기 위한 옵션입니다.

\usepackage{float}
%떠다니는 개체의 H 옵션을 지정하기 위한 옵션입니다.

\usepackage{makecell}