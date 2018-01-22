command! -nargs=+ Esa call PostEsa(<f-args>)

function! PostEsa(title)
  " get category from peco
  let category = system("esayari | peco")
  let category = substitute(category, "\n", "", "g")

  " content
  let text = join(getline(1, '$'), '\n')
  let text = substitute(text, "\\n", "\n", "g")

  let url = printf("https://api.esa.io/v1/teams/%s/posts", $ESA_TEAM)
  let body = '{"post": {"name": "' . a:title .'", "body_md": "' . text . '", "category":"' .category. '", "wip": false}}'
  let header = {"Authorization": $ESA_AUTH, "Content-Type": "application/json"}
  let res = Post(url, body, header)
endfunction

function! Post(url, body, header)
  let quote = '"'
  let curl = printf('curl -XPOST %s', a:url)
  for key in keys(a:header)
    let curl .= ' -H ' . quote . key . ': ' . a:header[key] . quote
  endfor
  let curl .= " -d '" . a:body . "'"
  call writefile(split(curl, "\n"), 'aaa.log')
  let res = system(curl)
  return res
endfunction

function! ToJson(input)
    let json = ''
    if type(a:input) == type({})
        let json .= "{"
        let di =  0
        for key in keys(a:input)
            let di += 1
            let json .= '"'.escape(key, '"').'":'
            let json .= ToJson(a:input[key])
            let json .= di<len(a:input)? "," : ""
        endfor
        let json .= "}"
    elseif type(a:input) == type([])
        let json .= "["
        let li = 0
        for e in a:input
            let li += 1
            let json .= ToJson(e)
            if li<len(a:input)
                let json .= ","
            endif
        endfor
        let json .=  "]"

    else
        let json .= '"'.escape(a:input, '"').'"'
    endif
    return json
endfunction
