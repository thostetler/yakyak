fix =
  style:
    fontSize: '18px'
  placeholder: ' ... ... '


module.exports = view (models) ->
  {convsettings} = models

  div ->
    h1 'add new conversation'
    br()
    br()

    p 'find ppl (type to search)'
    input fix, '', onkeyup: (e) ->
      action 'searchentities', e.currentTarget.value, 3
    br()
    br()

    p 'search results (click to select)'
    ul ->
      convsettings.searchedEntities.forEach (r) ->
        onclick = (e) -> action 'selectentity', r
        li {onclick}, JSON.stringify r.properties
    br()
    br()

    p 'selected ppl (click to remove)'
    ul ->
      convsettings.selectedEntities.forEach (r) ->
        onclick = (e) -> action 'deselectentity', r
        li {onclick}, JSON.stringify r.properties
    br()
    br()
    
    div ->
      onclick = -> action 'createconversation'
      button fix, {onclick}, 'create'
