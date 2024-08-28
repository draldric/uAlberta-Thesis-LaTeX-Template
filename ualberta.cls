%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                         uAlberta Thesis Class File                         %%
%%                                     by                                     %%
%%                               Daniel Aldrich                               %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                              %
%       Copyright (c) 2024 Daniel Aldrich                                      %
%                                                                              %
%       Permission is hereby granted, free of charge, to any person            %
%       obtaining a copy of this software and associated documentation         %
%       files (the "Software"), to deal in the Software without                %
%       restriction, including without limitation the rights to use,           %
%       copy, modify, merge, publish, distribute, sublicense, and/or           %
%       sell copies of the Software, and to permit persons to whom the         %
%       Software is furnished to do so, subject to the following               %
%       conditions:                                                            %
%                                                                              %
%       The above copyright notice and this permission notice shall be         %
%       included in all copies or substantial portions of the Software.        %
%                                                                              % 
%       THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,        % 
%       EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES        %
%       OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND               % 
%       NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT            %
%       HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,           %
%       WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING           %
%       FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR          %
%       OTHER DEALINGS IN THE SOFTWARE.                                        %
%                                                                              %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{ualberta}
              [2024/08/20 V:2.0.0 ualberta Document Class]
\pdfminorversion=7
\RequirePackage{etoolbox}
\RequirePackage{xstring}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                            LINE SPACING COMMANDS                             %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\singlespacing}{\baselineskip 1em}
\newcommand{\onehalfspacing}{\baselineskip 1.50em}
\newcommand{\doublespacing}{\baselineskip 1.75em}
\newcommand{\truedoublespacing}{\baselineskip 2em}
\newcommand{\normalspacing}{\baselineskip 1em}
\newcommand{\triplespacing}{\baselineskip 3em}

\def\today{\ifcase\month\or
	January\or February\or March\or April\or May\or June\or
	July\or August\or September\or October\or November\or December\fi
	\space\number\day, \number\year}

\newcommand\settoclevel[1]{\setcounter{secnumdepth}{#1}\setcounter{tocdepth}{#1}}
	\setcounter{tocdepth}{2}

\newcommand\convocationdate[1]{\renewcommand\@convocationdate{#1}}
\newcommand\@convocationdate{\the\year}
 
\newcommand\specialization[1]{%
	\renewcommand\@specialization{%
		\def\specializationtemp{#1}
		\ifx\specializationtemp\empty
			\vspace{8\baselineskip}
		\else
			\vspace{1\baselineskip}
			in\\
			\vspace{1\baselineskip}
			#1\\
			\vspace{4\baselineskip}
		\fi}}
\newcommand\@specialization{\vspace{8\baselineskip}}

\newcommand\deptfac[1]{%
	\renewcommand\@deptfac{
		\def\deptfactemp{#1}
		\ifx\deptfactemp\empty
		\else
			#1
		\fi}}
\newcommand\@deptfac{}

\newcommand\university[1]{\renewcommand\@university{#1}}
\newcommand\@university{University of Alberta}

\newcommand\degree[1]{\renewcommand\@degree{#1}}
\newcommand\@degree{Select or Enter a Degree}

\newcommand\abstracttext[1]{\renewcommand\@abstracttext{#1}\sanitizeabstract}
\newcommand\@abstracttext{}

\newcommand{\sanitizeabstract}{
  \StrSubstitute{\@abstracttext}{\par}{ }[\@cleanabstract]}

\newcommand\keywords[1]{\renewcommand\@keywords{#1}}
\newcommand\@keywords{}

\newcommand\thesisquote[1]{\renewcommand\@thesisquote{#1}}
\newcommand\@thesisquote{}

\newcommand\preface[1]{%
	\renewcommand\@preface{%
		\ifblank{#1}{%
			This thesis is an original work by \@author. No part of this thesis has been previously published.
		}{%
			#1}}}
\newcommand\@preface{This thesis is an original work by \@author. No part of this thesis has been previously published.}

\newcommand\dedication[1]{\renewcommand\@dedication{#1}}
\newcommand\@dedication{}

\newcommand\acknowledgementtext[1]{\renewcommand\@acknowledgementtext{#1}}
\newcommand\@acknowledgementtext{}

\newcounter{baseSection}
\setcounter{baseSection}{0}

\newcommand\addlatexfiles[1]{\renewcommand\@addlatexfiles{#1}}
\newcommand\@addlatexfiles{}

\newcommand\addprefatory[1]{\renewcommand\@addprefatory{#1}}
\newcommand\@addprefatory{}

\newcommand\addchapters[1]{\renewcommand\@addchapters{#1}}
\newcommand\@addchapters{}

\newcommand\addappendices[1]{\renewcommand\@addappendices{#1}}
\newcommand\@addappendices{}

\newcommand\addmedia[1]{\renewcommand\@addmedia{#1}}
\newcommand\@addmedia{}

\newcommand\addimages[1]{\renewcommand\@addimages{\@addmedia#1}}
\newcommand\@addimages{}

\newcommand\addtables[1]{\renewcommand\@addtables{\@addmedia#1}}
\newcommand\@addtables{}

\newcommand\addcode[1]{\renewcommand\@addcode{\@addmedia#1}}
\newcommand\@addcode{}

\newcommand\addpdf[1]{\renewcommand\@addpdf{\@addmedia#1}}
\newcommand\@addpdf{}

\newcommand\adddata[1]{\renewcommand\@adddata{\@addmedia#1}}
\newcommand\@adddata{}

\def\@year{\number\year}

\newif\if@restonecol

\newif\if@openright

\newif\if@chapterbib
\@chapterbibfalse

\newif\if@fancyheaders
\@fancyheadersfalse

\newif\if@saychapapp
\@saychapappfalse

\newif\if@pdfa
\@pdfafalse

\newif\iffigures

\newif\iftables

\newif\ifplates

\newcommand\@ptsize{}
\DeclareOption{10pt}{\renewcommand\@ptsize{0}}
\DeclareOption{11pt}{\renewcommand\@ptsize{1}}
\DeclareOption{12pt}{\renewcommand\@ptsize{2}}


\DeclareOption{oneside}{\@twosidefalse \@mparswitchfalse}
\DeclareOption{twoside}{\@twosidetrue  \@mparswitchtrue \@openrighttrue}

\DeclareOption{draft}{\setlength\overfullrule{5pt}}
\DeclareOption{final}{\setlength\overfullrule{0pt}}

\DeclareOption{openright}{\@openrighttrue}
\DeclareOption{openany}{\@openrightfalse}

\DeclareOption{onecolumn}{\@twocolumnfalse}
\DeclareOption{twocolumn}{\@twocolumntrue}

\DeclareOption{leqno}{\input{leqno.clo}}
\DeclareOption{fleqn}{\input{fleqn.clo}}

\DeclareOption{openbib}{%
  \AtEndOfPackage{%
    \renewcommand\@openbib@code{%
      \advance\leftmargin\bibindent
      \itemindent -\bibindent
      \listparindent \itemindent
      \parsep \z@
      }%
    \renewcommand\newblock{\par}}}

\DeclareOption{pdfa}{\@pdfatrue}
\DeclareOption{chapterbib}{\@chapterbibtrue}
\DeclareOption{fancyheaders}{\@fancyheaderstrue}
\DeclareOption{saychapapp}{\@saychapapptrue}

\DeclareOption{a4paper}{\def\@paperoption{a4paper}}
\DeclareOption{letterpaper}{\def\@paperoption{letterpaper}}
\DeclareOption{legalpaper}{\def\@paperoption{legalpaper}}
\DeclareOption{landscape}{\def\@landscape{landscape}}
\def\@paperoption{letterpaper} % Default paper size
\def\@landscape{}          % Default is no landscape mode

\ExecuteOptions{letterpaper,12pt,oneside,onecolumn,final,openany}
\ProcessOptions

\input{size1\@ptsize.clo}
\setlength\lineskip{1\p@}
\setlength\normallineskip{1\p@}
\renewcommand\baselinestretch{}
\setlength\parskip{0\p@ \@plus \p@}
\@lowpenalty   51
\@medpenalty  151
\@highpenalty 301

\setcounter{topnumber}{2}
\renewcommand\topfraction{.7}
\setcounter{bottomnumber}{1}
\renewcommand\bottomfraction{.3}
\setcounter{totalnumber}{3}
\renewcommand\textfraction{.2}
\renewcommand\floatpagefraction{.5}
\setcounter{dbltopnumber}{2}
\renewcommand\dbltopfraction{.7}
\renewcommand\dblfloatpagefraction{.5}

\if@twoside
	\def\ps@headings{%
		\let\@oddfoot\@empty\let\@evenfoot\@empty
		\def\@evenhead{\thepage\hfil\slshape\leftmark}%
		\def\@oddhead{{\slshape\rightmark}\hfil\thepage}%
		\let\@mkboth\markboth
		\def\chaptermark##1{%
			\markboth {\MakeUppercase{%
				\ifnum \c@secnumdepth >\m@ne
					\@chapapp\ \thechapter. \ %
				\fi
				##1}}{}}%
		\def\sectionmark##1{%
			\markright {\MakeUppercase{%
				\ifnum \c@secnumdepth >\z@
					\thesection. \ %
				\fi
				##1}}}}
\else
	\def\ps@headings{%
		\let\@oddfoot\@empty
		\def\@oddhead{{\slshape\rightmark}\hfil\thepage}%
		\let\@mkboth\markboth
		\def\chaptermark##1{%
			\markright {\MakeUppercase{%
				\ifnum \c@secnumdepth >\m@ne
					\@chapapp\ \thechapter. \ %
				\fi
				##1}}}}
\fi

\def\ps@myheadings{%
	\let\@oddfoot\@empty\let\@evenfoot\@empty
	\def\@evenhead{\thepage\hfil\slshape\leftmark}%
	\def\@oddhead{{\slshape\rightmark}\hfil\thepage}%
	\let\@mkboth\@gobbletwo
	\let\chaptermark\@gobble
	\let\sectionmark\@gobble}

\newenvironment{titlepage}{%
		\if@twocolumn
			\@restonecoltrue\onecolumn
		\else
			\@restonecolfalse\newpage
		\fi
		\thispagestyle{empty}
		\setcounter{page}\@ne%
	}{%
		\if@restonecol\twocolumn \else \newpage \fi
		\if@twoside
			\null\thispagestyle{empty}
		\else
			\setcounter{page}\@ne
		\fi}

\newcommand\maketitle{%
	\hypersetup{pageanchor=false}
	\begin{titlepage}%
		\pagenumbering{roman}
		\thispagestyle{empty}
		\vspace*{1.75\baselineskip}
		\begin{center}
			\textsc{\textbf{\@title}}\\[0.5\baselineskip]
			by\\[0.5\baselineskip]
			\@author\\[5\baselineskip]
			A thesis submitted in partial fulfillment of the requirements for the degree of\\[1.25\baselineskip]
			\@degree\\
			\@specialization
			\@deptfac\\
			\@university\\[8.5\baselineskip]
			\copyright{} \@author, \@convocationdate
		\end{center}
		\newpage
	\end{titlepage}%
	\hypersetup{pageanchor=true}
	\if@fancyheaders
		\pagestyle{headings}
	\else
		\pagestyle{plain}
	\fi
	\pagenumbering{roman}\setcounter{page}{2}
	\setcounter{footnote}{0}%
	\global\let\maketitle\relax
	\newwrite\myfile
	\immediate\openout\myfile=\jobname.xmpdata
	\immediate\write\myfile{\string\Title{\@title }}
	\immediate\write\myfile{\string\Author{\@author }}
	\immediate\write\myfile{\string\Subject{ \@cleanabstract } }
	\immediate\write\myfile{\string\Copyright{Copyright \string\copyright\ \@convocationdate\space\@author }}
	\immediate\closeout\myfile
	%\global\let\@author\@empty
	%\global\let\@convocationdate\@empty
	%\global\let\@title\@empty
	\global\let\title\relax
	\global\let\author\relax
	\global\let\convocationdate\relax
	\global\let\and\relax
}

\newcommand*\chaptermark[1]{}
\setcounter {secnumdepth}{2}
\newcounter {chapter}
\newcounter {section}[chapter]
\newcounter {subsection}[section]
\newcounter {subsubsection}[subsection]
\newcounter {paragraph}[subsubsection]
\newcounter {subparagraph}[paragraph]
\renewcommand \thechapter       {\@arabic\c@chapter}
\renewcommand \thesection       {\thechapter.\@arabic\c@section}
\renewcommand \thesubsection    {\thesection.\@arabic\c@subsection}
\renewcommand \thesubsubsection {\thesubsection.\@arabic\c@subsubsection}
\renewcommand \theparagraph     {\thesubsubsection.\@arabic\c@paragraph}
\renewcommand \thesubparagraph  {\theparagraph.\@arabic\c@subparagraph}
\newcommand\@chapapp{\chaptername}

\newcommand\chapter{\stepcounter{baseSection}
	\if@openright\cleardoublepage\else\clearpage\fi
	\thispagestyle{plain}%
	\global\@topnum\z@
	\@afterindentfalse
	\secdef\@chapter\@schapter}

\def\@chapter[#1]#2{%
	\ifnum \c@secnumdepth >\m@ne
		\refstepcounter{chapter}%
		\typeout{\@chapapp\space\thechapter.}%
		\addcontentsline{toc}{chapter}%
		{\if@saychapapp \@chapapp\ \fi\protect\numberline{\thechapter\if@saychapapp:\fi}#1}%
	\else
		\addcontentsline{toc}{chapter}{#1}%
	\fi
	\chaptermark{#1}%
	\addtocontents{lof}{\protect\addvspace{10\p@}}%
	\addtocontents{lot}{\protect\addvspace{10\p@}}%
	\addtocontents{lop}{\protect\addvspace{10\p@}}%
	\if@twocolumn
		\@topnewpage[\@makechapterhead{#2}]%
	\else
		\@makechapterhead{#2}%
		\@afterheading
	\fi}
                    
\def\@makechapterhead#1{%
	\vspace*{50\p@}%
	{\parindent \z@ \raggedright \normalfont
		\ifnum \c@secnumdepth >\m@ne
			\huge\bfseries \@chapapp\space \thechapter
			\par\nobreak
			\vskip 20\p@
		\fi
		\interlinepenalty\@M
		\Huge \bfseries #1\par\nobreak
		\vskip 40\p@}}

\def\@schapter#1{%
	\if@twocolumn
		\@topnewpage[\@makeschapterhead{#1}]%
	\else
		\@makeschapterhead{#1}%
		\@afterheading
	\fi}

\def\@makeschapterhead#1{%
	\vspace*{50\p@}%
	{\parindent \z@ \raggedright
		\normalfont
		\interlinepenalty\@M
		\Huge \bfseries  #1\par\nobreak
		\vskip 40\p@}}
  
\newcommand\section{\@startsection {section}{1}{\z@}%
	{-3.5ex \@plus -1ex \@minus -.2ex}%
	{2.3ex \@plus.2ex}%
	{\normalfont\Large\bfseries}}
	
\newcommand\subsection{\@startsection{subsection}{2}{\z@}%
	{-3.25ex\@plus -1ex \@minus -.2ex}%
	{1.5ex \@plus .2ex}%
	{\normalfont\large\bfseries}}
	
\newcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
	{-3.25ex\@plus -1ex \@minus -.2ex}%
	{1.5ex \@plus .2ex}%
	{\normalfont\normalsize\bfseries}}
	
\newcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
	{3.25ex \@plus1ex \@minus.2ex}%
	{-1em}%
	{\normalfont\normalsize\bfseries}}
	
\newcommand\subparagraph{\@startsection{subparagraph}{5}{\parindent}%
	{3.25ex \@plus1ex \@minus .2ex}%
	{-1em}%
	{\normalfont\normalsize\bfseries}}

\if@twocolumn
	\setlength\leftmargini  {2em}
\else
	\setlength\leftmargini  {2.5em}
\fi

\leftmargin  \leftmargini
\setlength\leftmarginii  {2.2em}
\setlength\leftmarginiii {1.87em}
\setlength\leftmarginiv  {1.7em}

\if@twocolumn
	\setlength\leftmarginv  {.5em}
	\setlength\leftmarginvi {.5em}
\else
	\setlength\leftmarginv  {1em}
	\setlength\leftmarginvi {1em}
\fi

\setlength  \labelsep  {.5em}
\setlength  \labelwidth{\leftmargini}
\addtolength\labelwidth{-\labelsep}
\@beginparpenalty -\@lowpenalty
\@endparpenalty   -\@lowpenalty
\@itempenalty     -\@lowpenalty
\renewcommand\theenumi{\@arabic\c@enumi}
\renewcommand\theenumii{\@alph\c@enumii}
\renewcommand\theenumiii{\@roman\c@enumiii}
\renewcommand\theenumiv{\@Alph\c@enumiv}
\newcommand\labelenumi{\theenumi.}
\newcommand\labelenumii{(\theenumii)}
\newcommand\labelenumiii{\theenumiii.}
\newcommand\labelenumiv{\theenumiv.}
\renewcommand\p@enumii{\theenumi}
\renewcommand\p@enumiii{\theenumi(\theenumii)}
\renewcommand\p@enumiv{\p@enumiii\theenumiii}
\newcommand\labelitemi{\textbullet}
\newcommand\labelitemii{\normalfont\bfseries \textendash}
\newcommand\labelitemiii{\textasteriskcentered}
\newcommand\labelitemiv{\textperiodcentered}

\newenvironment{description}
	{\list{}{\labelwidth\z@ \itemindent-\leftmargin
		\let\makelabel\descriptionlabel}}
	{\endlist}

\newcommand*\descriptionlabel[1]{\hspace\labelsep
	\normalfont\bfseries #1}

\newenvironment{verse}
	{\let\\\@centercr
		\list{}{\itemsep      \z@
			\itemindent   -1.5em%
			\listparindent\itemindent
			\rightmargin  \leftmargin
			\advance\leftmargin 1.5em}%
		\item\relax}
	{\endlist}

\newenvironment{quotation}
	{\list{}{\listparindent 1.5em%
		\itemindent    \listparindent
		\rightmargin   \leftmargin
		\parsep        \z@ \@plus\p@}%
		\item\relax}
	{\endlist}

\newenvironment{quote}
	{\list{}{\rightmargin\leftmargin}%
		\item\relax}
	{\endlist}

\newcommand\appendix{\par
	\setcounter{chapter}{0}%
	\setcounter{section}{0}% MIGHT NOT BE NECESSARY
	\gdef\@chapapp{\appendixname}%
	\gdef\thechapter{\@Alph\c@chapter}}

\setlength\arraycolsep{5\p@}
\setlength\tabcolsep{6\p@}
\setlength\arrayrulewidth{.4\p@}
\setlength\doublerulesep{2\p@}
\setlength\tabbingsep{\labelsep}
\skip\@mpfootins = \skip\footins
\setlength\fboxsep{3\p@}
\setlength\fboxrule{.4\p@}

\@addtoreset {equation}{chapter}
\renewcommand\theequation
	{\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@equation}

\newcounter{figure}[chapter]
\renewcommand \thefigure
	{\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@figure}
\def\fps@figure{tbp}
\def\ftype@figure{1}
\def\ext@figure{lof}
\def\fnum@figure{\figurename\nobreakspace\thefigure}


\newenvironment{figure}
	{\figures@in@document\@float{figure}}
	{\end@float}

\def\figures@in@document {%
    \immediate\write\@mainaux {\global\string\figurestrue}%
    \global\let\figures@in@document\empty}

\newenvironment{figure*}
	{\@dblfloat{figure}}
	{\end@dblfloat}

\newcounter{table}[chapter]
\renewcommand \thetable
	{\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@table}
\def\fps@table{tbp}
\def\ftype@table{2}
\def\ext@table{lot}
\def\fnum@table{\tablename\nobreakspace\thetable}

\newenvironment{table}
	{\tables@in@document\@float{table}}
	{\end@float}

\def\tables@in@document {%
    \immediate\write\@mainaux {\global\string\tablestrue}%
    \global\let\tables@in@document\empty}

\newenvironment{table*}
	{\@dblfloat{table}}
	{\end@dblfloat}

\newcounter{plate}[chapter]
\renewcommand \theplate
	{\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@plate}
\def\fps@plate{tbp}
\def\ftype@plate{3}
\def\ext@plate{lop}
\def\fnum@plate{\platename\nobreakspace\theplate}

\newenvironment{plate}
	{\plates@in@document\@float{plate}}
	{\end@float}

\def\plates@in@document {%
    \immediate\write\@mainaux {\global\string\platestrue}%
    \global\let\plates@in@document\empty}

\newenvironment{plate*}
	{\@dblfloat{plate}}
	{\end@dblfloat}

\newlength\abovecaptionskip
\setlength\abovecaptionskip{10\p@}

\newlength\belowcaptionskip
\setlength\belowcaptionskip{0\p@}

\long\def\@makecaption#1#2{%
	\vskip\abovecaptionskip
	\sbox\@tempboxa{#1: #2}%
	\ifdim \wd\@tempboxa >\hsize
		#1: #2\par
	\else
		\global \@minipagefalse
		\hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
	\fi
	\vskip\belowcaptionskip}

\DeclareOldFontCommand{\rm}{\normalfont\rmfamily}{\mathrm}
\DeclareOldFontCommand{\sf}{\normalfont\sffamily}{\mathsf}
\DeclareOldFontCommand{\tt}{\normalfont\ttfamily}{\mathtt}
\DeclareOldFontCommand{\bf}{\normalfont\bfseries}{\mathbf}
\DeclareOldFontCommand{\it}{\normalfont\itshape}{\mathit}
\DeclareOldFontCommand{\sl}{\normalfont\slshape}{\@nomath\sl}
\DeclareOldFontCommand{\sc}{\normalfont\scshape}{\@nomath\sc}
\DeclareRobustCommand*\cal{\@fontswitch\relax\mathcal}
\DeclareRobustCommand*\mit{\@fontswitch\relax\mathnormal}

\newcommand\tableofcontents{%
	\if@openright\cleardoublepage\else\clearpage\fi
	\thispagestyle{plain}%
	\if@twocolumn
		\@restonecoltrue\onecolumn
	\else
		\@restonecolfalse
	\fi
	\if@twocolumn
		\@topnewpage[\@makeschapterhead{\contentsname
		\@mkboth{%
			\MakeUppercase\contentsname}{\MakeUppercase\contentsname}}]%
	\else
		\@makeschapterhead{\contentsname
		\@mkboth{%
			\MakeUppercase\contentsname}{\MakeUppercase\contentsname}}%
		\@afterheading
	\fi%
	\@starttoc{toc}%
	\if@restonecol\twocolumn\fi
	}
\newcommand*\l@chapter[2]{%
	\ifnum \c@tocdepth >\m@ne
		\addpenalty{-\@highpenalty}%
		\vskip 1.0em \@plus\p@
		\setlength\@tempdima{1.5em}%
		\begingroup
			\parindent \z@ \rightskip \@pnumwidth
			\parfillskip -\@pnumwidth
			\leavevmode \bfseries
			\advance\leftskip\@tempdima
			\hskip -\leftskip
			#1\nobreak\hfil \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
			\penalty\@highpenalty
		\endgroup
	\fi}
\newcommand*\l@section{\@dottedtocline{1}{1.5em}{2.3em}}
\newcommand*\l@subsection{\@dottedtocline{2}{3.8em}{3.2em}}
\newcommand*\l@subsubsection{\@dottedtocline{3}{7.0em}{4.1em}}
\newcommand*\l@paragraph{\@dottedtocline{4}{10em}{5em}}
\newcommand*\l@subparagraph{\@dottedtocline{5}{12em}{6em}}

\newcommand\listoffigures{%
	\iffigures
		\if@twocolumn
			\@restonecoltrue\onecolumn
		\else
			\@restonecolfalse
		\fi
		\chapter*{\listfigurename}%
		\addcontentsline{toc}{chapter}{\listfigurename}
		\@mkboth{\MakeUppercase\listfigurename}%
				{\MakeUppercase\listfigurename}%
		\@starttoc{lof}%
		\if@restonecol
			\twocolumn
		\fi
	\fi}
\newcommand*\l@figure{\@dottedtocline{1}{1.5em}{2.3em}}

\newcommand\listoftables{%
	\iftables
		\if@twocolumn
			\@restonecoltrue\onecolumn
		\else
			\@restonecolfalse
		\fi
		\chapter*{\listtablename}%
		\addcontentsline{toc}{chapter}{\listtablename}
		\@mkboth{\MakeUppercase\listtablename}%
				{\MakeUppercase\listtablename}%
		\@starttoc{lot}%
		\if@restonecol
			\twocolumn
		\fi
	\fi}
\let\l@table\l@figure

\newcommand\listofplates{%
	\ifplates
		\if@twocolumn
			\@restonecoltrue\onecolumn
		\else
			\@restonecolfalse
		\fi
		\chapter*{\listplatename}%
		\addcontentsline{toc}{chapter}{\listplatename}
		\@mkboth{\MakeUppercase\listplatename}%
				{\MakeUppercase\listplatename}%
		\@starttoc{lop}%
		\if@restonecol
			\twocolumn
		\fi
	\fi}
\let\l@plate\l@figure

\newcommand\makeabstract{%
	\ifdefvoid{\@abstracttext}{}{%
		\chapter*{\abstractname}
		\addcontentsline{toc}{chapter}{\abstractname}
		\@mkboth{\MakeUppercase\abstractname}%
				{\MakeUppercase\abstractname}
		\truedoublespacing\@abstracttext}}

\newcommand\listofsymbols{\printnomenclature}

\newcommand\makepreface{%
	\ifdefvoid{\@preface}{}{%
		\chapter*{\prefacename}
		\addcontentsline{toc}{chapter}{\prefacename}
		\@mkboth{\MakeUppercase\prefacename}%
				{\MakeUppercase\prefacename}
		\@preface}}

\newcommand\acknowledgements{%
	\ifdefvoid{\@acknowledgementtext}{}{
		\chapter*{\acknowledgementname}
		\addcontentsline{toc}{chapter}{\acknowledgementname}
		\@mkboth{\MakeUppercase\acknowledgementname}%
				{\MakeUppercase\acknowledgementname}
		\@acknowledgementtext}}

\newcommand\makequote{%
	\ifdefvoid{\@thesisquote}{}{\chapter*{}
		% \addcontentsline{toc}{chapter}{\quotename}
		% \@mkboth{\MakeUppercase\quotename}%
				% {\MakeUppercase\quotename}
		\@mkboth{}%
				{}
		\begin{center}\em \@thesisquote \em\end{center}}}

\newcommand\makededication{%
	\ifdefvoid{\@dedication}{}{\chapter*{}
		% \addcontentsline{toc}{chapter}{\dedicationname}
		% \@mkboth{\MakeUppercase\dedicationname}%
				% {\MakeUppercase\dedicationname}
		\@mkboth{}%
				{}
		\begin{center}\em \@dedication \em\end{center}}}

\newcommand\makededicationandquote{%
	\ifdefvoid{\@dedication}{\makequote}{%
		\ifdefvoid{\@thesisquote}{\makededication}{%
			\chapter*{}
			%\addcontentsline{toc}{chapter}{\quoteanddedicationname}
			%\@mkboth{\MakeUppercase\quoteanddedicationname}%
			%		{\MakeUppercase\quoteanddedicationname}
			\@mkboth{}%
					{}
			\vfill\begin{center}\em \@dedication \em\end{center}\vfill\begin{center}\em \@thesisquote \em\end{center}\vfill}}}


\def\bodyoftext{%
	\if@chapterbib\preto{\chapter}{\clearpage\printbibliography[segment=\thebaseSection,heading=subbibintoc,title=References]}\fi%
	\newpage
	\setlength{\parindent}{2.6ex}
	\setcounter{page}{0}
	\pagenumbering{arabic}
	\if@fancyheaders
		\pagestyle{headings}
	\else
		\pagestyle{plain}
	\fi
}

\renewcommand\footnoterule{%
	\kern-3\p@
	\hrule\@width.4\columnwidth
	\kern2.6\p@}
	
\@addtoreset{footnote}{chapter}
\newcommand\@makefntext[1]{%
	\parindent 1em%
	\noindent
	\hb@xt@1.8em{\hss\@makefnmark}#1}
	
\newcommand\abbreviationsname{Abbreviations}
\newcommand\abstractname{Abstract}
\newcommand\acknowledgementname{Acknowledgements}
\newcommand\appendixname{Appendix}
\newcommand\bibname{Bibliography}
\newcommand\chaptername{Chapter}
\newcommand\contentsname{Table of Contents}
\newcommand\dedicationname{Dedication}
\newcommand\figurename{Figure}
\newcommand\glossaryname{Glossary of Terms}
\newcommand\indexname{Index}
\newcommand\listfigurename{List of Figures}
\newcommand\listplatename{List of Plates}
\newcommand\listsymbolname{List of Symbols}
\newcommand\listtablename{List of Tables}
\newcommand\platename{Plate}
\newcommand\prefacename{Preface}
\newcommand\quotename{Quote}
\newcommand\quoteanddedicationname{\quotename\ \&\ \dedicationname}
\newcommand\tablename{Table}

\setlength\columnsep{10\p@}
\setlength\columnseprule{0\p@}

% CONTROL THE BOTTOM OF THE PAGE WHEN IN TWOSIDED
\if@twoside
	\raggedbottom
\else
	\raggedbottom
\fi
\if@twocolumn
	\twocolumn
	\sloppy
	\flushbottom
\else
	\onecolumn
\fi

\newcommand{\insertappendix}[1]{
	\input{"\@addappendices#1.tex"}}

\newcommand{\insertchapter}[1]{
	\input{"\@addchapters#1.tex"}}

\newcommand{\insertlatexfile}[1]{%
    \input{"\@addlatexfiles#1.tex"}}

\newcommand{\insertimage}[1]{%
    "\@addimages#1"}

\newcommand{\inserttable}[1]{%
    \input{"\@addtables#1.tex"}}

\newcommand{\insertpdf}[1]{%
    \input{"\@addpdf#1"}}

\newcommand{\insertdata}[1]{%
	\input{"\@adddata#1"}}

\if@pdfa
	\usepackage[a-3b]{pdfx}
\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                            MARGIN AND PAGE SETUP                             %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage[
	\@paperoption,
	left=1in,
	right=1.5in,
	headheight=0.25in,
	headsep=0.25in,
	textwidth=6.75in,
	textheight=8.5in,
	\@landscape
]{geometry}

\AtBeginDocument{
	\@ifpackageloaded{pdfpages}{
		\if@fancyheaders
			\includepdfset{pages=-,scale=0.85,pagecommand=\thispagestyle{headings}}
		\else
			\includepdfset{pages=-,scale=0.85,pagecommand=\thispagestyle{plain}}
		\fi
	}{}
}

\endinput


