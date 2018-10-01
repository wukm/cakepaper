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
%% 11. 
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
\ProvidesClass{csulb-thesis_april}%

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

%% Macro for testing the size of margins.
\newcommand{\@marginsize}{}

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


%%%%%%%%%%%% OPTION DECLARATION %%%%%%%%%%%%

%% `draft' option: change default document settings.
%% set font to 11pt, line spacing to singlespaced, margins to normalmargins
\DeclareOption{draft}{\@drafttrue	% if [draft] set in options to \documentclass
   \typeout{CSULB-Thesis Class Option: `draft'}
   \ExecuteOptions{11pt,		% instead of 12pt
		oneside,		% was twoside, but we default everything to oneside
					% and twoside can be added as another 
					% option e.g. [twoside,draft]
		openright,		% only matters with twoside, but set in case 
					% someone uses twoside
		singlespaced,		% instead of doublespaced
		normalmargins}
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

%% Margin options: change the size of margins.
%% have not tested anything except normal margins
%
\DeclareOption{narrowmargins}{\renewcommand{\@marginsize}{0}}
\DeclareOption{normalmargins}{\renewcommand{\@marginsize}{1}}
\DeclareOption{widemargins}{\renewcommand{\@marginsize}{2}}
\DeclareOption{extrawidemargins}{\renewcommand{\@marginsize}{3}}

%% Point Size options: change current setting.
%
\DeclareOption{10pt}{\renewcommand{\@thesisptsz}{10pt}}
\DeclareOption{11pt}{\renewcommand{\@thesisptsz}{11pt}}
\DeclareOption{12pt}{\renewcommand{\@thesisptsz}{12pt}}

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
\DeclareOption{oneandahalfspaced}{\renewcommand{\@thesislnsp}{1.33}}
\DeclareOption{doublespaced}{\renewcommand{\@thesislnsp}{1.66}}

%% All other options are passed to the base class directly.
%
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}


%%%%%%%%%%%% OPTION EXECUTION %%%%%%%%%%%%

%% Default settings.
%
\ExecuteOptions{12pt,oneside,openright,doublespaced,normalmargins}
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
\newcommand{\lastdegree}[1]%
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
  {\newlinestretch{#1}\if@draft\else	% warn if single space and not draft
	\ifdim #1pt < 1.33pt\typeout
   {CSULB-Thesis Class Warning: line spacing less than 1 1/2}\fi\fi}
%
%% `longquote' and `longquotation' produce single-spaced quotes, while
%% `newspacing' encloses paragraphs with a different line spacing,
%% such as `singlespaced', `oneandahalfspaced', or `doublespaced'.
%
%\newenvironment{longquote}%
% {\begin{quote}\newlinestretch{1}}{\end{quote}}
%\newenvironment{longquotation}%
% {\begin{quotation}\newlinestretch{1}}{\end{quotation}}

%% changing spacing using, e.g., \begin{singlespaced}...\end{singlespaced}
%% which calls the newspacing environment defined immediately below;
%% which calls the newlinestretch command below that;
%% which modifies the baselinestretch command.
%
\newenvironment{singlespaced}%
  {\begin{newspacing}{1}}{\end{newspacing}}
\newenvironment{oneandahalfspaced}%
  {\begin{newspacing}{1.33}}{\end{newspacing}}
\newenvironment{doublespaced}%
  {\begin{newspacing}{1.66}}{\end{newspacing}}
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
   \enlargethispage{.75in} 		% make this page larger
  \begin{center}
      \mbox{} 				% empty box - not sure why
      %\MakeUppercase{\@title}\\	
	\@title\\
      %\vspace{2in} %using vfills instead-see next line
      \vfill				% fill vertical space evenly
      A THESIS\\
      Presented to the Department of {\@department}\\
      California State University, Long Beach\\
      %\vspace{2in}
      \vfill
      In Partial Fulfillment\\
      of the Requirements for the Degree\\
      {\@degree}\\
      %\vspace{2in}
      \vfill
      Committee Members:\\
      \@committeeA\\
      \newlinestretch{.83}
      \@committeeB\\
      \@committeeC\\
      \newlinestretch{1.66}
      College Designee:\\
      \@deptHead\\
      %\vspace{0.5in}
      \vfill
      By {\@author}\\
      {\@lastdegree}, {\@lastdegyear}, {\@lastdeginst}\\
      {\@gradmonth} {\@gradyear}
      \vspace{.2in}
      \mbox{}
\end{center}
   \setcounter{page}{1}
   \end{titlepage}

   \setcounter{page}{2}
   \endgroup


} % end maketitle
%
%% Change \begin{abstract}...\end{abstract} to follow guidelines
%% and put the abstract on a separate page (checking @openright).
%%%%%%%%%%%%%%%%%%%%%%                 ABSTRACT                %%%%%%%%%%%%%%%

\renewenvironment{abstract}{
   \if@openright\cleardoublepage\else\clearpage\fi % start new page
   \pagenumbering{roman} 	\setcounter{page}{2}	% arabic num on 2nd page if it exists
   \vspace*{-.5in} 			% add 1/2 in. to top margin
   \vspace*{-12pt}			% move up a line - workaround (see below)
   \addcontentsline{toc}{chapter}{Abstract}
   \begin{center}
      \MakeUppercase{{Abstract}}\\
      %\MakeUppercase{\@title}\\
	\@title\\
      By\\
      {\@author}\\
      {\@gradmonth} {\@gradyear}
   \end{center}
   \vspace*{-12pt}			% move up a line - a workaround since
					% begin/end center puts extra vertical space
   \begingroup
   %% Adjust the line spacing: if it was less than 1 1/2,
   %% increase it to 1 1/2; if it was between 1 1/2 and 2,
   %% increase it to 2; otherwise, leave it as is.
   \ifdim \baselinestretch pt < 1.33pt \newlinestretch{1.33}\else
   \ifdim \baselinestretch pt < 1.66pt \newlinestretch{1.66}\fi\fi
}{\par\endgroup				%
   \ifnum\value{page}=1			% abstract did not go to second page
      \thispagestyle{empty} 		% so don't number the page
   \fi
   \newpage		 		% go to next pager
}% end abstract
%
%% \begin{dedication}...\end{dedication} formats a
%% dedication section (*not* on a separate page).
%% Not currently allowed by University.
%
\newenvironment{dedication}%
  {\begin{center}
      \section*{Dedication}
   \end{center}
   \begingroup}%
  {\par\endgroup}
%
%% \begin{acknowledgements}...\end{acknowledgements} formats an
%% acknowledgements section (on a separate page).
%%%%%%%%%%%%%%%%%%%%%%%%%%%     ACKNOWLEDGEMENTS %%%%%%%%%%%%%%%
\newenvironment{acknowledgements}{
  \if@openright\cleardoublepage\else\clearpage\fi % start new page
  \vspace*{-.5in}			% add 1/2 in. to top margin
    {\centering{\textbf{ACKNOWLEDGEMENTS}}\\}
      \addcontentsline{toc}{chapter}{Acknowledgements}
   \begingroup}%
  {\par\endgroup\newpage}		% go to next page

%% Redefine `thebibliography' environment so that it generates
%% headers in the same style as the rest of the document.
%
\let\tmp@thebibliography=\thebibliography % store current command
\renewcommand{\thebibliography}[1]{	% redefine \thebibliography
	\tmp@thebibliography{#1}	% do what it does now
   \if@thesispage\@mkboth{		% set the running headings (not likely to use)
	\textsc{\bibname}}{\textsc{\bibname}}\fi}

%% Variations of \cleardoublepage that explicitly set the pagestyle
%% of any inserted blank page.
%
\newcommand{\clearemptydoublepage}%
  {{\pagestyle{empty}\cleardoublepage}}
\newcommand{\clearplaindoublepage}%
  {{\pagestyle{plain}\cleardoublepage}}

%%%%%% Page Styles
%
%% Redefine all four standard page styles (empty, plain, headings,
%% myheadings), based on the definitions in `report', so that they
%% conform to the guidelines (and include draft information if
%% applicable). Then, define a new pagestyle `utthesis' (default).
%% Also, a new page styles `toc', `lof', and `lot' to put column headings
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
%% Pagestyle `headings'.
%
\if@twoside 				% if two-sided printing
\renewcommand{\ps@headings}{\@thesispagefalse % not a thesis page
   \let\@mkboth\markboth
   \def\@oddfoot{\if@draft\blDRAFT\hfil	% put draft in 4 corners if draft
      {\slshape\small\today}\hfil\brDRAFT\fi}%
   \let\@evenfoot\@oddfoot
   \def\@oddhead{\if@draft\tlDRAFT\fi{\slshape\rightmark}\hfil
      \thepage\if@draft\trDRAFT\fi}%
   \def\@evenhead{\if@draft\tlDRAFT\fi\thepage\hfil
      {\slshape\leftmark}\if@draft\trDRAFT\fi}%
   \def\chaptermark##1{\markboth	% add chap/sec left/right running headings
					% (probably won't use)
      {\MakeUppercase{\ifnum\c@secnumdepth >\m@ne
         \@chapapp\ \thechapter. \ \fi ##1}}{}}%
   \def\sectionmark##1{\markright
      {\MakeUppercase{\ifnum\c@secnumdepth >\z@
         \thesection. \ \fi ##1}}}%
}% end ps@headings
\else 					% if one-sided printing
\renewcommand{\ps@headings}{\@thesispagefalse
   \let\@mkboth\markboth
   \def\@oddfoot{\if@draft\blDRAFT\hfil
      {\slshape\small\today}\hfil\brDRAFT\fi}%
   \def\@oddhead{\if@draft\tlDRAFT\fi{\slshape\rightmark}\hfil
      \thepage\if@draft\trDRAFT\fi}%
   \def\chaptermark##1{\markright
      {\MakeUppercase{\ifnum\c@secnumdepth >\m@ne
         \@chapapp\ \thechapter. \ \fi ##1}}}%
}% end ps@headings
\fi% end @twoside
%
%% Pagestyle `myheadings'.
%
\renewcommand{\ps@myheadings}{\@thesispagefalse
   \let\@mkboth\@gobbletwo
   \def\@oddfoot{\if@draft\blDRAFT\hfil
      {\slshape\small\today}\hfil\brDRAFT\fi}%
   \let\@evenfoot\@oddfoot
   \def\@oddhead{\if@draft\tlDRAFT\fi{\slshape\rightmark}\hfil
      \thepage\if@draft\trDRAFT\fi}%
   \def\@evenhead{\if@draft\tlDRAFT\fi\thepage\hfil
      {\slshape\leftmark}\if@draft\trDRAFT\fi}%
   \let\chaptermark\@gobble\let\sectionmark\@gobble
}%ps@myheadings
%
%% Pagestyle `utthesis' (based on `headings').
%% This is the page style for all thesis pages.
%
\if@twoside 				% if two-sided printing
\newcommand{\ps@utthesis}{\@thesispagetrue % is a thesis page
   \let\@mkboth\markboth
   \def\@oddfoot{\if@draft\blDRAFT\hfil	% put in draft in 4 corners if a draft
      {\slshape\small\today}\hfil\brDRAFT\fi}%
   \let\@evenfoot\@oddfoot
   \def\@oddhead{\if@draft\tlDRAFT\fi{\slshape\rightmark}\hfil
      \thepage\if@draft\trDRAFT\fi}%
   \def\@evenhead{\if@draft\tlDRAFT\fi\thepage\hfil
      {\slshape\leftmark}\if@draft\trDRAFT\fi}%
   \def\chaptermark##1{\markboth	% left/right running head (prob won't be used)
      {\textsc{\ifnum\c@secnumdepth >\m@ne
         \@chapapp\ \thechapter. \ \fi ##1}}{}}%
   \def\sectionmark##1{\markright
      {\textsc{\ifnum\c@secnumdepth >\z@
         \thesection. \ \fi ##1}}}%
}%ps@utthesis
\else 					% if one-sided printing
\newcommand{\ps@utthesis}{\@thesispagetrue
   \let\@mkboth\markboth
   \def\@oddfoot{\hfil\thepage\hfil}
   % Inside oddfoot if footer should be raised:\raisebox{-9pt}
   %\def\@oddfoot{\if@draft\blDRAFT\hfil
   % {\slshape\small\today}\hfil\brDRAFT\fi}%
   %\def\@oddhead{\if@draft\tlDRAFT\fi{\slshape\rightmark}\hfil
   % \if@draft\trDRAFT\fi}%
   %\def\chaptermark##1{\markright
  %{\textsc{\ifnum\c@secnumdepth >\m@ne
   % \@chapapp\ \thechapter. \ \fi ##1}}}%
}%ps@utthesis
\fi%@twoside
%
%% Pagestyle `toc'.
%
\newcommand{\ps@toc}{\@thesispagefalse
   \let\@mkboth\@gobbletwo
   \def\@oddfoot{\if@draft\blDRAFT\fi\hfil
      \thepage\hfil\if@draft\brDRAFT\fi}%
   \let\@evenfoot\@oddfoot
   \def\@oddhead{\hfill Page}%
   \def\@evenhead\oddhead
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
   \def\@evenhead\oddhead
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
   \def\@evenhead\oddhead
   \let\chaptermark\@gobble\let\sectionmark\@gobble
}%ps@toc
%

%%%%%% Document Layout
%
%% Default line spacing: use current setting from options.
%
\linespacing{\@thesislnsp}		% default doublespaced

%% Page layout (see The LaTeX Companion pp.84-86).
%
%% By default, TeX puts the `reference point' one inch down and to
%% the right of the top-left corner of the page. This moves it back
%% to the top-left corner (making the rest of the layout easier to
%% define).
%
\setlength{\voffset}{-1in} \setlength{\hoffset}{-1in}
%
%% Instead of hard-coding the page layout for letter paper
%% (8.5" x 11"), we will base it on \paperheight and \paperwidth,
%% so that it works with options that change the paper size.
%
\setlength{\textheight}{\paperheight} \setlength{\textwidth}{\paperwidth}
%
%% Now, set the margin-dependent values.
%% Note the ifcase construct: the four values for @marginsize
%% are listed above as one of the options.
%% the default is the second option, normal margins.
%
\ifcase\@marginsize % set narrow margins: 1 1/4" left, 3/4" others
%
\addtolength{\textheight}{-1in} \setlength{\topmargin}{.5in}
\setlength{\headsep}{0in} \setlength{\footskip}{.25in}
\addtolength{\textwidth}{-1in} \setlength{\oddsidemargin}{1.25in}
\setlength{\evensidemargin}{1in} \setlength{\marginparwidth}{.5in}
\setlength{\marginparsep}{.125in}
%
\or % set normal margins: 1.6" left, 1" others %%Changed to 1.5 on left %%
%
%\addtolength{\textheight}{-1.75in}
 \setlength{\topmargin}{-.5in}
\addtolength{\textheight}{-2.5in} \setlength{\topmargin}{.5in} %% - original before change
\setlength{\headsep}{.5in} \setlength{\footskip}{.8in}
\addtolength{\textwidth}{-1in} \setlength{\oddsidemargin}{1in} %% - original before change I FIXED THE MARGINS FOR NOT TOC HERE
\addtolength{\textwidth}{-1in} \setlength{\oddsidemargin}{1in}  % original before change I FIXED THE MARGINS FOR NOT TOC HERE
\setlength{\evensidemargin}{1in} \setlength{\marginparwidth}{.75in}
\setlength{\marginparsep}{.125in}
%
\or % set wide margins: 1 1/4" all around
%
\addtolength{\textheight}{-2.5in} \setlength{\topmargin}{.5in}
\setlength{\headsep}{.75in} \setlength{\footskip}{.75in}
\addtolength{\textwidth}{-2.5in} \setlength{\oddsidemargin}{1.25in}
\setlength{\evensidemargin}{1in} \setlength{\marginparwidth}{.75in}
\setlength{\marginparsep}{.25in}
%
\or % set extra wide margins: 1 1/2" all around
%
\addtolength{\textheight}{-1in} \setlength{\topmargin}{.5in}
\setlength{\headsep}{.75in} \setlength{\footskip}{.75in}
\addtolength{\textwidth}{-3in} \setlength{\oddsidemargin}{1.5in}
\setlength{\evensidemargin}{1.5in} \setlength{\marginparwidth}{1in}
\setlength{\marginparsep}{.25in}
%
\fi%@marginsize
%
%% Adjust \headsep to include height of running head.
%
\addtolength{\headsep}{-\headheight}
%
%% Adjust the vertical spacing between the main text and the notes,
%% and between successive notes if they are not single-spaced.
%
\setlength{\skip\footins}{.75\baselineskip} \if@singlespacednotes\else
\let\oldtextsize=\currenttextsize
\footnotesize \setlength{\marginparpush}{\baselineskip}
\setlength{\footnotesep}{\baselineskip} \oldtextsize
\fi%@singlespacednotes
%
%% Make each page fill up the entire page.
%\flushbottom


%% Default page style.
%
\pagestyle{utthesis}
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
    \thispagestyle{plain}		% set page style
    \global\@topnum\z@			% no figure on top of page
    \@afterindenttrue			% indent next paragraph (changed from default)
    \secdef\@chapter\@schapter}		% set chapter and chapter* completion macros

\def\@chapter[#1]#2{%			% define \@chapter command
    \ifnum \c@secnumdepth >\m@ne 	% if secnumdepth > -1
	\refstepcounter{chapter}	% increment the chapter counter
	\typeout{\@chapapp\space\thechapter.}% type CHAPTER #. to log
	\ifnum\thechapter=1 		% if this is chapter 1, ...
{\addtocontents{toc}{\protect\addvspace{12\p@}}% add 12pt. vertical space,...
\addtocontents{toc}{\noindent \par}}% add the heading "CHAPTER"
					% to table of contents first
        \fi
	\addcontentsline{toc}{chapter}{%
	\noindent\protect\numberline{\thechapter.}#1}% adds #. name to toc
    \else
	\addcontentsline{toc}{chapter}{#1}% only adds name to toc
    \fi
    \chaptermark{#1}			% set the chapter for page headings
%\addtocontents{lof}{\protect\addvspace{10\p@}}% not used
%\addtocontents{lot}{\protect\addvspace{10\p@}}% not used
    \if@twocolumn			% if two column mode (standard class config)
	\@topnewpage[\@makechapterhead{#2}]% chapter head in doc - see below
    \else
	\@makechapterhead{#2}		% to add the head to doc - see below
	\@afterheading			% standard class config
    \fi}% end @chapter


\renewcommand{\@makechapterhead}[1]{{	% put the chapter head in the doc
       %\vspace*{1in}			% extra 1/2 in top margin on first page of chapter
        \normalfont \bfseries			% reset font
        {\centering\MakeUppercase{\@chapapp{ \thechapter}}\\} % type "CHAPTER #"
        {\centering\MakeUppercase{#1}\\}	% chapter name in upper case
        }}% end @makechapterhead

\def\@schapter#1{			% define \chapter* command (nothing in toc)
    \if@twocolumn
	\@topnewpage[\@makeschapterhead{#1}]% chapter head in doc - see below
    \else
	\@makeschapterhead{#1}%
	\@afterheading			% standard class config
    \fi}% end @schapter

\renewcommand{\@makeschapterhead}[1]{{	% put the chapter* head in the doc
	\vspace*{.5in}			% like \@makechapterhead above
        \normalfont
        {\centering\MakeUppercase{#1}\\}	% chapter name in upper case
}}% end @makeschapterhead


\newcommand{\@makesectionhead}[1]{	% put section head in doc
        \normalfont			% reset font

        {\centering  \textbf{#1}\\}	% put in the section name (underlined)
}% end @makesectionhead

\renewcommand{\section}[1]{%		% redefine section command
    \refstepcounter{section}		% increment section number
    \@makesectionhead{#1}		% put section head in doc - see above
    \ifnum \value{section}=1 		% if first section of chapter, ...
	%\addtocontents{toc}{\protect\addvspace{12\p@}}% put an extra blank line in toc
    \fi
    %\addcontentsline{toc}{section}{\hspace{.5in}#1}% add section name to toc
}% end section

\renewcommand{\subsection}[1]{		% redefine subsection command
    %\vspace{12pt}			% not used
    \noindent\textbf{#1}\\		% add subsection head, left align, underlined
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
	
\bfseries				% figures/tables), start new page
    \vspace*{0pt plus 1fil}		% advances half the vertical space
    \begin{center}
        \MakeUppercase{#1}		% puts the title in upper case
    \end{center}
    \addcontentsline{toc}{chapter}{#1}	% adds to toc 
    \newpage				% advances page
}% end HalfPage

\renewcommand\appendix{\par		% redefine appendix command 
					% (use \myappendix instead - see below)
  \setcounter{chapter}{0}		% set chapter counter to 0
  \gdef\@chapapp{\appendixname}		% set global name
  \gdef\thechapter{\@Alph\c@chapter}
  \addcontentsline{toc}{chapter}	% add to toc
}% end appendix

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
  \bfseries  \ifnum \c@secnumdepth >\m@ne	% if secnumdepth > -1
	\refstepcounter{myappendix}	% increment myappendix counter
	\typeout{\textbf{APPENDIX}\space\themyappendix.}% put in display
	\addcontentsline{toc}{chapter}{\hspace{.25in}\protect\numberline{\themyappendix.}#1}% add to toc
	\addcontentsline{toc}{chapter}{\protect\numberline{\themyappendix}#1}% not used
    \else
	\addcontentsline{toc}{chapter}{\hspace{.25in}\protect\numberline{\themyappendix.}#1}%
	\addcontentsline{toc}{chapter}{#1}% not use
    \fi
    \chaptermark{#1}			% for running headings (probably won't be used)
    \addtocontents{lof}{\protect\addvspace{10\p@}}% not used
    \addtocontents{lot}{\protect\addvspace{10\p@}}% not used
    \if@twocolumn			% if in two-column mode
	\@topnewpage[\@makeappendixhead{#2}]% call appendix head - see below
    \else
	\@makeappendixhead{#2}%
	\@afterheading			% standard class config
    \fi}% end @myappendix

\def\@sappendix#1{			% define section start for \myappendix* 
 \bfseries  \if@twocolumn
	\@topnewpage[\@makesappendixhead{#1}]%similar to @myappendix above but no toc entry
    \else
	\@makesappendixhead{#1}%
	\@afterheading
    \fi}% end sappendix

\def\@makeappendixhead#1{	\bfseries	% put the appendix half page in the doc
    \newpage				% start a new page
    \vspace*{0pt plus 1fil}		% advance vertically 1/2 the page
    \begin{center}
    APPENDIX \themyappendix\\		% add "APPENDIX X" where X is appendix letter (A,B,C,...)
    \MakeUppercase{#1}		% put appendix title in upper case

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

%\newdimen\bibindent			% add variable
%\setlength\bibindent{1.5em}		% set bibindent to 1.5em

\renewenvironment{thebibliography}[1]	% redefine thebibliography command
  {\chapter*{\bibname}		% adds a heading for bibliography
     \vspace{12pt}\normalfont
     \@mkboth{\MakeUppercase\bibname}{\MakeUppercase\bibname}% set page headings
     \list{\@biblabel{\@arabic\c@enumiv}}% set number for bib entry
	{\setlength{\itemindent}{-\bibindent}% set 1st line - hanging indent
	\settowidth\labelwidth{\@biblabel{#1}}% set width of label
	\leftmargin\labelwidth		% set other lines - hanging indent - from labelwidth
	\advance\leftmargin\labelsep	% advance the left margin for remaining lines
	\@openbib@code			% open the bib file
	\usecounter{enumiv}		% use 4th-level enumerate counter style
	\let\p@enumiv\@empty		% blank the counter?
	\renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy				% sloppy right margin (University thesis rule)
      \clubpenalty4000			% set high widow and club penalties, although 10000 may be necessary
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}			% not sure what this is
     {\def\@noitemerr			% display warning if nothing there
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}
\renewcommand\newblock{\hskip .11em\@plus.33em\@minus.07em}
\let\@openbib@code\@empty




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Table of Contents
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



\setcounter{tocdepth}{2}		% only chapter and section headings in toc
\renewcommand{\contentsname}{Table of contents}%set the name
\renewcommand\tableofcontents{		% redefine table of contents
				% following length changes allow heading on 2nd page of TOC (if any)
    \addtolength{\topmargin}{.25in}	% add to top margin (change starts this page)
    \addtolength{\textheight}{-.5in}	% matching shrink of text area (starts next page)
    \addtolength{\headsep}{-.125in}	% offsetting shrink of space between head and text
					% (gives proper vertical space if 2nd TOC page)
    \setlength{\@colht}{\textheight}	% these 3 settings make the change to 
    \setlength{\@colroom}{\textheight}	% \textheight above apply to this page
    \setlength{\vsize}{\textheight}	% 
    \thispagestyle{plain}		% first page does not use toc page style
    \pagestyle{toc}			% subsequent pages (if any) - types "Page" in upper right
    %\if@twocolumn
	%\@restonecoltrue\onecolumn	% change to one-column and remember to change back later
    %\else
	%\@restonecolfalse		% already one-column
    %\fi
    %\vspace*{.5in}			% disabled - using the margin/textheight/pagestyle stuff above
   %\newlinestretch{.415}		% small line space (not used)
   %\newlinestretch{1.66}		% double space
    \null\vspace{0pt}
   {\centering{\textbf{TABLE OF CONTENTS}}\\}	% title of page
   %\hfill Page\par			% right-aligns "Page"
   \newlinestretch{.83}			% little less than 1 - each chapter entry
					% has extra 12pt vspace first, making those double-spaced
   \@starttoc{toc}			% start the toc
   \addtolength{\textheight}{.5in}	% reset text area (change starts next page)
      \newpage				% go to next page
   \addtolength{\topmargin}{-.625in}	% reset top margin (change starts this page)
   \addtolength{\headsep}{.125in}	% reset header/text separating space
   \if@restonecol\twocolumn\fi		% restore two-column if detected at the start
   \pagestyle{plain}			% reset page style
}% end tableofcontents

\renewcommand*\l@part[2]{		% should not need - don't use parts as major divider
  \ifnum \c@tocdepth >-2\relax
    \addpenalty{-\@highpenalty}%
    \addvspace{1em \@plus\p@}%
    \setlength\@tempdima{3em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      {\leavevmode
       \large \bfseries #1\hfil \hb@xt@\@pnumwidth{\hss #2}}\par
       \nobreak
         \global\@nobreaktrue
         \everypar{\global\@nobreakfalse\everypar{}}%
    \endgroup
  \fi}% end l@part

\renewcommand\@dotsep{1}
\renewcommand*\l@chapter[2]{		% redefine the writing of the chapter line in the toc
   \ifnum \c@tocdepth >\m@ne		% if tocdepth > -1
	\addpenalty{-\@highpenalty}	% prefer a page break before starting entry if needed
	\vskip 1.0em \@plus\p@		% small white space
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
%\renewcommand*\l@section{\@dottedtocline{1}{2em}{2.3em}}% the rest of the l@'s are standard
%\renewcommand*\l@subsection{\@dottedtocline{2}{3.8em}{3.2em}}
%\renewcommand*\l@subsubsection{\@dottedtocline{3}{7.0em}{4.1em}}
\renewcommand*\l@paragraph{\@dottedtocline{4}{10em}{5em}}
\renewcommand*\l@subparagraph{\@dottedtocline{5}{12em}{6em}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% fill
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%\raggedright








%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% List of Tables and List of Figures
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\renewcommand\listoftables{		% redefine list of tables
   % \addtolength{\topmargin}{.75in}	% add to top margin (change starts this page)
    \addtolength{\textheight}{-.5in}	% matching shrink of text area (starts next page)
    \addtolength{\headsep}{-.125in}	% offsetting shrink of space between head and text
					% (gives proper vertical space if 2nd LOT page)
    \setlength{\@colht}{\textheight}	% these 3 settings make the change to 
    \setlength{\@colroom}{\textheight}	% \textheight above apply to this page
    \setlength{\vsize}{\textheight}	% 
    \thispagestyle{plain}		% first page does not use lot page style
    \pagestyle{lot}			% subsequent pages (if any) - types "Page" in upper right
    %\if@twocolumn			% similar to toc
      %\@restonecoltrue\onecolumn
    %\else
      %\@restonecolfalse
    %\fi
    \null\vspace{0pt}			% something above making this line fail so just made this a dummy line
    \newlinestretch{1.66}		% double space
    \null\vspace{0pt}			% skips a line before starting
    {\centering{\textbf{LIST OF TABLES}}\\}	% print title
   \noindent  \hfill \par	% subtitle
   \newlinestretch{1.5}			% small line spacing but each entry
					% adds blank line first - this makes a
					% multi-line entry singlespaced
    \addcontentsline{toc}{chapter}{List of Tables}% add to toc
   \@starttoc{lot}			% complete the list of tables
   \addtolength{\textheight}{.5in}	% reset text area (change starts next page)
      \newpage				% go to next page
   \addtolength{\topmargin}{-.625in}	% reset top margin (change starts this page)
   \addtolength{\headsep}{.125in}	% reset header/text separating space
    \if@restonecol\twocolumn\fi
   \pagestyle{plain}			% reset page style
    }% end listoftables

\renewcommand\listoffigures{		% redefine list of figures
					% similar to toc
\makeatletter
     \renewcommand*\l@figure{\@dottedtocline{1}{1em}{1.7em}}
\makeatother
    \addtolength{\topmargin}{.5in}	% add to top margin (change starts this page)
    \addtolength{\textheight}{-.5in}	% matching shrink of text area (starts next page)
    \addtolength{\headsep}{-.125in}	% offsetting shrink of space between head and text
					% (gives proper vertical space if 2nd LOF page)
    \setlength{\@colht}{\textheight}	% these 3 settings make the change to 
    \setlength{\@colroom}{\textheight}	% \textheight above apply to this page
    \setlength{\vsize}{\textheight}	% 
    \thispagestyle{plain}		% first page does not use lof page style
    \pagestyle{lof}			% subsequent pages (if any) - types "Page" in upper right
    \if@twocolumn			% similar to toc
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi	
   % \vspace*{0pt plus 1fil}		% not used
    \null\vspace{0pt}			% something above making this line fail so just made this a dummy line
    \newlinestretch{1.66}		% double space
    \null\vspace{0pt}			% skips a line before starting
     {\centering{\textbf{LIST OF FIGURES}}\\}	% print title
  \noindent  \hfill \par	% subtitle
   \newlinestretch{1.5}			% small line spacing but each entry
					% adds blank line first - this makes a
					% multi-line entry singlespaced
    \addcontentsline{toc}{chapter}{List of Figures}% add to toc
   \@starttoc{lof}			% complete the list of figures

   \addtolength{\textheight}{.5in}	% reset text area (change starts next page)
      \newpage				% go to next page
   \addtolength{\topmargin}{-.75in}	% reset top margin (change starts this page)
  % \addtolength{\headsep}{.125in}	% reset header/text separating space
    \if@restonecol\twocolumn\fi
   \pagestyle{plain}			% reset page style
    }% end listoffigures


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
{\protect\addvspace{12\p@}}		% add 12pt. vertical space,...    
%{\protect\addvspace{\@thesisptsz} \protect\hangindent=0.25in \protect\hangafter=1}
\addcontentsline{\csname ext@#1\endcsname}{#1}% then add to the list
	{\protect\numberline{{\csname%
  the#1\endcsname}.}#2}			% add #. caption
 \par					% start new paragraph
 \begingroup
  \@parboxrestore			% standard config - restore important defaults
  \@makecaption{\csname fnum@#1\endcsname}{#3}% call the macro to put the caption in the doc
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
\setlength\belowcaptionskip{12\p@}	% define 12pt space below caption
					% accounts for setting caption to singlespaced
					% if longer than one line

\long\def\@makecaption#1#2{		% define the macro that puts the caption in the doc
  \vskip\abovecaptionskip		% space above caption (set to zero above)
    \let\@templinestretch\baselinestretch% save baselinestretch
    \newlinestretch{2}			% double spaced
      \ragged2e{#1.  #2}		% put in caption
    \newlinestretch{\@templinestretch}	% restore line spacing to saved value
  \vskip\belowcaptionskip%		% space below caption (12pt = 1 line)
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
