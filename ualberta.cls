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
              [2024/08/081 V:2.0.0 ualberta Document Class]
\pdfminorversion=7
\usepackage{etoolbox}

\newcommand\settoclevel[1]{\setcounter{secnumdepth}{#1}\setcounter{tocdepth}{#1}}

\newcommand\convocationdate[1]{\renewcommand\@convocationdate{#1}}
\newcommand\@convocationdate{}
 
\newcommand\specialization[1]{\renewcommand\@specialization{\def\temp{#1}\ifx\temp\empty
		~\\[8\baselineskip]
		\else
		~\\[1\baselineskip]
		in
		~\\[1\baselineskip]
		#1
		~\\[4\baselineskip]
		\fi
}}
\newcommand\@specialization{~\\[8\baselineskip]}

\newcommand\department[1]{\renewcommand\@department{\def\temp{#1}\ifx\temp\empty
		
		\else
		Department of #1
		\fi
}}
\newcommand\@department{}

\newcommand\faculty[1]{\renewcommand\@faculty{\def\temp{#1}\ifx\temp\empty
		
		\else
		Faculty of #1
		\fi
}}
\newcommand\@faculty{}

\newcommand\degree[1]{\renewcommand\@degree{#1}}
\newcommand\@degree{}

\newcommand\abstracttext[1]{\renewcommand\@abstracttext{#1}}
\newcommand\@abstracttext{}

\newcommand\keywords[1]{\renewcommand\@keywords{#1}}
\newcommand\@keywords{}

\newcommand\thesisquote[1]{\renewcommand\@thesisquote{#1}}
\newcommand\@thesisquote{}

\newcommand\preface[1]{\renewcommand\@preface{#1}}
\newcommand\@preface{}

\newcommand\dedication[1]{\renewcommand\@dedication{#1}}
\newcommand\@dedication{}

\newcommand\acknowledgementtext[1]{\renewcommand\@acknowledgementtext{#1}}
\newcommand\@acknowledgementtext{}

\newcommand{\singlespacing}{\baselineskip 1em}
\newcommand{\onehalfspacing}{\baselineskip 1.50em}
\newcommand{\doublespacing}{\baselineskip 1.75em}
\newcommand{\truedoublespacing}{\baselineskip 2em}
\newcommand{\normalspacing}{\baselineskip 1em}
\newcommand{\triplespacing}{\baselineskip 3em}

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

\def\PhD{Doctor of Philosophy}
\def\PHD{Doctor of Philosophy}
\def\phd{Doctor of Philosophy}

\def\MSc{Master of Science}
\def\MSC{Master of Science}
\def\msc{Master of Science}

\def\MEd{Master of Education}
\def\MED{Master of Education}
\def\med{Master of Education}

\def\MBA{Master of Business Administration}
\def\mba{Master of Business Administration}

\def\MAc{Master of Accounting}
\def\MAC{Master of Accounting}
\def\mac{Master of Accounting}

\def\MFM{Master of Financial Management}
\def\mfm{Master of Financial Management}

\def\MA{Master of Arts}
\def\ma{Master of Arts}

\def\MN{Master of Nursing}
\def\mn{Master of Nursing}

\def\LLM{Master of Laws}
\def\llm{Master of Laws}

\def\MMus{Master of Music}
\def\MMUS{Master of Music}
\def\mmus{Master of Music}

\def\@year{\number\year}
\newcommand\@ptsize{}
\newif\if@restonecol
\newif\if@titlepage
\@titlepagetrue
\newif\if@openright
\newif\if@chapterbib
\@chapterbibfalse
\newif\if@pdfa
\@pdfafalse
\if@compatibility
\else
  \DeclareOption{a4paper}
     {\setlength\paperheight {297mm}%
      \setlength\paperwidth  {210mm}}
  \DeclareOption{a5paper}
     {\setlength\paperheight {210mm}%
      \setlength\paperwidth  {148mm}}
  \DeclareOption{b5paper}
     {\setlength\paperheight {250mm}%
      \setlength\paperwidth  {176mm}}
  \DeclareOption{letterpaper}
     {\setlength\paperheight {11in}%
      \setlength\paperwidth  {8.5in}}
  \DeclareOption{legalpaper}
     {\setlength\paperheight {14in}%
      \setlength\paperwidth  {8.5in}}
  \DeclareOption{executivepaper}
     {\setlength\paperheight {10.5in}%
      \setlength\paperwidth  {7.25in}}
  \DeclareOption{landscape}
     {\setlength\@tempdima   {\paperheight}%
      \setlength\paperheight {\paperwidth}%
      \setlength\paperwidth  {\@tempdima}}
\fi

\if@compatibility
  \renewcommand\@ptsize{0}
\else
  \DeclareOption{10pt}{\renewcommand\@ptsize{0}}
\fi

\DeclareOption{11pt}{\renewcommand\@ptsize{1}}
\DeclareOption{12pt}{\renewcommand\@ptsize{2}}

\if@compatibility
\else
  \DeclareOption{oneside}{\@twosidefalse \@mparswitchfalse}
\fi

\DeclareOption{twoside}{\@twosidetrue  \@mparswitchtrue \@openrighttrue}
\DeclareOption{draft}{\setlength\overfullrule{5pt}}

\if@compatibility
\else
  \DeclareOption{final}{\setlength\overfullrule{0pt}}
\fi

\DeclareOption{titlepage}{\@titlepagetrue}

\if@compatibility
\else
  \DeclareOption{notitlepage}{\@titlepagefalse}
\fi

\if@compatibility
\else
  \DeclareOption{openright}{\@openrighttrue}
  \DeclareOption{openany}{\@openrightfalse}
\fi

\if@compatibility
\else
  \DeclareOption{onecolumn}{\@twocolumnfalse}
\fi

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
    \renewcommand\newblock{\par}}%
}
\DeclareOption{pdfa}{\@pdfatrue}
\DeclareOption{chapterbib}{\@chapterbibtrue}
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
	\raggedbottom
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
	\let\sectionmark\@gobble
}

\newcommand\maketitle{%
	\hypersetup{pageanchor=false}
	\begin{titlepage}%
		\let\footnotesize\small
		\let\footnoterule\relax
		\let \footnote \thanks
		\pagenumbering{roman}
		\thispagestyle{empty}
		\vfill
		\vspace*{1.75\baselineskip}
		\begin{center}
			{\sc \bf \@title}
				~\\[0.5\baselineskip]
			by
				~\\[0.5\baselineskip]
			{\@author}
		\end{center}
		\vspace{5\baselineskip}

		\begin{center}
			A thesis submitted in partial fulfillment of the requirements for the degree of
			~\\[1.25\baselineskip]
			{\@degree}
			\@specialization
		\end{center}
		\centerline{\@faculty\@department}
		\centerline{University of Alberta}
		\vspace{8.5\baselineskip}

		\begin{center}
			\copyright{} \@author, \@convocationdate
		\end{center}
		\newpage
	\end{titlepage}%
	\hypersetup{pageanchor=true}
	\pagestyle{plain}\pagenumbering{roman}\setcounter{page}{2}
	\setcounter{footnote}{0}%
	\global\let\thanks\relax
	\global\let\maketitle\relax
	\global\let\@thanks\@empty
	%\global\let\@author\@empty
	%\global\let\@convocationdate\@empty
	%\global\let\@title\@empty
	\global\let\title\relax
	\global\let\author\relax
	\global\let\convocationdate\relax
	\global\let\and\relax
}

\newcommand*\chaptermark[1]{}
\setcounter{secnumdepth}{2}
\newcounter {chapter}
\newcounter {section}[chapter]
\newcounter {subsection}[section]
\newcounter {subsubsection}[subsection]
\newcounter {paragraph}[subsubsection]
\newcounter {subparagraph}[paragraph]
\renewcommand \thechapter {\@arabic\c@chapter}
\renewcommand \thesection {\thechapter.\@arabic\c@section}
\renewcommand \thesubsection   {\thesection.\@arabic\c@subsection}
\renewcommand \thesubsubsection{\thesubsection.\@arabic\c@subsubsection}
\renewcommand \theparagraph    {\thesubsubsection.\@arabic\c@paragraph}
\renewcommand \thesubparagraph {\theparagraph.\@arabic\c@subparagraph}
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
		{\protect\numberline{\thechapter}#1}%
	\else
		\addcontentsline{toc}{chapter}{#1}%
	\fi
	\chaptermark{#1}%
	\addtocontents{lof}{\protect\addvspace{10\p@}}%
	\addtocontents{lot}{\protect\addvspace{10\p@}}%
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

\if@compatibility
	\newenvironment{titlepage}
		{%
			\if@twocolumn
				\@restonecoltrue\onecolumn
			\else
				\@restonecolfalse\newpage
			\fi
			\thispagestyle{empty}%
			\setcounter{page}\z@
		}%
		{\if@restonecol\twocolumn \else \newpage \fi}
\else
	\newenvironment{titlepage}
		{%
			\if@twocolumn
				\@restonecoltrue\onecolumn
			\else
				\@restonecolfalse\newpage
			\fi
			\thispagestyle{empty}%
			\setcounter{page}\@ne
		}%
		{%
			\if@restonecol\twocolumn \else \newpage \fi
			\if@twoside
				\null\thispagestyle{empty}
			\else
				\setcounter{page}\@ne
			\fi
		}
\fi

\newcommand\appendix{\par
	\setcounter{chapter}{0}%
	\setcounter{section}{0}%
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
	{\@float{figure}}
	{\end@float}

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
	{\@float{table}}
	{\end@float}

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
	{\@float{plate}}
	{\end@float}

\newenvironment{plate*}
	{\@dblfloat{plate}}
	{\end@dblfloat}

\newlength\abovecaptionskip
\newlength\belowcaptionskip
\setlength\abovecaptionskip{10\p@}
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

\setcounter{tocdepth}{2}
\newcommand\tableofcontents{%
	\if@twocolumn
		\@restonecoltrue\onecolumn
	\else
		\@restonecolfalse
	\fi
	\chapter*{\contentsname
		\@mkboth{%
			\MakeUppercase\contentsname}{\MakeUppercase\contentsname}}%
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
	\if@twocolumn
		\@restonecoltrue\onecolumn
	\else
		\@restonecolfalse
	\fi
	\chapter*{\listfigurename}%
		\@mkboth{\MakeUppercase\listfigurename}%
				{\MakeUppercase\listfigurename}%
	\@starttoc{lof}%
	\if@restonecol\twocolumn\fi
	}
\newcommand*\l@figure{\@dottedtocline{1}{1.5em}{2.3em}}

\newcommand\listoftables{%
	\if@twocolumn
		\@restonecoltrue\onecolumn
	\else
		\@restonecolfalse
	\fi
	\chapter*{\listtablename}%
		\@mkboth{%
			\MakeUppercase\listtablename}%
		{\MakeUppercase\listtablename}%
	\@starttoc{lot}%
	\if@restonecol\twocolumn\fi
	}
\let\l@table\l@figure

\newcommand\listofplates{%
	\if@twocolumn
		\@restonecoltrue\onecolumn
	\else
		\@restonecolfalse
	\fi
	\chapter*{\listplatename}%
		\@mkboth{\MakeUppercase\listplatename}%
				{\MakeUppercase\listplatename}%
	\@starttoc{lop}%
	\if@restonecol\twocolumn\fi
}
\let\l@plate\l@figure

\newdimen\bibindent
\setlength\bibindent{1.5em}
\newenvironment{thebibliography}[1]
	{\chapter*{\bibname}%
		\@mkboth{\MakeUppercase\bibname}{\MakeUppercase\bibname}%
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
		\sfcode`\.\@m}
	{\def\@noitemerr
		{\@latex@warning{Empty `thebibliography' environment}}%
		\endlist}
\newcommand\newblock{\hskip .11em\@plus.33em\@minus.07em}
\let\@openbib@code\@empty

\newcommand\makeabstract{\chapter*{\abstractname}\pagestyle{plain}\thispagestyle{plain}\truedoublespacing\@abstracttext}

\newcommand\listofsymbols{\pagestyle{plain}\thispagestyle{plain}\printnomenclature}

\newcommand\makepreface{\chapter*{\prefacename}\pagestyle{plain}\thispagestyle{plain}\@preface}

\newcommand\acknowledgements{\chapter*{\acknowledgementname}\pagestyle{plain}\thispagestyle{plain}\@acknowledgementtext}

\newcommand\makequote{\chapter*{}\begin{center}\em \@thesisquote \em\end{center}}

\newcommand\makededication{\chapter*{}\begin{center}\em \@dedication \em\end{center}}

\newcommand\makededicationandquote{\chapter*{}\vfill\begin{center}\em \@dedication \em\end{center}\vfill\begin{center}\em \@thesisquote \em\end{center}\vfill}


\def\bodyoftext{%
	\if@chapterbib\preto{\chapter}{\clearpage\printbibliography[segment=\thebaseSection,heading=subbibintoc,title=References]}\fi%
	\newpage
	\setlength{\parindent}{2.6ex}
	\setcounter{page}{0}
	\pagestyle{plain}
	\pagenumbering{arabic}
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
\newcommand\contentsname{Table of Contents}
\newcommand\listfigurename{List of Figures}
\newcommand\listtablename{List of Tables}
\newcommand\listsymbolname{List of Symbols}
\newcommand\listplatename{List of Plates}
\newcommand\bibname{Bibliography}
\newcommand\indexname{Index}
\newcommand\figurename{Figure}
\newcommand\tablename{Table}
\newcommand\platename{Plate}
\newcommand\chaptername{Chapter}
\newcommand\appendixname{Appendix}
\newcommand\abstractname{Abstract}
\newcommand\prefacename{Preface}
\newcommand\abbreviationsname{Abbreviations}
\newcommand\glossaryname{Glossary of Terms}
\newcommand\acknowledgementname{Acknowledgements}

\newcommand\appendix@chapter[1]{%
	\refstepcounter{chapter}%
	\orig@chapter*{Appendix \@Alph\c@chapter: #1}%
	\addcontentsline{toc}{chapter}{Appendix \@Alph\c@chapter: #1}%
}
\let\orig@chapter\chapter
\g@addto@macro\appendix{\let\chapter\appendix@chapter}

\def\today{\ifcase\month\or
	January\or February\or March\or April\or May\or June\or
	July\or August\or September\or October\or November\or December\fi
	\space\number\day, \number\year}
\setlength\columnsep{10\p@}
\setlength\columnseprule{0\p@}
\pagestyle{plain}
\pagenumbering{arabic}
\if@twoside
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

% \oddsidemargin 0.5in
% \evensidemargin 0in
% \textwidth 6in
% \topmargin 0in
% \headheight 0in
% \headsep 0in
% \textheight 9in

\RequirePackage[heightrounded]{geometry}
\geometry{
  left=1.5in,       % Equivalent to setting the left margin
  right=1in,    % Adjusts the right margin for a 6in text width
  top=1in,        % Adjusts the top margin
  bottom=1in,     % This will be adjusted to achieve the desired text height
  headheight=0in, % No space for the header
  headsep=0in,    % No separation between header and text
}

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

\endinput


