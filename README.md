# MWE repo for [#1416](https://github.com/JuliaDocs/Documenter.jl/issues/1416)

From the issue:

I have the following page structure (as an MWE):

```
PAGES = ["Part1" => "index.md",
            "Part2" => ["f1/file1.md", "f1/file2.md"],
			"Part3" => "f2/file1.md"]
```

The problem is, that the Level 2 headings (except those that are in the files in the array) become chapters in the generated pdf.
I think that they shouldn't be chapters, but subsections.
For easier understanding and exploring, I've created this MWE repo.