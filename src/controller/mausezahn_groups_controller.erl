-module(mausezahn_groups_controller, [Req]).
-compile(export_all).

index('GET', []) ->
  Groups = boss_db:find(kita_group, []),
  {json, [{groups, Groups}]}.

create('POST', []) ->
  Name = Req:post_param("name"),
  Description = Req:post_param("description"),
  NewGroup = kita_group:new(id, Name, Description),
  {Status, SavedGroup} = NewGroup:save(),
  {json, [{status, Status}]}. 

show('GET', [Id]) ->
  Group = boss_db:find(kita_group, [{id, 'equals', Id}]),
  {json, [{group, Group}]}.


