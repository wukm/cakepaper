% % THIS IS CSULB-THESIS-OLD FROM BEFORE BUT WITH HIERARCHICAL SECTION NUMBERING

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% This is csulb-thesis.cls
%% Change log:
%% 1. Added lastdegree, changed bagradyear to lastdegyear, changed
%%    lastdeginst to lastdeginst - more flexible.
%% 2. Added name and title for dept chair - for use by other departments.
%% 3. Changed title page to list committee members and college
%%    designee (dept chair) - new requirement Spring 09.
%% 4. Changed myappendix command's TOC entry - indent and put 
%%    period after letter - matches guidelines.
%% --2/13/09 Roger Dellaca.
%%
%% 5. Added def for @caption to add period after the figure or 
%%    table name that is generated from the caption for same.
%%    Did not change the caption to print period in the document
%%    and leave off in the list - for now, need to create the
%%    caption with both entries.
%% --2/18/09 Roger Dellaca. 
%%
%% 6. Changed approval page to make title uppercase, to match
%%    other occurrences of title.
%% 7. Added roman page number in abstract in case second
%%    page is generated. (4/29/09: changed so both pages numbered
%%    if more than one page.)
%% --3/11/09 Roger Dellaca.
%%
%% 8. Changed most \begin{center}...\end{center} environments to
%%    {\centering ... \\} to remove extra \vspace{-12pt}
%%    workaround lines. Left in for several multiline center
%%    environments. NOTE: this fixes line spacing when a
%%    section heading immediately follows a chapter heading.
%% 9. Eliminated csulb-report.cls.
%% 10. Added major amounts of comments.
%% --3/20/09 Roger Dellaca.
%%
%% 11. Fixed single space caption code, added exception to 
%%	    singlespace checker warning for caption environment
%% 12. Implemented proper subsubheading formatting. Subheadings
%%      and subsubheadings will now be added to the table of contents
%%      if user sets \setcounter{tocdepth}{#} to 3 or greater. Changed
%%      tocdepth default to 1 to only show up to sections.
%%--8/30/11 Jorge L. Guerra
%%
%% 13. Added needspace and nowidow package requirements and modified section, subsection 
%%      and subsubsection commands to maintain required number of lines after a
%%      new heading before the page can break.
%%--3/23/2012 Jorge L. Guerra
%%
%% 14. Extensive modifications:
%%		+ Switched margin/geometry control to the geometry package for
%%		   better and more reliable margin control
%%		+ Added "CHAPTER to second page ToC heading
%%		+ Added indent to LoT and Lof long entries. Should also break to
%%		   next line how library seems to want it to.
%%		+ Removed quite a bit of extraneous code including margin options, twocolumn support
%%		   and quite a few things that were already commented out. Compare to older version
%%		   to determine all removed items. Hopefully nothign will ahve broken.
%%		+ Redefined what was "doublespaced" to "tightdoublespaced" in order to add option of
%%		   true double spacing.
%%		+ More stuff. I hope I didnt break anything.
%%--5/8/2012 Jorge L. Guerra
%%
%%  15.  Note by Ryan Hashi (1-7-14)--Refer to line #618 in the Pagestyle (TOC) section.  
%%  There is a flaw regarding the left column heading of the 2nd page of the Table of Contents.
%%  The 2nd page may not necessarily have chapters that spill over from the first page.  
%%  Appendices may spill over, or just the Bibliography section may be on the 2nd page.  
%%  The easiest way to adjust this is to set the left column heading in here manually.
%%
%% 16.  Added by Ryan Hashi (2-26-14).  Line 560:  negative vertical space added because
%% there is too much space after the date in the abstract section.
%%
%% 17. Changed by Louis Coleman (1-8-15). Changed all titles, subheads, and captions to bold font 
%% except the Bibliography. Change that in main .tex file. Additionally removed subhead underlines.
%%
%% 18. Changed by Louis Coleman (1-8-15). Changed all inner margins in the abstract, 
%% acknowledgements, all chapter text, appendices, and bibliography to 1 inches from 1.5 inches. TOC, %% list of figures, and list of tables dont have 1" indents.
%%
%% 19. Changed by ???? (??). Changed spacing after end of sentence punctuation from two to one
%% spacing. Does this even have to be changed? Seems to be single spacing
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% USAGE: \documentclass{csulb-thesis}
%% \documentclass[...options...]{csulb-thesis}
%%
%% NEW ENVIRONMENTS and COMMANDS:
%%
%% * \degree{...}: (preamble only; REQUIRED)
%% Specify the name of the degree (e.g., "Master of Science").
%%
%% * \department{...}: (preamble only; REQUIRED)
%% Specify the name of the graduate department.
%%
%% * \gradmonth{...}: (preamble only; REQUIRED)
%% Specify the month of graduation.
%%
%% * \gradyear{...}: (preamble only; REQUIRED)
%% Specify the year of graduation.
%%
%% * \author{...}: (preamble only; REQUIRED)
%% Specify the name of the author.
%%
%% * \lastdegree{...}: (preamble only; REQUIRED)
%% Last degree earned (e.g., "Bachelor of Science").
%%
%% * \lastdeginst{...}: (preamble only; REQUIRED)
%% Institution that awarded last degree earned.
%%
%% * \title{...}: (preamble only; REQUIRED)
%% Specify the title of the thesis.
%%
%%* \committeeA{...}: (preamble only; REQUIRED)
%% First committee member's name (include highest degree).
%% Put "chair" at end of name if appropriate.
%%
%%* \committeeAdept{...}: (preamble only; REQUIRED)
%% First committee member's department.
%%
%%* \committeeB{...}: (preamble only; REQUIRED)
%% Second committee member's name (include highest degree).
%%
%%* \committeeBdept{...}: (preamble only; REQUIRED)
%% Second committee member's department.
%%
%%* \committeeC{...}: (preamble only; REQUIRED)
%% Third committee member's name (include highest degree).
%%
%%* \committeeCdept{...}: (preamble only; REQUIRED)
%% Third committee member's department.
%%
%%* \deptHead{...}: (preamble only; REQUIRED)
%% Name of the department head. Will show up as the
%% college designee on the title page and the accepted and
%% approved person on the signature page
%%
%%* \deptHeadTitle{...} (preamble only; REQUIRED)
%% title of the person above.
%%
%% - \linespacing{...}: (preamble only)
%% Set the interline spacing directly, overriding document
%% defaults and options; should be used only if none of the
%% document options given above are adequate. Note that in
%% order to get the correct appearance, the argument to
%% \linespacing must be equal to approximately 1/3 + 2/3 times
%% the desired line spacing (for example,
%% single-spaced = \linespacing{1},
%% 1 1/2-spaced = \linespacing{1.33}, and
%% double-spaced = \linespacing{1.66}).
%%
%% - \begin{preliminary}...\end{preliminary}:
%% Delimit head matter (title page, abstract, table of contents,
%% lists of tables and figures, etc.): set the page style and
%% numbering for the preliminary sections and reset them for the
%% main document.
%%
%% - \begin{abstract}...\end{abstract}:
%% Generate the abstract page.
%%  (This must immediately precede the title page.)
%%
%% - \maketitle:
%% Generate the title page from the information supplied
%% in the preamble.
%%
%% - \begin{acknowledgements}...\end{acknowledgements}:
%% Generate an acknowledgements section, if needed.
%%
%% - \begin{singlespaced}...\end{singlespaced}:
%% Format single-spaced paragraphs.
%%
%% - \begin{oneandahalfspaced}...\end{oneandahalfspaced}:
%% Format 1 1/2-spaced paragraphs.
%%
%% - \begin{doublespaced}...\end{doublespaced}:
%% Format double-spaced paragraphs.
%%
%% - \HalfPage{...}:
%% Creates a page with "..." vertically and horizontally centered
%%
%% - \myappendix{...}:
%% Creates an appendix with "APPENDIX X"\\"..." on a half page
%% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%% IDENTIFICATION %%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{csulb-thesis-hier}%

%%%%%%%%%%%% INITIAL CODE %%%%%%%%%%%%

%% Switch for testing draft mode (toggled by `draft' option).
%
\newif\if@draft
\@draftfalse 				% initially false by default

%% Switch for testing current page style.
\newif\if@thesispage			% no default value (set by \pagestyle)


%% Switch for testing line spacing of notes.
\newif\if@singlespacednotes
\@singlespacednotestrue 		% initially true by default

%% Because of the draft option, and to allow users to override
%% defaults, we don't want to be passing conflicting options back to
%% the report class, so we define our own temporary toggles holding
%% the most recent setting for each of four basic options: point size,
%% number of page sides, whether new chapters open on right-hand pages
%% or on any page, and line spacing. These toggles will be set from
%% the corresponding options below.
%
\newcommand{\@thesisptsz}{}
\newcommand{\@thesisside}{}
\newcommand{\@thesisopen}{}
\newcommand{\@thesislnsp}{}
\newcommand{\@thesisfoot}{}

%%%%%%%%%%%% OPTION DECLARATION %%%%%%%%%%%%

%% `draft' option: change default document settings.
%% set font to 11pt, line spacing to singlespaced
\DeclareOption{draft}{\@drafttrue	% if [draft] set in options to \documentclass
   \typeout{CSULB-Thesis Class Option: `draft'}
   \ExecuteOptions{11pt,		% instead of 12pt
		oneside,		% was twoside, but we default everything to oneside
					% and twoside can be added as another 
					% option e.g. [twoside,draft]
		openright,		% only matters with twoside, but set in case 
					% someone uses twoside
		singlespaced		% instead of doublespaced
   }
   \PassOptionsToClass{draft}{report}
   %% Macros for printing "DRAFT" at the corners of a page.
   %% Not sure I like this - Roger
   \newcommand{\tlDRAFT}		% puts in top left
     {\raisebox{ 3ex}[0pt][0pt]{\llap{\sffamily\scriptsize DRAFT\ \ }}}
   \newcommand{\trDRAFT}		% puts in top right
     {\raisebox{ 3ex}[0pt][0pt]{\rlap{\sffamily\scriptsize \ \ DRAFT}}}
   \newcommand{\blDRAFT}		% puts in bottom left
     {\raisebox{-3ex}[0pt][0pt]{\llap{\sffamily\scriptsize DRAFT\ \ }}}
   \newcommand{\brDRAFT}		% puts in bottom right
     {\raisebox{-3ex}[0pt][0pt]{\rlap{\sffamily\scriptsize \ \ DRAFT}}}
}% end DeclareOption{draft}

%% `spacednotes' option: make notes share the line spacing of the rest
%% of the document.
\DeclareOption{spacednotes}{\@singlespacednotesfalse}

%% Point Size options: change current setting. 
%% Hardcoding couble the fontsize because macro multiplication is not easy.
%
\DeclareOption{10pt}{
	\renewcommand{\@thesisptsz}{10pt}
	\renewcommand{\@thesisfoot}{20pt}
}
\DeclareOption{11pt}{
	\renewcommand{\@thesisptsz}{11pt}
	\renewcommand{\@thesisfoot}{22pt}
}
\DeclareOption{12pt}{
	\renewcommand{\@thesisptsz}{12pt}
	\renewcommand{\@thesisfoot}{24pt}
}

%% Number of Page Sides options: change current setting.
%
\DeclareOption{twoside}{\renewcommand{\@thesisside}{twoside}}
\DeclareOption{oneside}{\renewcommand{\@thesisside}{oneside}}

%% New Chapter Openings options: change current setting.
%
\DeclareOption{openany}{\renewcommand{\@thesisopen}{openany}}
\DeclareOption{openright}{\renewcommand{\@thesisopen}{openright}}

%% Line Spacing options: change current setting.
%
\DeclareOption{singlespaced}{\renewcommand{\@thesislnsp}{1}}
\DeclareOption{tightoneandahalfspaced}{\renewcommand{\@thesislnsp}{1.33}}
\DeclareOption{oneandahalfspaced}{\renewcommand{\@thesislnsp}{1.5}}
\DeclareOption{tightdoublespaced}{\renewcommand{\@thesislnsp}{1.66}}
\DeclareOption{doublespaced}{\renewcommand{\@thesislnsp}{2}}

%% All other options are passed to the base class directly.
%
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}


%%%%%%%%%%%% OPTION EXECUTION %%%%%%%%%%%%

%% Default settings.
%
\ExecuteOptions{12pt,oneside,openany,tightdoublespaced}
%
%% Process options.
%
\ProcessOptions


%%%%%%%%%%%% PACKAGE LOADING %%%%%%%%%%%%

%% Load base class using current setting for basic options.
%
\LoadClass[\@thesisptsz,		% set by 10pt/11pt/12pt
	\@thesisside,			% set by oneside/twoside
	\@thesisopen]			% set by openright/openany
	{report}

	
	\RequirePackage{needspace}					% Need this to ensure no orphaned section/subsection/etc headers JLG 2012-03-23
%Following  line commented out 5/14/2012 by rmw
%	\RequirePackage[defaultlines=2,all]{nowidow}  		% Load the nowidow package in order to eliminate widows and orphans entirely. needspace values set assuming this package is loaded. JLG 2012-03-23
	\RequirePackage[
		top=1in, 
		bottom=1in, 
		outer=1in, 
		inner=1in, 
		includeheadfoot, 
		nohead, 
		footskip=\@thesisfoot
	]{geometry}
	
%%%%%%%%%%%% MAIN CODE %%%%%%%%%%%%

%%%%%% Parameters
%
%% The following commands set the respective field values so we
%% can generate the title, signature and abstract pages automatically.
%
\newcommand{\degree}[1]%
  {\ifx\empty#1\empty\else\gdef\@degree{#1}\fi}
\newcommand{\department}[1]%
  {\ifx\empty#1\empty\else\gdef\@department{#1}\fi}
\newcommand{\gradmonth}[1]%
  {\ifx\empty#1\empty\else\gdef\@gradmonth{#1}\fi}
\newcommand{\gradyear}[1]%
  {\ifx\empty#1\empty\else\gdef\@gradyear{#1}\fi}
\renewcommand{\author}[1]%
  {\ifx\empty#1\empty\else\gdef\@author{#1}\fi}
%add for rmw-09172012  
%\newcommand{\firstdegree}[1]%
%  {\ifx\empty#1\empty\else\gdef\@firstdegree{#1}\fi}
%\newcommand{\firstdegyear}[1]%
%  {\ifx\empty#1\empty\else\gdef\@firstdegyear{#1}\fi}
%\newcommand{\firstdeginst}[1]%
%  {\ifx\empty#1\empty\else\gdef\@firstdeginst{#1}\fi}    
\newcommand{\lastdegree}[1]%
%add for rmw-09172012 
  {\ifx\empty#1\empty\else\gdef\@lastdegree{#1}\fi}
\newcommand{\lastdegyear}[1]%
  {\ifx\empty#1\empty\else\gdef\@lastdegyear{#1}\fi}
\newcommand{\lastdeginst}[1]%
  {\ifx\empty#1\empty\else\gdef\@lastdeginst{#1}\fi}
\renewcommand{\title}[1]%
  {\ifx\empty#1\empty\else\gdef\@title{#1}\fi}
\newcommand{\committeeA}[1]%
  {\ifx\empty#1\empty\else\gdef\@committeeA{#1}\fi}
\newcommand{\committeeAdept}[1]%
  {\ifx\empty#1\empty\else\gdef\@committeeAdept{#1}\fi}
\newcommand{\committeeB}[1]%
  {\ifx\empty#1\empty\else\gdef\@committeeB{#1}\fi}
\newcommand{\committeeBdept}[1]%
  {\ifx\empty#1\empty\else\gdef\@committeeBdept{#1}\fi}
\newcommand{\committeeC}[1]%
  {\ifx\empty#1\empty\else\gdef\@committeeC{#1}\fi}
\newcommand{\committeeCdept}[1]%
  {\ifx\empty#1\empty\else\gdef\@committeeCdept{#1}\fi}
%% Need to change the following to allow multiple departments use
\newcommand{\deptHead}[1]%
  {\ifx\empty#1\empty\else\gdef\@deptHead{#1}\fi}
\newcommand{\deptHeadTitle}[1]%
  {\ifx\empty#1\empty\else\gdef\@deptHeadTitle{#1}\fi}

%%%%%% Line Spacing
%
%% \linespacing is used to define the line spacing. If the argument
%% is less than 1.33 (for 1.5-spaced) a warning message is displayed
%% when not in draft mode.
%
\newcommand{\linespacing}[1]%
  {\newlinestretch{#1}
	\if @draft 		% warn if single space and not draft or caption
	\elseif @caption	%Added by JLG 2011-8-29
	\else	
		\if	dim #1pt < 1.33pt
		\typeout{CSULB-Thesis Class Warning: line spacing less than 1 1/2}
		\fi
	\fi
   }
%
%% changing spacing using, e.g., \begin{singlespaced}...\end{singlespaced}
%% which calls the newspacing environment defined immediately below;
%% which calls the newlinestretch command below that;
%% which modifies the baselinestretch command.
%
\newenvironment{singlespaced}%
  {\begin{newspacing}{1}}{\end{newspacing}}
\newenvironment{tightoneandahalfspaced}%
  {\begin{newspacing}{1.33}}{\end{newspacing}}
\newenvironment{oneandahalfspaced}%
  {\begin{newspacing}{1.5}}{\end{newspacing}}
\newenvironment{tightdoublespaced}%
  {\begin{newspacing}{1.66}}{\end{newspacing}}
  \newenvironment{doublespaced}%
  {\begin{newspacing}{2}}{\end{newspacing}}
\newenvironment{newspacing}[1]%
  {\par\begingroup\newlinestretch{#1}}	% start new line & grouping, change spacing
  {\par\vskip\parskip\vskip\baselineskip\endgroup
   \vskip-\parskip\vskip-\baselineskip} % start new line & change back spacing, end grouping
%
%% To change the actual line spacing.
%
\newcommand{\newlinestretch}[1]		% change baselinestretch to 
					% new multiplier, reassert text size
  {\renewcommand{\baselinestretch}{#1}\currenttextsize}
%
%% To keep track of the current text size.
%
\let\currenttextsize=\normalsize
%
%% Redefine size-changing commands to update \currenttextsize.
%
\let\tmp@tiny=\tiny
\renewcommand{\tiny}%
  {\let\currenttextsize=\tmp@tiny\tmp@tiny}
\let\tmp@scriptsize=\scriptsize
\renewcommand{\scriptsize}%
  {\let\currenttextsize=\tmp@scriptsize\tmp@scriptsize}
\let\tmp@footnotesize=\footnotesize
\renewcommand{\footnotesize}%
  {\let\currenttextsize=\tmp@footnotesize\tmp@footnotesize}
\let\tmp@small=\small
\renewcommand{\small}%
  {\let\currenttextsize=\tmp@small\tmp@small}
\let\tmp@normalsize=\normalsize
\renewcommand{\normalsize}%
  {\let\currenttextsize=\tmp@normalsize\tmp@normalsize}
\let\tmp@large=\large
\renewcommand{\large}%
  {\let\currenttextsize=\tmp@large\tmp@large}
\let\tmp@Large=\Large
\renewcommand{\Large}%
  {\let\currenttextsize=\tmp@Large\tmp@Large}
\let\tmp@LARGE=\LARGE
\renewcommand{\LARGE}%
  {\let\currenttextsize=\tmp@LARGE\tmp@LARGE}
\let\tmp@huge=\huge
\renewcommand{\huge}%
  {\let\currenttextsize=\tmp@huge\tmp@huge}
\let\tmp@Huge=\Huge
\renewcommand{\Huge}%
  {\let\currenttextsize=\tmp@Huge\tmp@Huge}
%
%% Make notes single-spaced if `spacednotes' option was not given.
%% Note that this does _not_ change the spacing of figures or tables.
%
\if@singlespacednotes			% Make footnotes single-spaced
\let\tmp@@footnotetext=\@footnotetext	% store current footnotetext command
\renewcommand{\@footnotetext}[1]%
  {{\newlinestretch{1}\tmp@@footnotetext{#1}}}
\let\tmp@@mpfootnotetext=\@mpfootnotetext % same for minipage footnotes
\renewcommand{\@mpfootnotetext}[1]%
  {{\newlinestretch{1}\tmp@@mpfootnotetext{#1}}}
\let\tmp@@marginparreset=\@marginparreset % same for marginal notes
\renewcommand{\@marginparreset}%
  {\newlinestretch{1}\tmp@@marginparreset}
\fi % end @singlespacednotes

%%%%%% New formatting environments and commands.
%
%% \begin{preliminary} sets the pagestyle and pagenumbering for the
%% preliminary sections; \end{preliminary} resets the pagenumbering.
%% The default page style is used outside of the preliminary block.
%
\newenvironment{preliminary}%
  {\pagestyle{plain}\pagenumbering{roman}}%
  {\cleardoublepage\pagenumbering{arabic}}
%
%% Change \maketitle to follow University guidelines.
%
\renewcommand{\maketitle}{
   \begingroup
   \begin{titlepage}
	\begin{center}
		\textbf{\@title}\\
		\vfill				% fill vertical space evenly
		A THESIS\\
		Presented to the Department of {\@department}\\
		California State University, Long Beach\\
		\vfill
		In Partial Fulfillment\\
		of the Requirements for the Degree\\
		{\@degree}\\
		\vfill
		Committee Members:\\
		\@committeeA\\
		\begin{singlespaced}
			\@committeeB\\
			\@committeeC\\
		%\end{singlespaced}
		%\vspace{\@thesisfoot}
    \hfill \break
		College Designee:\\
    \hfill \break
		\@deptHead\\
      \end{singlespaced}
		\vfill
		By {\@author}\\
%		{\@firstdegree}, {\@firstdegyear}, {\@firstdeginst}\\
		{\@lastdegree}, {\@lastdegyear}, {\@lastdeginst}\\	
		{\@gradmonth} {\@gradyear}
	\end{center}
	%\setcounter{page}{2}
   \end{titlepage}

   \begin{titlepage} 			% approval signature page
	\begin{center}
		WE, THE UNDERSIGNED MEMBERS OF THE COMMITTEE,\\
		HAVE APPROVED THIS THESIS\\
		\vfill\vfill
		\textbf{\@title}
		\vfill\vfill
		By \\
		{\@author}
		\vfill\vfill
		COMMITTEE MEMBERS\\
	\end{center}
	\vfill
	\begin{singlespaced}
		\noindent \makebox[5.75in]{\hrulefill}\\	% signature line (makebox controls size)
		\noindent \makebox[5.75in]{\@committeeA\hfill\@committeeAdept}\vspace*{.4in}
		\noindent\makebox[5.75in]{\hrulefill}\\
		\noindent\makebox[5.75in]{\@committeeB\hfill\@committeeBdept}\vspace*{.4in}
		\noindent\makebox[5.75in]{\hrulefill}\\
		\noindent\makebox[5.75in]{\@committeeC\hfill\@committeeCdept}
		\vfill\vfill
		\begin{center}
			ACCEPTED AND APPROVED ON BEHALF OF THE UNIVERSITY
		\end{center}
		\vfill\vfill
		\noindent\makebox[5.75in]{\hrulefill}\\
		\noindent \@deptHead\\
		\noindent \@deptHeadTitle
	\end{singlespaced}
	\vspace{0pt}
	\begin{center}
		California State University, Long Beach\\
		\@gradmonth\ \@gradyear
	\end{center}
	%\setcounter{page}{1}
    \end{titlepage}
\endgroup
%\setcounter{page}{2} % abstract begins on (ii) now

} % end maketitle
%
%% Change \begin{abstract}...\end{abstract} to follow guidelines
%% and put the abstract on a separate page (checking @openright).
%

\renewenvironment{abstract}{
   \if@openright\cleardoublepage\else\clearpage\fi % start new page
   \pagenumbering{roman} 		% roman num on first page is (ii) and onward
   \setcounter{page}{2}
    			% add 1/2 in. to top margin
   \begin{center}
	\vspace*{.625in}
   	  \bfseries
      \MakeUppercase{Abstract}\\
      %\MakeUppercase{\@title}\\
	\@title\\
      By\\
      {\@author}\\
      {\@gradmonth} {\@gradyear}
	\vspace{-4mm}% added by Ryan Hashi (2-26-14)  Too much space after the date.
   \end{center}
   \addcontentsline{toc}{chapter}{Abstract}
   \begingroup
}
{\par\endgroup				%
%   \ifnum\value{page}=1			% abstract did not go to second page
%      \thispagestyle{empty} 		% so don't number the page
%   \fi
   \newpage		 		% go to next page
   %\pagenumbering{roman} 		% change page numbering back to roman
   								% don't do this anymore, it's already roman
   								% and doing so resets the counter?
}% end abstract

%% \begin{acknowledgements}...\end{acknowledgements} formats an
%% acknowledgements section (on a separate page).
\newenvironment{acknowledgements}{
  \if@openright\cleardoublepage\else\clearpage\fi % start new page
  \vspace*{.625in}			% add 1/2 in. to top margin
    {\bfseries
    \centering{ACKNOWLEDGEMENTS}\\}
      \addcontentsline{toc}{chapter}{Acknowledgements}
   \begingroup
}%
{\par\endgroup\newpage}		% go to next page

%%%%%% Page Styles
%
%% Redefine all four standard page styles (empty, plain, headings,
%% myheadings), based on the definitions in `report', so that they
%% conform to the guidelines (and include draft information if
%% applicable). Also, a new page styles `toc', `lof', and `lot' to put column headings
%% on 2nd/subsequent pages of table of contents, list of figures, and
%% list of tables.
%
%% Pagestyle `empty'.
%
\renewcommand{\ps@empty}{\@thesispagefalse % not a thesis page
   \let\@mkboth\@gobbletwo		% no running headings
   \def\@oddfoot{\if@draft\blDRAFT\hfil	% put draft in 4 corners if draft
      {\slshape\small\today}\hfil\brDRAFT\fi}%
   \let\@evenfoot\@oddfoot
   \def\@oddhead{\if@draft\tlDRAFT\hfil
      {\slshape\small\today}\hfil\trDRAFT\fi}%
   \let\@evenhead\@oddhead
}%ps@empty
%
%% Pagestyle `plain'.
%
\renewcommand{\ps@plain}{\@thesispagefalse % not a thesis page
   \let\@mkboth\@gobbletwo
   \def\@oddfoot{\if@draft\blDRAFT\fi\hfil
      \thepage\hfil\if@draft\brDRAFT\fi}%
   \let\@evenfoot\@oddfoot
   \def\@oddhead{\if@draft\tlDRAFT\hfil
      {\slshape\small\today}\hfil\trDRAFT\fi}%
   \let\@evenhead\@oddhead
}%ps@plain
%
%% Pagestyle `toc'.
%
\newcommand{\ps@toc}{\@thesispagefalse
   \let\@mkboth\@gobbletwo
   \def\@oddfoot{\if@draft\blDRAFT\fi\hfil
      \thepage\hfil\if@draft\brDRAFT\fi}%
   \let\@evenfoot\@oddfoot
   %\def\@oddhead{APPENDIX\hfill Page}%Note by Ryan Hashi (1-7-14)--Originally "CHAPTER".  The 2nd page may not necessarily have chapters that spill over from the first page.  Appendices may spill over, or just the Bibliography section may be on the 2nd page.  The easiest way to adjust this is to set the title in here manually. LW: THIS IS WHAT WAS CAUSING THAT HOLY SHIT
   \let\@evenhead\@oddhead
   \let\chaptermark\@gobble\let\sectionmark\@gobble
}%ps@toc
%
%% Pagestyle `lof'.
%
\newcommand{\ps@lof}{\@thesispagefalse
   \let\@mkboth\@gobbletwo
   \def\@oddfoot{\if@draft\blDRAFT\fi\hfil
      \thepage\hfil\if@draft\brDRAFT\fi}%
   \let\@evenfoot\@oddfoot
   \def\@oddhead{FIGURE \hfill Page}%
   \let\@evenhead\@oddhead
   \let\chaptermark\@gobble\let\sectionmark\@gobble
}%ps@toc
%
%% Pagestyle `lot'.
%
\newcommand{\ps@lot}{\@thesispagefalse
   \let\@mkboth\@gobbletwo
   \def\@oddfoot{\if@draft\blDRAFT\fi\hfil
      \thepage\hfil\if@draft\brDRAFT\fi}%
   \let\@evenfoot\@oddfoot
   \def\@oddhead{TABLE \hfill Page}%
   \let\@evenhead\@oddhead
   \let\chaptermark\@gobble\let\sectionmark\@gobble
}%ps@toc
%

%%%%%% Document Layout
%
%% Default line spacing: use current setting from options.
%
\linespacing{\@thesislnsp}		% default doublespaced

\raggedright
\setlength{\parindent}{0.5in}

%% Default page style.
%
\pagestyle{plain}
%
%% Default values for the required fields.
%
\degree{\mbox{}} \department{\mbox{}} \gradyear{\number\year}
\author{\mbox{}}
\title{\mbox{}}
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Chapter headings
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\renewcommand\chapter{			% redefine \chapter command
    \if@openright\cleardoublepage\else\clearpage\fi% clear page
    \restoregeometry
    \thispagestyle{plain}		% set page style
    \global\@topnum\z@			% no figure on top of page
    \@afterindenttrue			% indent next paragraph (changed from default)
    \secdef\@chapter\@schapter}		% set chapter and chapter* completion macros

\def\@chapter[#1]#2{%			% define \@chapter command
    \ifnum \c@secnumdepth >\m@ne 	% if secnumdepth > -1
		\refstepcounter{chapter}	% increment the chapter counter
		\typeout{\@chapapp\space\thechapter.}% type CHAPTER #. to log
			\ifnum\thechapter=1 		% if this is chapter 1, ...
				% add font sized vertical space,...
				%{\addtocontents{toc}{\protect\addvspace{\@thesisptsz}}
				% add the heading "CHAPTER" to table of contents first
				%\addtocontents{toc}{\noindent CHAPTER\par}
		%}
        	\fi
		\addcontentsline{toc}{chapter}{%
		\hangindent=.5in\hspace{.25in}\protect\numberline{\thechapter.}#1}% adds #. name to toc
    \else
		\addcontentsline{toc}{chapter}{#1}% only adds name to toc
    \fi
    %
    %\chaptermark{#1}			% set the chapter for page headings on the TOC
    \@makechapterhead{#2}		% to add the head to doc - see below
    \@afterheading			% standard class config
}% end @chapter


\renewcommand{\@makechapterhead}[1]{	% put the chapter head in the doc
        \vspace*{0.625in}			% extra 1 in top margin on first page of chapter
        \normalfont			% reset font
        {\centering\MakeUppercase{\bfseries\@chapapp{ \thechapter}}\\} % type "CHAPTER #"
        {\centering\MakeUppercase{\bfseries#1}\\}	% chapter name in upper case
        }
	% end @makechapterhead

\def\@schapter#1{			% define \chapter* command (nothing in toc)
	\@makeschapterhead{#1}%
	\@afterheading			% standard class config
}% end @schapter

\renewcommand{\@makeschapterhead}[1]{{	% put the chapter* head in the doc
	\vspace*{0.625in}			% like \@makechapterhead above
        \normalfont
        {\centering\MakeUppercase{#1}\\}	% chapter name in upper case
}}% end @makeschapterhead


\newcommand{\@makesectionhead}[1]{	% put section head in doc
        \normalfont			% reset font
        {\needspace{1\baselineskip}\noindent\centering\bfseries{\thesection. #1}\\}	% put in the section name JLG 2012-03-23 use needspace to move ot next page if <2 lines follow on page
}% end @makesectionhead

\newcommand{\@makesubsectionhead}[1]{	% put subsection head in doc
        \normalfont			% reset font
        {\needspace{1\baselineskip}\noindent\bfseries{\thesubsection. #1}\\} % bold no indent
}% end @makesubsectionhead

\newcommand{\@makesubsubsectionhead}[1]{	% put subsection head in doc
        \normalfont			% reset font
        {\bfseries{\thesubsubsection. #1.}} % bold with indent but no newline with period at end
}% end @makesubsubsectionhead
\renewcommand{\section}[1]{%		% redefine section command
    \refstepcounter{section}		% increment section number
    \@makesectionhead{#1}		% put section head in doc - see above
    \ifnum \value{section}=1 		% if first section of chapter, ...
	\addtocontents{toc}{\protect\addvspace{12\p@}}% put an extra blank line in toc
    \fi
    \addcontentsline{toc}{section}{\hspace{.5in}#1}% add section name to toc
}% end section

\renewcommand{\subsection}[1]{		% redefine subsection command
    \refstepcounter{subsection}		% increment subsection number (added by JLG 2011-08-29)
    \@makesubsectionhead{#1}		% add subsection head, left align, underlined  JLG 2012-03-23 use needspace to move ot next page if <2 lines follow on page
    \addcontentsline{toc}{subsection}{\hspace{.5in}#1}% add subsection name to toc (added by JLG 2011-08-29)
}% end subsection

\renewcommand{\subsubsection}[1]{		% redefine subsubsection command (added by JLG 2011-08-29)
    \refstepcounter{subsubsection}		% increment subsubsection number (added by JLG 2011-08-29)
    \@makesubsubsectionhead{#1}.			% add subsubsection head: indented, underlined followed by a period and two spaces JLG 2012-03-23 use needspace to move ot next page if <1 lines follow on page
    \addcontentsline{toc}{subsubsection}{\hspace{.5in}#1}% add subsubsection name to toc (added by JLG 2011-08-29)
}% end subsection


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Appendices
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% HalfPage - used to create the half-page needed for Bibliography title page,
%% Appendix title page and title page for each appendix.
%% usage: \HalfPage{Bibliography} -or- \HalfPage{Appendices}
%
\def\HalfPage#1{%			% define HalfPage command
    \clearpage				% finish the current page (prints queued 
					% figures/tables), start new page
    \vspace*{0pt plus 1fil}		% advances half the vertical space
    \begin{center}
        \MakeUppercase{#1}		% puts the title in upper case
    \end{center}
    \addcontentsline{toc}{chapter}{#1}	% adds to toc 
    \newpage				% advances page
}% end HalfPage

%% new command - \myappendix{title}
%% use instead of \appendix{...}
%% creates the half-page title
%
\newcounter{myappendix}			% new counter for myappendix
\setcounter{myappendix}{0}%		% set counter to 0
\gdef\themyappendix{\@Alph\c@myappendix}% keep the counter in alpha (A,B,C, ...)

\newcommand\myappendix{			% define myappendix command
    \if@openright\cleardoublepage\else\clearpage\fi% clear page
    \thispagestyle{plain}		% set plain page style
    \global\@topnum\z@			% prevent figure from going at top of page
    \@afterindenttrue			% suppresses indent in first paragraph (not used?)
    \secdef\@myappendix\@sappendix	% use \@myappendix to define start of \myappendix
					% and \@sappendix to define start of \myappendix*
					% see below
}% end myappendix


\def\@myappendix[#1]#2{			% define section start for \myappendix
  \ifnum \c@secnumdepth >\m@ne	% if secnumdepth > -1
    \refstepcounter{myappendix}	% increment myappendix counter
    % was old line \typeout{APPENDIX\space\themyappendix.}% put in display
    \typeout{APPENDIX\space\themyappendix.}
	\if \themyappendix A
	  % add font sized vertical space,...
	  %{\addtocontents{toc}{\protect\addvspace{\@thesisptsz}}
	  % add the heading "APPENDIX" to table of contents first
	  %\addtocontents{toc}{\noindent APPENDIX\par}
	  %}
	\fi
	\addcontentsline{toc}{chapter}{\hspace{.25in}\protect\numberline{\themyappendix.}#1}% add to toc
  \else
	\addcontentsline{toc}{chapter}{#1}%
  \fi
  
  %\chaptermark{#1}			% for running headings (probably won't be used)
  \@makeappendixhead{#2}%
  \@afterheading			% standard class config
}% end @myappendix

\def\@sappendix#1{			% define section start for \myappendix*
    \@makesappendixhead{#1}%
    \@afterheading
}% end sappendix

\def\@makeappendixhead#1{		% put the appendix half page in the doc
    \newpage				% start a new page
    \vspace*{0pt plus 1fil}		% advance vertically 1/2 the page
    \begin{center} \bfseries
    APPENDIX \themyappendix\\		% add "APPENDIX X" where X is appendix letter (A,B,C,...)
    \MakeUppercase{#1}			% put appendix title in upper case
    \end{center}
    \newpage				% clear the page
}% end @makeappendixhead

\def\@makesappendixhead#1{{		% put the appendix head in the doc - no new page
   \normalfont				% (if used with \myappendix*)
   {\centering\MakeUppercase{#1}\\}
}}% end makesappendixhead

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Bibliography
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newdimen\bibindent			% add variable
\setlength\bibindent{.125in}		% set bibindent to 1.5em  
\renewcommand\newblock{\hskip .11em\@plus.33em\@minus.07em}
\let\@openbib@code\@empty

\renewenvironment{thebibliography}[1]	% redefine thebibliography command
     {\chapter*{\bibname}		% adds a heading for bibliography
     \newlinestretch{1}
     \vspace*{\baselineskip}
     \@mkboth{\MakeUppercase\bibname}{\MakeUppercase\bibname}% set page headings
     \list{\@biblabel{\@arabic\c@enumiv}}% set number for bib entry
	{\setlength{\itemindent}{-\bibindent}% set 1st line - hanging indent
	\settowidth\labelwidth{\@biblabel{#1}}% set width of label
	\advance\leftmargin\labelsep % advance the left margin for remaining lines
	\@openbib@code			% open the bib file
	\usecounter{enumiv}		% use 4th-level enumerate counter style
	\let\p@enumiv\@empty		% blank the counter?
	\renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy				% sloppy right margin (University thesis rule)
      \clubpenalty4000			% set high widow and club penalties, although 10000 may be necessary
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m	% not sure what this is
}			
{
	\def\@noitemerr			% display warning if nothing there
	{\@latex@warning{Empty `thebibliography' environment}}%
	\endlist
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Table of Contents
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% ToC entry formatting commands
\renewcommand{\contentsname}{Table of contents}%set the name
\renewcommand\@dotsep{1}
\renewcommand*\l@section{\@dottedtocline{1}{2em}{2.3em}}% the rest of the l@'s are standard
\renewcommand*\l@subsection{\@dottedtocline{2}{3.8em}{3.2em}}
\renewcommand*\l@subsubsection{\@dottedtocline{3}{7.0em}{4.1em}}
\renewcommand*\l@paragraph{\@dottedtocline{4}{10em}{5em}}
\renewcommand*\l@subparagraph{\@dottedtocline{5}{12em}{6em}}

\setcounter{tocdepth}{1}		% only chapter and section headings in toc (modified JLG 2011-8-29)

\renewcommand\tableofcontents{		% redefine table of contents
				% following length changes allow heading on 2nd page of TOC (if any)
	\newgeometry{top=1in, bottom=1in, outer=1in, inner=1.5in, includeheadfoot, headheight=\@thesisptsz, headsep=\@thesisptsz, footskip=\@thesisptsz}
	\thispagestyle{plain}		% first page does not use toc page style
	\pagestyle{toc}			% subsequent pages (if any) - types "Page" in upper right
	\null\vspace{0pt}
	\vspace*{22pt}
	{\bfseries\centering{TABLE OF CONTENTS}\\}	% title of page
	\hfill Page\par			% right-aligns "Page"
	\begin{singlespaced}
	\@starttoc{toc}			% start the toc
	\newpage				% go to next page
	\pagestyle{plain}			% reset page style
	\end{singlespaced}
	\restoregeometry
}% end tableofcontents

%% LW 2019 -- I commented out the line starting with \vskip here
%% to try to get strict double spacing of entries. Only lines going on
%% longer than one line are single spaced, but strict double spacing between
%% entries. Just simplify all this shit, I think it's way easier now
\renewcommand*\l@chapter[2]{		% redefine the writing of the chapter line in the toc
    \ifnum \c@tocdepth >\m@ne		% if tocdepth > -1
	\addpenalty{-\@highpenalty}	% prefer a page break before starting entry if needed
	%\vskip 1.0em \@plus\p@		% small white space
	\setlength\@tempdima{1.5em}	% save width of number part
	\begingroup
	\parindent \z@ 			% set paragraph indent to zero
	\rightskip \@pnumwidth		% leave enough room on the right for page num
	\parfillskip -\@pnumwidth
	\leavevmode %\bfseries		% leave vertical mode - but no bold font as usually done
	\advance\leftskip\@tempdima	% 
	\hskip -\leftskip		% 
	\uppercase{#1}\nobreak\		% print toc entry
	\leaders\hbox{$\m@th		% print the leader to the page num
        \mkern \@dotsep mu\hbox{.}\mkern \@dotsep mu$}
	\hfil \nobreak\hb@xt@\@pnumwidth{\hss #2}\par % print the page num and end paragraph
	\penalty\@highpenalty		% set high penalty to avoid page break
	\endgroup
    \fi}% end l@chapter

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% fill
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% List of Tables and List of Figures
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\renewcommand\listoftables{		% redefine list of tables
    \newgeometry{top=1in, bottom=1in, outer=1in, inner=1.5in, includeheadfoot, headheight=\@thesisptsz, headsep=\@thesisptsz, footskip=\@thesisptsz}
	    \thispagestyle{plain}		% first page does not use lot page style
	    \pagestyle{lot}			% subsequent pages (if any) - types "Page" in upper right
	    \null\vspace{0pt}			% Need this or title wont show
	    \vspace*{0.306in}			% This value gives us a total 2in top margin (not sure why)
	    {\bfseries\centering{LIST OF TABLES}\\}	% print title
	    \noindent TABLE \hfill Page\par	% subtitle
	    \addcontentsline{toc}{chapter}{List of Tables}% add to toc
	    \begin{singlespaced}		% Singlespace the list
		    \@starttoc{lot}		% Insert the list of tables
	    \end{singlespaced}
    \restoregeometry	% reset page geometry
    \pagestyle{plain}	% reset page style
}% end listoftables
    
\renewcommand\listoffigures{		% redefine list of tables
    \newgeometry{top=1in, bottom=1in, outer=1in, inner=1.5in, includeheadfoot, headheight=\@thesisptsz, headsep=\@thesisptsz, footskip=\@thesisptsz}
	    \thispagestyle{plain}		% first page does not use lot page style
	    \pagestyle{lof}			% subsequent pages (if any) - types "Page" in upper right
	    \null\vspace{0pt}			% Need this or title wont show
	    \vspace*{0.306in}			% This value gives us a total 2in top margin (not sure why)
	    {\bfseries\centering{LIST OF FIGURES}\\}	% print title
  	    \noindent FIGURE \hfill Page\par	% subtitle
	    \addcontentsline{toc}{chapter}{List of Figures}% add to toc
	    \begin{singlespaced}		% Singlespace the list
		    \@starttoc{lof}		%Insert the list of figures
	    \end{singlespaced}
    \restoregeometry	% reset page geometry
    \pagestyle{plain}	% reset page style
}% end listoffigures

%%  The following two values seem to give the ToC, LoF, LoT linebreaking conditions that the library wants
\renewcommand{\@pnumwidth}{3.1em}	% Set width of ToC, LoF, LoT page number column
\renewcommand{\@tocrmarg}{3em plus 1fill}

%% Indent and index number width values for LoF and LoT
\renewcommand*\l@figure{\@dottedtocline{1}{0.25in}{2em}}
\renewcommand*\l@table{\@dottedtocline{1}{0.25in}{2em}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%              Captions for lists of Tables and Figures
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% To make the non-standard entry for list of Tables and Figures
% #1 contains the word figure or table, 
% #2 contains alternate caption (if any), #3 contains regular caption
% ext@#1 matches to lof or lot, the#1 represents the number in 
% thefigure or thetable

\long\def\@caption#1[#2]#3{		% redefine caption command 
\addtocontents{\csname ext@#1\endcsname}% put in list of (tables/figures)
{\protect\addvspace{\@thesisptsz} \protect\hangindent=0.25in \protect\hangafter=1}		% add font sized vertical space,...    
\addcontentsline{\csname ext@#1\endcsname}{#1}% then add to the list
	{\protect\numberline{{\csname%
  the#1\endcsname}.}#2}			% add #. caption
 \par					% start new paragraph
 \begingroup
  \@parboxrestore			% standard config - restore important defaults
  \@makecaption{\csname fnum@#1\endcsname}{#3}% call the macro to put the caption in the doc
  %\@parboxrestore			% standard config - restore important defaults
  \par					% start new paragraph
 \endgroup
}

%\newcounter{figure}%already defined
\renewcommand \thefigure		% redefine the figure number as arabic
     {\@arabic\c@figure}

\def\fnum@figure{\bfseries\MakeUppercase{\figurename}\nobreakspace\thefigure}
					% define the word "FIGURE" uppercase in caption

%\newcounter{table}%already defined
\renewcommand \thetable			% redefine the table number as arabic
     {\@arabic\c@table}

\def\fnum@table{\bfseries\MakeUppercase{\tablename}\nobreakspace\thetable}
					% define the word "TABLE" uppercase in caption
\setlength\abovecaptionskip{0\p@}	% define no space above caption
\setlength\belowcaptionskip{\@thesisptsz}	% define font sized space below caption
					% accounts for setting caption to singlespaced
					% if longer than one line

\long\def\@makecaption#1#2{		% define the macro that puts the caption in the doc
    \vskip\abovecaptionskip		% space above caption (set to zero above)
    \let\@templinestretch\baselinestretch% save baselinestretch
    \newlinestretch{1}			% single space
    \raggedright{#1.  #2}		% put in caption
  \vskip\belowcaptionskip%		% space below caption (12pt = 1 line)
  \newlinestretch{\@templinestretch}	% restore line spacing to saved value ( JLG 2011-8-29 swapped positions with \vskip\belowcaptionskip above)
}% end @makecaption


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%              Numbering for Tables and Figures
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% numbering for figures and tables is defined in report.cls to reset after
% chapter - we can't have that. Custom csulb-report.cls replaced report.cls
% to fix this, but that is too little a reason to have that as an extra file.
% here we remove these from resetting counters.

% duplicate the functionality of remreset.sty so it doesn't have to be loaded
\def\@removefromreset#1#2{{%
  \expandafter\let\csname c@#1\endcsname\@removefromreset
  \def\@elt##1{%
    \expandafter\ifx\csname c@##1\endcsname\@removefromreset
    \else
      \noexpand\@elt{##1}%
    \fi}%
  \expandafter\xdef\csname cl@#2\endcsname{%
    \csname cl@#2\endcsname}}}

% remove the figure and table counters from resetting
\@removefromreset{figure}{chapter}
\def\thefigure{\@arabic\c@figure}

\@removefromreset{table}{chapter}
\def\thetable{\@arabic\c@table}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% End of CSULB-THESIS.CLS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
