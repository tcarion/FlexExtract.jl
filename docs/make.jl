using FlexExtract
using Documenter

DocMeta.setdocmeta!(FlexExtract, :DocTestSetup, :(using FlexExtract); recursive=true)

makedocs(;
    modules=[FlexExtract],
    authors="Tristan Carion <tristancarion@gmail.com> and contributors",
    repo="https://github.com/tcarion/FlexExtract.jl/blob/{commit}{path}#{line}",
    sitename="FlexExtract.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://tcarion.github.io/FlexExtract.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/tcarion/FlexExtract.jl",
    devbranch="main",
)
