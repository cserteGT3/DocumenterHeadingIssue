using Documenter

include("c.jl")

makedocs(
    format = Documenter.HTML(),
    sitename = "TestPage",
    pages = PAGES
)
