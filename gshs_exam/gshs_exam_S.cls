%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% This LaTeX document class is written for
%%   exams of Gyeonggi Science High School for the gifted
%%
%% 
%%                                  Ver. 201804A
%%                                  2018-04-23
%%                                  Chinook Mok
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\ProvidesClass{gshs_exam_S}
%\LoadClass[pdftex, b4size, oneside, 11pt, twocolumn]{exam}
\LoadClass[11pt]{exam}






% 글꼴 설정(1)
\usepackage{mathptmx}      % To use Times New Roman
\RequirePackage{xetexko}
\setmainfont[Ligatures=TeX]{Times New Roman}
\setmainhangulfont[BoldFont=*,BoldFeatures=FakeBold,%
	ItalicFont=*,ItalicFeatures=FakeSlant]{HY신명조}
%\setmainhangulfont{HY신명조}
\setsanshangulfont{맑은 고딕}
\disablecjksymbolspacing
\nonfrenchspacing





\usepackage{lmodern}   % Font size adjustment
\usepackage{enumitem} % To remove the hanging indentation.

\usepackage{tikz}
\usepackage{graphicx} % In order to use `scalebox' - narrow text

%%% following packages are optional %%%
\usepackage{amssymb}
\usepackage{amsmath}
\usepackage{amsthm} 
\usepackage[makeroom]{cancel} %To use cancelto of terms in equation
\usepackage{graphics}
\usepackage[export]{adjustbox}

%%%%%%%%%% page setting %%%%%%%%%%%
\usepackage[
paperheight=364mm,
paperwidth=257mm,
left=18mm,
right=18mm,
top=23mm,
bottom=25mm,
headheight=8mm,
headsep=2mm,
footskip=5mm,
text={221mm,316mm},
includefoot]{geometry}

\usepackage{multicol}
\setlength{\columnseprule}{0.12mm}
\setlength{\columnsep}{8mm}



%%%%%%%% First page setting %%%%%%%%%
\def\myyear#1{\gdef\@myyear{#1}}
\def\semester#1{\gdef\@semester{#1}}
\def\exams#1{\gdef\@exams{#1}}
\def\subject#1{\gdef\@subject{#1}}
\def\credits#1{\gdef\@credits{#1}}
\def\pfscore#1{\gdef\@pfscore{#1}}
\def\examtime#1{\gdef\@examtime{#1}}
\def\examiner#1{\gdef\@examiner{#1}}
\def\reviewer#1{\gdef\@reviewer{#1}}

%%%% Title Table %%%%%
\usepackage{multirow}
\usepackage{array}
\newcolumntype{L}[1]{>{\raggedright\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\newcolumntype{C}[1]{>{\centering\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\newcolumntype{R}[1]{>{\raggedleft\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\newcolumntype{?}{!{\vrule width 0.4mm}}
\usepackage{bigstrut}
\usepackage{booktabs}

\setlength{\tabcolsep}{0mm}
\renewcommand{\arraystretch}{0.8}
\renewcommand{\maketitle}{
\begin{table*}[!h]
\begin{minipage}{\textwidth}
\centering
\begin{tikzpicture}
\draw[line width=0.4mm] (0,0) rectangle (22.08,2.668); % Border line
\node at ({8.67*0.5},2.1) {\fontsize{14pt}{14pt}\selectfont\sffamily\bfseries\@myyear학년도 제\@semester학기 \@exams};
\node at ({8.67*0.5},1.3) {\fontsize{14pt}{14pt}\selectfont\sffamily\bfseries[ {\@subject} ]과 \hspace{1em} (\@examtime)};
\draw[line width=0.12mm] (0,0) rectangle ({8.668*0.25},0.84) node[pos=0.5] {\fontsize{12pt}{14pt}\selectfont\sffamily\bfseries 학 점};
\draw[line width=0.12mm] ({8.668*0.25},0) rectangle ({8.668*0.5},0.84) node[pos=0.5] {\fontsize{12pt}{14pt}\selectfont\sffamily\bfseries\@credits};
\draw[line width=0.12mm] ({8.668*0.5},0) rectangle ({8.668*0.75},0.84) node[pos=0.5] {\fontsize{12pt}{14pt}\selectfont\sffamily\bfseries 과목 총첨};
\draw[line width=0.12mm] ({8.668*0.75},0) rectangle (8.668,0.84) node[pos=0.5] {\fontsize{12pt}{14pt}\selectfont\sffamily\bfseries\@pfscore};
\draw[line width=0.4mm] (8.668,0) -- ++(0,2.668); % vertical line 1
\draw[line width=0.12mm] (8.668,1.334) rectangle (9.38,2.668) node[pos=0.5,text width=0.5cm,align=center]{\sffamily\bfseries 출제};
\draw[line width=0.12mm] (8.668,0) rectangle (9.38,1.334) node[pos=0.5,text width=0.5cm,align=center]{\sffamily\bfseries 검토};
\draw[line width=0.4mm] (9.38,0) -- ++(0,2.668); % vertical ine 2
\draw[line width=0.12mm] (9.38,1.334) rectangle (12.06,2.668) node[pos=0.5] {\sffamily\bfseries\@examiner\hspace{0.5em}(인)};
\draw[line width=0.12mm] (9.38,0) rectangle (12.06,1.334) node[pos=0.5]{\sffamily\bfseries\@reviewer\hspace{0.5em}(인)};
\draw[line width=0.4mm] (12.06,0) -- ++(0,2.668); % vertical line 3
\node at (12.44,{0.75*2.668}) {\sffamily\bfseries 결};
\node at (12.44,{0.25*2.668}) {\sffamily\bfseries 재};
\draw[line width=0.4mm] (12.82,0) -- ++(0,2.668); % vertical line 4
\draw[line width=0.12mm] (12.82,1.645) rectangle (14.672,2.668) node[pos=0.5]{\sffamily\bfseries 교과부장};
\draw[line width=0.12mm] (14.672,0) -- ++(0,2.668); % vertical line 5
\draw[line width=0.12mm] (14.672,1.645) rectangle (16.524,2.668) node[pos=0.5] {\sffamily\bfseries 계};
\draw[line width=0.12mm] (16.524,0) -- ++(0,2.668); % vertical line 6
\draw[line width=0.12mm] (16.524,1.645) rectangle (18.376,2.668);% node[pos=0.5,text width=1.8cm,align=center]{\sffamily\bfseries 교육과정 부장};
\node[below] at ({(16.524+18.376)/2},2.668) {\sffamily\bfseries 교육과정};
\node[above] at ({(16.524+18.376)/2},1.645) {\sffamily\bfseries 부장};
\draw[line width=0.12mm] (18.376,0) -- ++(0,2.668); % vertical line 7
\draw[line width=0.12mm] (18.376,1.645) rectangle (20.228,2.668) node[pos=0.5]{\sffamily\bfseries 교\hspace{0.5em}감};
\draw[line width=0.12mm] (20.228,0) -- ++(0,2.668); % vertical line 8
\draw[line width=0.12mm] (20.228,1.645) rectangle (22.08,2.668) node[pos=0.5]{\sffamily\bfseries 교\hspace{0.5em}장};
\end{tikzpicture}
\end{minipage}
\end{table*}
\vspace*{-15pt}
}



%%%%%%%%% Header & Footer setting %%%%
\usepackage{etoolbox}

\newcommand{\ExamFooter}{
\begin{tikzpicture}\sffamily
\node[right] at (0.5,0.9) {과학영재 경기과학고등학교};
\node[] at (10.2,0.9) {({\Subject})과 ( {\numpages} )면 중 ( {\thepage} )면};
\node[left] at (20.5,0.9) {\MyYear학년도 \Semester학기 \Exams};
\node[anchor=south west] at (0,0) {\fontsize{8pt}{10pt}\selectfont\sffamily\scalebox{0.95}[1.0]{ 이 시험문제의 저작권은 경기과학고등학교에 있습니다. 저작권법에 의해 보호받는 저작물이므로 전제와 복제는 금지되며, 이를 어길시 저작권법에 의거 처벌될 수 있습니다.}};
\draw (21,0) rectangle (22,1.2);
\draw (21,0.9) -- (22,0.9) node[pos=0.5,above=-0.1cm] {\fontsize{6pt}{6pt}\selectfont\textrm{확인}};
\end{tikzpicture}
}

\makeatletter
\patchcmd{\@fullhead}{\hrule}{\hrule\vskip0.5mm\hrule}{}{}
\patchcmd{\run@fullhead}{\hrule}{\hrule\vskip0.5mm\hrule}{}{}
\patchcmd{\@fullfoot}{\hrule}{\hrule\vskip0.5mm\hrule}{}{}
\patchcmd{\run@fullfoot}{\hrule}{\hrule\vskip0.5mm\hrule}{}{}
\makeatother

\pagestyle{headandfoot}
\runningheadrule
\firstpageheadrule
\runningfootrule
\firstpagefootrule
\firstpageheader{}{}{}
\runningheader{}{}{}
%\firstpagefooter{{\sffamily 과학영재 경기과학고등학교}\\[0.3em] \fbox{\fontsize{8pt}{10pt}\selectfont\sffamily 이 시험문제의 저작권은 경기과학고등학교에 있습니다. 저작권법에 의해 보호받는 저작물이므로 전제와 복제는 금지되며, 이를 어길시 저작권법에 의거 처벌될 수 있습니다.}}{\sffamily({\Subject})과 ( {\numpages} )면 중 ( {\thepage} )면}{\sffamily\MyYear학년도 \Semester학기 \Exams}
%\runningfooter{{\sffamily 과학영재 경기과학고등학교}\\[0.3em] \fbox{\fontsize{8pt}{10pt}\selectfont\sffamily 이 시험문제의 저작권은 경기과학고등학교에 있습니다. 저작권법에 의해 보호받는 저작물이므로 전제와 복제는 금지되며, 이를 어길시 저작권법에 의거 처벌될 수 있습니다.}}{\sffamily({\Subject})과 ( {\numpages} )면 중 ( {\thepage} )면}{\sffamily\MyYear학년도 \Semester학기 \Exams}
\firstpagefooter{\ExamFooter}{}{}
\runningfooter{\ExamFooter}{}{}


%%%%%%%%%%% Points Setting %%%%%%%%%%
\pointname{점}
\marginpointname{점}
\totalformat{[총 \totalpoints점]}


%%%%%%%%%% 단답형, 서술형, 논술형 %%%%%%%%%
\def\ddh{\textbf{[단답형]}}
\def\ssh{\textbf{[서술형]}}
\def\nsh{\textbf{[논술형]}}


%\qformat{\thequestion. \parbox[t]{\textwidth}{\thequestiontitle\hfill(\thepoints)}\hfill}

\renewcommand{\questionlabel}{\textbf{\thequestion.}}
\renewcommand\partlabel{(\arabic{partno})}


\renewcommand{\partshook}{%
  \setlength{\leftmargin}{-5mm}%
  \setlength{\labelsep}{4pt}
  \setlength{\labelwidth}{0cm}%
  \def\makelabel##1{##1}%
}

\bracketedpoints
\pointsdroppedatright

%%%%%%%%%%%%%%% Parts Setting %%%%%%%%%%%%%%%%
\renewcommand{\partshook}{
\setlength{\leftmargin}{0em}
}