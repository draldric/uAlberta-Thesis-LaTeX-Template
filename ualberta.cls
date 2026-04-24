%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                         uAlberta Thesis Class File                         %%
%%                                     by                                     %%
%%                               Daniel Aldrich                               %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                              %
%       Copyright (c) 2026 Daniel Aldrich                                      %
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
              [2026/04/03 V:3.0.0 ualberta Document Class]
\pdfminorversion=7
\RequirePackage{iftex}
\ifPDFTeX
	% If compiling with standard pdflatex (99% of users)
	\RequirePackage[T1]{fontenc}
\else
	% If compiling with modern XeLaTeX or LuaLaTeX
	\RequirePackage{fontspec}
\fi
\RequirePackage{etoolbox}
\RequirePackage{xstring}
\RequirePackage{morewrites}
\RequirePackage{catchfile}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                            LINE SPACING COMMANDS                             %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{setspace}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                DATE COMMANDS                                 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\today{\ifcase\month\or
	January\or February\or March\or April\or May\or June\or
	July\or August\or September\or October\or November\or December\fi
	\space\number\day, \number\year}

\def\@year{\number\year}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                   NEW IFS                                    %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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

\newif\if@colourlinks
\@colourlinksfalse

\newif\iffigures

\newif\iftables

\newif\ifplates

\newif\ifphotos

\newif\ifvideos

\newif\ifsounds

\newif\ifillustrations

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                               THESIS COMMANDS                                %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% CONVOCATION DATE
	\newcommand\convocationdate[1]{\renewcommand\@convocationdate{#1}}
	\newcommand\@convocationdate{\the\year}

% SPECIALIZATION
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

% DEPARTMENT OR FACULTY
	\newcommand\deptfac[1]{%
		\renewcommand\@deptfac{
			\def\deptfactemp{#1}
			\ifx\deptfactemp\empty
			\else
				#1
			\fi}}
	\newcommand\@deptfac{}

% UNIVERSITY
	\newcommand\university[1]{\renewcommand\@university{#1}}
	\newcommand\@university{University of Alberta}

% DEGREE
	\newcommand\degree[1]{\renewcommand\@degree{#1}}
	\newcommand\@degree{Select or Enter a Degree}

% CREATIVE COMMONS
	\newcommand\creativecommons[1]{\renewcommand\@creativecommons{#1}}
	\newcommand\@creativecommons{Select or Enter a Creative Commons License}

% ABSTRACT
	\newcommand\abstracttext[1]{%
		\renewcommand\@abstracttext{#1}
		\StrSubstitute{\@abstracttext}{\par}{ }[\@cleanabstract]}
	\newcommand\setabstracttext[1][./01_Prefatory/Abstract]{%
		\CatchFileDef{\@abstracttext}{#1}{}
		\StrSubstitute{\@abstracttext}{\par}{ }[\@cleanabstract]}
	\newcommand\@abstracttext{}

% KEYWORDS
	\newcommand\keywords[1]{\renewcommand\@keywords{#1}}
	\newcommand\@keywords{}

% PREFACE
	\newcommand\prefacetext[1]{%
		\renewcommand\@prefacetext{%
			\ifblank{#1}{%
				This thesis is an original work by \@author. No part of this thesis has been previously published.
			}{%
				#1}}}
	\newcommand\setprefacetext[1][./01_Prefatory/Preface]{%
		\CatchFileDef{\@prefacetext}{#1}{}}
	\newcommand\@prefacetext{This thesis is an original work by \@author. No part of this thesis has been previously published.}

% QUOTE
	\newcommand\quotetext[1]{\renewcommand\@quotetext{#1}}
	\newcommand\setquotetext[1][./01_Prefatory/Quote]{%
		\CatchFileDef{\@quotetext}{#1}{}}
	\newcommand\@quotetext{ }

% DEDICATION
	\newcommand\dedicationtext[1]{\renewcommand\@dedicationtext{#1}}
	\newcommand\setdedicationtext[1][./01_Prefatory/Dedication]{%
		\CatchFileDef{\@dedicationtext}{#1}{}}
	\newcommand\@dedicationtext{ }

% ACKNOWLEDGEMENT
	\newcommand\acknowledgementtext[1]{\renewcommand\@acknowledgementtext{#1}}
	\newcommand\setacknowledgementtext[1][./01_Prefatory/Acknowledgement]{%
		\CatchFileDef{\@acknowledgementtext}{#1}{}}
	\newcommand\@acknowledgementtext{ }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                             FORMATTING COMMANDS                              %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand\settoclevel[1]{\setcounter{secnumdepth}{#1}\setcounter{tocdepth}{#1}}
\settoclevel{3}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                            FILE LOCATION COMMANDS                            %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% --- LATEX SETUP FILES ---
\newcommand\setlatexfiledir[1]{\renewcommand\@latexfiledir{\detokenize{#1}}}
\newcommand\@latexfiledir{./00\_LaTeX\_Files/}
\newcommand{\insertlatexfile}[1]{\input{\@latexfiledir\detokenize{#1}}}

% --- PREFATORY (Frontmatter) ---
\newcommand\setprefatorydir[1]{\renewcommand\@prefatorydir{\detokenize{#1}}}
\newcommand\@prefatorydir{./01\_Prefatory/}
\newcommand{\insertprefatory}[1]{\input{\@prefatorydir\detokenize{#1}}}

% --- CHAPTERS (Main Content) ---
\newcommand\setchapterdir[1]{\renewcommand\@chapterdir{\detokenize{#1}}}
\newcommand\@chapterdir{./02\_Chapters/}
\newcommand{\insertchapter}[1]{%
	\input{\@chapterdir\detokenize{#1}}%
	\if@chapterbib%
		\begin{singlespace}
			\printbibliography[segment=\therefsegment,heading=subbibintoc,title=References]
		\end{singlespace}
	\fi%
}

% --- APPENDICES ---
\newcommand\setappendixdir[1]{\renewcommand\@appendixdir{\detokenize{#1}}}
\newcommand\@appendixdir{./04\_Appendices/}
\newcommand{\insertappendix}[1]{\input{\@appendixdir\detokenize{#1}}}

% --- MEDIA ROOT ---
\newcommand\setmediadir[1]{\renewcommand\@mediadir{\detokenize{#1}}}
\newcommand\@mediadir{./99\_Inclusions/}

% --- IMAGES ---
\newcommand\setimagedir[1]{\renewcommand\@imagesdir{\@mediadir\detokenize{#1}}}
\newcommand\@imagesdir{\@mediadir Images/}
\newcommand{\insertimage}[2][width=\textwidth]{%
	\includegraphics[#1]{\@imagesdir\detokenize{#2}}%
}

% --- TABLES ---
\newcommand{\settabledir}[1]{\renewcommand{\@tabledir}{\@mediadir\detokenize{#1}}}
\newcommand{\@tabledir}{\@mediadir Tables/}
\newcommand{\inserttable}[1]{%
	\begin{singlespace}
		\input{\@tabledir\detokenize{#1}}%
	\end{singlespace}
}

% --- CODE ---
\newcommand\setcodedir[1]{\renewcommand\@codedir{\@mediadir\detokenize{#1}}}
\newcommand\@codedir{\@mediadir Code/}
\newcommand{\insertcode}[2][]{%
	\begin{singlespace}
		\vspace{-\baselineskip}
		\lstinputlisting[#1]{\@codedir\detokenize{#2}}%
	\end{singlespace}
}

% --- PDFS ---
\newcommand\setpdfdir[1]{\renewcommand\@pdfdir{\@mediadir\detokenize{#1}}}
\newcommand\@pdfdir{\@mediadir Pdfs/}
\newcommand{\insertpdf}[2][]{%
	\includepdf[#1]{\@pdfdir\detokenize{#2}}%
}

% --- RAW DATA ---
\newcommand\setdatadir[1]{\renewcommand\@datadir{\@mediadir\detokenize{#1}}}
\newcommand\@datadir{\@mediadir Data/}
\newcommand\insertdata[1]{\@datadir\detokenize{#1}}

% --- PLOTS ---
\newcommand\setplotdir[1]{\renewcommand\@plotdir{\@mediadir\detokenize{#1}}}
\newcommand\@plotdir{\@mediadir Plots/}
\newcommand\insertplot[1]{\input{\@plotdir\detokenize{#1}}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                CLASS OPTIONS                                 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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

\DeclareOption{colourlinks}{\@colourlinkstrue}

\DeclareOption{a4paper}{\def\@paperoption{a4paper}}
\DeclareOption{letterpaper}{\def\@paperoption{letterpaper}}
\DeclareOption{legalpaper}{\def\@paperoption{legalpaper}}
\def\@paperoption{letterpaper} % Default paper size

\ExecuteOptions{letterpaper,12pt,oneside,onecolumn,final,openany}
\ProcessOptions

\input{size1\@ptsize.clo}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                             SET REQUIRED LENGTHS                             %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\setlength\lineskip{1\p@}
\setlength\normallineskip{1\p@}
\renewcommand\baselinestretch{}
\setlength\parskip{0\p@ \@plus \p@}
\@lowpenalty   51
\@medpenalty  151
\@highpenalty 301
\setlength\arraycolsep{5\p@}
\setlength\tabcolsep{6\p@}
\setlength\arrayrulewidth{.4\p@}
\setlength\doublerulesep{2\p@}
\setlength\tabbingsep{\labelsep}
\skip\@mpfootins = \skip\footins
\setlength\fboxsep{3\p@}
\setlength\fboxrule{.4\p@}
\setlength\columnsep{10\p@}
\setlength\columnseprule{0\p@}
\newlength\abovecaptionskip
\setlength\abovecaptionskip{10\p@}
\newlength\belowcaptionskip
\setlength\belowcaptionskip{0\p@}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                             HEADINGS DEFINITION                              %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\if@twoside
	\def\ps@headings{%
		\let\@oddfoot\@empty
		\let\@evenfoot\@empty
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
	\let\@oddfoot\@empty
	\let\@evenfoot\@empty
	\def\@evenhead{\thepage\hfil\slshape\leftmark}%
	\def\@oddhead{{\slshape\rightmark}\hfil\thepage}%
	\let\@mkboth\@gobbletwo
	\let\chaptermark\@gobble
	\let\sectionmark\@gobble}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                            TITLE PAGE GENERATION                             %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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
	\singlespacing
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
			\copyright{} \@author, \@convocationdate\\
			\@creativecommons
		\end{center}
		\newpage
	\end{titlepage}%
	\hypersetup{pageanchor=true}

	% SETUP PAGES FOR REST OF PREFATORY PAGES
		\if@fancyheaders
			\pagestyle{headings}
		\else
			\pagestyle{plain}
		\fi
		\pagenumbering{roman}\setcounter{page}{2}
		\setcounter{footnote}{0}%

	% GENERATE XMPDATA FILE
		\newwrite\myfile
		\immediate\openout\myfile=\jobname.xmpdata
		\immediate\write\myfile{\string\Title{\@title }}
		\immediate\write\myfile{\string\Author{\@author }}
		\immediate\write\myfile{\string\Subject{ \@cleanabstract } }
		\immediate\write\myfile{\string\Copyright{Copyright \string\copyright\ \@convocationdate\space\@author }}
		\immediate\closeout\myfile

	% CLEAR OUT OLD VARIABLES AND MACROS
		\global\let\maketitle\relax
		\global\let\title\relax
		\global\let\author\relax
		\global\let\convocationdate\relax
		\global\let\and\relax
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                        DOCUMENT STRUCTURE DEFINITIONS                        %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcounter{baseSection}
\setcounter{baseSection}{0}
\newcommand*\chaptermark[1]{}
\setcounter {secnumdepth}{2}
\newcounter {part}
\newcounter {chapter}
\newcounter {section}[chapter]
\newcounter {subsection}[section]
\newcounter {subsubsection}[subsection]
\newcounter {paragraph}[subsubsection]
\newcounter {subparagraph}[paragraph]
\renewcommand \thepart          {\@Roman\c@part}
\renewcommand \thechapter       {\@arabic\c@chapter}
\renewcommand \thesection       {\thechapter.\@arabic\c@section}
\renewcommand \thesubsection    {\thesection.\@arabic\c@subsection}
\renewcommand \thesubsubsection {\thesubsection.\@arabic\c@subsubsection}
\renewcommand \theparagraph     {\thesubsubsection.\@arabic\c@paragraph}
\renewcommand \thesubparagraph  {\theparagraph.\@arabic\c@subparagraph}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                              CHAPTER DEFINITION                              %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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
		{\if@saychapapp \@chapapp\ \fi\protect\numberline{\thechapter\if@saychapapp:\fi} #1}%
	\else
		\addcontentsline{toc}{chapter}{#1}%
	\fi
	\chaptermark{#1}%
	\addtocontents{lof}{\protect\addvspace{10\p@}}%
	\addtocontents{lot}{\protect\addvspace{10\p@}}%
	\addtocontents{lop}{\protect\addvspace{10\p@}}%
	\addtocontents{loh}{\protect\addvspace{10\p@}}%
	\addtocontents{loi}{\protect\addvspace{10\p@}}%
	\addtocontents{lov}{\protect\addvspace{10\p@}}%
	\addtocontents{los}{\protect\addvspace{10\p@}}%
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


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                             SECTION DEFINITIONS                              %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand\part{%
  \if@openright
    \cleardoublepage
  \else
    \clearpage
  \fi
  \thispagestyle{empty}%
  \null\vfil
  \secdef\@part\@spart}

\def\@part[#1]#2{%
    \ifnum \c@secnumdepth >-2\relax
      \refstepcounter{part}%
      \addcontentsline{toc}{part}{\partname\nobreakspace\thepart\hspace{1em}#1}%
    \else
      \addcontentsline{toc}{part}{#1}%
    \fi
    \markboth{}{}%
    {\centering
     \interlinepenalty \@M
     \normalfont
     \ifnum \c@secnumdepth >-2\relax
       \huge\bfseries \partname\nobreakspace\thepart
       \par
       \vskip 20\p@
     \fi
     \Huge \bfseries #2\par}%
    \@endpart}
\def\@spart#1{%
    {\centering
     \interlinepenalty \@M
     \normalfont
     \Huge \bfseries #1\par}%
    \@endpart}
\def\@endpart{\vfil\newpage
              \if@twoside
               \if@openright
                \null
                \thispagestyle{empty}%
                \newpage
               \fi
              \fi}

\newcommand\section{\@startsection{section}{1}{\z@}%
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


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                           LIST & LIST MARGIN SETUP                           %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                           ADDITIONAL ENVIRONMENTS                            %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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

\newcommand\appendix{%
	\par
	\setcounter{chapter}{0}%
	\setcounter{section}{0}% MIGHT NOT BE NECESSARY
	\gdef\@chapapp{\appendixname}%
	\gdef\thechapter{\@Alph\c@chapter}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                             SET REQUIRED LENGTHS                             %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\@addtoreset {equation}{chapter}
\renewcommand\theequation
	{\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@equation}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                 FLOAT SETUP                                  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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

% FIGURES
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

% TABLES
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

% PLATES
	\newcounter{plate}[chapter]
	\renewcommand \theplate
		{\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@plate}
	\def\fps@plate{tbp}
	\def\ftype@plate{4}
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

% PHOTOS
	\newcounter{photo}[chapter]
	\renewcommand \thephoto
		{\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@photo}
	\def\fps@photo{tbp}
	\def\ftype@photo{8}
	\def\ext@photo{loh}
	\def\fnum@photo{\photoname\nobreakspace\thephoto}

	\newenvironment{photo}
		{\photos@in@document\@float{photo}}
		{\end@float}

	\def\photos@in@document {%
		\immediate\write\@mainaux {\global\string\photostrue}%
		\global\let\photos@in@document\empty}

	\newenvironment{photo*}
		{\@dblfloat{photo}}
		{\end@dblfloat}

% VIDEOS
	\newcounter{video}[chapter]
	\renewcommand \thevideo
		{\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@video}
	\def\fps@video{tbp}
	\def\ftype@video{16}
	\def\ext@video{lov}
	\def\fnum@video{\videoname\nobreakspace\thevideo}

	\newenvironment{video}
		{\videos@in@document\@float{video}}
		{\end@float}

	\def\videos@in@document {%
		\immediate\write\@mainaux {\global\string\videostrue}%
		\global\let\videos@in@document\empty}

	\newenvironment{video*}
		{\@dblfloat{video}}
		{\end@dblfloat}

% ILLUSTRATIONS
	\newcounter{illustration}[chapter]
	\renewcommand \theillustration
		{\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@illustration}
	\def\fps@illustration{tbp}
	\def\ftype@illustration{32}
	\def\ext@illustration{loi}
	\def\fnum@illustration{\illustrationname\nobreakspace\theillustration}

	\newenvironment{illustration}
		{\illustrations@in@document\@float{illustration}}
		{\end@float}

	\def\illustrations@in@document {%
		\immediate\write\@mainaux {\global\string\illustrationstrue}%
		\global\let\illustrations@in@document\empty}

	\newenvironment{illustration*}
		{\@dblfloat{illustration}}
		{\end@dblfloat}

% SOUNDS
	\newcounter{sound}[chapter]
	\renewcommand \thesound
		{\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@sound}
	\def\fps@sound{tbp}
	\def\ftype@sound{64}
	\def\ext@sound{los}
	\def\fnum@sound{\soundname\nobreakspace\thesound}

	\newenvironment{sound}
		{\sounds@in@document\@float{sound}}
		{\end@float}

	\def\sounds@in@document {%
		\immediate\write\@mainaux {\global\string\soundstrue}%
		\global\let\sounds@in@document\empty}

	\newenvironment{sound*}
		{\@dblfloat{sound}}
		{\end@dblfloat}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                CAPTION SETUP                                 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                        OLD FONT COMMAND COMPATIBILITY                        %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\DeclareOldFontCommand{\rm}{\normalfont\rmfamily}{\mathrm}
\DeclareOldFontCommand{\sf}{\normalfont\sffamily}{\mathsf}
\DeclareOldFontCommand{\tt}{\normalfont\ttfamily}{\mathtt}
\DeclareOldFontCommand{\bf}{\normalfont\bfseries}{\mathbf}
\DeclareOldFontCommand{\it}{\normalfont\itshape}{\mathit}
\DeclareOldFontCommand{\sl}{\normalfont\slshape}{\@nomath\sl}
\DeclareOldFontCommand{\sc}{\normalfont\scshape}{\@nomath\sc}
\DeclareRobustCommand*\cal{\@fontswitch\relax\mathcal}
\DeclareRobustCommand*\mit{\@fontswitch\relax\mathnormal}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                          TABLE OF CONTENTS COMMANDS                          %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% TABLE OF CONTENTS
	\newcommand\tableofcontents{%
		\if@openright\cleardoublepage\else\clearpage\fi
		\thispagestyle{plain}%
		\if@twocolumn
			\@restonecoltrue\onecolumn
		\else
			\@restonecolfalse
		\fi
		\if@twocolumn
			\@topnewpage[%
				\@makeschapterhead{%
					\contentsname
					\@mkboth{\MakeUppercase\contentsname}
							{\MakeUppercase\contentsname}}]%
		\else
			\@makeschapterhead{%
				\contentsname
				\@mkboth{\MakeUppercase\contentsname}
					{\MakeUppercase\contentsname}}%
			\@afterheading
		\fi%
		\@starttoc{toc}%
		\if@restonecol
			\twocolumn
		\fi}

% LIST OF FIGURES
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

% LIST OF TABLES
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

% LIST OF PLATES
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

% LIST OF SOUNDS
	\newcommand\listofsounds{%
		\ifsounds
			\if@twocolumn
				\@restonecoltrue\onecolumn
			\else
				\@restonecolfalse
			\fi
			\chapter*{\listsoundname}%
			\addcontentsline{toc}{chapter}{\listsoundname}
			\@mkboth{\MakeUppercase\listsoundname}%
					{\MakeUppercase\listsoundname}%
			\@starttoc{los}%
			\if@restonecol
				\twocolumn
			\fi
		\fi}

% LIST OF VIDEOS
	\newcommand\listofvideos{%
		\ifvideos
			\if@twocolumn
				\@restonecoltrue\onecolumn
			\else
				\@restonecolfalse
			\fi
			\chapter*{\listvideoname}%
			\addcontentsline{toc}{chapter}{\listvideoname}
			\@mkboth{\MakeUppercase\listvideoname}%
					{\MakeUppercase\listvideoname}%
			\@starttoc{lov}%
			\if@restonecol
				\twocolumn
			\fi
		\fi}

% LIST OF ILLUSTRATIONS
	\newcommand\listofillustrations{%
		\ifillustrations
			\if@twocolumn
				\@restonecoltrue\onecolumn
			\else
				\@restonecolfalse
			\fi
			\chapter*{\listillustrationname}%
			\addcontentsline{toc}{chapter}{\listillustrationname}
			\@mkboth{\MakeUppercase\listillustrationname}%
					{\MakeUppercase\listillustrationname}%
			\@starttoc{loi}%
			\if@restonecol
				\twocolumn
			\fi
		\fi}

% LIST OF PHOTOS
	\newcommand\listofphotos{%
		\ifphotos
			\if@twocolumn
				\@restonecoltrue\onecolumn
			\else
				\@restonecolfalse
			\fi
			\chapter*{\listphotoname}%
			\addcontentsline{toc}{chapter}{\listphotoname}
			\@mkboth{\MakeUppercase\listphotoname}%
					{\MakeUppercase\listphotoname}%
			\@starttoc{loh}%
			\if@restonecol
				\twocolumn
			\fi
		\fi}

% DEFINITIONS FOR EACH LEVEL IN TOC
	\newcommand*\l@part[2]{%
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
				\large#1\nobreak\hfil \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
				\penalty\@highpenalty
			\endgroup
		\fi}
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
	\newcommand*\l@figure{\@dottedtocline{1}{1.5em}{2.3em}}
	\let\l@table\l@figure
	\let\l@plate\l@figure
	\let\l@photo\l@figure
	\let\l@video\l@figure
	\let\l@sound\l@figure
	\let\l@illustration\l@figure


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                         PREFATORY PAGES DEFINITIONS                          %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ABSTRACT
	\newcommand\makeabstract{%
		\ifdefvoid{\@abstracttext}{}{%
			\chapter*{\abstractname}
			\addcontentsline{toc}{chapter}{\abstractname}
			\@mkboth{\MakeUppercase\abstractname}%
					{\MakeUppercase\abstractname}
			\doublespacing\@abstracttext}}

% LIST OF SYMBOLS
	\newcommand\listofsymbols{\printnomenclature}

% PREFACE
	\newcommand\makepreface{%
		\ifdefvoid{\@prefacetext}{}{%
			\chapter*{\prefacename}
			\addcontentsline{toc}{chapter}{\prefacename}
			\@mkboth{\MakeUppercase\prefacename}%
					{\MakeUppercase\prefacename}
			\@prefacetext}}

% ACKNOWLEDGEMENTS
	\newcommand\makeacknowledgements{%
		\ifdefvoid{\@acknowledgementtext}{}{
			\chapter*{\acknowledgementname}
			\addcontentsline{toc}{chapter}{\acknowledgementname}
			\@mkboth{\MakeUppercase\acknowledgementname}%
					{\MakeUppercase\acknowledgementname}
			\@acknowledgementtext}}

% QUOTE
	\newcommand\makequote{%
		\ifdefvoid{\@quotetext}{}{\chapter*{}
			\@mkboth{}%
					{}
			\vfill\begin{center}\em \@quotetext \em\end{center}\vfill}}

% DEDICATION
	\newcommand\makededication{%
		\ifdefvoid{\@dedicationtext}{}{\chapter*{}
			\@mkboth{}%
					{}
			\vfill\begin{center}\em \@dedicationtext \em\end{center}\vfill}}

% COMBO QUOTE & DEDICATION
	\newcommand\makededicationandquote{%
		\ifdefvoid{\@dedicationtext}{\makequote}{%
			\ifdefvoid{\@quotetext}{\makededication}{%
				\chapter*{}
				\@mkboth{}%
						{}
				\vfill\begin{center}\em \@dedicationtext \em\end{center}\vfill\begin{center}\em \@quotetext \em\end{center}\vfill}}}


\def\bodyoftext{%
	\newpage
	\setlength{\parindent}{2.6ex}
	\setcounter{page}{0}
	\pagenumbering{arabic}
	\if@fancyheaders
		\pagestyle{headings}
	\else
		\pagestyle{plain}
	\fi}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                FOOTNOTE SETUP                                %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand\footnoterule{%
	\kern-3\p@
	\hrule\@width.4\columnwidth
	\kern2.6\p@}

\@addtoreset{footnote}{chapter}
\newcommand\@makefntext[1]{%
	\parindent 1em%
	\noindent
	\hb@xt@1.8em{\hss\@makefnmark}#1}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                               DEFINE ALL NAMES                               %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand\abbreviationsname           {Abbreviations}
\newcommand\abstractname                {Abstract}
\newcommand\acknowledgementname         {Acknowledgements}
\newcommand\appendixname                {Appendix}
\newcommand\bibname                     {Bibliography}
\newcommand\chaptername                 {Chapter}
\newcommand\contentsname                {Table of Contents}
\newcommand\dedicationname              {Dedication}
\newcommand\figurename                  {Figure}
\newcommand\glossaryname                {Glossary of Terms}
\newcommand\indexname                   {Index}
\newcommand\illustrationname            {Illustrations}
\newcommand\listfigurename              {List of Figures}
\newcommand\listillustrationname        {List of Illustrations}
\newcommand\listphotoname               {List of Photos}
\newcommand\listplatename               {List of Plates}
\newcommand\listsoundname               {List of Sound Files}
\newcommand\listsymbolname              {List of Symbols}
\newcommand\listtablename               {List of Tables}
\newcommand\listvideoname               {List of Videos}
\newcommand\partname                    {Part}
\newcommand\photoname                   {Photo}
\newcommand\platename                   {Plate}
\newcommand\prefacename                 {Preface}
\newcommand\quotename                   {Quote}
\newcommand\quoteanddedicationname      {\quotename\ \&\ \dedicationname}
\newcommand\soundname                   {Sound File}
\newcommand\tablename                   {Table}
\newcommand\videoname                   {Video}

% CONTROL THE BOTTOM OF THE PAGE WHEN IN TWOSIDED
	\if@twoside
		\raggedbottom
	\else
		\raggedbottom
	\fi

% TWO COLUMN SETUP (REMOVE? KEEP FOR COMBATIBILITY REASONS? ARE THERE THESES 
%  WRITTEN IN TWO COLUMN?)
	\if@twocolumn
		\twocolumn
		\sloppy
		\flushbottom
	\else
		\onecolumn
	\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                             ADDITIONAL PACKAGES                              %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The defacto package for including graphics
\RequirePackage{graphicx}

% Allows the inclusion PDF files
\RequirePackage{pdfpages}

% Used for inserting syntax highlighted code
\RequirePackage{listings}

\RequirePackage[intoc]{nomencl}
	\makenomenclature
	\renewcommand{\nomname}{List of Symbols}
	\newcommand{\nomunit}[1]{\renewcommand{\nomentryend}{\hspace*{\fill}#1}}

\RequirePackage[acronym,nonumberlist]{glossaries}
	\glstoctrue
	\makenoidxglossaries
	\newcommand{\addacronym}[2]{\newacronym{#1}{#1}{#2}}
	\newcommand{\addterm}[2]{\newglossaryentry{#1}{name={#1},description={#2}}}
	\newcommand\generateglossary{
		\printnoidxglossary[title={\glossaryname}]}
	\newcommand\abbreviations{
		\printnoidxglossary[type=\acronymtype,title={\abbreviationsname}]}

\RequirePackage[
\@paperoption,
left=1in,
right=1.5in,
headheight=0.25in,
headsep=0.25in,
textheight=8.5in]{geometry}

\AtEndPreamble{
	\RequirePackage{xurl}
	\if@colourlinks%
		\RequirePackage{hyperref}
		\hypersetup{
			colorlinks,
			linkcolor={red!50!black},
			citecolor={blue!50!black},
			urlcolor={blue!80!black},
			pdfencoding=unicode,
			breaklinks=true}
	\else%
		\RequirePackage{hyperref}
		\hypersetup{
			hidelinks,
			pdfencoding=unicode,
			breaklinks=true}
	\fi%
	\urlstyle{same}
	\Urlmuskip=0mu plus 1mu\relax
	\RequirePackage[capitalise,nameinlink]{cleveref}
	\if@pdfa%
		\def\@pdfcreator{LaTeX using a Template by Daniel R. Aldrich}
		\RequirePackage[noerr,a-3b]{pdfx}
	\fi%
}

% PDFPAGES CHECK AND DEFAULTS SET
\AtBeginDocument{
	\@ifpackageloaded{listings}{%
		\lstset{
			basicstyle=\ttfamily\singlespacing, % Forces code to be single-spaced
			breaklines=true,                    % Allows long lines to wrap
			frame=tb,                           % Puts a line at top and bottom
			columns=flexible,
			keepspaces=true
		}}{}
	\@ifpackageloaded{biblatex}{\setlength{\bibitemsep}{\baselineskip}}{}
	\@ifpackageloaded{pdfpages}{
		\if@fancyheaders
			\includepdfset{%
				pages=-,
				scale=0.85,
				pagecommand=\thispagestyle{headings}}
		\else
			\includepdfset{%
				pages=-,
				scale=0.85,
				pagecommand=\thispagestyle{plain}}
		\fi
	}{}}

\endinput