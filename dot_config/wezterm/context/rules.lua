return {
    {
        name = "Perf Theme (Report + Annotate)",
        matches = function(process, argv)
            return process == "perf" and argv:match("report") or argv:match("annotate")
        end,
        overrides = {
            color_scheme = "Nightfox",
            font_size = 14,
        },
    },
}
