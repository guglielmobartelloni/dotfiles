local ls = require("luasnip") --{{{
local s = ls.s
local i = ls.i
local t = ls.t

local d = ls.dynamic_node
local c = ls.choice_node
local f = ls.function_node
local sn = ls.snippet_node

local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

local snippets, autosnippets = {}, {} --}}}

local group = vim.api.nvim_create_augroup("Lua Snippets", { clear = true })
local file_pattern = "*.lua"

local function cs(trigger, nodes, opts) --{{{
	local snippet = s(trigger, nodes)
	local target_table = snippets

	local pattern = file_pattern
	local keymaps = {}

	if opts ~= nil then
		-- check for custom pattern
		if opts.pattern then
			pattern = opts.pattern
		end

		-- if opts is a string
		if type(opts) == "string" then
			if opts == "auto" then
				target_table = autosnippets
			else
				table.insert(keymaps, { "i", opts })
			end
		end

		-- if opts is a table
		if opts ~= nil and type(opts) == "table" then
			for _, keymap in ipairs(opts) do
				if type(keymap) == "string" then
					table.insert(keymaps, { "i", keymap })
				else
					table.insert(keymaps, keymap)
				end
			end
		end

		-- set autocmd for each keymap
		if opts ~= "auto" then
			for _, keymap in ipairs(keymaps) do
				vim.api.nvim_create_autocmd("BufEnter", {
					pattern = pattern,
					group = group,
					callback = function()
						vim.keymap.set(keymap[1], keymap[2], function()
							ls.snip_expand(snippet)
						end, { noremap = true, silent = true, buffer = true })
					end,
				})
			end
		end
	end

	table.insert(target_table, snippet) -- insert snippet into appropriate table
end --}}}

-- Start Refactoring --



-- cs("begin", fmt([[
-- 	\begin{{{}}}
-- 		{}
-- 	\end{{{}}}
-- ]],{i(1,"banana"),i(2,"contenuto"),rep(1)}))

cs( "mk", fmt([[
        \[
            {}
        \]
    ]],
{ i(1,"") }), "auto") 

cs( "//", fmt([[
        \frac{{{}}}{{{}}}
    ]],
{ i(1,""), i(2,"") }), "auto") 

cs( "sum", fmt([[
        \sum^{{{}}}_{{{}}} 
    ]],
{ i(1,""), i(2,"")}), "auto") 

cs( 
	"limxy",
	fmt(
		[[
        \lim_{{ (x,y) \to ({},{}) }} 
    ]],
		{
            i(1,"0"),
            i(2,"0")
		}
	),
    "auto"
) 

cs( 
	{ trig = "lim([%w_])", regTrig = true, hidden = false },
	fmt(
		[[
        \lim_{{ {} \to {} }} 
    ]],
		{
            d(1, function(_, snip)
                return sn(1, i(1, snip.captures[1]))
            end),
            i(2, [[+\infty]]),
		}
	)
) 

cs( "in", fmt([[
        \in 
    ]],
    {})) 

cs( "intg", fmt([[
	\int_{{{}}}^{{{}}} {{{}}} \: d{} 
    ]],
    {
        i(1,""),
        i(2,""),
        i(3,"f(x)"),
        i(4,"x"),
    }),"auto") 

cs( "defn", fmt([[
        \defn{{{}}}{{{}}}

        ]],
        {
            i(1,""),
            i(2,""),
        }
 ), "auto") 

cs( "bbb", fmt([[
        \textbf{{{}}} 
        ]],
        {
            i(1,""),
        }
 ), "auto") 

cs( "lemma", fmt([[
        \lemma{{{}}}{{{}}}

        ]],
        {
            i(1,""),
            i(2,""),
        }
 ), "auto") 

cs( "propo", fmt([[
        \proposizione{{{}}}{{{}}}

        ]],
        {
            i(1,""),
            i(2,""),
        }
 ), "auto") 

cs( "theo", fmt([[
        \teorema{{{}}}{{{}}}

        ]],
        {
            i(1,""),
            i(2,""),
        }
 ), "auto") 

cs( "sec", fmt([[
        \section{{{}}}

        ]],
        {
            i(1,""),
        }
 ))
 
cs( "subsec", fmt([[
        \subsection{{{}}}

        ]],
        {
            i(1,""),
        }
 ))

cs( "->", fmt([[
        \rightarrow 
        ]],
        {
        }
 ), "auto") 
 
cs( "RR", fmt([[
        \mathbb{{R}}
]],
        {
        }
 ), "auto") 

cs( "NN", fmt([[
        \mathbb{{N}}
        ]],
        {
        }
 ), "auto") 

cs( "CC", fmt([[
        \mathbb{{C}}
        ]],
        {
        }
 ), "auto") 

cs( "ppp", fmt([[
        \forall 
        ]],
        {
        }
 ), "auto") 

cs( "sq", fmt([[
        \sqrt{{{}}}
        ]],
        {
            i(1,""),
        }
 ), "auto") 

cs( 
	{ trig = "([%w_]*)ee", regTrig = true, hidden = false },
    fmt([[
        {}^{{{}}}
        ]],
    {
        d(1, function(_, snip)
            return sn(1, t(snip.captures[1]))
        end),
        i(2,""),
    }
 ), "auto") 

cs( "phi", fmt([[
	\varphi
        ]],
        {
        }
 ), "auto") 

cs( "aaa", fmt([[
	\alpha
        ]],
        {
        }
 ), "auto") 

cs( "BBB", fmt([[
	\beta
        ]],
        {
        }
 ), "auto") 

cs( "lll", fmt([[
	\lambda
        ]],
        {
        }
 ), "auto") 

cs( "$$", fmt([[
	${}$
        ]],
        {
            i(1,""),
        }
 ), "auto") 

cs( [[>=]], fmt([[
	\ge 
        ]],
        {
        }
 ), "auto") 

cs( [[<=]], fmt([[
	\le 
        ]],
        {
        }
 ), "auto") 
 
cs( [[!=]], fmt([[
	\neq 
        ]],
        {
        }
 ), "auto") 

cs( 
	{ trig = "([%w_]+)sss", regTrig = true, hidden = false },
    fmt([[
        \bar{{{}}} 
        ]],
    {
        d(1, function(_, snip)
            return sn(1, t(snip.captures[1]))
        end),
    }
 ), "auto") 

cs( "dimo", fmt([[
	\begin{{proof}}
        {}    
	\end{{proof}}


        ]],
        {
            i(1,""),
        }
 ))

cs( "enum", fmt([[
	\begin{{enumerate}}
		\item {}
	\end{{enumerate}}


        ]],
        {
            i(1,""),
        }
 ), "auto")

cs( "itemi", fmt([[
	\begin{{itemize}}
		\item {}
	\end{{itemize}}


        ]],
        {
            i(1,""),
        }
 ), "auto")

cs( "plot", fmt([[
	\begin{{tikzpicture}}
	\begin{{axis}}[
		xmin = {}, xmax = {},
		ymin = {}, ymax = {}]
		\addplot[
			domain = {}:{},
			samples = 200,
			smooth,
			thick,
			blue,
		] {{{}}};
	\end{{axis}}
	\end{{tikzpicture}}


        ]],
        {
            i(1,"xmin"),
            i(2,"xmax"),
            i(3,"ymin"),
            i(4,"ymax"),
            rep(1),
            rep(2),
            i(5,"equazione"),
        }
 ), "auto")
 
cs( "siss", fmt([[
	\begin{{equation}}
		\begin{{cases}}
            {}\\
            {}
		\end{{cases}}\,.
	\end{{equation}}

        ]],
        {
            i(1,""),
            i(2,""),
        }
 ), "auto")
 
 
cs( "[]", fmt([[
	\Eval{{[{}]}}{{{}}}{{{}}} 
        ]],
        {
            i(1,"dentro"),
            i(2,"a"),
            i(3,"b"),
        }
 ), "auto")
 
cs( "==", fmt([[
      	\overset{{\text{{{}}}}}{{=}}
  ]],
        {
            i(1,"spiega"),
        }
 ), "auto")

cs( "pm", fmt([[
      	\pm 
  ]],
        {
        }
 ), "auto")

cs( "se e solo", fmt([[
  	\Leftrightarrow 
    ]],
        {
        }
 ), "auto")

 cs([[\\]], fmt([[
 \cancel{{{}}}
 ]],{
     f(function(_, snip)
         -- TM_SELECTED_TEXT is a table to account for multiline-selections.
         -- In this case only the first line is inserted.
         return snip.env.TM_SELECTED_TEXT[1] or {}
     end, {}),
 }),"auto")

 cs([[--]], fmt([[
\underbrace{{{}}}_\text{{{}}}
 ]],{
     f(function(_, snip)
         -- TM_SELECTED_TEXT is a table to account for multiline-selections.
         -- In this case only the first line is inserted.
         return snip.env.TM_SELECTED_TEXT[1] or {}
     end, {}),
     i(1,"commento")
 }),"auto")

 cs( 
	{ trig = "([%a_]+)([%d_])", regTrig = true, hidden = false },
	fmt(
		[[
        {}_{}
    ]],
		{
            d(1, function(_, snip)
                return sn(1, t(snip.captures[1]))
            end),
            d(2, function(_, snip)
                return sn(1, t(snip.captures[2]))
            end),
		}
	), "auto") 

 cs( 
	{ trig = "([%w^{}]+)/", regTrig = true, hidden = false },
	fmt(
		[[
        \frac{{{}}}{{{}}}
    ]],
		{
            d(1, function(_, snip)
                return sn(1, t(snip.captures[1]))
            end),
            i(2),
		}
	), "auto") 

cs( "mtx", fmt([[
\begin{{pmatrix}}
{} & {} & {}\\
{} & {} & {}
\end{{pmatrix}}
  ]],
        {
            i(1,""),
            i(2,""),
            i(3,""),
            i(4,""),
            i(5,""),
            i(6,""),
        }
 ), "auto")

cs( "scsc", fmt([[\bullet]], {}), "auto")

cs( "<>", fmt([[\langle {} \rangle]],
        {
            i(1,""),
        }
 ), "auto")

cs( "xi", fmt([[x_i]],
        {
        }
 ), "auto")

cs( "xn", fmt([[x_n]],
        {
        }
 ), "auto")

cs( "RN", fmt([[
        \mathbb{{R}}^{{n}}
        ]],
        {
        }
 ), "auto") 

cs( "{{}}", fmt([[
\{{{}\}}
        ]],
        {
            i(1)
        }
 ), "auto") 


cs( "cont", fmt([[
\subseteq
        ]],
        {
        }
 ), "") 
 
cs( "ttt", fmt([[
\theta
        ]],
        {
        }
 ), "auto") 

cs( "rrr", fmt([[
\rho
        ]],
        {
        }
 ), "auto") 

cs( "epsi", fmt([[
\varepsilon
        ]],
        {
        }
 ), "") 

cs( "delta", fmt([[
\delta
        ]],
        {
        }
 ), "") 

cs( "sot", fmt([[
\subset
        ]],
        {
        }
 ), "") 

cs( "fxy", fmt([[
f(x,y)
        ]],
        {
        }
 ), "auto") 

cs( "ccc", fmt([[
\begin{{cases}}
    {} & \text{{se ${}$}} \\
    {} & \text{{se ${}$}}
\end{{cases}}
        ]],
        {
            i(1),
            i(2),
            i(3),
            i(4),
        }
 ), "auto") 
 

cs( "ex", fmt([[
\exists
        ]],
        {
        }
 ), "auto") 
 

-- End Refactoring --

return snippets, autosnippets
