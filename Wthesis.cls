%------------------------------------------------------------------------------------------
% Initialize
%------------------------------------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{Wthesis}[2016/09/30 WEB Thesis Class, Modified by TDA]
% Modified by BH 2022/09/28

%------------------------------------------------------------------------------------------
% Load Default class
%------------------------------------------------------------------------------------------

\LoadClass[oneside,10pt]{memoir}

%-----------------------------------------------------------------------------------------
% Load Packages
%-----------------------------------------------------------------------------------------
\usepackage[table,xcdraw]{xcolor} % optional: add color to cells in tables
\usepackage{placeins}
\usepackage{appendix}
\usepackage{xspace} % Provides a space after a macro if required (e.g., \newcommand{\apples}{AppLeS } )
\usepackage{amsmath} % Math extension
\usepackage{amsfonts} % \mathbb in this one
\usepackage[no-math]{fontspec} % Interface to system fonts
\usepackage{setspace} % Allow easier changing of line spacing
\usepackage{lmodern} % Latin Modern font catalog
% Provides hyper-linking for the table of contents, bookmarks, and metadata
\usepackage[hidelinks, bookmarks=true]{hyperref}
\usepackage{microtype} % Typographical extensions for font expansion ect.
\usepackage{listings} % Allow code to placed within the document
\usepackage[american]{babel} % Topographical rules and hyphenation patterns
\usepackage[natbibapa]{apacite} % APA citation style.
\usepackage[noredefwarn, acronym, nopostdot, nonumberlist]{glossaries} % Allow glossaries to be build (e.g., list of symbols)
%\usepackage{caption} % Allows control of captions using the package directly rather then piping through the memoir class
\usepackage{subcaption} % Allows control of captions using the package directly rather then piping through the memoir class
\usepackage[sharp]{easylist} % Create lists easier
\usepackage{etoolbox} % allows to redefine the easylist to start at 1 each time
\usepackage{hyperxmp} % Allow more pdf metadata and copyright info
% Set RGB rendering to be the same for all PDF pages (having some images with transparency and some without causes drama)
\usepackage{eso-pic}
\usepackage{graphicx} % optional: use for more complex tables
\usepackage{tabu} % tabu seems to be better then tabular for making tables - TDA
\usepackage{csquotes} % block quotes
\usepackage[export]{adjustbox} % max size for \includegraphics - BH
\usepackage{enumitem} % allows for [noitemsep, nolistsep] in \enumerte or \itemize - BH
\usepackage{gensymb} %$\degree$ contained in this one - BH
\usepackage{pgffor}  % permits for-loops in latex, \foreach \x {item1, item2, ... } {% do things with \x} - BH
\usepackage{array}

% extras for pseudocode
\usepackage{algorithm}
\usepackage{algpseudocode}

\AddToShipoutPicture{%
    \makeatletter%
    \special{pdf: put @thispage <</Group << /S /Transparency /I true /CS /DeviceRGB>> >>}%
    \makeatother%
}



%------------------------------------------------------------------------------------------
% Page Preferences
%------------------------------------------------------------------------------------------

\setstocksize{11in}{8.5in} % Set stock size
\settrims{0pt}{0pt} % Set paper size to the same value as the stock size
\setlrmarginsandblock{1.5in}{1in}{*} % Left and Right margin sizes
\setulmarginsandblock{1in}{1in}{*} % Top and Bottom margin sizes
\setheadfoot{0.25in}{0.25in}
\checkandfixthelayout % Implement the above settings

%------------------------------------------------------------------------------------------
% Style Preferences
%------------------------------------------------------------------------------------------

% Set the page numbers in the plain style smaller
\makeoddfoot{plain}{}{\small\thepage}{}
\makeevenfoot{plain}{}{\small\thepage}{}

% Set-up a page style that uses ruled as a base
\copypagestyle{thesis}{ruled}
% Make sure both the chapter and subsection are shown in the header as onepage only prints one by
% default
%\makeoddhead{thesis}{\small\leftmark}{}{\small\rightmark} % too big
\makeoddhead{thesis}{\small\leftmark}{}{}
% Center the page number
\makeevenfoot{thesis}{}{\small\thepage}{}
\makeoddfoot{thesis}{}{\small\thepage}{}

\makeheadfootruleprefix{thesis}{}{}
\makeheadrule{thesis}{\textwidth}{\normalrulethickness}

% Make it so there can be white space at the bottom of a page
\raggedbottom

%------------------------------------------------------------------------------------------
% Font Preferences
%------------------------------------------------------------------------------------------

% % Set the font
% \setmainfont{Palatino Linotype}

% Make the caption fonts smaller
\captionsetup{font=small}

% Section font sizes
%\setsubsecheadstyle{\normalsize\bfseries\memRTLraggedright}
%\setsubsubsecheadstyle{\normalsize\bfseries\itshape\memRTLraggedright}
%\setsecheadstyle{\large\bfseries\memRTLraggedright}

% Make match brackets automaticly size with \left and \right
\delimitershortfall=-1.5pt
%------------------------------------------------------------------------------------------
% Paragraph Preferences
%------------------------------------------------------------------------------------------

% Line spacing
\linespread{1.5}

%------------------------------------------------------------------------------------------
% Chapter Heading Preferences
%------------------------------------------------------------------------------------------

% Reduce the chapter tile line spacing
\setlength{\beforechapskip}{0pt}
\setlength{\topskip}{0pt}
\setlength{\baselineskip}{0pt}
\setlength{\midchapskip}{0pt}
\setlength{\afterchapskip}{20pt}

% Tune the chapter number font
\renewcommand*{\chapnamefont}{\normalfont\scshape\LARGE\bfseries}
\renewcommand*{\chapnumfont}{\normalfont\LARGE\bfseries}

% Add a horizontal line
\renewcommand*{\afterchapternum}{\par\vskip 10pt}

% Tune the Chapter title font
\renewcommand*{\chaptitlefont}{\normalfont\scshape\Huge\bfseries\raggedright}
\preto\chaptitlefont{\linespread{1}} % Have multi-line chapter titles single spaced

\renewcommand*{\afterchaptertitle}{\vskip 5pt \hrule\vskip \afterchapskip}

% Tune section font
%\setsechook{\linespread{1}} % have it so multi-line section titles are single spaced

%------------------------------------------------------------------------------------------
% Other Settings
%------------------------------------------------------------------------------------------

% Define the paramter file display format
\lstdefinestyle{ccgParameterfile}{xleftmargin=0.5em, numbers=left,
    breakatwhitespace=true, numbersep=-1em, breaklines=true,
    numberstyle=\raggedright\ttfamily, basicstyle=\ttfamily,
    framextopmargin=1em}
\setlength\topsep{0em}
\FrameSep0pt

% Reduce spacing around equations
\g@addto@macro\normalsize{%
    \setlength\abovedisplayskip{5pt}
    \setlength\belowdisplayskip{5pt}
    \setlength\abovedisplayshortskip{5pt}
    \setlength\belowdisplayshortskip{5pt}
}


%------------------------------------------------------------------------------------------
% Section Number Preferences
%------------------------------------------------------------------------------------------

\setcounter{secnumdepth}{3}
\setcounter{tocdepth}{3}


\captionsetup{labelfont=bf}

%\everymath{\displaystyle}
\newcommand\adddot[1]{#1.}
\AtBeginEnvironment{easylist}
{\ListProperties(CtrCom=\adddot, FinalSpace=.5em, Hang=true, Mark=, Space=4pt, Space*=4pt,
    Align=move,  Margin1=1.2em,  Margin2=2.9em,
    Numbers2=l, Hide2=1,  Margin3=5.6em, Numbers3=r, Hide3=2,  Margin4=6.8em,
    Numbers4=L, Hide4=3, Start1=1)}
{}
{}
