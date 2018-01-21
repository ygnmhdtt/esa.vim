command! -nargs=+ Esa call PostEsa(<f-args>)

function! PostEsa(title)
  " get category from peco
  let category = system("esayari | peco")
  let category = substitute(category, "\n", "", "g")

  " content
  let text = join(getline(1, '$'), '\n')
  let text = substitute(text, "\\n", "\n", "g")

  " TODO: refactor
  let body = '{"post":{"name":"' . a:title. '","body_md":"'. text . '","category":"' . category . '","wip":false}}'
  let auth = '"Authorization: ' . $ESA_AUTH . '"'
  let cont = '"Content-Type: application/json"'
  let url = "https://api.esa.io/v1/teams/" . $ESA_TEAM . "/posts"
  
  " TODO: refactor
  let curl = 'curl -XPOST -H ' . auth . ' -H ' . cont . " -d '" . body . "' " . url
  let res = system(curl)
  echo res
endfunction

