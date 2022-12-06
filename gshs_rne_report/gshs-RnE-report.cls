% % % % % % % % % % % % % % % % % % % % % % % % % % % % %
% % % LaTeX document class for the GSHS RnE Report  % % %
% % % First edition 2022.11.05 by Junseok Lee % % % % % %
% % % Copyright (C) 2022-present GSHS TeX Society % % % %
% % % % % % % % % % % % % % % % % % % % % % % % % % % % %

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{gshs-RnE-report}[2022/12/04 GSHS RnE Report Class]
\LoadClass[12pt]{article}

\RequirePackage[a4paper, left=25mm, right=25mm, top=30mm, bottom=30mm]{geometry}
\RequirePackage{setspace}
\linespread{1.6} % 줄간격 160%
\RequirePackage{fontspec}
\RequirePackage{kotex}
\setmainfont{Times New Roman}[Ligatures=TeX]

\newif\if@overleaf
\@overleaffalse
\DeclareOption{overleaf}{\@overleaftrue}
\ProcessOptions\relax
\if@overleaf
  \setmainhangulfont{HCR Batang}[Extension=.ttf, Path=./fonts/, BoldFont=*-Bold, WordSpace={1.2,0.1,0.1}]
  \newfontfamily{\dotum}{HCR Dotum}[Extension=.ttf, Path=./fonts/, BoldFont=*-Bold, WordSpace={1.2,0.1,0.1}]
  \newhangulfontfamily{\hdotum}{HCR Dotum}[Extension=.ttf, Path=./fonts/, BoldFont=*-Bold, WordSpace={1.2,0.1,0.1}]
  \newfontfamily{\batang}{HCR Batang}[Extension=.ttf, Path=./fonts/, BoldFont=*-Bold, WordSpace={1.2,0.1,0.1}]
  \newhangulfontfamily{\hbatang}{HCR Batang}[Extension=.ttf, Path=./fonts/, BoldFont=*-Bold, WordSpace={1.2,0.1,0.1}]
\else
  \setmainhangulfont{HCR Batang}[WordSpace={1.2,0.1,0.1}]
  \newfontfamily{\dotum}{HCR Dotum}[WordSpace={1.2,0.1,0.1}]
  \newhangulfontfamily{\hdotum}{HCR Dotum}[WordSpace={1.2,0.1,0.1}]
  \newfontfamily{\batang}{HCR Batang}[WordSpace={1.2,0.1,0.1}]
  \newhangulfontfamily{\hbatang}{HCR Batang}[WordSpace={1.2,0.1,0.1}]
\fi

\renewcommand{\thesection}{\Roman{section}}
\renewcommand{\thefootnote}{\fnsymbol{footnote}}

\def\engtitle#1{\gdef\@engtitle{#1}}
\def\advisor#1{\gdef\@advisor{#1}}
\def\advisorEmail#1{\gdef\@advisorEmail{#1}}
\title{}
\engtitle{}

\newcommand{\ifnotext}[3]{%
	\sbox0{#1}%
	\ifdim\wd0=0pt{#2}\else{#3}\fi
}

\RequirePackage{listofitems}
\RequirePackage{etoolbox}

\BeforeBeginEnvironment{equation}{\linespread{0.7}}
\AfterEndEnvironment{equation}{\linespread{1.6}\vspace*{0.3\baselineskip}\noindent}

\renewcommand{\date}[1]{
	\setsepchar{.}
	\readlist\temp{#1}
	\newcommand{\@year}{\temp[1]}
	\newcommand{\@month}{\temp[2]}
	\newcommand{\@day}{\temp[3]}		
}

\newcounter{cntemail}
\newcounter{cntname}
\ExplSyntaxOn
\tl_new:N \l_author_tl
\tl_new:N \l_email_tl
\seq_new:N \l_my_seq
\tl_new:N \l_emailgroup_tl
\keys_define:nn { printopt }
  {
		group .bool_set:N = \l_printopt_group_bool,
		group .initial:n = false,
		sep .bool_set:N = \l_printopt_sep_bool,
		sep .initial:n = false,
		sup .bool_set:N = \l_printopt_sup_bool,
		sup .initial:n = true,
  }
\NewDocumentCommand{\authorstyle}{m}
  {
  	\keys_set:nn { printopt } {#1}
  }

\NewDocumentCommand{\printauthoremail}{m}
  {
  	\cs_generate_variant:Nn \fn_printname:n { V }
		\fn_printname:V { #1 }
  }

\cs_new_protected:Nn \fn_printname:n
{
	
  \setcounter{cntemail}{1}
  \setcounter{cntname}{1}
	\tl_set:Nn \l_author_tl {#1}
	\tl_set:Nn \l_email_tl {#1}
	\batang \hbatang
	\textbf{연구~참여자:~}
	\bool_if:nTF { \l_printopt_sep_bool }
	{
		\regex_replace_all:nnN { \s } { } \l_author_tl
		\regex_replace_all:nnN { ,.*?; } { ,\~ } \l_author_tl
		\regex_replace_all:nnN { ,[^,]*$ } { } \l_author_tl
		\if_bool:N \l_printopt_sup_bool
		\regex_replace_all:nnN { (,|$) } { \c{textsuperscript}\cB{ \c{ thecntname } \c{ addtocounter } \cB{ cntname \cE} \cB{ 1 \cE} \cE} \1 }\l_author_tl
		\else:
    \fi:
		\regex_replace_all:nnN { \s } { } \l_email_tl
		\regex_replace_all:nnN { ^.*?, } { } \l_email_tl
		\regex_replace_all:nnN { ;.*?, } { ; } \l_email_tl
		\textbf{\tl_use:N \l_author_tl}\par
		\cs_generate_variant:Nn \fn_printemail:n { V }
		\fn_printemail:V { \l_email_tl }
	}
	{
		\tl_set:Nn \l_tmpa_tl {#1;}
    \regex_replace_all:nnN { \s } { } \l_tmpa_tl
    \regex_replace_all:nnN {(\d*)(.*?),(.*?);} { \c{textbf}\cB{ \1\~\2\c{nobreak}\c{hspace}\cB{ 0pt \cE}(\c{texttt} \cB{ \c{href} \cB{ mailto:\3 \cE} \cB{ \3 \cE} \cE})\ \cE} } \l_tmpa_tl
		\tl_use:N \l_tmpa_tl
	}
}

\cs_new_protected:Nn \fn_printemail:n
{
	\seq_clear:N \l_tmpb_seq
	\seq_clear:N \l_my_seq
	\tl_clear:N \l_emailgroup_tl
	\bool_if:nTF { \l_printopt_group_bool }
	{
		\seq_set_split:Nnn \l_tmpa_seq { ; } { #1 }
		\seq_map_inline:Nn \l_tmpa_seq
		{
			\tl_set:Nn \l_tmpa_tl { ##1 }
			\regex_replace_once:nnN { ^.+\@ } {  } \l_tmpa_tl
			\seq_put_right:Nx \l_tmpb_seq { \l_tmpa_tl }
		}
		\seq_remove_duplicates:N \l_tmpb_seq	
		% Check if email domains are all the same
		\int_compare:nNnTF { \seq_count:N \l_tmpb_seq } = { 1 }
		{
			\seq_map_inline:Nn \l_tmpa_seq
			{
				\tl_set:Nn \l_tmpa_tl {##1}
				\regex_replace_once:nnN { \@.+ } { } \l_tmpa_tl
				\seq_put_right:Nx \l_my_seq { \exp_not:N \href { mailto:\l_tmpa_tl @\seq_item:Nn\l_tmpb_seq{1} } { \if_bool:N \l_printopt_sup_bool \exp_not:N \textsuperscript{\thecntemail} \else: \fi: \l_tmpa_tl } }
				\addtocounter{cntemail}{1}
			}
			\tl_set:Nx \l_emailgroup_tl { \{ \seq_use:Nn \l_my_seq { ,~ } \}@ \seq_use:Nn \l_tmpb_seq {} }
			\textbf{ \texttt{ \tl_use:N \l_emailgroup_tl } }
		}
		{
			\seq_map_inline:Nn \l_tmpa_seq
			{
				\tl_set:Nn \l_tmpa_tl {##1}
				\seq_put_right:Nx \l_my_seq {\exp_not:N \href { mailto:\l_tmpa_tl } { \if_bool:N \l_printopt_sup_bool \exp_not:N \textsuperscript{\thecntemail} \else: \fi: \l_tmpa_tl } }
				\addtocounter{cntemail}{1}
			}
			\textbf{ \texttt{ \seq_use:Nn \l_my_seq { ,~ } } }
		}
	}
	{
		\tl_set:Nn \l_tmpa_tl { #1; }
    \if_bool:N \l_printopt_sup_bool
      \regex_replace_all:nnN { (.*?); } { \c{href} \cB{ mailto:\1 \cE} \cB{ \c{textsuperscript}\cB{\c{thecntemail}\c{addtocounter}\cB{cntemail\cE}\cB{1\cE}\cE}\1 \cE},\~ } \l_tmpa_tl
    \else:
      \regex_replace_all:nnN { (.*?); } { \c{href} \cB{ mailto:\1 \cE} \cB{ \1 \cE},\~ } \l_tmpa_tl
    \fi:
		\textbf{ \texttt{ \tl_use:N \l_tmpa_tl } }
	}
}
\ExplSyntaxOff

\newcommand{\makecover}{%
	\thispagestyle{empty}
	\noindent{\dotum\hdotum\@year학년도}\\
	{\dotum\hdotum\bfseries 경기과학고 기초 R\&E 결과보고서}
	\vskip 5pc
	\vspace*{\stretch{1}}
	\begin{center}
		\ifnotext{\@title}{%
      \ifnotext{\@engtitle}{}{\fontsize{18}{18}\selectfont\bfseries\@engtitle}
    }{%
      \fontsize{18}{18}\selectfont\bfseries\@title\\[2pc]
      \ifnotext{\@engtitle}{}{\fontsize{14}{14}\selectfont\bfseries\@engtitle}
    }
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
				\printauthoremail{\@author}
			\end{center}
		\end{minipage}
	\end{center}
	\vskip 2pc
	\begin{center}
		\textbf{지도 교사: \@advisor (\texttt{\href{mailto:\@advisorEmail}{\@advisorEmail}})}
	\end{center}
	\vskip 5pc
	\begin{center}
		{\fontsize{18}{18}\selectfont\bfseries 과학영재학교}%
		{\fontsize{24}{24}\selectfont\bfseries{}~~경기과학고등학교}
	\end{center}
	\newpage
}

\renewcommand{\maketitle}{%
	\begin{center}
		\ifnotext{\@title}{%
      \ifnotext{\@engtitle}{}{\fontsize{18}{18}\selectfont\bfseries\@engtitle}
    }{%
      \fontsize{18}{18}\selectfont\bfseries\@title\\[1pc]
      \ifnotext{\@engtitle}{}{\fontsize{14}{14}\selectfont\bfseries\@engtitle}
    }
	\end{center}
	\vskip 3cm
}

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
    }
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