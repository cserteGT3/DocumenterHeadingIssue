DOCUMENT_STRUCTURE = (
    "part",
    "chapter",
    "section",
    "subsection",
    "subsubsection",
    "paragraph",
    "subparagraph",
)

function parsefile(filename)
    lines = readlines(filename, keep=true)
    io = IOBuffer()
    for line in lines
        for ds in DOCUMENT_STRUCTURE
            if occursin(ds, line)
                write(io, line)
                break
            end
        end
    end
    return String(take!(io))
end

function stripheadings(fin, fout)
    hs = parsefile(fin)
    open(fout, "w") do io
        write(io, hs)
    end
end
