module StoriesHelper
  def options_for_effort_select()
    options_for_select([["Faible",1],["Normale",2],["Important",3]])
  end
  def options_for_category_select
    options_for_select([["Draft","draft"],["Bug","bug"],["Feature","feature"]])
  end
end
