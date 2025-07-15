return {
    {
        name = "Perf Theme (Report + Annotate)",
        matches = function(process, argv)
            local is_perf_command = argv:match("report") or argv:match("annotate")
            return (process == "perf" and is_perf_command)
                or ((process == "sudo" or process == "doas") and argv:match("perf.*(report|annotate)"))
        end,
        overrides = {
            color_scheme = "Nightfox",
            font_size = 14,
        },
    },
}
