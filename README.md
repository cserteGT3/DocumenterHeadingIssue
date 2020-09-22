# MWE repo for [#1416](https://github.com/JuliaDocs/Documenter.jl/issues/1416)

From the issue:

I have the following page structure (as an MWE):

```julia
PAGES = ["Part1" => "index.md",
            "Part2" => ["f1/file1.md", "f1/file2.md"],
            "Part3" => "f2/file1.md"]
```

The problem is, that the Level 2 headings (except those that are in the files in the array) become chapters in the generated pdf.
I think that they shouldn't be chapters, but subsections.
For easier understanding and exploring, I've created this MWE repo.

## Tests with pages in array

```julia
PAGES = ["Part1" => "index.md",
            "Part2" => ["f1/file1.md", "f1/file2.md"],
            "Part3" => "f2/file1.md"]
```

### Documenter.jl@0.25

With the above structure, the latest stable release of Documenter generates the following (headings parsed from the `.tex` file):

```latex
\part{Part1}
\part{Level 1 at Index page}
\chapter{Level 2 at Index page}
\section{Level 3 at Index page}
\subsection{Level 4 at Index page}
\subsubsection{Level 5 at Index page}
\paragraph{Level 6 at Index page}
\part{Part2}
\chapter{Level 1 at f1-File1}
\section{Level 2 at f1-File1}
\subsection{Level 3 at f1-File1}
\subsubsection{Level 4 at f1-File1}
\paragraph{Level 5 at f1-File1}
\subparagraph{Level 6 at f1-File1}
\chapter{Level 1 at f1-File2}
\section{Level 2 at f1-File2}
\subsection{Level 3 at f1-File2}
\subsubsection{Level 4 at f1-File2}
\paragraph{Level 5 at f1-File2}
\subparagraph{Level 6 at f1-File2}
\part{Part3}
\part{Level 1 at f2-File1}
\chapter{Level 2 at f2-File1}
\section{Level 3 at f2-File1}
\subsection{Level 4 at f2-File1}
\subsubsection{Level 5 at f2-File1}
\paragraph{Level 6 at f2-File1}
```

### Documenter.jl with #1417

With the [patch](https://github.com/JuliaDocs/Documenter.jl/pull/1417) applied we get the following:

```latex
\part{Part1}
\chapter{Level 1 at Index page}
\section{Level 2 at Index page}
\subsection{Level 3 at Index page}
\subsubsection{Level 4 at Index page}
\paragraph{Level 5 at Index page}
\subparagraph{Level 6 at Index page}
\part{Part2}
\chapter{Level 1 at f1-File1}
\section{Level 2 at f1-File1}
\subsection{Level 3 at f1-File1}
\subsubsection{Level 4 at f1-File1}
\paragraph{Level 5 at f1-File1}
\subparagraph{Level 6 at f1-File1}
\chapter{Level 1 at f1-File2}
\section{Level 2 at f1-File2}
\subsection{Level 3 at f1-File2}
\subsubsection{Level 4 at f1-File2}
\paragraph{Level 5 at f1-File2}
\subparagraph{Level 6 at f1-File2}
\part{Part3}
\chapter{Level 1 at f2-File1}
\section{Level 2 at f2-File1}
\subsection{Level 3 at f2-File1}
\subsubsection{Level 4 at f2-File1}
\paragraph{Level 5 at f2-File1}
\subparagraph{Level 6 at f2-File1}
```

<!---

## Tests without pages in array

```julia
PAGES = ["Part1" => "index.md",
#            "Part2" => ["f1/file1.md", "f1/file2.md"],
            "Part3" => "f2/file1.md"]
```

### Documenter.jl@0.25

With the above structure, the latest stable release of Documenter generates the following (headings parsed from the `.tex` file):

```latex
\part{Part1}
\chapter{Level 1 at Index page}
\section{Level 2 at Index page}
\subsection{Level 3 at Index page}
\subsubsection{Level 4 at Index page}
\paragraph{Level 5 at Index page}
\subparagraph{Level 6 at Index page}
\part{Part3}
\chapter{Level 1 at f2-File1}
\section{Level 2 at f2-File1}
\subsection{Level 3 at f2-File1}
\subsubsection{Level 4 at f2-File1}
\paragraph{Level 5 at f2-File1}
\subparagraph{Level 6 at f2-File1}
```

### Documenter.jl with #1417

With the [patch](https://github.com/JuliaDocs/Documenter.jl/pull/1417) applied we get the following:

```latex
\part{Part1}
\chapter{Level 1 at Index page}
\section{Level 2 at Index page}
\subsection{Level 3 at Index page}
\subsubsection{Level 4 at Index page}
\paragraph{Level 5 at Index page}
\subparagraph{Level 6 at Index page}
\part{Part3}
\chapter{Level 1 at f2-File1}
\section{Level 2 at f2-File1}
\subsection{Level 3 at f2-File1}
\subsubsection{Level 4 at f2-File1}
\paragraph{Level 5 at f2-File1}
\subparagraph{Level 6 at f2-File1}
```

-->
