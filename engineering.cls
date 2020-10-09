% -------------------------------------------------------------------
% TEMPLATE DE LISTA DE EXERCICIOS
% AUTOR: Álvaro "Gondolindrim" Volpato (alvaro.volpato@usp.br)
% REPOSITORIO: http://github.com/Gondolindrim/sel0309_template
% LICENSA: MIT
%--------------------------------------------------------------------

% Este arquivo é um arquivo de classe para documentos em LaTeX, criado para ser relativamente simples com cabeçalho e algumas informações como nome do professor e da disciplina, nome da instituição de ensino.

% Este arquivo foi escrito em editor vim e contém caracteres para dobras de código (os "{ { {"). Para poder visualizar essas dobras, utilize no vim:
% :setfoldmethod=marker

% COMO USAR ESTE TEMPLATE
% Logo no começo do arquivo, utilizar esta classe com o comando:
% \documentclass{engineering}

% Em seguida, defina o nome da disciplina, nome do professor e da instituição:
% \courseName{<nome da disciplina>}
% \profName{<nome do professor>}
% \institution{<nome da instituição>}

% Em seguida, insira \begin{document} para começar o corpo do documento e logo abaixo /printHeader para exibir o título da lista e a logo da instituição

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{engineering}[08/10/2020 exercises for engineering class template]

\LoadClass[
	11pt,				% Font size
	twoside,			% Printing setting as double-sided document
	a4paper,			% Paper size
	brazil				% Language
	]{article}

% PACKAGE ADDITIONS {{{1
\usepackage[T1]{fontenc}
\usepackage[utf8]{inputenc}
\usepackage{cancel}
\usepackage{extract}
\usepackage{fancyhdr}
\usepackage{amsmath}
\usepackage{mathtools}
\usepackage{amsfonts}
\usepackage{amssymb}
\usepackage{graphicx}
\graphicspath{{images/}}
\usepackage{wrapfig}
\usepackage[hmargin=2cm,vmargin=2.5cm]{geometry}
\usepackage{multirow}
\usepackage{wrapfig}
\usepackage{epsfig}
\usepackage{framed}
\usepackage{textcomp}
\usepackage{color}
\usepackage{booktabs}
\usepackage{pdflscape}
\usepackage{datetime}
\usepackage[usenames,dvipsnames]{pstricks}
\definecolor{darkblue}{RGB}{47,68,117}
\definecolor{lightgray}{gray}{0.95}
\usepackage{times}      % Loads the Times-Roman Fonts
\usepackage{mathptmx}   % Loads the Times-Roman Math Fonts

% DEFINICOES BASICAS COMO NOME DA DISCIPLINA, NOME DO PROFESSOR E INSTITUICAO {{{1
\newcommand{\theCourseName}{ABC1234 - Physics for dummies}
\newcommand{\courseName}[1]{\renewcommand\theCourseName{#1}}
\newcommand{\theProfName}{Prof. Miss Piggy}
\newcommand{\profName}[1]{\renewcommand\theProfName{#1}}
\newcommand{\theInstitution}{Sesame Street}
\newcommand{\institution}[1]{\renewcommand\theInstitution{#1}}

% CONFIGURING PAGE STYLE {{{1

\pagestyle{fancy}
\setlength\parindent{0in}
\setlength\parskip{0.1in}
\setlength\headheight{15pt}

\rhead{\theCourseName}
\lhead{\textsc{\theProfName}}
\rfoot{\textsc{\thepage}}
\cfoot{}
\lfoot{\textsc{\theInstitution}}

% Inserir a logo da instituição
\newcommand{\printunivlogo}{%
  \noindent % University Logo
  \begin{wrapfigure}{r}{0.1\textwidth}
    \vspace{-20pt}
    \begin{center}
      \includegraphics[width=0.1\textwidth]{logo.pdf}
    \end{center}
    \vspace{-100pt}
  \end{wrapfigure}
}

% SECTION, SUBSECTION AND PARAGRAPH SETUP {{{1

\usepackage{fancybox}
\usepackage[explicit]{titlesec}
\titleformat{\section}
  {\color{black}\large\sffamily\bfseries}
  {\shadowbox{Exercício\ \thesection}}
  {0.5em}
  {#1}
  []
\titleformat{name=\section,numberless}
  {\color{black}\large\sffamily\bfseries}
  {}
  {0em}
  {#1}
  []  
\titleformat{\subsection}
  {\sffamily\bfseries}
  {\thesubsection}
  {0.5em}
  {#1}
  []
\titleformat{\subsubsection}
  {\sffamily\small\bfseries\itshape}
  {\thesubsubsection}
  {0.5em}
  {#1}
  []    
\titleformat{\paragraph}[runin]
  {\sffamily\small\bfseries}
  {}
  {0em}
  {#1} 
\titlespacing*{\section}{0pc}{3ex \@plus4pt \@minus3pt}{5pt}
\titlespacing*{\subsection}{0pc}{2.5ex \@plus3pt \@minus2pt}{0pt}
\titlespacing*{\subsubsection}{0pc}{2ex \@plus2.5pt \@minus1.5pt}{0pt}
\titlespacing*{\paragraph}{0pc}{1.5ex \@plus2pt \@minus1pt}{10pt}

\usepackage[labelfont={bf,sf,footnotesize},%
                labelsep=period,%
                justification=raggedright]{caption}

% ALGUMAS DEFINICOES PERSONALIZADAS {{{1

% xfrac is a personalized fraction that allows the user to specify how much vertical spacing you want for both numerator and denominator. This allows for prettyer fractions when the components are big like integrals, square roots or other fractions
\newcommand{\xfrac}[4]{\genfrac{}{}{}{}{\raisebox{#1}{$#3$}}{\raisebox{-#2}{$#4$} }}

% the printHeader command prints the institution logo with a bold and big title
\newcommand{\printHeader}{
\printunivlogo

{\Huge\thetitle}\\[5mm]}

% Define um environment \begin...\end{solution}. Este ambiente serve para inserir a solução do problema, de forma que esta solução seja retirada do documento final se o comando \excludecomment{solution} é declarado no cabeçalho do documento. Isto serve para que num único documento se possa produzir uma lista com a solução para o monitor/professor ao mesmo tempo que se também possa produzir uma lista de exercicios a ser distribuída aos alunos.
\usepackage{comment}
\specialcomment{solution}{\textbf{Solução: }}{}
