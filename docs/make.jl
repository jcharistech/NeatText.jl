using NeatText
using Documenter

DocMeta.setdocmeta!(NeatText, :DocTestSetup, :(using NeatText); recursive=true)

makedocs(;
    modules=[NeatText],
    authors="JCharis <jcharistech.com> and contributors",
    repo="https://github.com/jcharistech/NeatText.jl/blob/{commit}{path}#{line}",
    sitename="NeatText.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://jcharistech.github.io/NeatText.jl",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/jcharistech/NeatText.jl",
)
