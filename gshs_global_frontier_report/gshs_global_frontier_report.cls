% % % % % % % % % % % % % % % % % % % % % % % % % % % % %
% % % LaTeX document class for the GSHS RnE Report  % % %
% % % First version 2022.11.05 by Junseok Lee % % % % % %
% % % Version 1.1 released on 2023.06.12. % % % % % % % %
% % % Updated to Global Frontier Report by Seungchan Park on 2024.07.24 % % % % % % %
% % % Copyright (C) 2022-present GSHS TeX Society % % % %
% % % % % % % % % % % % % % % % % % % % % % % % % % % % %

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{gshs_global_frontier_report}[2024/06/01 GSHS Global Frontier Report Class]
\LoadClass[11pt]{article}

\RequirePackage[a4paper, left=25mm, right=25mm, top=30mm, bottom=30mm]{geometry}
\RequirePackage{setspace}
\linespread{1.6} % 줄간격 160%
\RequirePackage{fontspec}
\RequirePackage{kotex}
\setmainfont{Times New Roman}[Ligatures=TeX]

\RequirePackage{hyperref}


%%%%%%%%%
% Fonts %
%%%%%%%%%

\newif\if@overleaf
\@overleaffalse
\DeclareOption{overleaf}{\@overleaftrue}
\ProcessOptions\relax
\if@overleaf
  \setmainhangulfont{HANBatang}[Extension=.ttf, Path=./fonts/, BoldFont=*B, WordSpace={1.2,0.1,0.1}]
  \newfontfamily{\batang}{HANBatang}[Extension=.ttf, Path=./fonts/, BoldFont=*B, WordSpace={1.2,0.1,0.1}]
  \newhangulfontfamily{\hbatang}{HANBatang}[Extension=.ttf, Path=./fonts/, BoldFont=*B, WordSpace={1.2,0.1,0.1}]
\else
  \setmainhangulfont{HCR Batang}[WordSpace={1.2,0.1,0.1}]
  \newfontfamily{\batang}{HCR Batang}[WordSpace={1.2,0.1,0.1}]
  \newhangulfontfamily{\hbatang}{HCR Batang}[WordSpace={1.2,0.1,0.1}]
\fi

\renewcommand{\thesection}{\Roman{section}}
\renewcommand{\thefootnote}{\fnsymbol{footnote}}

\DeclareRobustCommand*{\title}[1]{\gdef\@title{#1}}
\DeclareRobustCommand*{\engtitle}[1]{\gdef\@engtitle{#1}}
\DeclareRobustCommand*{\advisor}[1]{\gdef\@advisor{#1}}
\DeclareRobustCommand*{\advisorEmail}[1]{\gdef\@advisorEmail{#1}}
\DeclareRobustCommand*{\researchtype}[1]{\gdef\@researchtype{#1}}
\DeclareRobustCommand*{\papertype}[1]{\gdef\@papertype{#1}}
\title{}
\engtitle{}

\RequirePackage{listofitems}
\RequirePackage{etoolbox}

\BeforeBeginEnvironment{equation}{\linespread{0.7}}
\AfterEndEnvironment{equation}{\linespread{1.6}\vspace*{0.3\baselineskip}\noindent}

\providecommand*\setfloatlocations[2]{\@namedef{fps@#1}{#2}}
\setfloatlocations{figure}{htbp}
\setfloatlocations{table}{htbp}

\renewcommand{\date}[1]{
	\setsepchar{.}
	\readlist\temp{#1}
	\newcommand{\@year}{\temp[1]}
	\newcommand{\@month}{\temp[2]}
	\newcommand{\@day}{\temp[3]}		
}


\ExplSyntaxOn

\NewDocumentCommand \printauthor { m }
  {
  	\cs_generate_variant:Nn \fn_printauthor:n { V }
		\fn_printauthor:V { #1 }
  }

\cs_new_protected:Nn \fn_printauthor:n
	{
		\batang \hbatang
		\textbf{연구~참여자:~}
		\tl_set:Nn \l_tmpa_tl {#1}
	  \regex_replace_all:nnN { \s } { } \l_tmpa_tl
	  \regex_replace_all:nnN {(\d*)(.*?),(.*?);} { \c{textbf}\cB{ \1\~\2\c{nobreak}\c{hspace}\cB{ 0pt \cE}(\c{texttt} \cB{ \c{href} \cB{ mailto:\3 \cE} \cB{ \3 \cE} \cE})\ \cE} } \l_tmpa_tl
		\tl_use:N \l_tmpa_tl
	}

\cs_new_protected:Nn \fn_ifnotext:n
	{
		\str_set:Nn \l_tmpa_str {#1}
		\str_if_empty:NTF \l_tmpa_str {  }
	}

\NewDocumentCommand \printtitle { m m O{0pc} }
	{
		\str_if_empty:NTF{#1}{%
      \str_if_empty:NTF{#2}{}{\fontsize{18}{18}\selectfont\bfseries #2}
    }{%
      \fontsize{18}{18}\selectfont\bfseries #1\\[#3]
      \str_if_empty:NTF{#2}{}{\fontsize{14}{14}\selectfont\bfseries #2}
    }
	}
\ExplSyntaxOff

\newcommand{\ifnotext}[3]{%
	\sbox0{#1}%
	\ifdim\wd0=0pt{#2}\else{#3}\fi
}

\newcommand{\makecover}{%
	\pagestyle{empty}
	\noindent{\@year학년도 1학기\\
	현장연구 결과보고서}
	\vskip 5pc
	\vspace*{\stretch{1}}
	\begin{center}
		\printtitle{\@title}
	\end{center}
	\vskip 2pc
	\vspace*{\stretch{1}}
	\begin{center}
		\batang\bfseries \@year.\:\@month.\:\@day.
	\end{center}
	\vspace*{\stretch{1}}
	\begin{center}
		\begin{minipage}{0.85\textwidth}
                \begin{center}
    			\printauthor{\@author}
                \end{center}
		\end{minipage}
	\end{center}
	\vskip 2pc
	\vskip 5pc
	\begin{center}
		{\fontsize{18}{18}\selectfont\bfseries 과학영재학교}%
		{\fontsize{24}{24}\selectfont\bfseries{}~~경기과학고등학교}
	\end{center}
	\newpage
}

\renewcommand{\maketitle}{%
	\begin{center}
		\printtitle{\@title}
	\end{center}
	\vskip 3cm
}

\RequirePackage{xstring}
\newcommand{\usetitle}[1]{
  \AtBeginDocument{
    \IfStrEq{#1}{kor}{%
      \renewcommand{\abstractname}{요\hskip 2pc 약}
      \renewcommand{\contentsname}{목차}
      \renewcommand{\refname}{참고문헌}
      \renewcommand{\listfigurename}{그림 차례}
      \renewcommand{\listtablename}{표 차례}
    }{%
      \renewcommand{\abstractname}{Abstract}
      \renewcommand{\contentsname}{Contents}
      \renewcommand{\refname}{References}
      \renewcommand{\listfigurename}{List of Figures}
      \renewcommand{\listtablename}{List of Tables}
    }
  }
}

\newcommand{\usecaption}[1]{
	\IfStrEq{#1}{kor}{%
		\renewcommand{\figurename}{그림}
		\renewcommand{\tablename}{표}
	}{%
		\renewcommand{\figurename}{Figure}
		\renewcommand{\tablename}{Table}
	}
}

\renewenvironment{abstract}
 {\begin{center}
  \bfseries \abstractname\vspace{-.5em}\vspace{0pt}
  \end{center}
  \quotation\bfseries}
 {\endquotation}

%%%%%%%%%%%%
% BibLaTeX %
%%%%%%%%%%%%
\RequirePackage[backend=biber,citestyle=numeric-comp,bibstyle=apa,apamaxprtauth=3,sorting=none]{biblatex}
\DeclareLanguageMapping{american}{american-apa}

\AtEveryBibitem{%
  \clearfield{number}%
}

\newbibmacro*{name:apa:family-given-nocomma}[5]{%
  \togglefalse{apablx@wantcomma}%
  \ifuseprefix
    {\usebibmacro{name:delim}{#4#1}%
     \usebibmacro{name:hook}{#4#1}%
     \ifdefvoid{#4}{}{%
       \mkbibnameprefix{#4}\isdot%
       \ifprefchar{}{\bibnamedelimc}}%
     \mkbibnamefamily{#1}\isdot%
     \ifdefvoid{#2}{}{\toggletrue{apablx@wantcomma}%
                      \revsdnamepunct\bibnamedelimd\mkbibnamegiven{#3}\isdot%
                      \ifthenelse{\value{uniquename}>1}
                        {\bibnamedelimd\mkbibbrackets{#2}}
                        {}}%
     \ifdefvoid{#5}{}{\toggletrue{apablx@wantcomma}%
                      \addcomma\bibnamedelimd\mkbibnamesuffix{#5}\isdot}}
    {\usebibmacro{name:delim}{#1}%
     \usebibmacro{name:hook}{#1}%
     \mkbibnamefamily{#1}\isdot
     \ifboolexpe{%
       test {\ifdefvoid{#2}}
       and
       test {\ifdefvoid{#4}}}
       {}
       {\revsdnamepunct}%
     \ifdefvoid{#2}{}{\toggletrue{apablx@wantcomma}%
                      \bibnamedelimd\mkbibnamegiven{#3}%
                      \ifthenelse{\value{uniquename}>1}
                        {\bibnamedelimd\mkbibbrackets{#2}}
                        {}}%
     \ifdefvoid{#4}{}{%
       \toggletrue{apablx@wantcomma}%
       \bibnamedelimc\mkbibnameprefix{#4}%
       \ifprefchar{}{\bibnamedelimc}}%
     \ifdefvoid{#5}{}{\toggletrue{apablx@wantcomma}%
                      \addcomma\bibnamedelimd\mkbibnamesuffix{#5}\isdot}}%
  \let\bibstring\bibcplstring
  \usebibmacro{role}{\addspace}{\mkbibparens}%
  \hasitemannotation[\currentname][username]
    {\addspace\mkbibbrackets{\getitemannotation[\currentname][username]}}
    {}}

\DeclareNameFormat{apaauthor}{%
	\ifthenelse{\value{listtotal}>3}
		{\ifthenelse{\value{listcount}>1}
			{}
			{\usebibmacro{name:apa:family-given-nocomma}
					{\namepartfamily}%
					{\namepartgiven}%
					{\namepartgiveni}%
					{\namepartprefix}%
					{\namepartsuffix}%
					\space\mkbibemph{\biblcstring{andothers}}\space}}
		{\ifthenelse{\value{listcount}>2\AND\value{listcount}<\value{listtotal}}
      {}
      {\usebibmacro{name:apa:family-given}%
         {\namepartfamily}%
         {\namepartgiven}%
         {\namepartgiveni}%
         {\namepartprefix}%
         {\namepartsuffix}}}
}

\DeclareFieldFormat[article,inbook,incollection,periodical,misc,thesis,unpublished,techreport,book,legislation,legadminmaterial,jurisdiction,inproceedings,legal]{title}{\mkbibquote{#1}\addcomma}

\DeclareFieldFormat[article,inbook,incollection,periodical,misc,thesis,unpublished,techreport,book,legislation,legadminmaterial,jurisdiction,inproceedings,legal]{volume}{\ifinteger{#1}{Vol.\space}{}#1\addcomma}

\DeclareFieldFormat[article,inbook,incollection,periodical,misc,thesis,unpublished,techreport,book,legislation,legadminmaterial,jurisdiction,inproceedings,legal]{pages}{pp.\,#1}

\DeclareFieldFormat[misc,online]{url}{Website: \url{#1}}
\DeclareFieldFormat[misc,online]{howpublished}{Website: \url{#1}}

\DeclareFieldFormat{bibentrysetcount}{\mkbibparens{\mknumalph{#1}}}
\DeclareFieldFormat{labelnumberwidth}{\mkbibbrackets{#1}}
\DeclareFieldFormat{shorthandwidth}{\mkbibbrackets{#1}}
\defbibenvironment{bibliography}
{\list
	{\printtext[labelnumberwidth]{%
			\printfield{labelprefix}%
			\printfield{labelnumber}}}
	{\setlength{\labelwidth}{\labelnumberwidth}%
		\setlength{\leftmargin}{\labelwidth}%
		\setlength{\labelsep}{\biblabelsep}%
		\addtolength{\leftmargin}{\labelsep}%
		\setlength{\itemsep}{\bibitemsep}%
		\setlength{\parsep}{\bibparsep}}%
	\renewcommand*{\makelabel}[1]{\hss##1}}
{\endlist}
{\item}