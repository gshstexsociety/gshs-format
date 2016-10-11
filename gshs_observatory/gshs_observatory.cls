\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{gshs_observatory}[2016/09/27 v1.0]
\LoadClass[a4paper,10pt]{article}
\usepackage{kotex}
\usepackage{multirow}
\usepackage{array}
\usepackage[%
paperheight=297mm,%
paperwidth=210mm,%
left=25mm,%
right=25mm,%
textheight=237mm,%
textwidth=160mm,%
top=30mm,%
bottom=30mm,%
headheight=3.175mm,%
headsep=10.7mm,%
footskip=15mm%
]{geometry}
\usepackage{csvsimple}
\usepackage{siunitx}

\newcommand{\@recordtitle}{Record Title}
\newcommand{\@starttime}{Start Time}
\newcommand{\@finishtime}{Finish Time}
\newcommand{\@englishname}{English Name}
\newcommand{\@koreanname}{한글이름(학번)}
\newcommand{\@ccdtemperature}{CCD Temperature}
\newcommand{\@imagesize}{Image Size}
\newcommand{\@exposurepreset}{Exposure Preset}
\newcommand{\@autodark}{Auto Dark}
\newcommand{\@filterwheel}{Filter Wheel}
\newcommand{\@exposureduration}{Exposure Duration}
\newcommand{\@flatinfoevening}{flatinfo_evening.csv}
\newcommand{\@flatinfodaybreak}{flatinfo_daybreak.csv}
\newcommand{\@telescopename}{Telescope Name}
\newcommand{\@ccdname}{CCD Name}
\newcommand{\@targetinfo}{targetinfo.csv}

\newcommand{\recordtitle}[1]{%
	\renewcommand{\@recordtitle}{#1}%
}
\newcommand{\starttime}[1]{%
	\renewcommand{\@starttime}{#1}%	
}
\newcommand{\finishtime}[1]{%
	\renewcommand{\@finishtime}{#1}%	
}
\newcommand{\englishname}[1]{%
	\renewcommand{\@englishname}{#1}%
}
\newcommand{\koreanname}[1]{%
	\renewcommand{\@koreanname}{#1}%
}
\newcommand{\ccdtemperature}[1]{%
	\renewcommand{\@ccdtemperature}{#1}%
}
\newcommand{\imagesize}[1]{%
	\renewcommand{\@imagesize}{#1}%
}
\newcommand{\exposurepreset}[1]{%
	\renewcommand{\@exposurepreset}{#1}%
}
\newcommand{\autodark}[1]{%
	\renewcommand{\@autodark}{#1}%
}
\newcommand{\filterwheel}[1]{%
	\renewcommand{\@filterwheel}{#1}%
}
\newcommand{\exposureduration}[1]{%
	\renewcommand{\@exposureduration}{#1}%
}
\newcommand{\flatinfoevening}[1]{%
	\renewcommand{\@flatinfoevening}{#1}%
}
\newcommand{\flatinfodaybreak}[1]{%
	\renewcommand{\@flatinfodaybreak}{#1}%
}
\newcommand{\telescopename}[1]{%
	\renewcommand{\@telescopename}{#1}%
}
\newcommand{\ccdname}[1]{%
	\renewcommand{\@ccdname}{#1}%
}
\newcommand{\targetinfo}[1]{%
	\renewcommand{\@targetinfo}{#1}%
}
%\newcommand{\@}{}
%\newcommand{\}[1]{%
%	\renewcommand{\@}{#1}%
%}

% Table settings
\newcolumntype{x}[1]{>{\centering\arraybackslash\hspace{0pt}}p{#1}}

% Footnote settings
\renewcommand{\thefootnote}{\fnsymbol{footnote}} 

\newcommand{\makecover}{
	\newgeometry{% Geometry options only for cover
		paperheight=297mm,%
		paperwidth=210mm,%
		left=25mm,%
		right=25mm,%
		textheight=237mm,%
		textwidth=160mm,%
		top=20mm,%
		bottom=15mm,%
		headheight=3.175mm,%
		headsep=10.7mm,%
		footskip=0mm%
	}
	\begin{center}
		\begin{LARGE}
			\@recordtitle\footnote{
				Observatory Location : \\
				(Songjuk-dong) Science Research Center, Gyeonggi Science High School for the gifted, 135, Suil-ro, Jangan-gu, Suwon-si, Gyeonggi-do, Republic of Korea \\
				대한민국 경기도 수원시 장안구 수일로 135(송죽동) 경기과학고등학교 과학영재연구센터 \\
				Latitude : $ 37.3^{\circ} $,  Longtitude :$ 127.0^{\circ} $.
			}
		\end{LARGE}
	\end{center}
	\renewcommand{\arraystretch}{2}
	\begin{table}[h]
		\begin{center}
			\resizebox{\textwidth}{!}{
				\begin{tabular}{|c|p{.7\textwidth}|}
					\hline
					\multicolumn{2}{|c|}{Gyeonggi Science High School(GSHS) Observatory(\url{ess.gs.hs.kr})} \\
					\hline
					Time(KST) & From : \@starttime \ / To : \@finishtime \\
					\hline
					Observer & \@englishname (\@koreanname) \\
					\hline
				\end{tabular}
			}
			\resizebox{\textwidth}{!}{
				\begin{tabular}{|c|c|c|}
					\hline
					\multicolumn{3}{|c|}{Instrumental Information \& Settings} \\
					\hline
					Telescope & CCD & CCD cooled temperature \\
					\hline
					\@telescopename & \@ccdname & \@ccdtemperature \\
					\hline
				\end{tabular}
			}
		\end{center}
	\end{table}
	\begin{table}[h]
		\begin{center}
			\resizebox{\textwidth}{!}{
				\begin{tabular}{|c|c|c|c|c|c|}
					\hline
					\multicolumn{6}{|c|}{Evening Flat} \\
					\hline
					\multicolumn{2}{|c|}{B(Value)} & \multicolumn{2}{c|}{V(Value)} & \multicolumn{2}{c|}{R(Value)} \\
					\hline
					s & value & s & value & s & value
					\csvreader[head to column names]{\@flatinfoevening}{}%
					{\\\Bs & \Bvalue & \Vs & \Vvalue & \Rs & \Rvalue}%
					\\\hline
				\end{tabular}
				\begin{tabular}{|c|c|c|c|c|c|}
					\hline
					\multicolumn{6}{|c|}{Daybreak Flat} \\
					\hline
					\multicolumn{2}{|c|}{B(Value)} & \multicolumn{2}{c|}{V(Value)} & \multicolumn{2}{c|}{R(Value)} \\
					\hline
					s & value & s & value & s & value
					\csvreader[head to column names]{\@flatinfodaybreak}{}%
					{\\\Bs & \Bvalue & \Vs & \Vvalue & \Rs & \Rvalue}%
					\\\hline
				\end{tabular}
			}
		\end{center}
%		\begin{flushright}\large
%			\begin{tabular}{|c|c|}
%				\hline
%				Person in Charge & Observatory Representative \\
%				\hline
%				\rule{0ex}{1cm} & \rule{0ex}{1cm} \\
%				\hline
%			\end{tabular}
%		\end{flushright}
	\end{table}
	\begin{table}[h]
		\begin{center}
			\resizebox{\textwidth}{!}{
				\begin{tabular}{|p{.5\textwidth}|p{.2\textwidth}|p{.2\textwidth}|}
					\hline
					\multicolumn{3}{|c|}{Target information and observation time} \\
					\hline
					Target information \newline (Target Name / Filter / Binning / Exposure Time) & Time \newline (24-hour clock) & Average \newline Value / SNR
					\csvreader[head to column names]{\@targetinfo}{}%
					{\\\hline\TargetName ~/~ \Filter ~/~ \Binning ~/~ \ExposureTime & \Time & \AverageValue ~/~ \AverageSNR}%
					\\\hline
				\end{tabular}
			}
		\end{center}
	\end{table}
	\renewcommand{\arraystretch}{1}
	\clearpage
	\restoregeometry
}
