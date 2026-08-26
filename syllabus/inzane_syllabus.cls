\ProvidesClass{inzane_syllabus}[2018/06/28 syllabus class]
\LoadClass{article}
\NeedsTeXFormat{LaTeX2e}

%----------------------------------------------------------------------------------------
%	 REQUIRED PACKAGES
%----------------------------------------------------------------------------------------

% ClearSans is the template's display face.  Fall back to a generic sans if the
% distribution in use does not ship it, instead of dying with "file not found".
\IfFileExists{ClearSans.sty}
	{\RequirePackage[sfdefault]{ClearSans}}
	{\RequirePackage{lmodern}\renewcommand{\familydefault}{\sfdefault}}
\RequirePackage[T1]{fontenc}
\RequirePackage{tikz}
\RequirePackage{xcolor}
\RequirePackage[absolute,overlay]{textpos}
\RequirePackage{ragged2e}
\RequirePackage{etoolbox}
\RequirePackage{ifmtarg}
\RequirePackage{ifthen}
\RequirePackage{pgffor}
\RequirePackage{parskip}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

%----------------------------------------------------------------------------------------
%	 COLOURS
%----------------------------------------------------------------------------------------

\definecolor{white}{RGB}{255,255,255}
\definecolor{gray}{HTML}{4D4D4D}
\definecolor{sidecolor}{HTML}{E7E7E7}
\definecolor{mainblue}{HTML}{0E5484}
\definecolor{maingray}{HTML}{B9B9B9}
\definecolor{green}{HTML}{66FF66}

%Set the Main Thematic Color here. It is currently green. 
\definecolor{myCOLOR}{HTML}{046D0B}%05800D}% 06930F}%0E801C}

%To alternate section header colors (perhaps between green and grey, or your two school colors), define myCOLOR2, and then go to the ColorCounter section below and alternate lines between myCOLOR and myCOLOR2. 

%----------------------------------------------------------------------------------------
%	 MISC CONFIGURATIONS
%----------------------------------------------------------------------------------------

\renewcommand{\bfseries}{\color{gray}} % Make \textbf produce coloured text instead

\pagestyle{empty} % Disable headers and footers

\setlength{\parindent}{0pt} % Disable paragraph indentation

%----------------------------------------------------------------------------------------
%	 SIDEBAR DEFINITIONS
%----------------------------------------------------------------------------------------

\setlength{\TPHorizModule}{1cm} % Left margin
\setlength{\TPVertModule}{1cm} % Top margin

\newlength\imagewidth
\newlength\imagescale
\pgfmathsetlength{\imagewidth}{5cm}
\pgfmathsetlength{\imagescale}{\imagewidth/600}

\newlength{\TotalSectionLength} % Define a new length to hold the remaining line width after the section title is printed
\newlength{\SectionTitleLength} % Define a new length to hold the width of the section title
\newcommand{\profilesection}[1]{%
	\setlength\TotalSectionLength{\linewidth}% Set the total line width
	\settowidth{\SectionTitleLength}{\huge #1 }% Calculate the width of the section title
	\addtolength\TotalSectionLength{-\SectionTitleLength}% Subtract the section title width from the total width
	\addtolength\TotalSectionLength{-2.22221pt}% Modifier to remove overfull box warning
	\vspace{8pt}% Whitespace before the section title
	{\color{black!80} \huge #1 \rule[0.15\baselineskip]{\TotalSectionLength}{1pt}}% Print the title and auto-width rule
}

%----------------------------------------------------------------------------------------
%	 Syllabus Header Info
%----------------------------------------------------------------------------------------
\newcommand{\classname}[1]{\renewcommand{\classname}{#1}}
\newcommand{\classnum}[1]{\renewcommand{\classnum}{#1}}
%----------------------------------------------------------------------------------------
%	 Instructor Info
%----------------------------------------------------------------------------------------
\newcommand{\profname}[1]{\renewcommand{\profname}{#1}}
\newcommand{\officehours}[1]{\renewcommand{\officehours}{#1}}
\newcommand{\office}[1]{\renewcommand{\office}{#1}}
\newcommand{\site}[1]{\renewcommand{\site}{#1}}
\newcommand{\email}[1]{\renewcommand{\email}{#1}}

%----------------------------------------------------------------------------------------
%	 Class Info
%----------------------------------------------------------------------------------------
\newcommand{\prereq}[1]{\renewcommand{\prereq}{#1}}
\newcommand{\classdays}[1]{\renewcommand{\classdays}{#1}}
\newcommand{\classhours}[1]{\renewcommand{\classhours}{#1}}
\newcommand{\classloc}[1]{\renewcommand{\classloc}{#1}}
\newcommand{\classinfo}[1]{\renewcommand{\classinfo}{#1}}

%----------------------------------------------------------------------------------------
%	 Lab Info
%----------------------------------------------------------------------------------------
\newcommand{\labdays}[1]{\renewcommand{\labdays}{#1}}
\newcommand{\labhours}[1]{\renewcommand{\labhours}{#1}}
\newcommand{\labloc}[1]{\renewcommand{\labloc}{#1}}

%----------------------------------------------------------------------------------------
%	 TA Info
%----------------------------------------------------------------------------------------
\newcommand{\taAname}[1]{\renewcommand{\taAname}{#1}}
\newcommand{\taAofficehours}[1]{\renewcommand{\taAofficehours}{#1}}
\newcommand{\taAoffice}[1]{\renewcommand{\taAoffice}{#1}}
\newcommand{\taAemail}[1]{\renewcommand{\taAemail}{#1}}
\newcommand{\taBname}[1]{\renewcommand{\taBname}{#1}}
\newcommand{\taBofficehours}[1]{\renewcommand{\taBofficehours}{#1}}
\newcommand{\taBoffice}[1]{\renewcommand{\taBoffice}{#1}}
\newcommand{\taBemail}[1]{\renewcommand{\taBemail}{#1}}

%----------------------------------------------------------------------------------------
%	 Tutor Info
%----------------------------------------------------------------------------------------
\newcommand{\tutorname}[1]{\renewcommand{\tutorname}{#1}}
\newcommand{\tutorofficehours}[1]{\renewcommand{\tutorofficehours}{#1}}
\newcommand{\tutoroffice}[1]{\renewcommand{\tutoroffice}{#1}}
\newcommand{\tutoremail}[1]{\renewcommand{\tutoremail}{#1}}

%----------------------------------------------------------------------------------------
%	 Misc. Info
%----------------------------------------------------------------------------------------
\newcommand{\profilepic}[1]{\renewcommand{\profilepic}{#1}}
\newcommand{\about}[1]{\renewcommand{\about}{#1}}

%----------------------------------------------------------------------------------------
%	 FAQs
%----------------------------------------------------------------------------------------
% to add more FAQs, add new commands here and then at lines 246
\newcommand{\qOne}[1]{\renewcommand{\qOne}{#1}}
\newcommand{\aOne}[1]{\renewcommand{\aOne}{#1}}
\newcommand{\qTwo}[1]{\renewcommand{\qTwo}{#1}}
\newcommand{\aTwo}[1]{\renewcommand{\aTwo}{#1}}
\newcommand{\qThree}[1]{\renewcommand{\qThree}{#1}}
\newcommand{\aThree}[1]{\renewcommand{\aThree}{#1}}
\newcommand{\qFour}[1]{\renewcommand{\qFour}{#1}}
\newcommand{\aFour}[1]{\renewcommand{\aFour}{#1}}

\newcommand{\faqLine}[1]{\renewcommand{\faqLine}{#1}}



%----------------------------------------------------------------------------------------
%	 VECTOR ICONS  (drawn with TikZ -- no icon font required)
%----------------------------------------------------------------------------------------
% The original template pulled its icons from fontawesome / ifsym / marvosym, which ship
% as Type 1 fonts.  Those glyphs silently disappear in engines and PDF viewers that do not
% resolve the font maps (Texifier's built-in engine among them).  Everything below is drawn
% with TikZ, which the class already loads, so the icons are plain vector art in the PDF
% and cannot go missing.

\newlength{\iconsize}
\setlength{\iconsize}{1.18em}

% \viconbox{<tikz drawing code>} -- filled disc with white artwork on top.
% The drawing code works in a box that runs roughly -1..1 in each direction.
\newcommand*\viconbox[1]{%
	\begin{tikzpicture}[baseline=-0.62ex, x=0.5\iconsize, y=0.5\iconsize]
		\fill[myCOLOR] (0,0) circle (1.38);
		\begin{scope}[white, draw=white, fill=white,
		              line cap=round, line join=round, line width=0.115\iconsize]
			#1
		\end{scope}
	\end{tikzpicture}%
}

% Same disc, but with a character from the document font in it (used for @ and ?)
\newcommand*\viconchar[1]{%
	\viconbox{\node[text=white, inner sep=0pt, font=\normalsize] at (0,0.06) {#1};}%
}

\newcommand*\iconUser{\viconbox{%
	\fill (0,0.44) circle (0.42);
	\begin{scope}\clip (-1.3,-0.95) rectangle (1.3,1.3);
		\fill (0,-0.95) ellipse (0.82 and 0.82);
	\end{scope}}}

\newcommand*\iconClock{\viconbox{%
	\draw (0,0) circle (0.80);
	\draw (0,0) -- (0,0.46);
	\draw (0,0) -- (0.42,0.02);}}

\newcommand*\iconMarker{\viconbox{%
	\fill (0,-1.02) .. controls (-0.28,-0.48) and (-0.82,-0.22) .. (-0.82,0.20)
	      arc[start angle=180, end angle=0, radius=0.82]
	      .. controls (0.82,-0.22) and (0.28,-0.48) .. (0,-1.02) -- cycle;
	\fill[myCOLOR] (0,0.20) circle (0.31);}}

\newcommand*\iconInfo{\viconbox{%
	\fill (0,0.64) circle (0.17);
	\fill[rounded corners=0.06] (-0.16,-0.74) rectangle (0.16,0.32);}}

\newcommand*\iconBolt{\viconbox{%
	\fill (0.30,1.00) -- (-0.62,0.04) -- (-0.06,0.04)
	   -- (-0.30,-1.00) -- (0.62,-0.02) -- (0.06,-0.02) -- cycle;}}

\newcommand*\iconCalendar{\viconbox{%
	\draw (-0.78,-0.80) rectangle (0.78,0.66);
	\fill (-0.84,0.30) rectangle (0.84,0.72);
	\fill (-0.42,-0.34) circle (0.13);
	\fill ( 0.00,-0.34) circle (0.13);
	\fill ( 0.42,-0.34) circle (0.13);}}

\newcommand*\iconBang{\viconbox{%
	\fill (0,-0.72) circle (0.17);
	\fill[rounded corners=0.06] (-0.16,-0.34) rectangle (0.16,0.76);}}

\newcommand*\iconQuestion{\viconchar{?}}
\newcommand*\iconAt{\viconchar{@}}

% Kept for backwards compatibility: the original text-in-a-disc helpers.  They still
% work with anything you can typeset (\icon{@}, \icon{1}, ...), just not with the
% fontawesome glyphs, which this class no longer loads.
\newcommand*\icon[1]{\tikz[baseline=(char.base)]{\node[shape=circle,draw,inner sep=1pt, fill=myCOLOR,myCOLOR,text=white] (char) {#1};}}
\newcommand*\icontwo[1]{\tikz[baseline=(char.base)]{\node[shape=circle,draw,inner sep=2pt, fill=myCOLOR,myCOLOR,text=white] (char) {#1};}}
\newcommand*\iconhalf[1]{\tikz[baseline=(char.base)]{\node[shape=circle,draw,inner sep=1.5pt, fill=myCOLOR,myCOLOR,text=white] (char) {#1};}}




%----------------------------------------------------------------------------------------
%	 SIDEBAR LAYOUT
%----------------------------------------------------------------------------------------

\newcommand{\makeprofile}{
	\begin{tikzpicture}[remember picture,overlay]
   		\node [rectangle, fill=sidecolor, anchor=north, minimum width=9cm, minimum height=\paperheight+1cm] (box) at (-5cm,0.3cm){};
	\end{tikzpicture}

	%------------------------------------------------

	\begin{textblock}{6}(0.5, 0.2)
			
		%------------------------------------------------
		
		\ifthenelse{\equal{\profilepic}{}}{}{
			\begin{center}
				\begin{tikzpicture}[x=\imagescale,y=-\imagescale]
					\clip (600/2, 567/2) circle (567/2);
					\node[anchor=north west, inner sep=0pt, outer sep=0pt] at (0,0) {\includegraphics[width=\imagewidth]{\profilepic}};
				\end{tikzpicture}
			\end{center}
		}

		%------------------------------------------------

		{\Huge\color{myCOLOR}\classname}

		%------------------------------------------------

		{\Large\color{myCOLOR}\classnum}

		%------------------------------------------------

		\renewcommand{\arraystretch}{1.6}


		%------------------------------------------------
        
        \profilesection{\vspace{0.7cm} Instructor Info}      
        
        \begin{tabular}{p{0.5cm} @{\hskip 0.5cm}p{5cm}}
        	\ifthenelse{\equal{\profname}{}}{}{\iconUser & \profname \\}
			\ifthenelse{\equal{\officehours}{}}{}{\iconClock & \officehours\\}
			\ifthenelse{\equal{\office}{}}{}{\iconMarker & \office\\}
% 			\ifthenelse{\equal{\cvnumberphone}{}}{}{\textsc{\Large\icon{\Telefon}} & \cvnumberphone\\}
			\ifthenelse{\equal{\site}{}}{}{\iconInfo & \site\\}
			\ifthenelse{\equal{\email}{}}{}{\iconAt & \href{mailto:\email}{\email}}
		\end{tabular}
        
        \profilesection{\vspace{0.5cm} Course Info}
        
        \begin{tabular}{p{0.5cm} @{\hskip 0.5cm}p{5cm}}
        	\ifthenelse{\equal{\prereq}{}}{}{\iconBolt & \prereq\\}
            \ifthenelse{\equal{\classdays}{}}{}{\iconCalendar & \classdays\\}
            \ifthenelse{\equal{\classhours}{}}{}{\iconClock & \classhours\\} 
            \ifthenelse{\equal{\classloc}{}}{}{\iconMarker & \classloc\\}
            \end{tabular}
        
       
        \profilesection{\vspace{0.5cm} TA Info}
        
        \begin{tabular}{p{0.5cm} @{\hskip 0.5cm}p{5cm}}
            \ifthenelse{\equal{\taAname}{}}{}{\iconUser & \taAname\\}
            \ifthenelse{\equal{\taAofficehours}{}}{}{\iconClock & \taAofficehours\\}
            \ifthenelse{\equal{\taAoffice}{}}{}{\iconMarker & \taAoffice\\}
		  \ifthenelse{\equal{\taAemail}{}}{}{\iconAt & \taAemail \\}
            \ifthenelse{\equal{\taBname}{}}{}{\iconUser & \taBname\\}
            % \ifthenelse{\equal{\taBofficehours}{}}{}{\iconClock & \taBofficehours\\}
            \ifthenelse{\equal{\taBoffice}{}}{}{\iconMarker & \taBoffice\\}
            % \ifthenelse{\equal{\taBemail}{}}{}{\iconAt & \href{mailto:\taBemail}{\taBemail}\\}
        \end{tabular}
        
        \profilesection{Tutor Info}
        
        \begin{tabular}{p{0.5cm} @{\hskip 0.5cm}p{5cm}}
            \ifthenelse{\equal{\tutorname}{}}{}{\iconUser & \tutorname\\}
		  \ifthenelse{\equal{\tutoremail}{}}{}{\iconAt & \tutoremail \\}
            \ifthenelse{\equal{\tutorofficehours}{}}{}{\iconClock &\tutorofficehours\\}
            \ifthenelse{\equal{\tutoroffice}{}}{}{\iconMarker & \tutoroffice\\}       
        \end{tabular}
        
%         \ifthenelse{\equal{\about}{}}{}{
% 			\profilesection{\vspace{0.5cm} About} %just change the title here to change the name of the section. 
% 			\begin{flushleft}
% 				\about
% 			\end{flushleft}
% 		}
			
	\end{textblock}
}



\newcommand{\makeSide}{
	\begin{tikzpicture}[remember picture,overlay]
   		\node [rectangle, fill=sidecolor, anchor=north, minimum width=9cm, minimum height=\paperheight+1cm] (box) at (-5cm,0.5cm){};
	\end{tikzpicture}

	%------------------------------------------------

	\begin{textblock}{6}(0.5, 0.2)

		{\Huge\color{myCOLOR} FAQs}
		\renewcommand{\arraystretch}{2.5}
       
        \begin{tabular}{p{0.5cm} @{\hskip 0.5cm}p{5cm}}       	
        	\ifthenelse{\equal{\qOne}{}}{}{\iconQuestion & \Large\qOne\\}
            \ifthenelse{\equal{\aOne}{}}{}{\iconBang & \aOne\\} 
%             \ifthenelse{\equal{\faqLine}{}}{}{\noindent\rule{2cm}{0.4pt} & \\}
            \ifthenelse{\equal{\qTwo}{}}{}{\iconQuestion & \Large\qTwo\\}
            \ifthenelse{\equal{\aTwo}{}}{}{\iconBang & \aTwo\\} 
            \ifthenelse{\equal{\qThree}{}}{}{\iconQuestion & \Large\qThree\\}
            \ifthenelse{\equal{\aThree}{}}{}{\iconBang & \aThree\\}
            \ifthenelse{\equal{\qFour}{}}{}{\iconQuestion & \Large\qFour\\}
            \ifthenelse{\equal{\aFour}{}}{}{\iconBang & \aFour\\}         
		\end{tabular}
	\end{textblock}
}




\newcommand{\makeFullPage}{
 	\newgeometry{margin=1cm}
}


%----------------------------------------------------------------------------------------
%	 COLOURED SECTION TITLE BOX
%----------------------------------------------------------------------------------------

% Command to create the rounded boxes around section titles.
% Every option here takes an explicit value.  The original wrote
%     fill=#2,#2,text=white
% where the bare "#2" was a colour name used as an option.  When #2 arrives as an
% unexpanded \ifcase (as it did below), TexpadTeX chokes on that middle item and
% silently discards the rest of the option list -- so text=white never took effect
% and the titles were typeset in the fill colour, i.e. invisible on their own box.
% The \color{white} on the node body is a belt-and-braces second line of defence.
\newcommand*\round[2]{%
	\tikz[baseline=(char.base)]\node[anchor=north west, draw=#2, fill=#2, text=white,
		rectangle, rounded corners, inner sep=1.6pt,
		minimum size=5.5mm, text height=3.6mm](char){\color{white}#1};%
}

\newcounter{colorCounter}
% Resolve the box colour into an ordinary named colour BEFORE handing it to TikZ.
% Nothing conditional is left in the option list, which also retires the old
% \ifcase -- it had only 13 branches and no \else, so section 14 ("External
% Resources") came out unfilled.  To alternate colours, change the odd branch.
\newcommand{\sectioncolor}[1]{%
	\ifodd\value{colorCounter}%
		\colorlet{inzanesectioncolor}{myCOLOR}%
	\else
		\colorlet{inzanesectioncolor}{myCOLOR}%
	\fi
	\round{#1}{inzanesectioncolor}%
	\stepcounter{colorCounter}%
}

% \section and \section* both get the coloured box.  Without the \@ifstar,
% the bibliography's \section*{References} passes "*" as the title.
% NB: the body below is byte-for-byte the original one -- the leading and
% trailing spaces it produces are load-bearing for line breaking.
\makeatletter
\newcommand{\inzane@section}[1]{
	{%
		\color{gray}%
		\Large\sectioncolor{#1}%
	}
}
\renewcommand{\section}{\@ifstar\inzane@section\inzane@section}
\makeatother

\renewcommand{\subsection}[1]{
	\par\vspace{.5\parskip}{%
		\large\color{gray} #1%
	}
	\par\vspace{.25\parskip}%
}

%----------------------------------------------------------------------------------------
%	 LONG LIST ENVIRONMENT
%----------------------------------------------------------------------------------------

\setlength{\tabcolsep}{0pt}

% New environment for the long list
\newenvironment{twenty}{%
	\begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
}{%
	\end{tabular*}
}

\newcommand{\twentyitem}[4]{%
	#1&\parbox[t]{0.83\textwidth}{%
		\textbf{#2}%
		\hfill%
		{\footnotesize#3}\\%
		#4\vspace{\parsep}%
	}\\
}

%----------------------------------------------------------------------------------------
%	 SMALL LIST ENVIRONMENT
%----------------------------------------------------------------------------------------

\setlength{\tabcolsep}{0pt}

% New environment for the small list
\newenvironment{twentyshort}{%
	\begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
}{%
	\end{tabular*}
}

\newcommand{\twentyitemshort}[2]{%
	#1&\parbox[t]{0.83\textwidth}{%
		\textbf{#2}%
	}\\
}

%----------------------------------------------------------------------------------------
%	 MARGINS AND LINKS
%----------------------------------------------------------------------------------------

\RequirePackage[left=7.6cm,top=0.1cm,right=1cm,bottom=0.2cm,nohead,nofoot]{geometry}

\RequirePackage{hyperref}