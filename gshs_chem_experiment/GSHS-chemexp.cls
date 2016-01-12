\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{GSHS-chemexp}[2016/01/12 v.0.9]
\LoadClass[a4paper,10pt]{article}
%화실 보고서는 비교적 짧은 분량이므로 article을 사용.
%한규일 선생님 기준으로, 선생님은 A4에 2면을 인쇄하시므로 a4 단면 옵션으로 지정.

\usepackage{indentfirst}
\setlength\parindent{1.0em}
\RequirePackage{ifthen}
\RequirePackage{tabu}
\linespread{1.5}

\usepackage[left=25mm,right=25mm,top=30mm,bottom=30mm]{geometry}
%margin은 수정 가능.

\usepackage{chemstyle}
\usepackage[version=4]{mhchem}
\usepackage{tikz}
\mhchemoptions{arrows=pgf}
%화실 보고서이므로, 화학식 관련 기능을 쓰기 위한 패키지입니다.
%mhcemoptions는 화살표 모양 때문에. 지워도 상관 없습니다.

\usepackage[justification=centering]{caption}
%캡션을 두 줄 이상 쓸 때도 가운데로 위치하도록.
%화실 보고서에서 그림이나 표에 캡션 달 때 말이 길어지는 경우가 많습니다.

\RequirePackage[nonfrench,hangul]{kotex}
\usepackage[ensec]{dhucs-sectsty}
%nonfrench 옵션은 빼도 좋습니다.(문장 끝 여백을 늘려주는 옵션)
%화실 보고서를 영어로 쓰려는 사람은 없겠지. 한글 사용 옵션입니다.
%hangul 옵션을 쓰면 제 #절이 달리기 때문에 ensec 옵션 사용.

\RequirePackage{amsmath}
\RequirePackage{graphicx,xcolor}
\makeatletter
\g@addto@macro\normalsize{%
	\setlength\abovedisplayskip{0.25em}
	\setlength\belowdisplayskip{0.25em}
	\setlength\abovedisplayshortskip{0em}
	\setlength\belowdisplayshortskip{0em}
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
\DeclareSIUnit\atmosphere{atm}
\DeclareSIUnit\Molar{\textsc{m}}
\DeclareSIUnit\molar{\mole\per\litre}
%단위 표시를 위한 패키지입니다.
%단위와 단위 사이에 가운뎃점이 들어가도록 하였습니다.
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
%표에서 이중 선을 그을 때 쓰입니다.
%본 양식에서는 사용하지 않았습니다.

\usepackage[labelsep=period]{caption}
%캡션 숫자 뒤의 점을 온점으로 찍기 위한 옵션입니다. 지우시면 쌍점이 됩니다.

%\usepackage{titling}
%\setlength{\droptitle}{-4em}
%title 앞의 여백을 줄이기 위한 옵션입니다.

\renewcommand\thesection{\Roman{section}.}
\renewcommand\thesubsection{\arabic{section}.\arabic{subsection}.}
\usepackage{chngcntr}
\renewcommand\thesubsubsection{
	\arabic{section}.\arabic{subsection}.\arabic{subsubsection}.
}
%한규일 선생님 양식은 최상위 번호가 로마 숫자로 쓰여 있습니다.
%하지만 아래 번호까지 로마 숫자로 부여할 필요가 없으므로,
%section만 로마 숫자로, 나머지는 아라비아 숫자로 표기하기 위한 옵션입니다.

\usepackage{etoolbox}
\patchcmd{\thebibliography}{\section*}{\section}{}{}
%참고 문헌을 하나의 section으로 편입시키기 위한 옵션입니다.

%\newcommand{\@coauthor}[1] {#1}


\makeatletter

\@onlypreamble{\title}
\renewcommand{\date}[1]{
	\renewcommand{\@date}{#1}
}
\@onlypreamble{\date}
\@onlypreamble{\author}

\newcommand{\coauthor}[1]{
	\newcommand{\@coauthor}{#1}
}
\@onlypreamble{\coauthor}

\renewcommand{\maketitle}{
	\newpage
	\begin{center}%
		{\LARGE \@title \par}%
	\end{center}
		\vskip 1em%
	\hspace{0.5\textwidth}{\large
		\begin{tabular}[t]{r@{ }l}
		실험 \space\space 일자 : & \@date \\
		제 \space\space 출 \space\space 자 : & \@author \\
		공동실험자 : & \@coauthor
		\end{tabular}
	}
}
\makeatother

\usepackage{float}