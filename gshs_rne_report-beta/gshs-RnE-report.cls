% % % % % % % % % % % % % % % % % % % % % % % % % % % % %
% % % LaTeX document class for the GSHS RnE Report  % % %
% % % First edition 2022.11.05 by Junseok Lee % % % % % %
% % % Copyright (C) 2022-present GSHS TeX Society % % % %
% % % % % % % % % % % % % % % % % % % % % % % % % % % % %

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{gshs-RnE-report}[2022/06/14 GSHS RnE Report Class]
\LoadClass[12pt]{article}
\RequirePackage[a4paper, left=25mm, right=25mm, top=30mm, bottom=30mm]{geometry}
\RequirePackage{setspace}
\linespread{1.6} % 줄간격 160%
\RequirePackage{fontspec}
\RequirePackage{kotex}
\setmainfont{Times New Roman}[Ligatures=TeX]
\setmainhangulfont{HCR Batang}[InterHangul=.05em,WordSpace={1.2,0.1,0.1}]
\newfontfamily{\dotum}{HCR Dotum}[WordSpace={1.2,0.1,0.1}]
\newhangulfontfamily{\hdotum}{HCR Dotum}[WordSpace={1.2,0.1,0.1}]
\newfontfamily{\batang}{HCR Batang}[WordSpace={1.2,0.1,0.1}]
\newhangulfontfamily{\hbatang}{HCR Batang}[WordSpace={1.2,0.1,0.1}]

\renewcommand{\thesection}{\Roman{section}}
\renewcommand{\thefootnote}{\fnsymbol{footnote}}

\def\engtitle#1{\gdef\@engtitle{#1}}
\def\advisor#1{\gdef\@advisor{#1}}
\def\advisorEmail#1{\gdef\@advisorEmail{#1}}

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
    group .initial:n = true,
    sep .bool_set:N = \l_printopt_sep_bool,
    sep .initial:n = true,
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
    %\keys_set:nn { printopt } {#1}
    \tl_set:Nn \l_author_tl {#1}
    \tl_set:Nn \l_email_tl {#1}
    \textbf{연구~참여자:~}
    \bool_if:nTF { \l_printopt_sep_bool }
      {
        \regex_replace_all:nnN { \s } { } \l_author_tl
        \regex_replace_all:nnN { ,.*?; } { ,\~ } \l_author_tl
        \regex_replace_all:nnN { ,[^,]*$ } { } \l_author_tl
        \if_bool:N \l_printopt_sup_bool
        \regex_replace_all:nnN { (,|$) } { \c{textsuperscript}\cB{ \c{ thecntname } \c{ addtocounter } \cB{ cntname \cE} \cB{ 1 \cE} \cE} \1 }\l_author_tl
        \else: \fi:
        \regex_replace_all:nnN { \s } { } \l_email_tl
        \regex_replace_all:nnN { ^.*?, } { } \l_email_tl
        \regex_replace_all:nnN { ;.*?, } { ; } \l_email_tl
        \textbf{\tl_use:N \l_author_tl}\par
        \cs_generate_variant:Nn \fn_printemail:n { V }
        \fn_printemail:V { \l_email_tl }
      }
      {
        \tl_set:Nn \l_tmpa_tl {#1}
        \regex_replace_all:nnN { ,\s } { \( } \l_tmpa_tl
        \regex_replace_all:nnN { ;\s } { \),\~ } \l_tmpa_tl
        \regex_replace_once:nnN { $ } { \) } \l_tmpa_tl
        \regex_replace_all:nnN { \((.*?)\) } { \c{textbf} \cB{ (\c{texttt} \cB{ \c{href} \cB{ \1 \cE} \cB{ \1 \cE} \cE}) \cE} } \l_tmpa_tl
        \regex_replace_all:nnN { ^(.*?)\( } { \c{textbf}\cB{ \1 \cE}\( } \l_tmpa_tl
        \regex_replace_all:nnN { ,(.*?)\( } { ,\~\c{textbf}\cB{ \1 \cE}\( } \l_tmpa_tl
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
        \seq_set_split:Nnn \l_tmpa_seq { ; } {#1}
        \seq_map_inline:Nn \l_tmpa_seq
        {
          \tl_set:Nn \l_tmpa_tl {##1}
          \regex_replace_once:nnN { ^.+\@ } {  } \l_tmpa_tl
          \seq_put_right:Nx \l_tmpb_seq { \l_tmpa_tl }
        }
        \seq_remove_duplicates:N \l_tmpb_seq
        % Check if the sequence has only one element
        \int_compare:nNnTF { \seq_count:N \l_tmpb_seq } = { 1 }
          {
            \seq_map_inline:Nn \l_tmpa_seq
              {
                \tl_set:Nn \l_tmpa_tl {##1}
                \regex_replace_once:nnN { \@.+ } { } \l_tmpa_tl
                \seq_put_right:Nx \l_my_seq {%
                  \exp_not:N \href { mailto: \l_tmpa_tl @ \seq_item:Nn \l_tmpb_seq { 1 } }%
                    { \if_bool:N \l_printopt_sup_bool \exp_not:N \textsuperscript { \thecntemail } \else: \fi: \l_tmpa_tl }
                }
                \addtocounter{cntemail}{1}
              }
              \tl_set:Nx \l_emailgroup_tl { \{ \seq_use:Nn \l_my_seq { ,~ } \} @ \seq_use:Nn \l_tmpb_seq {} }
              \textbf{ \texttt{ \tl_use:N \l_emailgroup_tl } }
          }
          {
            \seq_map_inline:Nn \l_tmpa_seq
              {
                \tl_set:Nn \l_tmpa_tl {##1}
                \seq_put_right:Nx \l_my_seq {%
                  \exp_not:N \href { mailto: \l_tmpa_tl }%
                    { \if_bool:N \l_printopt_sup_bool \exp_not:N \textsuperscript { \thecntemail } \else: \fi: \l_tmpa_tl }
                }
                \addtocounter{cntemail}{1}
              }
              \textbf{ \texttt{ \seq_use:Nn \l_my_seq { ,~ } } }
          }
      }
      {
        \tl_set:Nn \l_tmpa_tl { #1; }
        \regex_replace_all:nnN { (.*?); } {%
          \c{href} \cB{ mailto:\1 \cE}%
            \cB{ \if_bool:N \l_printopt_sup_bool \c{textsuperscript} \cB{ \c{ thecntemail }%
              \c{ addtocounter } \cB{ cntemail \cE} \cB{ 1 \cE} \cE}\else: \fi: \1 \cE},\~ } \l_tmpa_tl
        \textbf{ \texttt{ \tl_use:N \l_tmpa_tl } }
      }
  }
\ExplSyntaxOff

\newcommand{\makecover}{%
  \thispagestyle{empty}%
  \noindent{\dotum\hdotum\@year학년도}\\
  {\dotum\hdotum\bfseries 경기과학고 기초 R\&E 결과보고서}
  \vskip 5pc
  \vspace*{\stretch{1}}
  \begin{center}
    \ifnotext{\@title}{}{\fontsize{18}{18}\selectfont\bfseries\@title\\[2pc]}
    \ifnotext{\@engtitle}{}{\fontsize{14}{14}\selectfont\bfseries\@engtitle}
  \end{center}
  \vskip 2pc
  \vspace*{\stretch{1}}
  \begin{center}
    \batang\bfseries \@year.\:\@month.\:\@day.
  \end{center}
  \vspace*{\stretch{1}}
  \begin{center}
    \begin{minipage}{0.7\textwidth}
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
    \ifnotext{\@title}{}{\fontsize{18}{18}\selectfont\bfseries\@title\\[1pc]}
    \ifnotext{\@engtitle}{}{\fontsize{14}{14}\selectfont\bfseries\@engtitle}
  \end{center}
  \vskip 3cm
}

\renewenvironment{abstract}{%
  \begin{center}
    \bfseries \abstractname\vspace{-.5em}\vspace{0pt}
  \end{center}
  \quotation\bfseries
}{%
  \endquotation
}
