using Documenter, DocumenterLaTeX

include("c.jl")

makedocs(
    format = LaTeX(platform="docker"),
    sitename = "TestPage",
	build = "pdfbuild",
    pages = PAGES
)
