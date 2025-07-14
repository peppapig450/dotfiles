return {
    {
        name = "Perf Report Theme",
        matches = function(process, argv)
            return (process == "perf" and argv:match("report"))
                or ((process == "sudo" or process == "doas") and argv:match("perf.*report"))
        end,
        overrides = {
            color_scheme = "Nightfox",
            font_size = 14,
        },
    },
}
