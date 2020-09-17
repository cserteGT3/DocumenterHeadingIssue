# MWE repo for [#1416](https://github.com/JuliaDocs/Documenter.jl/issues/1416)

From the issue:

I have the following page structure (as an MWE):
```
pages = ["Home" => "index.md",
        "f1" => ["f1/file1.md", "f1/file2.md"],
        "f2F1" => "f2/file1.md"]
```
The problem is, that the Level 2 headings (except those that are in the files in the array) become chapters in the generated pdf.
I think that they shouldn't be chapters, but subsections.
For easier understanding and exploring, I've created this MWE repo.