using Documenter, DocumenterLaTeX

include("c.jl")

makedocs(
    format = LaTeX(platform="none"),
    sitename = "TestPage",
	build = "pdfbuild",
    pages = PAGES
)
