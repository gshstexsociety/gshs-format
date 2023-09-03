% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
% % % LaTeX document class for the Humantech Paper Award  % % %
% % % First edition 2022.11.05 by Junseok Lee % % % % % % % % %
% % % Copyright (C) 2022-present GSHS TeX Society % % % % % % %
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{humantech}[The Humantech Paper Award LaTeX Class, made by Lee Junseok (2022)]
\LoadClass[10pt, twoside, twocolumn]{article}
\RequirePackage[a4paper, left=1.5cm, right=1.5cm, top=3cm, bottom=2.5cm]{geometry}

\newif\if@kor
\@kortrue

% Define options for language settings
\DeclareOption{eng}{\@korfalse}
\DeclareOption{kor}{\@kortrue}

\ProcessOptions\relax

\def\turn#1{\gdef\@turn{#1}}

\usepackage{amsmath}			% Use \text command in math mode
\usepackage[hidelinks]{hyperref}

\usepackage[dvipsnames]{xcolor}	% To color text gray
\RequirePackage{fontspec}		% To use BatangChe and Times New Roman Font
\RequirePackage{kotex}			% To use Korean 
%\XeTeXlinebreakpenalty=10000	% Disable line breaking
%\hyphenpenalty=10000			% Disable hyphenization
%\exhyphenpenalty=10000			% Disable hyphenization

%\RequirePackage{csquotes}
%\MakeOuterQuote{"}				% Define active quotes

\RequirePackage{setspace}
\linespread{1.08}				% Line spacing 1.08

\RequirePackage{tabularx}
\RequirePackage{multicol}
\RequirePackage{indentfirst}

%% Fonts setting - Korean: BatangChe, English: Times New Roman %%
\newhangulfontfamily{\batangche}{BatangChe}[AutoFakeBold=3]
\setmainfont{Times New Roman}[Ligatures=TeX]
\if@kor
\setmainhangulfont{BatangChe}[AutoFakeBold=3]
\xetexkofontregime{latin}[alphs=latin, puncts=prevfont, colons=prevfont, hyphens=prevfont, parens=latin, cjksymbols=hangul]
\disablecjksymbolspacing
\nonfrenchspacing
\else
\fi

%% Section Title Setting %%
\RequirePackage{titlesec}
\titleformat{\section}[block]{\normalfont\fontsize{11}{11}\selectfont\bfseries}{\batangche\thesection.}{0.5em}{}
\titlespacing*{\section}{0pt}{2.5ex plus .5ex minus .3ex}{2ex plus .3ex}
\titleformat{\subsection}[block]{\normalfont\fontsize{10}{10}\selectfont}{\batangche\thesubsection.}{0.5em}{}
\titlespacing*{\subsection}{0pt}{2ex plus .3ex minus .3ex}{0.8ex plus .3ex}

\RequirePackage{graphicx}
\graphicspath{ {./images/} }

%\RequirePackage{float}			% For floating figure inside multicol
% article의 twocolumn 옵션을 사용함에 따라 floating figure로 설정하지 않아도 됨.
\RequirePackage{caption}		% Customizing caption
\captionsetup{
	justification=raggedright,
	singlelinecheck=false,
	labelsep=period,
	labelfont=bf,
	textfont=bf
}
\renewcommand{\figurename}{Fig}
\def\fps@figure{htbp}
\def\fps@table{htbp}
%\floatplacement{figure}{H}
%\floatplacement{table}{H}

%% Page and Margin Settings %%
\setlength{\columnsep}{2em}
\setlength{\parindent}{11pt}
\setlength{\parskip}{0.2\baselineskip plus 0.1\baselineskip minus 0.1\baselineskip}
\setlength{\tabcolsep}{0.5em}
\setlength{\textfloatsep}{1.2\baselineskip plus 0.2\baselineskip minus 0.4\baselineskip}
\setlength{\intextsep}{0.7\baselineskip plus 0.1\baselineskip minus 0.1\baselineskip}
\setlength{\floatsep}{0.7\baselineskip plus 0.1\baselineskip minus 0.1\baselineskip}

%% Header & Footer setting %%
\RequirePackage{fancyhdr}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}

\fancypagestyle{title}{%
	\setlength{\topmargin}{-14pt}
	\setlength{\headsep}{15pt}
	\fancyhf{}
	\fancyhead[L]{\fontsize{12}{12}\selectfont\textbf{\color{gray} \@turn$^\text{th}$ Humantech Paper Award}}
	\fancyfoot[R]{\fontsize{8}{8}\selectfont\color{gray}\thepage}
	\fancyfoot[L]{\batangche\fontsize{8}{8}\selectfont\color{gray}
		\begin{tabular}[t]{l}
			본 논문에 포함된 정보의 전부 또는 일부를 무단으로 제3자에게 공개, 배포, 복사 또는 사용하는 것을 엄격히 금지합니다.\\
			본 논문의 모든 저작권은 저자에게 있습니다.
		\end{tabular}
	}
}
\setlength{\topmargin}{-17pt}
\setlength{\headsep}{18pt}
\pagestyle{fancy}
\fancyhf{}
\fancyhead[LE,RO]{\fontsize{9}{9}\selectfont\color{gray} \@turn$^\text{th}$ Humantech Paper Award}
\fancyfoot[LE,RO]{\fontsize{8}{8}\selectfont\color{gray}\thepage}
\fancyfoot[RE,LO]{\batangche\fontsize{8}{8}\selectfont\color{gray}
	\begin{tabular}[t]{l}
		본 논문에 포함된 정보의 전부 또는 일부를 무단으로 제3자에게 공개, 배포, 복사 또는 사용하는 것을 엄격히 금지합니다.\\
		본 논문의 모든 저작권은 저자에게 있습니다.
	\end{tabular}
}

%% Title Setting %%
\makeatletter
\renewcommand{\maketitle}{%
	\noindent\begin{tabularx}{\textwidth}{@{\hspace{3pt}}X@{\hspace{3pt}}}
	\rule{0pt}{4.6ex}\textbf{\fontsize{20}{25}\selectfont\@title}\vspace{30pt}\end{tabularx}\\\thispagestyle{title}}
\makeatother

%% Abstract Setting %%
\renewenvironment{abstract}%
	{\noindent\tabularx{\textwidth}{@{\hspace{3pt}}X@{\hspace{3pt}}}%
	\raggedright%
	\if@kor
	\frenchspacing%
	\setmainhangulfont{BatangChe}[AutoFakeBold=3]%
	\xetexkofontregime{hangul}[alphs=hangul, puncts=hangul, colons=hangul, hyphens=hangul, parens=latin, cjksymbols=hangul]%
	\else
	\setmainfont{Times New Roman}[Ligatures=TeX]
	\fi
	\bfseries\rule{0pt}{11pt}(Abstract)}%
	{\\\endtabularx\smallskip %
	\\}

\RequirePackage{cite}
\renewcommand{\url}[1]{\href{#1}{#1}}

\renewcommand\refname{참고문헌}
